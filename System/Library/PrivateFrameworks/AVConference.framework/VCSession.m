@implementation VCSession

- (VCSession)initWithIDSDestination:(id)a3 configurationDict:(id)a4 negotiationData:(id)a5 delegate:(id)a6 processId:(int)a7 isGKVoiceChat:(BOOL)a8
{
  uint64_t v8;
  const char *v13;
  char *v14;
  os_log_t *v15;
  uint64_t v16;
  NSObject *v17;
  VCSession *v18;
  VCSession *v19;
  NSObject *CustomRootQueue;
  NSObject *v21;
  VCSessionConfiguration *v22;
  VCSessionParticipantConfig *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  _BOOL4 v27;
  _BOOL4 v28;
  VCSessionParticipantLocal *v29;
  uint64_t v30;
  NSObject *v31;
  const __CFString *v32;
  const __CFString *v33;
  _BOOL4 v34;
  int *v35;
  VCSessionStatsController *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id reportingAgent;
  uint64_t transportSessionID;
  uint64_t v42;
  __CFString *v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  NSObject *v56;
  const __CFString *v57;
  char *v58;
  os_log_t *v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  VCSessionParticipantLocal *localParticipant;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  VCSessionParticipantLocal *v69;
  char *v70;
  os_log_t *v71;
  uint64_t v72;
  NSObject *v73;
  _BOOL4 v74;
  VCConnectionManager *v75;
  uint64_t v77;
  id v78;
  uint64_t v79;
  unsigned int v80;
  _BOOL4 oneToOneModeEnabled;
  unsigned int v83;
  id v85;
  char *__str[2];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  __int16 v95;
  objc_super v96;
  char *__lasts;
  uint8_t buf[80];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;

  v8 = a8;
  v103 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str[0] = 0;
    v13 = a4 ? (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String") : "<nil>";
    asprintf(__str, "%s", v13);
    if (__str[0])
    {
      v78 = a4;
      v80 = v8;
      __lasts = 0;
      v14 = strtok_r(__str[0], "\n", &__lasts);
      v15 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *v15;
          if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processI"
                                  "d:isGKVoiceChat:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 185;
            *(_WORD *)&buf[28] = 2080;
            *(_QWORD *)&buf[30] = "";
            *(_WORD *)&buf[38] = 2080;
            *(_QWORD *)&buf[40] = v14;
            _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v14 = strtok_r(0, "\n", &__lasts);
      }
      while (v14);
      free(__str[0]);
      v8 = v80;
      a4 = v78;
    }
  }
  v96.receiver = self;
  v96.super_class = (Class)VCSession;
  v18 = -[VCObject init](&v96, sel_init);
  v19 = v18;
  if (v18)
  {
    if (a3)
    {
      v18->_isGKVoiceChat = v8;
      +[VCServerBag pullStoreBagKeys](VCServerBag, "pullStoreBagKeys");
      objc_storeWeak((id *)&v19->_delegate, a6);
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      v19->_sessionQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSession.sessionQueue", 0, CustomRootQueue);
      v19->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSession.notificationQueue", 0, CustomRootQueue);
      v19->_state = 0;
      v21 = dispatch_semaphore_create(0);
      v19->_stopCompletedSemaphore = (OS_dispatch_semaphore *)v21;
      dispatch_semaphore_signal(v21);
      v19->_uuid = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
      v19->_idsDestination = (NSString *)objc_msgSend(a3, "copy");
      v19->_switchFromGFTToOneToOneEnabled = _os_feature_enabled_impl();
      v22 = -[VCSessionConfiguration initWithClientDictionary:]([VCSessionConfiguration alloc], "initWithClientDictionary:", a4);
      v19->_configuration = v22;
      -[VCSessionConfiguration setIsGKVoiceChat:](v22, "setIsGKVoiceChat:", v8);
      v19->_siriSpatialAudioSourceID = VCUniqueIDGenerator_GenerateID();
      +[VCVTPWrapper startVTP](VCVTPWrapper, "startVTP");
      reportingGetDefaults();
      v95 = -21846;
      LOBYTE(v95) = -[VCSessionConfiguration isOneToOneAuthenticationTagEnabled](v19->_configuration, "isOneToOneAuthenticationTagEnabled");
      HIBYTE(v95) = -[VCSessionConfiguration isGftTLEEnabled](v19->_configuration, "isGftTLEEnabled");
      v19->_securityKeyManager = -[VCSecurityKeyManager initWithDelegate:options:]([VCSecurityKeyManager alloc], "initWithDelegate:options:", v19, &v95);
      v19->_mediaTypeToSpatialMetadataEntryMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v19->_isEnhancedJBAdaptationsEnabled = +[VCSession isEnhancedJBAdaptationsEnabled](VCSession, "isEnhancedJBAdaptationsEnabled");
      v19->_isServerPacketRetransmissionForVideoEnabled = +[VCSession isServerPacketRetransmissionEnabledForVideo](VCSession, "isServerPacketRetransmissionEnabledForVideo");
      v19->_isUplinkRetransmissionForVideoEnabled = +[VCSession isUplinkRetransmissionEnabledForVideo](VCSession, "isUplinkRetransmissionEnabledForVideo");
      v19->_shouldCreateSecondAggregator = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-server-should-use-second-aggregator"), CFSTR("createSecondAggregatorForU1"), MEMORY[0x1E0C9AAB0], 0), "BOOLValue");
      v19->_abSwitches = -[VCSessionSwitches initWithConversationID:]([VCSessionSwitches alloc], "initWithConversationID:", -[VCSessionConfiguration conversationID](v19->_configuration, "conversationID"));
      v23 = objc_alloc_init(VCSessionParticipantConfig);
      -[VCSessionParticipantConfig setIdsDestination:](v23, "setIdsDestination:", a3);
      -[VCSessionParticipantConfig setParticipantData:](v23, "setParticipantData:", a5);
      -[VCSessionParticipantConfig setProcessId:](v23, "setProcessId:", a7);
      -[VCSessionParticipantConfig setSessionUUID:](v23, "setSessionUUID:", v19->_uuid);
      -[VCSessionParticipantConfig setIsGKVoiceChat:](v23, "setIsGKVoiceChat:", v19->_isGKVoiceChat);
      -[VCSessionParticipantConfig setIsLowLatencyAudio:](v23, "setIsLowLatencyAudio:", +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8);
      -[VCSessionParticipantConfig setSessionMode:](v23, "setSessionMode:", -[VCSessionConfiguration sessionMode](v19->_configuration, "sessionMode"));
      -[VCSessionParticipantConfig setIsOneToOneModeEnabled:](v23, "setIsOneToOneModeEnabled:", -[VCSessionConfiguration isOneToOneModeEnabled](v19->_configuration, "isOneToOneModeEnabled"));
      v19->_oneToOneModeEnabled = -[VCSessionConfiguration isOneToOneModeEnabled](v19->_configuration, "isOneToOneModeEnabled");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          oneToOneModeEnabled = v19->_oneToOneModeEnabled;
          v79 = -[VCSessionConfiguration sessionMode](v19->_configuration, "sessionMode");
          v85 = a3;
          v26 = -[VCSessionConfiguration serviceName](v19->_configuration, "serviceName");
          v27 = -[VCSessionConfiguration isOneToOneAuthenticationTagEnabled](v19->_configuration, "isOneToOneAuthenticationTagEnabled");
          v28 = -[VCSessionConfiguration isGftTLEEnabled](v19->_configuration, "isGftTLEEnabled");
          *(_DWORD *)buf = 136316930;
          *(_QWORD *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 243;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = oneToOneModeEnabled;
          *(_WORD *)&buf[34] = 2048;
          *(_QWORD *)&buf[36] = v79;
          *(_WORD *)&buf[44] = 2112;
          *(_QWORD *)&buf[46] = v26;
          a3 = v85;
          *(_WORD *)&buf[54] = 1024;
          *(_DWORD *)&buf[56] = v27;
          *(_WORD *)&buf[60] = 1024;
          *(_DWORD *)&buf[62] = v28;
          _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Using the following path - oneToOneModeEnabled=%d sessionMode=%ld serviceName=%@, oneToOneAuthenticationTagEnabled=%d, gftTLEEnabled=%d", buf, 0x42u);
        }
      }
      -[VCSessionParticipantConfig setSpatialMetadata:](v23, "setSpatialMetadata:", v19->_spatialMetadata);
      -[VCSessionParticipantConfig setSpatialMetadataEntryMap:](v23, "setSpatialMetadataEntryMap:", v19->_mediaTypeToSpatialMetadataEntryMap);
      -[VCSessionParticipantConfig setSecurityKeyManager:](v23, "setSecurityKeyManager:", v19->_securityKeyManager);
      -[VCSessionParticipantConfig setIsUplinkRetransmissionEnabled:](v23, "setIsUplinkRetransmissionEnabled:", v19->_isUplinkRetransmissionForVideoEnabled);
      -[VCSessionParticipantConfig setOneToOneAuthenticationTagEnabled:](v23, "setOneToOneAuthenticationTagEnabled:", -[VCSessionConfiguration isOneToOneAuthenticationTagEnabled](v19->_configuration, "isOneToOneAuthenticationTagEnabled"));
      -[VCSessionParticipantConfig setIsHigherAudioREDCutoverU1Enabled:](v23, "setIsHigherAudioREDCutoverU1Enabled:", -[VCSessionSwitches isFeatureEnabled:](v19->_abSwitches, "isFeatureEnabled:", 32));
      v29 = -[VCSessionParticipantLocal initWithConfig:delegate:]([VCSessionParticipantLocal alloc], "initWithConfig:delegate:", v23, v19);
      v19->_localParticipant = v29;
      if (!v29)
      {
        if ((VCSession *)objc_opt_class() == v19)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:].cold.2();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v33 = (const __CFString *)-[VCSession performSelector:](v19, "performSelector:", sel_logPrefix);
          else
            v33 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v55 = VRTraceErrorLogLevelToCSTR();
            v56 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = v55;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:proces"
                                    "sId:isGKVoiceChat:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 257;
              *(_WORD *)&buf[28] = 2112;
              *(_QWORD *)&buf[30] = v33;
              *(_WORD *)&buf[38] = 2048;
              *(_QWORD *)&buf[40] = v19;
              _os_log_error_impl(&dword_1D8A54000, v56, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) Unable to initialize the session's local participant!", buf, 0x30u);
            }
          }
        }

        goto LABEL_71;
      }

      v19->_conversationID = (NSString *)-[NSString copy](-[NSUUID UUIDString](-[VCSessionConfiguration conversationID](v19->_configuration, "conversationID"), "UUIDString"), "copy");
      v19->_conversationTimeBase = (NSDate *)-[NSDate copy](-[VCSessionConfiguration conversationTimeBase](v19->_configuration, "conversationTimeBase"), "copy");
      v19->_conversationTimeBaseTruncated = (NSDate *)-[NSDate copy](-[VCSessionConfiguration conversationTimeBaseTruncated](v19->_configuration, "conversationTimeBaseTruncated"), "copy");
      -[VCSession setParentNWActivity:](v19, "setParentNWActivity:", -[VCSessionConfiguration parentNWActivity](v19->_configuration, "parentNWActivity"));
      v19->_nwActivity = (OS_nw_activity *)nw_activity_create();
      if (v19->_parentNWActivity)
        nw_activity_set_parent_activity();
      nw_activity_activate();
      v19->_transportSessionID = -[VCSessionParticipant participantVideoToken](v19->_localParticipant, "participantVideoToken");
      if (-[VCDefaults forceDisableReporting](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableReporting"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v30;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processI"
                                  "d:isGKVoiceChat:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 287;
            _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Reporting agent is disabled through default.", buf, 0x1Cu);
          }
        }
      }
      else
      {
        v102 = 0;
        v100 = 0u;
        v101 = 0u;
        v99 = 0u;
        memset(buf, 0, sizeof(buf));
        -[VCSession setReportingConfig:](v19, "setReportingConfig:", buf);
        v92 = v100;
        v93 = v101;
        v94 = v102;
        v88 = *(_OWORD *)&buf[32];
        v89 = *(_OWORD *)&buf[48];
        v90 = *(_OWORD *)&buf[64];
        v91 = v99;
        *(_OWORD *)__str = *(_OWORD *)buf;
        v87 = *(_OWORD *)&buf[16];
        v19->super._reportingAgent = (id)reportingCreateAgent();
        v19->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
        -[VCSession registerQoSReporting](v19, "registerQoSReporting");
        if (-[VCSessionConfiguration isOneToOneModeEnabled](v19->_configuration, "isOneToOneModeEnabled"))
          -[VCSession setupOneToOneAdaptiveLearning](v19, "setupOneToOneAdaptiveLearning");
        -[VCSession dumpVCSessionMetadataToDataStore](v19, "dumpVCSessionMetadataToDataStore");
      }
      -[VCSecurityKeyManager setReportingAgent:](v19->_securityKeyManager, "setReportingAgent:", v19->super._reportingAgent);
      v19->_captionsCoordinator = -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]([VCAudioCaptionsCoordinator alloc], "initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:", v19->_oneToOneModeEnabled, 0, CFSTR("facetimecaptions"), v19->super._reportingAgent);
      if (VCFeatureFlagManager_CallRecordingEnabled())
        -[VCSessionParticipant setCaptionsCoordinator:](v19->_localParticipant, "setCaptionsCoordinator:", v19->_captionsCoordinator);
      -[VCSessionParticipantLocal setUpCaptions](v19->_localParticipant, "setUpCaptions");
      v19->_mediaRecorder = -[VCMediaRecorder initWithStreamToken:delegate:reportingAgent:]([VCMediaRecorder alloc], "initWithStreamToken:delegate:reportingAgent:", v19->_transportSessionID, v19, -[VCObject reportingAgent](v19, "reportingAgent"));
      -[VCMediaRecorderManager registerMediaRecorder:withStreamToken:](+[VCMediaRecorderManager sharedInstance](VCMediaRecorderManager, "sharedInstance"), "registerMediaRecorder:withStreamToken:", v19->_mediaRecorder, v19->_transportSessionID);
      -[VCSessionParticipant setMediaRecorder:](v19->_localParticipant, "setMediaRecorder:", v19->_mediaRecorder);
      -[VCSession setupSpatialAudio](v19, "setupSpatialAudio");
      -[VCSession createSessionMessaging](v19, "createSessionMessaging");
      -[VCSessionParticipant setReportingAgent:](v19->_localParticipant, "setReportingAgent:", v19->super._reportingAgent);
      v19->_bitrateArbiter = objc_alloc_init(VCSessionBitrateArbiter);
      -[VCSession setupUplinkBitrateCaps](v19, "setupUplinkBitrateCaps");
      -[VCSessionParticipant setStreamDelegate:](v19->_localParticipant, "setStreamDelegate:", v19);
      v19->_remoteParticipantsMapByUUID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v19->_remoteParticipantsMapByServerID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v19->_startingParticipants = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19->_stoppingParticipants = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v19->_initializingParticipants = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19->_useReducedSizeRTCP = 1;
      v19->_sessionStartTime = NAN;
      if (!v19->_oneToOneModeEnabled)
        v19->_downlinkBandwidthAllocator = -[VCSessionDownlinkBandwidthAllocator initWithReportingAgent:]([VCSessionDownlinkBandwidthAllocator alloc], "initWithReportingAgent:", v19->super._reportingAgent);
      v19->_presentationInfo = objc_alloc_init(VCSessionPresentationInfo);
      if (!-[VCDefaults forceDisableMediaQueue](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableMediaQueue"))-[VCSession createMediaQueue](v19, "createMediaQueue");
      -[VCSession setupTransportSessionWithDestination:](v19, "setupTransportSessionWithDestination:", a3);
      -[VCSession setupRateControllersMultiway](v19, "setupRateControllersMultiway");
      -[VCSession setupOneToOne](v19, "setupOneToOne");
      -[VCSession reportLocalRateControlExperimentConfiguration](v19, "reportLocalRateControlExperimentConfiguration");
      v34 = -[VCSessionConfiguration isOneToOneModeEnabled](v19->_configuration, "isOneToOneModeEnabled");
      v35 = &OBJC_IVAR___VCSession__oneToOneSettings;
      if (!v34)
        v35 = &OBJC_IVAR___VCSession__downlinkRateController;
      -[VCConnectionManager setStatisticsCollector:](-[VCTransportSession connectionManager](v19->_transportSession, "connectionManager"), "setStatisticsCollector:", objc_msgSend(*(id *)((char *)&v19->super.super.isa + *v35), "statisticsCollector"));
      -[VCSession setSessionInfoSynchronizerCallbacks](v19, "setSessionInfoSynchronizerCallbacks");
      v36 = [VCSessionStatsController alloc];
      v37 = -[VCTransportSession connectionManager](v19->_transportSession, "connectionManager");
      v38 = -[AVCRateController statisticsCollector](v19->_uplinkRateController, "statisticsCollector");
      v39 = -[AVCRateController statisticsCollector](v19->_downlinkRateController, "statisticsCollector");
      reportingAgent = v19->super._reportingAgent;
      transportSessionID = v19->_transportSessionID;
      LOWORD(v77) = -[VCSessionParticipantLocal connectionStatsStreamID](v19->_localParticipant, "connectionStatsStreamID");
      v19->_sessionStatsController = -[VCSessionStatsController initWithDelegate:connectionManager:uplinkStatsCollector:downlinkStatsCollector:reportingAgent:transportSessionID:streamID:mediaQueue:](v36, "initWithDelegate:connectionManager:uplinkStatsCollector:downlinkStatsCollector:reportingAgent:transportSessionID:streamID:mediaQueue:", v19, v37, v38, v39, reportingAgent, transportSessionID, v77, v19->_mediaQueue);
      -[VCSessionParticipantLocal setCellularUniqueTag:](v19->_localParticipant, "setCellularUniqueTag:", -[VCTransportSession basebandNotificationRegistrationToken](v19->_transportSession, "basebandNotificationRegistrationToken"));
      v19->_switchManager = objc_alloc_init(VCSwitchManager);
      if (!v19->_oneToOneModeEnabled)
      {
        -[VCSession reportingSetUserInfo](v19, "reportingSetUserInfo");
        -[VCSession setupMultiwayABTesting](v19, "setupMultiwayABTesting");
      }
      reportingRegisterSystemStats();
      reportingSymptomSetCallback();
      v42 = +[VCSession deviceRoleForSessionMode:](VCSession, "deviceRoleForSessionMode:", -[VCSessionConfiguration sessionMode](v19->_configuration, "sessionMode"));
      if (v19->_oneToOneModeEnabled
        || -[VCSessionParticipant configureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:](v19->_localParticipant, "configureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:", v42, 0, 0, 6))
      {
        v19->_currentConnectionType = -1;
        v19->_feedbackController = -[VCNetworkFeedbackController initWithDelegate:connectionManager:]([VCNetworkFeedbackController alloc], "initWithDelegate:connectionManager:", v19, -[VCTransportSession connectionManager](v19->_transportSession, "connectionManager"));
        -[VCNetworkFeedbackController setDownlinkTargetCellBitrateCap:](v19->_feedbackController, "setDownlinkTargetCellBitrateCap:", -[VCSessionBitrateArbiter maxBitrateExpensiveDownlink](v19->_bitrateArbiter, "maxBitrateExpensiveDownlink"));
        v19->_forceDisableMediaPriority = -[VCDefaults forceDisableMediaPriority](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableMediaPriority");
        if ((VCSession *)objc_opt_class() == v19)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 6)
            goto LABEL_98;
          __str[0] = 0;
          v46 = -[VCSession description](v19, "description")
              ? -[NSString UTF8String](-[NSString description](-[VCSession description](v19, "description"), "description"), "UTF8String"): "<nil>";
          asprintf(__str, "Session init %s", v46);
          if (!__str[0])
            goto LABEL_98;
          v83 = v42;
          __lasts = 0;
          v70 = strtok_r(__str[0], "\n", &__lasts);
          v71 = (os_log_t *)MEMORY[0x1E0CF2758];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v72 = VRTraceErrorLogLevelToCSTR();
              v73 = *v71;
              if (os_log_type_enabled(*v71, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = v72;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:proc"
                                      "essId:isGKVoiceChat:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 372;
                *(_WORD *)&buf[28] = 2080;
                *(_QWORD *)&buf[30] = "";
                *(_WORD *)&buf[38] = 2080;
                *(_QWORD *)&buf[40] = v70;
                _os_log_impl(&dword_1D8A54000, v73, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v70 = strtok_r(0, "\n", &__lasts);
          }
          while (v70);
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v43 = (__CFString *)-[VCSession performSelector:](v19, "performSelector:", sel_logPrefix);
          else
            v43 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 6)
            goto LABEL_98;
          __str[0] = 0;
          v53 = (const char *)-[__CFString UTF8String](v43, "UTF8String");
          v54 = -[VCSession description](v19, "description")
              ? -[NSString UTF8String](-[NSString description](-[VCSession description](v19, "description"), "description"), "UTF8String"): "<nil>";
          asprintf(__str, "%s(%p) Session init %s", v53, v19, v54);
          if (!__str[0])
            goto LABEL_98;
          v83 = v42;
          __lasts = 0;
          v58 = strtok_r(__str[0], "\n", &__lasts);
          v59 = (os_log_t *)MEMORY[0x1E0CF2758];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v60 = VRTraceErrorLogLevelToCSTR();
              v61 = *v59;
              if (os_log_type_enabled(*v59, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                *(_QWORD *)&buf[4] = v60;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:proc"
                                      "essId:isGKVoiceChat:]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 372;
                *(_WORD *)&buf[28] = 2080;
                *(_QWORD *)&buf[30] = "";
                *(_WORD *)&buf[38] = 2080;
                *(_QWORD *)&buf[40] = v58;
                _os_log_impl(&dword_1D8A54000, v61, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v58 = strtok_r(0, "\n", &__lasts);
          }
          while (v58);
        }
        free(__str[0]);
        v42 = v83;
LABEL_98:
        -[VCConnectionManager setCellPrimaryInterfaceChangeEnabled:](-[VCTransportSession connectionManager](v19->_transportSession, "connectionManager"), "setCellPrimaryInterfaceChangeEnabled:", 1);
        -[VCConnectionManager setShouldLimitMultiwayBandwidthWhenConstrained:](-[VCTransportSession connectionManager](v19->_transportSession, "connectionManager"), "setShouldLimitMultiwayBandwidthWhenConstrained:", -[VCSessionSwitches isFeatureEnabled:](v19->_abSwitches, "isFeatureEnabled:", 2));
        v74 = v19->_oneToOneModeEnabled;
        v75 = -[VCTransportSession connectionManager](v19->_transportSession, "connectionManager");
        if (v74)
        {
          -[VCConnectionManager setDefaultLinkProbingCapabilityVersionForDeviceRole:](v75, "setDefaultLinkProbingCapabilityVersionForDeviceRole:", v42);
        }
        else
        {
          -[VCConnectionManager setiRATDuplicationEnabled:](v75, "setiRATDuplicationEnabled:", 1);
          -[VCConnectionHealthMonitor setUsingServerBasedLinks:](-[VCConnectionManager connectionHealthMonitor](-[VCTransportSession connectionManager](v19->_transportSession, "connectionManager"), "connectionHealthMonitor"), "setUsingServerBasedLinks:", 1);
        }
        v19->_forceFixedEncryptionLabel = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("controlChannelV2ForceFixedEncryptionLabel"), 0);
        v19->_isSSRCCollisionDetectionEnabled = !-[VCDefaults forceDisableSSRCCollisionDetection](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableSSRCCollisionDetection");
        -[VCSession reportClientPersistentSettings](v19, "reportClientPersistentSettings");
        -[VCSession reportingSessionParticipantEvent:withParticipant:](v19, "reportingSessionParticipantEvent:withParticipant:", 163, 0);
        kdebug_trace();
        objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "setReportingAgent:", v19->super._reportingAgent);
        -[VCSession registerForThermalFeatureNotifications](v19, "registerForThermalFeatureNotifications");
        v19->_isDNUCollectionEnabled = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D64EE0], "sharedInstance"), "optInApple");
        return v19;
      }
      if ((VCSession *)objc_opt_class() == v19)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_71;
        v62 = VRTraceErrorLogLevelToCSTR();
        v63 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        v64 = objc_msgSend(a3, "UTF8String");
        localParticipant = v19->_localParticipant;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v62;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 362;
        *(_WORD *)&buf[28] = 2080;
        *(_QWORD *)&buf[30] = v64;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)&buf[40] = localParticipant;
        v50 = "VCSession [%s] %s:%d Unable to configure local participant streams for the session. Destination=%s localParticipant=%p";
        v51 = v63;
        v52 = 48;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v57 = (const __CFString *)-[VCSession performSelector:](v19, "performSelector:", sel_logPrefix);
        else
          v57 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_71;
        v66 = VRTraceErrorLogLevelToCSTR();
        v67 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        v68 = objc_msgSend(a3, "UTF8String");
        v69 = v19->_localParticipant;
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)&buf[4] = v66;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 362;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v57;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)&buf[40] = v19;
        *(_WORD *)&buf[48] = 2080;
        *(_QWORD *)&buf[50] = v68;
        *(_WORD *)&buf[58] = 2048;
        *(_QWORD *)&buf[60] = v69;
        v50 = "VCSession [%s] %s:%d %@(%p) Unable to configure local participant streams for the session. Destination=%s "
              "localParticipant=%p";
        v51 = v67;
        v52 = 68;
      }
    }
    else
    {
      if ((VCSession *)objc_opt_class() == v18)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v44 = VRTraceErrorLogLevelToCSTR();
          v45 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:].cold.1(v44, v45);
        }
        goto LABEL_71;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v32 = (const __CFString *)-[VCSession performSelector:](v19, "performSelector:", sel_logPrefix);
      else
        v32 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (v47 = VRTraceErrorLogLevelToCSTR(),
            v48 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
      {
LABEL_71:

        return 0;
      }
      v49 = objc_msgSend(0, "UTF8String");
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCSession initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 189;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v32;
      *(_WORD *)&buf[38] = 2048;
      *(_QWORD *)&buf[40] = v19;
      *(_WORD *)&buf[48] = 2080;
      *(_QWORD *)&buf[50] = v49;
      v50 = "VCSession [%s] %s:%d %@(%p) Unable to initialize the session. Destination=%s";
      v51 = v48;
      v52 = 58;
    }
    _os_log_error_impl(&dword_1D8A54000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
    goto LABEL_71;
  }
  return v19;
}

- (void)dealloc
{
  __CFString *v3;
  const char *v4;
  const char *v5;
  const char *v6;
  char *v7;
  os_log_t *v8;
  uint64_t v9;
  NSObject *v10;
  char *v11;
  os_log_t *v12;
  uint64_t v13;
  NSObject *v14;
  __CFDictionary *mediaTypeToSpatialMetadataEntryMap;
  tagVCMediaQueue *mediaQueue;
  NSObject *sessionQueue;
  NSObject *notificationQueue;
  NSObject *stopCompletedSemaphore;
  objc_super v20;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v4 = -[VCSession description](self, "description")
         ? -[NSString UTF8String](-[NSString description](-[VCSession description](self, "description"), "description"), "UTF8String"): "<nil>";
      asprintf(&__str, "Session dealloc %s", v4);
      if (__str)
      {
        __lasts = 0;
        v11 = strtok_r(__str, "\n", &__lasts);
        v12 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *v12;
            if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v24 = v13;
              v25 = 2080;
              v26 = "-[VCSession dealloc]";
              v27 = 1024;
              v28 = 398;
              v29 = 2080;
              v30 = "";
              v31 = 2080;
              v32 = v11;
              _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v11 = strtok_r(0, "\n", &__lasts);
        }
        while (v11);
        goto LABEL_26;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (__CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v5 = (const char *)-[__CFString UTF8String](v3, "UTF8String");
      v6 = -[VCSession description](self, "description")
         ? -[NSString UTF8String](-[NSString description](-[VCSession description](self, "description"), "description"), "UTF8String"): "<nil>";
      asprintf(&__str, "%s(%p) Session dealloc %s", v5, self, v6);
      if (__str)
      {
        __lasts = 0;
        v7 = strtok_r(__str, "\n", &__lasts);
        v8 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v9 = VRTraceErrorLogLevelToCSTR();
            v10 = *v8;
            if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v24 = v9;
              v25 = 2080;
              v26 = "-[VCSession dealloc]";
              v27 = 1024;
              v28 = 398;
              v29 = 2080;
              v30 = "";
              v31 = 2080;
              v32 = v7;
              _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v7 = strtok_r(0, "\n", &__lasts);
        }
        while (v7);
LABEL_26:
        free(__str);
      }
    }
  }
  -[VCSession unregisterQoSReporting](self, "unregisterQoSReporting");
  -[VCMediaRecorderManager unregisterMediaRecorderWithStreamToken:](+[VCMediaRecorderManager sharedInstance](VCMediaRecorderManager, "sharedInstance"), "unregisterMediaRecorderWithStreamToken:", self->_transportSessionID);
  -[VCSession cleanupOneToOne](self, "cleanupOneToOne");
  -[VCSession cleanupSpatialAudio](self, "cleanupSpatialAudio");

  mediaTypeToSpatialMetadataEntryMap = self->_mediaTypeToSpatialMetadataEntryMap;
  if (mediaTypeToSpatialMetadataEntryMap)
    CFRelease(mediaTypeToSpatialMetadataEntryMap);

  self->_remoteParticipantsMapByUUID = 0;
  -[VCSessionParticipant setStreamDelegate:](self->_localParticipant, "setStreamDelegate:", 0);

  self->_localParticipant = 0;
  -[VCSession destroySessionMessaging](self, "destroySessionMessaging");

  mediaQueue = self->_mediaQueue;
  if (mediaQueue)
    CFRelease(mediaQueue);
  sessionQueue = self->_sessionQueue;
  if (sessionQueue)
  {
    dispatch_release(sessionQueue);
    self->_sessionQueue = 0;
  }
  notificationQueue = self->_notificationQueue;
  if (notificationQueue)
  {
    dispatch_release(notificationQueue);
    self->_notificationQueue = 0;
  }
  stopCompletedSemaphore = self->_stopCompletedSemaphore;
  if (stopCompletedSemaphore)
  {
    dispatch_release(stopCompletedSemaphore);
    self->_stopCompletedSemaphore = 0;
  }
  objc_storeWeak((id *)&self->_delegate, 0);

  -[VCSession cleanupNwActivity](self, "cleanupNwActivity");
  -[VCSession cleanupVCRC](self, "cleanupVCRC");

  +[VCVTPWrapper stopVTP](VCVTPWrapper, "stopVTP");
  -[VCAudioCaptionsCoordinator invalidate](self->_captionsCoordinator, "invalidate");

  reportingReleaseObject();
  objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "setReportingAgent:", 0);

  -[VCSession deregisterForThermalFeatureNotifications](self, "deregisterForThermalFeatureNotifications");
  v20.receiver = self;
  v20.super_class = (Class)VCSession;
  -[VCObject dealloc](&v20, sel_dealloc);
}

- (void)setReportingConfig:(id *)a3
{
  OS_nw_activity *v5;
  __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  VCSession *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    a3->var0 = self->_transportSessionID;
    a3->var1 = (__CFString *)self->_conversationID;
    a3->var2 = (__CFDate *)self->_conversationTimeBase;
    a3->var5 = -[VCSessionConfiguration reportingHierarchyToken](self->_configuration, "reportingHierarchyToken");
    v5 = -[VCSession nwActivity](self, "nwActivity");
    v6 = (__CFString *)*MEMORY[0x1E0CF2A08];
    a3->var6 = v5;
    a3->var7 = v6;
    a3->var8 = -[VCSession configurationSpecificReportingServiceName](self, "configurationSpecificReportingServiceName");
    a3->var10 = (__CFString *)-[VCCallInfoBlob deviceType](-[VCSessionParticipant callInfoBlob](self->_localParticipant, "callInfoBlob"), "deviceType");
    a3->var9 = (__CFString *)-[VCCallInfoBlob osVersion](-[VCSessionParticipant callInfoBlob](self->_localParticipant, "callInfoBlob"), "osVersion");
    a3->var4 = -[VCSessionConfiguration isOneToOneModeEnabled](self->_configuration, "isOneToOneModeEnabled");
    a3->var11 = -[VCSession getClientSpecificUserInfo](self, "getClientSpecificUserInfo");
    v7 = 5;
    if (!+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("useAggregatorMultiwayforU1"), 1))
    {
      if (-[VCSessionConfiguration isOneToOneModeEnabled](self->_configuration, "isOneToOneModeEnabled"))
        v7 = 0;
      else
        v7 = 5;
    }
    self->_reportingClientType = v7;
    a3->var3 = v7;
    a3->var12 = &__block_literal_global_51;
    a3->var14 = self->_shouldCreateSecondAggregator;
    -[VCSession readAndSetABCSymptomsReportingThresholdsFromStorebags:](self, "readAndSetABCSymptomsReportingThresholdsFromStorebags:", a3);
    -[VCSession enableDataCollectionInReportingConfig:](self, "enableDataCollectionInReportingConfig:", a3);
  }
  else if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession setReportingConfig:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v11 = 136316162;
        v12 = v9;
        v13 = 2080;
        v14 = "-[VCSession setReportingConfig:]";
        v15 = 1024;
        v16 = 464;
        v17 = 2112;
        v18 = v8;
        v19 = 2048;
        v20 = self;
        _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) reportingConfig must not be nil", (uint8_t *)&v11, 0x30u);
      }
    }
  }
}

void __32__VCSession_setReportingConfig___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _VCSession_ReportingConfigurationCallback(a2, a3 != 0);
}

- (void)dumpVCSessionMetadataToDataStore
{
  -[VCSessionParticipant uuid](self->_localParticipant, "uuid");
  +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
  VCReporting_DumpIntoDataStore();
}

- (void)enableDataCollectionInReportingConfig:(id *)a3
{
  _BOOL4 v5;
  __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  VCSession *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (self->_oneToOneModeEnabled)
    {
      if (+[VCHardwareSettings isDataCollectionSupported](VCHardwareSettings, "isDataCollectionSupported"))
      {
        v5 = -[VCSessionSwitches isFeatureEnabled:](self->_abSwitches, "isFeatureEnabled:", 16);
        a3->var16 = v5;
        if (v5)
          v6 = CFSTR("Data collection enabled, waiting for RTCReport confirmation");
        else
          v6 = CFSTR("Data collection is disabled, VCSession not sampled by Trial");
      }
      else
      {
        v6 = CFSTR("Data collection is not available on this platform");
      }
    }
    else
    {
      v6 = CFSTR("Data collection is not available outside U+1");
    }
  }
  else
  {
    v6 = CFSTR("Invalid reportingConfig, data collection disabled");
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315906;
        v16 = v8;
        v17 = 2080;
        v18 = "-[VCSession enableDataCollectionInReportingConfig:]";
        v19 = 1024;
        v20 = 521;
        v21 = 2080;
        v22 = -[__CFString UTF8String](v6, "UTF8String");
        v10 = "VCSession [%s] %s:%d %s";
        v11 = v9;
        v12 = 38;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136316418;
        v16 = v13;
        v17 = 2080;
        v18 = "-[VCSession enableDataCollectionInReportingConfig:]";
        v19 = 1024;
        v20 = 521;
        v21 = 2112;
        v22 = (uint64_t)v7;
        v23 = 2048;
        v24 = self;
        v25 = 2080;
        v26 = -[__CFString UTF8String](v6, "UTF8String");
        v10 = "VCSession [%s] %s:%d %@(%p) %s";
        v11 = v14;
        v12 = 58;
        goto LABEL_17;
      }
    }
  }
}

- (void)stopTimeoutTimer
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_stopCompletedSemaphore);
  v3.receiver = self;
  v3.super_class = (Class)VCSession;
  -[VCObject stopTimeoutTimer](&v3, sel_stopTimeoutTimer);
}

- (void)startDeallocTimer
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Dealloc timer starting without stop completing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (NSDictionary)capabilities
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = -[VCHardwareSettingsEmbedded maxActiveVideoDecoders](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxActiveVideoDecoders");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v9 = v3;
      v10 = 2080;
      v11 = "-[VCSession capabilities]";
      v12 = 1024;
      v13 = 550;
      v14 = 1024;
      v15 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d maxActiveVideoDecodes=%d", buf, 0x22u);
    }
  }
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2, CFSTR("avcKeySupportedMaxVideoDecodes"));
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
}

- (NSDictionary)transportMetadata
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = 0;
  -[VCConnectionManager getSentBytes:receivedBytes:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "getSentBytes:receivedBytes:", &v4, &v3);
  v5[0] = CFSTR("avcKeySessionSentBytes");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v4);
  v5[1] = CFSTR("avcKeySessionReceivedBytes");
  v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v3);
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
}

- (void)setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:(id)a3 remoteFrameworkVersion:(id)a4
{
  -[VCTransportSession setConnectionSelectionVersionWithLocalFrameworkVersion:remoteFrameworkVersion:](self->_transportSession, "setConnectionSelectionVersionWithLocalFrameworkVersion:remoteFrameworkVersion:", a3, a4);
  if (self->_oneToOneModeEnabled)
    -[VCConnectionManager setOptIntoExistingSubscribedStreams:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setOptIntoExistingSubscribedStreams:", 1);
}

- (int)selectDataPath
{
  int result;
  int v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("datagramChannelIDSDataPath"), _os_feature_enabled_impl());
  v3 = result;
  if (result >= 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v6)
        return result;
      v7 = 136316418;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCSession selectDataPath]";
      v11 = 1024;
      v12 = 579;
      v13 = 1024;
      v14 = v3;
      v15 = 2112;
      v16 = CFSTR("datagramChannelIDSDataPath");
      v17 = 1024;
      v18 = 0;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Wrong value=%d read from user default [%@]. Resetting it to default value=%d", (uint8_t *)&v7, 0x32u);
    }
    return 0;
  }
  return result;
}

- (void)setupTransportSessionWithDestination:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  VCTransportSessionIDSMultiLink *v9;
  const __CFString *v10;
  VCSession *v11;
  const __CFString *v12;
  NSString *v13;
  _BYTE v14[24];
  int v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[VCSession selectDataPath](self, "selectDataPath");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("direct");
      *(_DWORD *)v14 = 136315906;
      *(_QWORD *)&v14[4] = v6;
      *(_WORD *)&v14[12] = 2080;
      *(_QWORD *)&v14[14] = "-[VCSession setupTransportSessionWithDestination:]";
      if (!(_DWORD)v5)
        v8 = CFSTR("shared");
      *(_WORD *)&v14[22] = 1024;
      v15 = 587;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Session will use [%@] data path", v14, 0x26u);
    }
  }
  v9 = -[VCTransportSessionIDSMultiLink initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:isMultiwaySession:dataPath:]([VCTransportSessionIDSMultiLink alloc], "initWithCallID:requireEncryptionInfo:reportingAgent:notificationQueue:isMultiwaySession:dataPath:", self->_transportSessionID, 1, self->super._reportingAgent, self->_sessionQueue, 1, v5);
  reportingSetDataPath();
  -[VCTransportSession setPerfTimings:](v9, "setPerfTimings:", objc_alloc_init(MEMORY[0x1E0CF2690]));
  -[VCTransportSessionIDS setDestination:](v9, "setDestination:", a3);
  self->_transportSession = &v9->super.super;
  -[VCConnectionManager setIsOneToOneModeEnabled:](-[VCTransportSession connectionManager](v9, "connectionManager"), "setIsOneToOneModeEnabled:", self->_oneToOneModeEnabled);
  -[VCConnectionManager setGftTLEEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setGftTLEEnabled:", -[VCSessionConfiguration isGftTLEEnabled](self->_configuration, "isGftTLEEnabled"));
  if (self->_oneToOneModeEnabled)
  {
    v10 = CFSTR("2045");
    v11 = self;
    v12 = CFSTR("2045");
  }
  else
  {
    v13 = -[VCCallInfoBlob frameworkVersion](-[VCSessionParticipant callInfoBlob](self->_localParticipant, "callInfoBlob"), "frameworkVersion");
    v12 = -[VCCallInfoBlob frameworkVersion](-[VCSessionParticipant callInfoBlob](self->_localParticipant, "callInfoBlob"), "frameworkVersion");
    v11 = self;
    v10 = (const __CFString *)v13;
  }
  -[VCSession setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:](v11, "setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:", v10, v12, *(_OWORD *)v14, *(_QWORD *)&v14[16]);
}

- (void)setState:(unsigned int)a3
{
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  char *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    v3 = *(_QWORD *)&a3;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v8 = -[VCSession sessionStateToString:](self, "sessionStateToString:", self->_state);
      v15 = 136316162;
      v16 = v6;
      v17 = 2080;
      v18 = "-[VCSession setState:]";
      v19 = 1024;
      v20 = 604;
      v21 = 2080;
      v22 = v8;
      v23 = 2080;
      v24 = -[VCSession sessionStateToString:](self, "sessionStateToString:", v3);
      v9 = "VCSession [%s] %s:%d Exiting state session %s. Entering state session %s.";
      v10 = v7;
      v11 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v14 = -[VCSession sessionStateToString:](self, "sessionStateToString:", self->_state);
      v15 = 136316674;
      v16 = v12;
      v17 = 2080;
      v18 = "-[VCSession setState:]";
      v19 = 1024;
      v20 = 604;
      v21 = 2112;
      v22 = (void *)v5;
      v23 = 2048;
      v24 = (char *)self;
      v25 = 2080;
      v26 = v14;
      v27 = 2080;
      v28 = -[VCSession sessionStateToString:](self, "sessionStateToString:", v3);
      v9 = "VCSession [%s] %s:%d %@(%p) Exiting state session %s. Entering state session %s.";
      v10 = v13;
      v11 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
LABEL_13:
    self->_state = v3;
  }
}

- (char)sessionStateToString:(unsigned int)a3
{
  if (a3 - 1 > 3)
    return "Stopped";
  else
    return off_1E9E563E0[a3 - 1];
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idsDestination[%@] state[%s] localParticipantID[%@] remoteParticipants[%@]"), self->_idsDestination, -[VCSession sessionStateToString:](self, "sessionStateToString:", self->_state), -[VCSessionParticipant uuid](self->_localParticipant, "uuid"), -[VCSession remoteParticipants](self, "remoteParticipants"));
}

- (id)participantsToString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("stoppingParticipants[%@] startingParticipants[%@] initializingParticipants[%@]"), self->_stoppingParticipants, self->_startingParticipants, self->_initializingParticipants);
}

- (VCSessionDelegate)delegate
{
  return (VCSessionDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)addParticipantConfigurations:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__VCSession_addParticipantConfigurations___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __42__VCSession_addParticipantConfigurations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedAddParticipantConfigurations:", *(_QWORD *)(a1 + 40));
}

- (void)removeParticipant:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__VCSession_removeParticipant___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __31__VCSession_removeParticipant___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRemoveParticipant:", *(_QWORD *)(a1 + 40));
}

- (VCSessionParticipantRemote)oneToOneRemoteParticipant
{
  return (VCSessionParticipantRemote *)-[NSArray firstObject](-[VCSession remoteParticipants](self, "remoteParticipants"), "firstObject");
}

- (void)start
{
  NSObject *sessionQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  sessionQueue = self->_sessionQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __18__VCSession_start__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(sessionQueue, v4);
}

uint64_t __18__VCSession_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedStart");
}

- (void)stopWithError:(id)a3
{
  kdebug_trace();
  -[VCSession stopWithError:didRemoteCancel:](self, "stopWithError:didRemoteCancel:", a3, 0);
}

- (void)stopWithError:(id)a3 didRemoteCancel:(BOOL)a4
{
  NSObject *sessionQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__VCSession_stopWithError_didRemoteCancel___block_invoke;
  v5[3] = &unk_1E9E52210;
  v5[4] = self;
  v5[5] = a3;
  v6 = a4;
  dispatch_async(sessionQueue, v5);
}

uint64_t __43__VCSession_stopWithError_didRemoteCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedStopWithError:didRemoteCancel:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)updateConfiguration:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__VCSession_updateConfiguration___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __33__VCSession_updateConfiguration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateConfiguration:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "reportingSessionParticipantEvent:withParticipant:", 169, 0);
}

- (id)participantForID:(id)a3
{
  NSObject *sessionQueue;
  void *v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__16;
  v11 = __Block_byref_object_dispose__16;
  v12 = 0;
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__VCSession_participantForID___block_invoke;
  v6[3] = &unk_1E9E550C8;
  v6[4] = a3;
  v6[5] = self;
  v6[6] = &v7;
  dispatch_sync(sessionQueue, v6);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __30__VCSession_participantForID___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "uuid"));
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
    result = *(_QWORD *)(v3 + 240);
  else
    result = objc_msgSend(*(id *)(v3 + 248), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (void)mediaStateChangedForParticipant:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCSession mediaStateChangedForParticipant:]";
      v11 = 1024;
      v12 = 690;
      v13 = 2112;
      v14 = objc_msgSend(a3, "uuid");
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d uuid:%@", (uint8_t *)&v7, 0x26u);
    }
  }
  if (!self->_oneToOneModeEnabled)
    -[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:](self, "distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:", 1);
}

- (NSArray)remoteParticipants
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_remoteParticipantsMapByUUID, "allValues");
}

- (void)setParentNWActivity:(id)a3
{
  OS_nw_activity *parentNWActivity;

  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity)
    nw_release(parentNWActivity);
  self->_parentNWActivity = (OS_nw_activity *)a3;
  if (a3)
    nw_retain(a3);
}

- (__CFString)configurationSpecificReportingServiceName
{
  NSString *v3;
  VCSessionConfiguration *configuration;
  void *v5;
  const char *v6;
  _BOOL4 v7;

  v3 = -[VCSessionConfiguration serviceName](self->_configuration, "serviceName");
  configuration = self->_configuration;
  if (v3)
  {
    if (!-[NSString isEqualToString:](-[VCSessionConfiguration serviceName](configuration, "serviceName"), "isEqualToString:", CFSTR("com.apple.private.alloy.dropin.communication")))return (__CFString *)-[VCSessionConfiguration serviceName](self->_configuration, "serviceName");
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = "dropin";
  }
  else
  {
    v7 = -[VCSessionConfiguration isOneToOneModeEnabled](configuration, "isOneToOneModeEnabled");
    v5 = (void *)MEMORY[0x1E0CB3940];
    if (v7)
      v6 = "twoway";
    else
      v6 = "session";
  }
  return (__CFString *)objc_msgSend(v5, "stringWithUTF8String:", v6);
}

- (void)reportingSetUserInfo
{
  -[VCSession configurationSpecificReportingServiceName](self, "configurationSpecificReportingServiceName");
  -[VCSession getClientSpecificUserInfo](self, "getClientSpecificUserInfo");
  reportingSetUserInfo();
}

void __33__VCSession_reportingSetUserInfo__block_invoke(uint64_t a1, uint64_t a2)
{
  _VCSession_ReportingConfigurationCallback(*(_QWORD *)(a1 + 32), a2 != 0);
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  NSObject *sessionQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__VCSession_setOneToOneModeEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __36__VCSession_setOneToOneModeEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:", *(unsigned __int8 *)(a1 + 40), 1, 0);
}

- (void)setOneToOneModeEnabled:(BOOL)a3 configurationDict:(id)a4
{
  NSObject *sessionQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__VCSession_setOneToOneModeEnabled_configurationDict___block_invoke;
  v5[3] = &unk_1E9E52210;
  v6 = a3;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(sessionQueue, v5);
}

uint64_t __54__VCSession_setOneToOneModeEnabled_configurationDict___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:", *(unsigned __int8 *)(a1 + 48), 1, *(_QWORD *)(a1 + 40));
}

- (void)setRemoteScreenControlEnabled:(BOOL)a3
{
  NSObject *sessionQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCSession_setRemoteScreenControlEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __43__VCSession_setRemoteScreenControlEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetRemoteScreenControlEnabled:isLocal:", *(unsigned __int8 *)(a1 + 40), 0);
}

- (void)generateKeyFrameWithReceivedMessage:(id)a3 forParticipant:(id)a4
{
  NSObject *sessionQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__VCSession_generateKeyFrameWithReceivedMessage_forParticipant___block_invoke;
  v5[3] = &unk_1E9E527D0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a3;
  dispatch_async(sessionQueue, v5);
}

void __64__VCSession_generateKeyFrameWithReceivedMessage_forParticipant___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(v5 + 200);
      v8 = *(_DWORD *)(v5 + 336);
      v9 = objc_msgSend(v2, "uuid");
      v10 = *(_QWORD *)(a1 + 48);
      v16 = 136316930;
      v17 = v3;
      v18 = 2080;
      v19 = "-[VCSession generateKeyFrameWithReceivedMessage:forParticipant:]_block_invoke";
      v20 = 1024;
      v21 = 765;
      v22 = 2112;
      v23 = v7;
      v24 = 1024;
      v25 = v8;
      v26 = 2112;
      v27 = v6;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d VCSession[%@] transportSessionID[%u] idsParticipantID[%@] participantUUID[%@] receives message[%@]", (uint8_t *)&v16, 0x4Au);
    }
  }
  v11 = *(void **)(a1 + 48);
  if (v11)
  {
    v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VCSessionMessageStreamID")), "unsignedIntValue");
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    if (objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("VCSessionMessageFIRType")))
      v14 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("VCSessionMessageFIRType")), "unsignedIntValue");
    else
      v14 = 0;
    if (objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("VCSessionMesageStreamGroupID")))
      v15 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("VCSessionMesageStreamGroupID")), "unsignedIntValue");
    else
      v15 = 0;
    objc_msgSend(*(id *)(a1 + 32), "reportingSessionParticipantEvent:withParticipant:streamGroupID:streamID:", 233, v2, v15, (unsigned __int16)v12);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "generateKeyFrameWithStreamID:streamGroupID:firType:", v13, v15, v14);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __64__VCSession_generateKeyFrameWithReceivedMessage_forParticipant___block_invoke_cold_1();
  }
}

- (void)setSharingEnabled:(BOOL)a3
{
  NSObject *sessionQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__VCSession_setSharingEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __31__VCSession_setSharingEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetSharingEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setScreenAndCameraMixingEnabled:(BOOL)a3
{
  NSObject *sessionQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCSession_setScreenAndCameraMixingEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __45__VCSession_setScreenAndCameraMixingEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetScreenAndCameraMixingEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)dispatchedSetSharingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 sharingEnabled;
  VCSession *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  VCSession *v23;
  NSArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];
  _QWORD v32[2];
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  VCSession *v49;
  __int16 v50;
  _BOOL4 v51;
  uint64_t v52;

  v3 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  sharingEnabled = self->_sharingEnabled;
  v6 = (VCSession *)objc_opt_class();
  if (sharingEnabled != v3)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)buf = 136315906;
      v41 = v14;
      v42 = 2080;
      v43 = "-[VCSession dispatchedSetSharingEnabled:]";
      v44 = 1024;
      v45 = 801;
      v46 = 1024;
      LODWORD(v47) = v3;
      v16 = "VCSession [%s] %s:%d changing _sharingEnabled to %d";
      v17 = v15;
      v18 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)buf = 136316418;
      v41 = v21;
      v42 = 2080;
      v43 = "-[VCSession dispatchedSetSharingEnabled:]";
      v44 = 1024;
      v45 = 801;
      v46 = 2112;
      v47 = v8;
      v48 = 2048;
      v49 = self;
      v50 = 1024;
      v51 = v3;
      v16 = "VCSession [%s] %s:%d %@(%p) changing _sharingEnabled to %d";
      v17 = v22;
      v18 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_24:
    self->_sharingEnabled = v3;
    -[VCSessionParticipant setSharingEnabled:](self->_localParticipant, "setSharingEnabled:", v3);
    v38[0] = CFSTR("VCSPExpanseEnabled");
    v38[1] = CFSTR("VCSPUUID");
    v39[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v39[1] = -[VCSessionParticipant uuid](self->_localParticipant, "uuid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    reportingGenericEvent();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v23 = self;
    v24 = -[VCSession remoteParticipants](self, "remoteParticipants");
    v25 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v29, "setSharingEnabled:", v3);
          v31[0] = CFSTR("VCSPExpanseEnabled");
          v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
          v31[1] = CFSTR("VCSPUUID");
          v32[0] = v30;
          v32[1] = objc_msgSend(v29, "uuid");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
          reportingGenericEvent();
        }
        v26 = -[NSArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
      }
      while (v26);
    }
    if (!v23->_oneToOneModeEnabled)
      -[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:](v23, "distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:", 0);
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "setViewPointCorrectionEnabled:", !v23->_sharingEnabled);
    -[VCSession updateLocalVideoCaptureFrameRate](v23, "updateLocalVideoCaptureFrameRate");
    return;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v41 = v9;
        v42 = 2080;
        v43 = "-[VCSession dispatchedSetSharingEnabled:]";
        v44 = 1024;
        v45 = 820;
        v46 = 1024;
        LODWORD(v47) = v3;
        v11 = "VCSession [%s] %s:%d _sharingEnabled already %d";
        v12 = v10;
        v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v41 = v19;
        v42 = 2080;
        v43 = "-[VCSession dispatchedSetSharingEnabled:]";
        v44 = 1024;
        v45 = 820;
        v46 = 2112;
        v47 = v7;
        v48 = 2048;
        v49 = self;
        v50 = 1024;
        v51 = v3;
        v11 = "VCSession [%s] %s:%d %@(%p) _sharingEnabled already %d";
        v12 = v20;
        v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)dispatchedSetScreenAndCameraMixingEnabled:(BOOL)a3
{
  int v3;
  int screenAndCameraMixingEnabled;
  VCSession *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _BYTE v24[24];
  __int128 v25;
  VCSession *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  screenAndCameraMixingEnabled = self->_screenAndCameraMixingEnabled;
  v6 = (VCSession *)objc_opt_class();
  if (screenAndCameraMixingEnabled != v3)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6
        || (v14 = VRTraceErrorLogLevelToCSTR(),
            v15 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_24:
        self->_screenAndCameraMixingEnabled = v3;
        if (v3)
          v23 = 1;
        else
          v23 = 2;
        -[VCSessionParticipant setMediaType:mixingWithMediaType:](self->_localParticipant, "setMediaType:mixingWithMediaType:", 2, v23, *(_OWORD *)v24, *(_QWORD *)&v24[16], v25, v26, v27, v28);
        return;
      }
      *(_DWORD *)v24 = 136315906;
      *(_QWORD *)&v24[4] = v14;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = "-[VCSession dispatchedSetScreenAndCameraMixingEnabled:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 827;
      WORD2(v25) = 1024;
      *(_DWORD *)((char *)&v25 + 6) = v3;
      v16 = "VCSession [%s] %s:%d changing _screenAndCameraMixingEnabled=%d";
      v17 = v15;
      v18 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)v24 = 136316418;
      *(_QWORD *)&v24[4] = v21;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = "-[VCSession dispatchedSetScreenAndCameraMixingEnabled:]";
      *(_WORD *)&v24[22] = 1024;
      LODWORD(v25) = 827;
      WORD2(v25) = 2112;
      *(_QWORD *)((char *)&v25 + 6) = v8;
      HIWORD(v25) = 2048;
      v26 = self;
      LOWORD(v27) = 1024;
      *(_DWORD *)((char *)&v27 + 2) = v3;
      v16 = "VCSession [%s] %s:%d %@(%p) changing _screenAndCameraMixingEnabled=%d";
      v17 = v22;
      v18 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, v24, v18);
    goto LABEL_24;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v24 = 136315906;
        *(_QWORD *)&v24[4] = v9;
        *(_WORD *)&v24[12] = 2080;
        *(_QWORD *)&v24[14] = "-[VCSession dispatchedSetScreenAndCameraMixingEnabled:]";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 835;
        WORD2(v25) = 1024;
        *(_DWORD *)((char *)&v25 + 6) = v3;
        v11 = "VCSession [%s] %s:%d _screenAndCameraMixingEnabled=%d already";
        v12 = v10;
        v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v24, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v24 = 136316418;
        *(_QWORD *)&v24[4] = v19;
        *(_WORD *)&v24[12] = 2080;
        *(_QWORD *)&v24[14] = "-[VCSession dispatchedSetScreenAndCameraMixingEnabled:]";
        *(_WORD *)&v24[22] = 1024;
        LODWORD(v25) = 835;
        WORD2(v25) = 2112;
        *(_QWORD *)((char *)&v25 + 6) = v7;
        HIWORD(v25) = 2048;
        v26 = self;
        LOWORD(v27) = 1024;
        *(_DWORD *)((char *)&v27 + 2) = v3;
        v11 = "VCSession [%s] %s:%d %@(%p) _screenAndCameraMixingEnabled=%d already";
        v12 = v20;
        v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)sendStreamGroupStateToParticipant:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VCSession_sendStreamGroupStateToParticipant___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(sessionQueue, block);
}

uint64_t __47__VCSession_sendStreamGroupStateToParticipant___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(a1 + 40);
  if (v2 != *(_QWORD *)(result + 240) && *(_DWORD *)(result + 168) == 3)
    return objc_msgSend((id)result, "messageMediaInitialStateToParticipant:");
  return result;
}

- (int)getStorebagValueForIntegerKey:(id)a3 defaultValue:(id)a4
{
  return objc_msgSend(+[GKSConnectivitySettings readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", a3, 0, a4, 0), "intValue");
}

- (void)readAndSetABCSymptomsReportingThresholdsFromStorebags:(id *)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int var0;
  int var1;
  int var2;
  int var3;
  int var4;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BYTE v30[10];
  VCSession *v31;
  _BYTE v32[6];
  _BYTE v33[6];
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    a3->var15.var0 = -[VCSession getStorebagValueForIntegerKey:defaultValue:](self, "getStorebagValueForIntegerKey:defaultValue:", CFSTR("vc-reporting-audio-connection-time-symptom-threshold"), &unk_1E9EF5348);
    a3->var15.var1 = -[VCSession getStorebagValueForIntegerKey:defaultValue:](self, "getStorebagValueForIntegerKey:defaultValue:", CFSTR("vc-reporting-audio-erasure-percentage-symptom-threshold"), &unk_1E9EF5348);
    a3->var15.var2 = -[VCSession getStorebagValueForIntegerKey:defaultValue:](self, "getStorebagValueForIntegerKey:defaultValue:", CFSTR("vc-reporting-poor-connection-percentage-symptom-threshold"), &unk_1E9EF5348);
    a3->var15.var3 = -[VCSession getStorebagValueForIntegerKey:defaultValue:](self, "getStorebagValueForIntegerKey:defaultValue:", CFSTR("vc-reporting-video-connection-time-symptom-threshold"), &unk_1E9EF5348);
    a3->var15.var4 = -[VCSession getStorebagValueForIntegerKey:defaultValue:](self, "getStorebagValueForIntegerKey:defaultValue:", CFSTR("vc-reporting-video-stall-percentage-symptom-threshold"), &unk_1E9EF5348);
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          var0 = a3->var15.var0;
          var1 = a3->var15.var1;
          var2 = a3->var15.var2;
          var3 = a3->var15.var3;
          var4 = a3->var15.var4;
          v23 = 136316930;
          v24 = v6;
          v25 = 2080;
          v26 = "-[VCSession readAndSetABCSymptomsReportingThresholdsFromStorebags:]";
          v27 = 1024;
          v28 = 863;
          v29 = 1024;
          *(_DWORD *)v30 = var0;
          *(_WORD *)&v30[4] = 1024;
          *(_DWORD *)&v30[6] = var1;
          LOWORD(v31) = 1024;
          *(_DWORD *)((char *)&v31 + 2) = var2;
          HIWORD(v31) = 1024;
          *(_DWORD *)v32 = var3;
          *(_WORD *)&v32[4] = 1024;
          *(_DWORD *)v33 = var4;
          v13 = "VCSession [%s] %s:%d Threshold values: audioConnectionTimeThreshold=%d, audioErasurePercentageThreshold="
                "%d, poorConnectionPercentageThreshold=%d, videoConnectionTimeThreshold=%d, videoStallPercentageThreshold=%d";
          v14 = v7;
          v15 = 58;
LABEL_15:
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v23, v15);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v18 = a3->var15.var0;
          v19 = a3->var15.var1;
          v20 = a3->var15.var2;
          v21 = a3->var15.var3;
          v22 = a3->var15.var4;
          v23 = 136317442;
          v24 = v16;
          v25 = 2080;
          v26 = "-[VCSession readAndSetABCSymptomsReportingThresholdsFromStorebags:]";
          v27 = 1024;
          v28 = 863;
          v29 = 2112;
          *(_QWORD *)v30 = v5;
          *(_WORD *)&v30[8] = 2048;
          v31 = self;
          *(_WORD *)v32 = 1024;
          *(_DWORD *)&v32[2] = v18;
          *(_WORD *)v33 = 1024;
          *(_DWORD *)&v33[2] = v19;
          v34 = 1024;
          v35 = v20;
          v36 = 1024;
          v37 = v21;
          v38 = 1024;
          v39 = v22;
          v13 = "VCSession [%s] %s:%d %@(%p) Threshold values: audioConnectionTimeThreshold=%d, audioErasurePercentageThr"
                "eshold=%d, poorConnectionPercentageThreshold=%d, videoConnectionTimeThreshold=%d, videoStallPercentageThreshold=%d";
          v14 = v17;
          v15 = 78;
          goto LABEL_15;
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSession readAndSetABCSymptomsReportingThresholdsFromStorebags:].cold.1();
  }
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
  VCTerminateProcess((uint64_t)a3, a4, (uint64_t)a5);
}

- (void)setTransportSessionEventHandler
{
  uint64_t v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__VCSession_setTransportSessionEventHandler__block_invoke;
  v4[3] = &unk_1E9E56298;
  v4[4] = v3;
  -[VCTransportSession setEventHandler:](self->_transportSession, "setEventHandler:", v4);
}

void __44__VCSession_setTransportSessionEventHandler__block_invoke(uint64_t a1, int a2, void *a3)
{
  _DWORD *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  _BYTE v33[24];
  _OWORD v34[2];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (_DWORD *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (v5)
  {
    v6 = v5;
    switch(a2)
    {
      case 1:
        v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoNewLink"));
        if (objc_msgSend(v6, "currentActiveConnection"))
          v8 = 1;
        else
          v8 = v7 == 0;
        if (!v8)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 8)
            goto LABEL_60;
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          v11 = *MEMORY[0x1E0CF2758];
          if (!*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_1();
            goto LABEL_60;
          }
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            goto LABEL_60;
          *(_DWORD *)v33 = 136315906;
          *(_QWORD *)&v33[4] = v9;
          *(_WORD *)&v33[12] = 2080;
          *(_QWORD *)&v33[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
          *(_WORD *)&v33[22] = 1024;
          LODWORD(v34[0]) = 887;
          WORD2(v34[0]) = 2112;
          *(_QWORD *)((char *)v34 + 6) = v7;
          v12 = "VCSession [%s] %s:%d Established initial connection '%@'";
          v13 = v10;
          v14 = 38;
          goto LABEL_30;
        }
        break;
      case 2:
        v18 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoDisconnectedLink"));
        if (VCConnection_Equal(objc_msgSend(v6, "currentActiveConnection"), v18))
          v19 = v18 == 0;
        else
          v19 = 1;
        if (!v19)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v20 = VRTraceErrorLogLevelToCSTR();
            v21 = *MEMORY[0x1E0CF2758];
            v22 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v33 = 136315906;
                *(_QWORD *)&v33[4] = v20;
                *(_WORD *)&v33[12] = 2080;
                *(_QWORD *)&v33[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
                *(_WORD *)&v33[22] = 1024;
                LODWORD(v34[0]) = 896;
                WORD2(v34[0]) = 2112;
                *(_QWORD *)((char *)v34 + 6) = v18;
                _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Removing current active connection '%@'", v33, 0x26u);
              }
            }
            else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_2();
            }
          }
          v31 = v6;
          v32 = 0;
          goto LABEL_61;
        }
        break;
      case 3:
        objc_msgSend(v5, "handlePrimaryConnectionChanged:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoNewPrimary")));
        break;
      case 4:
        v23 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoIsDuplicationEnabled")), "BOOLValue");
        v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoActiveConnection"));
        if ((VCConnection_Equal(objc_msgSend(v6, "currentActiveConnection"), v7) & 1) == 0 && v7)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v24 = VRTraceErrorLogLevelToCSTR();
            v25 = *MEMORY[0x1E0CF2758];
            v26 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v33 = 136316162;
                *(_QWORD *)&v33[4] = v24;
                *(_WORD *)&v33[12] = 2080;
                *(_QWORD *)&v33[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
                *(_WORD *)&v33[22] = 1024;
                LODWORD(v34[0]) = 911;
                WORD2(v34[0]) = 1024;
                *(_DWORD *)((char *)v34 + 6) = v23;
                WORD5(v34[0]) = 2112;
                *(_QWORD *)((char *)v34 + 12) = v7;
                v12 = "VCSession [%s] %s:%d Duplication state changed to %d, active connection is '%@'";
                v13 = v25;
                v14 = 44;
LABEL_30:
                _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v33, v14);
              }
            }
            else if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v33 = 136316162;
              *(_QWORD *)&v33[4] = v24;
              *(_WORD *)&v33[12] = 2080;
              *(_QWORD *)&v33[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
              *(_WORD *)&v33[22] = 1024;
              LODWORD(v34[0]) = 911;
              WORD2(v34[0]) = 1024;
              *(_DWORD *)((char *)v34 + 6) = v23;
              WORD5(v34[0]) = 2112;
              *(_QWORD *)((char *)v34 + 12) = v7;
              _os_log_debug_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEBUG, "VCSession [%s] %s:%d Duplication state changed to %d, active connection is '%@'", v33, 0x2Cu);
            }
          }
LABEL_60:
          v31 = v6;
          v32 = v7;
LABEL_61:
          objc_msgSend(v31, "setCurrentActiveConnection:", v32, *(_OWORD *)v33, *(_QWORD *)&v33[16], v34[0], *(_QWORD *)&v34[1]);
          goto LABEL_62;
        }
        break;
      case 7:
        objc_msgSend(v5, "dispatchedStopWithError:didRemoteCancel:", a3, 0);
        break;
      case 8:
        if (objc_msgSend(v5, "currentActiveConnection"))
          objc_msgSend(v6, "handleCellTechChange:connection:", objc_msgSend(a3, "intValue"), objc_msgSend(v6, "currentActiveConnection"));
        break;
      case 9:
        if (objc_msgSend(v5, "currentActiveConnection"))
          objc_msgSend(v6, "handleCellularMTUChanged:connection:", objc_msgSend(a3, "unsignedShortValue"), objc_msgSend(v6, "currentActiveConnection"));
        break;
      case 10:
      case 13:
      case 14:
      case 16:
        return;
      case 11:
        objc_msgSend(v5, "handleEncryptionInfoEvent:", a3);
        break;
      case 12:
        objc_msgSend(v5, "handleMembershipChangeInfoEvent:", a3);
        break;
      case 15:
        objc_msgSend(v5, "handlePreferredInterfaceForDuplicationUpdate:notifyPeer:enableDuplication:isMediaUnrecoverableSignal:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoPreferredInterfaceForDuplication")), "intValue"), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoNotifyPeer")), "BOOLValue"), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoIsDuplicationEnabled")), "BOOLValue"), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoIsMediaUnrecoverableSignal")),
            "BOOLValue"));
        break;
      case 17:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v28 = VRTraceErrorLogLevelToCSTR();
          v29 = *MEMORY[0x1E0CF2758];
          v30 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v33 = 136315906;
              *(_QWORD *)&v33[4] = v28;
              *(_WORD *)&v33[12] = 2080;
              *(_QWORD *)&v33[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
              *(_WORD *)&v33[22] = 1024;
              LODWORD(v34[0]) = 953;
              WORD2(v34[0]) = 2112;
              *(_QWORD *)((char *)v34 + 6) = a3;
              _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Link constrains changed: '%@'", v33, 0x26u);
            }
          }
          else if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_3();
          }
        }
        objc_msgSend(v6, "applyLinkConstrains:", a3);
LABEL_62:
        objc_msgSend(v6, "handleActiveConnectionChange:", objc_msgSend(v6, "currentActiveConnection"));
        break;
      case 18:
        v5[194] = -1;
        objc_msgSend(v5, "handleActiveConnectionChange:", objc_msgSend(v5, "currentActiveConnection"));
        break;
      case 19:
        objc_msgSend(v5, "mediaQualityDegraded:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoIsMediaQualityDegraded")), "BOOLValue"));
        break;
      case 20:
        objc_msgSend(v5, "didLocalNetworkConditionChange:isLocalNetworkQualityDegraded:isRemoteNetworkQualityDegraded:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoDidLocalNetworkConditionChange")), "BOOLValue"), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoIsLocalNetworkQualityDegraded")), "BOOLValue"), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoIsRemoteNetworkQualityDegraded")),
            "BOOLValue"));
        break;
      case 21:
        objc_msgSend(v5, "setIsUplinkRetransmissionEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoIsUplinkRetransmissionSupported")), "BOOLValue"));
        break;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v27 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v33 = 136315906;
            *(_QWORD *)&v33[4] = v27;
            *(_WORD *)&v33[12] = 2080;
            *(_QWORD *)&v33[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
            *(_WORD *)&v33[22] = 1024;
            LODWORD(v34[0]) = 971;
            WORD2(v34[0]) = 1024;
            *(_DWORD *)((char *)v34 + 6) = a2;
            v17 = "VCSession [%s] %s:%d Received invalid transportSession event(%d)";
            goto LABEL_14;
          }
        }
        break;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v33 = 136315906;
      *(_QWORD *)&v33[4] = v15;
      *(_WORD *)&v33[12] = 2080;
      *(_QWORD *)&v33[14] = "-[VCSession setTransportSessionEventHandler]_block_invoke";
      *(_WORD *)&v33[22] = 1024;
      LODWORD(v34[0]) = 880;
      WORD2(v34[0]) = 1024;
      *(_DWORD *)((char *)v34 + 6) = a2;
      v17 = "VCSession [%s] %s:%d Received transportSession event %d while call is not ongoing. Skipping";
LABEL_14:
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v17, v33, 0x22u);
    }
  }
}

- (void)applyLinkConstrains:(id)a3
{
  VCConnectionManager *v5;
  uint64_t v6;
  _QWORD *v7;

  v5 = -[VCTransportSession connectionManager](self->_transportSession, "connectionManager");
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventPayloadKey_IsCellular")), "BOOLValue");
  v7 = (_QWORD *)MEMORY[0x1E0D33E88];
  if (!(_DWORD)v6)
    v7 = (_QWORD *)MEMORY[0x1E0D33EC0];
  -[VCConnectionManager applyLinkFlags:isCellular:](v5, "applyLinkFlags:isCellular:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *v7), "intValue"), v6);
  if (self->_oneToOneModeEnabled)
    -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", a3, CFSTR("VCSessionMessageTopicLinkConstrainesChanged"), -[VCSessionParticipant idsParticipantID](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "idsParticipantID"));
}

- (void)applyRemoteLinkConstrains:(id)a3
{
  VCConnectionManager *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = -[VCTransportSession connectionManager](self->_transportSession, "connectionManager");
  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventPayloadKey_IsCellular")), "BOOLValue");
  v6 = (_QWORD *)MEMORY[0x1E0D33E88];
  if (!(_DWORD)v5)
    v6 = (_QWORD *)MEMORY[0x1E0D33EC0];
  -[VCConnectionManager applyRemoteLinkFlags:isCellular:](v4, "applyRemoteLinkFlags:isCellular:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *v6), "intValue"), v5);
}

- (void)notifyRemoteOfCellTechChange:(id)a3 remoteParticipant:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if (-[VCSession isOneToOneUsingVideo](self, "isOneToOneUsingVideo")
      || -[VCSession isOneToOneUsingScreen](self, "isOneToOneUsingScreen"))
    {
      v7 = objc_msgSend(a3, "uplinkBitrateCapOneToOne");
    }
    else
    {
      v7 = objc_msgSend(a3, "uplinkAudioBitrateCapOneToOne");
    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v7);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", VCConnection_LocalCellTech((uint64_t)a3));
    v10[0] = CFSTR("VCCellTechKey");
    v10[1] = CFSTR("VCMaxBitrateKey");
    v11[0] = v9;
    v11[1] = v8;
    -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2), CFSTR("VCCellTechChangeTopic"), objc_msgSend(a4, "idsParticipantID"));

  }
}

- (void)handleCellTechChange:(int)a3 connection:(id)a4
{
  uint64_t v5;
  int v7;

  v5 = *(_QWORD *)&a3;
  v7 = -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1);
  if ((_DWORD)v5 && (int)v5 <= 9 && v7 != (_DWORD)v5 && (self->_state | 2) == 3)
  {
    -[VCConnectionManager updateCellularTech:forLocalInterface:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "updateCellularTech:forLocalInterface:", v5, 1);
    -[VCSession handleActiveConnectionChange:](self, "handleActiveConnectionChange:", a4);
    if (self->_oneToOneModeEnabled)
      -[VCSession notifyRemoteOfCellTechChange:remoteParticipant:](self, "notifyRemoteOfCellTechChange:remoteParticipant:", a4, -[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"));
  }
}

- (void)handlePrimaryConnectionChanged:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  const void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      v7 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136315906;
          v10 = v5;
          v11 = 2080;
          v12 = "-[VCSession handlePrimaryConnectionChanged:]";
          v13 = 1024;
          v14 = 1036;
          v15 = 2112;
          v16 = a3;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Primary connection changed to '%@'", (uint8_t *)&v9, 0x26u);
        }
      }
      else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        -[VCSession handlePrimaryConnectionChanged:].cold.1();
      }
    }
    v8 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), 1);
    if ((VCConnection_Equal((uint64_t)-[VCSession currentActiveConnection](self, "currentActiveConnection"), (uint64_t)v8) & 1) != 0|| !v8)
    {
      if (!v8)
        return;
    }
    else
    {
      -[VCSession setCurrentActiveConnection:](self, "setCurrentActiveConnection:", v8);
      -[VCSession handleActiveConnectionChange:](self, "handleActiveConnectionChange:", -[VCSession currentActiveConnection](self, "currentActiveConnection"));
      VCMediaQueue_CleanupTxHistory((uint64_t)self->_mediaQueue);
      -[VCSessionStatsController reset](-[VCSession sessionStatsController](self, "sessionStatsController"), "reset");
    }
    CFRelease(v8);
  }
}

- (void)handleCellularMTUChanged:(unsigned __int16)a3 connection:(id)a4
{
  -[VCConnectionManager updateCellularMTU:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "updateCellularMTU:", a3);
  -[VCSession handleActiveConnectionChange:](self, "handleActiveConnectionChange:", a4);
}

- (void)handleActiveConnectionChange:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__VCSession_handleActiveConnectionChange___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __42__VCSession_handleActiveConnectionChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedHandleActiveConnectionChange:", *(_QWORD *)(a1 + 40));
}

- (void)dispatchedHandleActiveConnectionChange:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int IsEndToEndLink;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
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
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v20 = v5;
      v21 = 2080;
      v22 = "-[VCSession dispatchedHandleActiveConnectionChange:]";
      v23 = 1024;
      v24 = 1060;
      v25 = 2112;
      v26 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Connection changed to '%@'", buf, 0x26u);
    }
  }
  if ((self->_state | 2) == 3)
  {
    IsEndToEndLink = VCConnection_IsEndToEndLink((uint64_t)a3);
    if (!self->_oneToOneModeEnabled || IsEndToEndLink == 0)
    {
      if ((IsEndToEndLink & 1) == 0)
        -[VCSession handleActiveConnectionChangeForMultiway:](self, "handleActiveConnectionChangeForMultiway:", a3);
    }
    else
    {
      -[VCSession handleActiveConnectionChangeForOneToOne:](self, "handleActiveConnectionChangeForOneToOne:", a3);
    }
    -[VCSessionParticipantLocal handleActiveConnectionChange:](self->_localParticipant, "handleActiveConnectionChange:", a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = -[VCSession remoteParticipants](self, "remoteParticipants");
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "handleActiveConnectionChange:", a3);
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v11);
    }
    if (self->_feedbackController)
      -[VCNetworkFeedbackController setIsLocalCellular:](self->_feedbackController, "setIsLocalCellular:", VCConnection_IsLocalOnCellular((uint64_t)a3));
  }
}

- (void)updateMultiwayRateControllersWithActiveConnection:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[VCSession updateMultiwayRateControllerWithActiveConnection:isScreenEnabled:isLocal:](self, "updateMultiwayRateControllerWithActiveConnection:isScreenEnabled:isLocal:", a3, -[VCSessionParticipant isScreenEnabled](self->_localParticipant, "isScreenEnabled"), 1);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[VCSession remoteParticipants](self, "remoteParticipants");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "isRemoteScreenEnabled") & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:
  -[VCSession updateMultiwayRateControllerWithActiveConnection:isScreenEnabled:isLocal:](self, "updateMultiwayRateControllerWithActiveConnection:isScreenEnabled:isLocal:", a3, v10, 0);
  -[VCNetworkFeedbackController setClientTargetBitrateCap:](self->_feedbackController, "setClientTargetBitrateCap:", objc_msgSend(a3, "uplinkBitrateCap"));
  if (VCConnection_IsLocalOnCellular((uint64_t)a3))
    -[VCNetworkFeedbackController setDownlinkTargetCellBitrateCap:](self->_feedbackController, "setDownlinkTargetCellBitrateCap:", objc_msgSend(a3, "downlinkBitrateCap"));
}

- (void)handleActiveConnectionChangeForMultiway:(id)a3
{
  int IsLocalOnCellular;
  int IsLocalConstrained;
  int currentConnectionType;
  BOOL *p_isCurrentConnectionConstrained;

  IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  IsLocalConstrained = VCConnection_IsLocalConstrained((uint64_t)a3);
  currentConnectionType = self->_currentConnectionType;
  if (currentConnectionType == objc_msgSend(a3, "localConnectionType"))
  {
    p_isCurrentConnectionConstrained = &self->_isCurrentConnectionConstrained;
    if (self->_isCurrentConnectionConstrained == IsLocalConstrained)
    {
      if (!IsLocalOnCellular)
        return;
      goto LABEL_4;
    }
  }
  else
  {
    self->_currentConnectionType = objc_msgSend(a3, "localConnectionType");
    -[VCSession reportingSessionParticipantEvent:withParticipant:](self, "reportingSessionParticipantEvent:withParticipant:", 159, 0);
    p_isCurrentConnectionConstrained = &self->_isCurrentConnectionConstrained;
    if (self->_isCurrentConnectionConstrained == IsLocalConstrained)
      goto LABEL_7;
  }
  *p_isCurrentConnectionConstrained = IsLocalConstrained;
LABEL_7:
  -[VCSession updateMultiwayRateControllersWithActiveConnection:](self, "updateMultiwayRateControllersWithActiveConnection:", a3);
  if (IsLocalOnCellular)
LABEL_4:
    -[VCSessionParticipant setBasebandCongestionDetector:](self->_localParticipant, "setBasebandCongestionDetector:", -[AVCRateController basebandCongestionDetector](self->_uplinkRateController, "basebandCongestionDetector"));
}

- (void)handlePreferredInterfaceForDuplicationUpdate:(unsigned __int8)a3 notifyPeer:(BOOL)a4 enableDuplication:(BOOL)a5 isMediaUnrecoverableSignal:(BOOL)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneModeEnabled && a4)
  {
    v7 = a6;
    v8 = a5;
    v9 = a3;
    if (-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant", a3, a4))
    {
      v11[0] = CFSTR("VCPreferredInterfaceKey");
      v12[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v9);
      v11[1] = CFSTR("VCPreferredInterfaceDuplicatingKey");
      v12[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
      v11[2] = CFSTR("VCPreferredInterfaceMediaUnrecoverableSignalKey");
      v12[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3), CFSTR("VCPreferredInterfaceMessageTopic"), -[VCSessionParticipant idsParticipantID](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "idsParticipantID"));
    }
  }
}

- (unsigned)calculateExpectedTotalNetworkBitrateDownlink
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = -[VCSession remoteParticipants](self, "remoteParticipants");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "actualNetworkBitrateWithAudioBitrates:", v3);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v3, "sortUsingSelector:", sel_compare_);
  v10 = objc_msgSend(v3, "count");
  if (-[VCSessionDownlinkBandwidthAllocator simultaneousTalkers](self->_downlinkBandwidthAllocator, "simultaneousTalkers"))
  {
    v11 = v10 == 0;
  }
  else
  {
    v11 = 1;
  }
  if (!v11)
  {
    v12 = v10 - 1;
    v13 = 2;
    do
    {
      v7 += objc_msgSend((id)objc_msgSend(v3, "objectAtIndexedSubscript:", v12), "unsignedIntValue");
      v14 = v13 > -[VCSessionDownlinkBandwidthAllocator simultaneousTalkers](self->_downlinkBandwidthAllocator, "simultaneousTalkers")|| v13 > v10;
      ++v13;
      --v12;
    }
    while (!v14);
  }

  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315906;
      v19 = v15;
      v20 = 2080;
      v21 = "-[VCSession calculateExpectedTotalNetworkBitrateDownlink]";
      v22 = 1024;
      v23 = 1159;
      v24 = 1024;
      v25 = v7;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d New downlink expected bitrate:%u", (uint8_t *)&v18, 0x22u);
    }
  }
  return v7;
}

- (unsigned)calculateExpectedTotalNetworkBitrateUplink
{
  unsigned int v2;
  uint64_t v3;
  NSObject *v4;
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
  v2 = -[VCSessionParticipantLocal currentUplinkTotalBitrate](self->_localParticipant, "currentUplinkTotalBitrate");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCSession calculateExpectedTotalNetworkBitrateUplink]";
      v10 = 1024;
      v11 = 1166;
      v12 = 1024;
      v13 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d New uplink expected bitrate:%u", (uint8_t *)&v6, 0x22u);
    }
  }
  return v2;
}

- (void)setOneToOneVideoStreamBandwidthProbing:(BOOL)a3
{
  _BOOL8 v3;
  VCSessionParticipantLocal *localParticipant;
  VCSessionParticipantLocal *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v3 = a3;
  localParticipant = self->_localParticipant;
  if (localParticipant)
  {
    -[VCSessionParticipantLocal oneToOneSettings](localParticipant, "oneToOneSettings");
    localParticipant = (VCSessionParticipantLocal *)v11;
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  objc_msgSend((id)objc_msgSend((id)-[VCSessionParticipantLocal objectForKeyedSubscript:](localParticipant, "objectForKeyedSubscript:", &unk_1E9EF5360), "stream"), "setIsEndToEndBasedBandwidthProbingEnabled:", v3);
  v6 = self->_localParticipant;
  if (v6)
  {
    -[VCSessionParticipantLocal oneToOneSettings](v6, "oneToOneSettings");
    v6 = (VCSessionParticipantLocal *)v8;
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }
  objc_msgSend((id)objc_msgSend((id)-[VCSessionParticipantLocal objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", &unk_1E9EF5378, v7, v8, v9, v10, v11, v12), "stream"), "setIsEndToEndBasedBandwidthProbingEnabled:", v3);
}

- (void)vcSessionParticipant:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  NSObject *sessionQueue;
  _QWORD block[7];
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCSession_vcSessionParticipant_didStart_error___block_invoke;
  block[3] = &unk_1E9E53608;
  block[4] = self;
  block[5] = a3;
  v7 = a4;
  block[6] = a5;
  dispatch_async(sessionQueue, block);
}

uint64_t __49__VCSession_vcSessionParticipant_didStart_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dispatchedParticipant:didStart:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "participantVideoToken");
    return kdebug_trace();
  }
  return result;
}

- (void)vcSessionParticipant:(id)a3 didStopWithError:(id)a4
{
  NSObject *sessionQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VCSession_vcSessionParticipant_didStopWithError___block_invoke;
  v5[3] = &unk_1E9E527D0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(sessionQueue, v5);
}

uint64_t __51__VCSession_vcSessionParticipant_didStopWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dispatchedParticipant:didStopWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "participantVideoToken");
  return kdebug_trace();
}

- (void)vcSessionParticipant:(id)a3 audioEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  NSObject *sessionQueue;
  _QWORD block[7];
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VCSession_vcSessionParticipant_audioEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E562C0;
  v8 = a5;
  block[4] = a3;
  block[5] = self;
  v9 = a4;
  block[6] = a6;
  dispatch_async(sessionQueue, block);
}

void __64__VCSession_vcSessionParticipant_audioEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  char v2;
  _QWORD *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[7];
  char v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE *)(a1 + 56);
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD **)(a1 + 40);
    if (v4 != v3[30])
    {
      objc_msgSend(v3, "mediaStateChangedForParticipant:");
LABEL_19:
      objc_msgSend(*(id *)(a1 + 40), "reportingSessionParticipantEvent:withParticipant:", 170, *(_QWORD *)(a1 + 32));
      v2 = *(_BYTE *)(a1 + 56);
      goto LABEL_20;
    }
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v6 = VRTraceErrorLogLevelToCSTR(),
            v7 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_15:
        objc_msgSend(*(id *)(a1 + 40), "broadcastMediaStateUpdateMessage");
        if (*(_BYTE *)(a1 + 57))
          v14 = CFSTR("VCSessionMessageAudioEnabled");
        else
          v14 = CFSTR("VCSessionMessageAudioDisabled");
        objc_msgSend(*(id *)(a1 + 40), "broadcastSingleStateMessage:withTopic:", v14, CFSTR("VCSessionMessageTopicAudioEnabledState"));
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136315650;
      v22 = v6;
      v23 = 2080;
      v24 = "-[VCSession vcSessionParticipant:audioEnabled:didSucceed:error:]_block_invoke";
      v25 = 1024;
      v26 = 1202;
      v8 = "VCSession [%s] %s:%d Broadcasting audioEnabled state";
      v9 = v7;
      v10 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v22 = v11;
      v23 = 2080;
      v24 = "-[VCSession vcSessionParticipant:audioEnabled:didSucceed:error:]_block_invoke";
      v25 = 1024;
      v26 = 1202;
      v27 = 2112;
      v28 = v5;
      v29 = 2048;
      v30 = v13;
      v8 = "VCSession [%s] %s:%d %@(%p) Broadcasting audioEnabled state";
      v9 = v12;
      v10 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    goto LABEL_15;
  }
LABEL_20:
  v16 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v17 = *(NSObject **)(v15 + 184);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[2] = __64__VCSession_vcSessionParticipant_audioEnabled_didSucceed_error___block_invoke_138;
  v18[3] = &unk_1E9E562C0;
  v18[1] = 3221225472;
  v18[4] = v15;
  v18[5] = v16;
  v19 = *(_BYTE *)(a1 + 57);
  v20 = v2;
  v18[6] = *(_QWORD *)(a1 + 48);
  dispatch_async(v17, v18);
}

uint64_t __64__VCSession_vcSessionParticipant_audioEnabled_didSucceed_error___block_invoke_138(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:audioEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
}

- (void)updateOneToOneVideoReceiverDelegate:(BOOL)a3
{
  if (!self->_oneToOneModeEnabled)
  {
    if (a3)
      -[VCSession setupOneToOneVideoReceiverDelegate](self, "setupOneToOneVideoReceiverDelegate");
    else
      -[VCSession cleanupOneToOneVideoReceiverDelegate](self, "cleanupOneToOneVideoReceiverDelegate");
  }
}

- (void)vcSessionParticipant:(id)a3 videoEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  NSObject *sessionQueue;
  _QWORD block[7];
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VCSession_vcSessionParticipant_videoEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E562C0;
  v8 = a5;
  block[4] = a3;
  block[5] = self;
  v9 = a4;
  block[6] = a6;
  dispatch_async(sessionQueue, block);
}

void __64__VCSession_vcSessionParticipant_videoEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[7];
  char v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_24;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3 == *(_QWORD *)(v2 + 240))
  {
    if (*(_BYTE *)(v2 + 409))
    {
      objc_msgSend(*(id *)(a1 + 32), "handleActiveConnectionChange:", *(_QWORD *)(v2 + 328));
      objc_msgSend(*(id *)(a1 + 40), "configureOneToOneReportingOnVideoEnabled");
    }
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v5 = VRTraceErrorLogLevelToCSTR(),
            v6 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_17:
        objc_msgSend(*(id *)(a1 + 40), "broadcastMediaStateUpdateMessage");
        if (*(_BYTE *)(a1 + 57))
          v13 = CFSTR("VCSessionMessageVideoEnabled");
        else
          v13 = CFSTR("VCSessionMessageVideoDisabled");
        objc_msgSend(*(id *)(a1 + 40), "broadcastSingleStateMessage:withTopic:", v13, CFSTR("VCSessionMessageTopicVideoEnabledStateb"));
        objc_msgSend(*(id *)(a1 + 40), "updateOneToOneVideoReceiverDelegate:", *(unsigned __int8 *)(a1 + 57));
        goto LABEL_21;
      }
      *(_DWORD *)buf = 136315650;
      v22 = v5;
      v23 = 2080;
      v24 = "-[VCSession vcSessionParticipant:videoEnabled:didSucceed:error:]_block_invoke";
      v25 = 1024;
      v26 = 1235;
      v7 = "VCSession [%s] %s:%d Broadcasting videoEnabled state";
      v8 = v6;
      v9 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_17;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v22 = v10;
      v23 = 2080;
      v24 = "-[VCSession vcSessionParticipant:videoEnabled:didSucceed:error:]_block_invoke";
      v25 = 1024;
      v26 = 1235;
      v27 = 2112;
      v28 = v4;
      v29 = 2048;
      v30 = v12;
      v7 = "VCSession [%s] %s:%d %@(%p) Broadcasting videoEnabled state";
      v8 = v11;
      v9 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    goto LABEL_17;
  }
  objc_msgSend((id)v2, "mediaStateChangedForParticipant:");
LABEL_21:
  objc_msgSend(*(id *)(a1 + 40), "reportingSessionParticipantEvent:withParticipant:", 171, *(_QWORD *)(a1 + 32));
  v14 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v14 + 240) && *(_BYTE *)(v14 + 409))
    objc_msgSend((id)v14, "configureOneToOneRateController:", *(_QWORD *)(v14 + 328));
LABEL_24:
  v16 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v17 = *(NSObject **)(v15 + 184);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[2] = __64__VCSession_vcSessionParticipant_videoEnabled_didSucceed_error___block_invoke_145;
  v18[3] = &unk_1E9E562C0;
  v18[1] = 3221225472;
  v18[4] = v15;
  v18[5] = v16;
  v19 = *(_BYTE *)(a1 + 57);
  v20 = *(_BYTE *)(a1 + 56);
  v18[6] = *(_QWORD *)(a1 + 48);
  dispatch_async(v17, v18);
}

uint64_t __64__VCSession_vcSessionParticipant_videoEnabled_didSucceed_error___block_invoke_145(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:videoEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
}

- (void)vcSessionParticipant:(id)a3 screenEnabled:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  NSObject *sessionQueue;
  _QWORD block[7];
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VCSession_vcSessionParticipant_screenEnabled_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E562C0;
  v8 = a5;
  block[4] = a3;
  block[5] = self;
  v9 = a4;
  block[6] = a6;
  dispatch_async(sessionQueue, block);
}

void __65__VCSession_vcSessionParticipant_screenEnabled_didSucceed_error___block_invoke(uint64_t a1)
{
  char v2;
  _QWORD *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  _QWORD *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD v25[7];
  char v26;
  char v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE *)(a1 + 56);
  if (!v2)
    goto LABEL_28;
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD **)(a1 + 40);
  if (v4 != v3[30])
  {
    objc_msgSend(v3, "mediaStateChangedForParticipant:");
    objc_msgSend(*(id *)(a1 + 40), "updateMultiwayRateControllerWithActiveConnection:isScreenEnabled:isLocal:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 328), *(unsigned __int8 *)(a1 + 57), 0);
    goto LABEL_16;
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_15;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136315650;
    v29 = v6;
    v30 = 2080;
    v31 = "-[VCSession vcSessionParticipant:screenEnabled:didSucceed:error:]_block_invoke";
    v32 = 1024;
    v33 = 1257;
    v8 = "VCSession [%s] %s:%d Broadcasting screenEnabled state";
    v9 = v7;
    v10 = 28;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_15;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v13 = *(const char **)(a1 + 40);
    *(_DWORD *)buf = 136316162;
    v29 = v11;
    v30 = 2080;
    v31 = "-[VCSession vcSessionParticipant:screenEnabled:didSucceed:error:]_block_invoke";
    v32 = 1024;
    v33 = 1257;
    v34 = 2112;
    v35 = (void *)v5;
    v36 = 2048;
    v37 = v13;
    v8 = "VCSession [%s] %s:%d %@(%p) Broadcasting screenEnabled state";
    v9 = v12;
    v10 = 48;
  }
  _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_15:
  objc_msgSend(*(id *)(a1 + 40), "broadcastMediaStateUpdateMessage");
  objc_msgSend(*(id *)(a1 + 40), "updateMultiwayRateControllerWithActiveConnection:isScreenEnabled:isLocal:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 328), *(unsigned __int8 *)(a1 + 57), 1);
LABEL_16:
  v14 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v14 + 409))
  {
    objc_msgSend((id)objc_msgSend(*(id *)(v14 + 320), "connectionManager"), "setIsOneToOneScreenEnabled:", *(unsigned __int8 *)(a1 + 57));
    v15 = *(_QWORD **)(a1 + 40);
    if (*(_QWORD *)(a1 + 32) == v15[30])
    {
      objc_msgSend(v15, "configureOneToOneRateController:", v15[41]);
      objc_msgSend(*(id *)(a1 + 40), "setOneToOneVideoStreamBandwidthProbing:", *(_BYTE *)(a1 + 57) == 0);
    }
  }
  if (*(_BYTE *)(a1 + 57))
  {
    v16 = VCMediaQueue_SetHighlyBurstyTrafficMode(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 480), 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = "YES";
        v20 = *(unsigned __int8 *)(a1 + 57);
        *(_DWORD *)buf = 136316162;
        v29 = v17;
        if (!v20)
          v19 = "NO";
        v31 = "-[VCSession vcSessionParticipant:screenEnabled:didSucceed:error:]_block_invoke";
        v32 = 1024;
        v21 = "PASS";
        v33 = 1274;
        v30 = 2080;
        v34 = 2080;
        if (v16)
          v21 = "FAILED";
        v35 = (void *)v19;
        v36 = 2080;
        v37 = v21;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Enabling screensharing mode in VCMediaQueue=%s, VCMediaQueue set screenEnabled=%s", buf, 0x30u);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "reportingSessionParticipantEvent:withParticipant:", 188, *(_QWORD *)(a1 + 32));
  v2 = *(_BYTE *)(a1 + 56);
LABEL_28:
  v23 = *(_QWORD *)(a1 + 32);
  v22 = *(_QWORD *)(a1 + 40);
  v24 = *(NSObject **)(v22 + 184);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[2] = __65__VCSession_vcSessionParticipant_screenEnabled_didSucceed_error___block_invoke_150;
  v25[3] = &unk_1E9E562C0;
  v25[1] = 3221225472;
  v25[4] = v22;
  v25[5] = v23;
  v26 = *(_BYTE *)(a1 + 57);
  v27 = v2;
  v25[6] = *(_QWORD *)(a1 + 48);
  dispatch_async(v24, v25);
}

uint64_t __65__VCSession_vcSessionParticipant_screenEnabled_didSucceed_error___block_invoke_150(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:screenEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
}

- (void)vcSessionParticipantFetchStreamGroupState:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VCSession_vcSessionParticipantFetchStreamGroupState___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(sessionQueue, block);
}

void *__55__VCSession_vcSessionParticipantFetchStreamGroupState___block_invoke(uint64_t a1)
{
  void *result;
  uint64_t v3;

  result = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (result != *(void **)(v3 + 240) && *(_DWORD *)(v3 + 168) == 3)
    return (void *)objc_msgSend(*(id *)(v3 + 224), "sendMessage:withTopic:participantID:", CFSTR("VCSessionMessageTopicFetchStreamGroupsState"), CFSTR("VCSessionMessageTopicFetchStreamGroupsState"), objc_msgSend(result, "idsParticipantID"));
  return result;
}

- (void)vcSessionParticipant:(id)a3 remoteAudioEnabledDidChange:(BOOL)a4
{
  NSObject *notificationQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__VCSession_vcSessionParticipant_remoteAudioEnabledDidChange___block_invoke;
  v5[3] = &unk_1E9E52210;
  v5[4] = self;
  v5[5] = a3;
  v6 = a4;
  dispatch_async(notificationQueue, v5);
}

uint64_t __62__VCSession_vcSessionParticipant_remoteAudioEnabledDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reportingSessionRemoteParticipantEvent:withParticipant:value:", 174, *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  objc_msgSend(*(id *)(a1 + 40), "setRemoteAudioEnabled:", *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:remoteAudioEnabledDidChange:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 48));
}

- (void)vcSessionParticipant:(id)a3 remoteVideoEnabledDidChange:(BOOL)a4
{
  NSObject *notificationQueue;
  uint64_t v7;
  NSObject *sessionQueue;
  _QWORD v9[6];
  _QWORD block[6];
  BOOL v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  notificationQueue = self->_notificationQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VCSession_vcSessionParticipant_remoteVideoEnabledDidChange___block_invoke;
  block[3] = &unk_1E9E52210;
  block[4] = self;
  block[5] = a3;
  v11 = a4;
  dispatch_async(notificationQueue, block);
  sessionQueue = self->_sessionQueue;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __62__VCSession_vcSessionParticipant_remoteVideoEnabledDidChange___block_invoke_2;
  v9[3] = &unk_1E9E52238;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(sessionQueue, v9);
}

uint64_t __62__VCSession_vcSessionParticipant_remoteVideoEnabledDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reportingSessionRemoteParticipantEvent:withParticipant:value:", 175, *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:remoteVideoEnabledDidChange:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __62__VCSession_vcSessionParticipant_remoteVideoEnabledDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaStateChangedForParticipant:", *(_QWORD *)(a1 + 40));
}

- (void)vcSessionParticipant:(id)a3 remoteScreenEnabledDidChange:(BOOL)a4
{
  NSObject *notificationQueue;
  uint64_t v8;
  NSObject *sessionQueue;
  _QWORD v10[6];
  BOOL v11;
  _QWORD block[6];
  BOOL v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  notificationQueue = self->_notificationQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VCSession_vcSessionParticipant_remoteScreenEnabledDidChange___block_invoke;
  block[3] = &unk_1E9E52210;
  v13 = a4;
  block[4] = self;
  block[5] = a3;
  dispatch_async(notificationQueue, block);
  sessionQueue = self->_sessionQueue;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __63__VCSession_vcSessionParticipant_remoteScreenEnabledDidChange___block_invoke_2;
  v10[3] = &unk_1E9E52210;
  v11 = a4;
  v10[4] = self;
  v10[5] = a3;
  dispatch_async(sessionQueue, v10);
}

uint64_t __63__VCSession_vcSessionParticipant_remoteScreenEnabledDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateMultiwayRateControllerWithActiveConnection:isScreenEnabled:isLocal:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328), *(unsigned __int8 *)(a1 + 48), 0);
  objc_msgSend(*(id *)(a1 + 32), "reportingSessionRemoteParticipantEvent:withParticipant:value:", 189, *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:remoteScreenEnabledDidChange:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __63__VCSession_vcSessionParticipant_remoteScreenEnabledDidChange___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "connectionManager"), "setIsOneToOneScreenEnabled:", *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "mediaStateChangedForParticipant:", *(_QWORD *)(a1 + 40));
}

- (void)vcSessionParticipant:(id)a3 audioPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  NSObject *sessionQueue;
  _QWORD block[7];
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VCSession_vcSessionParticipant_audioPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E562C0;
  v8 = a5;
  block[4] = a3;
  block[5] = self;
  v9 = a4;
  block[6] = a6;
  dispatch_async(sessionQueue, block);
}

void __63__VCSession_vcSessionParticipant_audioPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[7];
  char v18;
  char v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_19;
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 != v2[30])
  {
    objc_msgSend(v2, "mediaStateChangedForParticipant:");
    goto LABEL_19;
  }
  if (objc_opt_class() != *(_QWORD *)(a1 + 40))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_15;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136316162;
    v21 = v10;
    v22 = 2080;
    v23 = "-[VCSession vcSessionParticipant:audioPaused:didSucceed:error:]_block_invoke";
    v24 = 1024;
    v25 = 1328;
    v26 = 2112;
    v27 = v4;
    v28 = 2048;
    v29 = v12;
    v7 = "VCSession [%s] %s:%d %@(%p) Broadcasting audioPaused state";
    v8 = v11;
    v9 = 48;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v21 = v5;
      v22 = 2080;
      v23 = "-[VCSession vcSessionParticipant:audioPaused:didSucceed:error:]_block_invoke";
      v24 = 1024;
      v25 = 1328;
      v7 = "VCSession [%s] %s:%d Broadcasting audioPaused state";
      v8 = v6;
      v9 = 28;
LABEL_14:
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
    }
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 40), "broadcastMediaStateUpdateMessage");
  if (*(_BYTE *)(a1 + 57))
    v13 = CFSTR("VCSessionMessageAudioPaused");
  else
    v13 = CFSTR("VCSessionMessageAudioUnpaused");
  objc_msgSend(*(id *)(a1 + 40), "broadcastSingleStateMessage:withTopic:", v13, CFSTR("VCSessionMessageTopicAudioPausedState"));
LABEL_19:
  objc_msgSend(*(id *)(a1 + 40), "reportingSessionParticipantEvent:withParticipant:", 172, *(_QWORD *)(a1 + 32));
  v15 = *(_QWORD *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 40);
  v16 = *(NSObject **)(v14 + 184);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[2] = __63__VCSession_vcSessionParticipant_audioPaused_didSucceed_error___block_invoke_159;
  v17[3] = &unk_1E9E562C0;
  v18 = *(_BYTE *)(a1 + 57);
  v17[1] = 3221225472;
  v17[4] = v14;
  v17[5] = v15;
  v19 = *(_BYTE *)(a1 + 56);
  v17[6] = *(_QWORD *)(a1 + 48);
  dispatch_async(v16, v17);
}

uint64_t __63__VCSession_vcSessionParticipant_audioPaused_didSucceed_error___block_invoke_159(uint64_t a1)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[409])
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "transportSession"), "connectionManager"), "setConnectionPause:isLocalConnection:", *(unsigned __int8 *)(a1 + 56), 1);
    v2 = *(_BYTE **)(a1 + 32);
  }
  return objc_msgSend((id)objc_msgSend(v2, "delegate"), "vcSession:participantID:audioPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
}

- (void)vcSessionParticipant:(id)a3 videoPaused:(BOOL)a4 didSucceed:(BOOL)a5 error:(id)a6
{
  NSObject *sessionQueue;
  _QWORD block[7];
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VCSession_vcSessionParticipant_videoPaused_didSucceed_error___block_invoke;
  block[3] = &unk_1E9E562C0;
  v8 = a5;
  block[4] = a3;
  block[5] = self;
  v9 = a4;
  block[6] = a6;
  dispatch_async(sessionQueue, block);
}

void __63__VCSession_vcSessionParticipant_videoPaused_didSucceed_error___block_invoke(uint64_t a1)
{
  char v2;
  _QWORD *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[7];
  char v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE *)(a1 + 56);
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD **)(a1 + 40);
    if (v4 != v3[30])
    {
      objc_msgSend(v3, "mediaStateChangedForParticipant:");
LABEL_19:
      objc_msgSend(*(id *)(a1 + 40), "reportingSessionParticipantEvent:withParticipant:", 173, *(_QWORD *)(a1 + 32));
      v2 = *(_BYTE *)(a1 + 56);
      goto LABEL_20;
    }
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v6 = VRTraceErrorLogLevelToCSTR(),
            v7 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_15:
        objc_msgSend(*(id *)(a1 + 40), "broadcastMediaStateUpdateMessage");
        if (*(_BYTE *)(a1 + 57))
          v14 = CFSTR("VCSessionMessageVideoPaused");
        else
          v14 = CFSTR("VCSessionMessageVideoUnpaused");
        objc_msgSend(*(id *)(a1 + 40), "broadcastSingleStateMessage:withTopic:", v14, CFSTR("VCSessionMessageTopicVideoPausedState"));
        goto LABEL_19;
      }
      *(_DWORD *)buf = 136315650;
      v22 = v6;
      v23 = 2080;
      v24 = "-[VCSession vcSessionParticipant:videoPaused:didSucceed:error:]_block_invoke";
      v25 = 1024;
      v26 = 1350;
      v8 = "VCSession [%s] %s:%d Broadcasting videoPaused state";
      v9 = v7;
      v10 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v22 = v11;
      v23 = 2080;
      v24 = "-[VCSession vcSessionParticipant:videoPaused:didSucceed:error:]_block_invoke";
      v25 = 1024;
      v26 = 1350;
      v27 = 2112;
      v28 = v5;
      v29 = 2048;
      v30 = v13;
      v8 = "VCSession [%s] %s:%d %@(%p) Broadcasting videoPaused state";
      v9 = v12;
      v10 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    goto LABEL_15;
  }
LABEL_20:
  v16 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v17 = *(NSObject **)(v15 + 184);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[2] = __63__VCSession_vcSessionParticipant_videoPaused_didSucceed_error___block_invoke_166;
  v18[3] = &unk_1E9E562C0;
  v18[1] = 3221225472;
  v18[4] = v15;
  v18[5] = v16;
  v19 = *(_BYTE *)(a1 + 57);
  v20 = v2;
  v18[6] = *(_QWORD *)(a1 + 48);
  dispatch_async(v17, v18);
}

uint64_t __63__VCSession_vcSessionParticipant_videoPaused_didSucceed_error___block_invoke_166(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:videoPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48));
}

- (void)vcSessionParticipant:(id)a3 remoteAudioPausedDidChange:(BOOL)a4
{
  NSObject *notificationQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__VCSession_vcSessionParticipant_remoteAudioPausedDidChange___block_invoke;
  v5[3] = &unk_1E9E52210;
  v5[4] = self;
  v5[5] = a3;
  v6 = a4;
  dispatch_async(notificationQueue, v5);
}

uint64_t __61__VCSession_vcSessionParticipant_remoteAudioPausedDidChange___block_invoke(uint64_t a1)
{
  _BYTE *v2;

  objc_msgSend(*(id *)(a1 + 32), "reportingSessionRemoteParticipantEvent:withParticipant:value:", 176, *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[409])
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "transportSession"), "connectionManager"), "setConnectionPause:isLocalConnection:", *(unsigned __int8 *)(a1 + 48), 0);
    v2 = *(_BYTE **)(a1 + 32);
  }
  return objc_msgSend((id)objc_msgSend(v2, "delegate"), "vcSession:participantID:remoteAudioPausedDidChange:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 48));
}

- (void)vcSessionParticipant:(id)a3 remoteVideoPausedDidChange:(BOOL)a4
{
  NSObject *notificationQueue;
  uint64_t v7;
  NSObject *sessionQueue;
  _QWORD v9[6];
  _QWORD block[6];
  BOOL v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  notificationQueue = self->_notificationQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__VCSession_vcSessionParticipant_remoteVideoPausedDidChange___block_invoke;
  block[3] = &unk_1E9E52210;
  block[4] = self;
  block[5] = a3;
  v11 = a4;
  dispatch_async(notificationQueue, block);
  sessionQueue = self->_sessionQueue;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __61__VCSession_vcSessionParticipant_remoteVideoPausedDidChange___block_invoke_2;
  v9[3] = &unk_1E9E52238;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(sessionQueue, v9);
}

uint64_t __61__VCSession_vcSessionParticipant_remoteVideoPausedDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reportingSessionRemoteParticipantEvent:withParticipant:value:", 177, *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:remoteVideoPausedDidChange:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteVideoDidPause:streamToken:", *(unsigned __int8 *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "participantVideoToken"));
}

uint64_t __61__VCSession_vcSessionParticipant_remoteVideoPausedDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mediaStateChangedForParticipant:", *(_QWORD *)(a1 + 40));
}

- (void)vcSessionParticipant:(id)a3 didChangeMediaPriority:(unsigned __int8)a4 description:(id)a5
{
  NSObject *notificationQueue;
  _QWORD block[7];
  unsigned __int8 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__VCSession_vcSessionParticipant_didChangeMediaPriority_description___block_invoke;
  block[3] = &unk_1E9E53608;
  block[4] = self;
  block[5] = a3;
  v7 = a4;
  block[6] = a5;
  dispatch_async(notificationQueue, block);
}

uint64_t __69__VCSession_vcSessionParticipant_didChangeMediaPriority_description___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 616))
  {
    v1 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = objc_msgSend(*(id *)(v1 + 40), "uuid");
        v5 = *(unsigned __int8 *)(v1 + 56);
        v6 = *(_QWORD *)(v1 + 48);
        v7 = 136316418;
        v8 = v2;
        v9 = 2080;
        v10 = "-[VCSession vcSessionParticipant:didChangeMediaPriority:description:]_block_invoke";
        v11 = 1024;
        v12 = 1388;
        v13 = 2112;
        v14 = v4;
        v15 = 1024;
        v16 = v5;
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Participant=%@ didChangeMediaPriority=%d, description=%@", (uint8_t *)&v7, 0x36u);
      }
    }
    return objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "delegate"), "vcSession:participantID:didChangeMediaPriority:description:", *(_QWORD *)(v1 + 32), objc_msgSend(*(id *)(v1 + 40), "uuid"), *(unsigned __int8 *)(v1 + 56), *(_QWORD *)(v1 + 48));
  }
  return result;
}

- (void)vcSessionParticipant:(id)a3 didChangeActualNetworkBitrateForStreamGroupID:(unsigned int)a4
{
  -[VCSessionDownlinkBandwidthAllocator client:didActualNetworkBitrateChangeForStreamGroupID:](self->_downlinkBandwidthAllocator, "client:didActualNetworkBitrateChangeForStreamGroupID:", a3, *(_QWORD *)&a4);
}

- (void)vcSessionParticipant:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 streamGroupID:(unsigned int)a5 firType:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[3];
  _QWORD v14[3];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v16 = v11;
      v17 = 2080;
      v18 = "-[VCSession vcSessionParticipant:requestKeyFrameGenerationWithStreamID:streamGroupID:firType:]";
      v19 = 1024;
      v20 = 1399;
      v21 = 2112;
      v22 = objc_msgSend(a3, "uuid");
      v23 = 1024;
      v24 = v8;
      v25 = 1024;
      v26 = v6;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Participant:%@ requestKeyFrameGenerationWithStreamID:%d FIRType:%d", buf, 0x32u);
    }
  }
  v14[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v8, CFSTR("VCSessionMessageStreamID"));
  v13[1] = CFSTR("VCSessionMessageFIRType");
  v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v13[2] = CFSTR("VCSessionMesageStreamGroupID");
  v14[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3), CFSTR("VCSessionMessageTopicGenerateKeyFrame"), objc_msgSend(a3, "idsParticipantID"));
  -[VCSession reportingSessionParticipantEvent:withParticipant:streamGroupID:streamID:](self, "reportingSessionParticipantEvent:withParticipant:streamGroupID:streamID:", 232, a3, v7, v8);
}

- (void)vcSessionParticipant:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5
{
  NSObject *sessionQueue;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__VCSession_vcSessionParticipant_didSwitchFromStreamID_toStreamID___block_invoke;
  v6[3] = &unk_1E9E521C0;
  v6[4] = self;
  dispatch_async(sessionQueue, v6);
}

_BYTE *__67__VCSession_vcSessionParticipant_didSwitchFromStreamID_toStreamID___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[409])
    return (_BYTE *)objc_msgSend(result, "distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:", 1);
  return result;
}

- (void)vcSessionParticipant:(id)a3 didRequestVideoRedundancy:(BOOL)a4
{
  NSObject *sessionQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__VCSession_vcSessionParticipant_didRequestVideoRedundancy___block_invoke;
  v5[3] = &unk_1E9E52210;
  v6 = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(sessionQueue, v5);
}

uint64_t __60__VCSession_vcSessionParticipant_didRequestVideoRedundancy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 409))
  {
    objc_msgSend((id)v2, "distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:", 0);
    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(a1 + 48))
    v3 = CFSTR("VCSessionMessageVideoRedundancyRequested");
  else
    v3 = CFSTR("VCSessionMessageVideoRedundancyDismissed");
  return objc_msgSend(*(id *)(v2 + 224), "sendMessage:withTopic:participantID:", v3, CFSTR("VCSessionMessageTopicVideoRedundancyState"), objc_msgSend(*(id *)(a1 + 40), "idsParticipantID"));
}

- (void)vcSessionParticipantDidChangeSendingStreams:(id)a3
{
  NSObject *sessionQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__VCSession_vcSessionParticipantDidChangeSendingStreams___block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(sessionQueue, v4);
}

uint64_t __57__VCSession_vcSessionParticipantDidChangeSendingStreams___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setExpectedBitrate:", objc_msgSend(*(id *)(a1 + 32), "calculateExpectedTotalNetworkBitrateUplink"));
}

- (void)vcSessionParticipantDidChangeReceivingStreams:(id)a3
{
  NSObject *sessionQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__VCSession_vcSessionParticipantDidChangeReceivingStreams___block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(sessionQueue, v4);
}

uint64_t __59__VCSession_vcSessionParticipantDidChangeReceivingStreams___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setExpectedBitrate:", objc_msgSend(*(id *)(a1 + 32), "calculateExpectedTotalNetworkBitrateDownlink"));
}

- (void)vcSessionParticipantDidMediaDecryptionTimeOut:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VCSession_vcSessionParticipantDidMediaDecryptionTimeOut___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

void __59__VCSession_vcSessionParticipantDidMediaDecryptionTimeOut___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BYTE v25[24];
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() != *(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_12;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_DWORD *)(v13 + 168);
    v15 = objc_msgSend(*(id *)(a1 + 40), "uuid");
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472);
    *(_DWORD *)buf = 136316930;
    v19 = v11;
    v20 = 2080;
    v21 = "-[VCSession vcSessionParticipantDidMediaDecryptionTimeOut:]_block_invoke";
    v22 = 1024;
    v23 = 1442;
    v24 = 2112;
    *(_QWORD *)v25 = v2;
    *(_WORD *)&v25[8] = 2048;
    *(_QWORD *)&v25[10] = v13;
    *(_WORD *)&v25[18] = 1024;
    *(_DWORD *)&v25[20] = v14;
    v26 = 2112;
    v27 = v15;
    v28 = 2048;
    v29 = v16;
    v8 = "VCSession [%s] %s:%d %@(%p) Session State:%d, Participant:%@, sessionStartTime:%f";
    v9 = v12;
    v10 = 74;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168);
      v6 = objc_msgSend(*(id *)(a1 + 40), "uuid");
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472);
      *(_DWORD *)buf = 136316418;
      v19 = v3;
      v20 = 2080;
      v21 = "-[VCSession vcSessionParticipantDidMediaDecryptionTimeOut:]_block_invoke";
      v22 = 1024;
      v23 = 1442;
      v24 = 1024;
      *(_DWORD *)v25 = v5;
      *(_WORD *)&v25[4] = 2112;
      *(_QWORD *)&v25[6] = v6;
      *(_WORD *)&v25[14] = 2048;
      *(_QWORD *)&v25[16] = v7;
      v8 = "VCSession [%s] %s:%d Session State:%d, Participant:%@, sessionStartTime:%f";
      v9 = v4;
      v10 = 54;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
LABEL_12:
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 168) == 3)
  {
    v17 = micro() - *(double *)(*(_QWORD *)(a1 + 32) + 472);
    if (v17 < (double)+[GKSConnectivitySettings getNewSessionJoiningInterval](GKSConnectivitySettings, "getNewSessionJoiningInterval"))objc_msgSend(*(id *)(a1 + 32), "dispatchedStopWithError:", +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 12, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 1446), 0));
  }
}

- (void)vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__VCSession_vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

void __73__VCSession_vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _BYTE *v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BYTE v30[24];
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() != *(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_12;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_DWORD *)(v13 + 168);
    v15 = objc_msgSend(*(id *)(a1 + 40), "uuid");
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472);
    *(_DWORD *)buf = 136316930;
    v24 = v11;
    v25 = 2080;
    v26 = "-[VCSession vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery:]_block_invoke";
    v27 = 1024;
    v28 = 1455;
    v29 = 2112;
    *(_QWORD *)v30 = v2;
    *(_WORD *)&v30[8] = 2048;
    *(_QWORD *)&v30[10] = v13;
    *(_WORD *)&v30[18] = 1024;
    *(_DWORD *)&v30[20] = v14;
    v31 = 2112;
    v32 = v15;
    v33 = 2048;
    v34 = v16;
    v8 = "VCSession [%s] %s:%d %@(%p) Session State:%d, Participant:%@, sessionStartTime:%f";
    v9 = v12;
    v10 = 74;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168);
      v6 = objc_msgSend(*(id *)(a1 + 40), "uuid");
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472);
      *(_DWORD *)buf = 136316418;
      v24 = v3;
      v25 = 2080;
      v26 = "-[VCSession vcSessionParticipantDidMediaDecryptionTimeOutForMKMRecovery:]_block_invoke";
      v27 = 1024;
      v28 = 1455;
      v29 = 1024;
      *(_DWORD *)v30 = v5;
      *(_WORD *)&v30[4] = 2112;
      *(_QWORD *)&v30[6] = v6;
      *(_WORD *)&v30[14] = 2048;
      *(_QWORD *)&v30[16] = v7;
      v8 = "VCSession [%s] %s:%d Session State:%d, Participant:%@, sessionStartTime:%f";
      v9 = v4;
      v10 = 54;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
LABEL_12:
  v17 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v17 + 168) == 3)
  {
    v18 = *(void **)(v17 + 320);
    v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "idsParticipantID", *(double *)(v17 + 472)));
    objc_msgSend(v18, "startMKMRecoveryForParticipantIDs:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1));
    v19 = *(_BYTE **)(a1 + 32);
    if (!v19[409])
    {
      objc_msgSend(v19, "reportingAgent");
      v20 = CFSTR("VCSPUUID");
      v21 = objc_msgSend(*(id *)(a1 + 40), "uuid");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      reportingGenericEvent();
    }
  }
}

- (void)vcSessionParticipantDidRemoteMediaStallTimeout:(id)a3 duration:(double)a4
{
  NSObject *sessionQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__VCSession_vcSessionParticipantDidRemoteMediaStallTimeout_duration___block_invoke;
  v5[3] = &unk_1E9E53820;
  *(double *)&v5[6] = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(sessionQueue, v5);
}

uint64_t __69__VCSession_vcSessionParticipantDidRemoteMediaStallTimeout_duration___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  __CFDictionary *Mutable;
  BOOL BoolValueForKey;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 409))
    return result;
  if (*(double *)(a1 + 48) >= 10.0 && !*(_BYTE *)(result + 685))
  {
    v3 = objc_msgSend((id)result, "detailedErrorCodeForNoRemotePacketsError");
    if (v3 == 25)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 136315906;
          v24 = v7;
          v25 = 2080;
          v26 = "-[VCSession vcSessionParticipantDidRemoteMediaStallTimeout:duration:]_block_invoke";
          v27 = 1024;
          v28 = 1480;
          v29 = 2048;
          v30 = v9;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Call is stalling for=%f seconds and only WLAN links are available", buf, 0x26u);
        }
      }
    }
    else
    {
      if (v3 == 24)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v4 = VRTraceErrorLogLevelToCSTR();
          v5 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v6 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 136315906;
            v24 = v4;
            v25 = 2080;
            v26 = "-[VCSession vcSessionParticipantDidRemoteMediaStallTimeout:duration:]_block_invoke";
            v27 = 1024;
            v28 = 1476;
            v29 = 2048;
            v30 = v6;
            _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Call is stalling for=%f seconds and no links available", buf, 0x26u);
          }
        }
        goto LABEL_17;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 136315906;
          v24 = v10;
          v25 = 2080;
          v26 = "-[VCSession vcSessionParticipantDidRemoteMediaStallTimeout:duration:]_block_invoke";
          v27 = 1024;
          v28 = 1483;
          v29 = 2048;
          v30 = v12;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Call is stalling for=%f seconds and cellular links are available", buf, 0x26u);
        }
      }
    }
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeyParticipantID"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 40), "idsParticipantID")));
    reportingSymptom();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 685) = 1;
    CFRelease(Mutable);
  }
LABEL_17:
  BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("disableFacetimeTimeout"), 0);
  v15 = *(double *)(a1 + 48);
  result = *(_QWORD *)(a1 + 32);
  if (v15 < *(double *)(result + 648) || BoolValueForKey)
  {
    v17 = *(double *)(result + 392);
    if (v15 < v17 || *(_BYTE *)(result + 411))
    {
      if (v15 < v17 && *(_BYTE *)(result + 411))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v24 = v18;
            v25 = 2080;
            v26 = "-[VCSession vcSessionParticipantDidRemoteMediaStallTimeout:duration:]_block_invoke";
            v27 = 1024;
            v28 = 1503;
            _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Call is no longer stalling", buf, 0x1Cu);
          }
        }
        return objc_msgSend(*(id *)(a1 + 32), "setIsOneToOneRemoteMediaStalling:", 0);
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v22 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 136315906;
          v24 = v20;
          v25 = 2080;
          v26 = "-[VCSession vcSessionParticipantDidRemoteMediaStallTimeout:duration:]_block_invoke";
          v27 = 1024;
          v28 = 1499;
          v29 = 2048;
          v30 = v22;
          _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Call is stalling for %f seconds trying to reconnect", buf, 0x26u);
        }
      }
      result = objc_msgSend(*(id *)(a1 + 32), "setIsOneToOneRemoteMediaStalling:", 1);
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 685) = 0;
    }
  }
  else
  {
    v16 = objc_msgSend((id)result, "detailedErrorCodeForNoRemotePacketsError");
    return objc_msgSend(*(id *)(a1 + 32), "dispatchedStopWithError:", +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", v16, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 1496), (uint64_t)*(double *)(a1 + 48)));
  }
  return result;
}

- (void)vcSessionParticipant:(id)a3 oneToOneModeDidChange:(BOOL)a4
{
  uint64_t v6;
  NSObject *v7;
  NSObject *sessionQueue;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = v6;
      v13 = 2080;
      v14 = "-[VCSession vcSessionParticipant:oneToOneModeDidChange:]";
      v15 = 1024;
      v16 = 1511;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Received signal from the remote side to switch oneToOneMode", buf, 0x1Cu);
    }
  }
  sessionQueue = self->_sessionQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__VCSession_vcSessionParticipant_oneToOneModeDidChange___block_invoke;
  v9[3] = &unk_1E9E521E8;
  v9[4] = self;
  v10 = a4;
  dispatch_async(sessionQueue, v9);
}

uint64_t __56__VCSession_vcSessionParticipant_oneToOneModeDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:", *(unsigned __int8 *)(a1 + 40), 0, 0);
}

- (void)vcSessionParticipant:(id)a3 didDetectError:(id)a4
{
  NSObject *notificationQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  notificationQueue = self->_notificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__VCSession_vcSessionParticipant_didDetectError___block_invoke;
  v5[3] = &unk_1E9E527D0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(notificationQueue, v5);
}

uint64_t __49__VCSession_vcSessionParticipant_didDetectError___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:didDetectError:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(_QWORD *)(a1 + 48));
}

- (void)vcSessionParticipant:(id)a3 mediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5 didSucceed:(BOOL)a6 error:(id)a7
{
  NSObject *sessionQueue;
  _QWORD v8[7];
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke;
  v8[3] = &unk_1E9E562E8;
  v11 = a6;
  v8[4] = a3;
  v8[5] = self;
  v9 = a5;
  v10 = a4;
  v8[6] = a7;
  dispatch_async(sessionQueue, v8);
}

void __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke(int32x2_t *a1)
{
  _QWORD *v2;
  int32x2_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int32x2_t v9;
  int32x2_t v10;
  NSObject *v11;
  __int32 v12;
  __int32 v13;
  int32x2_t v14;
  int32x2_t v15;
  int32x2_t v16;
  _QWORD block[8];
  __int8 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int32x2_t v28;
  __int16 v29;
  __int32 v30;
  __int16 v31;
  __int32 v32;
  __int16 v33;
  int32x2_t v34;
  __int16 v35;
  int32x2_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a1[8].i8[0])
  {
    v3 = a1[4];
    v2 = (_QWORD *)a1[5];
    if (*(_QWORD *)&v3 == v2[30])
    {
      objc_msgSend(v2, "broadcastMediaStateUpdateMessage");
      objc_msgSend(*(id *)&a1[5], "updateVCMediaQueueForMediaType:mediaState:", a1[7].u32[0], a1[7].u32[1]);
    }
    else
    {
      objc_msgSend(v2, "mediaStateChangedForParticipant:");
    }
  }
  else if (objc_opt_class() == *(_QWORD *)&a1[5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke_cold_1(v5, (uint64_t)a1, v6);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)objc_msgSend(*(id *)&a1[5], "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v13 = a1[7].i32[0];
        v12 = a1[7].i32[1];
        v15 = a1[4];
        v14 = a1[5];
        v16 = a1[6];
        *(_DWORD *)buf = 136317186;
        v20 = v7;
        v21 = 2080;
        v22 = "-[VCSession vcSessionParticipant:mediaStateDidChange:forMediaType:didSucceed:error:]_block_invoke";
        v23 = 1024;
        v24 = 1533;
        v25 = 2112;
        v26 = v4;
        v27 = 2048;
        v28 = v14;
        v29 = 1024;
        v30 = v12;
        v31 = 1024;
        v32 = v13;
        v33 = 2112;
        v34 = v15;
        v35 = 2112;
        v36 = v16;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) Error updating media state=%d for media type=%d, participant=%@, error=%@", buf, 0x50u);
      }
    }
  }
  v10 = a1[4];
  v9 = a1[5];
  v11 = *(NSObject **)(*(_QWORD *)&v9 + 184);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke_184;
  block[3] = &unk_1E9E562E8;
  block[1] = 3221225472;
  block[4] = v9;
  block[5] = v10;
  block[7] = vrev64_s32(a1[7]);
  v18 = a1[8].i8[0];
  block[6] = a1[6];
  dispatch_async(v11, block);
}

uint64_t __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke_184(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:mediaStateDidChange:forMediaType:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48));
}

- (void)vcSessionParticipant:(id)a3 remoteMediaStateDidChange:(unsigned int)a4 forMediaType:(unsigned int)a5
{
  NSObject *sessionQueue;
  _QWORD v6[6];
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__VCSession_vcSessionParticipant_remoteMediaStateDidChange_forMediaType___block_invoke;
  v6[3] = &unk_1E9E53820;
  v6[4] = self;
  v6[5] = a3;
  v7 = a4;
  v8 = a5;
  dispatch_async(sessionQueue, v6);
}

void __73__VCSession_vcSessionParticipant_remoteMediaStateDidChange_forMediaType___block_invoke(uint64_t a1)
{
  __int128 v2;
  NSObject *v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "mediaStateChangedForParticipant:", *(_QWORD *)(a1 + 40));
  v2 = *(_OWORD *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 184);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__VCSession_vcSessionParticipant_remoteMediaStateDidChange_forMediaType___block_invoke_2;
  v4[3] = &unk_1E9E53820;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 48);
  dispatch_async(v3, v4);
}

uint64_t __73__VCSession_vcSessionParticipant_remoteMediaStateDidChange_forMediaType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:remoteMediaStateDidChange:forMediaType:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
}

- (void)vcSessionParticipant:(id)a3 mediaMixingDidChangeForMediaType:(unsigned int)a4 mixingMediaType:(unsigned int)a5
{
  NSObject *sessionQueue;
  _QWORD v6[6];
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__VCSession_vcSessionParticipant_mediaMixingDidChangeForMediaType_mixingMediaType___block_invoke;
  v6[3] = &unk_1E9E53820;
  v6[4] = a3;
  v6[5] = self;
  v7 = a4;
  v8 = a5;
  dispatch_async(sessionQueue, v6);
}

void __83__VCSession_vcSessionParticipant_mediaMixingDidChangeForMediaType_mixingMediaType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3 == *(_QWORD *)(v2 + 240))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136315650;
      v16 = v5;
      v17 = 2080;
      v18 = "-[VCSession vcSessionParticipant:mediaMixingDidChangeForMediaType:mixingMediaType:]_block_invoke";
      v19 = 1024;
      v20 = 1553;
      v7 = "VCSession [%s] %s:%d Broadcasting mediaMixingDidChangeForMediaType state";
      v8 = v6;
      v9 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v16 = v10;
      v17 = 2080;
      v18 = "-[VCSession vcSessionParticipant:mediaMixingDidChangeForMediaType:mixingMediaType:]_block_invoke";
      v19 = 1024;
      v20 = 1553;
      v21 = 2112;
      v22 = v4;
      v23 = 2048;
      v24 = v12;
      v7 = "VCSession [%s] %s:%d %@(%p) Broadcasting mediaMixingDidChangeForMediaType state";
      v8 = v11;
      v9 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_13:
    objc_msgSend(*(id *)(a1 + 40), "broadcastMediaStateUpdateMessage");
    v3 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD *)(a1 + 40);
  }
  v13 = *(NSObject **)(v2 + 184);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__VCSession_vcSessionParticipant_mediaMixingDidChangeForMediaType_mixingMediaType___block_invoke_185;
  block[3] = &unk_1E9E53820;
  block[4] = v2;
  block[5] = v3;
  block[6] = *(_QWORD *)(a1 + 48);
  dispatch_async(v13, block);
}

uint64_t __83__VCSession_vcSessionParticipant_mediaMixingDidChangeForMediaType_mixingMediaType___block_invoke_185(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:mixingDidChangeForMediaType:mixingMediaType:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
}

- (void)vcSessionParticipant:(id)a3 reactionDidStart:(id)a4
{
  NSObject *sessionQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VCSession_vcSessionParticipant_reactionDidStart___block_invoke;
  v5[3] = &unk_1E9E527D0;
  v5[4] = a3;
  v5[5] = self;
  v5[6] = a4;
  dispatch_async(sessionQueue, v5);
}

void __51__VCSession_vcSessionParticipant_reactionDidStart___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2 == *(_QWORD *)(v3 + 240))
  {
    v4 = *(_QWORD *)(a1 + 48);
    v29 = CFSTR("VCSessionMessageReactionStarted");
    v30[0] = v4;
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136315906;
      v18 = v7;
      v19 = 2080;
      v20 = "-[VCSession vcSessionParticipant:reactionDidStart:]_block_invoke";
      v21 = 1024;
      v22 = 1566;
      v23 = 2112;
      v24 = v5;
      v9 = "VCSession [%s] %s:%d Broadcasting reactionDidStart status=%@";
      v10 = v8;
      v11 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      v18 = v12;
      v19 = 2080;
      v20 = "-[VCSession vcSessionParticipant:reactionDidStart:]_block_invoke";
      v21 = 1024;
      v22 = 1566;
      v23 = 2112;
      v24 = (uint64_t)v6;
      v25 = 2048;
      v26 = v14;
      v27 = 2112;
      v28 = v5;
      v9 = "VCSession [%s] %s:%d %@(%p) Broadcasting reactionDidStart status=%@";
      v10 = v13;
      v11 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_13:
    objc_msgSend(*(id *)(a1 + 40), "broadcastMessageDictionary:withTopic:", v5, CFSTR("VCSessionMessageReactionStateTopic"));
    objc_msgSend(*(id *)(a1 + 40), "reportingAgent");
    reportingVideoFeatureToggle();
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
  }
  v15 = *(NSObject **)(v3 + 184);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCSession_vcSessionParticipant_reactionDidStart___block_invoke_192;
  block[3] = &unk_1E9E527D0;
  block[4] = v3;
  block[5] = v2;
  block[6] = *(_QWORD *)(a1 + 48);
  dispatch_async(v15, block);
}

uint64_t __51__VCSession_vcSessionParticipant_reactionDidStart___block_invoke_192(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantID:reactionDidStart:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(_QWORD *)(a1 + 48));
}

- (void)vcSessionParticipantDidStopReacting:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCSession_vcSessionParticipantDidStopReacting___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(sessionQueue, block);
}

void __49__VCSession_vcSessionParticipantDidStopReacting___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[6];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3 == *(_QWORD *)(v2 + 240))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136315650;
      v16 = v5;
      v17 = 2080;
      v18 = "-[VCSession vcSessionParticipantDidStopReacting:]_block_invoke";
      v19 = 1024;
      v20 = 1580;
      v7 = "VCSession [%s] %s:%d Broadcasting didStopReacting";
      v8 = v6;
      v9 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v16 = v10;
      v17 = 2080;
      v18 = "-[VCSession vcSessionParticipantDidStopReacting:]_block_invoke";
      v19 = 1024;
      v20 = 1580;
      v21 = 2112;
      v22 = v4;
      v23 = 2048;
      v24 = v12;
      v7 = "VCSession [%s] %s:%d %@(%p) Broadcasting didStopReacting";
      v8 = v11;
      v9 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_13:
    objc_msgSend(*(id *)(a1 + 40), "broadcastMessageDictionary:withTopic:", &unk_1E9EFB308, CFSTR("VCSessionMessageReactionStateTopic"));
    objc_msgSend(*(id *)(a1 + 40), "reportingAgent");
    reportingVideoFeatureToggle();
    v3 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD *)(a1 + 40);
  }
  v13 = *(NSObject **)(v2 + 184);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__VCSession_vcSessionParticipantDidStopReacting___block_invoke_196;
  v14[3] = &unk_1E9E52238;
  v14[4] = v2;
  v14[5] = v3;
  dispatch_async(v13, v14);
}

uint64_t __49__VCSession_vcSessionParticipantDidStopReacting___block_invoke_196(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:participantDidStopReacting:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"));
}

- (void)vcSessionParticipantDidMediaReceiveFlushRequestWithPayloads:(id)a3
{
  if (self->_oneToOneModeEnabled
    && -[VCTransportSession flushBasebandQueueWithPayloads:flushCount:](self->_transportSession, "flushBasebandQueueWithPayloads:flushCount:")&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSession vcSessionParticipantDidMediaReceiveFlushRequestWithPayloads:].cold.1();
  }
}

- (void)serverDidDie
{
  NSObject *sessionQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __25__VCSession_serverDidDie__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(sessionQueue, v3);
}

uint64_t __25__VCSession_serverDidDie__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 808))
  {
    v2 = result;
    *(_BYTE *)(v1 + 808) = 1;
    objc_msgSend(*(id *)(result + 32), "reportingAgent");
    reportingSymptom();
    return objc_msgSend(*(id *)(v2 + 32), "dispatchedStopWithError:didRemoteCancel:", +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 23, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 1622), 0), 0);
  }
  return result;
}

- (void)didReceivedSessionStatsAtTime:(double)a3
{
  VCNetworkFeedbackController *feedbackController;
  _OWORD v5[2];
  int v6;
  __int128 v7;
  __int128 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v7 = 0u;
  v8 = 0u;
  -[VCSession updateNetworkFeedbackControllerReport:](self, "updateNetworkFeedbackControllerReport:", &v7);
  feedbackController = self->_feedbackController;
  v5[0] = v7;
  v5[1] = v8;
  v6 = v9;
  -[VCNetworkFeedbackController sendFeedbackControllerReport:](feedbackController, "sendFeedbackControllerReport:", v5);
}

- (void)updateNetworkFeedbackControllerReport:(id *)a3
{
  unsigned int v5;
  unsigned int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  a3->var0 = self->_currentConnectionType == 3;
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  VCRateControlGetStatistics((uint64_t)-[AVCRateController statisticsCollector](self->_uplinkRateController, "statisticsCollector", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), 5, (uint64_t)&v7);
  v5 = (*(double *)&v9 * 100.0);
  a3->var5 = self->_uplinkTargetBitrate;
  a3->var6 = v5;
  a3->var7 = HIDWORD(v8);
  a3->var8 = -[AVCStatisticsCollector estimatedBandwidthCap](-[AVCRateController statisticsCollector](self->_uplinkRateController, "statisticsCollector"), "estimatedBandwidthCap") != 0;
  VCRateControlGetStatistics((uint64_t)-[AVCRateController statisticsCollector](self->_downlinkRateController, "statisticsCollector"), 5, (uint64_t)&v7);
  v6 = (*(double *)&v9 * 100.0);
  a3->var1 = self->_downlinkTargetBitrate;
  a3->var2 = v6;
  a3->var3 = HIDWORD(v8);
  a3->var4 = -[AVCStatisticsCollector estimatedBandwidthCap](-[AVCRateController statisticsCollector](self->_downlinkRateController, "statisticsCollector"), "estimatedBandwidthCap") != 0;
}

- (void)rateController:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  NSObject *sessionQueue;
  _QWORD v6[6];
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__VCSession_rateController_targetBitrateDidChange_rateChangeCounter___block_invoke;
  v6[3] = &unk_1E9E53820;
  v6[4] = a3;
  v6[5] = self;
  v7 = a4;
  v8 = a5;
  dispatch_async(sessionQueue, v6);
}

void __69__VCSession_rateController_targetBitrateDidChange_rateChangeCounter___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _QWORD block[7];
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[10];
  uint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "statisticsCollector"), "mode") == 4)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 432) = *(_DWORD *)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "updateUplinkTargetBitrate:rateChangeCounter:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
    objc_msgSend(*(id *)(a1 + 40), "reportingSessionParticipantEvent:withParticipant:", 160, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 280), "setClientTargetBitrate:", *(unsigned int *)(a1 + 48));
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(unsigned int *)(v2 + 432);
LABEL_9:
    objc_msgSend((id)v2, "setMediaQueuePeakBitrateWithTargetBitrate:", v3);
    goto LABEL_21;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "statisticsCollector"), "mode") == 5)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_18;
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v7 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 436);
      v8 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 136316162;
      v26 = v5;
      v27 = 2080;
      v28 = "-[VCSession rateController:targetBitrateDidChange:rateChangeCounter:]_block_invoke";
      v29 = 1024;
      v30 = 1663;
      v31 = 1024;
      *(_DWORD *)v32 = v7;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = v8;
      v9 = "VCSession [%s] %s:%d Downlink TargetBitrate changed from %u to %u";
      v10 = v6;
      v11 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_18;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_DWORD *)(v14 + 436);
      v16 = *(_DWORD *)(a1 + 48);
      *(_DWORD *)buf = 136316674;
      v26 = v12;
      v27 = 2080;
      v28 = "-[VCSession rateController:targetBitrateDidChange:rateChangeCounter:]_block_invoke";
      v29 = 1024;
      v30 = 1663;
      v31 = 2112;
      *(_QWORD *)v32 = v4;
      *(_WORD *)&v32[8] = 2048;
      v33 = v14;
      v34 = 1024;
      v35 = v15;
      v36 = 1024;
      v37 = v16;
      v9 = "VCSession [%s] %s:%d %@(%p) Downlink TargetBitrate changed from %u to %u";
      v10 = v13;
      v11 = 60;
    }
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_18:
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 436) = *(_DWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "reportingSessionParticipantEvent:withParticipant:", 181, 0);
    v17 = *(_QWORD *)(a1 + 40);
    if (!*(_BYTE *)(v17 + 409))
    {
      objc_msgSend((id)v17, "distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:", 0);
      v17 = *(_QWORD *)(a1 + 40);
    }
    objc_msgSend(*(id *)(v17 + 280), "setDownlinkTargetBitrate:", *(unsigned int *)(v17 + 436));
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "updateTargetBitrateOneToOne:rateChangeCounter:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v2 + 409))
  {
    v3 = *(unsigned int *)(a1 + 48);
    goto LABEL_9;
  }
LABEL_21:
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "sessionMode") == 2
    || !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "sessionMode"))
  {
    v23[0] = CFSTR("Targetbitrate");
    v24[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
    v23[1] = CFSTR("BandwidthEstimation");
    v24[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "statisticsCollector"), "sharedEstimatedBandwidth"));
    v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v20 = *(_QWORD *)(a1 + 32);
    v19 = *(_QWORD *)(a1 + 40);
    v21 = *(NSObject **)(v19 + 184);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__VCSession_rateController_targetBitrateDidChange_rateChangeCounter___block_invoke_197;
    block[3] = &unk_1E9E527D0;
    block[4] = v20;
    block[5] = v19;
    block[6] = v18;
    dispatch_async(v21, block);
  }
}

uint64_t __69__VCSession_rateController_targetBitrateDidChange_rateChangeCounter___block_invoke_197(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "statisticsCollector"), "mode");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "delegate");
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  if (v2 == 4)
    return objc_msgSend(v3, "vcSession:uplinkRateAdaptationDidChangeWithInfo:", v4, v5);
  else
    return objc_msgSend(v3, "vcSession:downlinkRateAdaptationDidChangeWithInfo:", v4, v5);
}

- (int)learntBitrateForSegment:(id)a3 defaultValue:(int)a4
{
  -[VCObject reportingAgent](self, "reportingAgent");
  return reportingGetLearntBitrateForSegment();
}

- (void)rateController:(id)a3 isECNEnabled:(BOOL)isECNForcedByNetwork isECNCapable:(BOOL)a5
{
  int v6;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 isECNCapable;
  int ecnLinkType;
  _BOOL4 isECNEnabled;
  const char *v14;
  const char *v15;
  char IsOSFaultDisabled;
  _BOOL4 v17;
  int v18;
  _BOOL4 v19;
  const char *v20;
  const char *v21;
  _BOOL4 v22;
  int v23;
  _BOOL4 v24;
  const char *v25;
  const char *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneSettings.rateController == a3 && self->_isECNCapable)
  {
    if (self->_ecnLinkType == 3)
      isECNForcedByNetwork = self->_isECNForcedByNetwork;
    self->_isECNEnabled = isECNForcedByNetwork;
    if (self->_isECNCapable)
    {
      self->_isECNCapable = a5;
      isECNForcedByNetwork = self->_isECNEnabled;
    }
    v6 = VCMediaQueue_SetECNEnabled((uint64_t)self->_mediaQueue, isECNForcedByNetwork);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (!v6 || ErrorLogLevelForModule >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      if (v6)
      {
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          isECNCapable = self->_isECNCapable;
          ecnLinkType = self->_ecnLinkType;
          isECNEnabled = self->_isECNEnabled;
          v27 = 136316674;
          if (isECNCapable)
            v14 = "YES";
          else
            v14 = "NO";
          v28 = v9;
          if (isECNEnabled)
            v15 = "YES";
          else
            v15 = "NO";
          v29 = 2080;
          v30 = "-[VCSession rateController:isECNEnabled:isECNCapable:]";
          v31 = 1024;
          v32 = 1705;
          v33 = 2080;
          v34 = v14;
          v35 = 1024;
          v36 = ecnLinkType;
          v37 = 2080;
          v38 = v15;
          v39 = 2080;
          v40 = "FAILED";
LABEL_30:
          _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d VCRC current ECN status: _isECNCapable=%s and _ecnLinkType=%d, changing ECN status isECNEnabled=%s, VCMediaQueue set isECNEnabled=%s", (uint8_t *)&v27, 0x40u);
        }
      }
      else
      {
        IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
        v10 = *MEMORY[0x1E0CF2758];
        if ((IsOSFaultDisabled & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v17 = self->_isECNCapable;
            v18 = self->_ecnLinkType;
            v19 = self->_isECNEnabled;
            v27 = 136316674;
            if (v17)
              v20 = "YES";
            else
              v20 = "NO";
            v28 = v9;
            if (v19)
              v21 = "YES";
            else
              v21 = "NO";
            v29 = 2080;
            v30 = "-[VCSession rateController:isECNEnabled:isECNCapable:]";
            v31 = 1024;
            v32 = 1705;
            v33 = 2080;
            v34 = v20;
            v35 = 1024;
            v36 = v18;
            v37 = 2080;
            v38 = v21;
            v39 = 2080;
            v40 = "PASS";
            goto LABEL_30;
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          v22 = self->_isECNCapable;
          v23 = self->_ecnLinkType;
          v24 = self->_isECNEnabled;
          v27 = 136316674;
          if (v22)
            v25 = "YES";
          else
            v25 = "NO";
          v28 = v9;
          if (v24)
            v26 = "YES";
          else
            v26 = "NO";
          v29 = 2080;
          v30 = "-[VCSession rateController:isECNEnabled:isECNCapable:]";
          v31 = 1024;
          v32 = 1705;
          v33 = 2080;
          v34 = v25;
          v35 = 1024;
          v36 = v23;
          v37 = 2080;
          v38 = v26;
          v39 = 2080;
          v40 = "PASS";
          _os_log_fault_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_FAULT, "VCSession [%s] %s:%d VCRC current ECN status: _isECNCapable=%s and _ecnLinkType=%d, changing ECN status isECNEnabled=%s, VCMediaQueue set isECNEnabled=%s", (uint8_t *)&v27, 0x40u);
        }
      }
    }
  }
}

- (void)mediaController:(void *)a3 mediaSuggestionDidChange:(VCRateControlMediaSuggestion)a4
{
  int v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  NSSet *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSSet *v16;
  int v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  NSSet *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  NSSet *v27;
  VCRateControlMediaSuggestion v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  VCSession *v38;
  __int16 v39;
  NSSet *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v28 = a4;
  if (self->_oneToOneSettings.mediaController == a3)
  {
    -[VCSessionParticipantLocal setMediaSuggestion:](self->_localParticipant, "setMediaSuggestion:", &v28);
    return;
  }
  if ((*(_DWORD *)&a4.var0 & 0xFF000000) == 0)
  {
    v6 = 0;
    goto LABEL_16;
  }
  v6 = -[VCSession flushBasebandWithPayloads:](self, "flushBasebandWithPayloads:", -[VCSessionParticipantLocal videoPayloadTypes](self->_localParticipant, "videoPayloadTypes"));
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[VCSessionParticipantLocal videoPayloadTypes](self->_localParticipant, "videoPayloadTypes");
        *(_DWORD *)buf = 136316162;
        v30 = v8;
        v31 = 2080;
        v32 = "-[VCSession mediaController:mediaSuggestionDidChange:]";
        v33 = 1024;
        v34 = 1721;
        v35 = 2112;
        v36 = v10;
        v37 = 1024;
        LODWORD(v38) = v6;
        v11 = "VCSession [%s] %s:%d flush baseband for videoPayloads:%@, successfulFlushCount: %d";
        v12 = v9;
        v13 = 44;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = -[VCSessionParticipantLocal videoPayloadTypes](self->_localParticipant, "videoPayloadTypes");
        *(_DWORD *)buf = 136316674;
        v30 = v14;
        v31 = 2080;
        v32 = "-[VCSession mediaController:mediaSuggestionDidChange:]";
        v33 = 1024;
        v34 = 1721;
        v35 = 2112;
        v36 = (void *)v7;
        v37 = 2048;
        v38 = self;
        v39 = 2112;
        v40 = v16;
        v41 = 1024;
        v42 = v6;
        v11 = "VCSession [%s] %s:%d %@(%p) flush baseband for videoPayloads:%@, successfulFlushCount: %d";
        v12 = v15;
        v13 = 64;
        goto LABEL_15;
      }
    }
  }
LABEL_16:
  if ((*(_QWORD *)&a4 & 0xFF00000000) == 0)
    return;
  v17 = -[VCSession flushBasebandWithPayloads:](self, "flushBasebandWithPayloads:", -[VCSessionParticipantLocal audioPayloadTypes](self->_localParticipant, "audioPayloadTypes"))+ v6;
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v21 = -[VCSessionParticipantLocal audioPayloadTypes](self->_localParticipant, "audioPayloadTypes");
        *(_DWORD *)buf = 136316162;
        v30 = v19;
        v31 = 2080;
        v32 = "-[VCSession mediaController:mediaSuggestionDidChange:]";
        v33 = 1024;
        v34 = 1725;
        v35 = 2112;
        v36 = v21;
        v37 = 1024;
        LODWORD(v38) = v17;
        v22 = "VCSession [%s] %s:%d flush baseband for audioPayloads:%@, successfulFlushCount: %d";
        v23 = v20;
        v24 = 44;
LABEL_27:
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v27 = -[VCSessionParticipantLocal audioPayloadTypes](self->_localParticipant, "audioPayloadTypes");
        *(_DWORD *)buf = 136316674;
        v30 = v25;
        v31 = 2080;
        v32 = "-[VCSession mediaController:mediaSuggestionDidChange:]";
        v33 = 1024;
        v34 = 1725;
        v35 = 2112;
        v36 = (void *)v18;
        v37 = 2048;
        v38 = self;
        v39 = 2112;
        v40 = v27;
        v41 = 1024;
        v42 = v17;
        v22 = "VCSession [%s] %s:%d %@(%p) flush baseband for audioPayloads:%@, successfulFlushCount: %d";
        v23 = v26;
        v24 = 64;
        goto LABEL_27;
      }
    }
  }
}

- (int)flushBasebandWithPayloads:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v10;
  int v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(a3);
        v7 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v6);
        v13[0] = CFSTR("transportSessionBasebandQueueFlushPayloadType");
        v13[1] = CFSTR("transportSessionBasebandQueueFlushPayloadTypeFieldOffset");
        v14[0] = v7;
        v14[1] = &unk_1E9EF5390;
        v13[2] = CFSTR("transportSessionBasebandQueueFlushTransactionID");
        v14[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_basebandFlushTransactionID);
        v14[3] = &unk_1E9EF53A8;
        v13[3] = CFSTR("transportSessionBasebandQueueFlushCriterion");
        v13[4] = CFSTR("transportSessionBasebandQueueFlushTimestamp");
        v14[4] = &unk_1E9EF53A8;
        objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v4);
  }
  -[VCTransportSession flushBasebandQueueWithPayloads:flushCount:](self->_transportSession, "flushBasebandQueueWithPayloads:flushCount:", v10, &v12);

  ++self->_basebandFlushTransactionID;
  return v12;
}

- (void)updatePresentationInfo:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__VCSession_updatePresentationInfo___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __36__VCSession_updatePresentationInfo___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = (void *)VCVideoCaptureServer_CopyLocalVideoAttributes((uint64_t)+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"));
  v3 = objc_msgSend(v2, "orientation");

  VCSpatialAudioMetadata_UpdateOrientation(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 632), v3);
  if (*(_QWORD *)(a1 + 40) && (v4 = *(void **)(*(_QWORD *)(a1 + 32) + 720)) != 0)
  {
    objc_msgSend(v4, "unserialize:");
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 720), "hasPendingChanges");
    v6 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      VCSpatialAudioMetadata_UpdateGlobalInfo(*(_QWORD *)(v6 + 632), (__int128 *)objc_msgSend(*(id *)(v6 + 720), "metadataGlobalInfo"));
      v6 = *(_QWORD *)(a1 + 32);
      if (!*(_BYTE *)(v6 + 409))
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v7 = (void *)objc_msgSend((id)v6, "remoteParticipants");
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v24 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              objc_msgSend(v12, "setPresentationState:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 720), "uiState"));
              objc_msgSend(v12, "updateShouldEnableMLEnhance");
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
          }
          while (v9);
        }
        objc_msgSend(*(id *)(a1 + 32), "distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:", 0);
        v6 = *(_QWORD *)(a1 + 32);
      }
    }
    objc_msgSend((id)v6, "updateParticipantWindowState");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315650;
      v17 = v13;
      v18 = 2080;
      v19 = "-[VCSession updatePresentationInfo:]_block_invoke";
      v20 = 1024;
      v21 = 1775;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d [AVC SPATIAL AUDIO] Presentation info is nil", (uint8_t *)&v16, 0x1Cu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "applySpatialMetadata");
}

- (void)applySpatialMetadata
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSession applySpatialMetadata]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d [AVC SPATIAL AUDIO] Serialization failed. result=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSession applySpatialMetadata]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __33__VCSession_applySpatialMetadata__block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a2 < 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 176);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__VCSession_applySpatialMetadata__block_invoke_2;
    block[3] = &unk_1E9E521C0;
    block[4] = v4;
    dispatch_async(v5, block);
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __33__VCSession_applySpatialMetadata__block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v9 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136316418;
          v12 = v7;
          v13 = 2080;
          v14 = "-[VCSession applySpatialMetadata]_block_invoke";
          v15 = 1024;
          v16 = 1800;
          v17 = 2112;
          v18 = v6;
          v19 = 2048;
          v20 = v9;
          v21 = 1024;
          v22 = a2;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) [AVC SPATIAL AUDIO] Failed to apply the spatial metadata. result=%08x", buf, 0x36u);
        }
      }
    }
  }
}

uint64_t __33__VCSession_applySpatialMetadata__block_invoke_2(uint64_t a1)
{
  return VCSpatialAudioMetadata_SetNeedsRefresh(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 632));
}

- (BOOL)isTLEEnabledOnPrimaryConnection
{
  const void *v2;
  BOOL IsQUICPod;

  v2 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    IsQUICPod = VCConnectionIDS_IsQUICPod((uint64_t)v2);
    if (!v2)
      return IsQUICPod;
    goto LABEL_5;
  }
  IsQUICPod = 0;
  if (v2)
LABEL_5:
    CFRelease(v2);
  return IsQUICPod;
}

- (void)sendDeviceStateMessageToParticipant:(id)a3 withStatus:(id)a4
{
  int v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_isDNUCollectionEnabled)
  {
    objc_msgSend(a3, "capabilities");
    if (v7 != 1)
    {
      v12 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("Thermal"));
      -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1), CFSTR("VCSessionMessageTopicDeviceState"), objc_msgSend(a3, "idsParticipantID"));
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v10 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v14 = v8;
        v15 = 2080;
        v16 = "-[VCSession sendDeviceStateMessageToParticipant:withStatus:]";
        v17 = 1024;
        v18 = 1820;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Diagnostics collection is off", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[VCSession sendDeviceStateMessageToParticipant:withStatus:].cold.1();
    }
  }
}

- (void)sendNetworkCapabilitiesMessageToParticipant:(id)a3
{
  int v5;
  int *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[7];

  v11[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "capabilities");
  if (v5 != 1)
  {
    if (self->_oneToOneModeEnabled)
      v6 = &OBJC_IVAR___VCSession__oneToOneSettings;
    else
      v6 = &OBJC_IVAR___VCSession__uplinkRateController;
    v7 = *(Class *)((char *)&self->super.super.isa + *v6);
    v10[0] = CFSTR("RCEV");
    v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "rateControlExperimentConfig"));
    v10[1] = CFSTR("RCEG");
    v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unint64_t)objc_msgSend(v7, "rateControlExperimentConfig") >> 32);
    v10[2] = CFSTR("SBVERS");
    v8 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "rateControlExperimentConfig");
    v11[2] = objc_msgSend(v8, "numberWithUnsignedInt:", v9);
    v10[3] = CFSTR("RULRTX");
    v11[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUplinkRetransmissionForVideoEnabled);
    v10[4] = CFSTR("RTLE");
    v11[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCSession isTLEEnabledOnPrimaryConnection](self, "isTLEEnabledOnPrimaryConnection"));
    v10[5] = CFSTR("MQSchP");
    v11[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mediaQueueConfiguration.schedulePolicy);
    -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 6), CFSTR("VCSessionMessageTopicRateControlConfig"), objc_msgSend(a3, "idsParticipantID"));
  }
}

- (void)updateParticipantWindowState
{
  uint64_t v3;
  VCSessionPresentationInfo *presentationInfo;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v3 = -[VCSessionPresentationInfo uiState](self->_presentationInfo, "uiState");
  presentationInfo = self->_presentationInfo;
  if (presentationInfo)
  {
    -[VCSessionPresentationInfo avcSessionPresentationInfo](presentationInfo, "avcSessionPresentationInfo");
    v5 = v16;
    v6 = v15;
    v7 = v18;
    v8 = v17;
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
  }
  -[VCSessionParticipantLocal updateWindowState:isLocal:windowRect:](self->_localParticipant, "updateWindowState:isLocal:windowRect:", v3, 1, v6, v5, v8, v7);
  v9 = objc_alloc(MEMORY[0x1E0C99D80]);
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v14 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, CFSTR("VCWindowState"), v11, CFSTR("VCWindowOriginX"), v12, CFSTR("VCWindowOriginY"), v13, CFSTR("VCWindowWidth"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7), CFSTR("VCWindowHeight"), 0);
  if (-[VCSession oneToOneModeEnabled](self, "oneToOneModeEnabled")
    && -[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"))
  {
    -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", v14, CFSTR("VCWindowStateChange"), -[VCSessionParticipant idsParticipantID](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "idsParticipantID"));
  }

}

- (void)updateParticipantConfigurations:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCSession_updateParticipantConfigurations___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

_BYTE *__45__VCSession_updateParticipantConfigurations___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BYTE *result;
  _BYTE *v19;
  char v20;
  uint64_t v21;
  _BYTE *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_18;
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    v5 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v6 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      v34 = v3;
      v35 = 2080;
      v36 = "-[VCSession updateParticipantConfigurations:]_block_invoke";
      v37 = 1024;
      v38 = 1873;
      v39 = 2112;
      v40 = v6;
      v7 = "VCSession [%s] %s:%d %@";
      v8 = v4;
      v9 = 38;
LABEL_13:
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      goto LABEL_18;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __45__VCSession_updateParticipantConfigurations___block_invoke_cold_1();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v12 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          goto LABEL_18;
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v34 = v10;
        v35 = 2080;
        v36 = "-[VCSession updateParticipantConfigurations:]_block_invoke";
        v37 = 1024;
        v38 = 1873;
        v39 = 2112;
        v40 = v2;
        v41 = 2048;
        v42 = v13;
        v43 = 2112;
        v44 = v14;
        v7 = "VCSession [%s] %s:%d %@(%p) %@";
        v8 = v11;
        v9 = 58;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v34 = v10;
        v35 = 2080;
        v36 = "-[VCSession updateParticipantConfigurations:]_block_invoke";
        v37 = 1024;
        v38 = 1873;
        v39 = 2112;
        v40 = v2;
        v41 = 2048;
        v42 = v15;
        v43 = 2112;
        v44 = v16;
        _os_log_debug_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEBUG, "VCSession [%s] %s:%d %@(%p) %@", buf, 0x3Au);
      }
    }
  }
LABEL_18:
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = *(void **)(a1 + 40);
  result = (_BYTE *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (result)
  {
    v19 = result;
    v20 = 0;
    v21 = *(_QWORD *)v30;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v22);
        v24 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "objectForKeyedSubscript:", objc_msgSend(v23, "uuid"));
        v25 = objc_msgSend(v23, "videoQuality");
        if (v25 != objc_msgSend(v24, "videoQuality"))
        {
          objc_msgSend(v24, "setVideoQuality:", objc_msgSend(v23, "videoQuality"));
          v20 = 1;
        }
        v26 = objc_msgSend(v24, "visibilityIndex");
        if (v26 != objc_msgSend(v23, "visibilityIndex"))
        {
          objc_msgSend(v24, "setVisibilityIndex:", objc_msgSend(v23, "visibilityIndex"));
          v20 = 1;
        }
        v27 = objc_msgSend(v24, "prominenceIndex");
        if (v27 != objc_msgSend(v23, "prominenceIndex"))
        {
          objc_msgSend(v24, "setProminenceIndex:", objc_msgSend(v23, "prominenceIndex"));
          v20 = 1;
        }
        objc_msgSend(v24, "updatePositionalInfo:shouldReapply:", objc_msgSend(v23, "positionalInfo"), 0);
        ++v22;
      }
      while (v19 != v22);
      result = (_BYTE *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
      v19 = result;
    }
    while (result);
    if ((v20 & 1) != 0)
    {
      result = *(_BYTE **)(a1 + 32);
      if (!result[409])
        return (_BYTE *)objc_msgSend(result, "distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:", 1);
    }
  }
  return result;
}

- (void)distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:(BOOL)a3
{
  VCSession *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  VCSession *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  unsigned int downlinkTargetBitrate;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  unsigned int v32;
  int *v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  char v41;
  _BOOL8 v42;
  id obj;
  _BOOL4 v44;
  void *v45;
  _BYTE v46[128];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  const __CFString *v63;
  __int16 v64;
  VCSession *v65;
  __int16 v66;
  _BOOL4 v67;
  uint64_t v68;

  v44 = a3;
  v3 = self;
  v68 = *MEMORY[0x1E0C80C00];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v57 = v5;
        v58 = 2080;
        v59 = "-[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:]";
        v60 = 1024;
        v61 = 1900;
        v62 = 1024;
        LODWORD(v63) = v44;
        v7 = "VCSession [%s] %s:%d forceSeamLess:%d";
        v8 = v6;
        v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCSession performSelector:](v3, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v57 = v10;
        v58 = 2080;
        v59 = "-[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:]";
        v60 = 1024;
        v61 = 1900;
        v62 = 2112;
        v63 = v4;
        v64 = 2048;
        v65 = v3;
        v66 = 1024;
        v67 = v44;
        v7 = "VCSession [%s] %s:%d %@(%p) forceSeamLess:%d";
        v8 = v11;
        v9 = 54;
        goto LABEL_11;
      }
    }
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](-[VCSession remoteParticipants](v3, "remoteParticipants"), "count"));
  v13 = -[VCSessionDownlinkBandwidthAllocator distributeBitrate:](v3->_downlinkBandwidthAllocator, "distributeBitrate:", v3->_downlinkTargetBitrate);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v45 = v13;
  obj = (id)objc_msgSend(v13, "allKeys");
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v53 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        v19 = v3;
        v20 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v3->_remoteParticipantsMapByUUID, "objectForKeyedSubscript:", v18);
        v21 = objc_msgSend(v20, "recommendedStreamIDsForSelectedMediaEntries:forceSeamlessTransition:", objc_msgSend(v45, "objectForKeyedSubscript:", v18), v44);
        v22 = v20;
        v3 = v19;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v22, "idsParticipantID")));
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
    }
    while (v15);
  }
  if ((-[NSMutableDictionary isEqualToDictionary:](v3->_optInDictionary, "isEqualToDictionary:", v12) & 1) == 0)
  {
    if ((VCSession *)objc_opt_class() == v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_31;
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      downlinkTargetBitrate = v3->_downlinkTargetBitrate;
      *(_DWORD *)buf = 136315906;
      v57 = v24;
      v58 = 2080;
      v59 = "-[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:]";
      v60 = 1024;
      v61 = 1912;
      v62 = 1024;
      LODWORD(v63) = downlinkTargetBitrate;
      v27 = "VCSession [%s] %s:%d New opt-in dictionary for new downlink target bitrate:[%u]";
      v28 = v25;
      v29 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = (const __CFString *)-[VCSession performSelector:](v3, "performSelector:", sel_logPrefix);
      else
        v23 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_31;
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      v32 = v3->_downlinkTargetBitrate;
      *(_DWORD *)buf = 136316418;
      v57 = v30;
      v58 = 2080;
      v59 = "-[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:]";
      v60 = 1024;
      v61 = 1912;
      v62 = 2112;
      v63 = v23;
      v64 = 2048;
      v65 = v3;
      v66 = 1024;
      v67 = v32;
      v27 = "VCSession [%s] %s:%d %@(%p) New opt-in dictionary for new downlink target bitrate:[%u]";
      v28 = v31;
      v29 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
LABEL_31:
    objc_msgSend((id)-[VCTransportSession sessionInfoSynchronizer](v3->_transportSession, "sessionInfoSynchronizer"), "setVCIDSSessionInfoSubscribedStreamIDs:", v12);
    v33 = &OBJC_IVAR___VCCallSession_packetLossRate;
    if (objc_msgSend(v12, "count"))
      -[AVCRateController setPaused:](v3->_downlinkRateController, "setPaused:", 1);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v34 = -[VCSession remoteParticipants](v3, "remoteParticipants");
    v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
    if (v35)
    {
      v36 = v35;
      v37 = 0;
      v38 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v48 != v38)
            objc_enumerationMutation(v34);
          v40 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          objc_msgSend(v40, "setActiveStreamIDs:", objc_msgSend(v12, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v40, "idsParticipantID"))));
          if (objc_msgSend(v40, "isVideoExpected") && objc_msgSend(v40, "optedInVideoStreamID"))
            v41 = 1;
          else
            v41 = objc_msgSend(v40, "isRemoteScreenEnabled");
          v37 |= v41;
        }
        v36 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
      }
      while (v36);
      v42 = (v37 & 1) == 0;
      v33 = &OBJC_IVAR___VCCallSession_packetLossRate;
    }
    else
    {
      v42 = 1;
    }
    objc_msgSend((id)objc_msgSend(*(id *)((char *)&v3->super.super.isa + v33[574]), "statisticsCollector"), "setEstimatedBandwidthCap:", v42);
    -[VCSession reportingSessionDownlinkOptInEvent:selectedMediaEntriesForParticipants:](v3, "reportingSessionDownlinkOptInEvent:selectedMediaEntriesForParticipants:", v12, v45);
    -[VCSession setOptInDictionary:](v3, "setOptInDictionary:", v12);
  }

}

- (void)reportingSessionDownlinkOptInEvent:(id)a3 selectedMediaEntriesForParticipants:(id)a4
{
  VCSession *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __CFDictionary *Mutable;
  id obj;
  id v22;
  uint64_t v23;
  VCSession *v24;
  uint64_t v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v5 = self;
  v37 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](-[VCSession remoteParticipants](self, "remoteParticipants"), "count"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionaryAddValue(Mutable, CFSTR("VCSPTargetBitrate"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5->_downlinkTargetBitrate));
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)objc_msgSend(a4, "allKeys");
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    if (v26)
    {
      v23 = *(_QWORD *)v34;
      v24 = v5;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v8);
          v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v5->_remoteParticipantsMapByUUID, "objectForKeyedSubscript:", v9);
          v11 = v6;
          objc_msgSend(v6, "addObject:", v9);
          v12 = a4;
          v13 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", v9);
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
          if (v14)
          {
            v15 = v14;
            LODWORD(v16) = 0;
            v17 = *(_QWORD *)v29;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v29 != v17)
                  objc_enumerationMutation(v13);
                v16 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "maxNetworkBitrate")
                    + v16;
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
            }
            while (v15);
          }
          else
          {
            v16 = 0;
          }
          objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16));
          v19 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v10, "idsParticipantID")));
          if (objc_msgSend(v19, "count"))
            objc_msgSend(v22, "addObject:", objc_msgSend(v19, "componentsJoinedByString:", CFSTR(",")));
          ++v8;
          v5 = v24;
          v6 = v11;
          a4 = v12;
        }
        while (v8 != v26);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
      }
      while (v26);
    }
    if (objc_msgSend(v6, "count"))
      CFDictionaryAddValue(Mutable, CFSTR("VCSPUUIDList"), (const void *)objc_msgSend(v6, "componentsJoinedByString:", CFSTR(",")));
    if (objc_msgSend(v7, "count"))
      CFDictionaryAddValue(Mutable, CFSTR("VCSPDownlinkBitrates"), (const void *)objc_msgSend(v7, "componentsJoinedByString:", CFSTR(",")));
    if (objc_msgSend(v22, "count"))
      CFDictionaryAddValue(Mutable, CFSTR("VCSPActiveStreamIDTuples"), (const void *)objc_msgSend(v22, "componentsJoinedByString:", CFSTR(";")));

    reportingGenericEvent();
    if (Mutable)
      CFRelease(Mutable);
  }
}

- (void)reportingSessionStopEventWithError:(id)a3
{
  __CFString *v5;
  const __CFString *v6;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneModeEnabled)
  {
    if (objc_msgSend(a3, "domain"))
      v5 = (__CFString *)objc_msgSend(a3, "domain");
    else
      v5 = &stru_1E9E58EE0;
    objc_msgSend(a3, "code");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSErrorUserInfoDetailedError")), "intValue");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSErrorUserInfoReturnCode")), "intValue");
    -[VCConnectionManager remoteNoRemotePacketInterval](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "remoteNoRemotePacketInterval");
    -[__CFString UTF8String](v5, "UTF8String");
    reportingCallEndError();
  }
  else
  {
    v7[0] = CFSTR("VCSCallEndReason");
    v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "code"));
    v7[1] = CFSTR("VCSCallEndDetailedReason");
    v8[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSErrorUserInfoDetailedError")), "intValue"));
    v7[2] = CFSTR("VCSErrorDomain");
    if (objc_msgSend(a3, "domain"))
      v6 = (const __CFString *)objc_msgSend(a3, "domain");
    else
      v6 = &stru_1E9E58EE0;
    v8[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    reportingGenericEvent();
  }
}

+ (int)deviceRoleForSessionMode:(int64_t)a3
{
  int v3;

  if (a3 == 1)
    v3 = 3;
  else
    v3 = 0;
  if (a3 == 2)
    return 6;
  else
    return v3;
}

- (void)setSessionInfoSynchronizerCallbacks
{
  -[VCSession setSessionInfoSynchronizerErrorResponseCallback](self, "setSessionInfoSynchronizerErrorResponseCallback");
  -[VCSession setSessionInfoSynchronizerPeerSubscribedStreamsCallback](self, "setSessionInfoSynchronizerPeerSubscribedStreamsCallback");
}

- (void)setSessionInfoSynchronizerErrorResponseCallback
{
  uint64_t v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  objc_msgSend((id)-[VCTransportSession sessionInfoSynchronizer](self->_transportSession, "sessionInfoSynchronizer", MEMORY[0x1E0C809B0], 3221225472, __60__VCSession_setSessionInfoSynchronizerErrorResponseCallback__block_invoke, &unk_1E9E52260, v3), "setErrorResponseCallback:", v4);
}

void __60__VCSession_setSessionInfoSynchronizerErrorResponseCallback__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (v3)
  {
    v4 = v3;
    if (a2)
    {
      if (a2 != 7)
        return;
      v5 = (void *)objc_msgSend(v3, "transportSession");
      if (!v5 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __60__VCSession_setSessionInfoSynchronizerErrorResponseCallback__block_invoke_cold_1();
      }
      if (objc_msgSend(v4, "optInDictionary"))
      {
        objc_msgSend((id)objc_msgSend(v5, "sessionInfoSynchronizer"), "retryVCIDSSessionInfoSubscribedStreamIDs");
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v10 = 136315650;
          v11 = v9;
          v12 = 2080;
          v13 = "-[VCSession setSessionInfoSynchronizerErrorResponseCallback]_block_invoke";
          v14 = 1024;
          v15 = 2052;
          v8 = "VCSession [%s] %s:%d Opt in dictionary is invalid";
          goto LABEL_13;
        }
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(v3, "downlinkRateController"), "setPaused:", 0);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = v6;
      v12 = 2080;
      v13 = "-[VCSession setSessionInfoSynchronizerErrorResponseCallback]_block_invoke";
      v14 = 1024;
      v15 = 2041;
      v8 = "VCSession [%s] %s:%d strongSelf is nil, return";
LABEL_13:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x1Cu);
    }
  }
}

- (void)setSessionInfoSynchronizerPeerSubscribedStreamsCallback
{
  uint64_t v3;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  objc_msgSend((id)-[VCTransportSession sessionInfoSynchronizer](self->_transportSession, "sessionInfoSynchronizer", MEMORY[0x1E0C809B0], 3221225472, __68__VCSession_setSessionInfoSynchronizerPeerSubscribedStreamsCallback__block_invoke, &unk_1E9E56310, v3), "setPeerSubscribedStreamCallback:", v4);
}

void __68__VCSession_setSessionInfoSynchronizerPeerSubscribedStreamsCallback__block_invoke(uint64_t a1, uint64_t a2)
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
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (v3)
  {
    objc_msgSend((id)objc_msgSend(v3, "localParticipant"), "setPeerSubscribedStreams:", a2);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCSession setSessionInfoSynchronizerPeerSubscribedStreamsCallback]_block_invoke";
      v10 = 1024;
      v11 = 2066;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d strongSelf is nil, return", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (id)vcrcServerBagWithOperatingMode:(int)a3
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  VCRateControlServerBag *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = +[VCRateControlServerBag keysWithMode:](VCRateControlServerBag, "keysWithMode:", v3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", +[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:](GKSConnectivitySettings, "getVCRCSeverBagConfigWithKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9)), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v7);
  }
  v10 = -[VCRateControlServerBag initWithMode:serverBagDict:]([VCRateControlServerBag alloc], "initWithMode:serverBagDict:", v3, v4);

  return v10;
}

- (void)setupRateControllersMultiway
{
  uint64_t v3;
  id v4;
  id reportingAgent;
  VCRateControlMediaController *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("session_%@"), self->_uuid);
  v8 = 0u;
  v9 = 0u;
  v11 = 0;
  v10 = 0u;
  v7 = v3;
  BYTE1(v8) = 1;
  v4 = -[VCSession vcrcServerBagWithOperatingMode:](self, "vcrcServerBagWithOperatingMode:", 6);
  reportingAgent = self->super._reportingAgent;
  *((_QWORD *)&v8 + 1) = v4;
  *(_QWORD *)&v9 = reportingAgent;
  BYTE8(v9) = 1;
  BYTE8(v10) = 1;
  *(_QWORD *)&v10 = self->_nwActivity;
  self->_uplinkRateController = -[AVCRateController initWithDelegate:params:]([AVCRateController alloc], "initWithDelegate:params:", self, &v7);
  BYTE8(v10) = 0;
  BYTE1(v8) = 0;
  self->_downlinkRateController = -[AVCRateController initWithDelegate:params:]([AVCRateController alloc], "initWithDelegate:params:", self, &v7);
  v6 = -[VCRateControlMediaController initWithMediaQueue:delegate:]([VCRateControlMediaController alloc], "initWithMediaQueue:delegate:", 0xFFFFFFFFLL, self);
  self->_uplinkMediaController = v6;
  -[AVCRateController setMediaController:](self->_uplinkRateController, "setMediaController:", v6);
  -[VCRateControlMediaController setStatisticsCollector:](self->_uplinkMediaController, "setStatisticsCollector:", -[AVCRateController statisticsCollector](self->_uplinkRateController, "statisticsCollector"));
  -[VCSessionParticipant setStatisticsCollector:](self->_localParticipant, "setStatisticsCollector:", -[AVCRateController statisticsCollector](self->_uplinkRateController, "statisticsCollector"));
  -[VCSessionParticipant setBasebandCongestionDetector:](self->_localParticipant, "setBasebandCongestionDetector:", -[AVCRateController basebandCongestionDetector](self->_uplinkRateController, "basebandCongestionDetector"));
}

- (void)didRemoveSpatialMetadataEntry
{
  NSObject *sessionQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__VCSession_didRemoveSpatialMetadataEntry__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(sessionQueue, v3);
}

uint64_t __42__VCSession_didRemoveSpatialMetadataEntry__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applySpatialMetadata");
}

- (int)setupSpatialAudio
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  int v6;
  id v7;
  int v8;
  void *spatialMetadata;
  CFTypeRef v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  _QWORD v18[5];
  CFTypeRef v19;
  CFTypeRef cf;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  cf = 0;
  if (-[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode")
    && -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode") != 2
    || !+[VCHardwareSettings isSpatialAudioSupported](VCHardwareSettings, "isSpatialAudioSupported"))
  {
    -[VCSession cleanupSpatialAudio](self, "cleanupSpatialAudio");
    v16 = 0;
    v8 = 0;
LABEL_24:
    -[VCSession setIsSpatialAudioSupported:](self, "setIsSpatialAudioSupported:", v16);
    goto LABEL_25;
  }
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __30__VCSession_setupSpatialAudio__block_invoke;
  v18[3] = &unk_1E9E521C0;
  v18[4] = v3;
  v4 = +[VCHardwareSettings isSiriVoicePlayoutSupported](VCHardwareSettings, "isSiriVoicePlayoutSupported");
  if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8)
    v5 = 33;
  else
    v5 = 32;
  v6 = VCSpatialAudioMetadata_Create((const __CFAllocator *)*MEMORY[0x1E0C9AE00], v5, 0, v18, (uint64_t *)&cf);
  if (v6 < 0)
  {
    v8 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession setupSpatialAudio].cold.1();
    }
  }
  else
  {
    VCSpatialAudioMetadata_Serialize((uint64_t)cf, (CMBlockBufferRef *)&v19);
    v7 = +[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance");
    v8 = objc_msgSend(v7, "registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:", self->_transportSessionID, 1, 32, v19);
    if (v8 < 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession setupSpatialAudio].cold.2();
      }
    }
    else
    {
      spatialMetadata = self->_spatialMetadata;
      v10 = cf;
      self->_spatialMetadata = (void *)cf;
      if (v10)
        CFRetain(v10);
      if (spatialMetadata)
        CFRelease(spatialMetadata);
      if (!v4
        || (v8 = -[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:](self, "reserveAudioChannelForMediaType:spatialAudioSourceID:", 4, self->_siriSpatialAudioSourceID), (v8 & 0x80000000) == 0))
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v11 = (void *)-[NSMutableDictionary allValues](self->_remoteParticipantsMapByUUID, "allValues");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v23 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "setupSpatialAudioWithMetadata:spatialMetadataEntryMap:", self->_spatialMetadata, self->_mediaTypeToSpatialMetadataEntryMap);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
          }
          while (v13);
        }
        v16 = 1;
        goto LABEL_24;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession setupSpatialAudio].cold.3();
      }
    }
  }
LABEL_25:
  if (cf)
    CFRelease(cf);
  if (v19)
    CFRelease(v19);
  return v8;
}

void __30__VCSession_setupSpatialAudio__block_invoke(uint64_t a1)
{
  void *v1;

  v1 = (void *)MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"));
  objc_msgSend(v1, "didRemoveSpatialMetadataEntry");
  if (v1)
    CFRelease(v1);
}

- (int)reserveAudioChannelForMediaType:(unsigned int)a3 spatialAudioSourceID:(unint64_t)a4
{
  const __CFAllocator *v5;
  int Entry;
  int v7;
  CFNumberRef v8;
  CFNumberRef v9;
  void *value;
  int v12;
  unsigned int valuePtr;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  valuePtr = a3;
  value = 0;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Entry = VCSpatialAudioMetadata_CreateEntry(*MEMORY[0x1E0C9AE00], (uint64_t)self->_spatialMetadata, a4, (uint64_t *)&value);
  if (Entry < 0)
  {
    v7 = Entry;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:].cold.1();
    }
  }
  else
  {
    v7 = VCSpatialAudioMetadata_ChannelIndex((uint64_t)value, &v12);
    if (v7 < 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:].cold.2();
      }
    }
    else
    {
      v8 = CFNumberCreate(v5, kCFNumberSInt32Type, &valuePtr);
      if (v8)
      {
        v9 = v8;
        CFDictionaryAddValue(self->_mediaTypeToSpatialMetadataEntryMap, v8, value);
        CFRelease(v9);
      }
      else
      {
        v7 = -2143813630;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:].cold.3();
        }
      }
    }
  }
  if (value)
    CFRelease(value);
  return v7;
}

- (void)cleanupSpatialAudio
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *spatialMetadata;
  __CFDictionary *mediaTypeToSpatialMetadataEntryMap;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (+[VCHardwareSettings isSpatialAudioSupported](VCHardwareSettings, "isSpatialAudioSupported"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)-[NSMutableDictionary allValues](self->_remoteParticipantsMapByUUID, "allValues");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7++), "cleanupSpatialAudio");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v5);
    }
    spatialMetadata = self->_spatialMetadata;
    if (spatialMetadata)
    {
      CFRelease(spatialMetadata);
      self->_spatialMetadata = 0;
    }
    mediaTypeToSpatialMetadataEntryMap = self->_mediaTypeToSpatialMetadataEntryMap;
    if (mediaTypeToSpatialMetadataEntryMap)
      CFDictionaryRemoveAllValues(mediaTypeToSpatialMetadataEntryMap);
    objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "unregisterAudioSessionId:", self->_transportSessionID);
  }
}

- (void)updateMultiwayRateControllerWithActiveConnection:(id)a3 isScreenEnabled:(BOOL)a4 isLocal:(BOOL)a5
{
  _BOOL4 v5;
  int *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  const void *v12;
  int v13;
  uint64_t IsLocalOnCellular;
  uint64_t v15;
  uint64_t v16;

  v5 = a4;
  v8 = &OBJC_IVAR___VCSession__downlinkRateController;
  if (a5)
    v8 = &OBJC_IVAR___VCSession__uplinkRateController;
  v9 = *(Class *)((char *)&self->super.super.isa + *v8);
  if (a5)
    v10 = objc_msgSend(a3, "uplinkBitrateCap");
  else
    v10 = objc_msgSend(a3, "downlinkBitrateCap");
  v11 = v10;
  v12 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"));
  if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)v12))
  {
    if (!-[VCConnectionManager isDuplicationEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "isDuplicationEnabled")&& !v5)
    {
LABEL_9:
      v13 = 0;
      if (!v12)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if (!v5)
  {
    goto LABEL_9;
  }
  v13 = 512;
  if (v12)
LABEL_13:
    CFRelease(v12);
LABEL_14:
  IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  v15 = VCConnection_LocalCellTech((uint64_t)a3);
  HIDWORD(v16) = v13;
  LOBYTE(v16) = v5;
  objc_msgSend(v9, "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", 6, IsLocalOnCellular, v15, 0, VCConnection_RemoteCellTech((uint64_t)a3), v11 / 0x3E8uLL, v16);
}

- (void)startRateControllersMultiwayFromOneToOne:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  VCConnectionProtocol *currentActiveConnection;
  int v7;
  VCSessionParticipantLocal *localParticipant;
  unsigned int v9;
  unsigned int v10;
  AVCRateController *uplinkRateController;
  VCConnectionProtocol *v12;
  AVCRateController *downlinkRateController;
  int v14;
  uint64_t v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = 10000000;
  -[VCRateControlMediaController setIsAudioOnly:](self->_uplinkMediaController, "setIsAudioOnly:", -[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled") ^ 1);
  currentActiveConnection = self->_currentActiveConnection;
  v7 = 10000000;
  if (currentActiveConnection)
    v7 = -[VCConnectionProtocol uplinkBitrateCap](currentActiveConnection, "uplinkBitrateCap");
  if (v3)
  {
    localParticipant = self->_localParticipant;
    if (localParticipant)
    {
      -[VCSessionParticipantLocal oneToOneSettings](localParticipant, "oneToOneSettings");
      v9 = v21;
    }
    else
    {
      v9 = 0;
      v20 = 0u;
      v21 = 0u;
      v19 = 0u;
    }
    v10 = v9 >> (v9 < 0x2DC6C0);
  }
  else
  {
    v10 = 0;
  }
  uplinkRateController = self->_uplinkRateController;
  v14 = 4;
  v15 = 0;
  v16 = v7;
  LODWORD(v17) = 0;
  DWORD1(v17) = v10;
  v18 = 0uLL;
  *((_QWORD *)&v17 + 1) = 0;
  -[AVCRateController configure:](uplinkRateController, "configure:", &v14);
  v12 = self->_currentActiveConnection;
  if (v12)
    v5 = -[VCConnectionProtocol downlinkBitrateCap](v12, "downlinkBitrateCap");
  downlinkRateController = self->_downlinkRateController;
  v14 = 5;
  v15 = 0;
  v16 = v5;
  v17 = 0u;
  v18 = 0u;
  -[AVCRateController configure:](downlinkRateController, "configure:", &v14);
  -[AVCRateController start](self->_uplinkRateController, "start");
  -[AVCRateController start](self->_downlinkRateController, "start");
}

- (void)setupUplinkBitrateCaps
{
  -[VCSessionParticipantLocal setUplinkBitrateCapWifi:](self->_localParticipant, "setUplinkBitrateCapWifi:", -[VCSessionBitrateArbiter maxBitrateWiFiUplink](self->_bitrateArbiter, "maxBitrateWiFiUplink"));
  -[VCSessionParticipantLocal setUplinkBitrateCapCell:](self->_localParticipant, "setUplinkBitrateCapCell:", -[VCSessionBitrateArbiter maxBitrateNonExpensiveUplink](self->_bitrateArbiter, "maxBitrateNonExpensiveUplink"));
}

- (void)createMediaQueue
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSession createMediaQueue]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Failed to create media queue with error 0x%X", v2, *(const char **)v3, (unint64_t)"-[VCSession createMediaQueue]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

uint64_t __29__VCSession_createMediaQueue__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    return objc_msgSend(a2, "handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:");
  return result;
}

- (void)updateVCMediaQueueForMediaType:(unsigned int)a3 mediaState:(unsigned int)a4
{
  int *v4;

  if (a3 == 6 && self->_mediaQueueConfiguration.schedulePolicy == 2)
  {
    v4 = &OBJC_IVAR___VCSession__mediaQueueMinBitrateWithoutThrottlingDefault;
    if (a4 == 1)
      v4 = &OBJC_IVAR___VCSession__mediaQueueMinBitrateWithoutThrottling3DCamera;
    VCMediaQueue_SetMinBitrateWithoutThrottling((uint64_t)self->_mediaQueue, *(_DWORD *)((char *)&self->super.super.isa + *v4));
  }
}

- (void)handleMediaQueueSizeExceedThresholdWithQueueSize:(double)a3 mediaQueueStreamId:(unsigned int)a4 type:(int)a5
{
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[20];
  unsigned int v33;
  __int16 v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  if (a5 == 2)
  {
    -[VCSessionParticipantLocal updateVCMediaQueueSize:](self->_localParticipant, "updateVCMediaQueueSize:", (a3 * 1000.0));
    return;
  }
  if (a5 == 1)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_21;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v25 = 136316162;
      v26 = v11;
      v27 = 2080;
      v28 = "-[VCSession handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
      v29 = 1024;
      v30 = 2311;
      v31 = 1024;
      *(_DWORD *)v32 = a4;
      *(_WORD *)&v32[4] = 2048;
      *(double *)&v32[6] = a3;
      v13 = "VCSession [%s] %s:%d VCMediaQueue size threshold exceeded for mediaQueueStreamId=%u queueSizeInSecond=%f - FLUSHING!";
      v14 = v12;
      v15 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_21;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v25 = 136316674;
      v26 = v21;
      v27 = 2080;
      v28 = "-[VCSession handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
      v29 = 1024;
      v30 = 2311;
      v31 = 2112;
      *(_QWORD *)v32 = v9;
      *(_WORD *)&v32[8] = 2048;
      *(_QWORD *)&v32[10] = self;
      *(_WORD *)&v32[18] = 1024;
      v33 = a4;
      v34 = 2048;
      *(double *)v35 = a3;
      v13 = "VCSession [%s] %s:%d %@(%p) VCMediaQueue size threshold exceeded for mediaQueueStreamId=%u queueSizeInSecond=%f - FLUSHING!";
      v14 = v22;
      v15 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v25, v15);
LABEL_21:
    VCMediaQueue_FlushPacketsInStream((uint64_t)self->_mediaQueue, a4, 1);
    return;
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    v25 = 136316418;
    v26 = v16;
    v27 = 2080;
    v28 = "-[VCSession handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
    v29 = 1024;
    v30 = 2318;
    v31 = 1024;
    *(_DWORD *)v32 = a5;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = a4;
    *(_WORD *)&v32[10] = 2048;
    *(double *)&v32[12] = a3;
    v18 = "VCSession [%s] %s:%d Should not handle media queue threshold exceeded with type=%d for mediaQueueStreamId=%u queueSize=%f!";
    v19 = v17;
    v20 = 50;
LABEL_27:
    _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v25, v20);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v10 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v23 = VRTraceErrorLogLevelToCSTR();
    v24 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v25 = 136316930;
      v26 = v23;
      v27 = 2080;
      v28 = "-[VCSession handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
      v29 = 1024;
      v30 = 2318;
      v31 = 2112;
      *(_QWORD *)v32 = v10;
      *(_WORD *)&v32[8] = 2048;
      *(_QWORD *)&v32[10] = self;
      *(_WORD *)&v32[18] = 1024;
      v33 = a5;
      v34 = 1024;
      LODWORD(v35[0]) = a4;
      WORD2(v35[0]) = 2048;
      *(double *)((char *)v35 + 6) = a3;
      v18 = "VCSession [%s] %s:%d %@(%p) Should not handle media queue threshold exceeded with type=%d for mediaQueueStre"
            "amId=%u queueSize=%f!";
      v19 = v24;
      v20 = 70;
      goto LABEL_27;
    }
  }
}

- (void)setMediaQueuePeakBitrateWithTargetBitrate:(unsigned int)a3
{
  double v5;
  _BOOL4 v6;
  double v7;

  if (self->_mediaQueue)
  {
    if (self->_oneToOneModeEnabled)
      v5 = 10.0;
    else
      v5 = 1.5;
    v6 = -[VCSessionParticipant isScreenEnabled](self->_localParticipant, "isScreenEnabled");
    v7 = 1.1;
    if (!v6)
      v7 = v5;
    VCMediaQueue_SetPeakBitrate(self->_mediaQueue, (v7 * (double)a3));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSession setMediaQueuePeakBitrateWithTargetBitrate:].cold.1();
  }
}

- (int)maxRemoteParticipants30fps
{
  return objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-facetime-30-fps-support"), CFSTR("maxParticipantCountSend30Fps"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", +[VCHardwareSettings maxRemoteParticipants30fps](VCHardwareSettings, "maxRemoteParticipants30fps")), 0), "intValue");
}

- (void)updateLocalVideoCaptureFrameRate
{
  const __CFString *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  _BYTE v32[24];
  __int128 v33;
  VCSession *v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (self->_sharingEnabled && VCDefaults_GetManagedBoolValueForKey(CFSTR("allowScreenToLimitCameraFrameRate"), 1))
  {
    -[VCSessionParticipantLocal setCurrentVideoCaptureFrameRate:](self->_localParticipant, "setCurrentVideoCaptureFrameRate:", +[VCHardwareSettings maxFpsCameraCaptureDuringSharing](VCHardwareSettings, "maxFpsCameraCaptureDuringSharing"));
    if ((VCSession *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v20 = -[VCSessionParticipantLocal currentVideoCaptureFrameRate](self->_localParticipant, "currentVideoCaptureFrameRate");
          *(_DWORD *)v32 = 136316418;
          *(_QWORD *)&v32[4] = v19;
          *(_WORD *)&v32[12] = 2080;
          *(_QWORD *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
          *(_WORD *)&v32[22] = 1024;
          LODWORD(v33) = 2343;
          WORD2(v33) = 2112;
          *(_QWORD *)((char *)&v33 + 6) = v3;
          HIWORD(v33) = 2048;
          v34 = self;
          LOWORD(v35) = 1024;
          *(_DWORD *)((char *)&v35 + 2) = v20;
          v10 = "VCSession [%s] %s:%d %@(%p) Screen is enabled, constraining the local camera framerate=%d fps";
          goto LABEL_32;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v15 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v16 = -[VCSessionParticipantLocal currentVideoCaptureFrameRate](self->_localParticipant, "currentVideoCaptureFrameRate");
    *(_DWORD *)v32 = 136315906;
    *(_QWORD *)&v32[4] = v15;
    *(_WORD *)&v32[12] = 2080;
    *(_QWORD *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
    *(_WORD *)&v32[22] = 1024;
    LODWORD(v33) = 2343;
    WORD2(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 6) = v16;
    v10 = "VCSession [%s] %s:%d Screen is enabled, constraining the local camera framerate=%d fps";
LABEL_27:
    v17 = v8;
    v18 = 34;
LABEL_33:
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v10, v32, v18);
    return;
  }
  if (!self->_oneToOneModeEnabled)
  {
    v5 = -[NSArray count](-[VCSession remoteParticipants](self, "remoteParticipants"), "count");
    if (-[VCSession maxRemoteParticipants30fps](self, "maxRemoteParticipants30fps") >= v5)
    {
      -[VCSessionParticipantLocal setCurrentVideoCaptureFrameRate:](self->_localParticipant, "setCurrentVideoCaptureFrameRate:", 30);
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v26 = VRTraceErrorLogLevelToCSTR();
          v27 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v32 = 136316162;
            *(_QWORD *)&v32[4] = v26;
            *(_WORD *)&v32[12] = 2080;
            *(_QWORD *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
            *(_WORD *)&v32[22] = 1024;
            LODWORD(v33) = 2350;
            WORD2(v33) = 2048;
            *(_QWORD *)((char *)&v33 + 6) = -[NSArray count](-[VCSession remoteParticipants](self, "remoteParticipants"), "count");
            HIWORD(v33) = 1024;
            LODWORD(v34) = 30;
            v10 = "VCSession [%s] %s:%d Removing or adding a remote participant %lu, changing max video capture framerate to %d fps";
            v17 = v27;
            v18 = 44;
            goto LABEL_33;
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v14 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v14 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v32 = 136316674;
            *(_QWORD *)&v32[4] = v30;
            *(_WORD *)&v32[12] = 2080;
            *(_QWORD *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
            *(_WORD *)&v32[22] = 1024;
            LODWORD(v33) = 2350;
            WORD2(v33) = 2112;
            *(_QWORD *)((char *)&v33 + 6) = v14;
            HIWORD(v33) = 2048;
            v34 = self;
            LOWORD(v35) = 2048;
            *(_QWORD *)((char *)&v35 + 2) = -[NSArray count](-[VCSession remoteParticipants](self, "remoteParticipants"), "count");
            WORD5(v35) = 1024;
            HIDWORD(v35) = 30;
            v10 = "VCSession [%s] %s:%d %@(%p) Removing or adding a remote participant %lu, changing max video capture fr"
                  "amerate to %d fps";
            v17 = v31;
            v18 = 64;
            goto LABEL_33;
          }
        }
      }
      return;
    }
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_45;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_45;
      *(_DWORD *)v32 = 136316162;
      *(_QWORD *)&v32[4] = v21;
      *(_WORD *)&v32[12] = 2080;
      *(_QWORD *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 2346;
      WORD2(v33) = 2048;
      *(_QWORD *)((char *)&v33 + 6) = -[NSArray count](-[VCSession remoteParticipants](self, "remoteParticipants"), "count");
      HIWORD(v33) = 1024;
      LODWORD(v34) = 15;
      v23 = "VCSession [%s] %s:%d Too many remote Participants %lu, constraining the local capture to %d fps";
      v24 = v22;
      v25 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_45;
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_45;
      *(_DWORD *)v32 = 136316674;
      *(_QWORD *)&v32[4] = v28;
      *(_WORD *)&v32[12] = 2080;
      *(_QWORD *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 2346;
      WORD2(v33) = 2112;
      *(_QWORD *)((char *)&v33 + 6) = v6;
      HIWORD(v33) = 2048;
      v34 = self;
      LOWORD(v35) = 2048;
      *(_QWORD *)((char *)&v35 + 2) = -[NSArray count](-[VCSession remoteParticipants](self, "remoteParticipants"), "count");
      WORD5(v35) = 1024;
      HIDWORD(v35) = 15;
      v23 = "VCSession [%s] %s:%d %@(%p) Too many remote Participants %lu, constraining the local capture to %d fps";
      v24 = v29;
      v25 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v23, v32, v25);
LABEL_45:
    -[VCSessionParticipantLocal setCurrentVideoCaptureFrameRate:](self->_localParticipant, "setCurrentVideoCaptureFrameRate:", 15, *(_OWORD *)v32, *(_QWORD *)&v32[16], v33, v34, v35);
    return;
  }
  -[VCSessionParticipantLocal setCurrentVideoCaptureFrameRate:](self->_localParticipant, "setCurrentVideoCaptureFrameRate:", -[VCSessionParticipantLocal maxCaptureCameraFrameRate](self->_localParticipant, "maxCaptureCameraFrameRate"));
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    v9 = -[VCSessionParticipantLocal maxCaptureCameraFrameRate](self->_localParticipant, "maxCaptureCameraFrameRate");
    *(_DWORD *)v32 = 136315906;
    *(_QWORD *)&v32[4] = v7;
    *(_WORD *)&v32[12] = 2080;
    *(_QWORD *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
    *(_WORD *)&v32[22] = 1024;
    LODWORD(v33) = 2354;
    WORD2(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 6) = v9;
    v10 = "VCSession [%s] %s:%d Restoring camera capture framerate to %d fps";
    goto LABEL_27;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v4 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[VCSessionParticipantLocal maxCaptureCameraFrameRate](self->_localParticipant, "maxCaptureCameraFrameRate");
      *(_DWORD *)v32 = 136316418;
      *(_QWORD *)&v32[4] = v11;
      *(_WORD *)&v32[12] = 2080;
      *(_QWORD *)&v32[14] = "-[VCSession updateLocalVideoCaptureFrameRate]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 2354;
      WORD2(v33) = 2112;
      *(_QWORD *)((char *)&v33 + 6) = v4;
      HIWORD(v33) = 2048;
      v34 = self;
      LOWORD(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 2) = v13;
      v10 = "VCSession [%s] %s:%d %@(%p) Restoring camera capture framerate to %d fps";
LABEL_32:
      v17 = v12;
      v18 = 54;
      goto LABEL_33;
    }
  }
}

- (void)updateLocalStreamConfiguration
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[VCSessionParticipantLocal setEnableVADFiltering:](self->_localParticipant, "setEnableVADFiltering:", -[NSMutableDictionary count](self->_remoteParticipantsMapByServerID, "count") >= (unint64_t)-[VCDefaults minParticipantCountSendVoiceActiveOnly](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "minParticipantCountSendVoiceActiveOnly"));
  v3 = (void *)objc_msgSend(-[VCSessionParticipantLocal supportedAudioRules](self->_localParticipant, "supportedAudioRules"), "copy");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = -[VCSession remoteParticipants](self, "remoteParticipants");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v5)
  {
    v6 = v5;
    LODWORD(v7) = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "negotiateAudioRules:", v3);
        v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "mediaNegotiator"), "negotiatedMediaRecorderSettings"), "capabilities") | v7;
        v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "mediaNegotiator"), "negotiatedMediaRecorderSettings"), "imageType");
        v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "mediaNegotiator"), "negotiatedMediaRecorderSettings"), "videoCodec");
      }
      v13 = v12;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v11 = 0;
    v13 = 128;
  }
  -[VCSessionParticipantLocal updateSupportedAudioRules:](self->_localParticipant, "updateSupportedAudioRules:", v3);
  -[VCSession updateMediaRecorderCapabillities:imageType:videoCodec:](self, "updateMediaRecorderCapabillities:imageType:videoCodec:", v7, v11, v13);
  -[VCSession updateLocalVideoCaptureFrameRate](self, "updateLocalVideoCaptureFrameRate");

}

- (void)optInStreamWithIDSStreamIDs:(id)a3
{
  VCDatagramChannelManager *v5;
  NSString *idsDestination;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v5 = +[VCDatagramChannelManager sharedInstance](VCDatagramChannelManager, "sharedInstance");
  idsDestination = self->_idsDestination;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__VCSession_optInStreamWithIDSStreamIDs___block_invoke;
  v7[3] = &unk_1E9E56358;
  v7[4] = a3;
  -[VCDatagramChannelManager executeBlockForIDSDestination:blockToExecute:](v5, "executeBlockForIDSDestination:blockToExecute:", idsDestination, v7);
}

uint64_t __41__VCSession_optInStreamWithIDSStreamIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "optInStreamIDs:", *(_QWORD *)(a1 + 32));
}

- (void)optOutStreamWithIDSStreamIDs:(id)a3
{
  VCDatagramChannelManager *v5;
  NSString *idsDestination;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v5 = +[VCDatagramChannelManager sharedInstance](VCDatagramChannelManager, "sharedInstance");
  idsDestination = self->_idsDestination;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__VCSession_optOutStreamWithIDSStreamIDs___block_invoke;
  v7[3] = &unk_1E9E56358;
  v7[4] = a3;
  -[VCDatagramChannelManager executeBlockForIDSDestination:blockToExecute:](v5, "executeBlockForIDSDestination:blockToExecute:", idsDestination, v7);
}

uint64_t __42__VCSession_optOutStreamWithIDSStreamIDs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "optOutStreamIDs:", *(_QWORD *)(a1 + 32));
}

- (BOOL)detectSSRCCollision:(id)a3 resetNeeded:(BOOL *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v19;
  void *v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_isSSRCCollisionDetectionEnabled)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = (void *)objc_msgSend(a3, "allParticipantStreamInfo");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      v19 = *(_QWORD *)v28;
      v20 = v7;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v13 = (void *)objc_msgSend(v12, "streamConfigs", v19);
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v23 != v16)
                  objc_enumerationMutation(v13);
                if (-[VCSession detectSSRCCollisionWithRemoteMediaStream:remoteBlobCreationTime:resetNeeded:](self, "detectSSRCCollisionWithRemoteMediaStream:remoteBlobCreationTime:resetNeeded:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), objc_msgSend(a3, "creationTime"), a4))
                {
                  LOBYTE(v8) = 1;
                  return v8;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
              if (v15)
                continue;
              break;
            }
          }
          v10 = v19;
          v7 = v20;
        }
        v9 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
        LOBYTE(v8) = 0;
      }
      while (v9);
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)detectSSRCCollisionWithRemoteMediaStream:(id)a3 remoteBlobCreationTime:(tagNTP)a4 resetNeeded:(BOOL *)a5
{
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = -[VCSessionParticipantLocal containsStreamWithSSRC:](self->_localParticipant, "containsStreamWithSSRC:", objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "ssrc"));
  if (v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315906;
        v15 = v10;
        v16 = 2080;
        v17 = "-[VCSession detectSSRCCollisionWithRemoteMediaStream:remoteBlobCreationTime:resetNeeded:]";
        v18 = 1024;
        v19 = 2414;
        v20 = 1024;
        v21 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "ssrc");
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d SSRC collision detected! SSRC=%u", (uint8_t *)&v14, 0x22u);
      }
    }
    if ((unint64_t)-[VCSessionParticipant creationTime](self->_localParticipant, "creationTime") >> 32 > a4.time.sec)
    {
      v12 = 1;
LABEL_9:
      *a5 = v12;
      return v9;
    }
    if ((unint64_t)-[VCSessionParticipant creationTime](self->_localParticipant, "creationTime") >> 32 == a4.time.sec)
    {
      v12 = -[VCSessionParticipant creationTime](self->_localParticipant, "creationTime") > a4.time.frac;
      goto LABEL_9;
    }
  }
  return v9;
}

- (void)handleEncryptionInfoEvent:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  VCMediaKeyIndex *v7;
  VCMediaKeyIndex *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  VCMediaKeyIndex *v23;
  _QWORD v24[5];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D340C8]);
  v6 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D340D0]);
  v7 = [VCMediaKeyIndex alloc];
  v8 = -[VCMediaKeyIndex initWithNSUUID:](v7, "initWithNSUUID:", objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D340C0]));
  v9 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D340E0]);
  v10 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D340B8]);
  v11 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxSN"));
  v12 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D340D8]);
  v24[0] = CFSTR("SecurityKey");
  v24[1] = CFSTR("SecuritySalt");
  v25[0] = v5;
  v25[1] = v6;
  v24[2] = CFSTR("SecurityKeyIndex");
  v24[3] = CFSTR("SecurityLocallyGenerated");
  v25[2] = v8;
  v25[3] = v10;
  v24[4] = CFSTR("SecurityKeySetTime");
  v25[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", micro());
  v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 5), "mutableCopy");
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("SecurityMaxSequenceNumber"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("SecurityIDSParticipantID"));
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("SecurityShortKeyIndexLength"));
  -[VCControlChannelMultiWay addNewKeyMaterial:](self->_controlChannel, "addNewKeyMaterial:", v13);
  if (-[VCSecurityKeyManager addSecurityKeyMaterial:securityKeyMode:](self->_securityKeyManager, "addSecurityKeyMaterial:securityKeyMode:", v13, self->_oneToOneModeEnabled))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315906;
        v17 = v14;
        v18 = 2080;
        v19 = "-[VCSession handleEncryptionInfoEvent:]";
        v20 = 1024;
        v21 = 2453;
        v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Security key material with key index '%@' added", (uint8_t *)&v16, 0x26u);
      }
    }
  }

}

- (void)handleMembershipChangeInfoEvent:(id)a3
{
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
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCSession handleMembershipChangeInfoEvent:]";
      v11 = 1024;
      v12 = 2460;
      v13 = 2112;
      v14 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Start pruning keys in the security key manager due to membershipChangeReason: %@", (uint8_t *)&v7, 0x26u);
    }
  }
  -[VCSecurityKeyManager pruneSendKeyMaterialWithDelay:](self->_securityKeyManager, "pruneSendKeyMaterialWithDelay:", 1.0);
  -[VCSession reportingSessionParticipantEvent:keyChangeReason:newMKI:](self, "reportingSessionParticipantEvent:keyChangeReason:newMKI:", 168, a3, 0);
}

- (void)setDelegatesForRemoteParticipant:(id)a3
{
  objc_msgSend(a3, "setStreamDelegate:", self);
}

- (void)messageMediaInitialStateToParticipant:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  VCSessionMessaging *sessionMessaging;
  const __CFString *v13;
  VCSessionMessaging *v14;
  const __CFString *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[VCSessionParticipantLocal encryptionInfoReceived](self->_localParticipant, "encryptionInfoReceived"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(a3, "uuid");
        v8 = -[VCSessionParticipant isAudioEnabled](self->_localParticipant, "isAudioEnabled");
        v9 = -[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled");
        v10 = -[VCSessionParticipant isScreenEnabled](self->_localParticipant, "isScreenEnabled");
        v16 = 136316674;
        v17 = v5;
        v18 = 2080;
        v19 = "-[VCSession messageMediaInitialStateToParticipant:]";
        v20 = 1024;
        v21 = 2475;
        v22 = 2112;
        v23 = v7;
        v24 = 1024;
        v25 = v8;
        v26 = 1024;
        v27 = v9;
        v28 = 1024;
        v29 = v10;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Send initial state to participant=%@. audioEnabled=%d videoEnabled=%d screenEnabled=%d", (uint8_t *)&v16, 0x38u);
      }
    }
    objc_msgSend(a3, "capabilities");
    if (v11 == 1)
    {
      sessionMessaging = self->_sessionMessaging;
      if (-[VCSessionParticipant isAudioEnabled](self->_localParticipant, "isAudioEnabled"))
        v13 = CFSTR("VCSessionMessageAudioEnabled");
      else
        v13 = CFSTR("VCSessionMessageAudioDisabled");
      -[VCSessionMessaging sendMessage:withTopic:participantID:](sessionMessaging, "sendMessage:withTopic:participantID:", v13, CFSTR("VCSessionMessageTopicAudioEnabledState"), objc_msgSend(a3, "idsParticipantID"));
      v14 = self->_sessionMessaging;
      if (-[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled"))
        v15 = CFSTR("VCSessionMessageVideoEnabled");
      else
        v15 = CFSTR("VCSessionMessageVideoDisabled");
      -[VCSessionMessaging sendMessage:withTopic:participantID:](v14, "sendMessage:withTopic:participantID:", v15, CFSTR("VCSessionMessageTopicVideoEnabledStateb"), objc_msgSend(a3, "idsParticipantID"));
    }
    else
    {
      -[VCSession sendMediaStateUpdateMessageToRemoteParticipant:](self, "sendMediaStateUpdateMessageToRemoteParticipant:", a3);
    }
  }
}

- (void)broadcastInitialMediaState
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  const __CFString *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[VCSessionParticipantLocal encryptionInfoReceived](self->_localParticipant, "encryptionInfoReceived"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = -[VCSessionParticipant isAudioEnabled](self->_localParticipant, "isAudioEnabled");
        v6 = -[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled");
        v7 = -[VCSessionParticipant isScreenEnabled](self->_localParticipant, "isScreenEnabled");
        v10 = 136316418;
        v11 = v3;
        v12 = 2080;
        v13 = "-[VCSession broadcastInitialMediaState]";
        v14 = 1024;
        v15 = 2489;
        v16 = 1024;
        v17 = v5;
        v18 = 1024;
        v19 = v6;
        v20 = 1024;
        v21 = v7;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Broadcasting initial state. audioEnabled=%d videoEnabled=%d screenEnabled=%d", (uint8_t *)&v10, 0x2Eu);
      }
    }
    -[VCSession broadcastMediaStateUpdateMessage](self, "broadcastMediaStateUpdateMessage");
    if (-[VCSessionParticipant isAudioEnabled](self->_localParticipant, "isAudioEnabled"))
      v8 = CFSTR("VCSessionMessageAudioEnabled");
    else
      v8 = CFSTR("VCSessionMessageAudioDisabled");
    -[VCSession broadcastSingleStateMessage:withTopic:](self, "broadcastSingleStateMessage:withTopic:", v8, CFSTR("VCSessionMessageTopicAudioEnabledState"));
    if (-[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled"))
      v9 = CFSTR("VCSessionMessageVideoEnabled");
    else
      v9 = CFSTR("VCSessionMessageVideoDisabled");
    -[VCSession broadcastSingleStateMessage:withTopic:](self, "broadcastSingleStateMessage:withTopic:", v9, CFSTR("VCSessionMessageTopicVideoEnabledStateb"));
  }
}

+ (void)addUUIDToMutableData:(id)a3 fromUUIDString:(id)a4
{
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", a4);
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(v5, "getUUIDBytes:", v6);

  objc_msgSend(a3, "appendBytes:length:", v6, 16);
}

- (id)newEncryptionLabelWithLocalUUID:(id)a3 remoteUUID:(id)a4
{
  void *v7;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", "VCControlChannelV2", 18);
  if (self->_forceFixedEncryptionLabel)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315906;
        v12 = v9;
        v13 = 2080;
        v14 = "-[VCSession newEncryptionLabelWithLocalUUID:remoteUUID:]";
        v15 = 1024;
        v16 = 2508;
        v17 = 2080;
        v18 = "VCControlChannelV2";
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Fixed label '%s' is being used due to default", (uint8_t *)&v11, 0x26u);
      }
    }
  }
  else
  {
    +[VCSession addUUIDToMutableData:fromUUIDString:](VCSession, "addUUIDToMutableData:fromUUIDString:", v7, a3);
    +[VCSession addUUIDToMutableData:fromUUIDString:](VCSession, "addUUIDToMutableData:fromUUIDString:", v7, a4);
  }
  return v7;
}

+ (void)cleanupControlChannelParticipantConfig:(id *)a3
{
  __CFData *var4;
  __CFData *var3;
  tagVCSecurityKeyHolder *var2;
  tagVCSecurityKeyHolder *var1;

  if (a3)
  {
    var4 = a3->var4;
    if (var4)
      CFRelease(var4);
    var3 = a3->var3;
    if (var3)
      CFRelease(var3);
    var2 = a3->var2;
    if (var2)
      CFRelease(var2);
    var1 = a3->var1;
    if (var1)
      CFRelease(var1);
  }
}

- (BOOL)composeControlChannelParticipantConfig:(id *)a3 withRemoteParticipant:(id)a4
{
  $741F0C4C97D111132688E558C86B6925 *v5;
  int v7;
  __CFData *v8;
  __CFData *v9;
  uint64_t v10;
  BOOL v11;

  if (a3)
  {
    v5 = a3;
    if (a4)
    {
      objc_msgSend(a4, "capabilities");
      v5->var0 = v7;
      v5->var5 = 1;
      v8 = -[VCSession newEncryptionLabelWithLocalUUID:remoteUUID:](self, "newEncryptionLabelWithLocalUUID:remoteUUID:", -[VCSessionParticipant uuid](self->_localParticipant, "uuid"), objc_msgSend(a4, "uuid"));
      v5->var3 = v8;
      if (v8)
      {
        v9 = -[VCSession newEncryptionLabelWithLocalUUID:remoteUUID:](self, "newEncryptionLabelWithLocalUUID:remoteUUID:", objc_msgSend(a4, "uuid"), -[VCSessionParticipant uuid](self->_localParticipant, "uuid"));
        v5->var4 = v9;
        if (v9)
        {
          v10 = *MEMORY[0x1E0C9AE00];
          if (VCSecurityKeyHolder_Create(*MEMORY[0x1E0C9AE00], (uint64_t)self->_securityKeyManager, 1, -[VCSessionParticipant idsParticipantID](self->_localParticipant, "idsParticipantID"), 0, 2u, (uint64_t *)&v5->var1))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:].cold.6();
            }
          }
          else
          {
            if (!VCSecurityKeyHolder_Create(v10, (uint64_t)self->_securityKeyManager, 2, objc_msgSend(a4, "idsParticipantID"), objc_msgSend(a4, "isParticipantIDBasedKeyLookupEnabled"), 2u, (uint64_t *)&v5->var2))
            {
              v5 = 0;
              v11 = 1;
              goto LABEL_8;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:].cold.5();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:].cold.4();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:].cold.3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:].cold.2();
    }
    v11 = 0;
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:].cold.1();
  }
  v11 = 0;
  v5 = 0;
LABEL_8:
  +[VCSession cleanupControlChannelParticipantConfig:](VCSession, "cleanupControlChannelParticipantConfig:", v5);
  return v11;
}

- (BOOL)isNetworkForcingECNDefaultSet
{
  CFPropertyListRef v2;
  CFPropertyListRef v3;

  v2 = CFPreferencesCopyAppValue(CFSTR("network_enable_l4s"), CFSTR("-g"));
  v3 = v2;
  if (v2)
    CFRelease(v2);
  return v3 != 0;
}

- (BOOL)isAVCForcingECNDefaultSet
{
  CFPropertyListRef v2;
  CFPropertyListRef v3;

  v2 = CFPreferencesCopyAppValue(CFSTR("ecnEnabled"), CFSTR("com.apple.VideoConference"));
  v3 = v2;
  if (v2)
    CFRelease(v2);
  return v3 != 0;
}

- (BOOL)isECNPermittedFromNetworkingLayer
{
  _BOOL4 v2;
  uint64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[VCSession isNetworkForcingECNDefaultSet](self, "isNetworkForcingECNDefaultSet"))
    v2 = CFPreferencesGetAppBooleanValue(CFSTR("network_enable_l4s"), CFSTR("-g"), 0) != 0;
  else
    v2 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCSession isECNPermittedFromNetworkingLayer]";
      v10 = 1024;
      v11 = 2585;
      v12 = 1024;
      v13 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Network layer ECN Default is set=%d", (uint8_t *)&v6, 0x22u);
    }
  }
  return v2;
}

- (BOOL)isECNCapableWithRemoteParticipant:(id)a3
{
  NSString *v5;
  void *v6;
  int v7;
  int v8;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  double v13;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  BOOL BoolValueForKey;
  uint64_t v19;
  NSObject *v20;
  BOOL v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 isECNEnabled;
  _BOOL4 isECNCapable;
  int ecnLinkType;
  int v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = -[VCCallInfoBlob frameworkVersion](-[VCSessionParticipant callInfoBlob](self->_localParticipant, "callInfoBlob"), "frameworkVersion");
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "callInfoBlob"), "frameworkVersion");
  LODWORD(v5) = -[NSString integerValue](v5, "integerValue");
  v7 = objc_msgSend(v6, "integerValue");
  v8 = objc_msgSend(CFSTR("1965"), "integerValue");
  v10 = (int)v5 >= v8 && v7 >= v8;
  v11 = v7 < (int)objc_msgSend(CFSTR("2045"), "integerValue");
  v12 = (double)arc4random() / 4294967300.0;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-ecn-enabled-p2p-only"), CFSTR("ecnEnabledProbabiltyForP2POnly"), &unk_1E9EFB1B8, 1), "doubleValue");
  if (v12 >= v13 || v11)
    v15 = 4;
  else
    v15 = 1;
  self->_ecnLinkType = v15;
  self->_isECNCapable = v10;
  self->_isECNEnabled = v11;
  v16 = VCConnectionManager_CopyPrimaryConnection((uint64_t)-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"));
  v17 = (void *)v16;
  if (v16 && (VCConnection_IsRelay(v16) & 1) == 0)
    self->_isECNEnabled = 1;

  if (-[VCSession isAVCForcingECNDefaultSet](self, "isAVCForcingECNDefaultSet"))
  {
    BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("ecnEnabled"), self->_isECNEnabled);
    self->_isECNEnabled = BoolValueForKey;
    self->_isECNCapable = BoolValueForKey;
    self->_ecnLinkType = 0;
  }
  VCRateControlFeedbackController_SetLinkTypeToSupportECN((uint64_t)-[AVCRateController feedbackController](self->_oneToOneSettings.rateController, "feedbackController"), self->_ecnLinkType);
  if ((network_config_get_l4s_enabled() & 1) == 0)
  {
    self->_isECNEnabled = 0;
    self->_isECNCapable = 0;
    self->_ecnLinkType = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v30 = 136315650;
        v31 = v19;
        v32 = 2080;
        v33 = "-[VCSession isECNCapableWithRemoteParticipant:]";
        v34 = 1024;
        v35 = 2643;
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Forced turned off ECN via developer setting", (uint8_t *)&v30, 0x1Cu);
      }
    }
  }
  if (-[VCSession isNetworkForcingECNDefaultSet](self, "isNetworkForcingECNDefaultSet"))
  {
    v21 = -[VCSession isECNPermittedFromNetworkingLayer](self, "isECNPermittedFromNetworkingLayer");
    self->_isECNForcedByNetwork = v21;
    self->_isECNCapable = v21;
    self->_isECNEnabled = v21;
    self->_ecnLinkType = 3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v30 = 136315650;
        v31 = v22;
        v32 = 2080;
        v33 = "-[VCSession isECNCapableWithRemoteParticipant:]";
        v34 = 1024;
        v35 = 2650;
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Forced ECN setting via networking layer default", (uint8_t *)&v30, 0x1Cu);
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      isECNEnabled = self->_isECNEnabled;
      isECNCapable = self->_isECNCapable;
      ecnLinkType = self->_ecnLinkType;
      v30 = 136316674;
      v31 = v24;
      v32 = 2080;
      v33 = "-[VCSession isECNCapableWithRemoteParticipant:]";
      v34 = 1024;
      v35 = 2653;
      v36 = 1024;
      v37 = isECNEnabled;
      v38 = 1024;
      v39 = isECNCapable;
      v40 = 1024;
      v41 = v10;
      v42 = 1024;
      v43 = ecnLinkType;
      _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d _isECNEnabled=%d, _isECNCapable=%d, buildSettingECNParam=%d, _ecnLinkType=%d", (uint8_t *)&v30, 0x34u);
    }
  }
  return self->_isECNCapable;
}

- (void)setBytesInFlightFlagWithParticipant:(id)a3
{
  int v4;
  int v5;
  int v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 isBytesInFlightAdaptationEnabled;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "callInfoBlob"), "frameworkVersion"), "integerValue");
  v5 = objc_msgSend(CFSTR("2015"), "integerValue");
  v6 = _os_feature_enabled_impl();
  v7 = v6;
  if (v4 >= v5)
    v8 = v6;
  else
    v8 = 0;
  self->_isBytesInFlightAdaptationEnabled = v8;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      isBytesInFlightAdaptationEnabled = self->_isBytesInFlightAdaptationEnabled;
      v12 = 136316418;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCSession setBytesInFlightFlagWithParticipant:]";
      v16 = 1024;
      v17 = 2669;
      v18 = 1024;
      v19 = isBytesInFlightAdaptationEnabled;
      v20 = 1024;
      v21 = v4 >= v5;
      v22 = 1024;
      v23 = v7;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d isBytesInFlightAdaptationEnabled=%d remoteBIFSupported=%d localBIFEnabled=%d", (uint8_t *)&v12, 0x2Eu);
    }
  }
}

- (BOOL)registerRemoteParticipantToSession:(id)a3
{
  VCSessionMessaging *sessionMessaging;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  BOOL v10;
  _OWORD v12[3];
  const __CFString *v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  memset(v12, 0, sizeof(v12));
  if (!-[VCSession composeControlChannelParticipantConfig:withRemoteParticipant:](self, "composeControlChannelParticipantConfig:withRemoteParticipant:", v12, a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession registerRemoteParticipantToSession:].cold.2();
    }
    goto LABEL_20;
  }
  if (!-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:](self->_controlChannel, "addActiveParticipant:participantUUID:withConfiguration:", objc_msgSend(a3, "idsParticipantID"), objc_msgSend(a3, "uuid"), v12))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession registerRemoteParticipantToSession:].cold.1();
    }
LABEL_20:
    v10 = 0;
    goto LABEL_13;
  }
  sessionMessaging = self->_sessionMessaging;
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID"));
  -[VCSessionMessaging addParticipant:controlChannelProtocolVersion:](sessionMessaging, "addParticipant:controlChannelProtocolVersion:", v6, LODWORD(v12[0]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByUUID, "setObject:forKeyedSubscript:", a3, objc_msgSend(a3, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByServerID, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID")));
  -[VCSessionParticipantLocal setRemoteParticipants:](self->_localParticipant, "setRemoteParticipants:", -[NSMutableDictionary allValues](self->_remoteParticipantsMapByUUID, "allValues"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[NSMutableDictionary count](self->_remoteParticipantsMapByUUID, "count");
      *(_DWORD *)buf = 136315906;
      v16 = v7;
      v17 = 2080;
      v18 = "-[VCSession registerRemoteParticipantToSession:]";
      v19 = 1024;
      v20 = 2688;
      v21 = 1024;
      v22 = v9;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Participant count:%d", buf, 0x22u);
    }
  }
  v13 = CFSTR("Thermal");
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lastThermalLevel);
  -[VCSession sendDeviceStateMessageToParticipant:withStatus:](self, "sendDeviceStateMessageToParticipant:withStatus:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  -[VCSession sendNetworkCapabilitiesMessageToParticipant:](self, "sendNetworkCapabilitiesMessageToParticipant:", a3);
  -[VCSession updateLocalStreamConfiguration](self, "updateLocalStreamConfiguration");
  -[VCSession reportingSessionParticipantEvent:withParticipant:](self, "reportingSessionParticipantEvent:withParticipant:", 161, a3);
  if (self->_currentActiveConnection)
    objc_msgSend(a3, "handleActiveConnectionChange:");
  if (!self->_oneToOneModeEnabled)
  {
    -[VCSessionDownlinkBandwidthAllocator registerForBandwidthAllocationWithClient:](self->_downlinkBandwidthAllocator, "registerForBandwidthAllocationWithClient:", a3);
    -[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:](self, "distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:", 1);
  }
  if (self->_state == 3)
    -[VCSession messageMediaInitialStateToParticipant:](self, "messageMediaInitialStateToParticipant:", a3);
  v10 = 1;
LABEL_13:
  +[VCSession cleanupControlChannelParticipantConfig:](VCSession, "cleanupControlChannelParticipantConfig:", v12);
  return v10;
}

- (void)removeDelegatesForRemoteParticipant:(id)a3
{
  objc_msgSend(a3, "setStreamDelegate:", 0);
}

- (void)unregisterRemoteParticipantFromSession:(id)a3
{
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
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_oneToOneModeEnabled)
  {
    -[VCSessionDownlinkBandwidthAllocator deregisterForBandwidthAllocationWithClient:](self->_downlinkBandwidthAllocator, "deregisterForBandwidthAllocationWithClient:", a3);
    -[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:](self, "distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:", 1);
  }
  -[VCSession reportingSessionParticipantEvent:withParticipant:](self, "reportingSessionParticipantEvent:withParticipant:", 162, a3);
  -[VCControlChannelMultiWay removeActiveParticipant:](self->_controlChannel, "removeActiveParticipant:", objc_msgSend(a3, "idsParticipantID"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByUUID, "setObject:forKeyedSubscript:", 0, objc_msgSend(a3, "uuid"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByServerID, "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID")));
  -[VCSessionParticipantLocal setRemoteParticipants:](self->_localParticipant, "setRemoteParticipants:", -[NSMutableDictionary allValues](self->_remoteParticipantsMapByUUID, "allValues"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[NSMutableDictionary count](self->_remoteParticipantsMapByUUID, "count");
      v8 = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCSession unregisterRemoteParticipantFromSession:]";
      v12 = 1024;
      v13 = 2737;
      v14 = 1024;
      v15 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Participant count:%d", (uint8_t *)&v8, 0x22u);
    }
  }
  -[VCSession updateLocalStreamConfiguration](self, "updateLocalStreamConfiguration");
}

- (void)sendSymptomsToRemoteParticipants:(id)a3 symptom:(id)a4 groupID:(id)a5
{
  NSObject *sessionQueue;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VCSession_sendSymptomsToRemoteParticipants_symptom_groupID___block_invoke;
  block[3] = &unk_1E9E54D20;
  block[4] = a4;
  block[5] = a5;
  block[6] = a3;
  block[7] = self;
  dispatch_async(sessionQueue, block);
}

void __62__VCSession_sendSymptomsToRemoteParticipants_symptom_groupID___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
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
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("VCSessionMessageSymptom"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("VCSessionMessageGroupID"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    v5 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315906;
        v19 = v3;
        v20 = 2080;
        v21 = "-[VCSession sendSymptomsToRemoteParticipants:symptom:groupID:]_block_invoke";
        v22 = 1024;
        v23 = 2747;
        v24 = 2048;
        v25 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d remoteParticipantIDs = %p", buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      __62__VCSession_sendSymptomsToRemoteParticipants_symptom_groupID___block_invoke_cold_1();
    }
  }
  v7 = *(void **)(a1 + 48);
  if (v7 && !objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = *(void **)(a1 + 48);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 224), "sendMessageDictionary:withTopic:participantID:", v2, CFSTR("VCSessionMessageTopicSymptom"), objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 256), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i)), "idsParticipantID"));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v10);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "broadcastMessageDictionary:withTopic:", v2, CFSTR("VCSessionMessageTopicSymptom"));
  }

}

+ (void)initVideoFeatureStatusSettings:(tagVCReportingClientSettingsPersist *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    *(_WORD *)&a3->var4 = -1;
    *(_DWORD *)&a3->var0 = -1;
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
  VCSessionSwitches *abSwitches;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = 0xAAAAAAAAAAAAAAAALL;
  v6 = 0xAAAAAAAAAAAAAAAALL;
  v4 = 0xAAAA000000000000;
  abSwitches = self->_abSwitches;
  if (abSwitches)
    abSwitches = -[VCSessionSwitches switches](abSwitches, "switches");
  v5 = (unint64_t)abSwitches;
  LOBYTE(v6) = -[VCConnectionManager enableNetworkConditionMonitoring](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "enableNetworkConditionMonitoring");
  BYTE1(v6) = -[VCConnectionManager enableMotionBasedDuplication](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "enableMotionBasedDuplication");
  +[VCSession initVideoFeatureStatusSettings:](VCSession, "initVideoFeatureStatusSettings:", &v4);
  if (self->_oneToOneModeEnabled)
    BYTE1(v4) = +[VCHardwareSettings isMLEnhanceOneToOneSupported](VCHardwareSettings, "isMLEnhanceOneToOneSupported");
  reportingSetReportingClientPersistentSetting();
}

- (void)cleanupVCRC
{

}

- (void)cleanupNwActivity
{
  OS_nw_activity *parentNWActivity;

  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity)
    nw_release(parentNWActivity);
  if (self->_nwActivity)
  {
    nw_activity_complete_with_reason();
    nw_release(self->_nwActivity);
  }
}

- (void)setupMultiwayABTesting
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[VCSwitchManager initializeLocalSwitches](self->_switchManager, "initializeLocalSwitches");
  -[VCConnectionManager setUseMediaDrivenDuplication:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setUseMediaDrivenDuplication:", -[VCSwitchManager isLocalSwitchEnabled:](self->_switchManager, "isLocalSwitchEnabled:", 0x20000000));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[VCConnectionManager useMediaDrivenDuplication](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "useMediaDrivenDuplication");
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCSession setupMultiwayABTesting]";
      v10 = 1024;
      v11 = 2840;
      v12 = 1024;
      v13 = v5;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Load switch useMediaDrivenDuplication %d", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)setIsSpatialAudioSupported:(BOOL)a3
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_isSpatialAudioSupported != a3)
  {
    self->_isSpatialAudioSupported = a3;
    v3 = CFSTR("SpatialAudioSupported");
    v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
    reportingGenericEvent();
  }
}

- (void)registerQoSReporting
{
  reportingSetPeriodicAggregationOccuredHandler();
  ReportingVC_SetEventDrivenAggregationOccurredHandler();
  -[VCQoSMonitorManager registerQoSReportingSourceForToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "registerQoSReportingSourceForToken:", self->_transportSessionID);
}

uint64_t __33__VCSession_registerQoSReporting__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[VCQoSMonitorManager updateQoSReport:toClientsWithToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "updateQoSReport:toClientsWithToken:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __33__VCSession_registerQoSReporting__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[VCQoSMonitorManager updateEventDrivenQoSReport:toClientsWithToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "updateEventDrivenQoSReport:toClientsWithToken:", a3, *(_QWORD *)(a1 + 32));
}

- (void)unregisterQoSReporting
{
  reportingSetPeriodicAggregationOccuredHandler();
  -[VCObject reportingAgent](self, "reportingAgent");
  ReportingVC_SetEventDrivenAggregationOccurredHandler();
  -[VCQoSMonitorManager unregisterQoSReportingSourceForToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "unregisterQoSReportingSourceForToken:", self->_transportSessionID);
}

- (BOOL)generateReceptionReportList:(_RTCP_RECEPTION_REPORT *)a3 reportCount:(char *)a4
{
  return 0;
}

- (BOOL)handleEncryptionInfoChange:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  -[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:](self, "reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:", 167, self->_localParticipant, 0, objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SecurityKeyIndex")));
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VCSession_handleEncryptionInfoChange___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
  return 1;
}

void __40__VCSession_handleEncryptionInfoChange___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "handleEncryptionInfoChange:", *(_QWORD *)(a1 + 40));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "encryptionInfoReceived") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setEncryptionInfoReceived:", 1);
    objc_msgSend(*(id *)(a1 + 32), "broadcastInitialMediaState");
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(const __CFString **)(*(_QWORD *)(a1 + 32) + 208);
        v13 = 136315906;
        v14 = v3;
        v15 = 2080;
        v16 = "-[VCSession handleEncryptionInfoChange:]_block_invoke";
        v17 = 1024;
        v18 = 2898;
        v19 = 2112;
        v20 = v5;
        v6 = "VCSession [%s] %s:%d Received encryption info from IDS with destination[%@]";
        v7 = v4;
        v8 = 38;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(_QWORD *)(v11 + 208);
        v13 = 136316418;
        v14 = v9;
        v15 = 2080;
        v16 = "-[VCSession handleEncryptionInfoChange:]_block_invoke";
        v17 = 1024;
        v18 = 2898;
        v19 = 2112;
        v20 = v2;
        v21 = 2048;
        v22 = v11;
        v23 = 2112;
        v24 = v12;
        v6 = "VCSession [%s] %s:%d %@(%p) Received encryption info from IDS with destination[%@]";
        v7 = v10;
        v8 = 58;
        goto LABEL_13;
      }
    }
  }
}

- (void)resetDecryptionTimeout
{
  NSObject *sessionQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__VCSession_resetDecryptionTimeout__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(sessionQueue, v3);
}

uint64_t __35__VCSession_resetDecryptionTimeout__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[128];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "allValues");
  result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5++), "resetDecryptionTimeout");
      }
      while (v3 != v5);
      result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)didEncryptionKeyRollTimeout
{
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingSymptom();
  -[VCSession stopWithError:](self, "stopWithError:", +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 21, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 2914), 0));
}

- (id)computeConversationTimeBaseTruncated
{
  double v2;

  -[NSDate timeIntervalSinceReferenceDate](self->_conversationTimeBase, "timeIntervalSinceReferenceDate");
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(14400 * ((int)v2 / 14400)));
}

- (__CFDictionary)getClientSpecificUserInfo
{
  NSString *uuid;
  NSString *conversationID;
  const __CFString *v4;
  NSDate *conversationTimeBaseTruncated;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  uuid = self->_uuid;
  conversationID = self->_conversationID;
  v7[0] = CFSTR("VCSUUID");
  v7[1] = CFSTR("CID");
  if (conversationID)
    v4 = (const __CFString *)conversationID;
  else
    v4 = &stru_1E9E58EE0;
  v8[0] = uuid;
  v8[1] = v4;
  v7[2] = CFSTR("ConversationBaseDate");
  conversationTimeBaseTruncated = self->_conversationTimeBaseTruncated;
  if (!conversationTimeBaseTruncated)
    conversationTimeBaseTruncated = -[VCSession computeConversationTimeBaseTruncated](self, "computeConversationTimeBaseTruncated");
  v8[2] = conversationTimeBaseTruncated;
  return (__CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
}

- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 streamGroupID:(unsigned int)a5 streamID:(unsigned __int16)a6
{
  -[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:](self, "reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:", a3, a4, 0, 0, *(_QWORD *)&a5, a6);
}

- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4
{
  -[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:](self, "reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:", a3, a4, 0, 0, 0, 0);
}

- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 keyChangeReason:(id)a4 newMKI:(id)a5
{
  -[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:](self, "reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:", a3, 0, a4, a5, 0, 0);
}

- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 keyChangeReason:(id)a5 newMKI:(id)a6
{
  -[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:](self, "reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:", a3, a4, a5, a6, 0, 0);
}

- (void)reportingSessionParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 keyChangeReason:(id)a5 newMKI:(id)a6 withStreamGroupID:(unsigned int)a7 withStreamID:(unsigned __int16)a8
{
  uint64_t v10;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  CFMutableDictionaryRef Mutable;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  __int16 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  VCSession *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  if (self->super._reportingAgent)
  {
    v10 = *(_QWORD *)&a7;
    v14 = a3;
    if (a4 || (unsigned __int16)(a3 - 170) > 8u)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      LOWORD(v25) = a8;
      -[VCSession collectSessionEventKeyFieldsAndSubtype:eventType:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:collectSubtype:](self, "collectSessionEventKeyFieldsAndSubtype:eventType:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:collectSubtype:", Mutable, v14, a4, a5, a6, v10, v25, &v26);
      reportingGenericEvent();
      if (Mutable)
        CFRelease(Mutable);
    }
    else
    {
      if ((VCSession *)objc_opt_class() != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v15 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v15 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          return;
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          return;
        *(_DWORD *)buf = 136316418;
        v28 = v23;
        v29 = 2080;
        v30 = "-[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:]";
        v31 = 1024;
        v32 = 2956;
        v33 = 2112;
        v34 = v15;
        v35 = 2048;
        v36 = self;
        v37 = 1024;
        v38 = v14;
        v20 = "VCSession [%s] %s:%d %@(%p) Session Event failed - EventType:%d needs a participant but it is nil";
        v21 = v24;
        v22 = 54;
LABEL_27:
        _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:].cold.2();
      }
    }
  }
  else if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v28 = v18;
        v29 = 2080;
        v30 = "-[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:]";
        v31 = 1024;
        v32 = 2951;
        v33 = 2112;
        v34 = v16;
        v35 = 2048;
        v36 = self;
        v20 = "VCSession [%s] %s:%d %@(%p) Reporting agent is not properly configured";
        v21 = v19;
        v22 = 48;
        goto LABEL_27;
      }
    }
  }
}

- (void)reportingMomentsToGreenTeaWithRequest:(id)a3
{
  NSObject *CTGreenTeaOsLogHandle;
  NSObject *v4;
  uint8_t v5[8];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestMode")), "unsignedIntValue") == 2)
  {
    ct_green_tea_logger_create_static();
    CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
    if (CTGreenTeaOsLogHandle)
    {
      v4 = CTGreenTeaOsLogHandle;
      if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_INFO, "<FaceTime>[FaceTime][com.apple.AVConference]:Taken FaceTime Live Photo", v5, 2u);
      }
    }
  }
}

- (void)addNegotiatedCipherSuitesForParticipant:(id)a3 toReportingDictionary:(id)a4
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_ABT"), CFSTR("CPHRS"));
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCSessionConfiguration isOneToOneAuthenticationTagEnabled](self->_configuration, "isOneToOneAuthenticationTagEnabled")), v7);
  v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("CPHRS"), reportingStreamGroupFromStreamGroupID());
  v9 = objc_msgSend(a3, "negotiatedCipherSuiteForStreamGroupID:", 1835623282);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9), v8);
  v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("CPHRS"), reportingStreamGroupFromStreamGroupID());
  v11 = objc_msgSend(a3, "negotiatedCipherSuiteForStreamGroupID:", 1667329381);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11), v10);
  v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("CPHRS"), reportingStreamGroupFromStreamGroupID());
  v13 = objc_msgSend(a3, "negotiatedCipherSuiteForStreamGroupID:", 1937339233);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13), v12);
  v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("CPHRS"), reportingStreamGroupFromStreamGroupID());
  v15 = objc_msgSend(a3, "negotiatedCipherSuiteForStreamGroupID:", 1935897189);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15), v14);
  v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("CPHRS"), reportingStreamGroupFromStreamGroupID());
  v17 = objc_msgSend(a3, "negotiatedCipherSuiteForStreamGroupID:", 1667329399);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17), v16);
  v18 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("CPHRS"), reportingStreamGroupFromStreamGroupID());
  v19 = objc_msgSend(a3, "negotiatedCipherSuiteForStreamGroupID:", 1835623287);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19), v18);
  v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("CPHRS"), reportingStreamGroupFromStreamGroupID());
  v21 = objc_msgSend(a3, "negotiatedCipherSuiteForStreamGroupID:", 1667330164);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21), v20);
  v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("CPHRS"), reportingStreamGroupFromStreamGroupID());
  v23 = objc_msgSend(a3, "negotiatedCipherSuiteForStreamGroupID:", 1718909044);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23), v22);
  v24 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("CPHRS"), reportingStreamGroupFromStreamGroupID());
  v25 = objc_msgSend(a3, "negotiatedCipherSuiteForStreamGroupID:", 1650745716);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25), v24);
  v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%d"), CFSTR("CPHRS"), reportingStreamGroupFromStreamGroupID());
  v27 = objc_msgSend(a3, "negotiatedCipherSuiteForStreamGroupID:", 1717854580);
  objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27), v26);
}

- (void)collectSessionEventKeyFieldsAndSubtype:(__CFDictionary *)a3 eventType:(unsigned __int16)a4 withParticipant:(id)a5 keyChangeReason:(id)a6 newMKI:(id)a7 withStreamGroupID:(unsigned int)a8 withStreamID:(unsigned __int16)a9 collectSubtype:(unsigned __int16 *)a10
{
  const __CFString *conversationID;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  _BOOL8 v18;
  const __CFDictionary *v19;
  const __CFString *v21;

  if (a10)
  {
    *a10 = 0;
    switch(a4)
    {
      case 0x9Fu:
        conversationID = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_currentConnectionType);
        v14 = CFSTR("VCSPConnectionType");
        goto LABEL_39;
      case 0xA0u:
        v16 = (void *)MEMORY[0x1E0CB37E8];
        v17 = 432;
        goto LABEL_28;
      case 0xA1u:
        CFDictionaryAddValue(a3, CFSTR("VCSPIDSID"), self->_idsDestination);
        CFDictionaryAddValue(a3, CFSTR("VCSPAudioEnabled"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a5, "isAudioEnabled")));
        CFDictionaryAddValue(a3, CFSTR("VCSPVideoEnabled"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a5, "isVideoEnabled")));
        CFDictionaryAddValue(a3, CFSTR("REMBUILD"), (const void *)objc_msgSend((id)objc_msgSend(a5, "callInfoBlob"), "osVersion"));
        CFDictionaryAddValue(a3, CFSTR("RDT"), (const void *)objc_msgSend((id)objc_msgSend(a5, "callInfoBlob"), "deviceType"));
        CFDictionaryAddValue(a3, CFSTR("MicMode"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCSession getCurrentMicMode](self, "getCurrentMicMode")));
        -[VCSession addNegotiatedCipherSuitesForParticipant:toReportingDictionary:](self, "addNegotiatedCipherSuitesForParticipant:toReportingDictionary:", a5, a3);
        goto LABEL_9;
      case 0xA2u:
LABEL_9:
        v18 = (unint64_t)objc_msgSend(a5, "capabilities") >> 32 == 1;
        CFDictionaryAddValue(a3, CFSTR("VCSPIsWebUser"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18));
        conversationID = (const __CFString *)objc_msgSend(a5, "uuid");
        v14 = CFSTR("VCSPUUID");
        goto LABEL_39;
      case 0xA3u:
        CFDictionaryAddValue(a3, CFSTR("VCSPUUID"), -[VCSessionParticipant uuid](self->_localParticipant, "uuid"));
        CFDictionaryAddValue(a3, CFSTR("LocSw"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCSwitchManager localSwitches](self->_switchManager, "localSwitches")));
        CFDictionaryAddValue(a3, CFSTR("SesSw"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VCSessionSwitches switches](self->_abSwitches, "switches")));
        v19 = (const __CFDictionary *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyInitialStatsDictionary");
        VCUtil_AppendFromDictionary(a3, v19);
        if (v19)
          CFRelease(v19);
        CFDictionaryAddValue(a3, CFSTR("MicMode"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCSession getCurrentMicMode](self, "getCurrentMicMode")));
        CFDictionaryAddValue(a3, CFSTR("SpatialAudioSupported"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSpatialAudioSupported));
        goto LABEL_13;
      case 0xA4u:
        CFDictionaryAddValue(a3, CFSTR("VCSPAudioEnabled"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCSessionParticipant isAudioEnabled](self->_localParticipant, "isAudioEnabled")));
        CFDictionaryAddValue(a3, CFSTR("VCSPVideoEnabled"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled")));
        CFDictionaryAddValue(a3, CFSTR("VCSPScreenEnabled"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCSessionParticipant isScreenEnabled](self->_localParticipant, "isScreenEnabled")));
        if (self->_conversationID)
          conversationID = (const __CFString *)self->_conversationID;
        else
          conversationID = &stru_1E9E58EE0;
        v14 = CFSTR("CID");
        goto LABEL_39;
      case 0xA5u:
      case 0xA6u:
      case 0xAEu:
      case 0xAFu:
      case 0xB0u:
      case 0xB1u:
      case 0xB2u:
      case 0xB3u:
      case 0xB4u:
      case 0xB6u:
      case 0xB7u:
      case 0xB8u:
      case 0xB9u:
      case 0xBAu:
      case 0xBBu:
        return;
      case 0xA7u:
        if (objc_msgSend(a5, "uuid"))
          v21 = (const __CFString *)objc_msgSend(a5, "uuid");
        else
          v21 = CFSTR("nil");
        CFDictionaryAddValue(a3, CFSTR("VCSPUUID"), v21);
        if (a7)
          conversationID = (const __CFString *)objc_msgSend(a7, "description");
        else
          conversationID = CFSTR("nil");
        v14 = CFSTR("VCSNewMKI");
        goto LABEL_39;
      case 0xA8u:
        if (a6)
          conversationID = (const __CFString *)objc_msgSend(a6, "stringValue");
        else
          conversationID = CFSTR("nil");
        v14 = CFSTR("VCSKeyChangeReason");
        goto LABEL_39;
      case 0xA9u:
LABEL_13:
        CFDictionaryAddValue(a3, CFSTR("VCSOneToOneModeEnabled"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_oneToOneModeEnabled));
        CFDictionaryAddValue(a3, CFSTR("VCSMode"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode")));
        conversationID = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCSessionConfiguration outOfProcessCodecsEnabled](self->_configuration, "outOfProcessCodecsEnabled"));
        v14 = CFSTR("VCSOOPCodecs");
        goto LABEL_39;
      case 0xAAu:
        CFDictionaryAddValue(a3, CFSTR("VCSPUUID"), (const void *)objc_msgSend(a5, "uuid"));
        conversationID = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a5, "isAudioEnabled"));
        v14 = CFSTR("VCSPAudioEnabled");
        goto LABEL_39;
      case 0xABu:
        CFDictionaryAddValue(a3, CFSTR("VCSPUUID"), (const void *)objc_msgSend(a5, "uuid"));
        CFDictionaryAddValue(a3, CFSTR("VCSPVideoEnabled"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a5, "isVideoEnabled")));
        *a10 = 1;
        return;
      case 0xACu:
        CFDictionaryAddValue(a3, CFSTR("VCSPUUID"), (const void *)objc_msgSend(a5, "uuid"));
        conversationID = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a5, "isAudioPaused"));
        v14 = CFSTR("VCSPAudioPaused");
        goto LABEL_39;
      case 0xADu:
        CFDictionaryAddValue(a3, CFSTR("VCSPUUID"), (const void *)objc_msgSend(a5, "uuid"));
        conversationID = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a5, "isVideoPaused"));
        v14 = CFSTR("VCSPVideoPaused");
        goto LABEL_39;
      case 0xB5u:
        v16 = (void *)MEMORY[0x1E0CB37E8];
        v17 = 436;
LABEL_28:
        conversationID = (const __CFString *)objc_msgSend(v16, "numberWithUnsignedInt:", *(unsigned int *)((char *)&self->super.super.isa + v17));
        v14 = CFSTR("VCSPTargetBitrate");
        goto LABEL_39;
      case 0xBCu:
        CFDictionaryAddValue(a3, CFSTR("VCSPUUID"), (const void *)objc_msgSend(a5, "uuid"));
        CFDictionaryAddValue(a3, CFSTR("VCSPScreenEnabled"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a5, "isScreenEnabled")));
        conversationID = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_localParticipant == a5);
        v14 = CFSTR("VCSPIsLocalParticipant");
        goto LABEL_39;
      default:
        if ((a4 - 232) >= 2)
          return;
        CFDictionaryAddValue(a3, CFSTR("VCMSStreamGroup"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a8));
        if (objc_msgSend(a5, "uuid"))
          v15 = (const __CFString *)objc_msgSend(a5, "uuid");
        else
          v15 = CFSTR("nil");
        CFDictionaryAddValue(a3, CFSTR("VCSPUUID"), v15);
        conversationID = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a9);
        v14 = CFSTR("VCASStreamIDs");
LABEL_39:
        CFDictionaryAddValue(a3, v14, conversationID);
        break;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSession collectSessionEventKeyFieldsAndSubtype:eventType:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:collectSubtype:].cold.1();
  }
}

- (void)reportingSessionRemoteParticipantEvent:(unsigned __int16)a3 withParticipant:(id)a4 value:(id)a5
{
  int v7;
  const __CFString *v9;
  __CFDictionary *Mutable;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCSession *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v7 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("VCSPAudioEnabled");
  switch(a3)
  {
    case 0xAEu:
      goto LABEL_7;
    case 0xAFu:
      v9 = CFSTR("VCSPVideoEnabled");
      goto LABEL_7;
    case 0xB0u:
      v9 = CFSTR("VCSPAudioPaused");
      goto LABEL_7;
    case 0xB1u:
      v9 = CFSTR("VCSPVideoPaused");
      goto LABEL_7;
    default:
      if (a3 == 189)
      {
        v9 = CFSTR("VCSPScreenEnabled");
LABEL_7:
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFDictionaryAddValue(Mutable, CFSTR("VCSPUUID"), (const void *)objc_msgSend(a4, "uuid"));
        CFDictionaryAddValue(Mutable, v9, a5);
        reportingGenericEvent();
        if (Mutable)
          CFRelease(Mutable);
      }
      else if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSession reportingSessionRemoteParticipantEvent:withParticipant:value:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v11 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v14 = 136316418;
            v15 = v12;
            v16 = 2080;
            v17 = "-[VCSession reportingSessionRemoteParticipantEvent:withParticipant:value:]";
            v18 = 1024;
            v19 = 3125;
            v20 = 2112;
            v21 = v11;
            v22 = 2048;
            v23 = self;
            v24 = 1024;
            v25 = v7;
            _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) EventType:%d is not relevant for Session Remote Participant Event logging", (uint8_t *)&v14, 0x36u);
          }
        }
      }
      return;
  }
}

- (void)reportLocalRateControlExperimentConfiguration
{
  int *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneModeEnabled)
    v2 = &OBJC_IVAR___VCSession__oneToOneSettings;
  else
    v2 = &OBJC_IVAR___VCSession__uplinkRateController;
  v3 = *(Class *)((char *)&self->super.super.isa + *v2);
  v6[0] = CFSTR("RCEV");
  v7[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "rateControlExperimentConfig"));
  v6[1] = CFSTR("RCEG");
  v7[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unint64_t)objc_msgSend(v3, "rateControlExperimentConfig") >> 32);
  v6[2] = CFSTR("SBVERS");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "rateControlExperimentConfig");
  v7[2] = objc_msgSend(v4, "numberWithUnsignedInt:", v5);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  reportingGenericEvent();
}

- (void)handleThermalPressureNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *sessionQueue;
  _QWORD v7[6];
  int v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("VCVideoCaptureServer_NotificationKeyThermalPressureLevel")), "intValue");
  v9 = CFSTR("Thermal");
  v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  sessionQueue = self->_sessionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__VCSession_handleThermalPressureNotification___block_invoke;
  v7[3] = &unk_1E9E522D8;
  v7[4] = self;
  v7[5] = v5;
  v8 = v4;
  dispatch_async(sessionQueue, v7);
}

uint64_t __47__VCSession_handleThermalPressureNotification___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
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
  result = reportingGenericEvent();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v3 + 688) != *(_DWORD *)(a1 + 48))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = (void *)objc_msgSend(*(id *)(v3 + 248), "allValues");
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
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
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(a1 + 32), "sendDeviceStateMessageToParticipant:withStatus:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), *(_QWORD *)(a1 + 40));
        }
        while (v5 != v7);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
        v5 = result;
      }
      while (result);
    }
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 688) = *(_DWORD *)(a1 + 48);
  return result;
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
      v6 = -[VCSession getCurrentMicMode](self, "getCurrentMicMode");
      v7 = CFSTR("MicMode");
      v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      reportingGenericEvent();
    }
  }
}

- (void)registerForThermalFeatureNotifications
{
  void *v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_handleThermalPressureNotification_, CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleMicModeNotification_, *MEMORY[0x1E0C8A1F8], 0);
}

- (void)deregisterForThermalFeatureNotifications
{
  void *v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C8A1F8], 0);
}

- (void)dispatchedAddParticipantWithConfig:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  VCSessionParticipantRemote *v18;
  VCSessionParticipantRemote *v19;
  BOOL *p_localSourceNeedsReset;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  NSObject *notificationQueue;
  _QWORD *v26;
  id v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  uint64_t v33;
  VCConnectionManager *v34;
  id v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  _QWORD v40[7];
  _QWORD v41[7];
  _QWORD v42[7];
  _QWORD v43[7];
  _QWORD v44[7];
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  VCSession *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if ((VCSession *)objc_opt_class() == self)
  {
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
        *(_DWORD *)buf = 136315906;
        v47 = v6;
        v48 = 2080;
        v49 = "-[VCSession dispatchedAddParticipantWithConfig:]";
        v50 = 1024;
        v51 = 3227;
        v52 = 2080;
        v53 = (void *)v8;
        v12 = "VCSession [%s] %s:%d Adding participant[%s]";
        v13 = v7;
        v14 = 38;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v11 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v47 = v9;
        v48 = 2080;
        v49 = "-[VCSession dispatchedAddParticipantWithConfig:]";
        v50 = 1024;
        v51 = 3227;
        v52 = 2112;
        v53 = (void *)v5;
        v54 = 2048;
        v55 = self;
        v56 = 2080;
        v57 = (uint64_t)v11;
        v12 = "VCSession [%s] %s:%d %@(%p) Adding participant[%s]";
        v13 = v10;
        v14 = 58;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipantsMapByServerID, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID"))))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession dispatchedAddParticipantWithConfig:].cold.5();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v33 = objc_msgSend(a3, "idsParticipantID");
          *(_DWORD *)buf = 136316418;
          v47 = v22;
          v48 = 2080;
          v49 = "-[VCSession dispatchedAddParticipantWithConfig:]";
          v50 = 1024;
          v51 = 3230;
          v52 = 2112;
          v53 = (void *)v15;
          v54 = 2048;
          v55 = self;
          v56 = 2048;
          v57 = v33;
          _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) Another participant with same idsParticipantID=%llu already exists!", buf, 0x3Au);
        }
      }
    }
    v24 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3231), 0);
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke;
    block[3] = &unk_1E9E527D0;
    block[4] = self;
    block[5] = a3;
    block[6] = v24;
    v26 = block;
    goto LABEL_42;
  }
  if (self->_localParticipant
    && objc_msgSend((id)objc_msgSend(a3, "uuid"), "isEqualToString:", -[VCSessionParticipant uuid](self->_localParticipant, "uuid")))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession dispatchedAddParticipantWithConfig:].cold.4();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v39 = objc_msgSend(a3, "uuid");
          *(_DWORD *)buf = 136316418;
          v47 = v30;
          v48 = 2080;
          v49 = "-[VCSession dispatchedAddParticipantWithConfig:]";
          v50 = 1024;
          v51 = 3240;
          v52 = 2112;
          v53 = (void *)v16;
          v54 = 2048;
          v55 = self;
          v56 = 2112;
          v57 = v39;
          _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) Attempting to add a remote participant that is using same uuid as local participant's uuid=%@!", buf, 0x3Au);
        }
      }
    }
    v32 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3241), 0);
    notificationQueue = self->_notificationQueue;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_388;
    v44[3] = &unk_1E9E527D0;
    v44[4] = self;
    v44[5] = a3;
    v44[6] = v32;
    v26 = v44;
    goto LABEL_42;
  }
  objc_msgSend(a3, "setOutOfProcessCodecsEnabled:", -[VCSessionConfiguration outOfProcessCodecsEnabled](self->_configuration, "outOfProcessCodecsEnabled"));
  objc_msgSend(a3, "setSpatialMetadata:", self->_spatialMetadata);
  objc_msgSend(a3, "setSpatialMetadataEntryMap:", self->_mediaTypeToSpatialMetadataEntryMap);
  objc_msgSend(a3, "setMediaNegotiator:", -[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"));
  objc_msgSend(a3, "setSecurityKeyManager:", self->_securityKeyManager);
  objc_msgSend(a3, "setSessionUUID:", self->_uuid);
  objc_msgSend(a3, "setTransportSessionID:", self->_transportSessionID);
  objc_msgSend(a3, "setIdsDestination:", self->_idsDestination);
  objc_msgSend(a3, "setIsGKVoiceChat:", self->_isGKVoiceChat);
  objc_msgSend(a3, "setSessionMode:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode"));
  objc_msgSend(a3, "setNetworkFeedbackController:", self->_feedbackController);
  objc_msgSend(a3, "setCaptionsCoordinator:", self->_captionsCoordinator);
  objc_msgSend(a3, "setIsLowLatencyAudio:", +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8);
  objc_msgSend(a3, "setIsOneToOneModeEnabled:", -[VCSessionConfiguration isOneToOneModeEnabled](self->_configuration, "isOneToOneModeEnabled"));
  objc_msgSend(a3, "setOneToOneAuthenticationTagEnabled:", -[VCSessionConfiguration isOneToOneAuthenticationTagEnabled](self->_configuration, "isOneToOneAuthenticationTagEnabled"));
  v17 = (void *)nw_activity_create();
  objc_msgSend(a3, "setNwActivity:", v17);
  nw_release(v17);
  if (self->_nwActivity)
  {
    objc_msgSend(a3, "nwActivity");
    nw_activity_set_parent_activity();
  }
  objc_msgSend(a3, "nwActivity");
  nw_activity_activate();
  objc_msgSend(a3, "setIsServerRTxEnabled:", self->_isServerPacketRetransmissionForVideoEnabled);
  objc_msgSend(a3, "setIsEnhancedJBAdaptationsEnabled:", self->_isEnhancedJBAdaptationsEnabled);
  objc_msgSend(a3, "setEnableMaxCameraBitrateVideoQualityV2:", -[VCSessionSwitches isFeatureEnabled:](self->_abSwitches, "isFeatureEnabled:", 1));
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "setUpDefaultAspectRatios");
  v18 = -[VCSessionParticipantRemote initWithConfig:delegate:]([VCSessionParticipantRemote alloc], "initWithConfig:delegate:", a3, self);
  if (!v18)
  {
    v27 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 15, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3284), 0);
    notificationQueue = self->_notificationQueue;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_2;
    v43[3] = &unk_1E9E527D0;
    v43[4] = self;
    v43[5] = a3;
    v43[6] = v27;
    v26 = v43;
LABEL_42:
    dispatch_async(notificationQueue, v26);
    return;
  }
  v19 = v18;
  if ((-[VCSessionParticipantRemote capabilities](v18, "capabilities") & 1) != 0)
    -[VCSessionParticipantLocal setIsRemoteOnPeace:](self->_localParticipant, "setIsRemoteOnPeace:", 1);
  -[VCSessionParticipant setStatisticsCollector:](v19, "setStatisticsCollector:", -[AVCRateController statisticsCollector](self->_downlinkRateController, "statisticsCollector"));
  -[VCSessionParticipant setReportingAgent:](v19, "setReportingAgent:", self->super._reportingAgent);
  -[VCSessionParticipantRemote setSharingEnabled:](v19, "setSharingEnabled:", self->_sharingEnabled);
  -[VCSessionParticipantRemote setMediaRecorder:](v19, "setMediaRecorder:", self->_mediaRecorder);
  p_localSourceNeedsReset = &self->_localSourceNeedsReset;
  if (self->_localSourceNeedsReset)
  {
    v21 = 10;
    goto LABEL_48;
  }
  if (-[VCSession detectSSRCCollision:resetNeeded:](self, "detectSSRCCollision:resetNeeded:", v19, &self->_localSourceNeedsReset))
  {
    if (*p_localSourceNeedsReset)
      v21 = 10;
    else
      v21 = 9;
LABEL_48:
    v28 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", v21, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3301), 0);
    v29 = self->_notificationQueue;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_3;
    v42[3] = &unk_1E9E527D0;
    v42[4] = self;
    v42[5] = a3;
    v42[6] = v28;
    dispatch_async(v29, v42);
    if (*p_localSourceNeedsReset && (self->_state | 2) == 3)
      -[VCSession dispatchedStopWithError:](self, "dispatchedStopWithError:", v28);
    goto LABEL_51;
  }
  if (self->_oneToOneModeEnabled)
  {
    if (-[VCSession isECNCapableWithRemoteParticipant:](self, "isECNCapableWithRemoteParticipant:", v19))
    {
      if (VCMediaQueue_SetECNEnabled((uint64_t)self->_mediaQueue, self->_isECNEnabled))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSession dispatchedAddParticipantWithConfig:].cold.3();
        }
      }
    }
    -[VCSession setBytesInFlightFlagWithParticipant:](self, "setBytesInFlightFlagWithParticipant:", v19);
    if (!-[VCSession addOneToOneParticipant:](self, "addOneToOneParticipant:", v19))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession dispatchedAddParticipantWithConfig:].cold.2();
      }
      v36 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 15, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3338), 0);
      v37 = self->_notificationQueue;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_390;
      v41[3] = &unk_1E9E527D0;
      v41[4] = self;
      v41[5] = a3;
      v41[6] = v36;
      dispatch_async(v37, v41);
      goto LABEL_51;
    }
    -[VCSession setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:](self, "setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:", -[VCCallInfoBlob frameworkVersion](-[VCSessionParticipant callInfoBlob](self->_localParticipant, "callInfoBlob"), "frameworkVersion"), -[VCCallInfoBlob frameworkVersion](-[VCSessionParticipant callInfoBlob](v19, "callInfoBlob"), "frameworkVersion"));
  }
  else
  {
    if (!-[VCSession configureRemoteParticipant:withConfig:](self, "configureRemoteParticipant:withConfig:", v19, a3))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession dispatchedAddParticipantWithConfig:].cold.1();
      }
      goto LABEL_51;
    }
    -[VCSession setDelegatesForRemoteParticipant:](self, "setDelegatesForRemoteParticipant:", v19);
    if (self->_state == 1)
      -[NSMutableArray addObject:](self->_startingParticipants, "addObject:", v19);
  }
  if (-[VCSessionParticipant isVideoEnabled](v19, "isVideoEnabled"))
  {
    v34 = -[VCTransportSession connectionManager](self->_transportSession, "connectionManager");
    -[VCConnectionManager addMediaHealthStatsHistoryEntryForParticipantID:](v34, "addMediaHealthStatsHistoryEntryForParticipantID:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID")));
  }
  if ((self->_state | 2) == 3)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByServerID, "setObject:forKeyedSubscript:", v19, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID")));
    -[VCSessionParticipantRemote start](v19, "start");
  }
  -[VCSessionParticipantRemote updatePositionalInfo:shouldReapply:](v19, "updatePositionalInfo:shouldReapply:", objc_msgSend(a3, "positionalInfo"), 0);
  -[VCSession applySpatialMetadata](self, "applySpatialMetadata");
  if ((self->_state | 2) != 3)
  {
    if (-[VCSession registerRemoteParticipantToSession:](self, "registerRemoteParticipantToSession:", v19))
      v35 = 0;
    else
      v35 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 17, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3365), 0);
    v38 = self->_notificationQueue;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_2_391;
    v40[3] = &unk_1E9E527D0;
    v40[4] = self;
    v40[5] = v19;
    v40[6] = v35;
    dispatch_async(v38, v40);
    -[NSMutableArray removeObject:](self->_initializingParticipants, "removeObject:", v19);
  }
LABEL_51:

}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:addParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_388(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:addParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:addParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_3(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:addParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_390(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:addParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __48__VCSession_dispatchedAddParticipantWithConfig___block_invoke_2_391(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:addParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(_QWORD *)(a1 + 48) == 0);
}

- (BOOL)configureRemoteParticipant:(id)a3 withConfig:(id)a4
{
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *notificationQueue;
  _QWORD *v12;
  id v13;
  _QWORD block[7];
  _QWORD v15[8];

  v15[7] = *MEMORY[0x1E0C80C00];
  if (-[VCSession setOneToOneConfigOnRemoteParticipant:](self, "setOneToOneConfigOnRemoteParticipant:"))
  {
    if ((objc_msgSend(a3, "configureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:", +[VCSession deviceRoleForSessionMode:](VCSession, "deviceRoleForSessionMode:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode")), 0, 0, 6) & 1) != 0)
    {
      -[NSMutableArray addObject:](self->_initializingParticipants, "addObject:", a3);
      return 1;
    }
    v13 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 17, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3390), 0);
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__VCSession_configureRemoteParticipant_withConfig___block_invoke_2;
    block[3] = &unk_1E9E527D0;
    block[4] = self;
    block[5] = a4;
    block[6] = v13;
    v12 = block;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession configureRemoteParticipant:withConfig:].cold.1(v8, a3, v9);
    }
    v10 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 17, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3382), 0);
    notificationQueue = self->_notificationQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__VCSession_configureRemoteParticipant_withConfig___block_invoke;
    v15[3] = &unk_1E9E527D0;
    v15[4] = self;
    v15[5] = a4;
    v15[6] = v10;
    v12 = v15;
  }
  dispatch_async(notificationQueue, v12);
  return 0;
}

uint64_t __51__VCSession_configureRemoteParticipant_withConfig___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:addParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __51__VCSession_configureRemoteParticipant_withConfig___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:addParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), 0, *(_QWORD *)(a1 + 48));
}

- (void)dispatchedAddParticipantConfigurations:(id)a3
{
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

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        -[VCSession dispatchedAddParticipantWithConfig:](self, "dispatchedAddParticipantWithConfig:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
  if (!self->_oneToOneModeEnabled)
    -[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:](self, "distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:", 1);
}

- (void)dispatchedRemoveParticipant:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  VCSessionParticipantRemote *v14;
  id v15;
  OS_dispatch_queue *v16;
  _QWORD *v17;
  NSObject *notificationQueue;
  VCConnectionManager *v19;
  int v20;
  _QWORD block[6];
  _QWORD v22[7];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  VCSession *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v24 = v6;
        v25 = 2080;
        v26 = "-[VCSession dispatchedRemoveParticipant:]";
        v27 = 1024;
        v28 = 3410;
        v29 = 2112;
        v30 = a3;
        v8 = "VCSession [%s] %s:%d Removing participant[%@]";
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
      v5 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v24 = v11;
        v25 = 2080;
        v26 = "-[VCSession dispatchedRemoveParticipant:]";
        v27 = 1024;
        v28 = 3410;
        v29 = 2112;
        v30 = (id)v5;
        v31 = 2048;
        v32 = self;
        v33 = 2112;
        v34 = a3;
        v8 = "VCSession [%s] %s:%d %@(%p) Removing participant[%@]";
        v9 = v12;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
  v13 = -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipantsMapByUUID, "objectForKeyedSubscript:", a3);
  if (v13)
  {
    v14 = (VCSessionParticipantRemote *)v13;
    if (self->_oneToOneModeEnabled)
    {
      VCConnectionManager_AddTelemetryForPacketHistory((uint64_t)-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]));
      VCReporting_finalizeAggregationWithPayload();
      if (v14 == -[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"))
        -[VCSession cleanupOneToOneDelegates](self, "cleanupOneToOneDelegates");
    }
    v19 = -[VCTransportSession connectionManager](self->_transportSession, "connectionManager");
    -[VCConnectionManager removeMediaHealthStatsHistoryEntryForParticipantID:](v19, "removeMediaHealthStatsHistoryEntryForParticipantID:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[VCSessionParticipant idsParticipantID](v14, "idsParticipantID")));
    if ((self->_state | 2) == 3)
      -[VCSessionParticipantRemote stop](v14, "stop");
    -[NSMutableArray removeObject:](self->_startingParticipants, "removeObject:", v14);
    v20 = -[NSMutableSet containsObject:](self->_stoppingParticipants, "containsObject:", v14);
    -[NSMutableSet removeObject:](self->_stoppingParticipants, "removeObject:", v14);
    -[NSMutableArray removeObject:](self->_initializingParticipants, "removeObject:", v14);
    -[VCSession removeDelegatesForRemoteParticipant:](self, "removeDelegatesForRemoteParticipant:", v14);
    if (!-[NSMutableSet count](self->_stoppingParticipants, "count") && v20)
      -[VCSession processDidStop](self, "processDidStop");
    -[VCSessionParticipant participantVideoToken](v14, "participantVideoToken");
    -[VCSessionParticipant idsParticipantID](v14, "idsParticipantID");
    kdebug_trace();
    -[VCSession unregisterRemoteParticipantFromSession:](self, "unregisterRemoteParticipantFromSession:", v14);
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__VCSession_dispatchedRemoveParticipant___block_invoke_2;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a3;
    v17 = block;
  }
  else
  {
    v15 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3413), 0);
    v16 = self->_notificationQueue;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __41__VCSession_dispatchedRemoveParticipant___block_invoke;
    v22[3] = &unk_1E9E527D0;
    v22[4] = self;
    v22[5] = a3;
    v22[6] = v15;
    v17 = v22;
    notificationQueue = v16;
  }
  dispatch_async(notificationQueue, v17);
}

uint64_t __41__VCSession_dispatchedRemoveParticipant___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:removeParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

uint64_t __41__VCSession_dispatchedRemoveParticipant___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:removeParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)dispatchedStart
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Local source marked as invalid. Can't start.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t __28__VCSession_dispatchedStart__block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:didStart:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __28__VCSession_dispatchedStart__block_invoke_394(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:didStart:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

uint64_t __28__VCSession_dispatchedStart__block_invoke_395(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:didStart:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

- (void)stopMediaQueueOneToOne
{
  _VCSessionOneToOneSettings *p_oneToOneSettings;
  uint64_t vcMediaQueue;

  p_oneToOneSettings = &self->_oneToOneSettings;
  if (self->_oneToOneSettings.mediaQueue != (tagHANDLE *)0xFFFFFFFFLL)
    MediaQueue_Stop();
  vcMediaQueue = (uint64_t)p_oneToOneSettings->vcMediaQueue;
  if (vcMediaQueue)
    VCMediaQueue_Stop(vcMediaQueue);
}

- (void)dispatchedStopWithError:(id)a3
{
  -[VCSession dispatchedStopWithError:didRemoteCancel:](self, "dispatchedStopWithError:didRemoteCancel:", a3, 0);
}

- (void)dispatchedStopWithError:(id)a3 didRemoteCancel:(BOOL)a4
{
  __CFString *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  char *v11;
  os_log_t *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  char *v16;
  os_log_t *v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  NSError *stopError;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  NSError *v33;
  NSError *v34;
  NSObject *notificationQueue;
  id v36;
  _QWORD block[6];
  _QWORD v38[6];
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  VCSession *v50;
  __int16 v51;
  NSError *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_33;
    __str = 0;
    v7 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    v15 = -[VCSession remoteParticipants](self, "remoteParticipants")
        ? -[NSString UTF8String](-[NSArray description](-[VCSession remoteParticipants](self, "remoteParticipants"), "description"), "UTF8String"): "<nil>";
    asprintf(&__str, "Stop called. error=%s, remoteParticipants=%s", v7, v15);
    if (!__str)
      goto LABEL_33;
    v36 = a3;
    __lasts = 0;
    v16 = strtok_r(__str, "\n", &__lasts);
    v17 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *v17;
        if (os_log_type_enabled(*v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v42 = v18;
          v43 = 2080;
          v44 = "-[VCSession dispatchedStopWithError:didRemoteCancel:]";
          v45 = 1024;
          v46 = 3580;
          v47 = 2080;
          v48 = "";
          v49 = 2080;
          v50 = (VCSession *)v16;
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v16 = strtok_r(0, "\n", &__lasts);
    }
    while (v16);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (__CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_33;
    __str = 0;
    v8 = (const char *)-[__CFString UTF8String](v6, "UTF8String");
    v9 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    v10 = -[VCSession remoteParticipants](self, "remoteParticipants")
        ? -[NSString UTF8String](-[NSArray description](-[VCSession remoteParticipants](self, "remoteParticipants"), "description"), "UTF8String"): "<nil>";
    asprintf(&__str, "%s(%p) Stop called. error=%s, remoteParticipants=%s", v8, self, v9, v10);
    if (!__str)
      goto LABEL_33;
    v36 = a3;
    __lasts = 0;
    v11 = strtok_r(__str, "\n", &__lasts);
    v12 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *v12;
        if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v42 = v13;
          v43 = 2080;
          v44 = "-[VCSession dispatchedStopWithError:didRemoteCancel:]";
          v45 = 1024;
          v46 = 3580;
          v47 = 2080;
          v48 = "";
          v49 = 2080;
          v50 = (VCSession *)v11;
          _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v11 = strtok_r(0, "\n", &__lasts);
    }
    while (v11);
  }
  free(__str);
  a3 = v36;
LABEL_33:
  switch(self->_state)
  {
    case 0u:
    case 2u:
    case 4u:
      if (self->_oneToOneModeEnabled)
        return;
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            stopError = self->_stopError;
            *(_DWORD *)buf = 136315906;
            v42 = v24;
            v43 = 2080;
            v44 = "-[VCSession dispatchedStopWithError:didRemoteCancel:]";
            v45 = 1024;
            v46 = 3588;
            v47 = 2048;
            v48 = (const char *)stopError;
            v27 = "VCSession [%s] %s:%d Session already stopped. stopError=%p";
            v28 = v25;
            v29 = 38;
LABEL_58:
            _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v20 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v20 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v31 = VRTraceErrorLogLevelToCSTR();
          v32 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v33 = self->_stopError;
            *(_DWORD *)buf = 136316418;
            v42 = v31;
            v43 = 2080;
            v44 = "-[VCSession dispatchedStopWithError:didRemoteCancel:]";
            v45 = 1024;
            v46 = 3588;
            v47 = 2112;
            v48 = (const char *)v20;
            v49 = 2048;
            v50 = self;
            v51 = 2048;
            v52 = v33;
            v27 = "VCSession [%s] %s:%d %@(%p) Session already stopped. stopError=%p";
            v28 = v32;
            v29 = 58;
            goto LABEL_58;
          }
        }
      }
      v34 = self->_stopError;
      if (!v34)
        v34 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 7, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3589), 0);
      notificationQueue = self->_notificationQueue;
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __53__VCSession_dispatchedStopWithError_didRemoteCancel___block_invoke;
      v38[3] = &unk_1E9E52238;
      v38[4] = self;
      v38[5] = v34;
      dispatch_async(notificationQueue, v38);
      return;
    case 1u:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v42 = v21;
          v43 = 2080;
          v44 = "-[VCSession dispatchedStopWithError:didRemoteCancel:]";
          v45 = 1024;
          v46 = 3595;
          _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Session stop when start in progress, transitioning to stopping", buf, 0x1Cu);
        }
      }
      if (self->_oneToOneModeEnabled)
        v23 = 0;
      else
        v23 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 5, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3598), 0);
      v30 = self->_notificationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__VCSession_dispatchedStopWithError_didRemoteCancel___block_invoke_400;
      block[3] = &unk_1E9E52238;
      block[4] = self;
      block[5] = v23;
      dispatch_async(v30, block);
      goto LABEL_49;
    default:
      self->_stopError = (NSError *)a3;
LABEL_49:
      if (self->_oneToOneModeEnabled)
        -[VCSession reportingSessionStopEventWithError:](self, "reportingSessionStopEventWithError:", self->_stopError);
      if (self->_nwActivityActiveSession)
      {
        nw_activity_complete_with_reason();
        nw_release(self->_nwActivityActiveSession);
        self->_nwActivityActiveSession = 0;
      }
      -[VCSession setState:](self, "setState:", 4);
      -[VCObject startTimeoutTimer](self, "startTimeoutTimer");
      -[VCSession tearDown](self, "tearDown");
      -[VCSession stopMediaQueueOneToOne](self, "stopMediaQueueOneToOne");
      -[VCSession unregisterReportingTask](self, "unregisterReportingTask");
      return;
  }
}

uint64_t __53__VCSession_dispatchedStopWithError_didRemoteCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:didStopWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __53__VCSession_dispatchedStopWithError_didRemoteCancel___block_invoke_400(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:didStart:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

- (void)dispatchedTransportStop
{
  -[VCSession stopSessionMessaging](self, "stopSessionMessaging");
  -[VCTransportSession stop](self->_transportSession, "stop");
}

- (void)tearDown
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCSession tearDown]";
      v9 = 1024;
      v10 = 3638;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Tearing down session", (uint8_t *)&v5, 0x1Cu);
    }
  }
  reportingStopTimer();
  -[VCSession stopAllParticipants](self, "stopAllParticipants");
  VCMediaQueue_Stop((uint64_t)self->_mediaQueue);
  -[VCSessionStatsController stopLocalSessionStatsUpdate](self->_sessionStatsController, "stopLocalSessionStatsUpdate");
  -[VCSecurityKeyManager stop](self->_securityKeyManager, "stop");
  -[AVCRateController stop](self->_uplinkRateController, "stop");
  -[AVCRateController stop](self->_downlinkRateController, "stop");
  -[VCSession stopRateControllerOneToOne](self, "stopRateControllerOneToOne");
}

- (void)dispatchedUpdateConfiguration:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  uint64_t v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  int v25;
  _BOOL4 v26;
  NSObject *notificationQueue;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  _BOOL4 v31;
  id v32;
  _QWORD block[7];
  char v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  VCSession *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  VCSession *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v41 = v6;
        v42 = 2080;
        v43 = "-[VCSession dispatchedUpdateConfiguration:]";
        v44 = 1024;
        v45 = 3650;
        v46 = 2048;
        v47 = self;
        v48 = 2112;
        v49 = (uint64_t)a3;
        v8 = "VCSession [%s] %s:%d VCSession:[%p] configurationDict:[%@]";
        v9 = v7;
        v10 = 48;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v41 = v11;
        v42 = 2080;
        v43 = "-[VCSession dispatchedUpdateConfiguration:]";
        v44 = 1024;
        v45 = 3650;
        v46 = 2112;
        v47 = (VCSession *)v5;
        v48 = 2048;
        v49 = (uint64_t)self;
        v50 = 2048;
        v51 = self;
        v52 = 2112;
        v53 = a3;
        v8 = "VCSession [%s] %s:%d %@(%p) VCSession:[%p] configurationDict:[%@]";
        v9 = v12;
        v10 = 68;
        goto LABEL_11;
      }
    }
  }
  v13 = -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode");
  v14 = -[VCSessionConfiguration isOneToOneModeEnabled](self->_configuration, "isOneToOneModeEnabled");
  v15 = -[VCSessionConfiguration isRemoteScreenControlEnabled](self->_configuration, "isRemoteScreenControlEnabled");
  if (!-[VCSessionConfiguration updateWithClientDictionary:](self->_configuration, "updateWithClientDictionary:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession dispatchedUpdateConfiguration:].cold.2();
    }
    goto LABEL_42;
  }
  if (v13 != -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode"))
  {
    v16 = +[VCSession deviceRoleForSessionMode:](VCSession, "deviceRoleForSessionMode:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode"));
    if (-[VCSessionParticipant updateConfigurationWithDeviceRole:](self->_localParticipant, "updateConfigurationWithDeviceRole:", v16))
    {
      v32 = a3;
      -[VCSession setupSpatialAudio](self, "setupSpatialAudio");
      v31 = v14;
      v17 = -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode") != 1
         && +[VCHardwareSettings isSpatialAudioSupported](VCHardwareSettings, "isSpatialAudioSupported");
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v18 = (void *)-[NSMutableDictionary allValues](self->_remoteParticipantsMapByUUID, "allValues");
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v37 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            if ((objc_msgSend(v23, "updateConfigurationWithDeviceRole:", v16) & 1) == 0)
            {
              a3 = v32;
              v14 = v31;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                v28 = VRTraceErrorLogLevelToCSTR();
                v29 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                {
                  v30 = objc_msgSend(v23, "uuid");
                  *(_DWORD *)buf = 136316162;
                  v41 = v28;
                  v42 = 2080;
                  v43 = "-[VCSession dispatchedUpdateConfiguration:]";
                  v44 = 1024;
                  v45 = 3671;
                  v46 = 2048;
                  v47 = self;
                  v48 = 2112;
                  v49 = v30;
                  _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d VCSession:[%p] Failed to update the remote participant:[%@] configuration", buf, 0x30u);
                }
              }
              goto LABEL_42;
            }
            if (v17)
              objc_msgSend(v23, "updatePositionalInfo:shouldReapply:", objc_msgSend((id)objc_msgSend(v23, "positionalInfo"), "serialize"), 1);
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
          if (v20)
            continue;
          break;
        }
      }
      if (v17)
        -[VCSession applySpatialMetadata](self, "applySpatialMetadata");
      a3 = v32;
      v14 = v31;
      if (v15 != -[VCSessionConfiguration isRemoteScreenControlEnabled](self->_configuration, "isRemoteScreenControlEnabled"))-[VCSession setRemoteScreenControlEnabled:](self, "setRemoteScreenControlEnabled:", -[VCSessionConfiguration isRemoteScreenControlEnabled](self->_configuration, "isRemoteScreenControlEnabled"));
      goto LABEL_32;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession dispatchedUpdateConfiguration:].cold.1();
    }
LABEL_42:
    v24 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 11, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3693), 0);
    v25 = 0;
    goto LABEL_35;
  }
LABEL_32:
  if (v14 != -[VCSessionConfiguration isOneToOneModeEnabled](self->_configuration, "isOneToOneModeEnabled"))
    -[VCSession setOneToOneModeEnabled:configurationDict:](self, "setOneToOneModeEnabled:configurationDict:", -[VCSessionConfiguration isOneToOneModeEnabled](self->_configuration, "isOneToOneModeEnabled"), a3);
  v24 = 0;
  v25 = 1;
LABEL_35:
  v26 = -[VCSessionConfiguration isOneToOneModeEnabled](self->_configuration, "isOneToOneModeEnabled");
  if (!v25 || ((v14 ^ v26) & 1) == 0)
  {
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__VCSession_dispatchedUpdateConfiguration___block_invoke;
    block[3] = &unk_1E9E53608;
    block[4] = self;
    block[5] = a3;
    v34 = v25;
    block[6] = v24;
    dispatch_async(notificationQueue, block);
  }
}

uint64_t __43__VCSession_dispatchedUpdateConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:updateConfiguration:didSucceed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)stopAllParticipants
{
  NSMutableSet *stoppingParticipants;
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
  -[VCSession cleanupOneToOneDelegates](self, "cleanupOneToOneDelegates");
  -[NSMutableSet addObjectsFromArray:](self->_stoppingParticipants, "addObjectsFromArray:", -[VCSession remoteParticipants](self, "remoteParticipants"));
  -[NSMutableSet addObjectsFromArray:](self->_stoppingParticipants, "addObjectsFromArray:", self->_startingParticipants);
  -[NSMutableSet addObjectsFromArray:](self->_stoppingParticipants, "addObjectsFromArray:", self->_initializingParticipants);
  -[NSMutableSet addObject:](self->_stoppingParticipants, "addObject:", self->_localParticipant);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  stoppingParticipants = self->_stoppingParticipants;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](stoppingParticipants, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
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
          objc_enumerationMutation(stoppingParticipants);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "stop");
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](stoppingParticipants, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }
}

- (void)dispatchedParticipant:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  char v21;
  unsigned int state;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *notificationQueue;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  unsigned int v31;
  uint64_t v32;
  id v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSObject *v38;
  unsigned int v39;
  uint64_t v40;
  id v41;
  _QWORD v42[7];
  char v43;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  _BYTE v52[24];
  __int16 v53;
  id v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v6 = a4;
  v59 = *MEMORY[0x1E0C80C00];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v46 = v10;
        v47 = 2080;
        v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
        v49 = 1024;
        v50 = 3718;
        v51 = 1024;
        *(_DWORD *)v52 = v6;
        *(_WORD *)&v52[4] = 2112;
        *(_QWORD *)&v52[6] = a5;
        *(_WORD *)&v52[14] = 2112;
        *(_QWORD *)&v52[16] = objc_msgSend(a3, "uuid");
        v53 = 2112;
        v54 = -[VCSession participantsToString](self, "participantsToString");
        v12 = "VCSession [%s] %s:%d Participant didStart:%d error:[%@] participantID[%@] %@";
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
      v9 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        v46 = v15;
        v47 = 2080;
        v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
        v49 = 1024;
        v50 = 3718;
        v51 = 2112;
        *(_QWORD *)v52 = v9;
        *(_WORD *)&v52[8] = 2048;
        *(_QWORD *)&v52[10] = self;
        *(_WORD *)&v52[18] = 1024;
        *(_DWORD *)&v52[20] = v6;
        v53 = 2112;
        v54 = a5;
        v55 = 2112;
        v56 = objc_msgSend(a3, "uuid");
        v57 = 2112;
        v58 = -[VCSession participantsToString](self, "participantsToString");
        v12 = "VCSession [%s] %s:%d %@(%p) Participant didStart:%d error:[%@] participantID[%@] %@";
        v13 = v16;
        v14 = 84;
        goto LABEL_11;
      }
    }
  }
  -[NSMutableArray removeObject:](self->_startingParticipants, "removeObject:", a3);
  if (!v6 && self->_state == 1)
  {
    -[VCSession setState:](self, "setState:", 2);
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession dispatchedParticipant:didStart:error:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v46 = v18;
          v47 = 2080;
          v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
          v49 = 1024;
          v50 = 3724;
          v51 = 2112;
          *(_QWORD *)v52 = v17;
          *(_WORD *)&v52[8] = 2048;
          *(_QWORD *)&v52[10] = self;
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d %@(%p) Session failed to start.", buf, 0x30u);
        }
      }
    }
  }
  v20 = v6;
  if (!-[NSMutableArray count](self->_startingParticipants, "count"))
  {
    state = self->_state;
    if (state != 4 && state != 2)
    {
      v20 = v6;
      if (state == 1)
      {
        -[VCSession setState:](self, "setState:", 3);
        MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCSession-didStart");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v25 = VRTraceErrorLogLevelToCSTR();
          v26 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v46 = v25;
            v47 = 2080;
            v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
            v49 = 1024;
            v50 = 3730;
            v51 = 2048;
            *(_QWORD *)v52 = self;
            _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d @:@ VCSession-didStart (%p)", buf, 0x26u);
          }
        }
        objc_msgSend(a3, "logAllStreamTokens");
        -[VCSession broadcastInitialMediaState](self, "broadcastInitialMediaState");
        notificationQueue = self->_notificationQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __50__VCSession_dispatchedParticipant_didStart_error___block_invoke;
        block[3] = &unk_1E9E521C0;
        block[4] = self;
        dispatch_async(notificationQueue, block);
        v20 = v6;
      }
      goto LABEL_25;
    }
    -[VCSession tearDown](self, "tearDown");
    -[VCSession stopMediaQueueOneToOne](self, "stopMediaQueueOneToOne");
    -[VCSession dispatchedTransportStop](self, "dispatchedTransportStop");
    -[VCSession unregisterReportingTask](self, "unregisterReportingTask");
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      {
LABEL_61:
        v20 = 0;
        goto LABEL_25;
      }
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      v20 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      v31 = self->_state;
      v32 = objc_msgSend(a3, "uuid");
      v33 = -[VCSession participantsToString](self, "participantsToString");
      *(_DWORD *)buf = 136316418;
      v46 = v29;
      v47 = 2080;
      v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
      v49 = 1024;
      v50 = 3744;
      v51 = 1024;
      *(_DWORD *)v52 = v31;
      *(_WORD *)&v52[4] = 2112;
      *(_QWORD *)&v52[6] = v32;
      *(_WORD *)&v52[14] = 2112;
      *(_QWORD *)&v52[16] = v33;
      v34 = "VCSession [%s] %s:%d Resetting Participant shouldStart to false as session state=%d failed to move to start,"
            " participantID[%@] %@";
      v35 = v30;
      v36 = 54;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_61;
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      v20 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      v39 = self->_state;
      v40 = objc_msgSend(a3, "uuid");
      v41 = -[VCSession participantsToString](self, "participantsToString");
      *(_DWORD *)buf = 136316930;
      v46 = v37;
      v47 = 2080;
      v48 = "-[VCSession dispatchedParticipant:didStart:error:]";
      v49 = 1024;
      v50 = 3744;
      v51 = 2112;
      *(_QWORD *)v52 = v24;
      *(_WORD *)&v52[8] = 2048;
      *(_QWORD *)&v52[10] = self;
      *(_WORD *)&v52[18] = 1024;
      *(_DWORD *)&v52[20] = v39;
      v53 = 2112;
      v54 = (id)v40;
      v55 = 2112;
      v56 = (uint64_t)v41;
      v34 = "VCSession [%s] %s:%d %@(%p) Resetting Participant shouldStart to false as session state=%d failed to move to"
            " start, participantID[%@] %@";
      v35 = v38;
      v36 = 74;
    }
    _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    goto LABEL_61;
  }
LABEL_25:
  if (-[NSMutableArray containsObject:](self->_initializingParticipants, "containsObject:", a3))
  {
    if (v6)
    {
      if (-[VCSession registerRemoteParticipantToSession:](self, "registerRemoteParticipantToSession:", a3))
      {
        v21 = 1;
        goto LABEL_49;
      }
      a5 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 17, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3753), 0);
      LOBYTE(v20) = 0;
    }
    else
    {
      if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipantsMapByUUID, "objectForKeyedSubscript:", objc_msgSend(a3, "uuid")))-[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteParticipantsMapByServerID, "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "idsParticipantID")));
      -[VCSession removeDelegatesForRemoteParticipant:](self, "removeDelegatesForRemoteParticipant:", a3);
    }
    v21 = 0;
LABEL_49:
    v28 = self->_notificationQueue;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __50__VCSession_dispatchedParticipant_didStart_error___block_invoke_401;
    v42[3] = &unk_1E9E53608;
    v42[4] = self;
    v42[5] = a3;
    v43 = v21;
    v42[6] = a5;
    dispatch_async(v28, v42);
    -[NSMutableArray removeObject:](self->_initializingParticipants, "removeObject:", a3);
    if (!v20)
      return;
    goto LABEL_50;
  }
  if (!v20)
    return;
LABEL_50:
  -[VCSession setupOneToOneVideoReceiverDelegate](self, "setupOneToOneVideoReceiverDelegate");
  -[VCSession setupOneToOneVideoStreamDelegate](self, "setupOneToOneVideoStreamDelegate");
  if (self->_oneToOneModeEnabled)
    -[VCSession startOneToOne](self, "startOneToOne");
}

uint64_t __50__VCSession_dispatchedParticipant_didStart_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:didStart:error:", *(_QWORD *)(a1 + 32), 1, 0);
  result = -[VCDefaults forceMuteAtStart](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceMuteAtStart");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setMuted:", 1);
  return result;
}

uint64_t __50__VCSession_dispatchedParticipant_didStart_error___block_invoke_401(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:addParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)setupOneToOneVideoReceiverDelegate
{
  VCSessionParticipantLocal *localParticipant;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  if (self->_oneToOneModeEnabled && -[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled"))
  {
    localParticipant = self->_localParticipant;
    if (localParticipant)
    {
      -[VCSessionParticipantLocal oneToOneSettings](localParticipant, "oneToOneSettings");
      localParticipant = (VCSessionParticipantLocal *)v6;
    }
    else
    {
      v6 = 0u;
      v7 = 0u;
      v5 = 0u;
    }
    v4 = objc_msgSend((id)objc_msgSend((id)-[VCSessionParticipantLocal objectForKeyedSubscript:](localParticipant, "objectForKeyedSubscript:", &unk_1E9EF5360, v5, v6, v7), "stream"), "getVideoReceiverFeedbackDelegate");
    if (v4)
      objc_msgSend(-[NSArray firstObject](-[VCSession remoteParticipants](self, "remoteParticipants"), "firstObject"), "setVideoReceiverFeedbackDelegate:", v4);
  }
}

- (void)setupOneToOneVideoStreamDelegate
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneModeEnabled)
  {
    v2[0] = VCSession_RemoteScreenAttributesDidChange;
    -[VCSessionParticipantRemote setVideoStreamDelegate:delegateFunctions:](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "setVideoStreamDelegate:delegateFunctions:", self, v2);
  }
}

void __VCSession_RemoteScreenAttributesDidChange_block_invoke(uint64_t a1)
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "VCSession_RemoteScreenAttributesDidChange_block_invoke";
      v9 = 1024;
      v10 = 3811;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d remoteScreenAttributes=%@", (uint8_t *)&v5, 0x26u);
    }
  }
  VCMediaRecorder_UpdateTargetScreenAttributes(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 824), *(_QWORD *)(a1 + 32));
}

- (void)processDidStop
{
  unsigned int state;
  NSObject *v4;
  _QWORD *v5;
  id v6;
  OS_dispatch_queue *notificationQueue;
  _QWORD block[6];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state == 2)
  {
    v6 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 8, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession.m", 3827), 0);
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__VCSession_processDidStop__block_invoke_2;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = v6;
    v5 = block;
    v4 = notificationQueue;
    goto LABEL_5;
  }
  if (state == 4)
  {
    v4 = self->_notificationQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __27__VCSession_processDidStop__block_invoke;
    v9[3] = &unk_1E9E521C0;
    v9[4] = self;
    v5 = v9;
LABEL_5:
    dispatch_async(v4, v5);
  }
  -[VCNetworkFeedbackController stop](self->_feedbackController, "stop");
  -[VCSession setState:](self, "setState:", 0);
  -[VCSession dispatchedTransportStop](self, "dispatchedTransportStop");
  -[VCSession stopTimeoutTimer](self, "stopTimeoutTimer");
}

void __27__VCSession_processDidStop__block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:didStopWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 624));
  objc_msgSend(*(id *)(a1 + 32), "reportingSessionStopEventWithError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 624));

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 624) = 0;
}

uint64_t __27__VCSession_processDidStop__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:didStart:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

- (void)dispatchedParticipant:(id)a3 didStopWithError:(id)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int state;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  VCSession *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v17 = 136316418;
    v18 = v8;
    v19 = 2080;
    v20 = "-[VCSession dispatchedParticipant:didStopWithError:]";
    v21 = 1024;
    v22 = 3839;
    v23 = 2112;
    v24 = a4;
    v25 = 2112;
    v26 = (VCSession *)objc_msgSend(a3, "uuid");
    v27 = 2112;
    v28 = -[VCSession participantsToString](self, "participantsToString");
    v10 = "VCSession [%s] %s:%d Participant didStopWithError:[%@] participantID[%@] %@";
    v11 = v9;
    v12 = 58;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136316930;
      v18 = v13;
      v19 = 2080;
      v20 = "-[VCSession dispatchedParticipant:didStopWithError:]";
      v21 = 1024;
      v22 = 3839;
      v23 = 2112;
      v24 = (id)v7;
      v25 = 2048;
      v26 = self;
      v27 = 2112;
      v28 = a4;
      v29 = 2112;
      v30 = objc_msgSend(a3, "uuid");
      v31 = 2112;
      v32 = -[VCSession participantsToString](self, "participantsToString");
      v10 = "VCSession [%s] %s:%d %@(%p) Participant didStopWithError:[%@] participantID[%@] %@";
      v11 = v14;
      v12 = 78;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
    }
  }
LABEL_12:
  state = self->_state;
  if (state == 4 || state == 2)
  {
    -[NSMutableSet removeObject:](self->_stoppingParticipants, "removeObject:", a3);
    if (!-[NSMutableSet count](self->_stoppingParticipants, "count"))
      -[VCSession processDidStop](self, "processDidStop");
  }
}

- (id)newNetworkBitrateString:(id *)a3
{
  void *v4;
  uint64_t i;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 5);
  for (i = 0; i != 4; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%d "), a3->var1[i]);
  objc_msgSend(v4, "appendFormat:", CFSTR("%d"), a3->var1[4]);
  return v4;
}

- (void)generateReportDictionary:(__CFDictionary *)a3
{
  id v5;
  VCSessionParticipantLocal *localParticipant;
  id v7;
  const __CFString *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSString *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  int width_low;
  CGFloat width;
  int v28;
  NSString *v29;
  const __CFDictionary *v30;
  VCConnectionManager *v31;
  VCConnectionManager *v32;
  CFNumberRef v33;
  VCSession *v34;
  CFMutableDictionaryRef theDict;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  NSArray *obj;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int valuePtr;
  unsigned __int8 v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  _BYTE v55[20];
  __int128 v56;
  _BYTE v57[14];
  __int16 v58;
  int v59;
  _BYTE v60[128];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _OWORD v65[5];
  uint64_t v66;
  _OWORD v67[5];
  uint64_t v68;
  _OWORD v69[5];
  uint64_t v70;
  _OWORD v71[5];
  uint64_t v72;
  _OWORD v73[5];
  uint64_t v74;
  _OWORD v75[5];
  uint64_t v76;
  _OWORD v77[5];
  uint64_t v78;
  NSSize v79[2];
  NSSize v80;
  __int128 aSize;
  __int128 v82;
  uint64_t v83;
  _OWORD v84[2];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  _OWORD v89[5];
  uint64_t v90;
  _OWORD v91[5];
  uint64_t v92;
  uint64_t v93;
  NSSize v94;

  v93 = *MEMORY[0x1E0C80C00];
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v92 = 0;
  memset(v91, 0, sizeof(v91));
  v90 = 0;
  memset(v89, 0, sizeof(v89));
  v88 = 0;
  v87 = 0u;
  v86 = 0u;
  v85 = 0u;
  memset(v84, 0, sizeof(v84));
  v83 = 0;
  v82 = 0u;
  aSize = 0u;
  v80 = (NSSize)0;
  memset(v79, 0, sizeof(v79));
  v78 = 0;
  memset(v77, 0, sizeof(v77));
  v76 = 0;
  memset(v75, 0, sizeof(v75));
  v74 = 0;
  memset(v73, 0, sizeof(v73));
  v72 = 0;
  memset(v71, 0, sizeof(v71));
  v70 = 0;
  memset(v69, 0, sizeof(v69));
  v68 = 0;
  memset(v67, 0, sizeof(v67));
  v66 = 0;
  memset(v65, 0, sizeof(v65));
  localParticipant = self->_localParticipant;
  if (localParticipant)
  {
    -[VCSessionParticipantLocal collectVideoChannelMetrics:](localParticipant, "collectVideoChannelMetrics:", v84);
    -[VCSessionParticipantLocal collectAudioChannelMetrics:](self->_localParticipant, "collectAudioChannelMetrics:", v77);
    -[VCSessionParticipant collectCaptionsChannelMetrics:](self->_localParticipant, "collectCaptionsChannelMetrics:", v73);
    CFDictionaryAddValue(a3, CFSTR("VCSActiveStreamsList"), -[VCSessionParticipantLocal activeStreamKeys](self->_localParticipant, "activeStreamKeys"));
  }
  v37 = v5;
  VCMediaChannelMetrics_Sum((uint64_t)v91, (uint64_t)v84);
  VCMediaChannelMetrics_Sum((uint64_t)v91, (uint64_t)v77);
  VCMediaChannelMetrics_Sum((uint64_t)v91, (uint64_t)v73);
  v7 = -[VCSession newNetworkBitrateString:](self, "newNetworkBitrateString:", v77);
  if (self->_oneToOneModeEnabled)
    v8 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" videoTxFrameRate=%3.1f,"), (_QWORD)v85);
  else
    v8 = &stru_1E9E58EE0;
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("[hostTime:%f/%f sampleTime:%u/%u (Audio/Video)]"), *((_QWORD *)&v86 + 1), *((_QWORD *)&v87 + 1), v87, v88);
  CFDictionaryAddValue(a3, CFSTR("VCSECNEnabled"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isECNEnabled));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[VCSessionParticipant uuid](self->_localParticipant, "uuid");
      *(_DWORD *)buf = 136317442;
      v47 = v11;
      v48 = 2080;
      v49 = "-[VCSession generateReportDictionary:]";
      v50 = 1024;
      v51 = 3898;
      v52 = 2112;
      v53 = (uint64_t)v13;
      v54 = 1024;
      *(_DWORD *)v55 = v84[0];
      *(_WORD *)&v55[4] = 2112;
      *(_QWORD *)&v55[6] = v8;
      *(_WORD *)&v55[14] = 1024;
      *(_DWORD *)&v55[16] = v77[0];
      LOWORD(v56) = 2112;
      *(_QWORD *)((char *)&v56 + 2) = v7;
      WORD5(v56) = 1024;
      HIDWORD(v56) = v73[0];
      *(_WORD *)v57 = 2112;
      *(_QWORD *)&v57[2] = v10;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d @=@ Health: VCSession-local localParticipant=%@, videoTxBitrate=%u kbps,%@ audioTxBitrate=%u kbps [%@], captionsTxBitrate=%u kbps avTxTimestamps=%@", buf, 0x56u);
    }
  }

  CFDictionaryAddValue(a3, CFSTR("VCSVTxBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v84[0])));
  CFDictionaryAddValue(a3, CFSTR("VCSATxBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v77[0])));
  CFDictionaryAddValue(a3, CFSTR("VCSCTxBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v73[0])));
  theDict = a3;
  CFDictionaryAddValue(a3, CFSTR("VCSTxBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(v91[0])));
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v34 = self;
  obj = -[VCSession remoteParticipants](self, "remoteParticipants");
  v42 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v60, 16);
  v14 = 0;
  if (v42)
  {
    v41 = *(_QWORD *)v62;
    v15 = 0x1E0CB3000uLL;
    v16 = v36;
    v17 = v37;
    v18 = v38;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v62 != v41)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        v21 = objc_msgSend(v20, "isInCanvas");
        objc_msgSend(v20, "collectVideoChannelMetrics:", v79);
        objc_msgSend(v20, "collectAudioChannelMetrics:", v75);
        objc_msgSend(v20, "collectCaptionsChannelMetrics:", v71);
        objc_msgSend(v16, "addObject:", objc_msgSend(v20, "uuid"));
        objc_msgSend(v17, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInt:", LODWORD(v79[0].width)), "stringValue"));
        objc_msgSend(v18, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInt:", LODWORD(v75[0])), "stringValue"));
        VCMediaChannelMetrics_Sum((uint64_t)v69, (uint64_t)v79);
        VCMediaChannelMetrics_Sum((uint64_t)v67, (uint64_t)v75);
        VCMediaChannelMetrics_Sum((uint64_t)v65, (uint64_t)v71);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v39 = objc_msgSend(v20, "uuid");
            v24 = objc_msgSend(v20, "activeDownlinkStreamIDForStreamGroupID:", 1667329381);
            v25 = objc_msgSend(v20, "activeDownlinkStreamIDForStreamGroupID:", 1835623282);
            width_low = LODWORD(v79[0].width);
            width = v80.width;
            v28 = v75[0];
            v94.width = v80.height;
            *(_QWORD *)&v94.height = aSize;
            v29 = NSStringFromSize(v94);
            *(_DWORD *)buf = 136317698;
            v47 = v22;
            v48 = 2080;
            v49 = "-[VCSession generateReportDictionary:]";
            v50 = 1024;
            v51 = 3926;
            v52 = 2112;
            v53 = v39;
            v54 = 2112;
            *(_QWORD *)v55 = v24;
            *(_WORD *)&v55[8] = 2112;
            *(_QWORD *)&v55[10] = v25;
            *(_WORD *)&v55[18] = 1024;
            LODWORD(v56) = width_low;
            v17 = v37;
            v18 = v38;
            WORD2(v56) = 2048;
            *(CGFloat *)((char *)&v56 + 6) = width;
            v15 = 0x1E0CB3000;
            HIWORD(v56) = 1024;
            *(_DWORD *)v57 = v28;
            v16 = v36;
            *(_WORD *)&v57[4] = 2112;
            *(_QWORD *)&v57[6] = v29;
            v58 = 1024;
            v59 = v71[0];
            _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d @=@ Health: VCSession-remote remoteParticipant=%@, videoStreamID=%@, audioStreamID=%@, videoRxBitrate=%u kbps, videoRxFrameRate=%3.1f, audioRxBitrate=%u kbps, videoRxResolution=%@, captionsRxBitrate=%u kbps", buf, 0x60u);
          }
        }
        v14 = (v14 + v21);
      }
      v42 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v61, v60, 16);
    }
    while (v42);
  }
  else
  {
    v15 = 0x1E0CB3000uLL;
    v16 = v36;
    v17 = v37;
  }
  CFDictionaryAddValue(theDict, CFSTR("VCSInCanvasCounter"), (const void *)objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInt:", v14));
  CFDictionaryAddValue(theDict, CFSTR("VCSVRxBR"), (const void *)objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInt:", LODWORD(v69[0])));
  CFDictionaryAddValue(theDict, CFSTR("VCSARxBR"), (const void *)objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInt:", LODWORD(v67[0])));
  CFDictionaryAddValue(theDict, CFSTR("VCSCRxBR"), (const void *)objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInt:", LODWORD(v65[0])));
  VCMediaChannelMetrics_Sum((uint64_t)v89, (uint64_t)v69);
  VCMediaChannelMetrics_Sum((uint64_t)v89, (uint64_t)v67);
  VCMediaChannelMetrics_Sum((uint64_t)v89, (uint64_t)v65);
  CFDictionaryAddValue(theDict, CFSTR("VCSRxBR"), (const void *)objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInt:", LODWORD(v89[0])));
  if (objc_msgSend(v16, "count"))
  {
    CFDictionaryAddValue(theDict, CFSTR("VCSPUUIDList"), (const void *)objc_msgSend(v16, "componentsJoinedByString:", CFSTR(",")));
    CFDictionaryAddValue(theDict, CFSTR("VCSVRxBRs"), (const void *)objc_msgSend(v17, "componentsJoinedByString:", CFSTR(",")));
    CFDictionaryAddValue(theDict, CFSTR("VCSARxBRs"), (const void *)objc_msgSend(v38, "componentsJoinedByString:", CFSTR(",")));
    CFDictionaryAddValue(theDict, CFSTR("VCSCRxBRs"), (const void *)objc_msgSend(v38, "componentsJoinedByString:", CFSTR(",")));
  }
  v30 = (const __CFDictionary *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyRealtimeStatsDictionary");
  VCUtil_AppendFromDictionary(theDict, v30);
  if (v30)
    CFRelease(v30);

  v31 = -[VCTransportSession connectionManager](v34->_transportSession, "connectionManager");
  if (v31)
  {
    v32 = v31;
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaCellularTxBytes](v31, "mediaCellularTxBytes")), CFSTR("CTxDb"));
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaCellularRxBytes](v32, "mediaCellularRxBytes")), CFSTR("CRxDb"));
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaExcessiveCellularTxBytes](v32, "mediaExcessiveCellularTxBytes")+ -[VCConnectionManager signalingExcessiveCellularTxBytes](v32, "signalingExcessiveCellularTxBytes")), CFSTR("CDupTxDb"));
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaExcessiveCellularRxBytes](v32, "mediaExcessiveCellularRxBytes")+ -[VCConnectionManager signalingExcessiveCellularRxBytes](v32, "signalingExcessiveCellularRxBytes")), CFSTR("CDupRxDb"));
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", -[VCConnectionManager budgetConsumingCellularTxBytes](v32, "budgetConsumingCellularTxBytes")), CFSTR("CBudgTxDb"));
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", -[VCConnectionManager budgetConsumingCellularRxBytes](v32, "budgetConsumingCellularRxBytes")), CFSTR("CBudgRxDb"));
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaWifiTxBytes](v32, "mediaWifiTxBytes")), CFSTR("WTxDb"));
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", -[VCConnectionManager mediaWifiRxBytes](v32, "mediaWifiRxBytes")), CFSTR("WRxDb"));
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInt:", -[VCConnectionManager sendSuccessCountSinceLastCheck](v32, "sendSuccessCountSinceLastCheck")), CFSTR("PSSCTR"));
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedInt:", -[VCConnectionManager sendFailureCountSinceLastCheck](v32, "sendFailureCountSinceLastCheck")), CFSTR("PSFCTR"));
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", -[VCConnectionManager onTheWireTotalBytesReceivedSinceLastCheck](v32, "onTheWireTotalBytesReceivedSinceLastCheck")), CFSTR("WPRSZ"));
    -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v15 + 2024), "numberWithUnsignedLongLong:", -[VCConnectionManager onTheWireTotalBytesSentSinceLastCheck](v32, "onTheWireTotalBytesSentSinceLastCheck")), CFSTR("WPSSZ"));
  }
  *(_DWORD *)buf = 0;
  v45 = 0;
  +[VCWiFiUtils getInfraChannelNumber:is5Ghz:](VCWiFiUtils, "getInfraChannelNumber:is5Ghz:", buf, &v45);
  valuePtr = v45;
  v33 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(theDict, CFSTR("iWiFi5GHz"), v33);
  CFRelease(v33);
  valuePtr = 0;
  v43 = 0;
  -[VCTransportSession getSignalStrengthBars:displayBars:maxDisplayBars:](v34->_transportSession, "getSignalStrengthBars:displayBars:maxDisplayBars:", &valuePtr, (char *)&v43 + 4, &v43);
  CFDictionaryAddValue(theDict, CFSTR("SS"), (const void *)objc_msgSend(*(id *)(v15 + 2024), "numberWithInt:", valuePtr));
}

- (void)registerReportingTask
{
  objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  reportingRegisterPeriodicTaskOnQueue();
}

void __34__VCSession_registerReportingTask__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  const void *v4;
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
  if (a2)
  {
    v3 = (void *)MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"));
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, "generateReportDictionary:", a2);
      CFRelease(v4);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCSession registerReportingTask]_block_invoke";
        v11 = 1024;
        v12 = 3995;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d [VCSession]: reporting periodic task: strongSelf == nil", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
}

- (void)unregisterReportingTask
{
  reportingUnregisterPeriodicTask();
  reportingUnregisterPeriodicTask();
  VCReporting_finalizeAggregation();
}

- (void)recommendedSettingsChanged:(id)a3
{
  -[AVCRateController setTargetBitrateCap:](self->_uplinkRateController, "setTargetBitrateCap:", objc_msgSend(a3, "targetBitrateCap"));
}

- (void)reportingIntervalChanged:(double)a3
{
  -[VCSessionStatsController setStatsReportingInterval:](self->_sessionStatsController, "setStatsReportingInterval:", a3);
}

- (void)preWarmStateChanged:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;

  if (self->_oneToOneModeEnabled)
  {
    v3 = a3;
    if (-[VCConnectionManager isPreWarmStateEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "isPreWarmStateEnabled") != a3)
    {
      if (-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"))
      {
        if (v3)
          v5 = CFSTR("VCWRMAlertStateEnabled");
        else
          v5 = CFSTR("VCWRMAlertStateDisabled");
        -[VCSessionMessaging sendMessage:withTopic:participantID:](self->_sessionMessaging, "sendMessage:withTopic:participantID:", v5, CFSTR("VCWRMAlertStateUpdateMessageTopic"), -[VCSessionParticipant idsParticipantID](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "idsParticipantID"));
        VCConnectionManager_SetPreWarmState((uint64_t)-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), v3);
      }
    }
  }
}

- (void)mediaQualityDegraded:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;

  if (self->_oneToOneModeEnabled)
  {
    v3 = a3;
    if (-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"))
    {
      if (v3)
        v5 = CFSTR("VCMediaQualityDegraded");
      else
        v5 = CFSTR("VCMediaQualityRecovered");
      -[VCSessionMessaging sendMessage:withTopic:participantID:](self->_sessionMessaging, "sendMessage:withTopic:participantID:", v5, CFSTR("VCMediaQualityDegradedMessageTopic"), -[VCSessionParticipant idsParticipantID](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "idsParticipantID"));
    }
  }
}

- (void)setIsUplinkRetransmissionEnabled:(BOOL)a3
{
  NSObject *sessionQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCSession_setIsUplinkRetransmissionEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  v5 = a3;
  block[4] = self;
  dispatch_async(sessionQueue, block);
}

uint64_t __46__VCSession_setIsUplinkRetransmissionEnabled___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  int v5;
  unsigned __int8 v6;
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
  result = +[VCSession isUplinkRetransmissionEnabledForVideo](VCSession, "isUplinkRetransmissionEnabledForVideo");
  if ((_DWORD)result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(unsigned __int8 *)(a1 + 40);
        v7 = 136315906;
        v8 = v3;
        v9 = 2080;
        v10 = "-[VCSession setIsUplinkRetransmissionEnabled:]_block_invoke";
        v11 = 1024;
        v12 = 4039;
        v13 = 1024;
        v14 = v5;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d isUplinkRetransmissionEnabled=%d", (uint8_t *)&v7, 0x22u);
      }
    }
    v6 = *(_BYTE *)(a1 + 40);
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setRetransmissionEnabled:", v6);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 810) = v6;
  }
  return result;
}

- (void)didLocalNetworkConditionChange:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4 isRemoteNetworkQualityDegraded:(BOOL)a5
{
  NSObject *sessionQueue;
  _QWORD block[5];
  BOOL v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__VCSession_didLocalNetworkConditionChange_isLocalNetworkQualityDegraded_isRemoteNetworkQualityDegraded___block_invoke;
  block[3] = &unk_1E9E55668;
  block[4] = self;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_async(sessionQueue, block);
}

_BYTE *__105__VCSession_didLocalNetworkConditionChange_isLocalNetworkQualityDegraded_isRemoteNetworkQualityDegraded___block_invoke(uint64_t a1)
{
  _BYTE *result;
  const __CFString *v3;
  void *v4;
  _BOOL8 v5;

  result = *(_BYTE **)(a1 + 32);
  if (result[409])
  {
    result = (_BYTE *)objc_msgSend(result, "oneToOneRemoteParticipant");
    if (result)
    {
      if (*(_BYTE *)(a1 + 40))
      {
        if (*(_BYTE *)(a1 + 41))
          v3 = CFSTR("VCNetworkQualityDegraded");
        else
          v3 = CFSTR("VCNetworkQualityRecovered");
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "sendMessage:withTopic:participantID:", v3, CFSTR("VCNetworkQualityDegradedMessageTopic"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "oneToOneRemoteParticipant"), "idsParticipantID"));
      }
      v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "oneToOneRemoteParticipant");
      if (*(_BYTE *)(a1 + 41))
        v5 = 1;
      else
        v5 = *(_BYTE *)(a1 + 42) != 0;
      return (_BYTE *)objc_msgSend(v4, "networkQualityDidDegrade:isLocalNetworkQualityDegraded:", v5, *(unsigned __int8 *)(a1 + 41) != 0);
    }
  }
  return result;
}

+ (BOOL)isServerPacketRetransmissionEnabledForVideo
{
  return +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-server-video-packet-retransmission-enabled"), CFSTR("serverPacketRetransmissionEnabledForVideo"), "AVConference", "EnableServerPacketRetransmissionForVideo");
}

+ (BOOL)isEnhancedJBAdaptationsEnabled
{
  return +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-enhanced-jb-adaptations"), CFSTR("enableEnhancedJBAdaptations"), "AVConference", "EnableEnhancedJBAdaptations");
}

+ (BOOL)isUplinkRetransmissionEnabledForVideo
{
  int AppBooleanValue;
  int v3;
  uint64_t v4;
  NSObject *v5;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("uplinkRetransmissionEnabledForVideo"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v3 = AppBooleanValue == 1;
  else
    v3 = _os_feature_enabled_impl();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      v9 = v4;
      v10 = 2080;
      v11 = "+[VCSession isUplinkRetransmissionEnabledForVideo]";
      v12 = 1024;
      v13 = 4076;
      v14 = 2080;
      v15 = "AVConference";
      v16 = 2080;
      v17 = "EnableUplinkRetransmissionForVideo";
      v18 = 1024;
      v19 = keyExistsAndHasValidFormat;
      v20 = 1024;
      v21 = v3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Using feature flag domain=%s name=%s defaultExists=%d value=%d ", buf, 0x3Cu);
    }
  }
  return v3;
}

- (void)mediaRecorder:(id)a3 shouldProcessRequest:(id)a4 recipientID:(id)a5
{
  uint64_t v8;
  NSObject *sessionQueue;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  v8 = objc_msgSend(a4, "mutableCopy", a3);
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VCSession_mediaRecorder_shouldProcessRequest_recipientID___block_invoke;
  block[3] = &unk_1E9E54D20;
  block[4] = self;
  block[5] = a5;
  block[6] = a4;
  block[7] = v8;
  dispatch_async(sessionQueue, block);
}

void __60__VCSession_mediaRecorder_shouldProcessRequest_recipientID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("vcMomentsRequestState")), "intValue") == 1)
  {
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v2, "lastDisplayedFrameRTPTimestamp")), CFSTR("vcMomentsRequestTimestamp"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("vcMomentsRequesteeID"));
        v6 = objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("vcMomentsRequestTimestamp"));
        v7 = 136316162;
        v8 = v3;
        v9 = 2080;
        v10 = "-[VCSession mediaRecorder:shouldProcessRequest:recipientID:]_block_invoke";
        v11 = 1024;
        v12 = 4089;
        v13 = 2112;
        v14 = v5;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d Media recording requestee=%@, RTP timestamp=%@", (uint8_t *)&v7, 0x30u);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "reportingMomentsToGreenTeaWithRequest:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "sendMessageDictionary:withTopic:participantID:", *(_QWORD *)(a1 + 56), CFSTR("VCSessionMomentsStateMessageTopic"), objc_msgSend(v2, "idsParticipantID"));

}

- (void)didReceiveMomentsRequest:(id)a3
{
  NSObject *sessionQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VCSession_didReceiveMomentsRequest___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sessionQueue, block);
}

uint64_t __38__VCSession_didReceiveMomentsRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 824), "processRequest:", *(_QWORD *)(a1 + 40));
}

- (void)updateMediaRecorderCapabillities:(unsigned int)a3 imageType:(int)a4 videoCodec:(int)a5
{
  NSObject *sessionQueue;
  _QWORD v6[5];
  unsigned int v7;
  int v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__VCSession_updateMediaRecorderCapabillities_imageType_videoCodec___block_invoke;
  v6[3] = &unk_1E9E52350;
  v6[4] = self;
  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_async(sessionQueue, v6);
}

void __67__VCSession_updateMediaRecorderCapabillities_imageType_videoCodec___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 824), "setCapabilities:", *(unsigned int *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 824), "setImageType:", *(unsigned int *)(a1 + 44));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 824), "setVideoCodec:", *(unsigned int *)(a1 + 48));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(a1 + 40);
      v5 = *(_DWORD *)(a1 + 44);
      v6 = *(_DWORD *)(a1 + 48);
      v7 = 136316418;
      v8 = v2;
      v9 = 2080;
      v10 = "-[VCSession updateMediaRecorderCapabillities:imageType:videoCodec:]_block_invoke";
      v11 = 1024;
      v12 = 4110;
      v13 = 1024;
      v14 = v4;
      v15 = 1024;
      v16 = v5;
      v17 = 1024;
      v18 = v6;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCSession [%s] %s:%d capabilities=0x%02x, imageType=%d, videoCodec=%d", (uint8_t *)&v7, 0x2Eu);
    }
  }
}

- (void)additionalFlushCountToOneToOneRateController:(unsigned int)a3
{
  AVCStatisticsCollector *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned int v10;
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
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneModeEnabled)
  {
    v7 = 0;
    v6 = 0;
    v8 = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0;
    v4 = -[AVCRateController statisticsCollector](self->_oneToOneSettings.rateController, "statisticsCollector");
    v5 = 10;
    v9 = 1;
    v10 = a3;
    VCRateControlSetStatistics(v4, &v5);
  }
}

- (VCSessionParticipant)localParticipant
{
  return &self->_localParticipant->super;
}

- (NSString)idsDestination
{
  return self->_idsDestination;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (unsigned)transportSessionID
{
  return self->_transportSessionID;
}

- (VCConnectionProtocol)currentActiveConnection
{
  return self->_currentActiveConnection;
}

- (void)setCurrentActiveConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 328);
}

- (NSMutableDictionary)optInDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 464, 1);
}

- (void)setOptInDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (NSMutableDictionary)remoteParticipantsMapByServerID
{
  return self->_remoteParticipantsMapByServerID;
}

- (void)setRemoteParticipantsMapByServerID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (tagVCMediaQueue)mediaQueue
{
  return self->_mediaQueue;
}

- (void)setMediaQueue:(tagVCMediaQueue *)a3
{
  self->_mediaQueue = a3;
}

- (VCTransportSession)transportSession
{
  return self->_transportSession;
}

- (AVCRateController)downlinkRateController
{
  return self->_downlinkRateController;
}

- (VCSessionMessaging)sessionMessaging
{
  return self->_sessionMessaging;
}

- (void)setSessionMessaging:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (VCSessionStatsController)sessionStatsController
{
  return self->_sessionStatsController;
}

- (OS_nw_activity)parentNWActivity
{
  return self->_parentNWActivity;
}

- (OS_nw_activity)nwActivity
{
  return self->_nwActivity;
}

- (void)setNwActivity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 704);
}

- (BOOL)oneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (BOOL)sharingEnabled
{
  return self->_sharingEnabled;
}

- (int)reportingClientType
{
  return self->_reportingClientType;
}

- (int)reportingModuleID
{
  return self->_reportingModuleID;
}

- (BOOL)screenAndCameraMixingEnabled
{
  return self->_screenAndCameraMixingEnabled;
}

- (BOOL)isOneToOneRemoteMediaStalling
{
  return self->_isOneToOneRemoteMediaStalling;
}

- (void)setIsOneToOneRemoteMediaStalling:(BOOL)a3
{
  self->_isOneToOneRemoteMediaStalling = a3;
}

- (int)setupOneToOne
{
  int v3;
  int v4;
  const __CFString *v6;
  const __CFString *v7;
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
  const __CFString *v19;
  __int16 v20;
  VCSession *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[VCSession setupOneToOneMediaQueue](self, "setupOneToOneMediaQueue");
  if (v3 < 0)
  {
    v4 = v3;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) setupOneToOne].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v12 = 136316418;
          v13 = v8;
          v14 = 2080;
          v15 = "-[VCSession(OneToOne) setupOneToOne]";
          v16 = 1024;
          v17 = 56;
          v18 = 2112;
          v19 = v6;
          v20 = 2048;
          v21 = self;
          v22 = 1024;
          v23 = v4;
          v10 = " [%s] %s:%d %@(%p) Failed to create the media queue. error=%x";
LABEL_25:
          _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x36u);
        }
      }
    }
  }
  else
  {
    v4 = -[VCSession setupRateControllerOneToOne](self, "setupRateControllerOneToOne");
    if ((v4 & 0x80000000) == 0)
    {
      -[VCSession initWithRelevantStorebagEntries](self, "initWithRelevantStorebagEntries");
      return v4;
    }
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) setupOneToOne].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v12 = 136316418;
          v13 = v11;
          v14 = 2080;
          v15 = "-[VCSession(OneToOne) setupOneToOne]";
          v16 = 1024;
          v17 = 59;
          v18 = 2112;
          v19 = v7;
          v20 = 2048;
          v21 = self;
          v22 = 1024;
          v23 = v4;
          v10 = " [%s] %s:%d %@(%p) Failed to create rate controller. error=%x";
          goto LABEL_25;
        }
      }
    }
  }
  return v4;
}

- (int)setupOneToOneMediaQueue
{
  _VCSessionOneToOneSettings *p_oneToOneSettings;
  uint64_t *p_mediaQueue;
  const __CFString *v5;
  int Handle;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCSession *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  p_oneToOneSettings = &self->_oneToOneSettings;
  self->_oneToOneSettings.mediaQueue = (tagHANDLE *)0xFFFFFFFFLL;
  p_mediaQueue = (uint64_t *)&self->_oneToOneSettings.mediaQueue;
  if (VCDefaults_GetBoolValueForKey(CFSTR("ForceVCMediaQueueForOneToOne"), 1))
  {
    p_oneToOneSettings->vcMediaQueue = self->_mediaQueue;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return 0;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      Handle = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315650;
        v19 = v7;
        v20 = 2080;
        v21 = "-[VCSession(OneToOne) setupOneToOneMediaQueue]";
        v22 = 1024;
        v23 = 73;
        v9 = " [%s] %s:%d Using VCMediaQueue2.0";
        v10 = v8;
        v11 = 28;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v18, v11);
        return 0;
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return 0;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      Handle = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136316162;
        v19 = v13;
        v20 = 2080;
        v21 = "-[VCSession(OneToOne) setupOneToOneMediaQueue]";
        v22 = 1024;
        v23 = 73;
        v24 = 2112;
        v25 = v5;
        v26 = 2048;
        v27 = self;
        v9 = " [%s] %s:%d %@(%p) Using VCMediaQueue2.0";
        v10 = v14;
        v11 = 48;
        goto LABEL_17;
      }
    }
  }
  else
  {
    Handle = MediaQueue_CreateHandle(p_mediaQueue, 0xFFFFFFFFLL);
    if (Handle < 0)
    {
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSession(OneToOne) setupOneToOneMediaQueue].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v12 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v12 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v18 = 136316418;
            v19 = v16;
            v20 = 2080;
            v21 = "-[VCSession(OneToOne) setupOneToOneMediaQueue]";
            v22 = 1024;
            v23 = 77;
            v24 = 2112;
            v25 = v12;
            v26 = 2048;
            v27 = self;
            v28 = 1024;
            v29 = Handle;
            _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create the media queue. error=%x", (uint8_t *)&v18, 0x36u);
          }
        }
      }
    }
    else
    {
      MediaQueue_SetFECFeedbackVersion(*p_mediaQueue, 1);
    }
  }
  return Handle;
}

- (id)newNegotiatorForOneToOneWithRemoteParticipant:(id)a3
{
  void *v5;
  void *v6;
  VCSessionMediaNegotiator *v7;
  VCSessionMediaNegotiator *v8;
  uint64_t v9;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  VCSession *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[VCMediaNegotiatorLocalConfiguration copy](-[VCSessionMediaNegotiator localSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "localSettings"), "copy");
  v6 = v5;
  if (!v5)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:].cold.2();
      }
      goto LABEL_38;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_38;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v26 = 136316162;
    v27 = v15;
    v28 = 2080;
    v29 = "-[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]";
    v30 = 1024;
    v31 = 91;
    v32 = 2112;
    v33 = v11;
    v34 = 2048;
    v35 = self;
    v17 = " [%s] %s:%d %@(%p) Failed to copy the local configuration";
    goto LABEL_60;
  }
  objc_msgSend(v5, "setIsCaller:", 0);
  v7 = -[VCSessionMediaNegotiator initWithLocalConfiguration:]([VCSessionMediaNegotiator alloc], "initWithLocalConfiguration:", v6);
  if (!v7)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:].cold.3();
      }
      goto LABEL_38;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v18 = VRTraceErrorLogLevelToCSTR(),
          v16 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_38:
      v8 = 0;
      goto LABEL_39;
    }
    v26 = 136316162;
    v27 = v18;
    v28 = 2080;
    v29 = "-[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]";
    v30 = 1024;
    v31 = 95;
    v32 = 2112;
    v33 = v12;
    v34 = 2048;
    v35 = self;
    v17 = " [%s] %s:%d %@(%p) Failed to reinitialize the 1:1 media negotiator";
LABEL_60:
    _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v26, 0x30u);
    goto LABEL_38;
  }
  v8 = v7;
  v9 = objc_msgSend(+[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:", objc_msgSend(a3, "opaqueData")), "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyMediaNegotiationData"));
  if (v9)
  {
    if (-[VCSessionMediaNegotiator processRemoteNegotiationData:](v8, "processRemoteNegotiationData:", v9))
    {

      return v8;
    }
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:].cold.5();
      }
      goto LABEL_39;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v26 = 136316162;
        v27 = v25;
        v28 = 2080;
        v29 = "-[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]";
        v30 = 1024;
        v31 = 103;
        v32 = 2112;
        v33 = v14;
        v34 = 2048;
        v35 = self;
        v24 = " [%s] %s:%d %@(%p) Failed to negotiate one to one settings with remote media blob";
        goto LABEL_58;
      }
    }
  }
  else
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:].cold.4();
      }
      goto LABEL_39;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v26 = 136316162;
        v27 = v22;
        v28 = 2080;
        v29 = "-[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]";
        v30 = 1024;
        v31 = 100;
        v32 = 2112;
        v33 = v13;
        v34 = 2048;
        v35 = self;
        v24 = " [%s] %s:%d %@(%p) Failed to extract media blob from remote participant info";
LABEL_58:
        _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v26, 0x30u);
      }
    }
  }
LABEL_39:

  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v26 = 136316418;
        v27 = v20;
        v28 = 2080;
        v29 = "-[VCSession(OneToOne) newNegotiatorForOneToOneWithRemoteParticipant:]";
        v30 = 1024;
        v31 = 109;
        v32 = 2112;
        v33 = v19;
        v34 = 2048;
        v35 = self;
        v36 = 2048;
        v37 = a3;
        _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to negotiate oneToOne data with participant=%p", (uint8_t *)&v26, 0x3Au);
      }
    }
  }

  return 0;
}

- (BOOL)setOneToOneConfigOnRemoteParticipant:(id)a3
{
  id v5;
  id v6;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  VCSession *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = -[VCSession newNegotiatorForOneToOneWithRemoteParticipant:](self, "newNegotiatorForOneToOneWithRemoteParticipant:");
  v6 = -[VCSession newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:](self, "newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:", -[VCSessionParticipant idsParticipantID](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "idsParticipantID"), 0, objc_msgSend((id)objc_msgSend(v5, "negotiatedSettings"), "mediaControlInfoVersion"), objc_msgSend((id)objc_msgSend(v5, "negotiatedVideoSettings"), "isSupported"), objc_msgSend((id)objc_msgSend(v5, "negotiatedScreenSettings"), "isSupported"), a3);

  if (v6)
  {
    objc_msgSend(a3, "setOneToOneConfig:", v6);

  }
  else if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession(OneToOne) setOneToOneConfigOnRemoteParticipant:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v11 = 136316162;
        v12 = v9;
        v13 = 2080;
        v14 = "-[VCSession(OneToOne) setOneToOneConfigOnRemoteParticipant:]";
        v15 = 1024;
        v16 = 124;
        v17 = 2112;
        v18 = v8;
        v19 = 2048;
        v20 = self;
        _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) OneToOne config was nil", (uint8_t *)&v11, 0x30u);
      }
    }
  }
  return v6 != 0;
}

- (int)setupRateControllerOneToOne
{
  _VCSessionOneToOneSettings *p_oneToOneSettings;
  uint64_t v4;
  id v5;
  id reportingAgent;
  AVCRateController *v7;
  VCRateControlMediaController *v8;
  int v9;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  VCSession *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  p_oneToOneSettings = &self->_oneToOneSettings;
  if (self->_oneToOneSettings.rateController)
  {
    v9 = -2143813628;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) setupRateControllerOneToOne].cold.5();
      }
      goto LABEL_60;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_60;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_60;
    *(_DWORD *)buf = 136316162;
    v29 = v16;
    v30 = 2080;
    v31 = "-[VCSession(OneToOne) setupRateControllerOneToOne]";
    v32 = 1024;
    v33 = 135;
    v34 = 2112;
    v35 = v11;
    v36 = 2048;
    v37 = self;
    v18 = " [%s] %s:%d %@(%p) 1:1 rate controller already configured";
    goto LABEL_59;
  }
  if (self->_oneToOneSettings.mediaController)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      v9 = -2143813628;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) setupRateControllerOneToOne].cold.4();
      }
      goto LABEL_60;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    v9 = -2143813628;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_60;
    v19 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_60;
    *(_DWORD *)buf = 136316162;
    v29 = v19;
    v30 = 2080;
    v31 = "-[VCSession(OneToOne) setupRateControllerOneToOne]";
    v32 = 1024;
    v33 = 136;
    v34 = 2112;
    v35 = v12;
    v36 = 2048;
    v37 = self;
    v18 = " [%s] %s:%d %@(%p) 1:1 media controller already configured";
    goto LABEL_59;
  }
  if (self->_oneToOneSettings.mediaQueue == (tagHANDLE *)0xFFFFFFFFLL && !self->_oneToOneSettings.vcMediaQueue)
  {
    v9 = -2143813628;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) setupRateControllerOneToOne].cold.1();
      }
      goto LABEL_60;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v29 = v22;
        v30 = 2080;
        v31 = "-[VCSession(OneToOne) setupRateControllerOneToOne]";
        v32 = 1024;
        v33 = 137;
        v34 = 2112;
        v35 = v15;
        v36 = 2048;
        v37 = self;
        v18 = " [%s] %s:%d %@(%p) Media queue was not setup for 1:1";
        goto LABEL_59;
      }
    }
    goto LABEL_60;
  }
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("session_%@_1:1"), self->_uuid);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0;
  v23 = v4;
  BYTE1(v24) = 1;
  v5 = -[VCSession vcrcServerBagWithOperatingMode:](self, "vcrcServerBagWithOperatingMode:", 1);
  reportingAgent = self->super._reportingAgent;
  *((_QWORD *)&v24 + 1) = v5;
  *(_QWORD *)&v25 = reportingAgent;
  BYTE8(v25) = 1;
  BYTE8(v26) = 1;
  v7 = -[AVCRateController initWithDelegate:params:]([AVCRateController alloc], "initWithDelegate:params:", self, &v23);
  p_oneToOneSettings->rateController = v7;
  if (!v7)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      v9 = -2143813630;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) setupRateControllerOneToOne].cold.2();
      }
      goto LABEL_60;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    v9 = -2143813630;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_60;
    v20 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_60;
    *(_DWORD *)buf = 136316162;
    v29 = v20;
    v30 = 2080;
    v31 = "-[VCSession(OneToOne) setupRateControllerOneToOne]";
    v32 = 1024;
    v33 = 150;
    v34 = 2112;
    v35 = v13;
    v36 = 2048;
    v37 = self;
    v18 = " [%s] %s:%d %@(%p) Failed to allocate 1:1 rate controller";
LABEL_59:
    _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x30u);
    goto LABEL_60;
  }
  -[AVCStatisticsCollector setMediaControlInfoFECFeedbackVersion:](-[AVCRateController statisticsCollector](v7, "statisticsCollector"), "setMediaControlInfoFECFeedbackVersion:", 1);
  v8 = -[VCRateControlMediaController initWithMediaQueue:delegate:]([VCRateControlMediaController alloc], "initWithMediaQueue:delegate:", p_oneToOneSettings->mediaQueue, self);
  p_oneToOneSettings->mediaController = v8;
  if (!v8)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      v9 = -2143813630;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) setupRateControllerOneToOne].cold.3();
      }
      goto LABEL_60;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    v9 = -2143813630;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v29 = v21;
        v30 = 2080;
        v31 = "-[VCSession(OneToOne) setupRateControllerOneToOne]";
        v32 = 1024;
        v33 = 154;
        v34 = 2112;
        v35 = v14;
        v36 = 2048;
        v37 = self;
        v18 = " [%s] %s:%d %@(%p) Failed to allocate 1:1 media controller";
        goto LABEL_59;
      }
    }
LABEL_60:
    -[VCSession cleanupRateControllerOneToOne](self, "cleanupRateControllerOneToOne");
    return v9;
  }
  -[VCRateControlMediaController setVcMediaQueue:](v8, "setVcMediaQueue:", p_oneToOneSettings->vcMediaQueue);
  -[VCRateControlMediaController setIsRTPFlushBasebandFromVCRateControl:](p_oneToOneSettings->mediaController, "setIsRTPFlushBasebandFromVCRateControl:", 1);
  -[AVCRateController setMediaController:](p_oneToOneSettings->rateController, "setMediaController:", p_oneToOneSettings->mediaController);
  -[VCRateControlMediaController setStatisticsCollector:](p_oneToOneSettings->mediaController, "setStatisticsCollector:", -[AVCRateController statisticsCollector](p_oneToOneSettings->rateController, "statisticsCollector"));
  -[AVCRateControlFeedbackController setConnectionHealthMonitor:](-[AVCRateController feedbackController](p_oneToOneSettings->rateController, "feedbackController"), "setConnectionHealthMonitor:", -[VCConnectionManager connectionHealthMonitor](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "connectionHealthMonitor"));
  return 0;
}

- (void)updateOneToOneRateControllerForVideoEnabled:(BOOL)a3 screenEnabled:(BOOL)a4
{
  NSObject *sessionQueue;
  _QWORD block[5];
  BOOL v6;
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__VCSession_OneToOne__updateOneToOneRateControllerForVideoEnabled_screenEnabled___block_invoke;
  block[3] = &unk_1E9E52A50;
  block[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_async(sessionQueue, block);
}

uint64_t __81__VCSession_OneToOne__updateOneToOneRateControllerForVideoEnabled_screenEnabled___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  _BOOL8 v3;

  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "oneToOneRemoteParticipant"), "oneToOneConfig"), "negotiatedVideoEnabled"))v2 = *(_BYTE *)(a1 + 40) != 0;
  else
    v2 = 0;
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "oneToOneRemoteParticipant"), "oneToOneConfig"), "negotiatedScreenEnabled"))v3 = *(_BYTE *)(a1 + 41) != 0;
  else
    v3 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "configureOneToOneRateController:isUsingCamera:isUsingScreen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328), v2, v3);
}

- (void)updateOneToOneRateControllerForVideoEnabled:(BOOL)a3
{
  -[VCSession updateOneToOneRateControllerForVideoEnabled:screenEnabled:](self, "updateOneToOneRateControllerForVideoEnabled:screenEnabled:", a3, -[VCSession isOneToOneUsingScreen](self, "isOneToOneUsingScreen"));
}

- (VCSession)initWithRelevantStorebagEntries
{
  double NoRemotePacketsTimeout;
  double v4;
  double v5;
  double v6;

  NoRemotePacketsTimeout = GKSConnectivitySettings_GetNoRemotePacketsTimeout();
  v4 = 20.0;
  if (NoRemotePacketsTimeout > 20.0)
    v4 = GKSConnectivitySettings_GetNoRemotePacketsTimeout();
  self->_remoteMediaStallDisconnectTimeout = v4;
  +[GKSConnectivitySettings getRemoteMediaStallTimeout](GKSConnectivitySettings, "getRemoteMediaStallTimeout");
  self->_remoteMediaStallReconnectTimeout = v5;
  +[GKSConnectivitySettings getNoRemoteDuplicationThresholdFast](GKSConnectivitySettings, "getNoRemoteDuplicationThresholdFast");
  return (VCSession *)-[VCConnectionManager setNoRemoteDuplicationThresholdFast:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setNoRemoteDuplicationThresholdFast:", v6);
}

- (void)cleanupRateControllerOneToOne
{
  _VCSessionOneToOneSettings *p_oneToOneSettings;

  p_oneToOneSettings = &self->_oneToOneSettings;

  p_oneToOneSettings->rateController = 0;
  p_oneToOneSettings->mediaController = 0;
}

- (BOOL)configureLocalParticipantWithOneToOneRemoteParticipant:(id)a3 isInitialConfiguration:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v7;
  _BOOL8 v8;
  uint64_t v9;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v12;
  id v13;
  void *v14;
  BOOL v15;
  const __CFString *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BYTE v39[10];
  VCSession *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BOOL4 v44;
  uint64_t v45;

  v4 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v7 = -[VCMediaNegotiatorResultsVideo isSupported](-[VCSessionMediaNegotiator negotiatedVideoSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "negotiatedVideoSettings"), "isSupported");
  v8 = -[VCMediaNegotiatorResultsVideo isSupported](-[VCSessionMediaNegotiator negotiatedScreenSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "negotiatedScreenSettings"), "isSupported");
  v9 = -[VCMediaNegotiatorResults mediaControlInfoVersion](-[VCSessionMediaNegotiator negotiatedSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "negotiatedSettings"), "mediaControlInfoVersion");
  if (v7 && -[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled"))
  {
    v10 = 1;
    if (!v8)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v10 = -[VCSession isUsingPersonaCamera](self, "isUsingPersonaCamera");
    if (!v8)
      goto LABEL_4;
  }
  v11 = -[VCSessionParticipant isScreenEnabled](self->_localParticipant, "isScreenEnabled");
LABEL_7:
  -[VCSession configureOneToOneRateController:isUsingCamera:isUsingScreen:](self, "configureOneToOneRateController:isUsingCamera:isUsingScreen:", self->_currentActiveConnection, v10, v11);
  v12 = objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "prewarmingClientOperatingMode");
  if ((_DWORD)v12)
    goto LABEL_8;
  if (v10)
    v12 = 1;
  else
    v12 = 2;
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v33 = v30;
        v34 = 2080;
        v35 = "-[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:]";
        v36 = 1024;
        v37 = 212;
        v38 = 1024;
        *(_DWORD *)v39 = v12;
        *(_WORD *)&v39[4] = 1024;
        *(_DWORD *)&v39[6] = v10;
        v19 = " [%s] %s:%d Failed to get pre-warming client's operating mode from VCAudioManager! Defaulting to operating"
              "Mode=%d (due to isUsingCamera=%{BOOL}d)";
        v20 = v18;
        v21 = 40;
LABEL_25:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v31 = v17;
      v29 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v33 = v29;
        v34 = 2080;
        v35 = "-[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:]";
        v36 = 1024;
        v37 = 212;
        v38 = 2112;
        *(_QWORD *)v39 = v31;
        *(_WORD *)&v39[8] = 2048;
        v40 = self;
        v41 = 1024;
        v42 = v12;
        v43 = 1024;
        v44 = v10;
        v19 = " [%s] %s:%d %@(%p) Failed to get pre-warming client's operating mode from VCAudioManager! Defaulting to op"
              "eratingMode=%d (due to isUsingCamera=%{BOOL}d)";
        v20 = v22;
        v21 = 60;
        goto LABEL_25;
      }
    }
  }
LABEL_8:
  -[VCSession applyNegotiatedOneToOneFaceTimeSettings](self, "applyNegotiatedOneToOneFaceTimeSettings", v29);
  v13 = -[VCSession newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:](self, "newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:", objc_msgSend(a3, "idsParticipantID"), 1, v9, v7, v8, a3);
  v14 = v13;
  if (!v13)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:].cold.1();
      }
      goto LABEL_45;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_45;
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_DWORD *)buf = 136316162;
    v33 = v25;
    v34 = 2080;
    v35 = "-[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:]";
    v36 = 1024;
    v37 = 218;
    v38 = 2112;
    *(_QWORD *)v39 = v23;
    *(_WORD *)&v39[8] = 2048;
    v40 = self;
    v27 = " [%s] %s:%d %@(%p) Failed to allocate local 1:1 config!";
    goto LABEL_47;
  }
  objc_msgSend(v13, "setOperatingMode:", v12);
  if (!-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStreams:](self->_localParticipant, "configureWithOneToOneParticipantConfig:shouldConfigureGFTStreams:", v14, v4))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:].cold.2();
      }
      goto LABEL_45;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v28 = VRTraceErrorLogLevelToCSTR(),
          v26 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_45:
      v15 = 0;
      goto LABEL_11;
    }
    *(_DWORD *)buf = 136316162;
    v33 = v28;
    v34 = 2080;
    v35 = "-[VCSession(OneToOne) configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:]";
    v36 = 1024;
    v37 = 222;
    v38 = 2112;
    *(_QWORD *)v39 = v24;
    *(_WORD *)&v39[8] = 2048;
    v40 = self;
    v27 = " [%s] %s:%d %@(%p) Failed to configure local participant for 1:1!";
LABEL_47:
    _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, v27, buf, 0x30u);
    goto LABEL_45;
  }
  -[VCSession setDelegatesForRemoteParticipant:](self, "setDelegatesForRemoteParticipant:", a3);
  MediaQueue_CleanupTxHistory();
  v15 = 1;
LABEL_11:

  return v15;
}

- (int)setupOneToOneMediaControlInfoGeneratorsWithVersion:(unsigned __int8)a3 oneToOneConfig:(id)a4 videoEnabled:(BOOL)a5
{
  uint64_t v7;
  VCMediaControlInfoGenerator *v9;
  VCMediaControlInfoGenerator *v10;
  VCMediaControlInfoGenerator *v11;
  VCMediaControlInfoGenerator *v12;
  int v13;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  _BYTE v21[24];
  __int128 v22;
  VCSession *v23;
  uint64_t v24;

  v7 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v9 = VCMediaControlInfoGeneratorCreateWithTypeAndVersion(0, a3);
  if (!v9)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) setupOneToOneMediaControlInfoGeneratorsWithVersion:oneToOneConfig:videoEnabled:].cold.1();
      }
      goto LABEL_31;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_31;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_DWORD *)v21 = 136316162;
    *(_QWORD *)&v21[4] = v17;
    *(_WORD *)&v21[12] = 2080;
    *(_QWORD *)&v21[14] = "-[VCSession(OneToOne) setupOneToOneMediaControlInfoGeneratorsWithVersion:oneToOneConfig:videoEnabled:]";
    *(_WORD *)&v21[22] = 1024;
    LODWORD(v22) = 236;
    WORD2(v22) = 2112;
    *(_QWORD *)((char *)&v22 + 6) = v15;
    HIWORD(v22) = 2048;
    v23 = self;
    v19 = " [%s] %s:%d %@(%p) Failed to allocate 1:1 audio media control info generator";
LABEL_34:
    _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, v19, v21, 0x30u);
    goto LABEL_31;
  }
  objc_msgSend(a4, "setAudioMediaControlInfoGenerator:", v9);
  VCMediaControlInfoGeneratoSetFECFeedbackVersion((void *)objc_msgSend(a4, "audioMediaControlInfoGenerator"), (const char *)1);
  if (self->_isECNCapable)
    VCMediaControlInfoGeneratorAddOptions((void *)objc_msgSend(a4, "audioMediaControlInfoGenerator"), (const char *)2);
  if (!a5)
  {
    v12 = v9;
    goto LABEL_10;
  }
  if (-[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled"))
    VCMediaControlInfoGeneratorAddOptions((void *)objc_msgSend(a4, "audioMediaControlInfoGenerator"), (const char *)1);
  v10 = VCMediaControlInfoGeneratorCreateWithTypeAndVersion(1, v7);
  if (v10)
  {
    v11 = v10;
    objc_msgSend(a4, "setVideoMediaControlInfoGenerator:", v10);
    VCMediaControlInfoGeneratoSetFECFeedbackVersion((void *)objc_msgSend(a4, "videoMediaControlInfoGenerator"), (const char *)1);
    CFRelease(v9);
    v12 = v11;
LABEL_10:
    CFRelease(v12);
    return 0;
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession(OneToOne) setupOneToOneMediaControlInfoGeneratorsWithVersion:oneToOneConfig:videoEnabled:].cold.2();
    }
    goto LABEL_31;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v16 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v21 = 136316162;
      *(_QWORD *)&v21[4] = v20;
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "-[VCSession(OneToOne) setupOneToOneMediaControlInfoGeneratorsWithVersion:oneToOneConfig:videoEnabled:]";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 248;
      WORD2(v22) = 2112;
      *(_QWORD *)((char *)&v22 + 6) = v16;
      HIWORD(v22) = 2048;
      v23 = self;
      v19 = " [%s] %s:%d %@(%p) Failed to allocate 1:1 video media control info generator";
      goto LABEL_34;
    }
  }
LABEL_31:
  v13 = -2143813630;
  objc_msgSend(a4, "setAudioMediaControlInfoGenerator:", 0, *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, v23);
  objc_msgSend(a4, "setVideoMediaControlInfoGenerator:", 0);
  if (v9)
    CFRelease(v9);
  return v13;
}

- (id)newParticipantOneToOneConfigWithIDSParticipantID:(unint64_t)a3 isLocal:(BOOL)a4 mediaControlInfoVersion:(unsigned __int8)a5 videoEnabled:(BOOL)a6 screenEnabled:(BOOL)a7 remoteParticipant:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  uint64_t v11;
  _BOOL4 v12;
  VCSessionParticipantOneToOneConfig *v15;
  tagVCMediaQueue *vcMediaQueue;
  void *v17;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  VCSession *v34;
  uint64_t v35;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v15 = objc_alloc_init(VCSessionParticipantOneToOneConfig);
  if (!v15)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:].cold.1();
      }
      goto LABEL_31;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_31;
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    v25 = 136316162;
    v26 = v21;
    v27 = 2080;
    v28 = "-[VCSession(OneToOne) newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEn"
          "abled:screenEnabled:remoteParticipant:]";
    v29 = 1024;
    v30 = 271;
    v31 = 2112;
    v32 = v19;
    v33 = 2048;
    v34 = self;
    v23 = " [%s] %s:%d %@(%p) Failed to allocate one to one participant configuration";
    goto LABEL_33;
  }
  if (!v12)
  {
    if ((-[VCSession setupOneToOneMediaControlInfoGeneratorsWithVersion:oneToOneConfig:videoEnabled:](self, "setupOneToOneMediaControlInfoGeneratorsWithVersion:oneToOneConfig:videoEnabled:", v11, v15, v10) & 0x80000000) == 0)goto LABEL_5;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:].cold.2();
      }
      goto LABEL_31;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v24 = VRTraceErrorLogLevelToCSTR(),
          v22 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_31:

      return 0;
    }
    v25 = 136316162;
    v26 = v24;
    v27 = 2080;
    v28 = "-[VCSession(OneToOne) newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEn"
          "abled:screenEnabled:remoteParticipant:]";
    v29 = 1024;
    v30 = 275;
    v31 = 2112;
    v32 = v20;
    v33 = 2048;
    v34 = self;
    v23 = " [%s] %s:%d %@(%p) Failed to setup the OneToOne MCIG";
LABEL_33:
    _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v25, 0x30u);
    goto LABEL_31;
  }
  -[VCSessionParticipantOneToOneConfig setAudioMediaControlInfoGenerator:](v15, "setAudioMediaControlInfoGenerator:", objc_msgSend((id)objc_msgSend(a8, "oneToOneConfig"), "audioMediaControlInfoGenerator"));
  -[VCSessionParticipantOneToOneConfig setVideoMediaControlInfoGenerator:](v15, "setVideoMediaControlInfoGenerator:", objc_msgSend((id)objc_msgSend(a8, "oneToOneConfig"), "videoMediaControlInfoGenerator"));
LABEL_5:
  -[VCSessionParticipantOneToOneConfig setIdsParticipantID:](v15, "setIdsParticipantID:", a3);
  -[VCSessionParticipantOneToOneConfig setDeviceRole:](v15, "setDeviceRole:", +[VCSession deviceRoleForSessionMode:](VCSession, "deviceRoleForSessionMode:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode")));
  -[VCSessionParticipantOneToOneConfig setFeedbackController:](v15, "setFeedbackController:", -[AVCRateController feedbackController](self->_oneToOneSettings.rateController, "feedbackController"));
  -[VCSessionParticipantOneToOneConfig setStatisticsCollector:](v15, "setStatisticsCollector:", -[AVCRateController statisticsCollector](self->_oneToOneSettings.rateController, "statisticsCollector"));
  -[VCSessionParticipantOneToOneConfig setBasebandCongestionDetector:](v15, "setBasebandCongestionDetector:", -[AVCRateController basebandCongestionDetector](self->_oneToOneSettings.rateController, "basebandCongestionDetector"));
  -[VCSessionParticipantOneToOneConfig setMediaController:](v15, "setMediaController:", self->_oneToOneSettings.mediaController);
  if (v12)
  {
    -[VCSessionParticipantOneToOneConfig setMediaQueue:](v15, "setMediaQueue:", self->_oneToOneSettings.mediaQueue);
    vcMediaQueue = self->_oneToOneSettings.vcMediaQueue;
  }
  else
  {
    -[VCSessionParticipantOneToOneConfig setMediaQueue:](v15, "setMediaQueue:", 0xFFFFFFFFLL);
    vcMediaQueue = 0;
  }
  -[VCSessionParticipantOneToOneConfig setVcMediaQueue:](v15, "setVcMediaQueue:", vcMediaQueue);
  -[VCSessionParticipantOneToOneConfig setNegotiatedVideoEnabled:](v15, "setNegotiatedVideoEnabled:", v10);
  -[VCSessionParticipantOneToOneConfig setNegotiatedScreenEnabled:](v15, "setNegotiatedScreenEnabled:", v9);
  v17 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)-[VCTransportSession connectionManager](-[VCSession transportSession](self, "transportSession"), "connectionManager"));
  -[VCSessionParticipantOneToOneConfig setInitUsingWifiTiers:](v15, "setInitUsingWifiTiers:", objc_msgSend(v17, "isWifiToWifi"));
  if (v17)
    CFRelease(v17);
  -[VCSessionParticipantOneToOneConfig setNetworkFeedbackController:](v15, "setNetworkFeedbackController:", self->_feedbackController);
  return v15;
}

- (void)startRateControllerOneToOne
{
  -[AVCRateControlFeedbackController setIsFeedbackReceived:](-[AVCRateController feedbackController](self->_oneToOneSettings.rateController, "feedbackController"), "setIsFeedbackReceived:", 0);
  -[VCSession configureOneToOneRateController:](self, "configureOneToOneRateController:", self->_currentActiveConnection);
  -[AVCRateController start](self->_oneToOneSettings.rateController, "start");
}

- (void)stopRateControllerOneToOne
{
  -[AVCRateController stop](self->_oneToOneSettings.rateController, "stop");
}

- (BOOL)isOneToOneUsingVideo
{
  BOOL v3;

  if (-[VCSessionParticipantOneToOneConfig negotiatedVideoEnabled](-[VCSessionParticipant oneToOneConfig](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "oneToOneConfig"), "negotiatedVideoEnabled"))
  {
    v3 = -[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled");
  }
  else
  {
    v3 = 0;
  }
  return v3 | -[VCSession isUsingPersonaCamera](self, "isUsingPersonaCamera");
}

- (BOOL)isUsingPersonaCamera
{
  _BOOL4 v3;

  v3 = -[VCSession isPersonaCameraSupported](self, "isPersonaCameraSupported");
  if (v3)
    LOBYTE(v3) = -[VCSessionParticipant isPersonaCameraEnabled](self->_localParticipant, "isPersonaCameraEnabled");
  return v3;
}

- (BOOL)isPersonaCameraSupported
{
  VCSessionMediaNegotiator *v2;

  v2 = -[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator");
  if ((objc_msgSend(-[VCSessionMediaNegotiator negotiatedResultsForGroupID:](v2, "negotiatedResultsForGroupID:", 1718909044), "isSupported") & 1) != 0)return 1;
  else
    return objc_msgSend(-[VCSessionMediaNegotiator negotiatedResultsForGroupID:](v2, "negotiatedResultsForGroupID:", 1650745716), "isSupported");
}

- (BOOL)isOneToOneUsingScreen
{
  _BOOL4 v3;

  v3 = -[VCSessionParticipantOneToOneConfig negotiatedScreenEnabled](-[VCSessionParticipant oneToOneConfig](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "oneToOneConfig"), "negotiatedScreenEnabled");
  if (v3)
    LOBYTE(v3) = -[VCSessionParticipant isScreenEnabled](self->_localParticipant, "isScreenEnabled");
  return v3;
}

- (BOOL)isOneToOneRemoteParticipantUsingScreen
{
  _BOOL4 v3;

  v3 = -[VCSessionParticipantOneToOneConfig negotiatedScreenEnabled](-[VCSessionParticipant oneToOneConfig](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "oneToOneConfig"), "negotiatedScreenEnabled");
  if (v3)
    LOBYTE(v3) = -[VCSessionParticipant isScreenEnabled](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "isScreenEnabled");
  return v3;
}

- (BOOL)configureRemoteParticipantForOneToOne:(id)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  _BYTE v27[24];
  __int128 v28;
  VCSession *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = -[VCMediaNegotiatorResultsVideo isSupported](-[VCSessionMediaNegotiator negotiatedVideoSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "negotiatedVideoSettings"), "isSupported");
  v6 = -[VCMediaNegotiatorResultsVideo isSupported](-[VCSessionMediaNegotiator negotiatedScreenSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "negotiatedScreenSettings"), "isSupported");
  v7 = v5 && -[VCSessionParticipant isVideoEnabled](self->_localParticipant, "isVideoEnabled")
    || -[VCSession isUsingPersonaCamera](self, "isUsingPersonaCamera");
  v8 = -[VCMediaNegotiatorResults mediaControlInfoVersion](-[VCSessionMediaNegotiator negotiatedSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "negotiatedSettings"), "mediaControlInfoVersion");
  v9 = objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "prewarmingClientOperatingMode");
  if (!(_DWORD)v9)
  {
    if (v7)
      v9 = 1;
    else
      v9 = 2;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_6;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_6;
      *(_DWORD *)v27 = 136316162;
      *(_QWORD *)&v27[4] = v14;
      *(_WORD *)&v27[12] = 2080;
      *(_QWORD *)&v27[14] = "-[VCSession(OneToOne) configureRemoteParticipantForOneToOne:]";
      *(_WORD *)&v27[22] = 1024;
      LODWORD(v28) = 352;
      WORD2(v28) = 1024;
      *(_DWORD *)((char *)&v28 + 6) = v9;
      WORD5(v28) = 1024;
      HIDWORD(v28) = v7;
      v16 = " [%s] %s:%d Failed to get pre-warming client's operating mode from VCAudioManager! Defaulting to operatingMo"
            "de=%d (due to isUsingCamera=%{BOOL}d)";
      v17 = v15;
      v18 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_6;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_6;
      *(_DWORD *)v27 = 136316674;
      *(_QWORD *)&v27[4] = v19;
      *(_WORD *)&v27[12] = 2080;
      *(_QWORD *)&v27[14] = "-[VCSession(OneToOne) configureRemoteParticipantForOneToOne:]";
      *(_WORD *)&v27[22] = 1024;
      LODWORD(v28) = 352;
      WORD2(v28) = 2112;
      *(_QWORD *)((char *)&v28 + 6) = v13;
      HIWORD(v28) = 2048;
      v29 = self;
      LOWORD(v30) = 1024;
      *(_DWORD *)((char *)&v30 + 2) = v9;
      HIWORD(v30) = 1024;
      LODWORD(v31) = v7;
      v16 = " [%s] %s:%d %@(%p) Failed to get pre-warming client's operating mode from VCAudioManager! Defaulting to oper"
            "atingMode=%d (due to isUsingCamera=%{BOOL}d)";
      v17 = v20;
      v18 = 60;
    }
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, v27, v18);
  }
LABEL_6:
  v10 = -[VCSession newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:](self, "newParticipantOneToOneConfigWithIDSParticipantID:isLocal:mediaControlInfoVersion:videoEnabled:screenEnabled:remoteParticipant:", objc_msgSend(a3, "idsParticipantID", *(_OWORD *)v27, *(_QWORD *)&v27[16], v28, v29, v30, v31), 0, v8, v5, v6, a3);
  if (!v10)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) configureRemoteParticipantForOneToOne:].cold.1();
      }
      goto LABEL_43;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_43;
    v23 = VRTraceErrorLogLevelToCSTR();
    v24 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)v27 = 136316162;
    *(_QWORD *)&v27[4] = v23;
    *(_WORD *)&v27[12] = 2080;
    *(_QWORD *)&v27[14] = "-[VCSession(OneToOne) configureRemoteParticipantForOneToOne:]";
    *(_WORD *)&v27[22] = 1024;
    LODWORD(v28) = 356;
    WORD2(v28) = 2112;
    *(_QWORD *)((char *)&v28 + 6) = v21;
    HIWORD(v28) = 2048;
    v29 = self;
    v25 = " [%s] %s:%d %@(%p) Failed to allocate local 1:1 config!";
    goto LABEL_45;
  }
  if ((objc_msgSend(a3, "configureWithOneToOneParticipantConfig:operatingMode:", v10, v9) & 1) == 0)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) configureRemoteParticipantForOneToOne:].cold.2();
      }
      goto LABEL_43;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v26 = VRTraceErrorLogLevelToCSTR(),
          v24 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_43:
      v11 = 0;
      goto LABEL_9;
    }
    *(_DWORD *)v27 = 136316162;
    *(_QWORD *)&v27[4] = v26;
    *(_WORD *)&v27[12] = 2080;
    *(_QWORD *)&v27[14] = "-[VCSession(OneToOne) configureRemoteParticipantForOneToOne:]";
    *(_WORD *)&v27[22] = 1024;
    LODWORD(v28) = 359;
    WORD2(v28) = 2112;
    *(_QWORD *)((char *)&v28 + 6) = v22;
    HIWORD(v28) = 2048;
    v29 = self;
    v25 = " [%s] %s:%d %@(%p) Failed to configure remote participant for 1:1!";
LABEL_45:
    _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, v25, v27, 0x30u);
    goto LABEL_43;
  }
  -[VCSession setDelegatesForRemoteParticipant:](self, "setDelegatesForRemoteParticipant:", a3);
  v11 = 1;
LABEL_9:

  return v11;
}

- (unsigned)detailedErrorCodeForNoRemotePacketsError
{
  VCConnectionManager *v2;
  int v3;

  v2 = -[VCTransportSession connectionManager](-[VCSession transportSession](self, "transportSession"), "connectionManager");
  if (!-[VCConnectionManager isEndToEndLinkAvailable](v2, "isEndToEndLinkAvailable"))
    return 24;
  v3 = -[VCConnectionManager isEndToEndLinkWithCellAvailable:](v2, "isEndToEndLinkWithCellAvailable:", 1);
  if (v3 | -[VCConnectionManager isEndToEndLinkWithCellAvailable:](v2, "isEndToEndLinkWithCellAvailable:", 0))return 14;
  else
    return 25;
}

- (void)reportExistingParticipantsAnew
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id obj;
  _QWORD v13[4];
  _QWORD v14[4];
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary allKeys](self->_remoteParticipantsMapByUUID, "allKeys");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipantsMapByUUID, "objectForKeyedSubscript:", v8);
        v10 = (void *)MEMORY[0x1E0C99E08];
        v14[0] = v8;
        v13[0] = CFSTR("VCSPUUID");
        v13[1] = CFSTR("VCSPIDSID");
        v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "idsParticipantID"));
        v13[2] = CFSTR("VCSPAudioEnabled");
        v14[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "isAudioEnabled"));
        v13[3] = CFSTR("VCSPVideoEnabled");
        v14[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v9, "isVideoEnabled"));
        v11 = (void *)objc_msgSend(v10, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4));
        -[VCSession addNegotiatedCipherSuitesForParticipant:toReportingDictionary:](self, "addNegotiatedCipherSuitesForParticipant:toReportingDictionary:", v9, v11);
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v9, "callInfoBlob"), "osVersion"), CFSTR("REMBUILD"));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v9, "callInfoBlob"), "deviceType"), CFSTR("RDT"));
        reportingGenericEvent();
        objc_msgSend(v9, "reportConnectionTiming");
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v5);
  }
}

- (void)reportStartedSwitchingToOneToOne:(BOOL)a3
{
  reportingGenericEvent();
  -[VCSession reportClientPersistentSettings](self, "reportClientPersistentSettings");
}

- (void)reportCompletedSwitchingToOneToOne:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double oneToOneSwitchStartTime;
  const __CFString *v7;
  double v8;
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
  double v24;
  __int16 v25;
  VCSession *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  _BOOL4 v30;
  const __CFString *v31;
  _QWORD v32[2];

  v3 = a3;
  v32[1] = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneSwitchStartTime != 0.0)
  {
    v5 = micro();
    oneToOneSwitchStartTime = self->_oneToOneSwitchStartTime;
    v7 = CFSTR("VCSOTOST");
    v8 = v5 - oneToOneSwitchStartTime;
    if (v3)
      v7 = CFSTR("VCGFTSWTT");
    v31 = v7;
    v32[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 - oneToOneSwitchStartTime);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    self->_oneToOneSwitchStartTime = 0.0;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136316162;
          v18 = v10;
          v19 = 2080;
          v20 = "-[VCSession(OneToOne) reportCompletedSwitchingToOneToOne:]";
          v21 = 1024;
          v22 = 423;
          v23 = 2048;
          v24 = v8;
          v25 = 1024;
          LODWORD(v26) = v3;
          v12 = " [%s] %s:%d SwitchTime=%f switchingToOneToOne=%d";
          v13 = v11;
          v14 = 44;
LABEL_15:
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136316674;
          v18 = v15;
          v19 = 2080;
          v20 = "-[VCSession(OneToOne) reportCompletedSwitchingToOneToOne:]";
          v21 = 1024;
          v22 = 423;
          v23 = 2112;
          v24 = *(double *)&v9;
          v25 = 2048;
          v26 = self;
          v27 = 2048;
          v28 = v8;
          v29 = 1024;
          v30 = v3;
          v12 = " [%s] %s:%d %@(%p) SwitchTime=%f switchingToOneToOne=%d";
          v13 = v16;
          v14 = 64;
          goto LABEL_15;
        }
      }
    }
  }
  reportingGenericEvent();
  -[VCSession reportLocalRateControlExperimentConfiguration](self, "reportLocalRateControlExperimentConfiguration");
}

- (void)reportSwitchingError:(BOOL)a3 errorEvent:(unsigned int)a4
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("VCSErrorDetected");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  reportingGenericEvent();
}

- (void)oneToOneToMultiwaySwitchSuspend
{
  tagVCMediaQueue *vcMediaQueue;

  if ((self->_state | 2) == 3)
  {
    -[VCSessionParticipantLocal suspendStreamsOnOneToOneModeSwitch](self->_localParticipant, "suspendStreamsOnOneToOneModeSwitch");
    -[VCSession stopRateControllerOneToOne](self, "stopRateControllerOneToOne");
    vcMediaQueue = self->_oneToOneSettings.vcMediaQueue;
    if (vcMediaQueue)
      VCMediaQueue_Stop((uint64_t)vcMediaQueue);
  }
}

- (void)oneToOneToMultiwaySwitchResume
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  VCConnectionManager_AddTelemetryForPacketHistory((uint64_t)-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), (uint64_t)v3);
  -[VCSession startReportingForOneToOneEnabled:withPayload:](self, "startReportingForOneToOneEnabled:withPayload:", 0, v3);
  -[VCConnectionManager reportCurrentPrimaryConnection](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "reportCurrentPrimaryConnection");
  -[VCSession reportExistingParticipantsAnew](self, "reportExistingParticipantsAnew");
  if ((self->_state | 2) == 3)
  {
    -[VCSession startRateControllersMultiwayFromOneToOne:](self, "startRateControllersMultiwayFromOneToOne:", 1);
    -[VCSessionStatsController reset](self->_sessionStatsController, "reset");
    -[VCSessionStatsController startLocalSessionStatsUpdate](self->_sessionStatsController, "startLocalSessionStatsUpdate");
    VCMediaQueue_Start((uint64_t)self->_mediaQueue);
    if (self->_state == 1)
    {
      -[NSMutableArray addObject:](self->_startingParticipants, "addObject:", self->_localParticipant);
      -[VCSessionParticipantLocal start](self->_localParticipant, "start");
    }
    else
    {
      -[VCSessionParticipantLocal resumeStreamsOnOneToOneModeSwitch](self->_localParticipant, "resumeStreamsOnOneToOneModeSwitch");
      -[NSMutableDictionary removeAllObjects](self->_optInDictionary, "removeAllObjects");
      -[VCSession distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:](self, "distributeBitrateAndOptInToStreamIDsWithSeamlessTransition:", 0);
    }
  }
}

- (void)oneToOneToMultiwaySwitchConfigure
{
  NSArray *v3;
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
  if (!self->_downlinkBandwidthAllocator)
    self->_downlinkBandwidthAllocator = -[VCSessionDownlinkBandwidthAllocator initWithReportingAgent:]([VCSessionDownlinkBandwidthAllocator alloc], "initWithReportingAgent:", self->super._reportingAgent);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = -[VCSession remoteParticipants](self, "remoteParticipants");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[VCSessionDownlinkBandwidthAllocator registerForBandwidthAllocationWithClient:](self->_downlinkBandwidthAllocator, "registerForBandwidthAllocationWithClient:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }
  -[VCSession reportingSetUserInfo](self, "reportingSetUserInfo");
  -[VCSession setupMultiwayABTesting](self, "setupMultiwayABTesting");
  if (self->_state != 3)
    -[VCSessionParticipant configureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:](self->_localParticipant, "configureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:", +[VCSession deviceRoleForSessionMode:](VCSession, "deviceRoleForSessionMode:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode")), 0, 0, 6);
  -[VCSessionParticipantLocal setOneToOneModeEnabled:](self->_localParticipant, "setOneToOneModeEnabled:", 0);
  -[VCConnectionManager setStatisticsCollector:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setStatisticsCollector:", -[AVCRateController statisticsCollector](self->_downlinkRateController, "statisticsCollector"));
  -[VCConnectionManager setIsOneToOneModeEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setIsOneToOneModeEnabled:", 0);
  -[VCTransportSession setOneToOneModeEnabled:isInitiator:](self->_transportSession, "setOneToOneModeEnabled:isInitiator:", 0, self->_isOneToOneInitiator);
  -[VCConnectionManager setiRATDuplicationEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setiRATDuplicationEnabled:", 1);
  -[VCConnectionHealthMonitor setUsingServerBasedLinks:](-[VCConnectionManager connectionHealthMonitor](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "connectionHealthMonitor"), "setUsingServerBasedLinks:", 1);
  -[VCSession setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:](self, "setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:", -[VCCallInfoBlob frameworkVersion](-[VCSessionParticipant callInfoBlob](self->_localParticipant, "callInfoBlob"), "frameworkVersion"), -[VCCallInfoBlob frameworkVersion](-[VCSessionParticipant callInfoBlob](self->_localParticipant, "callInfoBlob"), "frameworkVersion"));
  -[VCSession messageExistingParticipantsPostOneToOneModeSwitch](self, "messageExistingParticipantsPostOneToOneModeSwitch");
  self->_oneToOneSettings.startedOneToOne = 0;
  self->_oneToOneModeEnabled = 0;
  -[VCSessionConfiguration setOneToOneModeEnabled:](self->_configuration, "setOneToOneModeEnabled:", 0);
  -[VCSessionParticipantLocal setOneToOneModeEnabled:](self->_localParticipant, "setOneToOneModeEnabled:", 0);
  -[VCAudioCaptionsCoordinator setOneToOneModeEnabled:](self->_captionsCoordinator, "setOneToOneModeEnabled:", 0);
  VCMediaQueue_SetOneToOne((uint64_t)self->_mediaQueue, 0);
}

- (BOOL)switchFromOneToOneToMultiway
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCSession *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneModeEnabled)
  {
    -[VCSession reportStartedSwitchingToOneToOne:](self, "reportStartedSwitchingToOneToOne:", 0);
    -[VCSession oneToOneToMultiwaySwitchSuspend](self, "oneToOneToMultiwaySwitchSuspend");
    -[VCSession oneToOneToMultiwaySwitchConfigure](self, "oneToOneToMultiwaySwitchConfigure");
    -[VCSession oneToOneToMultiwaySwitchResume](self, "oneToOneToMultiwaySwitchResume");
    -[VCSession reportCompletedSwitchingToOneToOne:](self, "reportCompletedSwitchingToOneToOne:", 0);
    return 1;
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v5;
        v14 = 2080;
        v15 = "-[VCSession(OneToOne) switchFromOneToOneToMultiway]";
        v16 = 1024;
        v17 = 521;
        v7 = " [%s] %s:%d Already switched to GFT, ignoring.";
        v8 = v6;
        v9 = 28;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v12, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136316162;
        v13 = v10;
        v14 = 2080;
        v15 = "-[VCSession(OneToOne) switchFromOneToOneToMultiway]";
        v16 = 1024;
        v17 = 521;
        v18 = 2112;
        v19 = v4;
        v20 = 2048;
        v21 = self;
        v7 = " [%s] %s:%d %@(%p) Already switched to GFT, ignoring.";
        v8 = v11;
        v9 = 48;
        goto LABEL_14;
      }
    }
  }
  return 1;
}

- (void)messageExistingParticipantsPostOneToOneModeSwitch
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id obj;
  const __CFString *v10;
  uint64_t v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableDictionary allKeys](self->_remoteParticipantsMapByUUID, "allKeys");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(obj);
        v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipantsMapByUUID, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7));
        -[VCSession sendNetworkCapabilitiesMessageToParticipant:](self, "sendNetworkCapabilitiesMessageToParticipant:", v8);
        v10 = CFSTR("Thermal");
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_lastThermalLevel);
        -[VCSession sendDeviceStateMessageToParticipant:withStatus:](self, "sendDeviceStateMessageToParticipant:withStatus:", v8, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v5);
  }
}

- (void)multiwayToOneToOneSwitchSuspend
{
  if ((self->_state | 2) == 3)
  {
    -[VCSessionParticipantLocal suspendStreamsOnOneToOneModeSwitch](self->_localParticipant, "suspendStreamsOnOneToOneModeSwitch");
    -[VCSessionStatsController stopLocalSessionStatsUpdate](self->_sessionStatsController, "stopLocalSessionStatsUpdate");
    VCMediaQueue_Stop((uint64_t)self->_mediaQueue);
    -[AVCRateController stop](self->_uplinkRateController, "stop");
    -[AVCRateController stop](self->_downlinkRateController, "stop");
    -[VCSessionDownlinkBandwidthAllocator deregisterForBandwidthAllocationWithClient:](self->_downlinkBandwidthAllocator, "deregisterForBandwidthAllocationWithClient:", -[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"));
  }
}

- (void)multiwayToOneToOneSwitchResume
{
  if ((self->_state | 2) == 3)
  {
    +[VCSession deviceRoleForSessionMode:](VCSession, "deviceRoleForSessionMode:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode"));
    -[VCSession isOneToOneUsingVideo](self, "isOneToOneUsingVideo");
    reportingModeRoleTransportLog();
    -[VCSessionParticipantLocal resumeStreamsOnOneToOneModeSwitch](self->_localParticipant, "resumeStreamsOnOneToOneModeSwitch");
  }
}

- (void)revertMultiwayToOneToOneModeSwitchConfigure
{
  NSArray *v3;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = -[VCSession remoteParticipants](self, "remoteParticipants");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
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
        -[VCSessionDownlinkBandwidthAllocator registerForBandwidthAllocationWithClient:](self->_downlinkBandwidthAllocator, "registerForBandwidthAllocationWithClient:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }
  -[VCSessionParticipantLocal setOneToOneModeEnabled:](self->_localParticipant, "setOneToOneModeEnabled:", 0);
  -[VCConnectionManager setStatisticsCollector:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setStatisticsCollector:", -[AVCRateController statisticsCollector](self->_downlinkRateController, "statisticsCollector"));
  -[VCConnectionManager setIsOneToOneModeEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setIsOneToOneModeEnabled:", 0);
  -[VCTransportSession setOneToOneModeEnabled:isInitiator:](self->_transportSession, "setOneToOneModeEnabled:isInitiator:", 0, self->_isOneToOneInitiator);
  -[VCSession setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:](self, "setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:", -[VCCallInfoBlob frameworkVersion](-[VCSessionParticipant callInfoBlob](self->_localParticipant, "callInfoBlob"), "frameworkVersion"), -[VCCallInfoBlob frameworkVersion](-[VCSessionParticipant callInfoBlob](self->_localParticipant, "callInfoBlob"), "frameworkVersion"));
  self->_oneToOneModeEnabled = 0;
  -[VCSessionConfiguration setOneToOneModeEnabled:](self->_configuration, "setOneToOneModeEnabled:", 0);
  -[VCAudioCaptionsCoordinator setOneToOneModeEnabled:](self->_captionsCoordinator, "setOneToOneModeEnabled:", 0);
  VCMediaQueue_SetOneToOne((uint64_t)self->_mediaQueue, 0);
}

- (BOOL)multiwayToOneToOneSwitchConfigure
{
  uint64_t v3;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  _BYTE v11[24];
  __int128 v12;
  VCSession *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[VCSession renewOneToOneMediaQueue](self, "renewOneToOneMediaQueue");
  self->_oneToOneModeEnabled = 1;
  -[VCSessionConfiguration setOneToOneModeEnabled:](self->_configuration, "setOneToOneModeEnabled:", 1);
  -[VCConnectionManager setIsOneToOneModeEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setIsOneToOneModeEnabled:", 1);
  -[VCSession startReportingForOneToOneEnabled:withPayload:](self, "startReportingForOneToOneEnabled:withPayload:", 1, 0);
  -[VCConnectionManager reportCurrentPrimaryConnection](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "reportCurrentPrimaryConnection");
  -[VCSession reportExistingParticipantsAnew](self, "reportExistingParticipantsAnew");
  -[VCSession setupOneToOneAdaptiveLearning](self, "setupOneToOneAdaptiveLearning");
  -[VCAudioCaptionsCoordinator setOneToOneModeEnabled:](self->_captionsCoordinator, "setOneToOneModeEnabled:", 1);
  v3 = +[VCSession deviceRoleForSessionMode:](VCSession, "deviceRoleForSessionMode:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode"));
  -[VCSession setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:](self, "setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:", CFSTR("2045"), CFSTR("2045"));
  -[VCTransportSession setRemoteDeviceVersionIDS](self->_transportSession, "setRemoteDeviceVersionIDS");
  -[VCConnectionManager setDefaultLinkProbingCapabilityVersionForDeviceRole:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setDefaultLinkProbingCapabilityVersionForDeviceRole:", v3);
  -[VCTransportSession setOneToOneModeEnabled:isInitiator:](self->_transportSession, "setOneToOneModeEnabled:isInitiator:", 1, self->_isOneToOneInitiator);
  -[VCConnectionManager setStatisticsCollector:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setStatisticsCollector:", -[VCSessionParticipantOneToOneConfig statisticsCollector](-[VCSessionParticipant oneToOneConfig](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "oneToOneConfig"), "statisticsCollector"));
  -[VCSession messageExistingParticipantsPostOneToOneModeSwitch](self, "messageExistingParticipantsPostOneToOneModeSwitch");
  if (-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant")
    && !-[VCSession negotiateOneToOneWithRemoteParticipant:](self, "negotiateOneToOneWithRemoteParticipant:", -[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant")))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) multiwayToOneToOneSwitchConfigure].cold.3();
      }
      goto LABEL_11;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v11 = 136316162;
        *(_QWORD *)&v11[4] = v7;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCSession(OneToOne) multiwayToOneToOneSwitchConfigure]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 615;
        WORD2(v12) = 2112;
        *(_QWORD *)((char *)&v12 + 6) = v5;
        HIWORD(v12) = 2048;
        v13 = self;
        v9 = " [%s] %s:%d %@(%p) Failed to negotiate with devices that do not support one to one mode";
LABEL_32:
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, v9, v11, 0x30u);
      }
    }
  }
  else
  {
    -[VCSessionParticipantLocal setOneToOneModeEnabled:](self->_localParticipant, "setOneToOneModeEnabled:", 1);
    if (-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"))
    {
      if (-[VCSession configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:](self, "configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:", -[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), 0))
      {
        -[VCSession setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:](self, "setTransportConnectionSelectionVersionWithLocalFrameWorkVersion:remoteFrameworkVersion:", -[VCCallInfoBlob frameworkVersion](-[VCSessionParticipant callInfoBlob](self->_localParticipant, "callInfoBlob"), "frameworkVersion"), -[VCCallInfoBlob frameworkVersion](-[VCSessionParticipant callInfoBlob](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "callInfoBlob"), "frameworkVersion"));
        return 1;
      }
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSession(OneToOne) multiwayToOneToOneSwitchConfigure].cold.2();
        }
        goto LABEL_11;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v11 = 136316162;
          *(_QWORD *)&v11[4] = v10;
          *(_WORD *)&v11[12] = 2080;
          *(_QWORD *)&v11[14] = "-[VCSession(OneToOne) multiwayToOneToOneSwitchConfigure]";
          *(_WORD *)&v11[22] = 1024;
          LODWORD(v12) = 621;
          WORD2(v12) = 2112;
          *(_QWORD *)((char *)&v12 + 6) = v6;
          HIWORD(v12) = 2048;
          v13 = self;
          v9 = " [%s] %s:%d %@(%p) Failed to reconfigure local participant failed to switch";
          goto LABEL_32;
        }
      }
    }
    else
    {
      if ((self->_state | 2) != 3)
        return 1;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) multiwayToOneToOneSwitchConfigure].cold.1();
      }
    }
  }
LABEL_11:
  -[VCSession revertMultiwayToOneToOneModeSwitchConfigure](self, "revertMultiwayToOneToOneModeSwitchConfigure", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12, v13);
  return 0;
}

- (BOOL)switchFromMultiwayToOneToOne
{
  const __CFString *v3;
  BOOL v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCSession *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneModeEnabled)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 1;
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 1;
      v16 = 136315650;
      v17 = v5;
      v18 = 2080;
      v19 = "-[VCSession(OneToOne) switchFromMultiwayToOneToOne]";
      v20 = 1024;
      v21 = 637;
      v7 = " [%s] %s:%d Already switched to OneToOne, ignoring.";
      v8 = v6;
      v9 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 1;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 1;
      v16 = 136316162;
      v17 = v10;
      v18 = 2080;
      v19 = "-[VCSession(OneToOne) switchFromMultiwayToOneToOne]";
      v20 = 1024;
      v21 = 637;
      v22 = 2112;
      v23 = v3;
      v24 = 2048;
      v25 = self;
      v7 = " [%s] %s:%d %@(%p) Already switched to OneToOne, ignoring.";
      v8 = v11;
      v9 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, v9);
    return 1;
  }
  -[VCSession reportStartedSwitchingToOneToOne:](self, "reportStartedSwitchingToOneToOne:", 1);
  -[VCSession multiwayToOneToOneSwitchSuspend](self, "multiwayToOneToOneSwitchSuspend");
  if (-[VCSession multiwayToOneToOneSwitchConfigure](self, "multiwayToOneToOneSwitchConfigure"))
  {
    -[VCSession multiwayToOneToOneSwitchResume](self, "multiwayToOneToOneSwitchResume");
    v4 = 1;
    -[VCSession reportCompletedSwitchingToOneToOne:](self, "reportCompletedSwitchingToOneToOne:", 1);
  }
  else
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) switchFromMultiwayToOneToOne].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v16 = 136316162;
          v17 = v14;
          v18 = 2080;
          v19 = "-[VCSession(OneToOne) switchFromMultiwayToOneToOne]";
          v20 = 1024;
          v21 = 647;
          v22 = 2112;
          v23 = v13;
          v24 = 2048;
          v25 = self;
          _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to reconfigure session for switch to OneToOne", (uint8_t *)&v16, 0x30u);
        }
      }
    }
    -[VCSession oneToOneToMultiwaySwitchResume](self, "oneToOneToMultiwaySwitchResume");
    return 0;
  }
  return v4;
}

- (void)cleanupOneToOneMediaQueue
{
  _VCSessionOneToOneSettings *p_oneToOneSettings;
  uint64_t vcMediaQueue;

  p_oneToOneSettings = &self->_oneToOneSettings;
  if (self->_oneToOneSettings.mediaQueue != (tagHANDLE *)0xFFFFFFFFLL)
  {
    MediaQueue_CloseHandle();
    p_oneToOneSettings->mediaQueue = (tagHANDLE *)0xFFFFFFFFLL;
  }
  vcMediaQueue = (uint64_t)p_oneToOneSettings->vcMediaQueue;
  if (vcMediaQueue)
    VCMediaQueue_FlushAllPackets(vcMediaQueue);
}

- (void)cleanupOneToOne
{
  -[VCConnectionManager setStartConnectionHealthMonitoring:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setStartConnectionHealthMonitoring:", 0);
  -[VCConnectionManager setIsOneToOneModeEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setIsOneToOneModeEnabled:", 0);
  -[VCTransportSession setOneToOneModeEnabled:isInitiator:](self->_transportSession, "setOneToOneModeEnabled:isInitiator:", 0, self->_isOneToOneInitiator);
  -[VCSession cleanupRateControllerOneToOne](self, "cleanupRateControllerOneToOne");
  -[VCSession cleanupOneToOneMediaQueue](self, "cleanupOneToOneMediaQueue");
  reportingStopTimer();
}

- (void)cleanupOneToOneDelegates
{
  -[VCSession cleanupOneToOneVideoReceiverDelegate](self, "cleanupOneToOneVideoReceiverDelegate");
  -[VCSession cleanUpOneToOneVideoStreamDelegate](self, "cleanUpOneToOneVideoStreamDelegate");
}

- (void)cleanupOneToOneVideoReceiverDelegate
{
  if (self->_oneToOneModeEnabled)
    -[VCSessionParticipantRemote setVideoReceiverFeedbackDelegate:](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "setVideoReceiverFeedbackDelegate:", 0);
}

- (void)cleanUpOneToOneVideoStreamDelegate
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneModeEnabled)
  {
    v2[0] = 0;
    -[VCSessionParticipantRemote setVideoStreamDelegate:delegateFunctions:](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "setVideoStreamDelegate:delegateFunctions:", 0, v2);
  }
}

- (void)startReportingForOneToOneEnabled:(BOOL)a3 withPayload:(id)a4
{
  _BOOL4 v4;
  VCSession *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  VCSession *v33;
  uint64_t v34;

  v4 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = (VCSession *)objc_opt_class();
  if (v4)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7
        || (v9 = VRTraceErrorLogLevelToCSTR(),
            v10 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_19:
        if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("useAggregatorMultiwayforU1"), 1))
        {
          v21 = 5;
        }
        else
        {
          v21 = 0;
        }
        self->_reportingClientType = v21;
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136315650;
      v25 = v9;
      v26 = 2080;
      v27 = "-[VCSession(OneToOne) startReportingForOneToOneEnabled:withPayload:]";
      v28 = 1024;
      v29 = 706;
      v11 = " [%s] %s:%d RTCReporting: Switching to one-to-one mode reporting";
      v12 = v10;
      v13 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_19;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      *(_DWORD *)buf = 136316162;
      v25 = v19;
      v26 = 2080;
      v27 = "-[VCSession(OneToOne) startReportingForOneToOneEnabled:withPayload:]";
      v28 = 1024;
      v29 = 706;
      v30 = 2112;
      v31 = v7;
      v32 = 2048;
      v33 = self;
      v11 = " [%s] %s:%d %@(%p) RTCReporting: Switching to one-to-one mode reporting";
      v12 = v20;
      v13 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    goto LABEL_19;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_28;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315650;
    v25 = v14;
    v26 = 2080;
    v27 = "-[VCSession(OneToOne) startReportingForOneToOneEnabled:withPayload:]";
    v28 = 1024;
    v29 = 711;
    v16 = " [%s] %s:%d RTCReporting: Switching to one-to-many mode reporting";
    v17 = v15;
    v18 = 28;
LABEL_27:
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    goto LABEL_28;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v8 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v25 = v22;
      v26 = 2080;
      v27 = "-[VCSession(OneToOne) startReportingForOneToOneEnabled:withPayload:]";
      v28 = 1024;
      v29 = 711;
      v30 = 2112;
      v31 = v8;
      v32 = 2048;
      v33 = self;
      v16 = " [%s] %s:%d %@(%p) RTCReporting: Switching to one-to-many mode reporting";
      v17 = v23;
      v18 = 48;
      goto LABEL_27;
    }
  }
LABEL_28:
  reportingSetAggregatorForClientType();
  -[VCSession reportingSetUserInfo](self, "reportingSetUserInfo");
  reportingSetPeriodicAggregationOccuredHandler();
  reportingSetPeriodicAggregationOccuredHandler();
  ReportingVC_SetEventDrivenAggregationOccurredHandler();
}

uint64_t __68__VCSession_OneToOne__startReportingForOneToOneEnabled_withPayload___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[VCQoSMonitorManager updateQoSReport:toClientsWithToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "updateQoSReport:toClientsWithToken:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __68__VCSession_OneToOne__startReportingForOneToOneEnabled_withPayload___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[VCQoSMonitorManager updateEventDrivenQoSReport:toClientsWithToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "updateEventDrivenQoSReport:toClientsWithToken:", a3, *(_QWORD *)(a1 + 32));
}

- (void)renewOneToOneMediaQueue
{
  _VCSessionOneToOneSettings *p_oneToOneSettings;
  tagVCMediaQueue *vcMediaQueue;
  uint64_t *p_mediaQueue;

  p_oneToOneSettings = &self->_oneToOneSettings;
  vcMediaQueue = self->_oneToOneSettings.vcMediaQueue;
  if (vcMediaQueue)
  {
    VCMediaQueue_FlushAllPackets((uint64_t)vcMediaQueue);
    VCMediaQueue_SetOneToOne((uint64_t)p_oneToOneSettings->vcMediaQueue, 1);
  }
  else
  {
    p_mediaQueue = (uint64_t *)&p_oneToOneSettings->mediaQueue;
    MediaQueue_CloseHandle();
    MediaQueue_CreateHandle(p_mediaQueue, 0xFFFFFFFFLL);
    objc_msgSend((id)*(p_mediaQueue - 1), "setMediaQueue:", *p_mediaQueue);
  }
}

- (void)setupOneToOneAdaptiveLearning
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[14];
  _QWORD v15[15];

  v15[14] = *MEMORY[0x1E0C80C00];
  v14[0] = *MEMORY[0x1E0CF29B0];
  v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[GKSConnectivitySettings getAdaptiveLearningState](GKSConnectivitySettings, "getAdaptiveLearningState"));
  v14[1] = *MEMORY[0x1E0CF2990];
  v15[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[GKSConnectivitySettings getShortTermHistoryLength](GKSConnectivitySettings, "getShortTermHistoryLength"));
  v14[2] = *MEMORY[0x1E0CF2970];
  v15[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[GKSConnectivitySettings getLongTermHistoryLength](GKSConnectivitySettings, "getLongTermHistoryLength"));
  v14[3] = *MEMORY[0x1E0CF2948];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getAdaptiveLearningA](GKSConnectivitySettings, "getAdaptiveLearningA");
  v15[3] = objc_msgSend(v3, "numberWithDouble:");
  v14[4] = *MEMORY[0x1E0CF2958];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getAdjustmentFactorA](GKSConnectivitySettings, "getAdjustmentFactorA");
  v15[4] = objc_msgSend(v4, "numberWithDouble:");
  v14[5] = *MEMORY[0x1E0CF2998];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getShortTermValueWeightA](GKSConnectivitySettings, "getShortTermValueWeightA");
  v15[5] = objc_msgSend(v5, "numberWithDouble:");
  v14[6] = *MEMORY[0x1E0CF2978];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getLongTermValueWeightA](GKSConnectivitySettings, "getLongTermValueWeightA");
  v15[6] = objc_msgSend(v6, "numberWithDouble:");
  v14[7] = *MEMORY[0x1E0CF2950];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getAdaptiveLearningB](GKSConnectivitySettings, "getAdaptiveLearningB");
  v15[7] = objc_msgSend(v7, "numberWithDouble:");
  v14[8] = *MEMORY[0x1E0CF2960];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getAdjustmentFactorB](GKSConnectivitySettings, "getAdjustmentFactorB");
  v15[8] = objc_msgSend(v8, "numberWithDouble:");
  v14[9] = *MEMORY[0x1E0CF29A0];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getShortTermValueWeightB](GKSConnectivitySettings, "getShortTermValueWeightB");
  v15[9] = objc_msgSend(v9, "numberWithDouble:");
  v14[10] = *MEMORY[0x1E0CF2980];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getLongTermValueWeightB](GKSConnectivitySettings, "getLongTermValueWeightB");
  v15[10] = objc_msgSend(v10, "numberWithDouble:");
  v14[11] = *MEMORY[0x1E0CF2968];
  v11 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getAdjustmentFactorC](GKSConnectivitySettings, "getAdjustmentFactorC");
  v15[11] = objc_msgSend(v11, "numberWithDouble:");
  v14[12] = *MEMORY[0x1E0CF29A8];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getShortTermValueWeightC](GKSConnectivitySettings, "getShortTermValueWeightC");
  v15[12] = objc_msgSend(v12, "numberWithDouble:");
  v14[13] = *MEMORY[0x1E0CF2988];
  v13 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getLongTermValueWeightC](GKSConnectivitySettings, "getLongTermValueWeightC");
  v15[13] = objc_msgSend(v13, "numberWithDouble:");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 14);
  -[VCObject reportingAgent](self, "reportingAgent");
  createAdaptiveLearningForAgent();
}

- (BOOL)negotiateOneToOneWithRemoteParticipant:(id)a3
{
  int v4;
  VCMediaNegotiatorResultsVideo *v5;
  _BOOL4 v6;
  VCSession *v7;
  const __CFString *v8;
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
  uint64_t v19;
  NSObject *v20;
  VCMediaNegotiatorResultsVideo *v21;
  _BOOL4 v22;
  VCSession *v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const __CFString *v40;
  uint64_t v41;
  NSObject *v42;
  _BYTE v43[24];
  __int128 v44;
  VCSession *v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = -[VCSessionParticipantLocal negotiateOneToOne:](self->_localParticipant, "negotiateOneToOne:", a3);
  if (v4 < 0)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v40 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v40 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v41 = VRTraceErrorLogLevelToCSTR();
        v42 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v43 = 136316162;
          *(_QWORD *)&v43[4] = v41;
          *(_WORD *)&v43[12] = 2080;
          *(_QWORD *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
          *(_WORD *)&v43[22] = 1024;
          LODWORD(v44) = 764;
          WORD2(v44) = 2112;
          *(_QWORD *)((char *)&v44 + 6) = v40;
          HIWORD(v44) = 2048;
          v45 = self;
          _os_log_error_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to negotiate one to one settings!", v43, 0x30u);
        }
      }
    }
    return v4 >= 0;
  }
  v5 = -[VCSessionMediaNegotiator negotiatedVideoSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "negotiatedVideoSettings");
  v6 = -[VCMediaNegotiatorResultsVideo isSupported](v5, "isSupported");
  v7 = (VCSession *)objc_opt_class();
  if (!v6)
  {
    if (v7 != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v43 = 136316162;
          *(_QWORD *)&v43[4] = v19;
          *(_WORD *)&v43[12] = 2080;
          *(_QWORD *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
          *(_WORD *)&v43[22] = 1024;
          LODWORD(v44) = 771;
          WORD2(v44) = 2112;
          *(_QWORD *)((char *)&v44 + 6) = v9;
          HIWORD(v44) = 2048;
          v45 = self;
          v12 = " [%s] %s:%d %@(%p) Negotiated 1:1 camera not supported";
          v13 = v20;
          v14 = 48;
          goto LABEL_23;
        }
      }
      goto LABEL_24;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_24;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_DWORD *)v43 = 136315650;
    *(_QWORD *)&v43[4] = v15;
    *(_WORD *)&v43[12] = 2080;
    *(_QWORD *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
    *(_WORD *)&v43[22] = 1024;
    LODWORD(v44) = 771;
    v12 = " [%s] %s:%d Negotiated 1:1 camera not supported";
    v13 = v16;
    v14 = 28;
LABEL_23:
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v43, v14);
    goto LABEL_24;
  }
  if (v7 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_24;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_DWORD *)v43 = 136315906;
    *(_QWORD *)&v43[4] = v10;
    *(_WORD *)&v43[12] = 2080;
    *(_QWORD *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
    *(_WORD *)&v43[22] = 1024;
    LODWORD(v44) = 769;
    WORD2(v44) = 2112;
    *(_QWORD *)((char *)&v44 + 6) = -[VCMediaNegotiatorResultsVideo videoRuleCollections](v5, "videoRuleCollections");
    v12 = " [%s] %s:%d Negotiated 1:1 camera rules: %@";
    v13 = v11;
    v14 = 38;
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v8 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v43 = 136316418;
      *(_QWORD *)&v43[4] = v17;
      *(_WORD *)&v43[12] = 2080;
      *(_QWORD *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
      *(_WORD *)&v43[22] = 1024;
      LODWORD(v44) = 769;
      WORD2(v44) = 2112;
      *(_QWORD *)((char *)&v44 + 6) = v8;
      HIWORD(v44) = 2048;
      v45 = self;
      LOWORD(v46) = 2112;
      *(_QWORD *)((char *)&v46 + 2) = -[VCMediaNegotiatorResultsVideo videoRuleCollections](v5, "videoRuleCollections");
      v12 = " [%s] %s:%d %@(%p) Negotiated 1:1 camera rules: %@";
      v13 = v18;
      v14 = 58;
      goto LABEL_23;
    }
  }
LABEL_24:
  v21 = -[VCSessionMediaNegotiator negotiatedScreenSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator", *(_OWORD *)v43, *(_QWORD *)&v43[16], v44, v45, v46), "negotiatedScreenSettings");
  v22 = -[VCMediaNegotiatorResultsVideo isSupported](v21, "isSupported");
  v23 = (VCSession *)objc_opt_class();
  if (!v22)
  {
    if (v23 != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v25 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v25 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v43 = 136316162;
          *(_QWORD *)&v43[4] = v37;
          *(_WORD *)&v43[12] = 2080;
          *(_QWORD *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
          *(_WORD *)&v43[22] = 1024;
          LODWORD(v44) = 778;
          WORD2(v44) = 2112;
          *(_QWORD *)((char *)&v44 + 6) = v25;
          HIWORD(v44) = 2048;
          v45 = self;
          v29 = " [%s] %s:%d %@(%p) Negotiated 1:1 screen not supported";
          v30 = v38;
          v31 = 48;
          goto LABEL_45;
        }
      }
      return v4 >= 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return v4 >= 0;
    v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return v4 >= 0;
    *(_DWORD *)v43 = 136315650;
    *(_QWORD *)&v43[4] = v32;
    *(_WORD *)&v43[12] = 2080;
    *(_QWORD *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
    *(_WORD *)&v43[22] = 1024;
    LODWORD(v44) = 778;
    v29 = " [%s] %s:%d Negotiated 1:1 screen not supported";
    v30 = v33;
    v31 = 28;
LABEL_45:
    _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, v29, v43, v31);
    return v4 >= 0;
  }
  if (v23 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return v4 >= 0;
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return v4 >= 0;
    v28 = -[VCMediaNegotiatorResultsVideo videoRuleCollections](v21, "videoRuleCollections");
    *(_DWORD *)v43 = 136315906;
    *(_QWORD *)&v43[4] = v26;
    *(_WORD *)&v43[12] = 2080;
    *(_QWORD *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
    *(_WORD *)&v43[22] = 1024;
    LODWORD(v44) = 776;
    WORD2(v44) = 2112;
    *(_QWORD *)((char *)&v44 + 6) = v28;
    v29 = " [%s] %s:%d Negotiated 1:1 screen rules: %@";
    v30 = v27;
    v31 = 38;
    goto LABEL_45;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v24 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v24 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v36 = -[VCMediaNegotiatorResultsVideo videoRuleCollections](v21, "videoRuleCollections");
      *(_DWORD *)v43 = 136316418;
      *(_QWORD *)&v43[4] = v34;
      *(_WORD *)&v43[12] = 2080;
      *(_QWORD *)&v43[14] = "-[VCSession(OneToOne) negotiateOneToOneWithRemoteParticipant:]";
      *(_WORD *)&v43[22] = 1024;
      LODWORD(v44) = 776;
      WORD2(v44) = 2112;
      *(_QWORD *)((char *)&v44 + 6) = v24;
      HIWORD(v44) = 2048;
      v45 = self;
      LOWORD(v46) = 2112;
      *(_QWORD *)((char *)&v46 + 2) = v36;
      v29 = " [%s] %s:%d %@(%p) Negotiated 1:1 screen rules: %@";
      v30 = v35;
      v31 = 58;
      goto LABEL_45;
    }
  }
  return v4 >= 0;
}

- (void)configureOneToOneRateController:(id)a3
{
  -[VCSession configureOneToOneRateController:isUsingCamera:isUsingScreen:](self, "configureOneToOneRateController:isUsingCamera:isUsingScreen:", a3, -[VCSession isOneToOneUsingVideo](self, "isOneToOneUsingVideo"), -[VCSession isOneToOneUsingScreen](self, "isOneToOneUsingScreen"));
}

- (void)configureOneToOneRateController:(id)a3 isUsingCamera:(BOOL)a4 isUsingScreen:(BOOL)a5
{
  _BOOL4 v6;
  const void *v9;
  int v10;
  const __CFString *v11;
  int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  AVCRateController *rateController;
  uint64_t IsLocalOnCellular;
  uint64_t v18;
  AVCRateController *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  unsigned int IsInterfaceOnCellularForActiveConnectionWithQuality;
  int v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  VCSession *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315650;
      v31 = v20;
      v32 = 2080;
      v33 = "-[VCSession(OneToOne) configureOneToOneRateController:isUsingCamera:isUsingScreen:]";
      v34 = 1024;
      v35 = 791;
      v22 = " [%s] %s:%d We cannot configure the OneToOne RateController as there is not an active connection yet";
      v23 = v21;
      v24 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136316162;
      v31 = v25;
      v32 = 2080;
      v33 = "-[VCSession(OneToOne) configureOneToOneRateController:isUsingCamera:isUsingScreen:]";
      v34 = 1024;
      v35 = 791;
      v36 = 2112;
      v37 = v11;
      v38 = 2048;
      v39 = self;
      v22 = " [%s] %s:%d %@(%p) We cannot configure the OneToOne RateController as there is not an active connection yet";
      v23 = v26;
      v24 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
    return;
  }
  v6 = a5;
  -[VCConnectionManager updateNegotiatedSettingsOnetoOne:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "updateNegotiatedSettingsOnetoOne:", -[VCSessionMediaNegotiator negotiatedSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "negotiatedSettings"));
  -[VCConnectionManager updateAllBitrateCapsForConnection:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "updateAllBitrateCapsForConnection:", a3);
  v9 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"));
  if (VCConnection_IsLocalOnWiFiOrWired((uint64_t)v9))
  {
    if (-[VCConnectionManager isDuplicationEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "isDuplicationEnabled"))
    {
      v10 = 512;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  if (self->_isBytesInFlightAdaptationEnabled)
    v12 = v10 | 0x4000;
  else
    v12 = v10;
  if (-[VCSession isUsingPersonaCamera](self, "isUsingPersonaCamera"))
    v12 |= 0x8000u;
  if (v9)
    CFRelease(v9);
  IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), 1, 0);
  if (a4 || v6)
  {
    v13 = v12;
    v14 = objc_msgSend(a3, "uplinkBitrateCapOneToOne");
    v15 = 1;
  }
  else
  {
    v13 = v12;
    v14 = objc_msgSend(a3, "uplinkAudioBitrateCapOneToOne");
    v15 = 2;
  }
  rateController = self->_oneToOneSettings.rateController;
  IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  v18 = VCConnection_LocalCellTech((uint64_t)a3);
  HIDWORD(v27) = v13;
  LOBYTE(v27) = v6;
  -[AVCRateController configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:](rateController, "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", v15, IsLocalOnCellular, v18, IsInterfaceOnCellularForActiveConnectionWithQuality, VCConnection_RemoteCellTech((uint64_t)a3), v14 / 0x3E8uLL, v27);
  v19 = self->_oneToOneSettings.rateController;
  if (!v19 || (-[AVCRateController configuration](v19, "configuration"), v29 != (_DWORD)v15))
  {
    if ((self->_state | 2) == 3)
      -[AVCRateController start](self->_oneToOneSettings.rateController, "start");
  }
}

- (unsigned)vcrcServerBagProfileNumber
{
  uint64_t v3;
  const __CFString *v4;
  id v5;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
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
  VCSession *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[VCSession isOneToOneUsingVideo](self, "isOneToOneUsingVideo"))
    v3 = 1;
  else
    v3 = 2;
  v4 = +[VCRateControlServerBag profileNumberKeyWithMode:](VCRateControlServerBag, "profileNumberKeyWithMode:", v3);
  v5 = +[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:](GKSConnectivitySettings, "getVCRCSeverBagConfigWithKey:", v4);
  if (v5)
    return objc_msgSend(v5, "unsignedIntValue");
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v15 = 136316162;
    v16 = v8;
    v17 = 2080;
    v18 = "-[VCSession(OneToOne) vcrcServerBagProfileNumber]";
    v19 = 1024;
    v20 = 830;
    v21 = 2112;
    v22 = v4;
    v23 = 1024;
    LODWORD(v24) = 0;
    v10 = " [%s] %s:%d Could not find server bag config for key=%@. Using default value=%d";
    v11 = v9;
    v12 = 44;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    v15 = 136316674;
    v16 = v13;
    v17 = 2080;
    v18 = "-[VCSession(OneToOne) vcrcServerBagProfileNumber]";
    v19 = 1024;
    v20 = 830;
    v21 = 2112;
    v22 = v7;
    v23 = 2048;
    v24 = self;
    v25 = 2112;
    v26 = v4;
    v27 = 1024;
    v28 = 0;
    v10 = " [%s] %s:%d %@(%p) Could not find server bag config for key=%@. Using default value=%d";
    v11 = v14;
    v12 = 64;
  }
  _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
  return 0;
}

- (BOOL)addOneToOneParticipant:(id)a3
{
  id v5;
  const __CFString *v6;
  tagVCMediaQueue *vcMediaQueue;
  unsigned int state;
  BOOL result;
  VCSessionParticipantLocal *localParticipant;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *notificationQueue;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  VCSession *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 16, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession+OneToOne.m", 839), 0);
  if (!-[VCDefaults supportsOneToOneMode](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "supportsOneToOneMode"))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) addOneToOneParticipant:].cold.4();
      }
      goto LABEL_73;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_73;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_DWORD *)buf = 136316162;
    v32 = v24;
    v33 = 2080;
    v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
    v35 = 1024;
    v36 = 840;
    v37 = 2112;
    v38 = v20;
    v39 = 2048;
    v40 = self;
    v26 = " [%s] %s:%d %@(%p) Trying to add a oneToOne participant even though we do not support OneToOne mode";
    goto LABEL_72;
  }
  if (-[NSArray count](-[VCSession remoteParticipants](self, "remoteParticipants"), "count"))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      {
LABEL_25:
        v13 = 0;
        goto LABEL_26;
      }
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      v13 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v32 = v11;
        v33 = 2080;
        v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
        v35 = 1024;
        v36 = 843;
        v14 = " [%s] %s:%d Attempting to add another participant while in 1:1 mode!";
        v15 = v12;
        v16 = 28;
LABEL_24:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        goto LABEL_25;
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_25;
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      v13 = 0;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v32 = v17;
        v33 = 2080;
        v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
        v35 = 1024;
        v36 = 843;
        v37 = 2112;
        v38 = v6;
        v39 = 2048;
        v40 = self;
        v14 = " [%s] %s:%d %@(%p) Attempting to add another participant while in 1:1 mode!";
        v15 = v18;
        v16 = 48;
        goto LABEL_24;
      }
    }
LABEL_26:
    notificationQueue = self->_notificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__VCSession_OneToOne__addOneToOneParticipant___block_invoke;
    block[3] = &unk_1E9E527D0;
    block[4] = self;
    block[5] = a3;
    block[6] = v5;
    dispatch_async(notificationQueue, block);
    if (v13)
      -[VCSession dispatchedStopWithError:](self, "dispatchedStopWithError:", v5);
    return 0;
  }
  if (!-[VCSession negotiateOneToOneWithRemoteParticipant:](self, "negotiateOneToOneWithRemoteParticipant:", a3))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) addOneToOneParticipant:].cold.3();
      }
      goto LABEL_73;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_73;
    v27 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_DWORD *)buf = 136316162;
    v32 = v27;
    v33 = 2080;
    v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
    v35 = 1024;
    v36 = 845;
    v37 = 2112;
    v38 = v21;
    v39 = 2048;
    v40 = self;
    v26 = " [%s] %s:%d %@(%p) Failed to negotiate with the remoteParticipant";
    goto LABEL_72;
  }
  if (!-[VCSession configureRemoteParticipantForOneToOne:](self, "configureRemoteParticipantForOneToOne:", a3))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) addOneToOneParticipant:].cold.2();
      }
      goto LABEL_73;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_73;
    v28 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_73;
    *(_DWORD *)buf = 136316162;
    v32 = v28;
    v33 = 2080;
    v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
    v35 = 1024;
    v36 = 846;
    v37 = 2112;
    v38 = v22;
    v39 = 2048;
    v40 = self;
    v26 = " [%s] %s:%d %@(%p) Failed to configure the remoteParticipant for OneToOne";
LABEL_72:
    _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x30u);
    goto LABEL_73;
  }
  if ((self->_state | 2) == 3)
  {
    -[VCSessionParticipantLocal suspendStreamsOnOneToOneModeSwitch](self->_localParticipant, "suspendStreamsOnOneToOneModeSwitch");
    vcMediaQueue = self->_oneToOneSettings.vcMediaQueue;
    if (vcMediaQueue)
      VCMediaQueue_FlushAllPackets((uint64_t)vcMediaQueue);
  }
  if (!-[VCSession configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:](self, "configureLocalParticipantWithOneToOneRemoteParticipant:isInitialConfiguration:", a3, 1))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) addOneToOneParticipant:].cold.1();
      }
      goto LABEL_73;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v29 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v32 = v29;
        v33 = 2080;
        v34 = "-[VCSession(OneToOne) addOneToOneParticipant:]";
        v35 = 1024;
        v36 = 854;
        v37 = 2112;
        v38 = v23;
        v39 = 2048;
        v40 = self;
        v26 = " [%s] %s:%d %@(%p) Failed to setup the remote participant in OneToOneMode";
        goto LABEL_72;
      }
    }
LABEL_73:
    v13 = 1;
    goto LABEL_26;
  }
  -[NSMutableArray addObject:](self->_initializingParticipants, "addObject:", a3);
  state = self->_state;
  if (state == 1)
  {
    -[NSMutableArray addObject:](self->_startingParticipants, "addObject:", a3);
    state = self->_state;
  }
  result = 1;
  if ((state | 2) == 3)
  {
    self->_isOneToOneInitiator = 1;
    -[VCTransportSession setOneToOneModeEnabled:isInitiator:](self->_transportSession, "setOneToOneModeEnabled:isInitiator:", 1, 1);
    -[VCSession startOneToOne](self, "startOneToOne");
    localParticipant = self->_localParticipant;
    if (self->_state == 1)
      -[VCSessionParticipantLocal start](localParticipant, "start");
    else
      -[VCSessionParticipantLocal resumeStreamsOnOneToOneModeSwitch](localParticipant, "resumeStreamsOnOneToOneModeSwitch");
    return 1;
  }
  return result;
}

uint64_t __46__VCSession_OneToOne__addOneToOneParticipant___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:addParticipantWithID:didSucceed:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "uuid"), 0, *(_QWORD *)(a1 + 48));
}

- (BOOL)shouldSendControlChannelMessages
{
  return (self->_state & 0xFFFFFFFD) == 1;
}

- (BOOL)completeTransitionToOneToOneEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v4;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  VCSession *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneModeEnabled == a3)
  {
    LOBYTE(v3) = 1;
    return v3;
  }
  v4 = a3;
  if (self->_oneToOneModeEnabled)
  {
    if (-[VCSession switchFromOneToOneToMultiway](self, "switchFromOneToOneToMultiway"))
    {
LABEL_5:
      -[VCTransportSession resetActiveConnection](self->_transportSession, "resetActiveConnection");
      v3 = 1;
      goto LABEL_8;
    }
  }
  else if (-[VCSession switchFromMultiwayToOneToOne](self, "switchFromMultiwayToOneToOne"))
  {
    goto LABEL_5;
  }
  v3 = 0;
LABEL_8:
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = "Failed";
        v17 = 136316162;
        v18 = v7;
        v19 = 2080;
        v20 = "-[VCSession(OneToOne) completeTransitionToOneToOneEnabled:]";
        if (v3)
          v9 = "Successfully completed";
        v21 = 1024;
        v22 = 903;
        v23 = 2080;
        v24 = (void *)v9;
        v25 = 1024;
        LODWORD(v26) = v4;
        v10 = " [%s] %s:%d %s transition to oneToOneModeEnabled=%d";
        v11 = v8;
        v12 = 44;
        goto LABEL_22;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = "Failed";
        v17 = 136316674;
        v18 = v13;
        v19 = 2080;
        v20 = "-[VCSession(OneToOne) completeTransitionToOneToOneEnabled:]";
        if (v3)
          v15 = "Successfully completed";
        v21 = 1024;
        v22 = 903;
        v23 = 2112;
        v24 = (void *)v6;
        v25 = 2048;
        v26 = self;
        v27 = 2080;
        v28 = v15;
        v29 = 1024;
        v30 = v4;
        v10 = " [%s] %s:%d %@(%p) %s transition to oneToOneModeEnabled=%d";
        v11 = v14;
        v12 = 64;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
      }
    }
  }
  return v3;
}

- (void)completionHandlerOneToOneEnabled:(BOOL)a3 didSucceed:(BOOL)a4 configurationDict:(id)a5
{
  NSObject *sessionQueue;
  _QWORD v6[6];
  BOOL v7;
  BOOL v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  sessionQueue = self->_sessionQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke;
  v6[3] = &unk_1E9E54C98;
  v7 = a4;
  v8 = a3;
  v6[4] = self;
  v6[5] = a5;
  dispatch_async(sessionQueue, v6);
}

void __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  char v4;
  __int128 v5;
  NSObject *v6;
  char v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _QWORD block[4];
  __int128 v19;
  char v20;
  char v21;
  char v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_cold_1();
      }
      goto LABEL_24;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_24;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(unsigned __int8 *)(a1 + 49);
    *(_DWORD *)buf = 136316418;
    v24 = v10;
    v25 = 2080;
    v26 = "-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke";
    v27 = 1024;
    v28 = 910;
    v29 = 2112;
    v30 = v8;
    v31 = 2048;
    v32 = v12;
    v33 = 1024;
    v34 = v13;
    v14 = " [%s] %s:%d %@(%p) Failed to send oneToOneModeEnabled=%d message";
    goto LABEL_26;
  }
  if ((objc_msgSend(v3, "completeTransitionToOneToOneEnabled:", *(unsigned __int8 *)(a1 + 49)) & 1) == 0)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_cold_2();
      }
      goto LABEL_24;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v15 = VRTraceErrorLogLevelToCSTR(),
          v11 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_24:
      v4 = 0;
      goto LABEL_4;
    }
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(unsigned __int8 *)(a1 + 49);
    *(_DWORD *)buf = 136316418;
    v24 = v15;
    v25 = 2080;
    v26 = "-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke";
    v27 = 1024;
    v28 = 913;
    v29 = 2112;
    v30 = v9;
    v31 = 2048;
    v32 = v16;
    v33 = 1024;
    v34 = v17;
    v14 = " [%s] %s:%d %@(%p) Failed to complete transition to oneToOneModeEnabled=%d";
LABEL_26:
    _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, v14, buf, 0x36u);
    goto LABEL_24;
  }
  v4 = 1;
LABEL_4:
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 184);
  v7 = *(_BYTE *)(a1 + 49);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_55;
  block[3] = &unk_1E9E583C0;
  v20 = v4;
  v21 = v7;
  v19 = v5;
  v22 = *(_BYTE *)(a1 + 48);
  dispatch_async(v6, block);
}

uint64_t __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_55(uint64_t a1)
{
  id v2;
  uint64_t v3;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = 0;
  }
  else
  {
    if (*(_BYTE *)(a1 + 49))
      v3 = 20;
    else
      v3 = 19;
    v2 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", v3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession+OneToOne.m", 919), 0);
    objc_msgSend(*(id *)(a1 + 32), "reportSwitchingError:errorEvent:", *(unsigned __int8 *)(a1 + 49), v3);
  }
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:updateConfiguration:didSucceed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 50), v2);
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:oneToOneModeEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 48), v2);
}

- (void)dispatchedSetOneToOneModeEnabled:(BOOL)a3 isLocal:(BOOL)a4 configurationDict:(id)a5
{
  _BOOL8 v6;
  _BOOL4 v8;
  VCSessionParticipantRemote *v9;
  VCSessionParticipantRemote *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  NSUInteger v14;
  NSUInteger v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 oneToOneModeEnabled;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  char v31;
  uint64_t v32;
  NSObject *v33;
  _BOOL4 v34;
  VCControlChannelMessageOptions *v35;
  const __CFString *v36;
  VCSessionMessaging *sessionMessaging;
  uint64_t v38;
  const __CFString *v39;
  NSObject *notificationQueue;
  const __CFString *v41;
  const __CFString *v42;
  uint64_t v43;
  NSObject *v44;
  _BOOL4 v45;
  _BOOL4 switchFromGFTToOneToOneEnabled;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  uint64_t v50;
  NSObject *v51;
  _BOOL4 v52;
  _BOOL4 v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  NSObject *v62;
  _QWORD v63[6];
  char v64;
  BOOL v65;
  _QWORD v66[6];
  BOOL v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  const char *v71;
  __int16 v72;
  int v73;
  __int16 v74;
  _BYTE v75[10];
  _BYTE v76[10];
  _BOOL4 v77;
  __int16 v78;
  int v79;
  __int16 v80;
  NSUInteger v81;
  uint64_t v82;

  v6 = a3;
  v82 = *MEMORY[0x1E0C80C00];
  if (self->_oneToOneModeEnabled == a3)
    goto LABEL_56;
  v8 = a4;
  v9 = -[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant");
  v10 = v9;
  if (v9)
  {
    -[VCSessionParticipantRemote capabilities](v9, "capabilities");
    v12 = HIDWORD(v11) & 1;
  }
  else
  {
    LODWORD(v12) = 1;
  }
  if (v6)
  {
    v13 = self->_switchFromGFTToOneToOneEnabled ? v12 : 0;
    if ((v13 & 1) == 0)
    {
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_31;
        v43 = VRTraceErrorLogLevelToCSTR();
        v44 = *MEMORY[0x1E0CF2758];
        v45 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        v31 = 0;
        if (!v45)
          goto LABEL_57;
        switchFromGFTToOneToOneEnabled = self->_switchFromGFTToOneToOneEnabled;
        *(_DWORD *)buf = 136316162;
        v69 = v43;
        v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        v72 = 1024;
        v73 = 940;
        v74 = 1024;
        *(_DWORD *)v75 = switchFromGFTToOneToOneEnabled;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v12;
        v47 = " [%s] %s:%d Switching from multiway to OneToOne enabled is not supported. switchFromGFTToOneToOneEnabled=%"
              "d remoteSupportsGFTSwitchToOneToOne=%d ";
        v48 = v44;
        v49 = 40;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v41 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v41 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
          goto LABEL_31;
        v50 = VRTraceErrorLogLevelToCSTR();
        v51 = *MEMORY[0x1E0CF2758];
        v52 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        v31 = 0;
        if (!v52)
          goto LABEL_57;
        v53 = self->_switchFromGFTToOneToOneEnabled;
        *(_DWORD *)buf = 136316674;
        v69 = v50;
        v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        v72 = 1024;
        v73 = 940;
        v74 = 2112;
        *(_QWORD *)v75 = v41;
        *(_WORD *)&v75[8] = 2048;
        *(_QWORD *)v76 = self;
        *(_WORD *)&v76[8] = 1024;
        v77 = v53;
        v78 = 1024;
        v79 = v12;
        v47 = " [%s] %s:%d %@(%p) Switching from multiway to OneToOne enabled is not supported. switchFromGFTToOneToOneEn"
              "abled=%d remoteSupportsGFTSwitchToOneToOne=%d ";
        v48 = v51;
        v49 = 60;
      }
      _os_log_impl(&dword_1D8A54000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
      goto LABEL_31;
    }
  }
  v14 = -[NSArray count](-[VCSession remoteParticipants](self, "remoteParticipants"), "count");
  if (v6)
  {
    v15 = v14;
    if (v14 >= 2)
    {
      -[VCObject reportingAgent](self, "reportingAgent");
      reportingSymptom();
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v69 = v18;
            v70 = 2080;
            v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
            v72 = 1024;
            v73 = 950;
            v74 = 1024;
            *(_DWORD *)v75 = 0;
            *(_WORD *)&v75[4] = 1024;
            *(_DWORD *)&v75[6] = v6;
            *(_WORD *)v76 = 2048;
            *(_QWORD *)&v76[2] = v15;
            v20 = " [%s] %s:%d Switch to U+1 requested at improper time - canSwitch=%{BOOL}d, oneToOneModeEnabled=%{BOOL}"
                  "d, remoteParticipantCount=%lu";
            v21 = v19;
            v22 = 50;
            goto LABEL_28;
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v16 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v16 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v29 = VRTraceErrorLogLevelToCSTR();
          v30 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316930;
            v69 = v29;
            v70 = 2080;
            v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
            v72 = 1024;
            v73 = 950;
            v74 = 2112;
            *(_QWORD *)v75 = v16;
            *(_WORD *)&v75[8] = 2048;
            *(_QWORD *)v76 = self;
            *(_WORD *)&v76[8] = 1024;
            v77 = 0;
            v78 = 1024;
            v79 = v6;
            v80 = 2048;
            v81 = v15;
            v20 = " [%s] %s:%d %@(%p) Switch to U+1 requested at improper time - canSwitch=%{BOOL}d, oneToOneModeEnabled="
                  "%{BOOL}d, remoteParticipantCount=%lu";
            v21 = v30;
            v22 = 70;
LABEL_28:
            _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
            v31 = 0;
            if (!v8)
              return;
            goto LABEL_57;
          }
        }
      }
      if (!v8)
        return;
      goto LABEL_31;
    }
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        oneToOneModeEnabled = self->_oneToOneModeEnabled;
        *(_DWORD *)buf = 136316418;
        v69 = v23;
        v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        v72 = 1024;
        v73 = 953;
        v74 = 1024;
        *(_DWORD *)v75 = oneToOneModeEnabled;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v6;
        *(_WORD *)v76 = 1024;
        *(_DWORD *)&v76[2] = v8;
        v26 = " [%s] %s:%d Starting Switch _oneToOneModeEnabled=%d to oneToOneEnabled=%d isLocal=%d";
        v27 = v24;
        v28 = 46;
LABEL_36:
        _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v34 = self->_oneToOneModeEnabled;
        *(_DWORD *)buf = 136316930;
        v69 = v32;
        v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        v72 = 1024;
        v73 = 953;
        v74 = 2112;
        *(_QWORD *)v75 = v17;
        *(_WORD *)&v75[8] = 2048;
        *(_QWORD *)v76 = self;
        *(_WORD *)&v76[8] = 1024;
        v77 = v34;
        v78 = 1024;
        v79 = v6;
        v80 = 1024;
        LODWORD(v81) = v8;
        v26 = " [%s] %s:%d %@(%p) Starting Switch _oneToOneModeEnabled=%d to oneToOneEnabled=%d isLocal=%d";
        v27 = v33;
        v28 = 66;
        goto LABEL_36;
      }
    }
  }
  if (v6
    && -[NSString compare:](-[VCSessionParticipant uuid](self->_localParticipant, "uuid"), "compare:", -[VCSessionParticipant uuid](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "uuid")) == NSOrderedDescending)
  {
    self->_isOneToOneInitiator = 1;
  }
  if (v8)
    self->_oneToOneSwitchStartTime = micro();
  if (-[VCSession isOneToOneUsingScreen](self, "isOneToOneUsingScreen")
    || -[VCSession isOneToOneRemoteParticipantUsingScreen](self, "isOneToOneRemoteParticipantUsingScreen"))
  {
    -[VCConnectionManager setIsOneToOneScreenEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setIsOneToOneScreenEnabled:", 1);
  }
  if (!v10 || !v8 || !-[VCSession shouldSendControlChannelMessages](self, "shouldSendControlChannelMessages"))
  {
    if (!-[VCSession completeTransitionToOneToOneEnabled:](self, "completeTransitionToOneToOneEnabled:", v6))
    {
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_31;
        v54 = VRTraceErrorLogLevelToCSTR();
        v55 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        *(_DWORD *)buf = 136316162;
        v69 = v54;
        v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        v72 = 1024;
        v73 = 977;
        v74 = 1024;
        *(_DWORD *)v75 = v6;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v8;
        v56 = " [%s] %s:%d Failed to complete the switch to oneToOneEnabled=%d isLocal=%d";
        v57 = v55;
        v58 = 40;
        goto LABEL_88;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v42 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v42 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_31;
      v59 = VRTraceErrorLogLevelToCSTR();
      v60 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_DWORD *)buf = 136316674;
      v69 = v59;
      v70 = 2080;
      v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
      v72 = 1024;
      v73 = 977;
      v74 = 2112;
      *(_QWORD *)v75 = v42;
      *(_WORD *)&v75[8] = 2048;
      *(_QWORD *)v76 = self;
      *(_WORD *)&v76[8] = 1024;
      v77 = v6;
      v78 = 1024;
      v79 = v8;
      v56 = " [%s] %s:%d %@(%p) Failed to complete the switch to oneToOneEnabled=%d isLocal=%d";
      v57 = v60;
LABEL_87:
      v58 = 60;
LABEL_88:
      _os_log_error_impl(&dword_1D8A54000, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
      goto LABEL_31;
    }
LABEL_56:
    v31 = 1;
    goto LABEL_57;
  }
  v35 = objc_alloc_init(VCControlChannelMessageOptions);
  -[VCControlChannelMessageOptions setDuplicateMessageOnServerLink:](v35, "setDuplicateMessageOnServerLink:", 1);
  if (v6)
    v36 = CFSTR("VCSessionMessageOneToOneEnabled");
  else
    v36 = CFSTR("VCSessionMessageOneToOneDisabled");
  sessionMessaging = self->_sessionMessaging;
  v38 = -[VCSessionParticipant idsParticipantID](v10, "idsParticipantID");
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __82__VCSession_OneToOne__dispatchedSetOneToOneModeEnabled_isLocal_configurationDict___block_invoke;
  v66[3] = &unk_1E9E583E8;
  v67 = v6;
  v66[4] = self;
  v66[5] = a5;
  if (!-[VCSessionMessaging sendReliableMessage:withTopic:participantID:withOptions:completion:](sessionMessaging, "sendReliableMessage:withTopic:participantID:withOptions:completion:", v36, CFSTR("VCSessionMessageTopicOneToOneEnabledState"), v38, v35, v66))
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:].cold.1();
      }
      goto LABEL_31;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v39 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v39 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v61 = VRTraceErrorLogLevelToCSTR();
      v62 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        v69 = v61;
        v70 = 2080;
        v71 = "-[VCSession(OneToOne) dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:]";
        v72 = 1024;
        v73 = 974;
        v74 = 2112;
        *(_QWORD *)v75 = v39;
        *(_WORD *)&v75[8] = 2048;
        *(_QWORD *)v76 = self;
        *(_WORD *)&v76[8] = 1024;
        v77 = v6;
        v78 = 1024;
        v79 = 1;
        v56 = " [%s] %s:%d %@(%p) Failed to send the oneToOneEnabledState message oneToOneEnabled=%d isLocal=%d";
        v57 = v62;
        goto LABEL_87;
      }
    }
LABEL_31:
    v31 = 0;
LABEL_57:
    notificationQueue = self->_notificationQueue;
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __82__VCSession_OneToOne__dispatchedSetOneToOneModeEnabled_isLocal_configurationDict___block_invoke_64;
    v63[3] = &unk_1E9E54C98;
    v64 = v31;
    v65 = v6;
    v63[4] = self;
    v63[5] = a5;
    dispatch_async(notificationQueue, v63);
  }
}

uint64_t __82__VCSession_OneToOne__dispatchedSetOneToOneModeEnabled_isLocal_configurationDict___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completionHandlerOneToOneEnabled:didSucceed:configurationDict:", *(unsigned __int8 *)(a1 + 48), a2, *(_QWORD *)(a1 + 40));
}

uint64_t __82__VCSession_OneToOne__dispatchedSetOneToOneModeEnabled_isLocal_configurationDict___block_invoke_64(uint64_t a1)
{
  id v2;
  uint64_t v3;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = 0;
  }
  else
  {
    if (*(_BYTE *)(a1 + 49))
      v3 = 20;
    else
      v3 = 19;
    v2 = +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", v3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession+OneToOne.m", 985), 0);
    objc_msgSend(*(id *)(a1 + 32), "reportSwitchingError:errorEvent:", *(unsigned __int8 *)(a1 + 49), v3);
  }
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:updateConfiguration:didSucceed:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), v2);
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSession:oneToOneModeEnabled:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 48), v2);
}

- (void)applyNegotiatedOneToOneFaceTimeSettings
{
  VCSessionParticipantLocal *localParticipant;
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  localParticipant = self->_localParticipant;
  if (localParticipant)
  {
    -[VCSessionParticipantLocal oneToOneSettings](localParticipant, "oneToOneSettings");
    v4 = (void *)*((_QWORD *)&v6 + 1);
    localParticipant = self->_localParticipant;
  }
  else
  {
    v4 = 0;
    v6 = 0u;
    v7 = 0u;
    v5 = 0u;
  }
  objc_msgSend(v4, "setRemoteSwitches:isCaller:", -[VCMediaNegotiatorResultsFaceTimeSettings faceTimeSwitches](-[VCSessionMediaNegotiator negotiatedFaceTimeSettings](-[VCSessionParticipant mediaNegotiator](localParticipant, "mediaNegotiator", v5, v6, v7), "negotiatedFaceTimeSettings"), "faceTimeSwitches"), self->_isOneToOneInitiator);
  objc_msgSend(v4, "negotiateSwitchesForIsCaller:", self->_isOneToOneInitiator);
  -[VCConnectionManager setRemoteLinkProbingCapabilityVersion:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setRemoteLinkProbingCapabilityVersion:", -[VCMediaNegotiatorResultsFaceTimeSettings remoteLinkProbingCapabilityVersion](-[VCSessionMediaNegotiator negotiatedFaceTimeSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "negotiatedFaceTimeSettings"), "remoteLinkProbingCapabilityVersion"));
}

- (void)setupOneToOneABTesting
{
  VCSessionParticipantLocal *localParticipant;
  void *v4;
  const char *v5;
  char *v6;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  const __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  uint64_t v46;
  NSObject *v47;
  const __CFString *v48;
  uint64_t v49;
  NSObject *v50;
  _BOOL4 v51;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  uint64_t v55;
  NSObject *v56;
  _BOOL4 v57;
  const __CFString *v58;
  uint64_t v59;
  NSObject *v60;
  _BOOL4 v61;
  const char *v62;
  NSObject *v63;
  uint32_t v64;
  uint64_t v65;
  NSObject *v66;
  _BOOL4 v67;
  const __CFString *v68;
  uint64_t v69;
  NSObject *v70;
  _BOOL4 v71;
  const char *v72;
  NSObject *v73;
  uint32_t v74;
  uint64_t v75;
  NSObject *v76;
  _BOOL4 v77;
  const __CFString *v78;
  uint64_t v79;
  NSObject *v80;
  _BOOL4 v81;
  const char *v82;
  NSObject *v83;
  uint32_t v84;
  uint64_t v85;
  NSObject *v86;
  _BOOL4 v87;
  const __CFString *v88;
  uint64_t v89;
  NSObject *v90;
  _BOOL4 v91;
  const char *v92;
  NSObject *v93;
  uint32_t v94;
  uint64_t v95;
  NSObject *v96;
  _BOOL4 v97;
  const __CFString *v98;
  uint64_t v99;
  NSObject *v100;
  _BOOL4 v101;
  const char *v102;
  NSObject *v103;
  uint32_t v104;
  uint64_t v105;
  NSObject *v106;
  _BOOL4 v107;
  const __CFString *v108;
  uint64_t v109;
  NSObject *v110;
  _BOOL4 v111;
  const char *v112;
  NSObject *v113;
  uint32_t v114;
  uint64_t v115;
  NSObject *v116;
  _BOOL4 v117;
  uint64_t v118;
  void *v119;
  char *__lasts;
  char *__str;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint8_t buf[4];
  uint64_t v126;
  __int16 v127;
  const char *v128;
  __int16 v129;
  int v130;
  __int16 v131;
  const char *v132;
  __int16 v133;
  VCSession *v134;
  __int16 v135;
  int v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  -[VCSession applyNegotiatedOneToOneFaceTimeSettings](self, "applyNegotiatedOneToOneFaceTimeSettings");
  localParticipant = self->_localParticipant;
  if (localParticipant)
  {
    -[VCSessionParticipantLocal oneToOneSettings](localParticipant, "oneToOneSettings");
    v4 = (void *)*((_QWORD *)&v123 + 1);
  }
  else
  {
    v4 = 0;
    v123 = 0u;
    v124 = 0u;
    v122 = 0u;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v5 = v4 ? (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "A/B testing: %s", v5);
    if (__str)
    {
      v119 = v4;
      __lasts = 0;
      v6 = strtok_r(__str, "\n", &__lasts);
      v7 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v126 = v8;
            v127 = 2080;
            v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
            v129 = 1024;
            v130 = 1006;
            v131 = 2080;
            v132 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
            v133 = 2080;
            v134 = (VCSession *)v6;
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v6 = strtok_r(0, "\n", &__lasts);
      }
      while (v6);
      free(__str);
      v4 = v119;
    }
  }
  objc_msgSend(v4, "negotiatedSwitches");
  objc_msgSend(v4, "remoteSwitches");
  -[VCMediaNegotiatorResultsFaceTimeSettings remoteFaceTimeSwitchesAvailable](-[VCSessionMediaNegotiator negotiatedFaceTimeSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "negotiatedFaceTimeSettings"), "remoteFaceTimeSwitchesAvailable");
  -[VCSession vcrcServerBagProfileNumber](self, "vcrcServerBagProfileNumber");
  -[VCConnectionManager primaryConnHealthAllowedDelay](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "primaryConnHealthAllowedDelay");
  reportingConnecting();
  v10 = objc_msgSend(v4, "isSwitchEnabled:", 0x10000);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v126 = v12;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1012;
        v131 = 1024;
        LODWORD(v132) = v10;
        v14 = " [%s] %s:%d Load switch iRATMetricsEnabled %d";
        v15 = v13;
        v16 = 34;
LABEL_25:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v126 = v17;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1012;
        v131 = 2112;
        v132 = (const char *)v11;
        v133 = 2048;
        v134 = self;
        v135 = 1024;
        v136 = v10;
        v14 = " [%s] %s:%d %@(%p) Load switch iRATMetricsEnabled %d";
        v15 = v18;
        v16 = 54;
        goto LABEL_25;
      }
    }
  }
  v19 = objc_msgSend(v4, "isSwitchEnabled:", 128);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v126 = v21;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1014;
        v131 = 1024;
        LODWORD(v132) = v19;
        v23 = " [%s] %s:%d Load switch iRATRtpEnabled %d";
        v24 = v22;
        v25 = 34;
LABEL_36:
        _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v126 = v26;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1014;
        v131 = 2112;
        v132 = (const char *)v20;
        v133 = 2048;
        v134 = self;
        v135 = 1024;
        v136 = v19;
        v23 = " [%s] %s:%d %@(%p) Load switch iRATRtpEnabled %d";
        v24 = v27;
        v25 = 54;
        goto LABEL_36;
      }
    }
  }
  v28 = objc_msgSend(v4, "isSwitchEnabled:", 256);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v126 = v30;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1016;
        v131 = 1024;
        LODWORD(v132) = v28;
        v32 = " [%s] %s:%d Load switch preWarmCellEnabled %d";
        v33 = v31;
        v34 = 34;
LABEL_47:
        _os_log_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v29 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v126 = v35;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1016;
        v131 = 2112;
        v132 = (const char *)v29;
        v133 = 2048;
        v134 = self;
        v135 = 1024;
        v136 = v28;
        v32 = " [%s] %s:%d %@(%p) Load switch preWarmCellEnabled %d";
        v33 = v36;
        v34 = 54;
        goto LABEL_47;
      }
    }
  }
  v37 = 0x10000;
  if (!v28)
    v37 = 0;
  v38 = 256;
  if (!v19)
    v38 = 0;
  -[VCNetworkFeedbackController updateMetricsConfig:](self->_feedbackController, "updateMetricsConfig:", v38 | v10 | v37);
  v39 = objc_msgSend(v4, "isSwitchEnabled:", 0x10000000);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v41 = VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v126 = v41;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1020;
        v131 = 1024;
        LODWORD(v132) = v39;
        v43 = " [%s] %s:%d Load switch wrmRSSIThresholdEnabled %d";
        v44 = v42;
        v45 = 34;
LABEL_62:
        _os_log_impl(&dword_1D8A54000, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v40 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v40 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v46 = VRTraceErrorLogLevelToCSTR();
      v47 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v126 = v46;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1020;
        v131 = 2112;
        v132 = (const char *)v40;
        v133 = 2048;
        v134 = self;
        v135 = 1024;
        v136 = v39;
        v43 = " [%s] %s:%d %@(%p) Load switch wrmRSSIThresholdEnabled %d";
        v44 = v47;
        v45 = 54;
        goto LABEL_62;
      }
    }
  }
  -[VCNetworkFeedbackController setRSSIThresholdEnabled:](self->_feedbackController, "setRSSIThresholdEnabled:", v39);
  -[VCConnectionManager setPreferRelayOverP2P:reason:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setPreferRelayOverP2P:reason:", objc_msgSend(v4, "isSwitchEnabled:", 1), 1);
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v51 = -[VCConnectionManager preferRelayOverP2PEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "preferRelayOverP2PEnabled");
        *(_DWORD *)buf = 136315906;
        v126 = v49;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1024;
        v131 = 1024;
        LODWORD(v132) = v51;
        v52 = " [%s] %s:%d Load switch preferRelayOverP2P %d";
        v53 = v50;
        v54 = 34;
LABEL_73:
        _os_log_impl(&dword_1D8A54000, v53, OS_LOG_TYPE_DEFAULT, v52, buf, v54);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v48 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v48 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v55 = VRTraceErrorLogLevelToCSTR();
      v56 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v57 = -[VCConnectionManager preferRelayOverP2PEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "preferRelayOverP2PEnabled");
        *(_DWORD *)buf = 136316418;
        v126 = v55;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1024;
        v131 = 2112;
        v132 = (const char *)v48;
        v133 = 2048;
        v134 = self;
        v135 = 1024;
        v136 = v57;
        v52 = " [%s] %s:%d %@(%p) Load switch preferRelayOverP2P %d";
        v53 = v56;
        v54 = 54;
        goto LABEL_73;
      }
    }
  }
  -[VCConnectionManager setFastMediaDuplicationEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setFastMediaDuplicationEnabled:", objc_msgSend(v4, "isSwitchEnabled:", 64));
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v59 = VRTraceErrorLogLevelToCSTR();
      v60 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v61 = -[VCConnectionManager fastMediaDuplicationEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "fastMediaDuplicationEnabled");
        *(_DWORD *)buf = 136315906;
        v126 = v59;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1026;
        v131 = 1024;
        LODWORD(v132) = v61;
        v62 = " [%s] %s:%d Load switch fastMediaDuplicationEnabled %d";
        v63 = v60;
        v64 = 34;
LABEL_84:
        _os_log_impl(&dword_1D8A54000, v63, OS_LOG_TYPE_DEFAULT, v62, buf, v64);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v58 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v58 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v65 = VRTraceErrorLogLevelToCSTR();
      v66 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v67 = -[VCConnectionManager fastMediaDuplicationEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "fastMediaDuplicationEnabled");
        *(_DWORD *)buf = 136316418;
        v126 = v65;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1026;
        v131 = 2112;
        v132 = (const char *)v58;
        v133 = 2048;
        v134 = self;
        v135 = 1024;
        v136 = v67;
        v62 = " [%s] %s:%d %@(%p) Load switch fastMediaDuplicationEnabled %d";
        v63 = v66;
        v64 = 54;
        goto LABEL_84;
      }
    }
  }
  -[VCConnectionManager setDuplicateImportantPktsEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setDuplicateImportantPktsEnabled:", objc_msgSend(v4, "isSwitchEnabled:", 512));
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v69 = VRTraceErrorLogLevelToCSTR();
      v70 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v71 = -[VCConnectionManager duplicateImportantPktsEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "duplicateImportantPktsEnabled");
        *(_DWORD *)buf = 136315906;
        v126 = v69;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1028;
        v131 = 1024;
        LODWORD(v132) = v71;
        v72 = " [%s] %s:%d Load switch duplicateImportantPktsEnabled %d";
        v73 = v70;
        v74 = 34;
LABEL_95:
        _os_log_impl(&dword_1D8A54000, v73, OS_LOG_TYPE_DEFAULT, v72, buf, v74);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v68 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v68 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v75 = VRTraceErrorLogLevelToCSTR();
      v76 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v77 = -[VCConnectionManager duplicateImportantPktsEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "duplicateImportantPktsEnabled");
        *(_DWORD *)buf = 136316418;
        v126 = v75;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1028;
        v131 = 2112;
        v132 = (const char *)v68;
        v133 = 2048;
        v134 = self;
        v135 = 1024;
        v136 = v77;
        v72 = " [%s] %s:%d %@(%p) Load switch duplicateImportantPktsEnabled %d";
        v73 = v76;
        v74 = 54;
        goto LABEL_95;
      }
    }
  }
  -[VCConnectionManager setLowNetworkModeEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setLowNetworkModeEnabled:", objc_msgSend(v4, "isSwitchEnabled:", 0x1000000));
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v79 = VRTraceErrorLogLevelToCSTR();
      v80 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v81 = -[VCConnectionManager lowNetworkModeEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "lowNetworkModeEnabled");
        *(_DWORD *)buf = 136315906;
        v126 = v79;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1030;
        v131 = 1024;
        LODWORD(v132) = v81;
        v82 = " [%s] %s:%d Load switch lowNetworkModeEnabled %d";
        v83 = v80;
        v84 = 34;
LABEL_106:
        _os_log_impl(&dword_1D8A54000, v83, OS_LOG_TYPE_DEFAULT, v82, buf, v84);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v78 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v78 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v85 = VRTraceErrorLogLevelToCSTR();
      v86 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v87 = -[VCConnectionManager lowNetworkModeEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "lowNetworkModeEnabled");
        *(_DWORD *)buf = 136316418;
        v126 = v85;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1030;
        v131 = 2112;
        v132 = (const char *)v78;
        v133 = 2048;
        v134 = self;
        v135 = 1024;
        v136 = v87;
        v82 = " [%s] %s:%d %@(%p) Load switch lowNetworkModeEnabled %d";
        v83 = v86;
        v84 = 54;
        goto LABEL_106;
      }
    }
  }
  -[VCConnectionManager setDuplicationEnhancementEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setDuplicationEnhancementEnabled:", objc_msgSend(v4, "isLocalSwitchEnabled:", 0x2000000));
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v89 = VRTraceErrorLogLevelToCSTR();
      v90 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v91 = -[VCConnectionManager duplicationEnhancementEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "duplicationEnhancementEnabled");
        *(_DWORD *)buf = 136315906;
        v126 = v89;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1032;
        v131 = 1024;
        LODWORD(v132) = v91;
        v92 = " [%s] %s:%d Load switch duplicationEnhancementEnabled %d";
        v93 = v90;
        v94 = 34;
LABEL_117:
        _os_log_impl(&dword_1D8A54000, v93, OS_LOG_TYPE_DEFAULT, v92, buf, v94);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v88 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v88 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v95 = VRTraceErrorLogLevelToCSTR();
      v96 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v97 = -[VCConnectionManager duplicationEnhancementEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "duplicationEnhancementEnabled");
        *(_DWORD *)buf = 136316418;
        v126 = v95;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1032;
        v131 = 2112;
        v132 = (const char *)v88;
        v133 = 2048;
        v134 = self;
        v135 = 1024;
        v136 = v97;
        v92 = " [%s] %s:%d %@(%p) Load switch duplicationEnhancementEnabled %d";
        v93 = v96;
        v94 = 54;
        goto LABEL_117;
      }
    }
  }
  -[VCConnectionManager setiRATDuplicationEnabled:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setiRATDuplicationEnabled:", objc_msgSend(v4, "isSwitchEnabled:", 0x8000000));
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v99 = VRTraceErrorLogLevelToCSTR();
      v100 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v101 = -[VCConnectionManager iRATDuplicationEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "iRATDuplicationEnabled");
        *(_DWORD *)buf = 136315906;
        v126 = v99;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1034;
        v131 = 1024;
        LODWORD(v132) = v101;
        v102 = " [%s] %s:%d Load switch iRATDuplicationEnabled %d";
        v103 = v100;
        v104 = 34;
LABEL_128:
        _os_log_impl(&dword_1D8A54000, v103, OS_LOG_TYPE_DEFAULT, v102, buf, v104);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v98 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v98 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v105 = VRTraceErrorLogLevelToCSTR();
      v106 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v107 = -[VCConnectionManager iRATDuplicationEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "iRATDuplicationEnabled");
        *(_DWORD *)buf = 136316418;
        v126 = v105;
        v127 = 2080;
        v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
        v129 = 1024;
        v130 = 1034;
        v131 = 2112;
        v132 = (const char *)v98;
        v133 = 2048;
        v134 = self;
        v135 = 1024;
        v136 = v107;
        v102 = " [%s] %s:%d %@(%p) Load switch iRATDuplicationEnabled %d";
        v103 = v106;
        v104 = 54;
        goto LABEL_128;
      }
    }
  }
  -[VCConnectionManager setUseMediaDrivenDuplication:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setUseMediaDrivenDuplication:", objc_msgSend(v4, "isSwitchEnabled:", 0x20000000));
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_140;
    v109 = VRTraceErrorLogLevelToCSTR();
    v110 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_140;
    v111 = -[VCConnectionManager useMediaDrivenDuplication](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "useMediaDrivenDuplication");
    *(_DWORD *)buf = 136315906;
    v126 = v109;
    v127 = 2080;
    v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
    v129 = 1024;
    v130 = 1036;
    v131 = 1024;
    LODWORD(v132) = v111;
    v112 = " [%s] %s:%d Load switch useMediaDrivenDuplication %d";
    v113 = v110;
    v114 = 34;
    goto LABEL_139;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v108 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v108 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v115 = VRTraceErrorLogLevelToCSTR();
    v116 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v117 = -[VCConnectionManager useMediaDrivenDuplication](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "useMediaDrivenDuplication");
      *(_DWORD *)buf = 136316418;
      v126 = v115;
      v127 = 2080;
      v128 = "-[VCSession(OneToOne) setupOneToOneABTesting]";
      v129 = 1024;
      v130 = 1036;
      v131 = 2112;
      v132 = (const char *)v108;
      v133 = 2048;
      v134 = self;
      v135 = 1024;
      v136 = v117;
      v112 = " [%s] %s:%d %@(%p) Load switch useMediaDrivenDuplication %d";
      v113 = v116;
      v114 = 54;
LABEL_139:
      _os_log_impl(&dword_1D8A54000, v113, OS_LOG_TYPE_DEFAULT, v112, buf, v114);
    }
  }
LABEL_140:
  -[VCSessionParticipantRemote capabilities](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "capabilities");
  if ((v118 & 0x100000000) != 0)
    -[VCConnectionManager applyLinkRecommendation](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "applyLinkRecommendation");
}

- (void)startOneToOne
{
  _VCSessionOneToOneSettings *p_oneToOneSettings;
  _BOOL4 startedOneToOne;
  VCSession *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  VCSession *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  p_oneToOneSettings = &self->_oneToOneSettings;
  if (!self->_oneToOneSettings.receivedFirstConnection)
  {
    if ((VCSession *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v19 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136316162;
      v39 = v29;
      v40 = 2080;
      v41 = "-[VCSession(OneToOne) startOneToOne]";
      v42 = 1024;
      v43 = 1045;
      v44 = 2112;
      v45 = v19;
      v46 = 2048;
      v47 = self;
      v24 = " [%s] %s:%d %@(%p) We cannot start oneToOne if we haven't yet received an active connection";
      goto LABEL_60;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v39 = v22;
    v40 = 2080;
    v41 = "-[VCSession(OneToOne) startOneToOne]";
    v42 = 1024;
    v43 = 1045;
    v24 = " [%s] %s:%d We cannot start oneToOne if we haven't yet received an active connection";
    goto LABEL_47;
  }
  if (!-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"))
  {
    if ((VCSession *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v20 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v31 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136316162;
      v39 = v31;
      v40 = 2080;
      v41 = "-[VCSession(OneToOne) startOneToOne]";
      v42 = 1024;
      v43 = 1046;
      v44 = 2112;
      v45 = v20;
      v46 = 2048;
      v47 = self;
      v24 = " [%s] %s:%d %@(%p) We cannot start oneToOne if we haven't yet started the remote participant";
      goto LABEL_60;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return;
    v25 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v39 = v25;
    v40 = 2080;
    v41 = "-[VCSession(OneToOne) startOneToOne]";
    v42 = 1024;
    v43 = 1046;
    v24 = " [%s] %s:%d We cannot start oneToOne if we haven't yet started the remote participant";
LABEL_47:
    v27 = v23;
    v28 = 28;
LABEL_61:
    _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v24, buf, v28);
    return;
  }
  startedOneToOne = p_oneToOneSettings->startedOneToOne;
  v5 = (VCSession *)objc_opt_class();
  if (startedOneToOne)
  {
    if (v5 != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v21 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v32 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136316162;
      v39 = v32;
      v40 = 2080;
      v41 = "-[VCSession(OneToOne) startOneToOne]";
      v42 = 1024;
      v43 = 1047;
      v44 = 2112;
      v45 = v21;
      v46 = 2048;
      v47 = self;
      v24 = " [%s] %s:%d %@(%p) We cannot start oneToOne if we have already started oneToOne";
LABEL_60:
      v27 = v30;
      v28 = 48;
      goto LABEL_61;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return;
    v26 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v39 = v26;
    v40 = 2080;
    v41 = "-[VCSession(OneToOne) startOneToOne]";
    v42 = 1024;
    v43 = 1047;
    v24 = " [%s] %s:%d We cannot start oneToOne if we have already started oneToOne";
    goto LABEL_47;
  }
  if (v5 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_15;
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136315650;
    v39 = v7;
    v40 = 2080;
    v41 = "-[VCSession(OneToOne) startOneToOne]";
    v42 = 1024;
    v43 = 1048;
    v9 = " [%s] %s:%d ";
    v10 = v8;
    v11 = 28;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_15;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 136316162;
    v39 = v12;
    v40 = 2080;
    v41 = "-[VCSession(OneToOne) startOneToOne]";
    v42 = 1024;
    v43 = 1048;
    v44 = 2112;
    v45 = v6;
    v46 = 2048;
    v47 = self;
    v9 = " [%s] %s:%d %@(%p) ";
    v10 = v13;
    v11 = 48;
  }
  _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_15:
  -[VCSession setupOneToOneABTesting](self, "setupOneToOneABTesting");
  -[VCConnectionManager reportFirstActiveConnectionOneToOne:remoteOSVersion:redState:isAudioOnly:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "reportFirstActiveConnectionOneToOne:remoteOSVersion:redState:isAudioOnly:", self->_currentActiveConnection, -[VCCallInfoBlob osVersion](-[VCSessionParticipant callInfoBlob](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "callInfoBlob"), "osVersion"), -[VCMediaNegotiatorResultsAudio redPayload](-[VCSessionMediaNegotiator negotiatedAudioSettings](-[VCSessionParticipant mediaNegotiator](self->_localParticipant, "mediaNegotiator"), "negotiatedAudioSettings"), "redPayload") == 20, -[VCSession isOneToOneUsingVideo](self, "isOneToOneUsingVideo") ^ 1);
  if (VCOverlayManager_isOverlayEnabled())
    -[VCConnectionManager setOverlayToken:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setOverlayToken:", -[VCSessionParticipant participantVideoToken](-[VCSession oneToOneRemoteParticipant](self, "oneToOneRemoteParticipant"), "participantVideoToken"));
  -[VCConnectionManager setStartConnectionHealthMonitoring:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "setStartConnectionHealthMonitoring:", 1);
  if (VCReporting_GetClientType() == self->_reportingClientType)
  {
    -[VCSession reportingSetUserInfo](self, "reportingSetUserInfo");
  }
  else
  {
    -[VCSession startReportingForOneToOneEnabled:withPayload:](self, "startReportingForOneToOneEnabled:withPayload:", 1, 0);
    -[VCConnectionManager reportCurrentPrimaryConnection](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "reportCurrentPrimaryConnection");
    -[VCSession reportExistingParticipantsAnew](self, "reportExistingParticipantsAnew");
  }
  -[VCSession isOneToOneUsingVideo](self, "isOneToOneUsingVideo");
  +[VCSession deviceRoleForSessionMode:](VCSession, "deviceRoleForSessionMode:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode"));
  reportingModeRoleTransportLog();
  -[VCSession startRateControllerOneToOne](self, "startRateControllerOneToOne");
  MediaQueue_Start();
  VCMediaQueue_Start((uint64_t)p_oneToOneSettings->vcMediaQueue);
  -[VCTransportSession setOneToOneModeEnabled:isInitiator:](self->_transportSession, "setOneToOneModeEnabled:isInitiator:", 1, self->_isOneToOneInitiator);
  -[VCSessionParticipantLocal handleActiveConnectionChange:](self->_localParticipant, "handleActiveConnectionChange:", self->_currentActiveConnection);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = -[VCSession remoteParticipants](self, "remoteParticipants");
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "handleActiveConnectionChange:", self->_currentActiveConnection);
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    }
    while (v16);
  }
  p_oneToOneSettings->startedOneToOne = 1;
}

uint64_t __56__VCSession_OneToOne__setIsOneToOneRemoteMediaStalling___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 136316162;
      v7 = v2;
      v8 = 2080;
      v9 = "-[VCSession(OneToOne) setIsOneToOneRemoteMediaStalling:]_block_invoke";
      v10 = 1024;
      v11 = 1084;
      v12 = 1024;
      v13 = 1084;
      v14 = 2048;
      v15 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession+OneToOne.m:%d: [%p] OneToOne session should reconnect (ids reinit)", (uint8_t *)&v6, 0x2Cu);
    }
  }
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "vcSessionShouldReconnect:", *(_QWORD *)(a1 + 32));
}

- (void)reportActiveConnectionOneToOne
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
  if (self->_oneToOneSettings.receivedFirstConnection)
  {
    -[VCConnectionManager reportActiveConnectionOneToOne:isAudioOnly:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "reportActiveConnectionOneToOne:isAudioOnly:", self->_currentActiveConnection, -[VCSession isOneToOneUsingVideo](self, "isOneToOneUsingVideo") ^ 1);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315650;
      v5 = v2;
      v6 = 2080;
      v7 = "-[VCSession(OneToOne) reportActiveConnectionOneToOne]";
      v8 = 1024;
      v9 = 1094;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d We haven't yet received an active connection", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)notifyDelegateActiveConnectionDidChange
{
  const void *v3;
  id v4;
  id v5;
  const __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  NSObject *notificationQueue;
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v3 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), 1);
  v4 = -[NSArray firstObject](-[VCSession remoteParticipants](self, "remoteParticipants"), "firstObject");
  if (v3)
  {
    v5 = v4;
    if (VCConnection_IsRelay((uint64_t)v3))
      v6 = CFSTR("RLY-");
    else
      v6 = CFSTR("P2P-");
    if (-[VCConnectionManager isDuplicationEnabled](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "isDuplicationEnabled"))
    {
      v7 = CFSTR("D-");
    }
    else
    {
      v7 = CFSTR("P-");
    }
    v8 = -[__CFString stringByAppendingString:](v7, "stringByAppendingString:", v6);
    notificationQueue = self->_notificationQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __62__VCSession_OneToOne__notifyDelegateActiveConnectionDidChange__block_invoke;
    v10[3] = &unk_1E9E527D0;
    v10[4] = v8;
    v10[5] = v3;
    v10[6] = v5;
    dispatch_async(notificationQueue, v10);
    CFRelease(v3);
  }
}

uint64_t __62__VCSession_OneToOne__notifyDelegateActiveConnectionDidChange__block_invoke(id *a1)
{
  return objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "connectionDidChangeWithLocalInterfaceType:remoteInterfaceType:streamToken:", objc_msgSend(a1[4], "stringByAppendingString:", objc_msgSend(a1[5], "localInterfaceTypeString")), objc_msgSend(a1[4], "stringByAppendingString:", objc_msgSend(a1[5], "remoteInterfaceTypeString")), objc_msgSend(a1[6], "participantVideoToken"));
}

- (void)setLinkTypeForFeedbackController:(id)a3 withActiveConnection:(id)a4
{
  int v5;

  if (VCConnection_IsRelay((uint64_t)a4))
    v5 = 2;
  else
    v5 = 1;
  VCRateControlFeedbackController_UpdateTxLinkType((unsigned __int8 *)a3, v5);
}

- (void)handleActiveConnectionChangeForOneToOne:(id)a3
{
  _VCSessionOneToOneSettings *p_oneToOneSettings;
  _BOOL4 receivedFirstConnection;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_maxConnectionMTU = objc_msgSend(a3, "updateMaxConnectionMTU:", self->_maxConnectionMTU);
  -[VCSession configureOneToOneRateController:](self, "configureOneToOneRateController:", a3);
  p_oneToOneSettings = &self->_oneToOneSettings;
  receivedFirstConnection = self->_oneToOneSettings.receivedFirstConnection;
  self->_oneToOneSettings.receivedFirstConnection = a3 != 0;
  if (a3
    && !receivedFirstConnection
    && -[NSArray count](-[VCSession remoteParticipants](self, "remoteParticipants"), "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315650;
        v10 = v7;
        v11 = 2080;
        v12 = "-[VCSession(OneToOne) handleActiveConnectionChangeForOneToOne:]";
        v13 = 1024;
        v14 = 1129;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d We have received the first active connection, we can now start OneToOne", (uint8_t *)&v9, 0x1Cu);
      }
    }
    -[VCSession startOneToOne](self, "startOneToOne");
  }
  else if (self->_isReconnectPending)
  {
    -[VCTransportSession setOneToOneModeEnabled:isInitiator:](self->_transportSession, "setOneToOneModeEnabled:isInitiator:", 1, self->_isOneToOneInitiator);
    self->_isReconnectPending = 0;
    reportingGenericEvent();
  }
  else
  {
    -[VCSession reportActiveConnectionOneToOne](self, "reportActiveConnectionOneToOne");
  }
  if (VCConnection_IsLocalOnCellular((uint64_t)a3))
    -[VCSessionParticipant setBasebandCongestionDetector:](self->_localParticipant, "setBasebandCongestionDetector:", -[AVCRateController basebandCongestionDetector](p_oneToOneSettings->rateController, "basebandCongestionDetector"));
  -[VCSession setLinkTypeForFeedbackController:withActiveConnection:](self, "setLinkTypeForFeedbackController:withActiveConnection:", -[AVCRateController feedbackController](p_oneToOneSettings->rateController, "feedbackController"), a3);
  -[VCSession notifyDelegateActiveConnectionDidChange](self, "notifyDelegateActiveConnectionDidChange");
}

- (void)configureOneToOneReportingOnVideoEnabled
{
  if (-[VCSession isOneToOneUsingVideo](self, "isOneToOneUsingVideo"))
  {
    +[VCSession deviceRoleForSessionMode:](VCSession, "deviceRoleForSessionMode:", -[VCSessionConfiguration sessionMode](self->_configuration, "sessionMode"));
    reportingModeRoleTransportLog();
    -[VCConnectionManager reportActiveConnectionOneToOne:isAudioOnly:](-[VCTransportSession connectionManager](self->_transportSession, "connectionManager"), "reportActiveConnectionOneToOne:isAudioOnly:", self->_currentActiveConnection, 0);
  }
}

- (void)createSessionMessaging
{
  if (!self->_sessionMessaging)
  {
    self->_controlChannel = -[VCControlChannelMultiWay initWithTransportSessionID:reportingAgent:]([VCControlChannelMultiWay alloc], "initWithTransportSessionID:reportingAgent:", self->_transportSessionID, self->super._reportingAgent);
    self->_sessionMessaging = -[VCSessionMessaging initWithControlChannel:remoteVersion:]([VCSessionMessaging alloc], "initWithControlChannel:remoteVersion:", self->_controlChannel, 0);
    -[VCSession setupAudioEnabledMessages](self, "setupAudioEnabledMessages");
    -[VCSession setupVideoEnabledMessages](self, "setupVideoEnabledMessages");
    -[VCSession setupMediaStateUpdateMessage](self, "setupMediaStateUpdateMessage");
    -[VCSession setupStreamGroupStateFetchMessage](self, "setupStreamGroupStateFetchMessage");
    -[VCSession setupAudioPausedMessages](self, "setupAudioPausedMessages");
    -[VCSession setupVideoPausedMessages](self, "setupVideoPausedMessages");
    -[VCSession setupKeyFrameGenerationMessages](self, "setupKeyFrameGenerationMessages");
    -[VCSession setupSymptomEnabledMessages](self, "setupSymptomEnabledMessages");
    -[VCSession setupWRMAlertUpdateMessage](self, "setupWRMAlertUpdateMessage");
    -[VCSession setupMomentsMessages](self, "setupMomentsMessages");
    -[VCSession setupPreferredInterfaceMessage](self, "setupPreferredInterfaceMessage");
    -[VCSession setupPiPStateChangeMessage](self, "setupPiPStateChangeMessage");
    -[VCSession setupDisconnectMessage](self, "setupDisconnectMessage");
    -[VCSession setupCellTechChangeMessages](self, "setupCellTechChangeMessages");
    -[VCSession setupOneToOneEnabledMessages](self, "setupOneToOneEnabledMessages");
    -[VCSession setupLinkConstrainsChangedMessages](self, "setupLinkConstrainsChangedMessages");
    -[VCSession setupMediaQualityDegradedMessage](self, "setupMediaQualityDegradedMessage");
    -[VCSession setupNetworkCapabilityMessage](self, "setupNetworkCapabilityMessage");
    -[VCSession setupNetworkQualityDegradedMessage](self, "setupNetworkQualityDegradedMessage");
    -[VCSession setupReactionMessages](self, "setupReactionMessages");
    -[VCSession setupDeviceStateMessage](self, "setupDeviceStateMessage");
  }
}

- (void)destroySessionMessaging
{
  -[VCSession stopSessionMessaging](self, "stopSessionMessaging");

  self->_sessionMessaging = 0;
  self->_controlChannel = 0;
}

- (void)startSessionMessaging
{
  -[VCControlChannelMultiWay start](self->_controlChannel, "start");
  -[VCSessionMessaging startMessaging](self->_sessionMessaging, "startMessaging");
}

- (void)stopSessionMessaging
{
  -[VCSessionMessaging stopMessaging](self->_sessionMessaging, "stopMessaging");
  -[VCControlChannelMultiWay flushActiveMessages](self->_controlChannel, "flushActiveMessages");
  -[VCControlChannelMultiWay removeAllActiveParticipants](self->_controlChannel, "removeAllActiveParticipants");
  -[VCControlChannelMultiWay stop](self->_controlChannel, "stop");
}

- (void)broadcastMessage:(id)a3 withTopic:(id)a4
{
  NSArray *v7;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = -[VCSession remoteParticipants](self, "remoteParticipants");
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[VCSessionMessaging sendMessage:withTopic:participantID:](self->_sessionMessaging, "sendMessage:withTopic:participantID:", a3, a4, objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "idsParticipantID"));
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v9);
  }
}

- (void)broadcastMessageDictionary:(id)a3 withTopic:(id)a4
{
  NSArray *v7;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = -[VCSession remoteParticipants](self, "remoteParticipants");
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", a3, a4, objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "idsParticipantID"));
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v9);
  }
}

- (void)broadcastSingleStateMessage:(id)a3 withTopic:(id)a4
{
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = -[VCSession remoteParticipants](self, "remoteParticipants");
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "capabilities");
        if (v13 == 1)
          -[VCSessionMessaging sendMessage:withTopic:participantID:](self->_sessionMessaging, "sendMessage:withTopic:participantID:", a3, a4, objc_msgSend(v12, "idsParticipantID"));
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v9);
  }
}

- (void)setupAudioEnabledMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__VCSession_Messaging__setupAudioEnabledMessages__block_invoke;
  v5[3] = &unk_1E9E55DC0;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCSessionMessageTopicAudioEnabledState"), &unk_1E9EFAE50, 0, v5);
}

void __49__VCSession_Messaging__setupAudioEnabledMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
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
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316930;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCSession(Messaging) setupAudioEnabledMessages]_block_invoke";
      v14 = 1024;
      v15 = 147;
      v16 = 2112;
      v17 = objc_msgSend(v6, "uuid");
      v18 = 1024;
      v19 = objc_msgSend(v6, "transportSessionID");
      v20 = 2112;
      v21 = a4;
      v22 = 2112;
      v23 = objc_msgSend(v7, "uuid");
      v24 = 2080;
      v25 = objc_msgSend(a2, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v10, 0x4Au);
    }
  }
  if (v7)
    objc_msgSend(v7, "setRemoteAudioEnabled:", objc_msgSend(a2, "isEqualToString:", CFSTR("VCSessionMessageAudioEnabled")));
}

- (void)setupVideoEnabledMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__VCSession_Messaging__setupVideoEnabledMessages__block_invoke;
  v5[3] = &unk_1E9E55DC0;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCSessionMessageTopicVideoEnabledStateb"), &unk_1E9EFAE68, 0, v5);
}

void __49__VCSession_Messaging__setupVideoEnabledMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
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
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316930;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCSession(Messaging) setupVideoEnabledMessages]_block_invoke";
      v14 = 1024;
      v15 = 162;
      v16 = 2112;
      v17 = objc_msgSend(v6, "uuid");
      v18 = 1024;
      v19 = objc_msgSend(v6, "transportSessionID");
      v20 = 2112;
      v21 = a4;
      v22 = 2112;
      v23 = objc_msgSend(v7, "uuid");
      v24 = 2080;
      v25 = objc_msgSend(a2, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v10, 0x4Au);
    }
  }
  if (v7)
    objc_msgSend(v7, "setRemoteVideoEnabled:", objc_msgSend(a2, "isEqualToString:", CFSTR("VCSessionMessageVideoEnabled")));
}

- (void)setupStreamGroupStateFetchMessage
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke;
  v5[3] = &unk_1E9E58538;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCSessionMessageTopicFetchStreamGroupsState"), 0, 0, 0, v5);
}

void __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  int ErrorLogLevelForModule;
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
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v7 = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if (a2)
  {
    v8 = (void *)v7;
    if (v7)
    {
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v6)
      {
        if (ErrorLogLevelForModule >= 6)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v12 = 136316930;
            v13 = v10;
            v14 = 2080;
            v15 = "-[VCSession(Messaging) setupStreamGroupStateFetchMessage]_block_invoke";
            v16 = 1024;
            v17 = 182;
            v18 = 2112;
            v19 = objc_msgSend(v6, "uuid");
            v20 = 1024;
            v21 = objc_msgSend(v6, "transportSessionID");
            v22 = 2112;
            v23 = a4;
            v24 = 2112;
            v25 = objc_msgSend(v8, "uuid");
            v26 = 2112;
            v27 = a2;
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID=%u participantId[%@] participantUUID[%@] message=%@", (uint8_t *)&v12, 0x4Au);
          }
        }
        objc_msgSend(v6, "sendStreamGroupStateToParticipant:", v8);
      }
      else if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_3();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_1();
  }
}

- (void)setupAudioPausedMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__VCSession_Messaging__setupAudioPausedMessages__block_invoke;
  v5[3] = &unk_1E9E55DC0;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCSessionMessageTopicAudioPausedState"), &unk_1E9EFAE80, 0, v5);
}

uint64_t __48__VCSession_Messaging__setupAudioPausedMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  result = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if (result)
  {
    v8 = (void *)result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136316930;
        v12 = v9;
        v13 = 2080;
        v14 = "-[VCSession(Messaging) setupAudioPausedMessages]_block_invoke";
        v15 = 1024;
        v16 = 199;
        v17 = 2112;
        v18 = objc_msgSend(v6, "uuid");
        v19 = 1024;
        v20 = objc_msgSend(v6, "transportSessionID");
        v21 = 2112;
        v22 = a4;
        v23 = 2112;
        v24 = objc_msgSend(v8, "uuid");
        v25 = 2080;
        v26 = objc_msgSend(a2, "UTF8String");
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v11, 0x4Au);
      }
    }
    return objc_msgSend(v8, "setRemoteAudioPaused:", objc_msgSend(a2, "isEqualToString:", CFSTR("VCSessionMessageAudioPaused")));
  }
  return result;
}

- (void)setupOneToOneEnabledMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__VCSession_Messaging__setupOneToOneEnabledMessages__block_invoke;
  v5[3] = &unk_1E9E55DC0;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCSessionMessageTopicOneToOneEnabledState"), &unk_1E9EFAE98, 0, v5);
}

void __52__VCSession_Messaging__setupOneToOneEnabledMessages__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(*(id *)(a1 + 32), "strong");
  v7 = *(NSObject **)(v6 + 176);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__VCSession_Messaging__setupOneToOneEnabledMessages__block_invoke_2;
  v8[3] = &unk_1E9E527D0;
  v8[4] = v6;
  v8[5] = a4;
  v8[6] = a2;
  dispatch_async(v7, v8);
}

void __52__VCSession_Messaging__setupOneToOneEnabledMessages__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "uuid");
      v6 = objc_msgSend(*(id *)(a1 + 32), "transportSessionID");
      v7 = *(_QWORD *)(a1 + 40);
      v8 = objc_msgSend(v2, "uuid");
      v9 = objc_msgSend(*(id *)(a1 + 48), "UTF8String");
      v10 = 136316930;
      v11 = v3;
      v12 = 2080;
      v13 = "-[VCSession(Messaging) setupOneToOneEnabledMessages]_block_invoke_2";
      v14 = 1024;
      v15 = 214;
      v16 = 2112;
      v17 = v5;
      v18 = 1024;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      v22 = 2112;
      v23 = v8;
      v24 = 2080;
      v25 = v9;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v10, 0x4Au);
    }
  }
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "dispatchedSetOneToOneModeEnabled:isLocal:configurationDict:", objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("VCSessionMessageOneToOneEnabled")), 0, 0);
}

- (void)setupVideoPausedMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__VCSession_Messaging__setupVideoPausedMessages__block_invoke;
  v5[3] = &unk_1E9E55DC0;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCSessionMessageTopicVideoPausedState"), &unk_1E9EFAEB0, 0, v5);
}

uint64_t __48__VCSession_Messaging__setupVideoPausedMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  result = objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if (result)
  {
    v8 = (void *)result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136316930;
        v12 = v9;
        v13 = 2080;
        v14 = "-[VCSession(Messaging) setupVideoPausedMessages]_block_invoke";
        v15 = 1024;
        v16 = 232;
        v17 = 2112;
        v18 = objc_msgSend(v6, "uuid");
        v19 = 1024;
        v20 = objc_msgSend(v6, "transportSessionID");
        v21 = 2112;
        v22 = a4;
        v23 = 2112;
        v24 = objc_msgSend(v8, "uuid");
        v25 = 2080;
        v26 = objc_msgSend(a2, "UTF8String");
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v11, 0x4Au);
      }
    }
    return objc_msgSend(v8, "setRemoteVideoPaused:", objc_msgSend(a2, "isEqualToString:", CFSTR("VCSessionMessageVideoPaused")));
  }
  return result;
}

- (void)setupKeyFrameGenerationMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__VCSession_Messaging__setupKeyFrameGenerationMessages__block_invoke;
  v5[3] = &unk_1E9E58538;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:requireReliable:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:requireReliable:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCSessionMessageTopicGenerateKeyFrame"), 0, 1, 0, 0, v5);
}

uint64_t __55__VCSession_Messaging__setupKeyFrameGenerationMessages__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "generateKeyFrameWithReceivedMessage:forParticipant:", a2, a4);
}

- (void)processSymptomFromMessage:(id)a3 participantID:(id)a4 isLocalInitiated:(BOOL)a5 isLocalSideOnly:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const void *v14;
  uint64_t v15;
  NSObject *v16;
  __CFDictionary *Mutable;
  const void **v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  id v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const void *v42;
  uint64_t v43;

  v6 = a6;
  v7 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self), "strong");
  v11 = objc_msgSend((id)objc_msgSend(v10, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if (a3)
  {
    v12 = (void *)v11;
    if (v11)
    {
      objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("VCSessionMessageSymptom"));
      v13 = processGroupSymptoms();
      v14 = (const void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("VCSessionMessageGroupID"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136317954;
          v20 = v15;
          v21 = 2080;
          v22 = "-[VCSession(Messaging) processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:]";
          v23 = 1024;
          v24 = 259;
          v25 = 2112;
          v26 = objc_msgSend(v10, "uuid");
          v27 = 1024;
          v28 = objc_msgSend(v10, "transportSessionID");
          v29 = 2112;
          v30 = a4;
          v31 = 2112;
          v32 = objc_msgSend(v12, "uuid");
          v33 = 1024;
          v34 = v7;
          v35 = 1024;
          v36 = v6;
          v37 = 2112;
          v38 = a3;
          v39 = 1024;
          v40 = v13;
          v41 = 2112;
          v42 = v14;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SymptomReporter: VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID:[%@] isLocalInitiated:%d isLocalSideOnly:%d message:%@, symptomID: %d, groupID: %@", buf, 0x66u);
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
          -[VCSession(Messaging) processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:].cold.1();
      }
    }
  }
}

- (void)setupSymptomEnabledMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[4] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__VCSession_Messaging__setupSymptomEnabledMessages__block_invoke;
  v6[3] = &unk_1E9E58560;
  v6[4] = v3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VCSession_Messaging__setupSymptomEnabledMessages__block_invoke_58;
  v5[3] = &unk_1E9E58538;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCSessionMessageTopicSymptom"), 0, 0, v6, v5);
}

uint64_t __51__VCSession_Messaging__setupSymptomEnabledMessages__block_invoke(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
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
      v15 = "-[VCSession(Messaging) setupSymptomEnabledMessages]_block_invoke";
      v16 = 1024;
      v17 = 283;
      v18 = 2112;
      v19 = a2;
      v20 = 2112;
      v21 = a4;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SymptomReporter: Failed to send symptom message %@ to participantID %@, requesting only the local side", (uint8_t *)&v12, 0x30u);
    }
  }
  return objc_msgSend(v8, "processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:", a2, a4, 1, 1);
}

uint64_t __51__VCSession_Messaging__setupSymptomEnabledMessages__block_invoke_58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:", a2, a4, 0, 0);
}

- (void)setupWRMAlertUpdateMessage
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke;
  v5[3] = &unk_1E9E55DC0;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCWRMAlertStateUpdateMessageTopic"), &unk_1E9EFAEC8, 0, v5);
}

void __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136316930;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCSession(Messaging) setupWRMAlertUpdateMessage]_block_invoke";
        v16 = 1024;
        v17 = 302;
        v18 = 2112;
        v19 = objc_msgSend(v6, "uuid");
        v20 = 1024;
        v21 = objc_msgSend(v6, "transportSessionID");
        v22 = 2112;
        v23 = a4;
        v24 = 2112;
        v25 = objc_msgSend(v7, "uuid");
        v26 = 2080;
        v27 = objc_msgSend(a2, "UTF8String");
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v12, 0x4Au);
      }
    }
    if (objc_msgSend(a2, "isEqualToString:", CFSTR("VCWRMAlertStateEnabled")))
    {
      v10 = (void *)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      v11 = 1;
LABEL_12:
      objc_msgSend(v10, "setRemotePreWarmStateEnabled:", v11);
      return;
    }
    if (objc_msgSend(a2, "isEqualToString:", CFSTR("VCWRMAlertStateDisabled")))
    {
      v10 = (void *)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      v11 = 0;
      goto LABEL_12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke_cold_2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke_cold_1();
  }
}

- (void)setupMomentsMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__VCSession_Messaging__setupMomentsMessages__block_invoke;
  v5[3] = &unk_1E9E58538;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCSessionMomentsStateMessageTopic"), 0, 0, 0, v5);
}

void __44__VCSession_Messaging__setupMomentsMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v7 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("vcMomentsRequesterID"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCSession(Messaging) setupMomentsMessages]_block_invoke";
      v14 = 1024;
      v15 = 325;
      v16 = 2112;
      v17 = a2;
      v18 = 2112;
      v19 = a4;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d moment message %@ from participantId:[%@] participantUUID:[%@]", (uint8_t *)&v10, 0x3Au);
    }
  }
  if (a2)
  {
    objc_msgSend(v6, "didReceiveMomentsRequest:", a2);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __44__VCSession_Messaging__setupMomentsMessages__block_invoke_cold_1();
  }
}

- (void)setupVideoRedundancyMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__VCSession_Messaging__setupVideoRedundancyMessages__block_invoke;
  v5[3] = &unk_1E9E55DC0;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCSessionMessageTopicVideoRedundancyState"), &unk_1E9EFAEE0, 0, v5);
}

void __52__VCSession_Messaging__setupVideoRedundancyMessages__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
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
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316930;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCSession(Messaging) setupVideoRedundancyMessages]_block_invoke";
      v14 = 1024;
      v15 = 342;
      v16 = 2112;
      v17 = objc_msgSend(v6, "uuid");
      v18 = 1024;
      v19 = objc_msgSend(v6, "transportSessionID");
      v20 = 2112;
      v21 = a4;
      v22 = 2112;
      v23 = objc_msgSend(v7, "uuid");
      v24 = 2080;
      v25 = objc_msgSend(a2, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] participantId:[%@] participantUUID[%@] receives message:%s", (uint8_t *)&v10, 0x4Au);
    }
  }
}

- (void)setupPreferredInterfaceMessage
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__VCSession_Messaging__setupPreferredInterfaceMessage__block_invoke;
  v5[3] = &unk_1E9E58538;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCPreferredInterfaceMessageTopic"), 0, 0, 0, v5);
}

void __54__VCSession_Messaging__setupPreferredInterfaceMessage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  unsigned __int8 v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136316930;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCSession(Messaging) setupPreferredInterfaceMessage]_block_invoke";
      v16 = 1024;
      v17 = 356;
      v18 = 2112;
      v19 = objc_msgSend(v6, "uuid");
      v20 = 1024;
      v21 = objc_msgSend(v6, "transportSessionID");
      v22 = 2112;
      v23 = a4;
      v24 = 2112;
      v25 = objc_msgSend(v7, "uuid");
      v26 = 2112;
      v27 = a2;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession[%@] transportSessionID[%u] idsParticipantID[%@] participantUUID[%@] receives message[%@]", (uint8_t *)&v12, 0x4Au);
    }
  }
  if (a2)
  {
    v10 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VCPreferredInterfaceKey")), "unsignedIntValue");
    v11 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VCPreferredInterfaceDuplicatingKey")), "BOOLValue");
    if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VCPreferredInterfaceMediaUnrecoverableSignalKey")), "BOOLValue"))
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager"), "updateWithRemoteMediaHealthDuplication:", v11);
    }
    else
    {
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager"), "setPreferredRemoteInterfaceForDuplication:", v10);
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager"), "processRemoteWRMSuggestion:isRemoteDuplicating:", v10 == 0, v11);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __54__VCSession_Messaging__setupPreferredInterfaceMessage__block_invoke_cold_1();
  }
}

- (void)setupPiPStateChangeMessage
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__VCSession_Messaging__setupPiPStateChangeMessage__block_invoke;
  v5[3] = &unk_1E9E58538;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCWindowStateChange"), 0, 1, 0, v5);
}

void *__50__VCSession_Messaging__setupPiPStateChangeMessage__block_invoke(uint64_t a1, void *a2)
{
  void *result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (a2)
  {
    v4 = result;
    v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VCWindowState"));
    v6 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VCWindowWidth"));
    v7 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VCWindowHeight"));
    v8 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VCWindowOriginX"));
    v9 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VCWindowOriginY"));
    v10 = objc_msgSend(v5, "intValue");
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    if (v6 && v7)
    {
      objc_msgSend(v8, "doubleValue");
      v11 = v15;
      objc_msgSend(v9, "doubleValue");
      v12 = v16;
      objc_msgSend(v6, "doubleValue");
      v13 = v17;
      objc_msgSend(v7, "doubleValue");
      v14 = v18;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315906;
        v22 = v19;
        v23 = 2080;
        v24 = "-[VCSession(Messaging) setupPiPStateChangeMessage]_block_invoke";
        v25 = 1024;
        v26 = 396;
        v27 = 2112;
        v28 = a2;
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession received message about PIP State change:%@", (uint8_t *)&v21, 0x26u);
      }
    }
    result = (void *)objc_msgSend(v4, "localParticipant");
    if (v5 && (v10 & 0x80000000) == 0 && (int)v10 <= 2)
      return (void *)objc_msgSend(result, "updateWindowState:isLocal:windowRect:", v10, 0, v11, v12, v13, v14);
  }
  return result;
}

- (void)setupDisconnectMessage
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__VCSession_Messaging__setupDisconnectMessage__block_invoke;
  v5[3] = &unk_1E9E55DC0;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCDisconnectMessage"), 0, 0, v5);
}

uint64_t __46__VCSession_Messaging__setupDisconnectMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v10;
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
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v10 = v6;
      v11 = 2080;
      v12 = "-[VCSession(Messaging) setupDisconnectMessage]_block_invoke";
      v13 = 1024;
      v14 = 412;
      v15 = 1024;
      v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "transportSession"), "connectionManager"), "callID");
      v17 = 2112;
      v18 = a4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession callID[%u] received 'disconnect' message from remote participant '%@'", buf, 0x2Cu);
    }
  }
  return objc_msgSend(v5, "stopWithError:didRemoteCancel:", +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 22, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSession+Messaging.m", 413), 0), 1);
}

- (void)setupMediaQualityDegradedMessage
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke;
  v5[3] = &unk_1E9E55DC0;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCMediaQualityDegradedMessageTopic"), &unk_1E9EFAEF8, 0, v5);
}

void __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136316930;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCSession(Messaging) setupMediaQualityDegradedMessage]_block_invoke";
        v16 = 1024;
        v17 = 428;
        v18 = 2112;
        v19 = objc_msgSend(v6, "uuid");
        v20 = 1024;
        v21 = objc_msgSend(v6, "transportSessionID");
        v22 = 2112;
        v23 = a4;
        v24 = 2112;
        v25 = objc_msgSend(v7, "uuid");
        v26 = 2080;
        v27 = objc_msgSend(a2, "UTF8String");
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession=%@ transportSessionID=%u participantId=%@ participantUUID=%@ receives message=%s", (uint8_t *)&v12, 0x4Au);
      }
    }
    if (objc_msgSend(a2, "isEqualToString:", CFSTR("VCMediaQualityDegraded")))
    {
      v10 = (void *)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      v11 = 1;
LABEL_12:
      objc_msgSend(v10, "setIsRemoteMediaQualityDegraded:", v11);
      return;
    }
    if (objc_msgSend(a2, "isEqualToString:", CFSTR("VCMediaQualityRecovered")))
    {
      v10 = (void *)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      v11 = 0;
      goto LABEL_12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke_cold_2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke_cold_1();
  }
}

- (void)setupNetworkQualityDegradedMessage
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke;
  v5[3] = &unk_1E9E55DC0;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCNetworkQualityDegradedMessageTopic"), &unk_1E9EFAF10, 0, v5);
}

void __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
    v7 = (void *)objc_msgSend((id)objc_msgSend(v6, "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", a4);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136316930;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCSession(Messaging) setupNetworkQualityDegradedMessage]_block_invoke";
        v16 = 1024;
        v17 = 451;
        v18 = 2112;
        v19 = objc_msgSend(v6, "uuid");
        v20 = 1024;
        v21 = objc_msgSend(v6, "transportSessionID");
        v22 = 2112;
        v23 = a4;
        v24 = 2112;
        v25 = objc_msgSend(v7, "uuid");
        v26 = 2080;
        v27 = objc_msgSend(a2, "UTF8String");
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession=%@ transportSessionID=%u participantId=%@ participantUUID=%@ receives message=%s", (uint8_t *)&v12, 0x4Au);
      }
    }
    if (objc_msgSend(a2, "isEqualToString:", CFSTR("VCNetworkQualityDegraded")))
    {
      v10 = (void *)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      v11 = 1;
LABEL_12:
      objc_msgSend(v10, "setIsRemoteNetworkQualityDegraded:", v11);
      return;
    }
    if (objc_msgSend(a2, "isEqualToString:", CFSTR("VCNetworkQualityRecovered")))
    {
      v10 = (void *)objc_msgSend((id)objc_msgSend(v6, "transportSession"), "connectionManager");
      v11 = 0;
      goto LABEL_12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke_cold_2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke_cold_1();
  }
}

- (void)setupDeviceStateMessage
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__VCSession_Messaging__setupDeviceStateMessage__block_invoke;
  v5[3] = &unk_1E9E58538;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:requireReliable:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:requireReliable:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCSessionMessageTopicDeviceState"), 0, 0, 1, 0, v5);
}

void __47__VCSession_Messaging__setupDeviceStateMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(*(id *)(a1 + 32), "strong");
  v7 = *(NSObject **)(v6 + 176);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__VCSession_Messaging__setupDeviceStateMessage__block_invoke_2;
  v8[3] = &unk_1E9E527D0;
  v8[4] = v6;
  v8[5] = a2;
  v8[6] = a4;
  dispatch_async(v7, v8);
}

uint64_t __47__VCSession_Messaging__setupDeviceStateMessage__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDeviceStateMessage:forParticipantId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)handleDeviceStateMessage:(id)a3 forParticipantId:(id)a4
{
  VCSession *v6;
  void *v7;
  int ErrorLogLevelForModule;
  char *v9;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  VCSession *v14;
  char *__lasts;
  char *__str;
  _QWORD v17[2];
  _QWORD v18[2];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v6 = self;
  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  if (a3)
  {
    v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v6->_remoteParticipantsMapByServerID, "objectForKeyedSubscript:", a4);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v7)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        __str = 0;
        asprintf(&__str, "%s", (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
        if (__str)
        {
          v14 = v6;
          __lasts = 0;
          v9 = strtok_r(__str, "\n", &__lasts);
          v10 = (os_log_t *)MEMORY[0x1E0CF2758];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v11 = VRTraceErrorLogLevelToCSTR();
              v12 = *v10;
              if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                v20 = v11;
                v21 = 2080;
                v22 = "-[VCSession(Messaging) handleDeviceStateMessage:forParticipantId:]";
                v23 = 1024;
                v24 = 485;
                v25 = 2080;
                v26 = "Received State Update:";
                v27 = 2080;
                v28 = v9;
                _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v9 = strtok_r(0, "\n", &__lasts);
          }
          while (v9);
          free(__str);
          v6 = v14;
        }
      }
      if (objc_msgSend(v7, "uuid"))
      {
        if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Thermal")))
        {
          v17[0] = CFSTR("VCSPUUID");
          v13 = objc_msgSend(v7, "uuid");
          v17[1] = CFSTR("Thermal");
          v18[0] = v13;
          v18[1] = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Thermal"));
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
          -[VCObject reportingAgent](v6, "reportingAgent");
          reportingGenericEvent();
        }
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession(Messaging) handleDeviceStateMessage:forParticipantId:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSession(Messaging) handleDeviceStateMessage:forParticipantId:].cold.1();
  }
}

- (void)handleNetworkCapabilityMessage:(id)a3 forParticipantId:(id)a4
{
  VCSession *v6;
  void *v7;
  int ErrorLogLevelForModule;
  char *v9;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  VCSession *v14;
  char *__lasts;
  char *__str;
  _QWORD v17[3];
  _QWORD v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v6 = self;
  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  if (a3)
  {
    v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](v6->_remoteParticipantsMapByServerID, "objectForKeyedSubscript:", a4);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v7)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        __str = 0;
        asprintf(&__str, "%s", (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
        if (__str)
        {
          v14 = v6;
          __lasts = 0;
          v9 = strtok_r(__str, "\n", &__lasts);
          v10 = (os_log_t *)MEMORY[0x1E0CF2758];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v11 = VRTraceErrorLogLevelToCSTR();
              v12 = *v10;
              if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                v20 = v11;
                v21 = 2080;
                v22 = "-[VCSession(Messaging) handleNetworkCapabilityMessage:forParticipantId:]";
                v23 = 1024;
                v24 = 503;
                v25 = 2080;
                v26 = "Received State Update:";
                v27 = 2080;
                v28 = v9;
                _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            v9 = strtok_r(0, "\n", &__lasts);
          }
          while (v9);
          free(__str);
          v6 = v14;
        }
      }
      if (objc_msgSend(v7, "uuid")
        && objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RCEV"))
        && objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RCEG")))
      {
        v17[0] = CFSTR("VCSPUUID");
        v18[0] = objc_msgSend(v7, "uuid");
        v17[1] = CFSTR("RCEV");
        v18[1] = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RCEV"));
        v17[2] = CFSTR("RCEG");
        v18[2] = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RCEG"));
        v13 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3), "mutableCopy");
        if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SBVERS")))
          objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SBVERS")), CFSTR("SBVERS"));
        if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RULRTX")))
          objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RULRTX")), CFSTR("RULRTX"));
        if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RTLE")))
          objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RTLE")), CFSTR("RTLE"));
        if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MQSchP")))
          objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("MQSchP")), CFSTR("MQSchP"));
        -[VCObject reportingAgent](v6, "reportingAgent");
        reportingGenericEvent();
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSession(Messaging) handleNetworkCapabilityMessage:forParticipantId:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSession(Messaging) handleNetworkCapabilityMessage:forParticipantId:].cold.1();
  }
}

- (void)setupNetworkCapabilityMessage
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__VCSession_Messaging__setupNetworkCapabilityMessage__block_invoke;
  v5[3] = &unk_1E9E58538;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCSessionMessageTopicRateControlConfig"), 0, 0, 0, v5);
}

void __53__VCSession_Messaging__setupNetworkCapabilityMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(*(id *)(a1 + 32), "strong");
  v7 = *(NSObject **)(v6 + 176);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__VCSession_Messaging__setupNetworkCapabilityMessage__block_invoke_2;
  v8[3] = &unk_1E9E527D0;
  v8[4] = v6;
  v8[5] = a2;
  v8[6] = a4;
  dispatch_async(v7, v8);
}

uint64_t __53__VCSession_Messaging__setupNetworkCapabilityMessage__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNetworkCapabilityMessage:forParticipantId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)dispatchedRemoteCellTechStateUpdate:(id)a3 maxRemoteBitrate:(id)a4
{
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

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316162;
      v10 = v7;
      v11 = 2080;
      v12 = "-[VCSession(Messaging) dispatchedRemoteCellTechStateUpdate:maxRemoteBitrate:]";
      v13 = 1024;
      v14 = 546;
      v15 = 1024;
      v16 = objc_msgSend(a3, "intValue");
      v17 = 1024;
      v18 = objc_msgSend(a4, "unsignedIntValue");
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession received message about CellTech change :%d, remote bitrate %u", (uint8_t *)&v9, 0x28u);
    }
  }
  -[VCSession remoteCellTechStateUpdate:maxRemoteBitrate:](self, "remoteCellTechStateUpdate:maxRemoteBitrate:", objc_msgSend(a3, "intValue"), objc_msgSend(a4, "unsignedIntValue"));
}

- (void)remoteCellTechStateUpdate:(int)a3 maxRemoteBitrate:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  if (a3 && a3 < 10)
  {
    v7 = CelltechToStr();
    v8 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self), "strong");
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "transportSession"), "connectionManager"), "updateCellularTech:forLocalInterface:", v4, 0);
    objc_msgSend(v8, "configureOneToOneRateController:", self->_currentActiveConnection);
    if ((objc_msgSend(v8, "isOneToOneUsingVideo") & 1) != 0 || objc_msgSend(v8, "isOneToOneUsingScreen"))
      v9 = -[VCConnectionProtocol uplinkBitrateCapOneToOne](self->_currentActiveConnection, "uplinkBitrateCapOneToOne");
    else
      v9 = -[VCConnectionProtocol uplinkAudioBitrateCapOneToOne](self->_currentActiveConnection, "uplinkAudioBitrateCapOneToOne");
    v10 = v9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316418;
        v14 = v11;
        v15 = 2080;
        v16 = "-[VCSession(Messaging) remoteCellTechStateUpdate:maxRemoteBitrate:]";
        v17 = 1024;
        v18 = 568;
        v19 = 2080;
        v20 = v7;
        v21 = 1024;
        v22 = v10;
        v23 = 1024;
        v24 = a4;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSession: Remote CellTech has changed %s, max bitrate %u, max remote bitrate %u", (uint8_t *)&v13, 0x32u);
      }
    }
    -[VCSessionParticipantLocal handleActiveConnectionChange:](self->_localParticipant, "handleActiveConnectionChange:", self->_currentActiveConnection);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSession(Messaging) remoteCellTechStateUpdate:maxRemoteBitrate:].cold.1();
  }
}

- (void)setupCellTechChangeMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke;
  v5[3] = &unk_1E9E58538;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCCellTechChangeTopic"), 0, 1, 0, v5);
}

void __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[6];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v12 = v6;
    v13 = 2080;
    v14 = "-[VCSession(Messaging) setupCellTechChangeMessages]_block_invoke";
    v15 = 1024;
    v16 = 581;
    v8 = " [%s] %s:%d Cell tech message is nil ";
LABEL_12:
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0x1Cu);
    return;
  }
  if (!objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("VCCellTechKey")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return;
    v9 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v12 = v9;
    v13 = 2080;
    v14 = "-[VCSession(Messaging) setupCellTechChangeMessages]_block_invoke";
    v15 = 1024;
    v16 = 582;
    v8 = " [%s] %s:%d Cell tech is nil";
    goto LABEL_12;
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (v4)
  {
    v5 = *(NSObject **)(v4 + 176);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke_151;
    v10[3] = &unk_1E9E52238;
    v10[4] = v4;
    v10[5] = a2;
    dispatch_async(v5, v10);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke_cold_1();
  }
}

uint64_t __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke_151(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedRemoteCellTechStateUpdate:maxRemoteBitrate:", objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("VCCellTechKey")), objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("VCMaxBitrateKey")));
}

- (void)setupLinkConstrainsChangedMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__VCSession_Messaging__setupLinkConstrainsChangedMessages__block_invoke;
  v5[3] = &unk_1E9E58538;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCSessionMessageTopicLinkConstrainesChanged"), 0, 1, 0, v5);
}

void *__58__VCSession_Messaging__setupLinkConstrainsChangedMessages__block_invoke(uint64_t a1, uint64_t a2)
{
  void *result;
  void *v4;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (a2)
  {
    v4 = result;
    objc_msgSend(result, "applyRemoteLinkConstrains:", a2);
    return (void *)objc_msgSend(v4, "configureOneToOneRateController:", objc_msgSend(v4, "currentActiveConnection"));
  }
  return result;
}

- (void)setupReactionMessages
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  uint64_t v5;
  VCSessionMessaging *v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__VCSession_Messaging__setupReactionMessages__block_invoke;
  v8[3] = &unk_1E9E58538;
  v8[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCSessionMessageTopicReaction"), 0, 1, 0, v8);
  v6 = self->_sessionMessaging;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __45__VCSession_Messaging__setupReactionMessages__block_invoke_163;
  v7[3] = &unk_1E9E58538;
  v7[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](v6, "addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCSessionMessageReactionStateTopic"), 0, 1, 0, v7);
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "strong");
    v7 = *(NSObject **)(v6 + 176);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__VCSession_Messaging__setupReactionMessages__block_invoke_158;
    v8[3] = &unk_1E9E527D0;
    v8[4] = v6;
    v8[5] = a4;
    v8[6] = a2;
    dispatch_async(v7, v8);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __45__VCSession_Messaging__setupReactionMessages__block_invoke_cold_1();
  }
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_158(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    objc_msgSend(v2, "reactionDidStart:", objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("VCReactionStartedType")));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __45__VCSession_Messaging__setupReactionMessages__block_invoke_158_cold_1();
  }
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_163(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "strong");
    if (v6)
    {
      v7 = *(NSObject **)(v6 + 176);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__VCSession_Messaging__setupReactionMessages__block_invoke_164;
      block[3] = &unk_1E9E527D0;
      block[4] = v6;
      block[5] = a4;
      block[6] = a2;
      dispatch_async(v7, block);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCSession(Messaging) setupReactionMessages]_block_invoke";
        v15 = 1024;
        v16 = 642;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d strongSelf is nil", buf, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __45__VCSession_Messaging__setupReactionMessages__block_invoke_163_cold_1();
  }
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_164(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
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
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "remoteParticipantsMapByServerID"), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("VCSessionMessageReactionStarted"));
    v5 = *(void **)(a1 + 48);
    if (v4)
    {
      v6 = objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VCSessionMessageReactionStarted"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "reactionDidStart:", v6);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __45__VCSession_Messaging__setupReactionMessages__block_invoke_164_cold_2();
      }
    }
    else if (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VCSessionMessageReactionStopped")))
    {
      objc_msgSend(v3, "didStopReacting");
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 48);
        v10 = 136315906;
        v11 = v7;
        v12 = 2080;
        v13 = "-[VCSession(Messaging) setupReactionMessages]_block_invoke";
        v14 = 1024;
        v15 = 663;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unsupported reaction state %@", (uint8_t *)&v10, 0x26u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __45__VCSession_Messaging__setupReactionMessages__block_invoke_164_cold_1();
  }
}

+ (id)mediaStateMessageStreamGroupKeysForMediaType:(unsigned int)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id result;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  switch(a3)
  {
    case 0u:
      v3 = (void *)MEMORY[0x1E0C99E60];
      v4 = objc_msgSend(&unk_1E9EF6D58, "stringValue");
      v5 = &unk_1E9EF6D70;
      goto LABEL_13;
    case 1u:
      v3 = (void *)MEMORY[0x1E0C99E60];
      v4 = objc_msgSend(&unk_1E9EF6D88, "stringValue");
      v5 = &unk_1E9EF6DA0;
      goto LABEL_13;
    case 2u:
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = &unk_1E9EF6DB8;
      return (id)objc_msgSend(v7, "setWithObject:", objc_msgSend(v8, "stringValue"));
    case 3u:
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = &unk_1E9EF6DD0;
      return (id)objc_msgSend(v7, "setWithObject:", objc_msgSend(v8, "stringValue"));
    case 4u:
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = &unk_1E9EF6DE8;
      return (id)objc_msgSend(v7, "setWithObject:", objc_msgSend(v8, "stringValue"));
    case 5u:
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = &unk_1E9EF6E00;
      return (id)objc_msgSend(v7, "setWithObject:", objc_msgSend(v8, "stringValue"));
    case 6u:
      v3 = (void *)MEMORY[0x1E0C99E60];
      v9 = &unk_1E9EF6E18;
      goto LABEL_12;
    case 7u:
      v3 = (void *)MEMORY[0x1E0C99E60];
      v9 = &unk_1E9EF6E48;
LABEL_12:
      v4 = objc_msgSend(v9, "stringValue");
      v5 = &unk_1E9EF6E30;
LABEL_13:
      result = (id)objc_msgSend(v3, "setWithObjects:", v4, objc_msgSend(v5, "stringValue"), 0);
      break;
    case 8u:
      result = (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_msgSend(&unk_1E9EF6E30, "stringValue"), 0, v10);
      break;
    default:
      result = (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
      break;
  }
  return result;
}

+ (id)mediaStateMessageKeyForMediaType:(unsigned int)a3
{
  if (a3 > 8)
    return 0;
  else
    return (id)objc_msgSend(off_1E9E58580[a3], "stringValue");
}

+ (unsigned)mediaTypeForMediaStateMessageKey:(id)a3
{
  int v3;
  unsigned int result;

  v3 = objc_msgSend(a3, "unsignedIntValue");
  result = 0;
  switch(v3)
  {
    case 1:
    case 5:
LABEL_5:
      result = 1;
      break;
    case 2:
    case 6:
      return result;
    case 3:
LABEL_7:
      result = 2;
      break;
    case 4:
LABEL_8:
      result = 3;
      break;
    case 7:
LABEL_9:
      result = 4;
      break;
    case 8:
LABEL_10:
      result = 5;
      break;
    case 9:
    case 10:
LABEL_6:
      result = -2;
      break;
    case 11:
LABEL_11:
      result = 7;
      break;
    default:
      switch(v3)
      {
        case 128:
          goto LABEL_5;
        case 129:
          return result;
        case 130:
          goto LABEL_7;
        case 131:
          goto LABEL_8;
        case 132:
          goto LABEL_9;
        case 133:
          goto LABEL_10;
        case 134:
          result = 6;
          break;
        case 135:
          goto LABEL_11;
        case 136:
          result = 8;
          break;
        case 140:
          goto LABEL_6;
        default:
          result = -1;
          break;
      }
      break;
  }
  return result;
}

+ (id)mediaStateMessageValueForMediaState:(unsigned int)a3
{
  if (a3 > 2)
    return 0;
  else
    return (id)qword_1E9E585C8[a3];
}

+ (unsigned)mediaStateForMediaStateMessageValue:(id)a3
{
  unsigned int result;

  result = objc_msgSend(a3, "unsignedIntValue");
  if (result >= 3)
    return -1;
  return result;
}

- (void)updateStateMessage:(id)a3 stateState:(unsigned int)a4 streamGroupKey:(id)a5
{
  uint64_t v6;
  void *v8;
  int v9;

  v6 = *(_QWORD *)&a4;
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", a5);
  if (!v8 || (v9 = objc_msgSend(v8, "unsignedIntValue")) == 0 || v9 == 2 && (_DWORD)v6 == 1)
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6), a5);
}

- (id)stateMessageWithSupportsNestedDictionary:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  __CFString *v18;
  __CFString *v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  __CFString *v26;
  __CFString *v27;
  NSObject *v28;
  const char *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  __CFString *v33;
  __CFString *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  __CFString *v38;
  __CFString *v39;
  uint64_t v40;
  NSObject *v41;
  __CFString *v42;
  __CFString *v43;
  uint64_t v44;
  NSObject *v45;
  __CFString *v46;
  __CFString *v47;
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  __CFString *v62;
  __int16 v63;
  VCSession *v64;
  __int16 v65;
  __CFString *v66;
  __int16 v67;
  __CFString *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = 0;
  do
  {
    v6 = -[VCSessionParticipantLocal mediaStateForMediaType:](self->_localParticipant, "mediaStateForMediaType:", v5);
    v7 = +[VCSession mediaStateMessageValueForMediaState:](VCSession, "mediaStateMessageValueForMediaState:", v6);
    if (v7)
    {
      v8 = v7;
      v9 = +[VCSession mediaStateMessageKeyForMediaType:](VCSession, "mediaStateMessageKeyForMediaType:", v5);
      if (v9)
      {
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v9);
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v10 = +[VCSession mediaStateMessageStreamGroupKeysForMediaType:](VCSession, "mediaStateMessageStreamGroupKeysForMediaType:", v5);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v52;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v52 != v13)
                objc_enumerationMutation(v10);
              -[VCSession updateStateMessage:stateState:streamGroupKey:](self, "updateStateMessage:stateState:streamGroupKey:", v4, v6, *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i));
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
          }
          while (v12);
        }
        if ((VCSession *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v36 = VRTraceErrorLogLevelToCSTR();
            v37 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v38 = VCSessionMediaType_Name(v5);
              v39 = VCSessionMediaState_Name(v6);
              *(_DWORD *)buf = 136316162;
              v56 = v36;
              v57 = 2080;
              v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
              v59 = 1024;
              v60 = 826;
              v61 = 2112;
              v62 = v38;
              v63 = 2112;
              v64 = (VCSession *)v39;
              v20 = v37;
              v21 = " [%s] %s:%d Sending State Update: mediaType=%@ mediaState=%@";
              v22 = 48;
              goto LABEL_33;
            }
          }
        }
        else
        {
          v15 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v15 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v16 = VRTraceErrorLogLevelToCSTR();
            v17 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v18 = VCSessionMediaType_Name(v5);
              v19 = VCSessionMediaState_Name(v6);
              *(_DWORD *)buf = 136316674;
              v56 = v16;
              v57 = 2080;
              v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
              v59 = 1024;
              v60 = 826;
              v61 = 2112;
              v62 = (__CFString *)v15;
              v63 = 2048;
              v64 = self;
              v65 = 2112;
              v66 = v18;
              v67 = 2112;
              v68 = v19;
              v20 = v17;
              v21 = " [%s] %s:%d %@(%p) Sending State Update: mediaType=%@ mediaState=%@";
              v22 = 68;
LABEL_33:
              _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
            }
          }
        }
      }
      else if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v44 = VRTraceErrorLogLevelToCSTR();
          v45 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v46 = VCSessionMediaType_Name(v5);
            v47 = VCSessionMediaState_Name(v6);
            *(_DWORD *)buf = 136316162;
            v56 = v44;
            v57 = 2080;
            v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
            v59 = 1024;
            v60 = 817;
            v61 = 2112;
            v62 = v46;
            v63 = 2112;
            v64 = (VCSession *)v47;
            v28 = v45;
            v29 = " [%s] %s:%d Sending State Update: Failed to add message entry for mediaType=%@ mediaState=%@. Key is nil.";
            goto LABEL_40;
          }
        }
      }
      else
      {
        v30 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v30 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v31 = VRTraceErrorLogLevelToCSTR();
          v32 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v33 = VCSessionMediaType_Name(v5);
            v34 = VCSessionMediaState_Name(v6);
            *(_DWORD *)buf = 136316674;
            v56 = v31;
            v57 = 2080;
            v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
            v59 = 1024;
            v60 = 817;
            v61 = 2112;
            v62 = (__CFString *)v30;
            v63 = 2048;
            v64 = self;
            v65 = 2112;
            v66 = v33;
            v67 = 2112;
            v68 = v34;
            v28 = v32;
            v29 = " [%s] %s:%d %@(%p) Sending State Update: Failed to add message entry for mediaType=%@ mediaState=%@. Key is nil.";
LABEL_29:
            v35 = 68;
LABEL_41:
            _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, v29, buf, v35);
          }
        }
      }
    }
    else if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v40 = VRTraceErrorLogLevelToCSTR();
        v41 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v42 = VCSessionMediaType_Name(v5);
          v43 = VCSessionMediaState_Name(v6);
          *(_DWORD *)buf = 136316162;
          v56 = v40;
          v57 = 2080;
          v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
          v59 = 1024;
          v60 = 812;
          v61 = 2112;
          v62 = v42;
          v63 = 2112;
          v64 = (VCSession *)v43;
          v28 = v41;
          v29 = " [%s] %s:%d Sending State Update: Failed to add message entry for mediaType=%@ mediaState=%@. Value is nil.";
LABEL_40:
          v35 = 48;
          goto LABEL_41;
        }
      }
    }
    else
    {
      v23 = &stru_1E9E58EE0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v26 = VCSessionMediaType_Name(v5);
          v27 = VCSessionMediaState_Name(v6);
          *(_DWORD *)buf = 136316674;
          v56 = v24;
          v57 = 2080;
          v58 = "-[VCSession(Messaging) stateMessageWithSupportsNestedDictionary:]";
          v59 = 1024;
          v60 = 812;
          v61 = 2112;
          v62 = (__CFString *)v23;
          v63 = 2048;
          v64 = self;
          v65 = 2112;
          v66 = v26;
          v67 = 2112;
          v68 = v27;
          v28 = v25;
          v29 = " [%s] %s:%d %@(%p) Sending State Update: Failed to add message entry for mediaType=%@ mediaState=%@. Value is nil.";
          goto LABEL_29;
        }
      }
    }
    v5 = (v5 + 1);
  }
  while ((_DWORD)v5 != 9);
  if (a3)
    -[VCSession appendMediaTypeMixingListToMessageDictionary:](self, "appendMediaTypeMixingListToMessageDictionary:", v4);
  return v4;
}

- (void)appendMediaTypeMixingListToMessageDictionary:(id)a3
{
  __CFString *v5;
  NSDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCSession *v28;
  __int16 v29;
  __CFString *v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = -[VCSessionParticipant mediaTypeMixingList](self->_localParticipant, "mediaTypeMixingList");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        -[__CFString setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", -[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i)), objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "stringValue"));
      }
      v8 = -[NSDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    }
    while (v8);
  }
  if (-[__CFString count](v5, "count"))
  {
    objc_msgSend(a3, "setObject:forKeyedSubscript:", v5, objc_msgSend(&unk_1E9EF6F50, "stringValue"));
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v19 = 136315906;
          v20 = v12;
          v21 = 2080;
          v22 = "-[VCSession(Messaging) appendMediaTypeMixingListToMessageDictionary:]";
          v23 = 1024;
          v24 = 843;
          v25 = 2112;
          v26 = v5;
          v14 = " [%s] %s:%d Sending State Update: appending mediaTypeMixingList=%@";
          v15 = v13;
          v16 = 38;
LABEL_19:
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, v16);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v19 = 136316418;
          v20 = v17;
          v21 = 2080;
          v22 = "-[VCSession(Messaging) appendMediaTypeMixingListToMessageDictionary:]";
          v23 = 1024;
          v24 = 843;
          v25 = 2112;
          v26 = v11;
          v27 = 2048;
          v28 = self;
          v29 = 2112;
          v30 = v5;
          v14 = " [%s] %s:%d %@(%p) Sending State Update: appending mediaTypeMixingList=%@";
          v15 = v18;
          v16 = 58;
          goto LABEL_19;
        }
      }
    }
  }
}

- (void)broadcastMediaStateUpdateMessage
{
  VCSession *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  VCSessionMessaging *sessionMessaging;
  uint64_t v24;
  VCSessionMessaging *v25;
  VCSession *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSArray *obj;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  char *v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v2 = self;
  v48 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_sessionQueue);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = -[VCSession remoteParticipants](v2, "remoteParticipants");
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v45;
    v26 = v2;
    v28 = *(_QWORD *)v45;
    do
    {
      v8 = 0;
      v29 = v4;
      do
      {
        if (*(_QWORD *)v45 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v8);
        objc_msgSend(v9, "capabilities");
        if (v10 == 2)
        {
          objc_msgSend(v9, "capabilities");
          v12 = v11;
          if ((v11 & 0x1000000000000) == 0 || v6)
          {
            if ((v11 & 0x1000000000000) == 0 && !v5)
            {
              v5 = -[VCSession stateMessageWithSupportsNestedDictionary:](v2, "stateMessageWithSupportsNestedDictionary:", 0);
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                __str = 0;
                if (v5)
                  v14 = (const char *)objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
                else
                  v14 = "<nil>";
                asprintf(&__str, "%s", v14);
                if (__str)
                {
                  v27 = v5;
                  __lasts = 0;
                  v18 = strtok_r(__str, "\n", &__lasts);
                  do
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      v19 = VRTraceErrorLogLevelToCSTR();
                      v20 = *MEMORY[0x1E0CF2758];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 136316162;
                        v34 = v19;
                        v35 = 2080;
                        v36 = "-[VCSession(Messaging) broadcastMediaStateUpdateMessage]";
                        v37 = 1024;
                        v38 = 862;
                        v39 = 2080;
                        v40 = "Sending State Update:";
                        v41 = 2080;
                        v42 = v18;
                        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                      }
                    }
                    v18 = strtok_r(0, "\n", &__lasts);
                  }
                  while (v18);
LABEL_32:
                  free(__str);
                  v5 = v27;
                }
LABEL_33:
                v2 = v26;
              }
            }
          }
          else
          {
            v6 = -[VCSession stateMessageWithSupportsNestedDictionary:](v2, "stateMessageWithSupportsNestedDictionary:", 1);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              __str = 0;
              if (v6)
                v13 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
              else
                v13 = "<nil>";
              asprintf(&__str, "%s", v13);
              if (__str)
              {
                v27 = v5;
                __lasts = 0;
                v15 = strtok_r(__str, "\n", &__lasts);
                do
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v16 = VRTraceErrorLogLevelToCSTR();
                    v17 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136316162;
                      v34 = v16;
                      v35 = 2080;
                      v36 = "-[VCSession(Messaging) broadcastMediaStateUpdateMessage]";
                      v37 = 1024;
                      v38 = 859;
                      v39 = 2080;
                      v40 = "Sending State Update:";
                      v41 = 2080;
                      v42 = v15;
                      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                    }
                  }
                  v15 = strtok_r(0, "\n", &__lasts);
                }
                while (v15);
                goto LABEL_32;
              }
              goto LABEL_33;
            }
          }
          if ((v12 & 0x1000000000000) != 0)
            v21 = v6;
          else
            v21 = v5;
          v22 = v5;
          sessionMessaging = v2->_sessionMessaging;
          v24 = objc_msgSend(v9, "idsParticipantID");
          v25 = sessionMessaging;
          v5 = v22;
          -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](v25, "sendMessageDictionary:withTopic:participantID:", v21, CFSTR("VCSessionMessageTopicStreamGroupsState"), v24);
          v7 = v28;
          v4 = v29;
        }
        ++v8;
      }
      while (v8 != v4);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
    }
    while (v4);
  }
}

- (void)sendMediaStateUpdateMessageToRemoteParticipant:(id)a3
{
  unint64_t v5;

  objc_msgSend(a3, "capabilities");
  -[VCSessionMessaging sendMessageDictionary:withTopic:participantID:](self->_sessionMessaging, "sendMessageDictionary:withTopic:participantID:", -[VCSession stateMessageWithSupportsNestedDictionary:](self, "stateMessageWithSupportsNestedDictionary:", HIWORD(v5) & 1), CFSTR("VCSessionMessageTopicStreamGroupsState"), objc_msgSend(a3, "idsParticipantID"));
}

- (BOOL)validateStreamGroup:(id)a3 state:(id)a4
{
  BOOL v5;
  BOOL v6;

  if (!a3)
  {
    v5 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v5 && v6;
  }
  v5 = objc_msgSend(a3, "unsignedIntValue") != 0;
  if (!a4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a4, "unsignedIntValue");
  v6 = objc_msgSend(a4, "unsignedIntValue") < 3;
  return v5 && v6;
}

- (void)setupMediaStateUpdateMessage
{
  uint64_t v3;
  VCSessionMessaging *sessionMessaging;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  sessionMessaging = self->_sessionMessaging;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__VCSession_Messaging__setupMediaStateUpdateMessage__block_invoke;
  v5[3] = &unk_1E9E58538;
  v5[4] = v3;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:](sessionMessaging, "addTopic:associatedStrings:allowConcurrent:sendMessageDictionaryCompletionHandler:receiveMessageDictionaryHandler:", CFSTR("VCSessionMessageTopicStreamGroupsState"), 0, 0, 0, v5);
}

uint64_t __52__VCSession_Messaging__setupMediaStateUpdateMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "processMediaStateMessage:remoteParticipantID:", a2, a4);
}

- (void)processStreamGroupStateMessageKey:(id)a3 value:(id)a4 mediaTypeStates:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  NSObject *v34;
  const __CFString *v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  __int16 v44;
  VCSession *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = +[VCSession mediaTypeForMediaStateMessageKey:](VCSession, "mediaTypeForMediaStateMessageKey:");
  if ((_DWORD)v9 != -1)
  {
    v10 = v9;
    v11 = VCSessionMediaType_Name(v9);
    v12 = +[VCSession mediaStateForMediaStateMessageValue:](VCSession, "mediaStateForMediaStateMessageValue:", a4);
    if ((_DWORD)v10 == -2)
      return;
    v13 = v12;
    v14 = VCSessionMediaState_Name(v12);
    v15 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10));
    if (!v15)
      goto LABEL_22;
    v16 = objc_msgSend(v15, "unsignedIntValue");
    if ((_DWORD)v16 == (_DWORD)v13)
      goto LABEL_22;
    v17 = v16;
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5
        || (v18 = VRTraceErrorLogLevelToCSTR(),
            v19 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_16:
        if ((_DWORD)v17 == 1 || (_DWORD)v13 == 1)
          v13 = 1;
        else
          v13 = v13;
LABEL_22:
        v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
        objc_msgSend(a5, "setObject:forKeyedSubscript:", v26, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10));
        return;
      }
      *(_DWORD *)buf = 136316418;
      v37 = v18;
      v38 = 2080;
      v39 = "-[VCSession(Messaging) processStreamGroupStateMessageKey:value:mediaTypeStates:]";
      v40 = 1024;
      v41 = 910;
      v42 = 2112;
      v43 = v11;
      v44 = 2112;
      v45 = (VCSession *)v14;
      v46 = 2112;
      v47 = VCSessionMediaState_Name(v17);
      v20 = " [%s] %s:%d Media states for mediaType=%@ are mismatched state=%@ != state=%@";
      v21 = v19;
      v22 = 58;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v35 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v35 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_16;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      *(_DWORD *)buf = 136316930;
      v37 = v23;
      v38 = 2080;
      v39 = "-[VCSession(Messaging) processStreamGroupStateMessageKey:value:mediaTypeStates:]";
      v40 = 1024;
      v41 = 910;
      v42 = 2112;
      v43 = (id)v35;
      v44 = 2048;
      v45 = self;
      v46 = 2112;
      v47 = v11;
      v48 = 2112;
      v49 = v14;
      v50 = 2112;
      v51 = VCSessionMediaState_Name(v17);
      v20 = " [%s] %s:%d %@(%p) Media states for mediaType=%@ are mismatched state=%@ != state=%@";
      v21 = v24;
      v22 = 78;
    }
    _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
    goto LABEL_16;
  }
  if ((VCSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v37 = v28;
        v38 = 2080;
        v39 = "-[VCSession(Messaging) processStreamGroupStateMessageKey:value:mediaTypeStates:]";
        v40 = 1024;
        v41 = 897;
        v42 = 2112;
        v43 = a3;
        v30 = " [%s] %s:%d Found unsupported key=%@";
        v31 = v29;
        v32 = 38;
LABEL_34:
        _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v37 = v33;
        v38 = 2080;
        v39 = "-[VCSession(Messaging) processStreamGroupStateMessageKey:value:mediaTypeStates:]";
        v40 = 1024;
        v41 = 897;
        v42 = 2112;
        v43 = (id)v27;
        v44 = 2048;
        v45 = self;
        v46 = 2112;
        v47 = a3;
        v30 = " [%s] %s:%d %@(%p) Found unsupported key=%@";
        v31 = v34;
        v32 = 58;
        goto LABEL_34;
      }
    }
  }
}

- (void)processMediaTypeStatesWithMessage:(id)a3 mediaTypeStates:(id)a4
{
  __int128 v4;
  uint64_t v8;
  const char *v9;
  os_log_t *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  os_log_t v17;
  const char *v18;
  id v19;
  id v20;
  __CFString *v21;
  __CFString *v22;
  NSObject *v23;
  const char *v24;
  uint32_t v25;
  const __CFString *v26;
  uint64_t v27;
  os_log_t v28;
  __CFString *v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  uint64_t v33;
  os_log_t v34;
  __CFString *v35;
  __CFString *v36;
  uint64_t v37;
  os_log_t v38;
  __CFString *v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  VCSession *v50;
  __int16 v51;
  __CFString *v52;
  __int16 v53;
  __CFString *v54;
  uint64_t v55;

  v8 = 0;
  v55 = *MEMORY[0x1E0C80C00];
  v9 = "";
  v10 = (os_log_t *)MEMORY[0x1E0CF2758];
  *(_QWORD *)&v4 = 136315906;
  v40 = v4;
  do
  {
    v11 = +[VCSession mediaStateMessageKeyForMediaType:](VCSession, "mediaStateMessageKeyForMediaType:", v8, v40);
    if (v11)
    {
      v12 = objc_msgSend(a3, "objectForKeyedSubscript:", v11);
      if (!v12)
        goto LABEL_22;
      v13 = +[VCSession mediaStateForMediaStateMessageValue:](VCSession, "mediaStateForMediaStateMessageValue:", v12);
      v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
      objc_msgSend(a4, "setObject:forKeyedSubscript:", v14, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
      if ((VCSession *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v33 = VRTraceErrorLogLevelToCSTR();
          v34 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            v35 = VCSessionMediaType_Name(v8);
            v36 = VCSessionMediaState_Name(v13);
            *(_DWORD *)buf = 136316162;
            v42 = v33;
            v43 = 2080;
            v44 = "-[VCSession(Messaging) processMediaTypeStatesWithMessage:mediaTypeStates:]";
            v45 = 1024;
            v46 = 935;
            v47 = 2112;
            v48 = v35;
            v49 = 2112;
            v50 = (VCSession *)v36;
            v23 = v34;
            v24 = " [%s] %s:%d Received State Update: mediaType=%@ mediaState=%@";
            v25 = 48;
            goto LABEL_19;
          }
        }
      }
      else
      {
        v15 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v15 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            v18 = v9;
            v19 = a3;
            v20 = a4;
            v21 = VCSessionMediaType_Name(v8);
            v22 = VCSessionMediaState_Name(v13);
            *(_DWORD *)buf = 136316674;
            v42 = v16;
            v43 = 2080;
            v44 = "-[VCSession(Messaging) processMediaTypeStatesWithMessage:mediaTypeStates:]";
            v45 = 1024;
            v46 = 935;
            v47 = 2112;
            v48 = (__CFString *)v15;
            v49 = 2048;
            v50 = self;
            v51 = 2112;
            v52 = v21;
            a4 = v20;
            a3 = v19;
            v9 = v18;
            v10 = (os_log_t *)MEMORY[0x1E0CF2758];
            v53 = 2112;
            v54 = v22;
            v23 = v17;
            v24 = " [%s] %s:%d %@(%p) Received State Update: mediaType=%@ mediaState=%@";
            v25 = 68;
LABEL_19:
            _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v25);
          }
        }
      }
    }
    else if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        {
          v39 = VCSessionMediaType_Name(v8);
          *(_DWORD *)buf = v40;
          v42 = v37;
          v43 = 2080;
          v44 = "-[VCSession(Messaging) processMediaTypeStatesWithMessage:mediaTypeStates:]";
          v45 = 1024;
          v46 = 925;
          v47 = 2112;
          v48 = v39;
          v30 = v38;
          v31 = " [%s] %s:%d Receive State Update: Failed to find message entry key for mediaType=%@";
          v32 = 38;
          goto LABEL_25;
        }
      }
    }
    else
    {
      v26 = &stru_1E9E58EE0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v26 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        {
          v29 = VCSessionMediaType_Name(v8);
          *(_DWORD *)buf = 136316418;
          v42 = v27;
          v43 = 2080;
          v44 = "-[VCSession(Messaging) processMediaTypeStatesWithMessage:mediaTypeStates:]";
          v45 = 1024;
          v46 = 925;
          v47 = 2112;
          v48 = (__CFString *)v26;
          v49 = 2048;
          v50 = self;
          v51 = 2112;
          v52 = v29;
          v30 = v28;
          v31 = " [%s] %s:%d %@(%p) Receive State Update: Failed to find message entry key for mediaType=%@";
          v32 = 58;
LABEL_25:
          _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, v31, buf, v32);
        }
      }
    }
LABEL_22:
    v8 = (v8 + 1);
  }
  while ((_DWORD)v8 != 9);
}

- (void)processMediaStateMessage:(id)a3 remoteParticipantID:(id)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  NSObject *v27;
  const char *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  unsigned int transportSessionID;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  void *v46;
  uint64_t v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  _BYTE v55[24];
  __int16 v56;
  id v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  __CFString *v61;
  __int16 v62;
  __CFString *v63;
  _BYTE v64[128];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteParticipantsMapByServerID, "objectForKeyedSubscript:", a4);
  if (!a3)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:].cold.1();
      }
      return;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v36 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v36 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v38 = VRTraceErrorLogLevelToCSTR();
    v39 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136316162;
    v49 = v38;
    v50 = 2080;
    v51 = "-[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:]";
    v52 = 1024;
    v53 = 942;
    v54 = 2112;
    *(_QWORD *)v55 = v36;
    *(_WORD *)&v55[8] = 2048;
    *(_QWORD *)&v55[10] = self;
    v40 = " [%s] %s:%d %@(%p) mediaStateMessage is nil";
LABEL_50:
    _os_log_error_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_ERROR, v40, buf, 0x30u);
    return;
  }
  if (!v6)
  {
    if ((VCSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:].cold.2();
      }
      return;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v37 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v37 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v41 = VRTraceErrorLogLevelToCSTR();
    v39 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136316162;
    v49 = v41;
    v50 = 2080;
    v51 = "-[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:]";
    v52 = 1024;
    v53 = 943;
    v54 = 2112;
    *(_QWORD *)v55 = v37;
    *(_WORD *)&v55[8] = 2048;
    *(_QWORD *)&v55[10] = self;
    v40 = " [%s] %s:%d %@(%p) Participant is nil";
    goto LABEL_50;
  }
  v46 = (void *)v6;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VCSession processMediaTypeStatesWithMessage:mediaTypeStates:](self, "processMediaTypeStatesWithMessage:mediaTypeStates:", a3, v7);
  if (!objc_msgSend(v7, "count"))
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v8 = (void *)objc_msgSend(a3, "allKeys");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v70, v69, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v71 != v11)
            objc_enumerationMutation(v8);
          -[VCSession processStreamGroupStateMessageKey:value:mediaTypeStates:](self, "processStreamGroupStateMessageKey:value:mediaTypeStates:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i), objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i)), v7);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v70, v69, 16);
      }
      while (v10);
    }
  }
  v42 = a3;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v13 = (void *)objc_msgSend(v7, "allKeys");
  v47 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v65, v64, 16);
  if (v47)
  {
    v14 = *(_QWORD *)v66;
    v43 = *(_QWORD *)v66;
    v44 = v7;
    do
    {
      for (j = 0; j != v47; ++j)
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(v13);
        v16 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
        v17 = objc_msgSend(v16, "unsignedIntValue");
        v18 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v16), "unsignedIntValue");
        if ((VCSession *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v30 = VRTraceErrorLogLevelToCSTR();
            v31 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              transportSessionID = self->_transportSessionID;
              v33 = objc_msgSend(v46, "uuid");
              v34 = VCSessionMediaType_Name(v17);
              v35 = VCSessionMediaState_Name(v18);
              *(_DWORD *)buf = 136316930;
              v49 = v30;
              v50 = 2080;
              v51 = "-[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:]";
              v52 = 1024;
              v53 = 961;
              v54 = 1024;
              *(_DWORD *)v55 = transportSessionID;
              v7 = v44;
              *(_WORD *)&v55[4] = 2112;
              *(_QWORD *)&v55[6] = a4;
              *(_WORD *)&v55[14] = 2112;
              *(_QWORD *)&v55[16] = v33;
              v56 = 2112;
              v57 = v34;
              v58 = 2112;
              v59 = (uint64_t)v35;
              v27 = v31;
              v28 = " [%s] %s:%d Received State Update: transportSessionID=%u participantId=%@ participantUUID=%@ mediaTy"
                    "pe=%@ mediaState=%@";
              v29 = 74;
              goto LABEL_25;
            }
          }
        }
        else
        {
          v19 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v19 = (const __CFString *)-[VCSession performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v20 = VRTraceErrorLogLevelToCSTR();
            v21 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v22 = v13;
              v23 = self->_transportSessionID;
              v24 = objc_msgSend(v46, "uuid");
              v25 = VCSessionMediaType_Name(v17);
              v26 = VCSessionMediaState_Name(v18);
              *(_DWORD *)buf = 136317442;
              v49 = v20;
              v50 = 2080;
              v51 = "-[VCSession(Messaging) processMediaStateMessage:remoteParticipantID:]";
              v52 = 1024;
              v53 = 961;
              v54 = 2112;
              *(_QWORD *)v55 = v19;
              *(_WORD *)&v55[8] = 2048;
              *(_QWORD *)&v55[10] = self;
              *(_WORD *)&v55[18] = 1024;
              *(_DWORD *)&v55[20] = v23;
              v13 = v22;
              v56 = 2112;
              v57 = a4;
              v58 = 2112;
              v59 = v24;
              v14 = v43;
              v7 = v44;
              v60 = 2112;
              v61 = v25;
              v62 = 2112;
              v63 = v26;
              v27 = v21;
              v28 = " [%s] %s:%d %@(%p) Received State Update: transportSessionID=%u participantId=%@ participantUUID=%@ "
                    "mediaType=%@ mediaState=%@";
              v29 = 94;
LABEL_25:
              _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, v29);
              continue;
            }
          }
        }
      }
      v47 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v65, v64, 16);
    }
    while (v47);
  }
  objc_msgSend(v46, "setRemoteMediaTypeStates:", v7);

  -[VCSession processMediaTypeMixingList:forRemoteParticipant:](self, "processMediaTypeMixingList:forRemoteParticipant:", objc_msgSend(v42, "objectForKeyedSubscript:", objc_msgSend(&unk_1E9EF6F50, "stringValue")), v46);
}

- (void)processMediaTypeMixingList:(id)a3 forRemoteParticipant:(id)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = 0;
  do
  {
    v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6), "stringValue");
    v8 = objc_msgSend(a3, "objectForKeyedSubscript:", v7);
    v9 = objc_msgSend(v7, "integerValue");
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v7;
    objc_msgSend(a4, "setMediaType:mixingWithMediaType:", v9, objc_msgSend(v10, "integerValue"));
    v6 = (v6 + 1);
  }
  while ((_DWORD)v6 != 9);
}

- (void)initWithIDSDestination:(uint64_t)a1 configurationDict:(NSObject *)a2 negotiationData:delegate:processId:isGKVoiceChat:.cold.1(uint64_t a1, NSObject *a2)
{
  __int16 v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(0, "UTF8String");
  v7 = 136315906;
  v8 = a1;
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_9();
  v9 = 189;
  v10 = v4;
  v11 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a2, v6, "VCSession [%s] %s:%d Unable to initialize the session. Destination=%s", (uint8_t *)&v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithIDSDestination:configurationDict:negotiationData:delegate:processId:isGKVoiceChat:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Unable to initialize the session's local participant!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setReportingConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d reportingConfig must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__VCSession_generateKeyFrameWithReceivedMessage_forParticipant___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d messageTuples is nil, can't proceed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)readAndSetABCSymptomsReportingThresholdsFromStorebags:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d reportingConfig is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Established initial connection '%@'");
  OUTLINED_FUNCTION_3();
}

void __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Removing current active connection '%@'");
  OUTLINED_FUNCTION_3();
}

void __44__VCSession_setTransportSessionEventHandler__block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Link constrains changed: '%@'");
  OUTLINED_FUNCTION_3();
}

- (void)handlePrimaryConnectionChanged:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Primary connection changed to '%@'");
  OUTLINED_FUNCTION_3();
}

void __84__VCSession_vcSessionParticipant_mediaStateDidChange_forMediaType_didSucceed_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a2 + 56);
  v3 = *(_DWORD *)(a2 + 60);
  v5 = *(_QWORD *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 48);
  v7 = 136316674;
  v8 = a1;
  v9 = 2080;
  v10 = "-[VCSession vcSessionParticipant:mediaStateDidChange:forMediaType:didSucceed:error:]_block_invoke";
  v11 = 1024;
  v12 = 1533;
  v13 = 1024;
  v14 = v3;
  v15 = 1024;
  v16 = v4;
  v17 = 2112;
  v18 = v5;
  v19 = 2112;
  v20 = v6;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d Error updating media state=%d for media type=%d, participant=%@, error=%@", (uint8_t *)&v7, 0x3Cu);
}

- (void)vcSessionParticipantDidMediaReceiveFlushRequestWithPayloads:.cold.1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCSession vcSessionParticipantDidMediaReceiveFlushRequestWithPayloads:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "VCSession [%s] %s:%d Flush baseband failed for payloads=%@", v1);
  OUTLINED_FUNCTION_3();
}

void __33__VCSession_applySpatialMetadata__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSession applySpatialMetadata]_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d [AVC SPATIAL AUDIO] Failed to apply the spatial metadata. result=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSession applySpatialMetadata]_block_invoke" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)sendDeviceStateMessageToParticipant:withStatus:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Diagnostics collection is off", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__VCSession_updateParticipantConfigurations___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d %@");
  OUTLINED_FUNCTION_3();
}

void __60__VCSession_setSessionInfoSynchronizerErrorResponseCallback__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d transportSessionIDS is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSpatialAudio
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSession setupSpatialAudio]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Failed to reserve channel for siri. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSession setupSpatialAudio]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)reserveAudioChannelForMediaType:spatialAudioSourceID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Failed to allocate spatial metadata entry. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)reserveAudioChannelForMediaType:spatialAudioSourceID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Failed to retrieve the channel index. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSession reserveAudioChannelForMediaType:spatialAudioSourceID:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)reserveAudioChannelForMediaType:spatialAudioSourceID:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Failed to allocate media type key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setMediaQueuePeakBitrateWithTargetBitrate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d No VCMediaQueue created!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d config must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d remoteParticipant must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Failed to create uplink encryption label holder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Failed to create downlink encryption label holder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Failed to create downlink security key holder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)composeControlChannelParticipantConfig:withRemoteParticipant:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Failed to create uplink security key holder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerRemoteParticipantToSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  const char *v6;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_9(v2, *MEMORY[0x1E0C80C00]);
  v4 = 136315906;
  v5 = v1;
  OUTLINED_FUNCTION_7_1();
  v6 = "-[VCSession registerRemoteParticipantToSession:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v3, "VCSession [%s] %s:%d Failed to add participant '%llu' to Control Channel list of active participants", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)registerRemoteParticipantToSession:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  const char *v6;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_9(v2, *MEMORY[0x1E0C80C00]);
  v4 = 136315906;
  v5 = v1;
  OUTLINED_FUNCTION_7_1();
  v6 = "-[VCSession registerRemoteParticipantToSession:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v3, "VCSession [%s] %s:%d Failed to compose control channel configuration for participant '%llu'", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

void __62__VCSession_sendSymptomsToRemoteParticipants_symptom_groupID___block_invoke_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;
  int v5;
  const void *v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  LODWORD(v6) = 2747;
  WORD2(v6) = 2048;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v1, v2, "VCSession [%s] %s:%d remoteParticipantIDs = %p", v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Reporting agent is not properly configured", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGrou"
                      "pID:withStreamID:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Session Event failed - EventType:%d needs a participant but it is nil", v2, *(const char **)v3, (unint64_t)"-[VCSession reportingSessionParticipantEvent:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)collectSessionEventKeyFieldsAndSubtype:eventType:withParticipant:keyChangeReason:newMKI:withStreamGroupID:withStreamID:collectSubtype:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d eventSubtype must not be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reportingSessionRemoteParticipantEvent:withParticipant:value:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSession reportingSessionRemoteParticipantEvent:withParticipant:value:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d EventType:%d is not relevant for Session Remote Participant Event logging", v2, *(const char **)v3, (unint64_t)"-[VCSession reportingSessionRemoteParticipantEvent:withParticipant:value:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedAddParticipantWithConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Failed to configure Remote Participant", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedAddParticipantWithConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Failed to add and start Remote Participant for One to One", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedAddParticipantWithConfig:.cold.3()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCSession dispatchedAddParticipantWithConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "VCSession [%s] %s:%d Setting ecn failed for session=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedAddParticipantWithConfig:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  const char *v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_14_2();
  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "uuid");
  v5 = 136315906;
  v6 = v1;
  OUTLINED_FUNCTION_7_1();
  v7 = "-[VCSession dispatchedAddParticipantWithConfig:]";
  OUTLINED_FUNCTION_4();
  v8 = 3240;
  v9 = 2112;
  v10 = v3;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v4, "VCSession [%s] %s:%d Attempting to add a remote participant that is using same uuid as local participant's uuid=%@!", (uint8_t *)&v5);
  OUTLINED_FUNCTION_3_0();
}

- (void)dispatchedAddParticipantWithConfig:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  const char *v6;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_14_9(v2, *MEMORY[0x1E0C80C00]);
  v4 = 136315906;
  v5 = v1;
  OUTLINED_FUNCTION_7_1();
  v6 = "-[VCSession dispatchedAddParticipantWithConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_13_6();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, v3, "VCSession [%s] %s:%d Another participant with same idsParticipantID=%llu already exists!", (uint8_t *)&v4);
  OUTLINED_FUNCTION_3_0();
}

- (void)configureRemoteParticipant:(NSObject *)a3 withConfig:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  const char *v9;
  int v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "idsParticipantID");
  v7 = 136316162;
  v8 = a1;
  OUTLINED_FUNCTION_7_1();
  v9 = "-[VCSession configureRemoteParticipant:withConfig:]";
  OUTLINED_FUNCTION_4();
  v10 = 3381;
  v11 = 2048;
  v12 = a2;
  v13 = 2048;
  v14 = v6;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, "VCSession [%s] %s:%d OneToOne config was unable to be setup for remoteParticipant=%p participantID=%llu", (uint8_t *)&v7, 0x30u);
}

- (void)dispatchedUpdateConfiguration:.cold.1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCSession dispatchedUpdateConfiguration:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "VCSession [%s] %s:%d VCSession:[%p] Failed to update the local participant configuration", v1);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedUpdateConfiguration:.cold.2()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCSession dispatchedUpdateConfiguration:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "VCSession [%s] %s:%d VCSession:[%p] Failed to update the session configuration", v1);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedParticipant:didStart:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSession [%s] %s:%d Session failed to start.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to send oneToOneModeEnabled=%d message", v2, *(const char **)v3, (unint64_t)"-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke" >> 16, 910);
  OUTLINED_FUNCTION_3();
}

void __85__VCSession_OneToOne__completionHandlerOneToOneEnabled_didSucceed_configurationDict___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to complete transition to oneToOneModeEnabled=%d", v2, *(const char **)v3, (unint64_t)"-[VCSession(OneToOne) completionHandlerOneToOneEnabled:didSucceed:configurationDict:]_block_invoke" >> 16, 913);
  OUTLINED_FUNCTION_3();
}

void __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d streamGroupStatesMessage is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __57__VCSession_Messaging__setupStreamGroupStateFetchMessage__block_invoke_cold_3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Session is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d setupWRMAlertUpdateMessage message is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__VCSession_Messaging__setupWRMAlertUpdateMessage__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d setupWRMAlertUpdateMessage message is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__VCSession_Messaging__setupMomentsMessages__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d setupMomentsMessages message is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __54__VCSession_Messaging__setupPreferredInterfaceMessage__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d setupPreferredInterfaceMessage message is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d setupMediaQualityDegradedMessage message is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__VCSession_Messaging__setupMediaQualityDegradedMessage__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d setupMediaQualityDegradedMessage message is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d setupNetworkQualityDegradedMessage message is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __58__VCSession_Messaging__setupNetworkQualityDegradedMessage__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d setupNetworkQualityDegradedMessage message is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__VCSession_Messaging__setupCellTechChangeMessages__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Session is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_158_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d reactions dictionary is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_163_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d dictionary is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_164_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Participant is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__VCSession_Messaging__setupReactionMessages__block_invoke_164_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Reaction has invalid type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
