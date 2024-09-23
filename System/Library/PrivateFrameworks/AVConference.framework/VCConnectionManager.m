@implementation VCConnectionManager

- (void)setUpVTable
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager setUpVTable]"), 0));
}

- (VCConnectionManager)init
{
  VCConnectionManager *v2;
  VCConnectionManager *v3;
  NSObject *CustomRootQueue;
  double v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 useIDSLinkSuggestionFeatureFlag;
  _BOOL4 enableNetworkConditionMonitoring;
  int shouldForceRelayLinksWhenScreenEnabled;
  _BOOL4 useMediaDrivenDuplicationFeatureFlag;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCConnectionManager;
  v2 = -[VCConnectionManager init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    -[VCConnectionManager setUpVTable](v2, "setUpVTable");
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v3->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCConnectionManager.delegateQueue", 0, CustomRootQueue);
    v3->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCConnectionManager.callbackQueue", 0, CustomRootQueue);
    v3->_reportingQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCConnectionManager.reportingQueue", 0, CustomRootQueue);
    v3->_nwConnectionMonitorQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCConnectionManager.nwConnectionMonitorQueue", 0, CustomRootQueue);
    pthread_rwlock_init(&v3->_stateRWlock, 0);
    v3->_localConnectionStats.type = 0;
    v3->_remoteConnectionStats.type = 1;
    v3->_localWRMLinkTypeFromDefaults = -1;
    v3->_allowRequestForWRMNotification = 1;
    v3->_duplicationCallback = VCCMDuplicationCallback;
    v3->_duplicationContext = v3;
    v3->_vcWifiAssist = +[VCWifiAssistManager sharedInstance](VCWifiAssistManager, "sharedInstance");
    v3->_wrmHandler = objc_alloc_init(VCWRMHandler);
    v3->_duplicationHandler = objc_alloc_init(VCDuplicationHandler);
    v3->_linkProbingHandler = -[VCLinkProbingHandler initWithDelegate:]([VCLinkProbingHandler alloc], "initWithDelegate:", v3);
    v3->_noRemoteDuplicationThresholdFast = 4.0;
    v3->_connectionArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3->_lastDefaultCheckTime = 0.0;
    v3->_localRATTypeOverride = -1;
    v3->_isPrimaryLinkUsable = 1;
    v3->_isDuplicationAllowed = 1;
    v3->_isNWConnectionMonitorEnabled = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-nw-connection-monitor-enabled"), CFSTR("useNWConnectionMonitorForVCCM"), "AVConference", "UseNWConnectionMonitorForVCCM");
    v3->_aggregateStallTimeDuration = 0;
    v3->_mediaDegradedHistories = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_mediaDegradedHistoryIndices = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_aggregateStallTimeDuration = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[VCConnectionManager addMediaHealthStatsHistoryEntryForParticipantID:](v3, "addMediaHealthStatsHistoryEntryForParticipantID:", &unk_1E9EF5030);
    v3->_useMediaDrivenDuplicationFeatureFlag = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-duplication-media-driven-duplication-enabled"), CFSTR("duplicationReductionEnabled"), "AVConference", "UseMediaDrivenDuplication");
    v3->_isDuplicationAllowedForMediaDegraded = 0;
    v3->_isWRMNotificationPending = 0;
    *(_OWORD *)&v3->_savedWRMNotification.applicationType = 0u;
    *(_OWORD *)v3->_savedWRMNotification.linkTypeChangeReasonString = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[16] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[32] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[48] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[64] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[80] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[96] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkTypeChangeReasonString[112] = 0u;
    *(_OWORD *)&v3->_savedWRMNotification.linkBandwidthMin = 0u;
    v3->_wrmPendingBitrateCapDelta = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-wrm-pending-bitrate-cap-delta"), CFSTR("wrmPendingBitrateCapDelta"), &unk_1E9EF5030, 0), "intValue");
    objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("gk-p2p-video-near-degraded-threshold"), CFSTR("videoNearDegradedThreshold"), &unk_1E9EF5048, 1), "doubleValue");
    v3->_mediaDegradedThreshold = v5;
    v3->_enableNetworkConditionMonitoring = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-network-condition-detection-enabled"), CFSTR("networkConditionDetectionEnabled"), "AVConference", "EnableNetworkConditionMonitoring");
    v3->_isUserMoving = VCDefaults_GetIntValueForKey(CFSTR("forceUserMoving"), 0) != 0;
    if (v3->_enableNetworkConditionMonitoring)
      -[VCConnectionManager setupNetworkConditionMonitor](v3, "setupNetworkConditionMonitor");
    if ((VTP_GetSendRecvStats((unint64_t *)&v3->_initialSentBytes, (unint64_t *)&v3->_initialReceivedBytes) & 0x80000000) != 0)
    {
      v3->_initialSentBytes = -1;
      v3->_initialReceivedBytes = -1;
    }
    v3->_dropLinkRecommendation = 1;
    v3->_useIDSLinkSuggestionFeatureFlag = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-ids-link-suggestion-enabled"), CFSTR("idsLinkSuggestionEnabled"), "AVConference", "UseIDSLinkSuggestion");
    *(_QWORD *)&v3->_sendSuccessCountSinceLastCheck = 0;
    v3->_onTheWireTotalBytesReceivedSinceLastCheck = 0;
    v3->_onTheWireTotalBytesSentSinceLastCheck = 0;
    v3->_shouldForceRelayLinksWhenScreenEnabled = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-force-relay-when-screen-enabled"), CFSTR("forceRelayWhenScreenEnabled"), &unk_1E9EF5060, 0), "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        useIDSLinkSuggestionFeatureFlag = v3->_useIDSLinkSuggestionFeatureFlag;
        enableNetworkConditionMonitoring = v3->_enableNetworkConditionMonitoring;
        shouldForceRelayLinksWhenScreenEnabled = v3->_shouldForceRelayLinksWhenScreenEnabled;
        useMediaDrivenDuplicationFeatureFlag = v3->_useMediaDrivenDuplicationFeatureFlag;
        *(_DWORD *)buf = 136316674;
        v15 = v6;
        v16 = 2080;
        v17 = "-[VCConnectionManager init]";
        v18 = 1024;
        v19 = 275;
        v20 = 1024;
        v21 = useIDSLinkSuggestionFeatureFlag;
        v22 = 1024;
        v23 = enableNetworkConditionMonitoring;
        v24 = 1024;
        v25 = shouldForceRelayLinksWhenScreenEnabled;
        v26 = 1024;
        v27 = useMediaDrivenDuplicationFeatureFlag;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d useIDSLinkSuggestionFeatureFlag=%d enableNetworkConditionMonitoring=%d shouldForceRelayLinksWhenScreenEnabled=%d, _useMediaDrivenDuplicationFeatureFlag=%d", buf, 0x34u);
      }
    }
    v3->_linkIPPreference = -1;
    v3->_canUseP2PLinks = 1;
    v3->_connectionStatsCollector = objc_alloc_init(VCConnectionStatisticsCollector);
    v3->_mapLinkIDToLinkUUID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
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
  opaqueRTCReporting *reportingAgent;
  NSObject *nwConnectionMonitorQueue;
  tagVCNetworkConditionMonitor *networkConditionMonitor;
  tagVCOverlaySource *overlaySource;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCConnectionManager *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((VCConnectionManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = v4;
        v18 = 2080;
        v19 = "-[VCConnectionManager dealloc]";
        v20 = 1024;
        v21 = 285;
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
      v3 = (const __CFString *)-[VCConnectionManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v17 = v9;
        v18 = 2080;
        v19 = "-[VCConnectionManager dealloc]";
        v20 = 1024;
        v21 = 285;
        v22 = 2112;
        v23 = v3;
        v24 = 2048;
        v25 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  -[VCConnectionManager removeMediaHealthStatsHistoryEntryForParticipantID:](self, "removeMediaHealthStatsHistoryEntryForParticipantID:", &unk_1E9EF5030);
  VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, 0);
  -[VCConnectionManager destroyNWMonitor](self, "destroyNWMonitor");
  pthread_rwlock_destroy(&self->_stateRWlock);
  -[VCConnectionManager invalidateNetworkConditionMonitor](self, "invalidateNetworkConditionMonitor");
  dispatch_release((dispatch_object_t)self->_delegateQueue);
  dispatch_release((dispatch_object_t)self->_callbackQueue);
  dispatch_release((dispatch_object_t)self->_reportingQueue);

  -[VCConnectionManager deregisterPeriodicTask](self, "deregisterPeriodicTask");
  reportingAgent = self->_reportingAgent;
  if (reportingAgent)
    CFRelease(reportingAgent);
  objc_storeWeak(&self->_delegate, 0);

  nwConnectionMonitorQueue = self->_nwConnectionMonitorQueue;
  if (nwConnectionMonitorQueue)
    dispatch_release(nwConnectionMonitorQueue);

  networkConditionMonitor = self->_networkConditionMonitor;
  if (networkConditionMonitor)
  {
    CFRelease(networkConditionMonitor);
    self->_networkConditionMonitor = 0;
  }
  if (self->_overlaySource)
  {
    VCOverlayManager_releaseOverlaySourceWithToken(self->_overlayToken, 2u);
    overlaySource = self->_overlaySource;
    if (overlaySource)
    {
      CFRelease(overlaySource);
      self->_overlaySource = 0;
    }
  }

  v15.receiver = self;
  v15.super_class = (Class)VCConnectionManager;
  -[VCConnectionManager dealloc](&v15, sel_dealloc);
}

- (void)invalidateNetworkConditionMonitor
{
  VCNetworkConditionMonitor_Invalidate((uint64_t)self->_networkConditionMonitor);
}

- (void)setStatisticsCollector:(id)a3
{
  NSObject *callbackQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCConnectionManager_setStatisticsCollector___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(callbackQueue, block);
}

_BYTE *__46__VCConnectionManager_setStatisticsCollector___block_invoke(uint64_t a1)
{
  _BYTE *result;

  objc_msgSend(*(id *)(a1 + 32), "unregisterStatisticsHandlers");

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2920) = *(id *)(a1 + 40);
  result = *(_BYTE **)(a1 + 32);
  if (result[80])
    return (_BYTE *)objc_msgSend(result, "registerStatisticsHandlers");
  return result;
}

- (void)registerStatisticsHandlers
{
  uint64_t v3;
  AVCStatisticsCollector *statisticsCollector;
  uint64_t v5;
  NSObject *v6;
  int mediaHealthStatisticsHandlerIndex;
  AVCStatisticsCollector *v8;
  AVCStatisticsCollector *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
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
  v3 = MEMORY[0x1E0C809B0];
  statisticsCollector = self->_statisticsCollector;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__VCConnectionManager_registerStatisticsHandlers__block_invoke;
  v12[3] = &unk_1E9E523A0;
  v12[4] = self;
  self->_mediaHealthStatisticsHandlerIndex = -[AVCStatisticsCollector registerStatisticsChangeHandlerWithType:handler:](statisticsCollector, "registerStatisticsChangeHandlerWithType:handler:", 10, v12);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      mediaHealthStatisticsHandlerIndex = self->_mediaHealthStatisticsHandlerIndex;
      *(_DWORD *)buf = 136315906;
      v14 = v5;
      v15 = 2080;
      v16 = "-[VCConnectionManager registerStatisticsHandlers]";
      v17 = 1024;
      v18 = 372;
      v19 = 1024;
      v20 = mediaHealthStatisticsHandlerIndex;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Registered MediaHealthStatisticsHandlerIndex=%d", buf, 0x22u);
    }
  }
  v8 = self->_statisticsCollector;
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __49__VCConnectionManager_registerStatisticsHandlers__block_invoke_48;
  v11[3] = &unk_1E9E523A0;
  v11[4] = self;
  self->_endToEndConnectionStatisticsHandlerIndex = -[AVCStatisticsCollector registerStatisticsChangeHandlerWithType:handler:](v8, "registerStatisticsChangeHandlerWithType:handler:", 2, v11);
  v9 = self->_statisticsCollector;
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __49__VCConnectionManager_registerStatisticsHandlers__block_invoke_2;
  v10[3] = &unk_1E9E523A0;
  v10[4] = self;
  self->_serverBasedConnectionStatisticsHandlerIndex = -[AVCStatisticsCollector registerStatisticsChangeHandlerWithType:handler:](v9, "registerStatisticsChangeHandlerWithType:handler:", 5, v10);
}

uint64_t __49__VCConnectionManager_registerStatisticsHandlers__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  _BYTE buf[24];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = result;
  switch(*(_DWORD *)(a2 + 24))
  {
    case 5:
      if (*(_BYTE *)(a2 + 45))
        *(_QWORD *)(*(_QWORD *)(result + 32) + 664) = *(_QWORD *)(a2 + 8);
      else
        *(_QWORD *)(*(_QWORD *)(result + 32) + 664) = 0;
      break;
    case 6:
      result = *(_QWORD *)(result + 32);
      if (!*(_BYTE *)(result + 3140) && *(_BYTE *)(result + 3141))
      {
        objc_msgSend((id)result, "updateMediaDegradedHistoryWithCurrentAudioErasure:idsParticipantID:", &unk_1E9EF5030, *(float *)(a2 + 40));
        result = *(_QWORD *)(v3 + 32);
      }
      if (*(_BYTE *)(result + 3141))
        *(_QWORD *)(result + 3504) = *(_QWORD *)(a2 + 80);
      break;
    case 7:
      v15[0] = 0;
      *(_QWORD *)&buf[8] = 1;
      *(_QWORD *)buf = *(_QWORD *)(a2 + 8);
      *(_QWORD *)&buf[16] = fmin(*(double *)(a2 + 48), 1.0);
      v4 = *(void **)(result + 32);
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 80));
      v6 = (uint64_t *)buf;
      goto LABEL_17;
    case 8:
      v12 = 0;
      v11 = 1;
      v10 = *(_QWORD *)(a2 + 8);
      if (*(double *)(a2 + 56) >= 1.0)
        v7 = *(double *)(a2 + 56);
      else
        v7 = 0.0;
      v13 = v7;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCConnectionManager registerStatisticsHandlers]_block_invoke";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v15[0]) = 368;
          WORD2(v15[0]) = 2048;
          *(double *)((char *)v15 + 6) = v7;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received video stall update videoStallTimeTotal=%.2f", buf, 0x26u);
        }
      }
      v4 = *(void **)(v3 + 32);
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a2 + 80), v10, v11, v12, *(_QWORD *)&v13);
      v6 = &v10;
LABEL_17:
      result = objc_msgSend(v4, "updateMediaHealthStats:idsParticipantID:", v6, v5);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t __49__VCConnectionManager_registerStatisticsHandlers__block_invoke_48(uint64_t a1, uint64_t a2)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[12];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v3;
  v11 = *(_QWORD *)(a2 + 192);
  v4 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v4;
  v5 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v5;
  v6 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v6;
  v7 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v7;
  v8 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v8;
  return objc_msgSend(v2, "updateConnectionHealthWithVCStatisticsMessage:", v10);
}

uint64_t __49__VCConnectionManager_registerStatisticsHandlers__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[12];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v3;
  v11 = *(_QWORD *)(a2 + 192);
  v4 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v4;
  v5 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v5;
  v6 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v6;
  v7 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v7;
  v8 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v8;
  return objc_msgSend(v2, "updateConnectionHealthWithVCStatisticsMessage:", v10);
}

- (void)unregisterStatisticsHandlers
{
  -[AVCStatisticsCollector unregisterStatisticsChangeHandlerWithType:handlerIndex:](self->_statisticsCollector, "unregisterStatisticsChangeHandlerWithType:handlerIndex:", 10, self->_mediaHealthStatisticsHandlerIndex);
  -[AVCStatisticsCollector unregisterStatisticsChangeHandlerWithType:handlerIndex:](self->_statisticsCollector, "unregisterStatisticsChangeHandlerWithType:handlerIndex:", 2, self->_endToEndConnectionStatisticsHandlerIndex);
  -[AVCStatisticsCollector unregisterStatisticsChangeHandlerWithType:handlerIndex:](self->_statisticsCollector, "unregisterStatisticsChangeHandlerWithType:handlerIndex:", 5, self->_serverBasedConnectionStatisticsHandlerIndex);
}

- (void)setupConnectionHealthMonitorMultiway
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  _BYTE v10[24];
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_isOneToOneModeEnabled
    || -[VCConnectionManager useMediaDrivenDuplication](self, "useMediaDrivenDuplication"))
  {
    if (!self->_connectionHealthMonitor)
      -[VCConnectionManager setupConnectionHealthMonitor](self, "setupConnectionHealthMonitor");
  }
  else if (self->_startConnectionHealthMonitoring)
  {
    -[VCConnectionManager setStartConnectionHealthMonitoring:](self, "setStartConnectionHealthMonitoring:", 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v10 = 136315650;
        *(_QWORD *)&v10[4] = v3;
        *(_WORD *)&v10[12] = 2080;
        *(_QWORD *)&v10[14] = "-[VCConnectionManager setupConnectionHealthMonitorMultiway]";
        *(_WORD *)&v10[22] = 1024;
        v11 = 397;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: VCConnectionHealthMonitor stopped", v10, 0x1Cu);
      }
    }
    pthread_rwlock_wrlock(&self->_stateRWlock);
    v5 = VCDuplicationHandler_DuplicationReason((uint64_t)self->_duplicationHandler);
    if (VCDuplicationHandler_IsDuplicationEnabled((_BOOL8)self->_duplicationHandler) && (v5 - 1) <= 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = "remote-no-remote";
          *(_QWORD *)&v10[4] = v6;
          *(_DWORD *)v10 = 136315906;
          *(_QWORD *)&v10[14] = "-[VCConnectionManager setupConnectionHealthMonitorMultiway]";
          *(_WORD *)&v10[12] = 2080;
          if (v5 == 1)
            v8 = "no-remote";
          *(_WORD *)&v10[22] = 1024;
          v11 = 401;
          v12 = 2080;
          v13 = v8;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: stop dupe by %s.", v10, 0x26u);
        }
      }
      if (v5 == 2)
        v9 = 3;
      else
        v9 = 1;
      -[VCConnectionManager updateDuplicationStateWithEventType:](self, "updateDuplicationStateWithEventType:", v9, *(_OWORD *)v10, *(_QWORD *)&v10[16]);
    }
    pthread_rwlock_unlock(&self->_stateRWlock);
  }
}

- (void)setupConnectionHealthMonitor
{
  VCConnectionHealthMonitor *v3;
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
  v3 = objc_alloc_init(VCConnectionHealthMonitor);
  self->_connectionHealthMonitor = v3;
  -[VCConnectionHealthMonitor setDelegate:](v3, "setDelegate:", self);
  -[VCConnectionManager setStartConnectionHealthMonitoring:](self, "setStartConnectionHealthMonitoring:", !self->_isOneToOneModeEnabled);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCConnectionManager setupConnectionHealthMonitor]";
      v10 = 1024;
      v11 = 412;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: VCConnectionHealthMonitor is running", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

- (void)setPreferRelayOverP2PEnabled:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 preferRelayOverP2PEnabled;
  _BOOL4 dropLinkRecommendation;
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

  v3 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = self->_preferRelayOverP2PEnabled || a3;
  self->_preferRelayOverP2PEnabled = v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      preferRelayOverP2PEnabled = self->_preferRelayOverP2PEnabled;
      dropLinkRecommendation = self->_dropLinkRecommendation;
      v10 = 136316418;
      v11 = v6;
      v12 = 2080;
      v13 = "-[VCConnectionManager setPreferRelayOverP2PEnabled:]";
      v14 = 1024;
      v15 = 418;
      v16 = 1024;
      v17 = preferRelayOverP2PEnabled;
      v18 = 1024;
      v19 = v3;
      v20 = 1024;
      v21 = dropLinkRecommendation;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: _preferRelayOverP2PEnabled=%d preferRelayOverP2PEnabled=%d _dropLinkRecommendation=%d", (uint8_t *)&v10, 0x2Eu);
    }
  }
  if (!self->_dropLinkRecommendation)
    -[VCConnectionManager updateConnectionSelectionPolicyWithPreferE2E:](self, "updateConnectionSelectionPolicyWithPreferE2E:", self->_isOneToOneModeEnabled);
}

- (void)setPreferRelayOverP2P:(BOOL)a3 reason:(unsigned __int8)a4
{
  int v4;
  unsigned __int8 preferRelayOverP2PReason;
  unsigned __int8 v7;
  unsigned __int8 v8;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 preferRelayOverP2PEnabled;
  int v13;
  _BOOL4 dropLinkRecommendation;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  preferRelayOverP2PReason = self->_preferRelayOverP2PReason;
  v7 = preferRelayOverP2PReason | a4;
  v8 = preferRelayOverP2PReason & ~a4;
  if (a3)
    v8 = v7;
  self->_preferRelayOverP2PReason = v8;
  if (a4 == 4)
  {
    if ((v8 & 3) == 0)
      self->_preferRelayOverP2PEnabled = a3;
  }
  else
  {
    v9 = self->_preferRelayOverP2PEnabled || a3;
    self->_preferRelayOverP2PEnabled = v9;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      preferRelayOverP2PEnabled = self->_preferRelayOverP2PEnabled;
      v13 = self->_preferRelayOverP2PReason;
      dropLinkRecommendation = self->_dropLinkRecommendation;
      v15 = 136316418;
      v16 = v10;
      v17 = 2080;
      v18 = "-[VCConnectionManager setPreferRelayOverP2P:reason:]";
      v19 = 1024;
      v20 = 436;
      v21 = 1024;
      v22 = preferRelayOverP2PEnabled;
      v23 = 1024;
      v24 = v13;
      v25 = 1024;
      v26 = dropLinkRecommendation;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: _preferRelayOverP2PEnabled=%d _preferRelayOverP2PReason=%d _dropLinkRecommendation=%d", (uint8_t *)&v15, 0x2Eu);
    }
  }
  if (v4 != 2 || !self->_dropLinkRecommendation)
    -[VCConnectionManager checkAndUpdatePrimaryConnection](self, "checkAndUpdatePrimaryConnection");
}

- (void)setIsOneToOneModeEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  _BYTE v8[24];
  int v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  self->_isOneToOneModeEnabled = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = "disabled";
      *(_DWORD *)v8 = 136315906;
      *(_QWORD *)&v8[4] = v5;
      *(_WORD *)&v8[12] = 2080;
      *(_QWORD *)&v8[14] = "-[VCConnectionManager setIsOneToOneModeEnabled:]";
      if (v3)
        v7 = "enabled";
      *(_WORD *)&v8[22] = 1024;
      v9 = 447;
      v10 = 2080;
      v11 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d oneToOneMode=%s", v8, 0x26u);
    }
  }
  -[VCConnectionManager setupConnectionHealthMonitorMultiway](self, "setupConnectionHealthMonitorMultiway", *(_OWORD *)v8, *(_QWORD *)&v8[16]);
  -[VCConnectionManager checkAndUpdatePrimaryConnection](self, "checkAndUpdatePrimaryConnection");
}

- (void)setIsOneToOneScreenEnabled:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  self->_isOneToOneScreenEnabled = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = "disabled";
      v9 = v5;
      v8 = 136315906;
      v11 = "-[VCConnectionManager setIsOneToOneScreenEnabled:]";
      v10 = 2080;
      if (v3)
        v7 = "enabled";
      v12 = 1024;
      v13 = 454;
      v14 = 2080;
      v15 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d oneToOneScreenEnabled=%s", (uint8_t *)&v8, 0x26u);
    }
  }
  if (self->_shouldForceRelayLinksWhenScreenEnabled)
  {
    -[VCConnectionSelector setCanUseP2PLinks:](self->_connectionSelector, "setCanUseP2PLinks:", v3 ^ 1);
    self->_canUseP2PLinks = !v3;
    -[VCConnectionManager setPreferRelayOverP2P:reason:](self, "setPreferRelayOverP2P:reason:", v3, 4);
    pthread_rwlock_wrlock(&self->_stateRWlock);
    VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
    pthread_rwlock_unlock(&self->_stateRWlock);
  }
}

- (void)setStartConnectionHealthMonitoring:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  self->_startConnectionHealthMonitoring = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCConnectionManager setStartConnectionHealthMonitoring:]";
      v11 = 1024;
      v12 = 467;
      v13 = 1024;
      v14 = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: startConnectionHealthMonitoring=%d", (uint8_t *)&v7, 0x22u);
    }
  }
  -[VCConnectionManager resetConnectionStatTimers](self, "resetConnectionStatTimers");
  -[VCConnectionManager createOverlaySource](self, "createOverlaySource");
}

- (unsigned)sendSuccessCountSinceLastCheck
{
  unsigned int *p_sendSuccessCountSinceLastCheck;
  unsigned int result;

  p_sendSuccessCountSinceLastCheck = &self->_sendSuccessCountSinceLastCheck;
  do
    result = __ldaxr(p_sendSuccessCountSinceLastCheck);
  while (__stlxr(0, p_sendSuccessCountSinceLastCheck));
  return result;
}

- (unsigned)sendFailureCountSinceLastCheck
{
  unsigned int *p_sendFailureCountSinceLastCheck;
  unsigned int result;

  p_sendFailureCountSinceLastCheck = &self->_sendFailureCountSinceLastCheck;
  do
    result = __ldaxr(p_sendFailureCountSinceLastCheck);
  while (__stlxr(0, p_sendFailureCountSinceLastCheck));
  return result;
}

- (unint64_t)onTheWireTotalBytesReceivedSinceLastCheck
{
  unint64_t *p_onTheWireTotalBytesReceivedSinceLastCheck;
  unint64_t result;

  p_onTheWireTotalBytesReceivedSinceLastCheck = &self->_onTheWireTotalBytesReceivedSinceLastCheck;
  do
    result = __ldaxr(p_onTheWireTotalBytesReceivedSinceLastCheck);
  while (__stlxr(0, p_onTheWireTotalBytesReceivedSinceLastCheck));
  return result;
}

- (unint64_t)onTheWireTotalBytesSentSinceLastCheck
{
  unint64_t *p_onTheWireTotalBytesSentSinceLastCheck;
  unint64_t result;

  p_onTheWireTotalBytesSentSinceLastCheck = &self->_onTheWireTotalBytesSentSinceLastCheck;
  do
    result = __ldaxr(p_onTheWireTotalBytesSentSinceLastCheck);
  while (__stlxr(0, p_onTheWireTotalBytesSentSinceLastCheck));
  return result;
}

- (void)resetConnectionStatTimers
{
  double v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_startConnectionHealthMonitoring)
    v3 = micro();
  else
    v3 = 0.0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCConnectionManager resetConnectionStatTimers]";
      v10 = 1024;
      v11 = 490;
      v12 = 2048;
      v13 = v3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Re-setting connection stat timers to now=%f", (uint8_t *)&v6, 0x26u);
    }
  }
  self->_localConnectionStats.lastReceivedPacketOnPrimaryTime = v3;
  self->_localConnectionStats.lastReceivedPacketTime = v3;
  self->_remoteConnectionStats.lastReceivedPacketOnPrimaryTime = v3;
  self->_remoteConnectionStats.lastReceivedPacketTime = v3;
}

- (VCConnectionProtocol)connectionForDuplication
{
  return self->_connectionForDuplication;
}

- (BOOL)useMediaDrivenDuplication
{
  return self->_useMediaDrivenDuplication || self->_useMediaDrivenDuplicationFeatureFlag;
}

- (void)setUseMediaDrivenDuplication:(BOOL)a3
{
  double v4;

  self->_useMediaDrivenDuplication = a3;
  if (-[VCConnectionManager useMediaDrivenDuplication](self, "useMediaDrivenDuplication"))
  {
    objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("gk-p2p-media-degraded-threshold"), CFSTR("mediaDegradedThreshold"), &unk_1E9EF5078, 1), "doubleValue");
    self->_mediaDegradedThreshold = v4;
  }
  -[VCConnectionManager setupConnectionHealthMonitorMultiway](self, "setupConnectionHealthMonitorMultiway");
}

- (void)start
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  if (!self->_isStarted)
  {
    self->_isStarted = 1;
    -[VCConnectionManager registerStatisticsHandlers](self, "registerStatisticsHandlers");
    -[VCWifiAssistManager addDelegate:](self->_vcWifiAssist, "addDelegate:", self);
    if (!self->_isOneToOneModeEnabled)
      -[VCConnectionManager resetConnectionStatTimers](self, "resetConnectionStatTimers");
    -[VCConnectionManager disableRemotePreferredInterfaceInference:](self, "disableRemotePreferredInterfaceInference:", 0);
    -[VCCoreMotionManager startMonitoringMotionActivity](self->_coreMotionManager, "startMonitoringMotionActivity");
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __28__VCConnectionManager_start__block_invoke;
    v3[3] = &unk_1E9E55618;
    v3[4] = self;
    -[VCConnectionStatisticsCollector registerCopyPacketCountCallback:](self->_connectionStatsCollector, "registerCopyPacketCountCallback:", v3);
  }
}

uint64_t __28__VCConnectionManager_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "copyPersistenPacketCounts:isOutgoing:size:", a2, a3, 256);
}

- (void)stop
{
  if (self->_isStarted)
  {
    self->_isStarted = 0;
    -[VCWifiAssistManager removeDelegate:](self->_vcWifiAssist, "removeDelegate:", self);
    VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, 0);
    -[VCConnectionManager unregisterStatisticsHandlers](self, "unregisterStatisticsHandlers");
    -[VCConnectionStatisticsCollector stopPeriodicHistoryUpdate](self->_connectionStatsCollector, "stopPeriodicHistoryUpdate");
    -[VCConnectionStatisticsCollector deregisterCopyPacketCountCallBack](self->_connectionStatsCollector, "deregisterCopyPacketCountCallBack");
    -[VCCoreMotionManager stopMonitoringMotionActivity](self->_coreMotionManager, "stopMonitoringMotionActivity");
    -[VCConnectionManager destroyNWMonitor](self, "destroyNWMonitor");
  }
}

- (VCConnectionManagerDelegate)delegate
{
  return (VCConnectionManagerDelegate *)objc_loadWeak(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void)registerPeriodicTask
{
  reportingRegisterPeriodicTaskWeak();
}

uint64_t __43__VCConnectionManager_registerPeriodicTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "periodicTask:");
}

- (void)deregisterPeriodicTask
{
  reportingUnregisterPeriodicTask();
}

- (void)createOverlaySource
{
  int64_t overlayToken;

  overlayToken = self->_overlayToken;
  if (overlayToken)
  {
    if (!self->_overlaySource)
      self->_overlaySource = (tagVCOverlaySource *)VCOverlayManager_createOverlaySourceForToken(overlayToken, 2u);
  }
}

- (void)periodicTask:(void *)a3
{
  double v3;
  uint64_t frequencyBand;
  uint64_t btCoex;
  uint64_t qualityScoreDelayRx;
  uint64_t qualityScoreDelayTx;
  float offChannelTimeRatio;
  uint64_t maxRadioCoex;
  int64_t accumulatedOffChannelTime;
  uint64_t maxSingleOutagePeriod;
  float qualityScoreDelayRxAverage;
  float qualityScoreDelayTxAverage;
  float qualityScoreLossRxAverage;
  float qualityScoreLossTxAverage;
  float qualityScoreChannelAverage;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  NSObject *v25;
  NSString *nwMonitorInterfaceName;
  __int128 v27;
  int64_t v28;
  int v29;
  int qualityScoreChannel;
  unsigned int qualityScoreLossRx;
  unsigned int qualityScoreLossTx;
  int64_t v33;
  int64_t v34;
  int64_t v35;
  _BYTE buf[38];
  __int16 v37;
  NSString *v38;
  __int16 v39;
  double v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  unsigned int v50;
  __int16 v51;
  unsigned int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int64_t v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (self->_nwMonitor && !self->_ignoreNWConnectionMonitorNotification)
    {
      frequencyBand = self->_lastNWStatistics.var0.wifi.frequencyBand;
      btCoex = self->_lastNWStatistics.var0.wifi.btCoex;
      qualityScoreDelayRx = self->_lastNWStatistics.var0.wifi.qualityScoreDelayRx;
      qualityScoreDelayTx = self->_lastNWStatistics.var0.wifi.qualityScoreDelayTx;
      qualityScoreLossRx = self->_lastNWStatistics.var0.wifi.qualityScoreLossRx;
      qualityScoreLossTx = self->_lastNWStatistics.var0.wifi.qualityScoreLossTx;
      qualityScoreChannel = self->_lastNWStatistics.var0.wifi.qualityScoreChannel;
      offChannelTimeRatio = self->_lastNWStatistics.var0.wifi.offChannelTimeRatio;
      maxRadioCoex = self->_lastNWStatistics.var0.wifi.maxRadioCoex;
      accumulatedOffChannelTime = self->_lastNWStatistics.var0.wifi.accumulatedOffChannelTime;
      maxSingleOutagePeriod = self->_lastNWStatistics.var0.wifi.maxSingleOutagePeriod;
      qualityScoreDelayRxAverage = self->_lastNWStatistics.var0.wifi.qualityScoreDelayRxAverage;
      qualityScoreDelayTxAverage = self->_lastNWStatistics.var0.wifi.qualityScoreDelayTxAverage;
      qualityScoreLossRxAverage = self->_lastNWStatistics.var0.wifi.qualityScoreLossRxAverage;
      qualityScoreLossTxAverage = self->_lastNWStatistics.var0.wifi.qualityScoreLossTxAverage;
      qualityScoreChannelAverage = self->_lastNWStatistics.var0.wifi.qualityScoreChannelAverage;
      *(float *)&v3 = offChannelTimeRatio;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3), CFSTR("NWOffChannel"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", btCoex), CFSTR("NWBtCoex"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", frequencyBand), CFSTR("NWFreqBand"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", maxRadioCoex), CFSTR("NWRadioCoexMax"));
      v28 = accumulatedOffChannelTime;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", accumulatedOffChannelTime), CFSTR("NWOffChannelTime"));
      v29 = maxSingleOutagePeriod;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", maxSingleOutagePeriod), CFSTR("NWOutagePeriodMax"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", qualityScoreDelayRx), CFSTR("NWQualityDelayRx"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", qualityScoreDelayTx), CFSTR("NWQualityDelayTx"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", qualityScoreLossRx), CFSTR("NWQualityLossRx"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", qualityScoreLossTx), CFSTR("NWQualityLossTx"));
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:"), CFSTR("NWQualityChannel"));
      *(float *)&v19 = qualityScoreDelayRxAverage;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19), CFSTR("NWQualityDelayRxAvg"));
      *(float *)&v20 = qualityScoreDelayTxAverage;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20), CFSTR("NWQualityDelayTxAvg"));
      *(float *)&v21 = qualityScoreLossRxAverage;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21), CFSTR("NWQualityLossRxAvg"));
      *(float *)&v22 = qualityScoreLossTxAverage;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22), CFSTR("NWQualityLossTxAvg"));
      *(float *)&v23 = qualityScoreChannelAverage;
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23), CFSTR("NWQualityChannelAvg"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          nwMonitorInterfaceName = self->_nwMonitorInterfaceName;
          *(_DWORD *)buf = 136318978;
          *(_QWORD *)&buf[4] = v24;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCConnectionManager periodicTask:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 624;
          *(_WORD *)&buf[28] = 2048;
          *(_QWORD *)&buf[30] = self;
          v37 = 2112;
          v38 = nwMonitorInterfaceName;
          v39 = 2048;
          v40 = offChannelTimeRatio;
          v41 = 1024;
          v42 = btCoex;
          v43 = 1024;
          v44 = frequencyBand;
          v45 = 1024;
          v46 = qualityScoreDelayRx;
          v47 = 1024;
          v48 = qualityScoreDelayTx;
          v49 = 1024;
          v50 = qualityScoreLossRx;
          v51 = 1024;
          v52 = qualityScoreLossTx;
          v53 = 1024;
          v54 = qualityScoreChannel;
          v55 = 1024;
          v56 = maxRadioCoex;
          v57 = 2048;
          v58 = v28;
          v59 = 1024;
          v60 = v29;
          _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VCConnectionManager [%p] interfaceName=%@ offChannelRatio=%2.3f btCoex=%d frequencyBand=%d qualityScoreDelayRx=%d qualityScoreDelayTx=%d qualityScoreLossRx=%d qualityScoreLossTx=%d qualityScoreChannel=%d maxRadioCoex=0x%X accumulatedOffChannelTime=%lld maxSingleOutagePeriod=%u", buf, 0x7Au);
        }
      }
      VCNWConnectionMonitor_ResetWlanStats((uint64_t)self->_nwMonitor);
    }
    memset(buf, 0, 32);
    VTP_GetReportingStats((unint64_t *)buf);
    v33 = *(_QWORD *)&buf[16] - self->_lastReceivedReportingStats.totalUplinkIngressPackets;
    v35 = *(_QWORD *)buf - self->_lastReceivedReportingStats.totalDownlinkIngressMediaPackets;
    v34 = *(_QWORD *)&buf[8] - self->_lastReceivedReportingStats.totalDownlinkEgressMediaPackets;
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)&buf[24] - self->_lastReceivedReportingStats.totalUplinkEgressPackets), CFSTR("VTPUplinkEgressPkts"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v33), CFSTR("VTPUplinkIngressPkts"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v35), CFSTR("VTPDownlinkIngressMediaPkts"));
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v34), CFSTR("VTPDownlinkEgressMediaPkts"));
    v27 = *(_OWORD *)buf;
    *(_OWORD *)&self->_lastReceivedReportingStats.totalUplinkIngressPackets = *(_OWORD *)&buf[16];
    *(_OWORD *)&self->_lastReceivedReportingStats.totalDownlinkIngressMediaPackets = v27;
  }
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  opaqueRTCReporting *reportingAgent;

  if (a3)
    CFRetain(a3);
  pthread_rwlock_wrlock(&self->_stateRWlock);
  if (self->_reportingAgent)
  {
    -[VCConnectionManager deregisterPeriodicTask](self, "deregisterPeriodicTask");
    reportingAgent = self->_reportingAgent;
  }
  else
  {
    reportingAgent = 0;
  }
  self->_reportingAgent = a3;
  if (a3)
    CFRetain(a3);
  if (reportingAgent)
    CFRelease(reportingAgent);
  if (a3)
    CFRelease(a3);
  -[VCConnectionManager registerPeriodicTask](self, "registerPeriodicTask");
  pthread_rwlock_unlock(&self->_stateRWlock);
}

- (void)setConnectionSelectionVersionWithLocalFrameworkVersion:(id)a3 remoteFrameworkVersion:(id)a4
{
  unsigned int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  int connectionSelectionVersion;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = -[VCConnectionManager getConnectionSelectionVersionFromFrameworkVersion:](self, "getConnectionSelectionVersionFromFrameworkVersion:");
  v8 = -[VCConnectionManager getConnectionSelectionVersionFromFrameworkVersion:](self, "getConnectionSelectionVersionFromFrameworkVersion:", a4);
  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  self->_connectionSelectionVersion = v9;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      connectionSelectionVersion = self->_connectionSelectionVersion;
      v13 = 136316418;
      v14 = v10;
      v15 = 2080;
      v16 = "-[VCConnectionManager setConnectionSelectionVersionWithLocalFrameworkVersion:remoteFrameworkVersion:]";
      v17 = 1024;
      v18 = 662;
      v19 = 1024;
      v20 = connectionSelectionVersion;
      v21 = 2112;
      v22 = a3;
      v23 = 2112;
      v24 = a4;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: setting connection selection version=%d localFrameworkVersion=%@ remoteFrameworkVersion=%@", (uint8_t *)&v13, 0x36u);
    }
  }
  -[VCConnectionManager updateScreenShareRelaySetting](self, "updateScreenShareRelaySetting");
  -[VCConnectionManager updateConnectionSelectionPolicyWithPreferE2E:](self, "updateConnectionSelectionPolicyWithPreferE2E:", self->_isOneToOneModeEnabled);
  -[VCDuplicationHandler setIsRemotePreAzul:](self->_duplicationHandler, "setIsRemotePreAzul:", -[VCConnectionManager getConnectionSelectionVersionFromFrameworkVersion:](self, "getConnectionSelectionVersionFromFrameworkVersion:", a4) < 3);
  -[VCConnectionManager checkAndUpdatePrimaryConnection](self, "checkAndUpdatePrimaryConnection");
}

- (void)updateScreenShareRelaySetting
{
  uint64_t connectionSelectionVersion;
  uint64_t v4;
  NSObject *v5;
  int shouldForceRelayLinksWhenScreenEnabled;
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
  connectionSelectionVersion = self->_connectionSelectionVersion;
  if (connectionSelectionVersion <= 6)
    self->_shouldForceRelayLinksWhenScreenEnabled = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-force-relay-when-screen-enabled"), CFSTR("forceRelayWhenScreenEnabled"), qword_1E9E55718[connectionSelectionVersion], 0), "intValue");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      shouldForceRelayLinksWhenScreenEnabled = self->_shouldForceRelayLinksWhenScreenEnabled;
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCConnectionManager updateScreenShareRelaySetting]";
      v11 = 1024;
      v12 = 683;
      v13 = 1024;
      v14 = shouldForceRelayLinksWhenScreenEnabled;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: shouldForceRelayLinksWhenScreenEnabled=%d", (uint8_t *)&v7, 0x22u);
    }
  }
}

- (void)checkAndUpdatePrimaryConnection
{
  -[VCConnectionManager updateConnectionSelectionPolicyWithPreferE2E:](self, "updateConnectionSelectionPolicyWithPreferE2E:", self->_isOneToOneModeEnabled);
  pthread_rwlock_wrlock(&self->_stateRWlock);
  if (-[VCConnectionManager isBetterPrimaryConnectionAvailable](self, "isBetterPrimaryConnectionAvailable"))
    -[VCConnectionManager reselectPrimaryConnection](self, "reselectPrimaryConnection");
  pthread_rwlock_unlock(&self->_stateRWlock);
}

- (BOOL)isBetterPrimaryConnectionAvailable
{
  NSMutableArray *connectionArray;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  connectionArray = self->_connectionArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v12;
  v7 = 1;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v6)
      objc_enumerationMutation(connectionArray);
    if (-[VCConnectionManager isBetterConnection:asPrimary:](self, "isBetterConnection:asPrimary:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), 1))
    {
      return v7;
    }
    if (v5 == ++v8)
    {
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      if (v5)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)setDuplicationCallback:(void *)a3 withContext:(void *)a4
{
  NSObject *callbackQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  callbackQueue = self->_callbackQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__VCConnectionManager_setDuplicationCallback_withContext___block_invoke;
  v5[3] = &unk_1E9E52910;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  dispatch_async(callbackQueue, v5);
}

_QWORD *__58__VCConnectionManager_setDuplicationCallback_withContext___block_invoke(_QWORD *result)
{
  *(_QWORD *)(result[4] + 448) = result[5];
  *(_QWORD *)(result[4] + 480) = result[6];
  return result;
}

- (void)setConnectionPause:(BOOL)a3 isLocalConnection:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  uint64_t v9;
  char *v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a4;
  v5 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = micro();
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_wrlock(&self->_stateRWlock);
  v9 = 568;
  if (v4)
    v9 = 520;
  v10 = (char *)self + v9;
  if (!v5 && v10[40])
  {
    v11 = 0.0;
    if (self->_startConnectionHealthMonitoring)
      v11 = v7;
    self->_localConnectionStats.lastReceivedPacketTime = v11;
    self->_localConnectionStats.lastReceivedPacketOnPrimaryTime = v11;
    self->_remoteConnectionStats.lastReceivedPacketTime = v11;
    self->_remoteConnectionStats.lastReceivedPacketOnPrimaryTime = v11;
  }
  v10[40] = v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136316162;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCConnectionManager setConnectionPause:isLocalConnection:]";
      v18 = 1024;
      v19 = 722;
      v20 = 1024;
      v21 = v4;
      v22 = 1024;
      v23 = v5;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d local? %d, audio paused? %d", (uint8_t *)&v14, 0x28u);
    }
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)setiRATDuplicationEnabled:(BOOL)a3
{
  -[VCDuplicationHandler setIRATDuplicationEnabled:](self->_duplicationHandler, "setIRATDuplicationEnabled:");
  self->_iRATDuplicationEnabled = a3;
}

- (BOOL)isDuplicationEnabled
{
  return VCDuplicationHandler_IsDuplicationEnabled((_BOOL8)self->_duplicationHandler);
}

- (void)copyPersistenPacketCounts:(unsigned int *)a3 isOutgoing:(BOOL)a4 size:(int)a5
{
  _BOOL4 v5;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  uint64_t v9;

  if (a5 == 256)
  {
    v5 = a4;
    p_stateRWlock = &self->_stateRWlock;
    pthread_rwlock_wrlock(&self->_stateRWlock);
    v9 = 1872;
    if (v5)
      v9 = 848;
    memcpy(a3, (char *)self + v9, 0x400uLL);
    pthread_rwlock_unlock(p_stateRWlock);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCConnectionManager copyPersistenPacketCounts:isOutgoing:size:].cold.1();
  }
}

- (int)setWRMUpdateCallback:(void *)a3 requestNotificationCallback:(void *)a4 withContext:(void *)a5 completionHandler:(id)a6
{
  NSObject *callbackQueue;
  _QWORD v8[10];

  v8[9] = *MEMORY[0x1E0C80C00];
  callbackQueue = self->_callbackQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__VCConnectionManager_setWRMUpdateCallback_requestNotificationCallback_withContext_completionHandler___block_invoke;
  v8[3] = &unk_1E9E55640;
  v8[6] = a3;
  v8[7] = a4;
  v8[8] = a5;
  v8[4] = self;
  v8[5] = a6;
  dispatch_async(callbackQueue, v8);
  return 0;
}

uint64_t __102__VCConnectionManager_setWRMUpdateCallback_requestNotificationCallback_withContext_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_QWORD *)(a1[4] + 704) = a1[6];
  *(_QWORD *)(a1[4] + 712) = a1[7];
  *(_QWORD *)(a1[4] + 720) = a1[8];
  result = a1[5];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setRemotePreWarmStateEnabled:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 remotePreWarmStateEnabled;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_remotePreWarmStateEnabled != a3)
  {
    self->_remotePreWarmStateEnabled = a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        remotePreWarmStateEnabled = self->_remotePreWarmStateEnabled;
        v7 = "Start";
        *(_DWORD *)buf = 136316162;
        if (!remotePreWarmStateEnabled)
          v7 = "Stop";
        v11 = v4;
        v12 = 2080;
        v13 = "-[VCConnectionManager setRemotePreWarmStateEnabled:]";
        v14 = 1024;
        v15 = 979;
        v16 = 1024;
        v17 = remotePreWarmStateEnabled;
        v18 = 2080;
        v19 = v7;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: set remote pre-warm state to %d. %s active probing on links", buf, 0x2Cu);
      }
    }
    pthread_rwlock_wrlock(&self->_stateRWlock);
    VCConnectionManager_SetActiveLinkProbingEnabled((uint64_t)self, self->_remotePreWarmStateEnabled);
    VCConnectionManager_AlertStateUpdated(self, self->_remotePreWarmStateEnabled, 0);
    pthread_rwlock_unlock(&self->_stateRWlock);
    v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_remotePreWarmStateEnabled, CFSTR("WRMRemAlrtUpdate"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    reportingGenericEvent();
  }
}

- (void)setIsRemoteMediaQualityDegraded:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 isRemoteMediaQualityDegraded;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_isRemoteMediaQualityDegraded = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      isRemoteMediaQualityDegraded = self->_isRemoteMediaQualityDegraded;
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCConnectionManager setIsRemoteMediaQualityDegraded:]";
      v11 = 1024;
      v12 = 991;
      v13 = 1024;
      v14 = isRemoteMediaQualityDegraded;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Set isRemoteMediaQualityDegraded=%d", (uint8_t *)&v7, 0x22u);
    }
  }
  -[VCConnectionManager checkForCachedWRMNotification](self, "checkForCachedWRMNotification");
}

- (void)setIsRemoteNetworkQualityDegraded:(BOOL)a3
{
  self->_isRemoteNetworkQualityDegraded = a3;
  VCNetworkConditionMonitor_SetRemoteNetworkQuality((uint64_t)self->_networkConditionMonitor, a3);
}

- (BOOL)isDuplicationAllowed
{
  _BOOL4 v3;
  BOOL result;
  _BOOL4 isRemoteMediaQualityDegraded;
  signed int downlinkTargetBitrate;
  signed int v8;

  v3 = -[VCConnectionManager useMediaDrivenDuplication](self, "useMediaDrivenDuplication")
    || !self->_isOneToOneModeEnabled;
  if ((-[VCConnectionManager useMediaDrivenDuplication](self, "useMediaDrivenDuplication")
     || self->_isOneToOneModeEnabled)
    && !self->_isDuplicationAllowedForMediaDegraded)
  {
    isRemoteMediaQualityDegraded = self->_isRemoteMediaQualityDegraded;
    if (!self->_isRemoteMediaQualityDegraded || !v3)
    {
      self->_isDuplicationAllowed = isRemoteMediaQualityDegraded;
      if (!isRemoteMediaQualityDegraded)
        return self->_isUserMoving;
      return 1;
    }
  }
  else if (!v3)
  {
    result = 1;
    self->_isDuplicationAllowed = 1;
    return result;
  }
  downlinkTargetBitrate = self->_downlinkTargetBitrate;
  v8 = self->_wrmPendingBitrateCapDelta + self->_downlinkTargetCellBitrateCap;
  self->_isDuplicationAllowed = downlinkTargetBitrate <= v8;
  if (downlinkTargetBitrate > v8)
    return self->_isUserMoving;
  return 1;
}

- (void)setDuplicationDownlinkCellBitrateCap:(unsigned int)a3 currentBitrate:(unsigned int)a4
{
  self->_downlinkTargetCellBitrateCap = a3;
  self->_downlinkTargetBitrate = a4;
  -[VCConnectionManager checkForCachedWRMNotification](self, "checkForCachedWRMNotification");
}

- (void)checkForCachedWRMNotification
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 isWRMNotificationPending;
  _BOOL4 v6;
  _BOOL4 isUserMoving;
  uint64_t v8;
  NSObject *v9;
  int linkTypeSuggestion;
  _BOOL4 isDuplicationAllowedForMediaDegraded;
  _BOOL4 isRemoteMediaQualityDegraded;
  unsigned int downlinkTargetBitrate;
  unsigned int downlinkTargetCellBitrateCap;
  int wrmPendingBitrateCapDelta;
  _BOOL4 v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      isWRMNotificationPending = self->_isWRMNotificationPending;
      v6 = -[VCConnectionManager isDuplicationAllowed](self, "isDuplicationAllowed");
      isUserMoving = self->_isUserMoving;
      v17 = 136316418;
      v18 = v3;
      v19 = 2080;
      v20 = "-[VCConnectionManager checkForCachedWRMNotification]";
      v21 = 1024;
      v22 = 1086;
      v23 = 1024;
      v24 = isWRMNotificationPending;
      v25 = 1024;
      v26 = v6;
      v27 = 1024;
      v28 = isUserMoving;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Checking for cached WRM notification _isWRMNotificationPending=%d isDuplicationAllowed=%d _isUserMoving=%d", (uint8_t *)&v17, 0x2Eu);
    }
  }
  if (-[VCConnectionManager isDuplicationAllowed](self, "isDuplicationAllowed") && self->_isWRMNotificationPending)
  {
    self->_isWRMNotificationPending = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        linkTypeSuggestion = self->_savedWRMNotification.linkTypeSuggestion;
        isDuplicationAllowedForMediaDegraded = self->_isDuplicationAllowedForMediaDegraded;
        isRemoteMediaQualityDegraded = self->_isRemoteMediaQualityDegraded;
        downlinkTargetBitrate = self->_downlinkTargetBitrate;
        downlinkTargetCellBitrateCap = self->_downlinkTargetCellBitrateCap;
        wrmPendingBitrateCapDelta = self->_wrmPendingBitrateCapDelta;
        v16 = self->_isUserMoving;
        v17 = 136317442;
        v18 = v8;
        v19 = 2080;
        v20 = "-[VCConnectionManager checkForCachedWRMNotification]";
        v21 = 1024;
        v22 = 1091;
        v23 = 1024;
        v24 = linkTypeSuggestion;
        v25 = 1024;
        v26 = isDuplicationAllowedForMediaDegraded;
        v27 = 1024;
        v28 = isRemoteMediaQualityDegraded;
        v29 = 1024;
        v30 = downlinkTargetBitrate;
        v31 = 1024;
        v32 = downlinkTargetCellBitrateCap;
        v33 = 1024;
        v34 = wrmPendingBitrateCapDelta;
        v35 = 1024;
        v36 = v16;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Processing iRAT notification (cached) WRM suggestion=%d isDuplicationAllowedForMediaDegraded=%d isRemoteMediaQualityDegraded=%d currentTargetBitrate=%d cellBitrateCap=%d bitrateCapDelta=%d isUserMoving=%d", (uint8_t *)&v17, 0x46u);
      }
    }
    VCConnectionManager_ProcessWRMNotification((uint64_t)self, &self->_savedWRMNotification.applicationType);
  }
}

- (void)processWRMCoexMetrics:(id)a3
{
  reportingGenericEvent();
}

- (int)processRemoteWRMSuggestion:(int)a3 isRemoteDuplicating:(BOOL)a4
{
  _BOOL4 v4;
  int v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v4 = a4;
  v7 = -[VCWRMHandler processRemoteWRMSuggestion:isRemoteDuplicating:](self->_wrmHandler, "processRemoteWRMSuggestion:isRemoteDuplicating:");
  if (!v7)
    return -2144796671;
  if (v7 == 3)
  {
    pthread_rwlock_wrlock(&self->_stateRWlock);
    v8 = -[VCWRMHandler remoteWRMLinkTypeSuggestion](self->_wrmHandler, "remoteWRMLinkTypeSuggestion");
    v9 = 0x10000;
    if (!v4)
      v9 = 0;
    v10 = v9 | ((unint64_t)(a3 != 0) << 40);
    v11 = 6;
    if (v8 == 1)
      v11 = 7;
    if ((VCDuplicationHandler_HandleDuplicationStateUpdateEvent(self->_duplicationHandler, v10 | v11, 0) & 1) != 0)
      VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, -[VCConnectionManager isDuplicationEnabled](self, "isDuplicationEnabled"));
    pthread_rwlock_unlock(&self->_stateRWlock);
  }
  return 0;
}

- (int)connectionCount
{
  uint64_t (**v2)(void);
  _opaque_pthread_rwlock_t *p_stateRWlock;

  v2 = (uint64_t (**)(void))self;
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_rdlock(&self->_stateRWlock);
  LODWORD(v2) = VCConnectionManager_GetNumberOfConnectionsInternal(v2);
  pthread_rwlock_unlock(p_stateRWlock);
  return (int)v2;
}

- (void)getSentBytes:(int64_t *)a3 receivedBytes:(int64_t *)a4
{
  if (a3 && a4)
  {
    if ((self->_initialSentBytes & 0x8000000000000000) == 0
      && !VTP_GetSendRecvStats((unint64_t *)a3, (unint64_t *)a4))
    {
      *a3 -= self->_initialSentBytes;
      *a4 -= self->_initialReceivedBytes;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCConnectionManager getSentBytes:receivedBytes:].cold.1();
  }
}

- (int)getConnectionTypeForActiveConnectionWithQuality:(int)a3 forLocalInterface:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  const void *v6;
  int v7;
  int v8;

  v4 = a4;
  v5 = (void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self, a3);
  if (!v5)
    return -1;
  v6 = v5;
  if (v4)
    v7 = objc_msgSend(v5, "localConnectionType");
  else
    v7 = objc_msgSend(v5, "remoteConnectionType");
  v8 = v7;
  CFRelease(v6);
  return v8;
}

- (int)getCellularTechForActiveConnectionWithQuality:(int)a3 forLocalInterface:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  const void *v6;
  int v7;
  int v8;

  v4 = a4;
  v5 = VCConnectionManager_CopyConnectionForQuality((uint64_t)self, a3);
  if (!v5)
    return 0;
  v6 = (const void *)v5;
  if (v4)
    v7 = VCConnection_LocalCellTech(v5);
  else
    v7 = VCConnection_RemoteCellTech(v5);
  v8 = v7;
  CFRelease(v6);
  return v8;
}

- (int)getCellularMTUForActiveConnectionWithQuality:(int)a3
{
  void *v3;
  int v4;

  v3 = (void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self, a3);
  v4 = objc_msgSend(v3, "connectionMTU");
  if (v3)
    CFRelease(v3);
  return v4;
}

- (BOOL)isConnectedOnIPv6ForActiveConnectionWithQuality:(int)a3
{
  const void *v3;
  char IsIPv6;

  v3 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self, a3);
  IsIPv6 = VCConnection_IsIPv6((uint64_t)v3);
  if (v3)
    CFRelease(v3);
  return IsIPv6;
}

- (BOOL)isConnectedOnRelayForActiveConnectionWithQuality:(int)a3
{
  const void *v3;
  char IsRelay;

  v3 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self, a3);
  IsRelay = VCConnection_IsRelay((uint64_t)v3);
  if (v3)
    CFRelease(v3);
  return IsRelay;
}

- (unsigned)getPacketCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCConnectionManager getPacketCountWithIndex:isOutgoing:]"), 0));
}

- (unsigned)getByteCountWithIndex:(unsigned __int8)a3 isOutgoing:(BOOL)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCConnectionManager getByteCountWithIndex:isOutgoing:]"), 0));
}

- (void)updateSessionStats:(unsigned __int16)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager updateSessionStats:]"), 0));
}

- (void)addMediaHealthStatsHistoryEntryForParticipantID:(id)a3
{
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistories, "objectForKeyedSubscript:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCConnectionManager addMediaHealthStatsHistoryEntryForParticipantID:].cold.1();
    }
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaDegradedHistories, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E9EFA0A0), a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaDegradedHistoryIndices, "setObject:forKeyedSubscript:", &unk_1E9EF5030, a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_aggregateStallTimeDuration, "setObject:forKeyedSubscript:", &unk_1E9EFB138, a3);
  }
}

- (void)removeMediaHealthStatsHistoryEntryForParticipantID:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistories, "objectForKeyedSubscript:"))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_mediaDegradedHistories, "removeObjectForKey:", a3);
    -[NSMutableDictionary removeObjectForKey:](self->_mediaDegradedHistoryIndices, "removeObjectForKey:", a3);
    -[NSMutableDictionary removeObjectForKey:](self->_aggregateStallTimeDuration, "removeObjectForKey:", a3);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    v7 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315906;
        v9 = v5;
        v10 = 2080;
        v11 = "-[VCConnectionManager removeMediaHealthStatsHistoryEntryForParticipantID:]";
        v12 = 1024;
        v13 = 1442;
        v14 = 2112;
        v15 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d idsParticipantID %@ is not yet added to mediaDegradedHistories!", (uint8_t *)&v8, 0x26u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      -[VCConnectionManager removeMediaHealthStatsHistoryEntryForParticipantID:].cold.1();
    }
  }
}

- (void)duplicationStateUpdateWithEvent:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  unint64_t updated;
  BOOL v8;
  NSObject *delegateQueue;
  _QWORD v10[5];
  __int16 v11;
  int v12;
  __int16 v13;
  BOOL v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3.var8;
  v4 = *(_QWORD *)&a3.var0;
  v15 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_wrlock(&self->_stateRWlock);
  updated = VCDuplicationHandler_HandleDuplicationStateUpdateEvent(self->_duplicationHandler, v4, v3);
  if ((updated & 1) != 0)
  {
    VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, -[VCConnectionManager isDuplicationEnabled](self, "isDuplicationEnabled"));
    if ((updated & 0x100) != 0)
    {
      v8 = -[VCConnectionManager isDuplicationEnabled](self, "isDuplicationEnabled");
      delegateQueue = self->_delegateQueue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __55__VCConnectionManager_duplicationStateUpdateWithEvent___block_invoke;
      v10[3] = &unk_1E9E529D8;
      v10[4] = self;
      v11 = updated;
      v13 = HIWORD(updated);
      v12 = updated >> 16;
      v14 = v8;
      dispatch_async(delegateQueue, v10);
    }
  }
  VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
  pthread_rwlock_unlock(p_stateRWlock);
}

uint64_t __55__VCConnectionManager_duplicationStateUpdateWithEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didUpdatePreferredInterfaceForDuplication:notifyPeer:enableDuplication:isMediaUnrecoverableSignal:", objc_msgSend(*(id *)(a1 + 32), "preferredLocalInterfaceForDuplication"), *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 48), 1);
}

- (void)aggregateStallTimeDuration:(id *)a3 idsParticipantID:(id)a4
{
  void *v6;
  NSMutableDictionary *aggregateStallTimeDuration;

  if (a3->var3 <= 0.0)
  {
    aggregateStallTimeDuration = self->_aggregateStallTimeDuration;
    v6 = &unk_1E9EFB138;
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    aggregateStallTimeDuration = self->_aggregateStallTimeDuration;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](aggregateStallTimeDuration, "setObject:forKeyedSubscript:", v6, a4);
}

- (void)checkMediaQualityDegradedForParticipantID:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  double mediaDegradedThreshold;
  uint64_t v8;
  double v9;
  NSObject *v10;
  NSObject *delegateQueue;
  _QWORD v12[5];
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateStallTimeDuration, "objectForKeyedSubscript:", a3), "doubleValue");
      mediaDegradedThreshold = self->_mediaDegradedThreshold;
      *(_DWORD *)buf = 136316162;
      v15 = v5;
      v16 = 2080;
      v17 = "-[VCConnectionManager checkMediaQualityDegradedForParticipantID:]";
      v18 = 1024;
      v19 = 1475;
      v20 = 2048;
      v21 = v8;
      v22 = 2048;
      v23 = mediaDegradedThreshold;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Aggregated stall time duration=%.2f Media degraded threshold=%.2f", buf, 0x30u);
    }
  }
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateStallTimeDuration, "objectForKeyedSubscript:", a3), "doubleValue");
  if (v9 <= self->_mediaDegradedThreshold)
  {
    if (self->_isDuplicationAllowedForMediaDegraded)
    {
      self->_isDuplicationAllowedForMediaDegraded = 0;
      delegateQueue = self->_delegateQueue;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__VCConnectionManager_checkMediaQualityDegradedForParticipantID___block_invoke_2;
      v12[3] = &unk_1E9E521C0;
      v12[4] = self;
      dispatch_async(delegateQueue, v12);
    }
  }
  else
  {
    if (!self->_isDuplicationAllowedForMediaDegraded)
    {
      v10 = self->_delegateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__VCConnectionManager_checkMediaQualityDegradedForParticipantID___block_invoke;
      block[3] = &unk_1E9E521C0;
      block[4] = self;
      dispatch_async(v10, block);
    }
    self->_isDuplicationAllowedForMediaDegraded = 1;
    -[VCConnectionManager checkForCachedWRMNotification](self, "checkForCachedWRMNotification");
  }
}

uint64_t __65__VCConnectionManager_checkMediaQualityDegradedForParticipantID___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didMediaQualityDegrade:", 1);
}

uint64_t __65__VCConnectionManager_checkMediaQualityDegradedForParticipantID___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didMediaQualityDegrade:", 0);
}

- (void)updateMediaHealthStats:(id *)a3 idsParticipantID:(id)a4
{
  _BOOL4 var1;
  double lastTransitionToFECTime;
  double v9;
  VCConnectionManager *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistories, "objectForKeyedSubscript:", a4))
  {
    if (-[VCConnectionManager useMediaDrivenDuplication](self, "useMediaDrivenDuplication"))
    {
      if (self->_resetMediaHealthStats)
      {
        -[VCConnectionManager resetMediaHealthStats](self, "resetMediaHealthStats");
        self->_resetMediaHealthStats = 0;
      }
      var1 = a3->var1;
      self->_isVideoExpected = var1;
      if (var1)
      {
        -[VCConnectionManager updateMediaDegradedHistoryWithCurrentVideoStallDuration:idsParticipantID:](self, "updateMediaDegradedHistoryWithCurrentVideoStallDuration:idsParticipantID:", a4, a3->var2);
        -[VCConnectionManager aggregateStallTimeDuration:idsParticipantID:](self, "aggregateStallTimeDuration:idsParticipantID:", a3, a4);
      }
      if (self->_isOneToOneModeEnabled)
      {
        lastTransitionToFECTime = self->_lastTransitionToFECTime;
        if (lastTransitionToFECTime != 0.0 && a3->var0 - lastTransitionToFECTime > self->_mediaDegradedThreshold)
        {
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateStallTimeDuration, "objectForKeyedSubscript:", a4), "doubleValue");
          if (v9 > self->_mediaDegradedThreshold)
          {
            v10 = self;
            v11 = 14;
LABEL_25:
            -[VCConnectionManager duplicationStateUpdateWithEvent:](v10, "duplicationStateUpdateWithEvent:", v11, 0);
            return;
          }
        }
        if (a3->var1)
        {
          if (a3->var3 != 0.0)
            return;
        }
        else if (!self->_isPrimaryLinkUsable)
        {
          return;
        }
        v10 = self;
        v11 = 15;
        goto LABEL_25;
      }
    }
    else if (self->_isOneToOneModeEnabled)
    {
      -[VCConnectionManager aggregateStallTimeDuration:idsParticipantID:](self, "aggregateStallTimeDuration:idsParticipantID:", a3, a4);
      -[VCConnectionManager checkMediaQualityDegradedForParticipantID:](self, "checkMediaQualityDegradedForParticipantID:", a4);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315650;
        v15 = v12;
        v16 = 2080;
        v17 = "-[VCConnectionManager updateMediaHealthStats:idsParticipantID:]";
        v18 = 1024;
        v19 = 1503;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Ignoring media health stats update", (uint8_t *)&v14, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCConnectionManager updateMediaHealthStats:idsParticipantID:].cold.1();
  }
}

- (void)updateMediaDegradedHistoryWithValue:(double)a3 idsParticipantID:(id)a4
{
  int v7;

  if (a3 >= 0.0)
  {
    v7 = (int)(objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistoryIndices, "objectForKeyedSubscript:"), "intValue")+ 1)% 5;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mediaDegradedHistoryIndices, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7), a4);
    objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistories, "objectForKeyedSubscript:", a4), "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3), v7);
  }
}

- (BOOL)isDuplicationAllowedForParticipantID:(id)a3 bucketsToSum:(int)a4 threshold:(double)a5
{
  int v9;
  uint64_t v10;
  NSObject *v11;
  signed int v12;
  unsigned int v13;
  double v14;
  double v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((a4 - 6) > 0xFFFFFFFA)
  {
    v9 = a4;
  }
  else
  {
    v9 = 5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136316162;
        v18 = v10;
        v19 = 2080;
        v20 = "-[VCConnectionManager isDuplicationAllowedForParticipantID:bucketsToSum:threshold:]";
        v21 = 1024;
        v22 = 1553;
        v23 = 1024;
        v24 = a4;
        v25 = 1024;
        v26 = 5;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid bucketsToSum %d, defaulting to %d", (uint8_t *)&v17, 0x28u);
      }
    }
  }
  v12 = (int)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistoryIndices, "objectForKeyedSubscript:", a3), "intValue")% 5;
  v13 = v9 + 1;
  v14 = 0.0;
  do
  {
    objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistories, "objectForKeyedSubscript:", a3), "objectAtIndexedSubscript:", v12), "doubleValue");
    v14 = v14 + v15;
    v12 = (v12 + 4) % 5u;
    --v13;
  }
  while (v13 > 1);
  return v14 / (double)v9 * 100.0 > a5;
}

- (void)updateMediaDegradedHistoryWithCurrentVideoStallDuration:(double)a3 idsParticipantID:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  _BYTE v15[24];
  int v16;
  __int16 v17;
  const char *v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[VCConnectionManager updateMediaDegradedHistoryWithValue:idsParticipantID:](self, "updateMediaDegradedHistoryWithValue:idsParticipantID:", a4, a3);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)-[NSMutableDictionary allKeys](self->_mediaDegradedHistories, "allKeys");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isEqual:", &unk_1E9EF5030) & 1) == 0)
          v9 &= -[VCConnectionManager isDuplicationAllowedForParticipantID:bucketsToSum:threshold:](self, "isDuplicationAllowedForParticipantID:bucketsToSum:threshold:", v11, 4, 50.0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  if (self->_isDuplicationAllowedForMediaDegraded != (v9 & 1) && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = "not allowed";
      *(_QWORD *)&v15[4] = v12;
      *(_DWORD *)v15 = 136315906;
      *(_QWORD *)&v15[14] = "-[VCConnectionManager updateMediaDegradedHistoryWithCurrentVideoStallDuration:idsParticipantID:]";
      *(_WORD *)&v15[12] = 2080;
      if ((v9 & 1) != 0)
        v14 = "allowed";
      *(_WORD *)&v15[22] = 1024;
      v16 = 1585;
      v17 = 2080;
      v18 = v14;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Per media criteria, duplication is %s!", v15, 0x26u);
    }
  }
  self->_isDuplicationAllowedForMediaDegraded = v9 & 1;
  -[VCConnectionManager checkForCachedWRMNotification](self, "checkForCachedWRMNotification", *(_OWORD *)v15, *(_QWORD *)&v15[16]);
}

- (void)updateMediaDegradedHistoryWithCurrentAudioErasure:(double)a3 idsParticipantID:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  _BYTE v16[24];
  int v17;
  __int16 v18;
  const char *v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistories, "objectForKeyedSubscript:"))
  {
    -[VCConnectionManager updateMediaDegradedHistoryWithValue:idsParticipantID:](self, "updateMediaDegradedHistoryWithValue:idsParticipantID:", a4, a3);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (void *)-[NSMutableDictionary allKeys](self->_mediaDegradedHistories, "allKeys");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      v11 = 1;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v11 &= -[VCConnectionManager isDuplicationAllowedForParticipantID:bucketsToSum:threshold:](self, "isDuplicationAllowedForParticipantID:bucketsToSum:threshold:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), 4, 50.0);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 1;
    }
    if (self->_isDuplicationAllowedForMediaDegraded != v11 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = "not allowed";
        *(_QWORD *)&v16[4] = v13;
        *(_DWORD *)v16 = 136315906;
        *(_QWORD *)&v16[14] = "-[VCConnectionManager updateMediaDegradedHistoryWithCurrentAudioErasure:idsParticipantID:]";
        *(_WORD *)&v16[12] = 2080;
        if (v11)
          v15 = "allowed";
        *(_WORD *)&v16[22] = 1024;
        v17 = 1604;
        v18 = 2080;
        v19 = v15;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Per media criteria, duplication is %s!", v16, 0x26u);
      }
    }
    self->_isDuplicationAllowedForMediaDegraded = v11;
    -[VCConnectionManager checkForCachedWRMNotification](self, "checkForCachedWRMNotification", *(_OWORD *)v16, *(_QWORD *)&v16[16]);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCConnectionManager updateMediaDegradedHistoryWithCurrentAudioErasure:idsParticipantID:].cold.1();
  }
}

- (void)updateWithRemoteMediaHealthDuplication:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 65552;
  else
    v3 = 16;
  -[VCConnectionManager duplicationStateUpdateWithEvent:](self, "duplicationStateUpdateWithEvent:", v3, 0xAAAA000000000000);
}

- (void)resetMediaHealthStats
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)-[NSMutableDictionary allKeys](self->_mediaDegradedHistories, "allKeys");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_mediaDegradedHistories, "objectForKeyedSubscript:", v8);
        if (objc_msgSend(v9, "count"))
        {
          v10 = 0;
          v11 = 1;
          do
          {
            objc_msgSend(v9, "setObject:atIndexedSubscript:", &unk_1E9EFB138, v10);
            v10 = v11;
          }
          while (objc_msgSend(v9, "count") > (unint64_t)v11++);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_aggregateStallTimeDuration, "setObject:forKeyedSubscript:", &unk_1E9EFB138, v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v5);
  }
}

- (void)addDistinctConnectionInterfaceToSet:(id)a3 withInterfaceType:(int)a4
{
  void *v4;

  v4 = &unk_1E9EF5090;
  if (a4 != 87 && a4 != 69)
  {
    if (a4 != 67)
      return;
    v4 = &unk_1E9EF50A8;
  }
  objc_msgSend(a3, "addObject:", v4);
}

- (BOOL)localOrRemoteHasMultipleInterfaceAvailable:(id)a3 remoteInterface:(id)a4
{
  return (unint64_t)objc_msgSend(a3, "count") > 1 || (unint64_t)objc_msgSend(a4, "count") > 1;
}

- (id)getActiveConnectionRegistryAndUpdateDuplicationPossibility
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t (**v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v22;
  uint64_t v23;
  NSMutableArray *obj;
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
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v22 = objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = self->_connectionArray;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v8 = *(uint64_t (***)(_QWORD))(*((_QWORD *)&v31 + 1) + 8 * i);
        if (self->_isOneToOneModeEnabled)
        {
          if (!VCConnection_IsEndToEndLink(*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i)))
            continue;
          if (self->_isOneToOneModeEnabled)
            goto LABEL_10;
        }
        if ((VCConnection_IsEndToEndLink((uint64_t)v8) & 1) == 0)
        {
LABEL_10:
          v9 = VCConnection_ReportingConnectionInterface(v8, 1);
          v10 = VCConnection_ReportingConnectionInterface(v8, 0);
          v11 = (void *)MEMORY[0x1E0CB3940];
          v12 = VCConnection_ReportingIPVersion((uint64_t)v8);
          v13 = objc_msgSend(v11, "stringWithFormat:", CFSTR("%c%c%d%c"), v9, v10, v12, VCConnection_ReportingConnectionType((uint64_t)v8));
          if (objc_msgSend(v3, "objectForKeyedSubscript:", v13))
          {
            v14 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v13), "unsignedIntValue")+ 1);
            v15 = v3;
          }
          else
          {
            v15 = v3;
            v14 = &unk_1E9EF5060;
          }
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v13);
          -[VCConnectionManager addDistinctConnectionInterfaceToSet:withInterfaceType:](self, "addDistinctConnectionInterfaceToSet:withInterfaceType:", v23, v9);
          -[VCConnectionManager addDistinctConnectionInterfaceToSet:withInterfaceType:](self, "addDistinctConnectionInterfaceToSet:withInterfaceType:", v22, v10);
        }
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    }
    while (v5);
  }
  self->_multipleInterfacesAvailable = 0;
  if (-[VCConnectionManager localOrRemoteHasMultipleInterfaceAvailable:remoteInterface:](self, "localOrRemoteHasMultipleInterfaceAvailable:remoteInterface:", v23, v22))
  {
    self->_multipleInterfacesAvailable = 1;
  }
  v16 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v3);
        objc_msgSend(v16, "appendFormat:", CFSTR("%@:%@,"), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j), objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j)));
      }
      v18 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v18);
  }
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v16, "deleteCharactersInRange:", objc_msgSend(v16, "length") - 1, 1);

  return v16;
}

- (void)configureNWConnectionMonitor:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if (self->_isNWConnectionMonitorEnabled)
  {
    if (VCConnection_IsLocalOnWiFi((uint64_t)a3))
    {
      self->_ignoreNWConnectionMonitorNotification = 0;
      v5 = objc_msgSend(a3, "localInterfaceName");
      if (v5)
      {
        v6 = v5;
        if (!-[NSString isEqualToString:](self->_nwMonitorInterfaceName, "isEqualToString:", v5))
        {

          self->_nwMonitorInterfaceName = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v6);
          -[VCConnectionManager renewNWMonitor](self, "renewNWMonitor");
        }
      }
    }
    else
    {
      self->_ignoreNWConnectionMonitorNotification = 1;
    }
  }
}

- (void)setupNetworkConditionMonitor
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCConnectionManager setupNetworkConditionMonitor]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, (uint64_t)v0, " [%s] %s:%d VCConnectionManager init failed! Failed to createnetwork condition monitor result=%d", v1);
  OUTLINED_FUNCTION_3();
}

- (void)startBrokenNetworkDetection
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 brokenBackhaulDetectionStarted;
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
  -[VCLinkProbingHandler startActiveProbingQRLink](self->_linkProbingHandler, "startActiveProbingQRLink");
  self->_brokenBackhaulDetectionStarted = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      brokenBackhaulDetectionStarted = self->_brokenBackhaulDetectionStarted;
      v6 = 136315906;
      v7 = v3;
      v8 = 2080;
      v9 = "-[VCConnectionManager startBrokenNetworkDetection]";
      v10 = 1024;
      v11 = 1813;
      v12 = 1024;
      v13 = brokenBackhaulDetectionStarted;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCM: _brokenBackhaulDetectionStarted=%d ", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)stopBrokenNetworkDetection
{
  -[VCLinkProbingHandler stopActiveProbingQRLink](self->_linkProbingHandler, "stopActiveProbingQRLink");
}

uint64_t __VCConnectionManager_DidUpdateNetworkCondition_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  int v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(unsigned __int8 *)(a1 + 40);
      v5 = *(unsigned __int8 *)(a1 + 41);
      v6 = *(unsigned __int8 *)(a1 + 42);
      v8 = 136316418;
      v9 = v2;
      v10 = 2080;
      v11 = "VCConnectionManager_DidUpdateNetworkCondition_block_invoke";
      v12 = 1024;
      v13 = 1824;
      v14 = 1024;
      v15 = v4;
      v16 = 1024;
      v17 = v5;
      v18 = 1024;
      v19 = v6;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCCM: Received network condition monitor update: isLocalNetworkQualityBad=%d isRemoteNetworkQualityBad=%d didLocalNetworkQualityChange=%d", (uint8_t *)&v8, 0x2Eu);
    }
  }
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "didLocalNetworkQualityChange:isLocalNetworkQualityBad:isRemoteNetworkQualityBad:", *(unsigned __int8 *)(a1 + 42), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
  return result;
}

- (void)didUpdateMotionActivity:(id)a3
{
  _opaque_pthread_rwlock_t *p_stateRWlock;
  _BOOL4 enableMotionBasedDuplication;
  _BOOL4 isUserMoving;
  VCCoreMotionManager *v8;
  opaqueRTCReporting *reportingAgent;
  CFTypeRef v10;
  int IntValueForKey;
  BOOL v12;
  _BOOL8 v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_rdlock(&self->_stateRWlock);
  enableMotionBasedDuplication = self->_enableMotionBasedDuplication;
  isUserMoving = self->_isUserMoving;
  v8 = self->_coreMotionManager;
  reportingAgent = self->_reportingAgent;
  if (reportingAgent)
    v10 = CFRetain(reportingAgent);
  else
    v10 = 0;
  pthread_rwlock_unlock(p_stateRWlock);
  if (enableMotionBasedDuplication)
  {
    IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("forceUserMoving"), 0);
    v12 = -[VCCoreMotionManager getMotionActivityValueForMotionActivity:](v8, "getMotionActivityValueForMotionActivity:", a3) != 2&& IntValueForKey == 0;
    v13 = !v12;
    if (isUserMoving != v13)
    {
      pthread_rwlock_wrlock(p_stateRWlock);
      -[VCDuplicationHandler setIsUserMoving:](self->_duplicationHandler, "setIsUserMoving:", v13);
      self->_isUserMoving = v13;
      pthread_rwlock_unlock(p_stateRWlock);
      if (v13)
        -[VCConnectionManager checkForCachedWRMNotification](self, "checkForCachedWRMNotification");
    }
  }
  v14[0] = CFSTR("CMActivityValue");
  v14[1] = CFSTR("CMActivityConfidence");
  v15[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[VCCoreMotionManager getMotionActivityValueForMotionActivity:](v8, "getMotionActivityValueForMotionActivity:", a3));
  v15[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "confidence"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  reportingGenericEvent();

  if (v10)
    CFRelease(v10);
}

- (void)checkpointPrimaryConnection:(id)a3
{
  int IsLocalOnCellular;
  int IsRemoteOnCellular;
  int IsLocalOnWiFi;
  int IsRemoteOnWiFi;
  int IsRelay;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *v15;
  int v16;
  int v17;
  unsigned int callID;
  const char *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
    IsRemoteOnCellular = VCConnection_IsRemoteOnCellular((uint64_t)a3);
    IsLocalOnWiFi = VCConnection_IsLocalOnWiFi((uint64_t)a3);
    IsRemoteOnWiFi = VCConnection_IsRemoteOnWiFi((uint64_t)a3);
    IsRelay = VCConnection_IsRelay((uint64_t)a3);
    MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCConnectionManager-primaryConnectionChanged");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = VCConnection_Priority((uint64_t)a3);
        v13 = "secondary";
        if (v12 == 2)
          v13 = "primary";
        v25 = v13;
        v14 = "wired";
        if (IsLocalOnWiFi)
          v15 = "wifi";
        else
          v15 = "wired";
        if (IsLocalOnCellular)
          v15 = "cellular";
        if (IsRemoteOnWiFi)
          v14 = "wifi";
        if (IsRemoteOnCellular)
          v14 = "cellular";
        v23 = v14;
        v24 = v15;
        v16 = objc_msgSend(a3, "uplinkBitrateCap");
        v17 = objc_msgSend(a3, "downlinkBitrateCap");
        callID = self->_callID;
        if (IsRelay)
          v19 = "Relay";
        else
          v19 = "P2P";
        if (VCConnection_IsIPv6((uint64_t)a3))
          v20 = "IPV6";
        else
          v20 = "IPV4";
        *(_DWORD *)buf = 136318210;
        v27 = v10;
        v28 = 2080;
        v29 = "-[VCConnectionManager checkpointPrimaryConnection:]";
        v30 = 1024;
        v31 = 1887;
        v32 = 2080;
        v33 = v25;
        v34 = 2080;
        v35 = v24;
        v36 = 2080;
        v37 = v23;
        v38 = 1024;
        v39 = v16;
        v40 = 1024;
        v41 = v17;
        v42 = 1024;
        v43 = callID;
        v44 = 2080;
        v45 = v19;
        v46 = 2080;
        v47 = v20;
        v48 = 1024;
        v49 = objc_msgSend(a3, "isVirtualRelayLink");
        v50 = 2112;
        v51 = objc_msgSend(a3, "connectionUUID");
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCConnectionManager-primaryConnectionChanged type=%s, localInterface=%s, remoteInterface=%s, uplinkBitrateCap=%u, downlinkBitrateCap=%u, callID=%u, connectionType=%s, addressType=%s, isVirtualRelay=%d, linkUUID=%@", buf, 0x70u);
      }
    }
    if (self->_overlaySource)
    {
      if (VCConnection_Priority((uint64_t)a3) == 2)
        _VCConnectionManager_SetOverlayLinkDetails((uint64_t)self, (uint64_t)a3, 0, 0);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v27 = v21;
      v28 = 2080;
      v29 = "-[VCConnectionManager checkpointPrimaryConnection:]";
      v30 = 1024;
      v31 = 1871;
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nil connection passed", buf, 0x1Cu);
    }
  }
}

- (BOOL)hasSameReportingConfig:(id)a3 oldPrimaryConnection:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int IsRelay;
  int v12;
  BOOL v13;
  int v14;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  BOOL result;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  _BOOL4 isOneToOneModeEnabled;
  const char *v28;
  const char *v29;
  const char *v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a3, 1);
  v8 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a3, 0);
  v9 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a4, 1);
  v10 = VCConnectionManager_ConnectionInterfaceType((uint64_t)a4, 0);
  IsRelay = VCConnection_IsRelay((uint64_t)a3);
  v12 = VCConnection_IsRelay((uint64_t)a4);
  if (v7)
    v13 = v9 == 0;
  else
    v13 = 1;
  v14 = !v13;
  if (!self->_isOneToOneModeEnabled)
  {
    if ((v14 & 1) != 0)
    {
      v22 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
      return objc_msgSend(v22, "isEqualToString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9));
    }
LABEL_20:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v25)
        return result;
      v26 = "NO";
      isOneToOneModeEnabled = self->_isOneToOneModeEnabled;
      v31 = 136316930;
      v32 = v23;
      if (v7)
        v28 = "NO";
      else
        v28 = "YES";
      v34 = "-[VCConnectionManager hasSameReportingConfig:oldPrimaryConnection:]";
      v36 = 1912;
      if (v9)
        v29 = "NO";
      else
        v29 = "YES";
      v33 = 2080;
      if (v8)
        v30 = "NO";
      else
        v30 = "YES";
      v35 = 1024;
      v37 = 1024;
      if (!v10)
        v26 = "YES";
      v38 = isOneToOneModeEnabled;
      v39 = 2080;
      v40 = v28;
      v41 = 2080;
      v42 = v29;
      v43 = 2080;
      v44 = v30;
      v45 = 2080;
      v46 = v26;
      _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d All values do not exist isOneToOne=%d newLocalInterfaceMissing=%s oldlocalInterfaceMissing=%s newRemoteInterfaceMissing=%s oldRemoteInterfaceMissing=%s", (uint8_t *)&v31, 0x4Au);
    }
    return 0;
  }
  if (!v8)
    v14 = 0;
  if (v14 != 1 || v10 == 0)
    goto LABEL_20;
  v16 = v12;
  v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
  v18 = objc_msgSend(v17, "isEqualToString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9));
  v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v20 = objc_msgSend(v19, "isEqualToString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10)) & (IsRelay ^ v16 ^ 1);
  if (v18)
    return v20;
  else
    return 0;
}

- (void)primaryConnectionChanged:(id)a3 oldPrimaryConnection:(id)a4
{
  int IsLocalOnCellular;
  int v8;
  uint64_t v9;
  NSObject *delegateQueue;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[8];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  VCConnectionManager_UseCellPrimaryInterface((uint64_t)self, IsLocalOnCellular);
  -[VCConnectionManager updateWRMDuplicationForHandover](self, "updateWRMDuplicationForHandover");
  v8 = VCConnection_IsLocalOnCellular((uint64_t)a3);
  _VCConnectionManager_ChecklocalRATTypeOverrideDefaultValue((uint64_t)self, v8);
  if (!-[VCConnectionManager hasSameReportingConfig:oldPrimaryConnection:](self, "hasSameReportingConfig:oldPrimaryConnection:", a3, a4))
  {
    *(_OWORD *)&self->_mediaCellularTxBytes = 0u;
    *(_OWORD *)&self->_mediaWifiTxBytes = 0u;
    *(_OWORD *)&self->_signalingExcessiveCellularTxBytes = 0u;
    *(_OWORD *)&self->_budgetConsumingCellularTxBytes = 0u;
    *(_OWORD *)&self->_mediaExcessiveCellularTxBytes = 0u;
  }
  -[VCConnectionManager configureNWConnectionMonitor:](self, "configureNWConnectionMonitor:", a3);
  if (VCConnection_IsLocalOnCellular((uint64_t)a3)
    && !-[VCDuplicationHandler allowDuplication](self->_duplicationHandler, "allowDuplication"))
  {
    -[VCDuplicationHandler setAllowDuplication:](self->_duplicationHandler, "setAllowDuplication:", 1);
  }
  -[VCConnectionManager delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = _VCConnectionManager_CopyConnectionForQualityInternal(self, 1);
    delegateQueue = self->_delegateQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__VCConnectionManager_primaryConnectionChanged_oldPrimaryConnection___block_invoke;
    v14[3] = &unk_1E9E54D20;
    v14[4] = self;
    v14[5] = a3;
    v14[6] = a4;
    v14[7] = v9;
    dispatch_async(delegateQueue, v14);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    v13 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v16 = v11;
        v17 = 2080;
        v18 = "-[VCConnectionManager primaryConnectionChanged:oldPrimaryConnection:]";
        v19 = 1024;
        v20 = 1949;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCConnectionManager: Delegate didn't implement primaryConnectionChanged", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      -[VCConnectionManager primaryConnectionChanged:oldPrimaryConnection:].cold.1();
    }
  }
}

void __69__VCConnectionManager_primaryConnectionChanged_oldPrimaryConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  char IsLocalOnCellular;
  const void *v4;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "primaryConnectionChanged:oldPrimaryConnection:activeConnection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 808);
  IsLocalOnCellular = VCConnection_IsLocalOnCellular(*(_QWORD *)(a1 + 56));
  VCNetworkConditionMonitor_SetIsLocalActiveOnCellular(v2, IsLocalOnCellular);
  v4 = *(const void **)(a1 + 56);
  if (v4)
    CFRelease(v4);
}

- (void)renewNWMonitor
{
  NSObject *nwConnectionMonitorQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  nwConnectionMonitorQueue = self->_nwConnectionMonitorQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__VCConnectionManager_renewNWMonitor__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(nwConnectionMonitorQueue, v3);
}

uint64_t __37__VCConnectionManager_renewNWMonitor__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int16 v4;
  uint64_t v5;
  uint64_t result;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "destroyNWMonitorInternal");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2936), "UTF8String");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2936), "length");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 792);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__VCConnectionManager_renewNWMonitor__block_invoke_2;
  v7[3] = &unk_1E9E521C0;
  v7[4] = v2;
  result = VCNWConnectionMonitor_CreateWithInterfaceName(v3, v4, 0, v5, (uint64_t)v7);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 776) = result;
  return result;
}

uint64_t __37__VCConnectionManager_renewNWMonitor__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "setVCNWConnectionMonitorStatisticsHandler");
}

- (void)setVCNWConnectionMonitorStatisticsHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_nwConnectionMonitorQueue);
  VCNWConnectionMonitor_SetStatisticsHandler(self->_nwMonitor, (uint64_t)self->_nwConnectionMonitorQueue, (uint64_t)self, (uint64_t)_VCConnectionManagerNWConnectionStatisticsCallback);
}

- (void)destroyNWMonitor
{
  NSObject *nwConnectionMonitorQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  if (self->_nwMonitor)
  {
    nwConnectionMonitorQueue = self->_nwConnectionMonitorQueue;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __39__VCConnectionManager_destroyNWMonitor__block_invoke;
    v3[3] = &unk_1E9E521C0;
    v3[4] = self;
    dispatch_sync(nwConnectionMonitorQueue, v3);
  }
}

uint64_t __39__VCConnectionManager_destroyNWMonitor__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "destroyNWMonitorInternal");
}

- (void)destroyNWMonitorInternal
{
  tagVCNWConnectionMonitor *nwMonitor;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_nwConnectionMonitorQueue);
  nwMonitor = self->_nwMonitor;
  if (nwMonitor)
  {
    VCNWConnectionMonitor_Destroy((uint64_t)nwMonitor);
    self->_nwMonitor = 0;
  }
}

- (void)disableRemotePreferredInterfaceInference:(BOOL)a3
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
  self->_disableRemoteInterfaceInference = a3;
  if (self->_duplicateImportantPktsEnabled && (self->_connectionSelectionVersion - 2) <= 4)
  {
    self->_disableRemoteInterfaceInference = 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315650;
        v6 = v3;
        v7 = 2080;
        v8 = "-[VCConnectionManager disableRemotePreferredInterfaceInference:]";
        v9 = 1024;
        v10 = 2002;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: force to disable remote preferred interface inference", (uint8_t *)&v5, 0x1Cu);
      }
    }
  }
}

- (int)getConnectionSelectionVersionFromFrameworkVersion:(id)a3
{
  if (objc_msgSend(a3, "compare:", CFSTR("1476")) == -1)
    return 1;
  if (objc_msgSend(a3, "compare:", CFSTR("1651")) == -1)
    return 2;
  if (objc_msgSend(a3, "compare:", CFSTR("1885")) == -1)
    return 3;
  if (objc_msgSend(a3, "compare:", CFSTR("2005")) == -1)
    return 4;
  if (objc_msgSend(a3, "compare:", CFSTR("2045")) == -1)
    return 5;
  return 6;
}

- (void)promoteSecondaryConnectionToPrimary:(id)a3
{
  VCConnection_SetPriority((uint64_t)a3, 2);
  -[VCConnectionManager useConnectionAsPrimary:](self, "useConnectionAsPrimary:", a3);
  -[VCConnectionManager setSecondaryConnection:](self, "setSecondaryConnection:", 0);
}

- (BOOL)isBetterConnection:(id)a3 asPrimary:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;

  v4 = a4;
  if (a4)
    v7 = -[VCConnectionManager getPrimaryConnectionToBeCompared](self, "getPrimaryConnectionToBeCompared");
  else
    v7 = -[VCConnectionManager getSecondaryConnectionToBeCompared](self, "getSecondaryConnectionToBeCompared");
  v8 = v7;
  return (VCConnection_Equal((uint64_t)a3, v7) & 1) == 0
      && objc_msgSend(a3, "compare:isPrimary:selectionPolicy:", v8, v4, -[VCConnectionManager getConnectionSelectionPolicy](self, "getConnectionSelectionPolicy")) == 1;
}

- (BOOL)isOptimalConnection:(id)a3 asPrimary:(BOOL)a4 interfaceMask:(int)a5
{
  char v5;
  int IsLocalOnWiFi;
  unsigned int v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  int IsLocalOnCellular;
  unsigned int v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    IsLocalOnWiFi = VCConnection_IsLocalOnWiFi((uint64_t)a3);
    v8 = ((v5 & 4) == 0) ^ VCConnection_IsRemoteOnWiFi((uint64_t)a3);
    if (((v5 & 1) == 0) == IsLocalOnWiFi)
      v9 = 0;
    else
      v9 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v12 = "<nil>";
        v17 = "is not";
        v21 = 136316162;
        v22 = v10;
        v24 = "-[VCConnectionManager isOptimalConnection:asPrimary:interfaceMask:]";
        v23 = 2080;
        if (v9)
          v17 = "is";
        v25 = 1024;
        v26 = 2058;
        v27 = 2080;
        v28 = v12;
        v29 = 2080;
        v30 = v17;
        v18 = " [%s] %s:%d HandoverReport: connection %s %s optimal primary connection";
LABEL_24:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v21, 0x30u);
      }
    }
  }
  else
  {
    IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
    v14 = ((v5 & 8) == 0) ^ VCConnection_IsRemoteOnCellular((uint64_t)a3);
    if (((v5 & 2) == 0) == IsLocalOnCellular)
      v9 = 0;
    else
      v9 = v14;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
          v16 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        else
          v16 = "<nil>";
        v19 = "is not";
        v21 = 136316162;
        v22 = v15;
        v24 = "-[VCConnectionManager isOptimalConnection:asPrimary:interfaceMask:]";
        v23 = 2080;
        if (v9)
          v19 = "is";
        v25 = 1024;
        v26 = 2067;
        v27 = 2080;
        v28 = v16;
        v29 = 2080;
        v30 = v19;
        v18 = " [%s] %s:%d HandoverReport: connection %s %s optimal secondary connection";
        goto LABEL_24;
      }
    }
  }
  return v9;
}

- (void)updateWRMDuplicationForHandover
{
  double v3;
  int isPrimaryLocalUsingCell;
  const void *v5;
  int IsLocalOnCellular;
  int v7;
  int v8;
  int v9;
  double v10;
  unsigned int v11;
  double v12;
  NSObject *callbackQueue;
  const void *v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  const char *v19;
  int v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = micro();
  isPrimaryLocalUsingCell = self->_isPrimaryLocalUsingCell;
  v5 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)v5);
  self->_isPrimaryLocalUsingCell = IsLocalOnCellular;
  if (v5)
  {
    CFRelease(v5);
    v7 = self->_isPrimaryLocalUsingCell;
  }
  else
  {
    v7 = IsLocalOnCellular;
  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x3010000000;
  v19 = "";
  v22 = 0;
  if (self->_isAudioOnly)
    v8 = 1;
  else
    v8 = 2;
  v20 = v8;
  v21 = isPrimaryLocalUsingCell == 0;
  if (v7)
    v9 = 4;
  else
    v9 = 5;
  LODWORD(v22) = v9;
  -[VCWRMHandler localLinkTypeSuggestionChangeTime](self->_wrmHandler, "localLinkTypeSuggestionChangeTime");
  if (v10 == 0.0)
  {
    v11 = 0;
  }
  else
  {
    -[VCWRMHandler localLinkTypeSuggestionChangeTime](self->_wrmHandler, "localLinkTypeSuggestionChangeTime");
    v11 = ((v3 - v12) * 1000.0);
  }
  *((_DWORD *)v17 + 11) = v11;
  if (isPrimaryLocalUsingCell != v7 && self->_wrmStatusUpdateCallback)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__VCConnectionManager_updateWRMDuplicationForHandover__block_invoke;
    block[3] = &unk_1E9E522B0;
    block[4] = self;
    block[5] = &v16;
    dispatch_async(callbackQueue, block);
  }
  _VCConnectionManager_ProcessDuplicationStateUpdateEvent((uint64_t)self, 10, 0, isPrimaryLocalUsingCell != v7, 0, 0, 0);
  if (!-[VCConnectionManager isDuplicationAllowed](self, "isDuplicationAllowed"))
  {
    v14 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
    if (VCConnection_IsLocalOnWiFi((uint64_t)v14)
      && self->_savedWRMNotification.applicationType
      && !-[VCWRMHandler localWRMLinkTypeSuggestion](self->_wrmHandler, "localWRMLinkTypeSuggestion"))
    {
      self->_isWRMNotificationPending = 1;
      if (!v14)
        goto LABEL_23;
    }
    else if (!v14)
    {
      goto LABEL_23;
    }
    CFRelease(v14);
    goto LABEL_23;
  }
  _VCConnectionManager_ProcessDuplicationStateUpdateEvent((uint64_t)self, ((unint64_t)(-[VCWRMHandler remoteWRMLinkTypeSuggestion](self->_wrmHandler, "remoteWRMLinkTypeSuggestion") != 0) << 40) | ((unint64_t)(-[VCWRMHandler localWRMLinkTypeSuggestion](self->_wrmHandler, "localWRMLinkTypeSuggestion") != 0) << 32) | ((unint64_t)self->_isPrimaryLocalUsingCell << 24) | 0xB, 0, isPrimaryLocalUsingCell != v7, 0, 1, 0);
LABEL_23:
  _Block_object_dispose(&v16, 8);
}

uint64_t __54__VCConnectionManager_updateWRMDuplicationForHandover__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 704))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 720), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
}

void __VCConnectionManager_CreatePacketRoutingInfoList_block_invoke(uint64_t a1)
{
  VCConnectionManager_UpdateNetworkOutageStatus(*(_QWORD *)(a1 + 32), 0);
}

- (BOOL)isLocalCellularInterfaceUsed
{
  _opaque_pthread_rwlock_t *p_stateRWlock;
  const void *v4;
  char IsLocalOnCellular;
  char v6;

  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_rdlock(&self->_stateRWlock);
  v4 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
  IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)v4);
  if (v4)
    CFRelease(v4);
  v6 = VCConnection_IsLocalOnCellular((uint64_t)-[VCConnectionManager secondaryConnection](self, "secondaryConnection")) | IsLocalOnCellular;
  pthread_rwlock_unlock(p_stateRWlock);
  return v6;
}

- (void)reportConnection:(id)a3 isInitialConnection:(BOOL)a4
{
  objc_msgSend(a3, "type");
  reportingConnectionType();
  -[VCConnectionManager reportLinkSuggestion](self, "reportLinkSuggestion");
}

- (void)reportConnectionUpdateWithRespCode:(unsigned __int16)a3
{
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[1] = CFSTR("DuplicationMultiLinkAvailable");
  v5[0] = -[VCConnectionManager getActiveConnectionRegistryAndUpdateDuplicationPossibility](self, "getActiveConnectionRegistryAndUpdateDuplicationPossibility");
  v4[0] = CFSTR("ACAS");
  v5[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_multipleInterfacesAvailable);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  reportingGenericEvent();
}

- (void)reportConnectionUpdateWithResponseCode:(unsigned __int16)a3 delay:(double)a4
{
  dispatch_time_t v6;
  NSObject *reportingQueue;
  _QWORD block[5];
  unsigned __int16 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  reportingQueue = self->_reportingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCConnectionManager_reportConnectionUpdateWithResponseCode_delay___block_invoke;
  block[3] = &unk_1E9E52A50;
  block[4] = self;
  v9 = a3;
  dispatch_after(v6, reportingQueue, block);
}

uint64_t __68__VCConnectionManager_reportConnectionUpdateWithResponseCode_delay___block_invoke(uint64_t a1)
{
  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(*(id *)(a1 + 32), "reportConnectionUpdateWithRespCode:", *(unsigned __int16 *)(a1 + 40));
  return pthread_rwlock_unlock((pthread_rwlock_t *)(*(_QWORD *)(a1 + 32) + 96));
}

- (void)setDefaultLinkProbingCapabilityVersionForDeviceRole:(int)a3
{
  double v4;
  double v5;
  unsigned __int8 v6;
  uint64_t v7;
  NSObject *v8;
  int linkProbingCapabilityVersion;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3
    || (v4 = (double)arc4random() / 4294967300.0,
        objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-feature-threshold"), CFSTR("linkProbingFeatureThreshold"), &unk_1E9EFB198, 1), "doubleValue"), v4 > v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-link-probing-capability-version"), CFSTR("linkProbingCapabilityVersion"), &unk_1E9EF50C0, 0), "unsignedIntValue");
  }
  self->_linkProbingCapabilityVersion = v6;
  -[VCLinkProbingHandler setLinkProbingCapabilityVersion:](self->_linkProbingHandler, "setLinkProbingCapabilityVersion:", v6);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      linkProbingCapabilityVersion = self->_linkProbingCapabilityVersion;
      v10 = 136315906;
      v11 = v7;
      v12 = 2080;
      v13 = "-[VCConnectionManager setDefaultLinkProbingCapabilityVersionForDeviceRole:]";
      v14 = 1024;
      v15 = 2433;
      v16 = 1024;
      v17 = linkProbingCapabilityVersion;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Link probing capability version on local: %d", (uint8_t *)&v10, 0x22u);
    }
  }
}

- (void)setRemoteLinkProbingCapabilityVersion:(unsigned __int8)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int remoteLinkProbingCapabilityVersion;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  self->_remoteLinkProbingCapabilityVersion = a3;
  v16[0] = CFSTR("lnkPrbVers");
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_linkProbingCapabilityVersion);
  v16[1] = CFSTR("remLnkPrbVers");
  v17[0] = v4;
  v17[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_remoteLinkProbingCapabilityVersion);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  reportingGenericEvent();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      remoteLinkProbingCapabilityVersion = self->_remoteLinkProbingCapabilityVersion;
      v8 = 136315906;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCConnectionManager setRemoteLinkProbingCapabilityVersion:]";
      v12 = 1024;
      v13 = 2442;
      v14 = 1024;
      v15 = remoteLinkProbingCapabilityVersion;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Link probing capability version on remote: %d", (uint8_t *)&v8, 0x22u);
    }
  }
}

- (double)primaryConnHealthAllowedDelay
{
  double result;

  -[VCConnectionHealthMonitor primaryConnHealthAllowedDelay](self->_connectionHealthMonitor, "primaryConnHealthAllowedDelay");
  return result;
}

- (int)setConnectionHealthOnControlInfo:(void *)a3
{
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_startConnectionHealthMonitoring && self->_supportDuplication)
  {
    v5 = -[VCConnectionHealthMonitor generateStatsBlob](self->_connectionHealthMonitor, "generateStatsBlob");
    if (v5)
      VCMediaControlInfoSetInfo(a3, (const char *)2, (uint64_t)&v5, 4);
  }
  return 0;
}

- (int)processConnectionHealthFromControlInfo:(void *)a3
{
  int Info;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!self->_startConnectionHealthMonitoring
    || !self->_supportDuplication
    || !VCMediaControlInfoHasInfo(a3, (const char *)2))
  {
    return 0;
  }
  v7 = -1431655766;
  Info = VCMediaControlInfoGetInfo(a3, (const char *)2, (uint64_t)&v7, 4, 0);
  if ((Info & 0x80000000) == 0)
    -[VCConnectionHealthMonitor processPeerStatsBlob:](self->_connectionHealthMonitor, "processPeerStatsBlob:", v7);
  return Info;
}

- (void)useConnectionAsPrimary:(id)a3
{
  VCConnectionManager_SetPrimaryConnection((uint64_t)self);
  -[VCConnectionManager setLastPrimaryConnectionInUse:](self, "setLastPrimaryConnectionInUse:", a3);
}

- (int)addConnection:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager addConnection:]"), 0));
}

- (int)removeConnection:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager removeConnection:]"), 0));
}

- (void)updateCellularMTU:(int)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager updateCellularMTU:]"), 0));
}

- (void)updateCellularTech:(int)a3 forLocalInterface:(BOOL)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCConnectionManager updateCellularTech:forLocalInterface:]"), 0));
}

- (void)updateOneToOneBitrateCapsForConnection:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager updateOneToOneBitrateCapsForConnection:]"), 0));
}

- (void)updateAllBitrateCapsForConnection:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager updateAllBitrateCapsForConnection:]"), 0));
}

- (BOOL)shouldAcceptDataFromSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager shouldAcceptDataFromSourceDestinationInfo:]"), 0));
}

- (void)reportLinkProbingStatsWithDuplicationJustStarted:(BOOL)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager reportLinkProbingStatsWithDuplicationJustStarted:]"), 0));
}

- (void)updateNegotiatedSettingsOnetoOne:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager updateNegotiatedSettingsOnetoOne:]"), 0));
}

- (void)updateDuplicationStateWithEventType:(unsigned __int8)a3
{
  if ((VCDuplicationHandler_HandleDuplicationStateUpdateEvent(self->_duplicationHandler, a3, 0) & 1) != 0)
    VCConnectionManager_SetDuplicationEnabledInternal((uint64_t)self, -[VCConnectionManager isDuplicationEnabled](self, "isDuplicationEnabled"));
}

- (void)reportNoPacketUpdateUsingCurrentTime:(double)a3 lastReceivedPacketTime:(double)a4
{
  double v5;
  BOOL v6;

  if (self->_isOneToOneModeEnabled && (a4 != 0.0 || self->_startConnectionHealthMonitoring))
  {
    v5 = a3 - a4;
    v6 = v5 > 1.0;
    if (v5 <= 1.0)
    {
      if (self->_previousNoRemoteInProgress)
LABEL_8:
        reportingNoRemoteChanged();
    }
    else if (!self->_previousNoRemoteInProgress)
    {
      goto LABEL_8;
    }
    self->_previousNoRemoteInProgress = v6;
  }
}

- (void)connectionHealthDidUpdate:(int)a3 isLocalConnection:(BOOL)a4
{
  uint64_t v4;
  char *v6;

  v4 = 568;
  if (a4)
    v4 = 520;
  v6 = (char *)self + v4;
  switch(a3)
  {
    case 0:
      -[VCConnectionManager updateConnectionStatsWithIndicatorNone:](self, "updateConnectionStatsWithIndicatorNone:", v6);
      break;
    case 1:
      -[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:](self, "updateConnectionStatsWithIndicatorNoPacket:", v6);
      break;
    case 2:
      -[VCConnectionManager updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:](self, "updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:", v6);
      break;
    case 3:
      -[VCConnectionManager updateConnectionStatsWithIndicatorPrimaryImproved:](self, "updateConnectionStatsWithIndicatorPrimaryImproved:", v6);
      break;
    default:
      return;
  }
}

- (void)updateConnectionStatsWithIndicatorNoPacket:(id *)a3
{
  int var6;
  double v6;
  double noRemoteDuplicationThresholdFast;
  uint64_t v8;
  NSObject *v9;
  double var4;
  double v11;
  double v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  double v22;
  const void *v23;
  uint64_t v24;
  NSObject *v25;
  _BYTE v26[24];
  int v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!self->_localConnectionStats.isConnectionPaused && !self->_remoteConnectionStats.isConnectionPaused)
  {
    var6 = a3->var6;
    v6 = micro();
    noRemoteDuplicationThresholdFast = 4.0;
    if (-[VCWifiAssistManager isAvailable](self->_vcWifiAssist, "isAvailable") && self->_fastMediaDuplicationEnabled)
      noRemoteDuplicationThresholdFast = self->_noRemoteDuplicationThresholdFast;
    if (a3->var0 == 0.0 && !self->_startConnectionHealthMonitoring)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v26 = 136315906;
          *(_QWORD *)&v26[4] = v24;
          *(_WORD *)&v26[12] = 2080;
          *(_QWORD *)&v26[14] = "-[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:]";
          *(_WORD *)&v26[22] = 1024;
          v27 = 2718;
          v28 = 1024;
          LODWORD(v29) = var6 == 0;
          _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LastReceivedPacketTime has not been set isLocalConnection=%d", v26, 0x22u);
        }
      }
    }
    else
    {
      a3->var4 = v6 - a3->var0;
      if (!var6)
        -[VCConnectionManager reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:](self, "reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:", v6);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          var4 = a3->var4;
          v11 = self->_noRemoteDuplicationThresholdFast;
          *(_DWORD *)v26 = 136316418;
          *(_QWORD *)&v26[4] = v8;
          *(_WORD *)&v26[12] = 2080;
          *(_QWORD *)&v26[14] = "-[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:]";
          *(_WORD *)&v26[22] = 1024;
          v27 = 2727;
          v28 = 2048;
          v29 = noRemoteDuplicationThresholdFast;
          v30 = 2048;
          v31 = var4;
          v32 = 2048;
          v33 = v11;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Using noPacketThreshold=%.2f noPacketInterval:%.2f noRemoteDuplicationThresholdFast:%.2f", v26, 0x3Au);
        }
      }
      v12 = a3->var4;
      if (var6)
      {
        self->_remoteNoRemotePacketInterval = v12;
        if (a3->var0 != 0.0 && v6 - a3->var2 > 1.0)
        {
          VTP_NotifyRemoteNoRemotePacket(self->_callID, a3->var4);
          a3->var2 = v6;
        }
      }
      else
      {
        self->_noRemotePacketInterval = v12;
      }
      pthread_rwlock_wrlock(&self->_stateRWlock);
      if (VCDuplicationHandler_DuplicationReason((uint64_t)self->_duplicationHandler)
        || a3->var4 <= noRemoteDuplicationThresholdFast
        || a3->var0 == 0.0)
      {
        pthread_rwlock_unlock(&self->_stateRWlock);
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v15 = "remote-no-remote";
            v16 = a3->var4;
            *(_DWORD *)v26 = 136316162;
            if (!var6)
              v15 = "no-remote";
            *(_QWORD *)&v26[4] = v13;
            *(_WORD *)&v26[12] = 2080;
            *(_QWORD *)&v26[14] = "-[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:]";
            *(_WORD *)&v26[22] = 1024;
            v27 = 2747;
            v28 = 2080;
            v29 = *(double *)&v15;
            v30 = 2048;
            v31 = v16;
            _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Receive and cache internal suggestion to duplication, %s packets for %.6f seconds.", v26, 0x30u);
          }
        }
        -[VCConnectionManager updateDuplicationStateWithEventType:](self, "updateDuplicationStateWithEventType:", 2 * (var6 != 0), *(_QWORD *)v26);
        VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
        pthread_rwlock_unlock(&self->_stateRWlock);
        if (self->_startConnectionHealthMonitoring)
          -[VCConnectionHealthMonitor resetConnectionStats:](self->_connectionHealthMonitor, "resetConnectionStats:", var6 == 0);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v19 = "remote-no-remote";
            *(_DWORD *)v26 = 136315906;
            *(_QWORD *)&v26[4] = v17;
            *(_WORD *)&v26[12] = 2080;
            *(_QWORD *)&v26[14] = "-[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:]";
            if (!var6)
              v19 = "no-remote";
            *(_WORD *)&v26[22] = 1024;
            v27 = 2758;
            v28 = 2080;
            v29 = *(double *)&v19;
            _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: start dupe by %s.", v26, 0x26u);
          }
        }
      }
      if (-[VCConnectionManager shouldDropCurrentPrimaryConnectionWithConnectionStats:](self, "shouldDropCurrentPrimaryConnectionWithConnectionStats:", a3, *(_OWORD *)v26, *(_QWORD *)&v26[16]))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v22 = a3->var4;
            *(_DWORD *)v26 = 136315906;
            *(_QWORD *)&v26[4] = v20;
            *(_WORD *)&v26[12] = 2080;
            *(_QWORD *)&v26[14] = "-[VCConnectionManager updateConnectionStatsWithIndicatorNoPacket:]";
            *(_WORD *)&v26[22] = 1024;
            v27 = 2764;
            v28 = 2048;
            v29 = v22;
            _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Drop and re-select the next candidate as primary connection, since no packet flowing for %f seconds", v26, 0x26u);
          }
        }
        v23 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
        -[VCConnectionManager removeConnection:](self, "removeConnection:", v23);
        if (v23)
          CFRelease(v23);
      }
    }
  }
}

- (void)updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:(id *)a3
{
  double v5;
  int var6;
  _BOOL4 startConnectionHealthMonitoring;
  double v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  double var1;
  double v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *delegateQueue;
  uint64_t v18;
  _QWORD block[6];
  BOOL v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = micro();
  var6 = a3->var6;
  startConnectionHealthMonitoring = self->_startConnectionHealthMonitoring;
  if (self->_startConnectionHealthMonitoring)
    v8 = v5;
  else
    v8 = 0.0;
  a3->var0 = v8;
  if (startConnectionHealthMonitoring || v8 != 0.0)
  {
    if (!var6)
    {
      self->_isPrimaryLinkUsable = 0;
      -[VCConnectionManager reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:](self, "reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:", v5);
    }
    var1 = a3->var1;
    if (var1 == 0.0 && !self->_startConnectionHealthMonitoring)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v22 = v18;
          v23 = 2080;
          v24 = "-[VCConnectionManager updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:]";
          v25 = 1024;
          v26 = 2784;
          v27 = 1024;
          LODWORD(v28) = var6 == 0;
          v11 = " [%s] %s:%d LastReceivedPacketOnPrimaryTime has not been set isLocalConnection=%d";
          goto LABEL_9;
        }
      }
    }
    else
    {
      v13 = v5 - var1;
      if (v13 > a3->var3)
      {
        a3->var3 = v13;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v16 = "remote";
            *(_DWORD *)buf = 136316162;
            v22 = v14;
            v23 = 2080;
            v24 = "-[VCConnectionManager updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:]";
            if (!var6)
              v16 = "local";
            v25 = 1024;
            v26 = 2790;
            v27 = 2080;
            v28 = v16;
            v29 = 2048;
            v30 = v13;
            _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: %s primary connection has no packet (could already have been received over secondary). Max interval: %f", buf, 0x30u);
          }
        }
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __77__VCConnectionManager_updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket___block_invoke;
        block[3] = &unk_1E9E529D8;
        block[4] = self;
        v20 = var6 == 0;
        *(double *)&block[5] = v13;
        dispatch_async(delegateQueue, block);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v22 = v9;
      v23 = 2080;
      v24 = "-[VCConnectionManager updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket:]";
      v25 = 1024;
      v26 = 2776;
      v27 = 1024;
      LODWORD(v28) = var6 == 0;
      v11 = " [%s] %s:%d LastReceivedPacketTime has not been set isLocalConnection=%d";
LABEL_9:
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0x22u);
    }
  }
}

uint64_t __77__VCConnectionManager_updateConnectionStatsWithIndicatorOnlyPrimaryNoPacket___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)*(double *)(a1 + 40)), "stringValue"), "cString");
  return reportingLog();
}

- (void)updateConnectionStatsWithIndicatorNone:(id *)a3
{
  double v5;
  double v6;

  v5 = micro();
  v6 = 0.0;
  if (self->_startConnectionHealthMonitoring)
    v6 = v5;
  a3->var0 = v6;
  a3->var1 = v6;
  -[VCConnectionManager reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:](self, "reportNoPacketUpdateUsingCurrentTime:lastReceivedPacketTime:");
}

- (void)updateConnectionStatsWithIndicatorPrimaryImproved:(id *)a3
{
  double v5;
  int var6;
  int v7;
  uint64_t v8;
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
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = micro();
  var6 = a3->var6;
  if (!self->_startConnectionHealthMonitoring)
    v5 = 0.0;
  a3->var0 = v5;
  a3->var1 = v5;
  if (var6)
  {
    v7 = 2;
  }
  else
  {
    v7 = 1;
    self->_isPrimaryLinkUsable = 1;
  }
  pthread_rwlock_wrlock(&self->_stateRWlock);
  if (VCDuplicationHandler_DuplicationReason((uint64_t)self->_duplicationHandler) == v7)
  {
    if (var6)
      v8 = 3;
    else
      v8 = 1;
    -[VCConnectionManager updateDuplicationStateWithEventType:](self, "updateDuplicationStateWithEventType:", v8);
    VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
    pthread_rwlock_unlock(&self->_stateRWlock);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = "remote-no-remote";
        v12 = 136315906;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCConnectionManager updateConnectionStatsWithIndicatorPrimaryImproved:]";
        if (!var6)
          v11 = "no-remote";
        v16 = 1024;
        v17 = 2827;
        v18 = 2080;
        v19 = v11;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: stop dupe by %s.", (uint8_t *)&v12, 0x26u);
      }
    }
  }
  else
  {
    pthread_rwlock_unlock(&self->_stateRWlock);
  }
}

- (void)updateConnectionHealthWithVCStatisticsMessage:(tagVCStatisticsMessage *)a3
{
  VCConnectionHealthMonitor *connectionHealthMonitor;
  NSObject *callbackQueue;
  const void *v7;
  VCConnectionHealthMonitor *v8;
  int linkID;
  _BOOL4 v10;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  connectionHealthMonitor = self->_connectionHealthMonitor;
  if (connectionHealthMonitor && self->_startConnectionHealthMonitoring)
  {
    if (a3->type == 5)
    {
      if (a3->var0.baseband.expectedQueuingDelay != 0.0)
      {
        v7 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
        v8 = self->_connectionHealthMonitor;
        linkID = a3->var0.serverStats.linkID;
        v10 = VCConnection_ConnectionID((uint64_t)v7) == linkID;
        VCConnectionHealthMonitor_ReceiveServerStats((uint64_t)v8, v10);
        if (v7)
          CFRelease(v7);
      }
    }
    else if (a3->type == 2)
    {
      VCConnectionHealthMonitor_ReceivePacket((uint64_t)connectionHealthMonitor, a3->var0.feedback.connectionStats.isReceivedOnPrimary, a3->var0.feedback.connectionStats.sequenceNumber, a3->var0.feedback.connectionStats.isDuplicatePacket);
      if (a3->var0.feedback.connectionStats.connectionStatsBuffer)
        -[VCConnectionHealthMonitor processPeerStatsBlob:](self->_connectionHealthMonitor, "processPeerStatsBlob:");
      self->_lastReceivedFeedbackTime = a3->arrivalTime;
      if (self->_networkConditionMonitor)
      {
        callbackQueue = self->_callbackQueue;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __69__VCConnectionManager_updateConnectionHealthWithVCStatisticsMessage___block_invoke;
        v11[3] = &unk_1E9E521C0;
        v11[4] = self;
        dispatch_async(callbackQueue, v11);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCConnectionManager updateConnectionHealthWithVCStatisticsMessage:].cold.1();
    }
  }
}

void __69__VCConnectionManager_updateConnectionHealthWithVCStatisticsMessage___block_invoke(uint64_t a1)
{
  VCConnectionManager_UpdateNetworkOutageStatus(*(_QWORD *)(a1 + 32), 1);
}

- (BOOL)shouldDropCurrentPrimaryConnectionWithConnectionStats:(id *)a3
{
  return 0;
}

- (void)updateProbingResults:(id)a3
{
  -[VCLinkProbingHandler updateProbingResults:](self->_linkProbingHandler, "updateProbingResults:", a3);
}

- (void)updateLinkPreferSuggestion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 reportLinkPreferSuggestion;
  int linkPreferSuggestion;
  int linkConfidenceScore;
  int linkIPPreference;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("lipp")))
    self->_linkIPPreference = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("lipp")), "intValue");
  v5 = *MEMORY[0x1E0D34088];
  if (objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D34088]))
  {
    v6 = *MEMORY[0x1E0D34080];
    if (objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D34080]))
    {
      self->_linkPreferSuggestion = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v5), "intValue");
      self->_linkConfidenceScore = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v6), "intValue");
      self->_reportLinkPreferSuggestion = 1;
      if (self->_useIDSLinkSuggestionFeatureFlag)
      {
        if (self->_linkPreferSuggestion == 1)
          -[VCConnectionManager setPreferRelayOverP2P:reason:](self, "setPreferRelayOverP2P:reason:", 1, 2);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136315650;
          v16 = v7;
          v17 = 2080;
          v18 = "-[VCConnectionManager updateLinkPreferSuggestion:]";
          v19 = 1024;
          v20 = 2941;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d IDS Link recommendation ignored", (uint8_t *)&v15, 0x1Cu);
        }
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      reportLinkPreferSuggestion = self->_reportLinkPreferSuggestion;
      linkPreferSuggestion = self->_linkPreferSuggestion;
      linkConfidenceScore = self->_linkConfidenceScore;
      linkIPPreference = self->_linkIPPreference;
      v15 = 136316674;
      v16 = v9;
      v17 = 2080;
      v18 = "-[VCConnectionManager updateLinkPreferSuggestion:]";
      v19 = 1024;
      v20 = 2949;
      v21 = 1024;
      v22 = reportLinkPreferSuggestion;
      v23 = 1024;
      v24 = linkPreferSuggestion;
      v25 = 1024;
      v26 = linkConfidenceScore;
      v27 = 1024;
      v28 = linkIPPreference;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: reportLinkPreferSuggestion=%d linkPreferSuggestion=%d linkConfidenceScore=%d linkIPPreference=%d", (uint8_t *)&v15, 0x34u);
    }
  }
}

- (void)applyLinkRecommendation
{
  const void *v3;
  int IsRelay;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_isOneToOneModeEnabled)
  {
    self->_dropLinkRecommendation = 0;
    -[VCConnectionManager updateConnectionSelectionPolicyWithPreferE2E:](self, "updateConnectionSelectionPolicyWithPreferE2E:", 1);
    pthread_rwlock_wrlock(&self->_stateRWlock);
    v3 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
    IsRelay = VCConnection_IsRelay((uint64_t)v3);
    if (v3)
      CFRelease(v3);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136316162;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCConnectionManager applyLinkRecommendation]";
        v11 = 1024;
        v12 = 2962;
        v13 = 1024;
        v14 = IsRelay;
        v15 = 1024;
        v16 = -[VCConnectionManager preferRelayOverP2PEnabled](self, "preferRelayOverP2PEnabled");
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d HandoverReport: Check if primary connection needs to be updated - isCurrentPrimaryUsingRelay=%d isPreferRelayOverP2PEnabled=%d", (uint8_t *)&v7, 0x28u);
      }
    }
    if ((IsRelay & 1) == 0)
    {
      if (-[VCConnectionManager preferRelayOverP2PEnabled](self, "preferRelayOverP2PEnabled"))
      {
        -[VCConnectionManager reselectPrimaryConnection](self, "reselectPrimaryConnection");
        VCConnectionManager_UpdateConnectionForDuplication((uint64_t)self);
      }
    }
    -[VCConnectionManager reportLinkSuggestion](self, "reportLinkSuggestion");
    pthread_rwlock_unlock(&self->_stateRWlock);
  }
}

- (void)reportLinkSuggestion
{
  const void *v3;
  unsigned __int8 v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  self->_linkPreferDecision = 0;
  if (self->_linkPreferSuggestion == 1)
  {
    v3 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self);
    v4 = VCConnection_IsRelay((uint64_t)v3) ? 1 : 2;
    self->_linkPreferDecision = v4;
    if (v3)
      CFRelease(v3);
  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_reportLinkPreferSuggestion)
  {
    v8[0] = CFSTR("LnkSug");
    v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_linkPreferSuggestion);
    v8[1] = CFSTR("LnkScr");
    v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_linkConfidenceScore);
    v8[2] = CFSTR("LnkDec");
    v9[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_linkPreferDecision);
    objc_msgSend(v5, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3));
  }
  if (self->_linkIPPreference != 255)
  {
    v6 = CFSTR("LnkIp");
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
    objc_msgSend(v5, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  }
  if (objc_msgSend(v5, "count"))
    reportingGenericEvent();

}

- (void)applyLinkFlags:(unsigned __int16)a3 isCellular:(BOOL)a4
{
  int v4;
  uint64_t v5;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  NSMutableArray *connectionArray;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v4 = a4;
  v5 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_rdlock(&self->_stateRWlock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v10 = CFSTR("WiFi");
      v23 = v8;
      v24 = 2080;
      v25 = "-[VCConnectionManager applyLinkFlags:isCellular:]";
      v26 = 1024;
      if (v4)
        v10 = CFSTR("Cellular");
      v27 = 3006;
      v28 = 1024;
      v29 = v5;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Applying link flags='%08x' for %@", buf, 0x2Cu);
    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  connectionArray = self->_connectionArray;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(connectionArray);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (VCConnection_IsLocalOnCellular((uint64_t)v16) == v4)
        {
          objc_msgSend(v16, "setLinkFlags:", v5);
          -[VCConnectionManager updateAllBitrateCapsForConnectionInternal:](self, "updateAllBitrateCapsForConnectionInternal:", v16);
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v13);
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)applyRemoteLinkFlags:(unsigned __int16)a3 isCellular:(BOOL)a4
{
  int v4;
  uint64_t v5;
  _opaque_pthread_rwlock_t *p_stateRWlock;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  NSMutableArray *connectionArray;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v4 = a4;
  v5 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_rdlock(&self->_stateRWlock);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v10 = CFSTR("WiFi");
      v23 = v8;
      v24 = 2080;
      v25 = "-[VCConnectionManager applyRemoteLinkFlags:isCellular:]";
      v26 = 1024;
      if (v4)
        v10 = CFSTR("Cellular");
      v27 = 3018;
      v28 = 1024;
      v29 = v5;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Applying remote link flags='%08x' for %@", buf, 0x2Cu);
    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  connectionArray = self->_connectionArray;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(connectionArray);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (VCConnection_IsLocalOnCellular((uint64_t)v16) == v4
          || VCConnection_IsRemoteOnCellular((uint64_t)v16) == v4)
        {
          objc_msgSend(v16, "setRemoteLinkFlags:", v5);
          -[VCConnectionManager updateAllBitrateCapsForConnectionInternal:](self, "updateAllBitrateCapsForConnectionInternal:", v16);
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](connectionArray, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    }
    while (v13);
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)startActiveProbingWithOptions:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager startActiveProbingWithOptions:]"), 0));
}

- (void)stopActiveProbingWithOptions:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager stopActiveProbingWithOptions:]"), 0));
}

- (void)queryProbingResultsWithOptions:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager queryProbingResultsWithOptions:]"), 0));
}

- (void)flushLinkProbingStatusWithOptions:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCConnectionManager flushLinkProbingStatusWithOptions:]"), 0));
}

- ($85B13D066EE34EC5DDC86B20300AB7FA)getConnectionSelectionPolicy
{
  return ($85B13D066EE34EC5DDC86B20300AB7FA *)&self->_connectionSelectionPolicy;
}

- (void)updateConnectionSelectionPolicyWithPreferE2E:(BOOL)a3
{
  _opaque_pthread_rwlock_t *p_stateRWlock;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 preferRelayOverP2P;
  _BOOL4 preferIPv6OverIPv4;
  _BOOL4 preferNonVPN;
  _BOOL4 e2eCriteriaEnabled;
  _BOOL4 preferE2E;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  p_stateRWlock = &self->_stateRWlock;
  pthread_rwlock_wrlock(&self->_stateRWlock);
  self->_connectionSelectionPolicy.preferRelayOverP2P = self->_preferRelayOverP2PEnabled;
  *(_WORD *)&self->_connectionSelectionPolicy.preferIPv6OverIPv4 = 0;
  self->_connectionSelectionPolicy.e2eCriteriaEnabled = 0;
  self->_connectionSelectionPolicy.preferE2E = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      preferRelayOverP2P = self->_connectionSelectionPolicy.preferRelayOverP2P;
      preferIPv6OverIPv4 = self->_connectionSelectionPolicy.preferIPv6OverIPv4;
      preferNonVPN = self->_connectionSelectionPolicy.preferNonVPN;
      e2eCriteriaEnabled = self->_connectionSelectionPolicy.e2eCriteriaEnabled;
      preferE2E = self->_connectionSelectionPolicy.preferE2E;
      v13 = 136316930;
      v14 = v6;
      v15 = 2080;
      v16 = "-[VCConnectionManager updateConnectionSelectionPolicyWithPreferE2E:]";
      v17 = 1024;
      v18 = 3062;
      v19 = 1024;
      v20 = preferRelayOverP2P;
      v21 = 1024;
      v22 = preferIPv6OverIPv4;
      v23 = 1024;
      v24 = preferNonVPN;
      v25 = 1024;
      v26 = e2eCriteriaEnabled;
      v27 = 1024;
      v28 = preferE2E;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ConnectionSelectionPolicy updated: preferRelayOverP2P[%d] preferIPv6OverIPv4[%d] preferNonVPN[%d] e2eCriteriaEnabled[%d] preferE2E[%d]", (uint8_t *)&v13, 0x3Au);
    }
  }
  pthread_rwlock_unlock(p_stateRWlock);
}

- (void)reportSymptomOnLongMediaStallRecovered
{
  -[VCConnectionManager handleReportingSymptom:](self, "handleReportingSymptom:", 56);
}

- (void)didChangeWifiAssistAvailable:(BOOL)a3 reason:(unsigned __int8)a4
{
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v4 = a4;
  v5 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = "NO";
      *(_DWORD *)buf = 136315906;
      v13 = v6;
      v14 = 2080;
      v15 = "-[VCConnectionManager didChangeWifiAssistAvailable:reason:]";
      if (v5)
        v8 = "YES";
      v16 = 1024;
      v17 = 3073;
      v18 = 2080;
      v19 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Update WifiAssist Available = %s", buf, 0x26u);
    }
  }
  v9 = (void *)MEMORY[0x1E0C99E08];
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4, CFSTR("WAStateChangeReason"));
  objc_msgSend(v9, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  reportingGenericEvent();
}

- (void)handleReportingSymptom:(unsigned int)a3
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeyParticipantID"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_idsParticipantID));
  reportingSymptom();
  if (Mutable)
    CFRelease(Mutable);
}

- (unsigned)callID
{
  return self->_callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->_callID = a3;
}

- (int)relayServerProvider
{
  return self->_relayServerProvider;
}

- (void)setRelayServerProvider:(int)a3
{
  self->_relayServerProvider = a3;
}

- (unsigned)preferredLocalInterfaceForDuplication
{
  return self->_preferredLocalInterfaceForDuplication;
}

- (void)setPreferredLocalInterfaceForDuplication:(unsigned __int8)a3
{
  self->_preferredLocalInterfaceForDuplication = a3;
}

- (unsigned)preferredRemoteInterfaceForDuplication
{
  return self->_preferredRemoteInterfaceForDuplication;
}

- (void)setPreferredRemoteInterfaceForDuplication:(unsigned __int8)a3
{
  self->_preferredRemoteInterfaceForDuplication = a3;
}

- (VCConnectionProtocol)secondaryConnection
{
  return self->_secondaryConnection;
}

- (void)setSecondaryConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (VCConnectionProtocol)lastPrimaryConnectionInUse
{
  return self->_lastPrimaryConnectionInUse;
}

- (void)setLastPrimaryConnectionInUse:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (void)setConnectionForDuplication:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 312);
}

- (BOOL)supportDuplication
{
  return self->_supportDuplication;
}

- (void)setSupportDuplication:(BOOL)a3
{
  self->_supportDuplication = a3;
}

- (void)setIsDuplicationAllowed:(BOOL)a3
{
  self->_isDuplicationAllowed = a3;
}

- (unint64_t)mediaExcessiveCellularTxBytes
{
  return self->_mediaExcessiveCellularTxBytes;
}

- (unint64_t)mediaExcessiveCellularRxBytes
{
  return self->_mediaExcessiveCellularRxBytes;
}

- (unint64_t)signalingExcessiveCellularTxBytes
{
  return self->_signalingExcessiveCellularTxBytes;
}

- (unint64_t)signalingExcessiveCellularRxBytes
{
  return self->_signalingExcessiveCellularRxBytes;
}

- (unint64_t)mediaCellularTxBytes
{
  return self->_mediaCellularTxBytes;
}

- (unint64_t)mediaCellularRxBytes
{
  return self->_mediaCellularRxBytes;
}

- (unint64_t)mediaWifiTxBytes
{
  return self->_mediaWifiTxBytes;
}

- (unint64_t)mediaWifiRxBytes
{
  return self->_mediaWifiRxBytes;
}

- (BOOL)isAudioOnly
{
  return self->_isAudioOnly;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->_isAudioOnly = a3;
}

- (double)noRemotePacketInterval
{
  return self->_noRemotePacketInterval;
}

- (double)remoteNoRemotePacketInterval
{
  return self->_remoteNoRemotePacketInterval;
}

- (VCStatsRecorder)statsRecorder
{
  return self->_statsRecorder;
}

- (BOOL)isPreWarmStateEnabled
{
  return self->_isPreWarmStateEnabled;
}

- (BOOL)remotePreWarmStateEnabled
{
  return self->_remotePreWarmStateEnabled;
}

- (BOOL)preferRelayOverP2PEnabled
{
  return self->_preferRelayOverP2PEnabled;
}

- (BOOL)fastMediaDuplicationEnabled
{
  return self->_fastMediaDuplicationEnabled;
}

- (void)setFastMediaDuplicationEnabled:(BOOL)a3
{
  self->_fastMediaDuplicationEnabled = a3;
}

- (BOOL)cellPrimaryInterfaceChangeEnabled
{
  return self->_cellPrimaryInterfaceChangeEnabled;
}

- (void)setCellPrimaryInterfaceChangeEnabled:(BOOL)a3
{
  self->_cellPrimaryInterfaceChangeEnabled = a3;
}

- (BOOL)duplicateImportantPktsEnabled
{
  return self->_duplicateImportantPktsEnabled;
}

- (void)setDuplicateImportantPktsEnabled:(BOOL)a3
{
  self->_duplicateImportantPktsEnabled = a3;
}

- (double)noRemoteDuplicationThresholdFast
{
  return self->_noRemoteDuplicationThresholdFast;
}

- (void)setNoRemoteDuplicationThresholdFast:(double)a3
{
  self->_noRemoteDuplicationThresholdFast = a3;
}

- (BOOL)lowNetworkModeEnabled
{
  return self->_lowNetworkModeEnabled;
}

- (void)setLowNetworkModeEnabled:(BOOL)a3
{
  self->_lowNetworkModeEnabled = a3;
}

- (BOOL)duplicationEnhancementEnabled
{
  return self->_duplicationEnhancementEnabled;
}

- (void)setDuplicationEnhancementEnabled:(BOOL)a3
{
  self->_duplicationEnhancementEnabled = a3;
}

- (BOOL)iRATDuplicationEnabled
{
  return self->_iRATDuplicationEnabled;
}

- (unsigned)realRATType
{
  return self->_realRATType;
}

- (void)setRealRATType:(unsigned int)a3
{
  self->_realRATType = a3;
}

- (unsigned)linkProbingCapabilityVersion
{
  return self->_linkProbingCapabilityVersion;
}

- (unsigned)remoteLinkProbingCapabilityVersion
{
  return self->_remoteLinkProbingCapabilityVersion;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (VCConnectionHealthMonitor)connectionHealthMonitor
{
  return self->_connectionHealthMonitor;
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_isOneToOneModeEnabled;
}

- (BOOL)startConnectionHealthMonitoring
{
  return self->_startConnectionHealthMonitoring;
}

- (BOOL)isRemoteMediaQualityDegraded
{
  return self->_isRemoteMediaQualityDegraded;
}

- (BOOL)isRemoteNetworkQualityDegraded
{
  return self->_isRemoteNetworkQualityDegraded;
}

- (BOOL)shouldLimitMultiwayBandwidthWhenConstrained
{
  return self->_shouldLimitMultiwayBandwidthWhenConstrained;
}

- (void)setShouldLimitMultiwayBandwidthWhenConstrained:(BOOL)a3
{
  self->_shouldLimitMultiwayBandwidthWhenConstrained = a3;
}

- (BOOL)enableNetworkConditionMonitoring
{
  return self->_enableNetworkConditionMonitoring;
}

- (BOOL)enableMotionBasedDuplication
{
  return self->_enableMotionBasedDuplication;
}

- (BOOL)isUplinkRetransmissionSupported
{
  return self->_isUplinkRetransmissionSupported;
}

- (void)setIsUplinkRetransmissionSupported:(BOOL)a3
{
  self->_isUplinkRetransmissionSupported = a3;
}

- (int64_t)overlayToken
{
  return self->_overlayToken;
}

- (void)setOverlayToken:(int64_t)a3
{
  self->_overlayToken = a3;
}

- (BOOL)isGftTLEEnabled
{
  return self->_gftTLEEnabled;
}

- (void)setGftTLEEnabled:(BOOL)a3
{
  self->_gftTLEEnabled = a3;
}

- (NSString)gecoVersion
{
  return (NSString *)objc_getProperty(self, a2, 840, 1);
}

- (void)setGecoVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 840);
}

- (unint64_t)budgetConsumingCellularTxBytes
{
  return self->_budgetConsumingCellularTxBytes;
}

- (unint64_t)budgetConsumingCellularRxBytes
{
  return self->_budgetConsumingCellularRxBytes;
}

- (BOOL)optIntoExistingSubscribedStreams
{
  return self->_optIntoExistingSubscribedStreams;
}

- (void)setOptIntoExistingSubscribedStreams:(BOOL)a3
{
  self->_optIntoExistingSubscribedStreams = a3;
}

- (BOOL)isOneToOneScreenEnabled
{
  return self->_isOneToOneScreenEnabled;
}

void ___VCConnectionManager_SetDuplicationEnabledInternal_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  const char *v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  char IsLocalOnCellular;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didEnableDuplication:activeConnection:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = (void *)MEMORY[0x1E0C99E08];
  v10[0] = CFSTR("Reason");
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = VCDuplicationHandler_DuplicationReason(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 624));
  if (v4 > 7)
    v5 = "Unknown";
  else
    v5 = off_1E9E55750[(char)v4];
  v10[1] = CFSTR("DuplicationType");
  v11[0] = objc_msgSend(v3, "stringWithUTF8String:", v5);
  v11[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", VCDuplicationHandler_DuplicationReasonForReporting(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 624)));
  v6 = (void *)objc_msgSend(v2, "dictionaryWithDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
  VCConnectionManager_AddDuplicationSelectionLogicTelemetryForConnection(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);
  v7 = *(const void **)(a1 + 48);
  if (v7)
    CFRelease(v7);
  VCConnectionManager_AddTelemetryForPacketHistory(*(_QWORD *)(a1 + 32), (uint64_t)v6);
  VCConnectionManager_AddTelemetryForConnection(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v6);
  VCConnectionManager_AddLinkProbingTelemetry(*(_QWORD *)(a1 + 32));
  VCConnection_ReportingQRServerConfig(*(_QWORD *)(a1 + 40));
  reportingGenericEvent();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 808);
  IsLocalOnCellular = VCConnection_IsLocalOnCellular(*(_QWORD *)(a1 + 40));
  VCNetworkConditionMonitor_SetIsLocalActiveOnCellular(v8, IsLocalOnCellular);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

uint64_t ___VCConnectionManager_ProcessDuplicationStateUpdateEvent_block_invoke(uint64_t a1)
{
  uint64_t result;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t (*v7)(_QWORD, _DWORD *);
  int v8;
  int v9;
  int v10;
  int v11;
  _DWORD v12[3];
  int v13;
  _QWORD block[6];
  __int16 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(result + 448) && *(_BYTE *)(a1 + 41))
  {
    objc_msgSend((id)result, "setPreferredLocalInterfaceForDuplication:", *(_DWORD *)(a1 + 48) != 1);
    if (*(_BYTE *)(a1 + 60))
      v3 = 1;
    else
      v3 = *(_BYTE *)(a1 + 61) != 0;
    (*(void (**)(_QWORD, _BOOL8, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 448))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 480), v3, *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 41));
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = ___VCConnectionManager_ProcessDuplicationStateUpdateEvent_block_invoke_2;
    block[3] = &unk_1E9E556B8;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(NSObject **)(v4 + 440);
    block[1] = 3221225472;
    block[4] = v4;
    block[5] = v5;
    v15 = *(_WORD *)(a1 + 60);
    dispatch_async(v6, block);
    result = *(_QWORD *)(a1 + 32);
  }
  v7 = *(uint64_t (**)(_QWORD, _DWORD *))(result + 704);
  if (v7)
  {
    if (*(_BYTE *)(result + 672))
      v8 = 1;
    else
      v8 = 2;
    v9 = *(_DWORD *)(a1 + 52);
    v12[0] = v8;
    v12[1] = v9;
    v10 = *(_DWORD *)(a1 + 44);
    v12[2] = v10;
    v13 = 0;
    if (*(_BYTE *)(a1 + 62) == 1)
    {
      if (!v10)
        return v7(*(_QWORD *)(result + 720), v12);
      if (v10 != 2)
      {
        v11 = 0;
        goto LABEL_20;
      }
    }
    else if (*(_BYTE *)(a1 + 62) || !v10 || !*(_BYTE *)(a1 + 63))
    {
      return result;
    }
    v11 = *(_DWORD *)(a1 + 56);
LABEL_20:
    v13 = v11;
    return v7(*(_QWORD *)(result + 720), v12);
  }
  return result;
}

uint64_t ___VCConnectionManager_ProcessDuplicationStateUpdateEvent_block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = objc_msgSend(*(id *)(a1 + 32), "preferredLocalInterfaceForDuplication");
  if (*(_BYTE *)(a1 + 48))
    v4 = 1;
  else
    v4 = *(_BYTE *)(a1 + 49) != 0;
  return objc_msgSend(v2, "didUpdatePreferredInterfaceForDuplication:notifyPeer:enableDuplication:isMediaUnrecoverableSignal:", v3, *(unsigned __int8 *)(a1 + 41) != 0, v4, 0);
}

uint64_t ___VCConnectionManager_ChecklocalRATTypeOverrideDefaultValue_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "handleRATChanged:", *(_QWORD *)(a1 + 40));
}

uint64_t ___VCConnectionManager_RequestWRMNotification_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(_QWORD);

  v1 = *(_QWORD *)(result + 32);
  v2 = *(uint64_t (**)(_QWORD))(v1 + 712);
  if (v2)
    return v2(*(_QWORD *)(v1 + 720));
  return result;
}

void ___VCConnectionManager_GetAndLogSignalStrength_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = 0;
    v4 = 0;
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "getSignalStrengthBars:displayBars:maxDisplayBars:", (char *)&v5 + 4, &v5, &v4))
    {
      VCNetworkConditionMonitor_SetCellSignalStrengthBars(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 808), v5, v4);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v2 = VRTraceErrorLogLevelToCSTR();
        v3 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v7 = v2;
          v8 = 2080;
          v9 = "_VCConnectionManager_GetAndLogSignalStrength_block_invoke";
          v10 = 1024;
          v11 = 2376;
          v12 = 1024;
          v13 = HIDWORD(v5);
          v14 = 1024;
          v15 = v5;
          v16 = 1024;
          v17 = v4;
          _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d SignalStrength bars=%d displayBars=%d maxDisplayBars=%d", buf, 0x2Eu);
        }
      }
    }
  }
}

- (void)copyPersistenPacketCounts:isOutgoing:size:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Length does not match", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getSentBytes:receivedBytes:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid parameters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addMediaHealthStatsHistoryEntryForParticipantID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d idsParticipantID %@ is already part of mediaDegradedHistories!");
  OUTLINED_FUNCTION_3();
}

- (void)removeMediaHealthStatsHistoryEntryForParticipantID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d idsParticipantID %@ is not yet added to mediaDegradedHistories!");
  OUTLINED_FUNCTION_3();
}

- (void)updateMediaHealthStats:idsParticipantID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d idsParticipantID %@ is not part of mediaDegradedHistories!");
  OUTLINED_FUNCTION_3();
}

- (void)updateMediaDegradedHistoryWithCurrentAudioErasure:idsParticipantID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d idsParticipantID %@ is not part of mediaDegradedHistories!");
  OUTLINED_FUNCTION_3();
}

- (void)primaryConnectionChanged:oldPrimaryConnection:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  int v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v2 = 1949;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d VCConnectionManager: Delegate didn't implement primaryConnectionChanged", v1, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)updateConnectionHealthWithVCStatisticsMessage:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Wrong type of statistics message received by VCConnectionManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
