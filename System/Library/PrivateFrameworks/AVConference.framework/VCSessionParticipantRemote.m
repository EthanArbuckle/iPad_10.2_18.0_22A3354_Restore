@implementation VCSessionParticipantRemote

- (VCSessionParticipantRemote)initWithConfig:(id)a3 delegate:(id)a4
{
  VCSessionParticipantRemote *v5;
  NSMutableDictionary *v6;
  VCPositionalInfo *v7;
  VCSessionParticipantRemote *v8;
  VCSessionParticipantRemote *v9;
  NSData *v10;
  NSDictionary *v11;
  int v12;
  float v13;
  float v14;
  OS_nw_activity *nwActivity;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  int v41;
  const __CFString *v42;
  const __CFString *v43;
  uint64_t v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  uint64_t v59;
  NSObject *v60;
  objc_super v61;
  uint8_t buf[4];
  uint64_t v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  VCSessionParticipantRemote *v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)VCSessionParticipantRemote;
  v5 = -[VCSessionParticipant initWithConfig:delegate:](&v61, sel_initWithConfig_delegate_, a3, a4);
  if (v5)
  {
    v5->_perfTimers = (TimingCollection *)objc_alloc_init(MEMORY[0x1E0CF2690]);
    v5->super._isGKVoiceChat = objc_msgSend(a3, "isGKVoiceChat");
    v5->super._direction = 2;
    v5->super._idsParticipantID = objc_msgSend(a3, "idsParticipantID");
    v5->_isVideoJitterForPlayoutEnabled = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-video-jitter-buffer-for-video-playout"), CFSTR("UseVideoJitterForVideoPlayoutForFaceTime"), "AVConference", "UseVideoJitterForVideoPlayout");
    v5->_shouldDisableMiddleTierMLEnhance = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-middle-tier-ml-enhance-disabled"), CFSTR("mlEnhanceForMiddleQualityTiersDisabled"), MEMORY[0x1E0C9AAA0], 0), "BOOLValue");
    v5->_enableMaxCameraBitrateVideoQualityV2 = objc_msgSend(a3, "enableMaxCameraBitrateVideoQualityV2");
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_jbSynchronizerPerSyncGroupID = v6;
    if (v6)
    {
      v7 = objc_alloc_init(VCPositionalInfo);
      v5->_positionalInfo = v7;
      if (v7)
      {
        v8 = (VCSessionParticipantRemote *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "mediaNegotiator"), "localSettings"), "copy");
        if (v8)
        {
          v9 = v8;
          -[VCSessionParticipantRemote setIsCaller:](v8, "setIsCaller:", 0);
          v5->super._mediaNegotiator = -[VCSessionMediaNegotiator initWithLocalConfiguration:]([VCSessionMediaNegotiator alloc], "initWithLocalConfiguration:", v9);
          -[VCSessionParticipantRemote setupJBTargetSynchronizers](v5, "setupJBTargetSynchronizers");
          v10 = (NSData *)(id)objc_msgSend(a3, "participantData");
          v5->super._opaqueData = v10;
          if (v10)
          {
            v11 = (NSDictionary *)+[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:", v10);
            v5->super._participantInfo = v11;
            if (v11)
            {
              if (-[VCSessionParticipantRemote processParticipantInfo](v5, "processParticipantInfo"))
              {
                v5->_mediaTable = -[VCSessionBandwidthAllocationTable initWithType:]([VCSessionBandwidthAllocationTable alloc], "initWithType:", 2);
                -[VCObject setLogPrefix:](v5->_mediaTable, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("participantID:%@ "), v5->super._uuid));
                v5->_repairMediaTable = -[VCSessionBandwidthAllocationTable initWithType:]([VCSessionBandwidthAllocationTable alloc], "initWithType:", 2);
                -[VCObject setLogPrefix:](v5->_repairMediaTable, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("participantID:%@ "), v5->super._uuid));
                v12 = -[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:](v5, "setupSpatialAudioWithMetadata:spatialMetadataEntryMap:", objc_msgSend(a3, "spatialMetadata"), objc_msgSend(a3, "spatialMetadataEntryMap"));
                if (v12 < 0)
                {
                  v41 = v12;
                  if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                        -[VCSessionParticipantRemote initWithConfig:delegate:].cold.6();
                    }
                    goto LABEL_118;
                  }
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v42 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](v5, "performSelector:", sel_logPrefix);
                  else
                    v42 = &stru_1E9E58EE0;
                  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
                    goto LABEL_118;
                  v54 = VRTraceErrorLogLevelToCSTR();
                  v55 = *MEMORY[0x1E0CF2758];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    goto LABEL_118;
                  *(_DWORD *)buf = 136316418;
                  v63 = v54;
                  v64 = 2080;
                  v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                  v66 = 1024;
                  v67 = 210;
                  v68 = 2112;
                  v69 = (uint64_t)v42;
                  v70 = 2048;
                  v71 = v5;
                  v72 = 1024;
                  LODWORD(v73) = v41;
                  v56 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup spatial audio! result=%08x";
                  v57 = v55;
                  v58 = 54;
                }
                else
                {
                  v5->_isServerRTxEnabled = objc_msgSend(a3, "isServerRTxEnabled");
                  v5->_isEnhancedJBAdaptationsEnabled = objc_msgSend(a3, "isEnhancedJBAdaptationsEnabled");
                  v5->_outOfProcessCodecsEnabled = objc_msgSend(a3, "outOfProcessCodecsEnabled");
                  -[VCSessionParticipantRemote setProminenceIndex:](v5, "setProminenceIndex:", objc_msgSend(a3, "prominenceIndex"));
                  v5->_capabilities.supportsParticipantIDBasedKeyLookup = -[VCSessionParticipantRemote supportsIDSParticipantIDBasedKeyIndexMatching](v5, "supportsIDSParticipantIDBasedKeyIndexMatching");
                  -[TimingCollection startTimingForKey:](v5->_perfTimers, "startTimingForKey:", 19);
                  if (-[VCSessionParticipantRemote setupStreamGroups](v5, "setupStreamGroups"))
                  {
                    -[VCSessionParticipantRemote initializeParticipantType](v5, "initializeParticipantType");
                    v5->_capabilities.controlChannelVersion = -[VCMediaNegotiatorResults controlChannelVersion](-[VCSessionMediaNegotiator negotiatedSettings](v5->super._mediaNegotiator, "negotiatedSettings"), "controlChannelVersion");
                    v5->_capabilities.supportsGFTSwitchToOneToOne = -[VCSessionParticipantRemote supportsGFTSwitchToOneToOne](v5, "supportsGFTSwitchToOneToOne");
                    v5->super._audioEnabled = objc_msgSend(a3, "audioEnabled");
                    v5->super._videoEnabled = objc_msgSend(a3, "videoEnabled");
                    v5->super._screenEnabled = objc_msgSend(a3, "screenEnabled");
                    v5->super._audioPaused = objc_msgSend(a3, "audioPaused");
                    v5->super._videoPaused = objc_msgSend(a3, "videoPaused");
                    v5->super._isMuted = objc_msgSend(a3, "audioMuted");
                    objc_msgSend(a3, "volume");
                    v5->super._volume = v13;
                    objc_msgSend(a3, "audioPosition");
                    v5->super._audioPosition = v14;
                    v5->_nwActivity = (OS_nw_activity *)objc_msgSend(a3, "nwActivity");
                    v5->_remoteVideoEnabled = 1;
                    v5->_remoteAudioEnabled = 1;
                    v5->_remoteScreenEnabledStateChanged = 1;
                    v5->_remoteSystemAudioPaused = 0;
                    v5->_remoteMediaStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
                    v5->_thermalLevel = 0;
                    -[VCSessionParticipant setupMediaTypeSettingsWithConfig:](v5, "setupMediaTypeSettingsWithConfig:", a3);
                    nwActivity = v5->_nwActivity;
                    if (nwActivity)
                      nw_retain(nwActivity);
                    -[VCSessionParticipantRemote updateDownlinkBandwithAllocatorClientConfigurations:](v5, "updateDownlinkBandwithAllocatorClientConfigurations:", a3);
                    if (!-[VCDefaults forceFECRepairStream](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFECRepairStream"))goto LABEL_25;
                    if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
                        goto LABEL_24;
                      v17 = VRTraceErrorLogLevelToCSTR();
                      v18 = *MEMORY[0x1E0CF2758];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                        goto LABEL_24;
                      *(_DWORD *)buf = 136315650;
                      v63 = v17;
                      v64 = 2080;
                      v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                      v66 = 1024;
                      v67 = 252;
                      v19 = "VCSessionParticipantRemote [%s] %s:%d _isRedundancyRequested set to YES by forceFECRepairStream";
                      v20 = v18;
                      v21 = 28;
                    }
                    else
                    {
                      if ((objc_opt_respondsToSelector() & 1) != 0)
                        v16 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](v5, "performSelector:", sel_logPrefix);
                      else
                        v16 = &stru_1E9E58EE0;
                      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
                        goto LABEL_24;
                      v22 = VRTraceErrorLogLevelToCSTR();
                      v23 = *MEMORY[0x1E0CF2758];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                        goto LABEL_24;
                      *(_DWORD *)buf = 136316162;
                      v63 = v22;
                      v64 = 2080;
                      v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                      v66 = 1024;
                      v67 = 252;
                      v68 = 2112;
                      v69 = (uint64_t)v16;
                      v70 = 2048;
                      v71 = v5;
                      v19 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) _isRedundancyRequested set to YES by forceFECRepairStream";
                      v20 = v23;
                      v21 = 48;
                    }
                    _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_24:
                    v5->_isRedundancyRequested = 1;
LABEL_25:
                    -[VCSessionParticipantRemote updateAudioSpectrumState](v5, "updateAudioSpectrumState");
                    if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
                        goto LABEL_36;
                      v25 = VRTraceErrorLogLevelToCSTR();
                      v26 = *MEMORY[0x1E0CF2758];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                        goto LABEL_36;
                      v27 = -[VCSessionParticipant description](v5, "description");
                      *(_DWORD *)buf = 136315906;
                      v63 = v25;
                      v64 = 2080;
                      v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                      v66 = 1024;
                      v67 = 259;
                      v68 = 2112;
                      v69 = v27;
                      v28 = "VCSessionParticipantRemote [%s] %s:%d Participant init %@";
                      v29 = v26;
                      v30 = 38;
                    }
                    else
                    {
                      if ((objc_opt_respondsToSelector() & 1) != 0)
                        v24 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](v5, "performSelector:", sel_logPrefix);
                      else
                        v24 = &stru_1E9E58EE0;
                      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
                        goto LABEL_36;
                      v31 = VRTraceErrorLogLevelToCSTR();
                      v32 = *MEMORY[0x1E0CF2758];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                        goto LABEL_36;
                      v33 = -[VCSessionParticipant description](v5, "description");
                      *(_DWORD *)buf = 136316418;
                      v63 = v31;
                      v64 = 2080;
                      v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                      v66 = 1024;
                      v67 = 259;
                      v68 = 2112;
                      v69 = (uint64_t)v24;
                      v70 = 2048;
                      v71 = v5;
                      v72 = 2112;
                      v73 = v33;
                      v28 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Participant init %@";
                      v29 = v32;
                      v30 = 58;
                    }
                    _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, v28, buf, v30);
LABEL_36:

                    return v5;
                  }
                  if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                        -[VCSessionParticipantRemote initWithConfig:delegate:].cold.7();
                    }
                    goto LABEL_118;
                  }
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v43 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](v5, "performSelector:", sel_logPrefix);
                  else
                    v43 = &stru_1E9E58EE0;
                  if ((int)VRTraceGetErrorLogLevelForModule() < 3
                    || (v59 = VRTraceErrorLogLevelToCSTR(),
                        v60 = *MEMORY[0x1E0CF2758],
                        !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
                  {
LABEL_118:

                    v9 = v5;
                    v5 = 0;
                    goto LABEL_36;
                  }
                  *(_DWORD *)buf = 136316162;
                  v63 = v59;
                  v64 = 2080;
                  v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
                  v66 = 1024;
                  v67 = 221;
                  v68 = 2112;
                  v69 = (uint64_t)v43;
                  v70 = 2048;
                  v71 = v5;
                  v56 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup stream groups";
                  v57 = v60;
                  v58 = 48;
                }
                _os_log_error_impl(&dword_1D8A54000, v57, OS_LOG_TYPE_ERROR, v56, buf, v58);
                goto LABEL_118;
              }
              if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCSessionParticipantRemote initWithConfig:delegate:].cold.8();
                }
                goto LABEL_118;
              }
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v40 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](v5, "performSelector:", sel_logPrefix);
              else
                v40 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() < 3)
                goto LABEL_118;
              v53 = VRTraceErrorLogLevelToCSTR();
              v50 = *MEMORY[0x1E0CF2758];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                goto LABEL_118;
              *(_DWORD *)buf = 136316162;
              v63 = v53;
              v64 = 2080;
              v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
              v66 = 1024;
              v67 = 201;
              v68 = 2112;
              v69 = (uint64_t)v40;
              v70 = 2048;
              v71 = v5;
              v51 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to process participant info!";
            }
            else
            {
              if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCSessionParticipantRemote initWithConfig:delegate:].cold.5();
                }
                goto LABEL_118;
              }
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v39 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](v5, "performSelector:", sel_logPrefix);
              else
                v39 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() < 3)
                goto LABEL_118;
              v52 = VRTraceErrorLogLevelToCSTR();
              v50 = *MEMORY[0x1E0CF2758];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                goto LABEL_118;
              *(_DWORD *)buf = 136316162;
              v63 = v52;
              v64 = 2080;
              v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
              v66 = 1024;
              v67 = 198;
              v68 = 2112;
              v69 = (uint64_t)v39;
              v70 = 2048;
              v71 = v5;
              v51 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to deserialize remote participant data!";
            }
          }
          else
          {
            if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCSessionParticipantRemote initWithConfig:delegate:].cold.4();
              }
              goto LABEL_118;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v38 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](v5, "performSelector:", sel_logPrefix);
            else
              v38 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
              goto LABEL_118;
            v49 = VRTraceErrorLogLevelToCSTR();
            v50 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              goto LABEL_118;
            *(_DWORD *)buf = 136316162;
            v63 = v49;
            v64 = 2080;
            v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
            v66 = 1024;
            v67 = 195;
            v68 = 2112;
            v69 = (uint64_t)v38;
            v70 = 2048;
            v71 = v5;
            v51 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Nil remote participant data!";
          }
          _os_log_error_impl(&dword_1D8A54000, v50, OS_LOG_TYPE_ERROR, v51, buf, 0x30u);
          goto LABEL_118;
        }
        if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantRemote initWithConfig:delegate:].cold.3();
          }
          goto LABEL_97;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v37 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](v5, "performSelector:", sel_logPrefix);
        else
          v37 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3
          || (v48 = VRTraceErrorLogLevelToCSTR(),
              v45 = *MEMORY[0x1E0CF2758],
              !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
        {
LABEL_97:
          v9 = 0;
          goto LABEL_118;
        }
        *(_DWORD *)buf = 136316162;
        v63 = v48;
        v64 = 2080;
        v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
        v66 = 1024;
        v67 = 187;
        v68 = 2112;
        v69 = (uint64_t)v37;
        v70 = 2048;
        v71 = v5;
        v46 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to copy local configuration!";
      }
      else
      {
        if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantRemote initWithConfig:delegate:].cold.2();
          }
          goto LABEL_97;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v36 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](v5, "performSelector:", sel_logPrefix);
        else
          v36 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_97;
        v47 = VRTraceErrorLogLevelToCSTR();
        v45 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_97;
        *(_DWORD *)buf = 136316162;
        v63 = v47;
        v64 = 2080;
        v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
        v66 = 1024;
        v67 = 184;
        v68 = 2112;
        v69 = (uint64_t)v36;
        v70 = 2048;
        v71 = v5;
        v46 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate positional info!";
      }
    }
    else
    {
      if ((VCSessionParticipantRemote *)objc_opt_class() == v5)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipantRemote initWithConfig:delegate:].cold.1();
        }
        goto LABEL_97;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v35 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](v5, "performSelector:", sel_logPrefix);
      else
        v35 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_97;
      v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_97;
      *(_DWORD *)buf = 136316162;
      v63 = v44;
      v64 = 2080;
      v65 = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
      v66 = 1024;
      v67 = 181;
      v68 = 2112;
      v69 = (uint64_t)v35;
      v70 = 2048;
      v71 = v5;
      v46 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed jitter target synchronizer  dictionary!";
    }
    _os_log_error_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_ERROR, v46, buf, 0x30u);
    goto LABEL_97;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  -[VCSessionParticipantRemote cleanupSpatialAudio](self, "cleanupSpatialAudio");
  -[VCSessionParticipantRemote cleanupNwActivity](self, "cleanupNwActivity");

  v3.receiver = self;
  v3.super_class = (Class)VCSessionParticipantRemote;
  -[VCSessionParticipant dealloc](&v3, sel_dealloc);
}

- (void)start
{
  NSObject *participantQueue;
  _QWORD v4[5];
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCSessionParticipantRemote;
  -[VCSessionParticipant start](&v5, sel_start);
  participantQueue = self->super._participantQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __35__VCSessionParticipantRemote_start__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(participantQueue, v4);
}

uint64_t __35__VCSessionParticipantRemote_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createAndResumeFetchTimer");
}

- (void)stop
{
  NSObject *participantQueue;
  objc_super v4;
  _QWORD block[6];

  block[5] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__VCSessionParticipantRemote_stop__block_invoke;
  block[3] = &unk_1E9E521C0;
  block[4] = self;
  dispatch_async(participantQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)VCSessionParticipantRemote;
  -[VCSessionParticipant stop](&v4, sel_stop);
}

uint64_t __34__VCSessionParticipantRemote_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAndReleaseFetchTimer");
}

- (void)detectConnectionTimingSource
{
  uint64_t v3;
  NSObject *v4;
  unint64_t idsParticipantID;
  const __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  double v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  VCSessionParticipantRemote *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
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
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  if (!self->_isConnectionTimingSourceDetected)
  {
    self->_isConnectionTimingSourceDetected = 1;
    self->_isCameraUsedForConnectionTiming = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteMediaStates, "objectForKeyedSubscript:", &unk_1E9EF4DF0), "unsignedIntValue") == 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        idsParticipantID = self->super._idsParticipantID;
        if (self->_isCameraUsedForConnectionTiming)
          v6 = CFSTR("video");
        else
          v6 = CFSTR("audio");
        *(_DWORD *)buf = 136316162;
        v24 = v3;
        v25 = 2080;
        v26 = "-[VCSessionParticipantRemote detectConnectionTimingSource]";
        v27 = 1024;
        v28 = 306;
        v29 = 2048;
        v30 = (VCSessionParticipantRemote *)idsParticipantID;
        v31 = 2112;
        v32 = v6;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Connection timing for participantID=%llu clocked by %@ for this call", buf, 0x30u);
      }
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = (id)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
    if (v21)
    {
      v20 = *(_QWORD *)v42;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(obj);
          v22 = v7;
          v8 = *(__CFString **)(*((_QWORD *)&v41 + 1) + 8 * v7);
          v9 = +[VCSessionParticipant mediaTypesFromStreamGroupID:](VCSessionParticipant, "mediaTypesFromStreamGroupID:", -[__CFString streamGroupID](v8, "streamGroupID"));
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v37 != v12)
                  objc_enumerationMutation(v9);
                v14 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteMediaStates, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i)), "unsignedIntValue");
                -[__CFString setEnabledAtStart:](v8, "setEnabledAtStart:", v14 == 1);
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v15 = VRTraceErrorLogLevelToCSTR();
                  v16 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136316418;
                    v17 = CFSTR("disabled");
                    if (v14 == 1)
                      v17 = CFSTR("enabled");
                    v24 = v15;
                    v25 = 2080;
                    v26 = "-[VCSessionParticipantRemote detectConnectionTimingSource]";
                    v27 = 1024;
                    v28 = 315;
                    v29 = 2112;
                    v30 = self;
                    v31 = 2112;
                    v32 = v8;
                    v33 = 2112;
                    v34 = v17;
                    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Remote participant=%@ has streamGroup=%@ %@ at start", buf, 0x3Au);
                  }
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
            }
            while (v11);
          }
          if (!self->_isCameraUsedForConnectionTiming)
            goto LABEL_28;
          if (-[__CFString streamGroupID](v8, "streamGroupID") != 1667329381)
          {
            if (self->_isCameraUsedForConnectionTiming)
              goto LABEL_31;
LABEL_28:
            if (-[__CFString streamGroupID](v8, "streamGroupID") != 1835623282)
              goto LABEL_31;
          }
          -[__CFString firstMediaFrameReceivedTime](v8, "firstMediaFrameReceivedTime");
          if (v18 != 0.0)
            -[VCSessionParticipantRemote reportConnectionTimingWithStreamGroupDispatched:](self, "reportConnectionTimingWithStreamGroupDispatched:", v8);
LABEL_31:
          v7 = v22 + 1;
        }
        while (v22 + 1 != v21);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
      }
      while (v21);
    }
  }
}

- (void)initializeParticipantType
{
  const __CFString *v3;
  unsigned int v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCSessionParticipantRemote *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF4E08)|| -[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF4E20))
  {
    v3 = CFSTR("webrtc");
    v4 = 1;
  }
  else if (-[VCSessionParticipant didNegotiateStreamGroupWithID:](self, "didNegotiateStreamGroupWithID:", 1650745716))
  {
    v3 = CFSTR("wolf");
    v4 = 2;
  }
  else
  {
    v3 = CFSTR("wolf");
    v4 = 2;
    if (!-[VCSessionParticipant didNegotiateStreamGroupWithID:](self, "didNegotiateStreamGroupWithID:", 1718909044))
    {
      v13 = -[VCSessionParticipant didNegotiateStreamGroupWithID:](self, "didNegotiateStreamGroupWithID:", 1717854580);
      v4 = v13 ? 2 : 0;
      if (!v13)
        v3 = CFSTR("native");
    }
  }
  self->_capabilities.participantType = v4;
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315906;
        v15 = v6;
        v16 = 2080;
        v17 = "-[VCSessionParticipantRemote initializeParticipantType]";
        v18 = 1024;
        v19 = 342;
        v20 = 2112;
        v21 = v3;
        v8 = "VCSessionParticipantRemote [%s] %s:%d remoteParticipantType=%@";
        v9 = v7;
        v10 = 38;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316418;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCSessionParticipantRemote initializeParticipantType]";
        v18 = 1024;
        v19 = 342;
        v20 = 2112;
        v21 = v5;
        v22 = 2048;
        v23 = self;
        v24 = 2112;
        v25 = v3;
        v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) remoteParticipantType=%@";
        v9 = v12;
        v10 = 58;
        goto LABEL_14;
      }
    }
  }
}

- (int)setupSpatialAudioWithMetadata:(void *)a3 spatialMetadataEntryMap:(__CFDictionary *)a4
{
  const __CFAllocator *v7;
  CFIndex Count;
  __CFDictionary *MutableCopy;
  int Entry;
  int v11;
  VCSessionParticipantRemote *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  NSMutableArray *micStreamGroups;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  CFTypeRef cf;
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
  CFTypeRef v62;
  __int16 v63;
  VCSessionParticipantRemote *v64;
  __int16 v65;
  CFTypeRef v66;
  __int16 v67;
  unsigned int v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  cf = 0;
  v48 = 0;
  -[VCSessionParticipantRemote cleanupSpatialAudio](self, "cleanupSpatialAudio");
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (a3 && a4)
  {
    Count = CFDictionaryGetCount(a4);
    MutableCopy = CFDictionaryCreateMutableCopy(v7, Count + 1, a4);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  }
  self->_mediaTypeToSpatialAudioMetadataEntryMap = MutableCopy;
  if (!MutableCopy)
  {
    v11 = -2143420414;
    if ((VCSessionParticipantRemote *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v27 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v27 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_28;
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_DWORD *)buf = 136316162;
      v56 = v37;
      v57 = 2080;
      v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
      v59 = 1024;
      v60 = 357;
      v61 = 2112;
      v62 = v27;
      v63 = 2048;
      v64 = self;
      v39 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate channel index map";
      v40 = v38;
      v41 = 48;
      goto LABEL_84;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:].cold.1();
    }
    goto LABEL_28;
  }
  if (!a3)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      {
LABEL_70:
        v11 = 0;
        goto LABEL_28;
      }
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      v11 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_DWORD *)buf = 136315650;
      v56 = v32;
      v57 = 2080;
      v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
      v59 = 1024;
      v60 = 360;
      v34 = "VCSessionParticipantRemote [%s] %s:%d spatialMetadata is NULL";
      v35 = v33;
      v36 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v28 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_70;
      v42 = VRTraceErrorLogLevelToCSTR();
      v43 = *MEMORY[0x1E0CF2758];
      v11 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_DWORD *)buf = 136316162;
      v56 = v42;
      v57 = 2080;
      v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
      v59 = 1024;
      v60 = 360;
      v61 = 2112;
      v62 = v28;
      v63 = 2048;
      v64 = self;
      v34 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) spatialMetadata is NULL";
      v35 = v43;
      v36 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
    goto LABEL_70;
  }
  Entry = VCSpatialAudioMetadata_CreateEntry((uint64_t)v7, (uint64_t)a3, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF4E38), "unsignedLongLongValue"), (uint64_t *)&cf);
  if (Entry < 0)
  {
    v11 = Entry;
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:].cold.2();
      }
      goto LABEL_28;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v29 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_28;
    v44 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 136316418;
    v56 = v44;
    v57 = 2080;
    v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
    v59 = 1024;
    v60 = 364;
    v61 = 2112;
    v62 = v29;
    v63 = 2048;
    v64 = self;
    v65 = 1024;
    LODWORD(v66) = v11;
    v39 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate spatial metadata entry. status=%08x";
LABEL_83:
    v40 = v45;
    v41 = 54;
LABEL_84:
    _os_log_error_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_ERROR, v39, buf, v41);
    goto LABEL_28;
  }
  v11 = VCSpatialAudioMetadata_ChannelIndex((uint64_t)cf, &v48);
  v12 = (VCSessionParticipantRemote *)objc_opt_class();
  if (v11 < 0)
  {
    if (v12 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:].cold.3();
      }
      goto LABEL_28;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v30 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v30 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_28;
    v46 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 136316418;
    v56 = v46;
    v57 = 2080;
    v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
    v59 = 1024;
    v60 = 367;
    v61 = 2112;
    v62 = v30;
    v63 = 2048;
    v64 = self;
    v65 = 1024;
    LODWORD(v66) = v11;
    v39 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to retrieve the channel index. status=%08x";
    goto LABEL_83;
  }
  if (v12 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_20;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 136316162;
    v56 = v14;
    v57 = 2080;
    v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
    v59 = 1024;
    v60 = 368;
    v61 = 2048;
    v62 = cf;
    v63 = 1024;
    LODWORD(v64) = v48;
    v16 = "VCSessionParticipantRemote [%s] %s:%d created entry=%p with channelIndex=%u";
    v17 = v15;
    v18 = 44;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_20;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 136316674;
    v56 = v19;
    v57 = 2080;
    v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
    v59 = 1024;
    v60 = 368;
    v61 = 2112;
    v62 = v13;
    v63 = 2048;
    v64 = self;
    v65 = 2048;
    v66 = cf;
    v67 = 1024;
    v68 = v48;
    v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) created entry=%p with channelIndex=%u";
    v17 = v20;
    v18 = 64;
  }
  _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_20:
  v11 = -[VCSessionParticipantRemote storeSpatialAudioMetadataEntry:forMediaType:](self, "storeSpatialAudioMetadataEntry:forMediaType:", cf, 0);
  if ((v11 & 0x80000000) == 0)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    micStreamGroups = self->super._micStreamGroups;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v52 != v24)
            objc_enumerationMutation(micStreamGroups);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "setAudioChannelIndex:", v48);
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
      }
      while (v23);
    }
    goto LABEL_28;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v31 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v31 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_28;
    v47 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_28;
    *(_DWORD *)buf = 136316418;
    v56 = v47;
    v57 = 2080;
    v58 = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
    v59 = 1024;
    v60 = 371;
    v61 = 2112;
    v62 = v31;
    v63 = 2048;
    v64 = self;
    v65 = 1024;
    LODWORD(v66) = v11;
    v39 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to store metadata entry for VCSessionMediaTypeMicrophone. status=%08x";
    goto LABEL_83;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:].cold.4();
  }
LABEL_28:
  if (cf)
    CFRelease(cf);
  return v11;
}

- (void)cleanupSpatialAudio
{
  __CFDictionary *mediaTypeToSpatialAudioMetadataEntryMap;

  mediaTypeToSpatialAudioMetadataEntryMap = self->_mediaTypeToSpatialAudioMetadataEntryMap;
  if (mediaTypeToSpatialAudioMetadataEntryMap)
  {
    CFRelease(mediaTypeToSpatialAudioMetadataEntryMap);
    self->_mediaTypeToSpatialAudioMetadataEntryMap = 0;
  }
}

- (void)spatialMetadataEntryForMediaType:(unsigned int)a3
{
  CFNumberRef v4;
  CFNumberRef v5;
  void *Value;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int valuePtr;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCSessionParticipantRemote *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  valuePtr = a3;
  if (!self->_mediaTypeToSpatialAudioMetadataEntryMap)
    return 0;
  v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  if (!v4)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote spatialMetadataEntryForMediaType:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v13 = v9;
          v14 = 2080;
          v15 = "-[VCSessionParticipantRemote spatialMetadataEntryForMediaType:]";
          v16 = 1024;
          v17 = 393;
          v18 = 2112;
          v19 = v8;
          v20 = 2048;
          v21 = self;
          _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate media type key", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  v5 = v4;
  Value = (void *)CFDictionaryGetValue(self->_mediaTypeToSpatialAudioMetadataEntryMap, v4);
  CFRelease(v5);
  return Value;
}

- (int)storeSpatialAudioMetadataEntry:(void *)a3 forMediaType:(unsigned int)a4
{
  CFNumberRef v6;
  CFNumberRef v7;
  int v8;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int valuePtr;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCSessionParticipantRemote *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  valuePtr = a4;
  v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  if (v6)
  {
    v7 = v6;
    CFDictionaryAddValue(self->_mediaTypeToSpatialAudioMetadataEntryMap, v6, a3);
    CFRelease(v7);
    return 0;
  }
  else
  {
    v8 = -2143420414;
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote storeSpatialAudioMetadataEntry:forMediaType:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v15 = v11;
          v16 = 2080;
          v17 = "-[VCSessionParticipantRemote storeSpatialAudioMetadataEntry:forMediaType:]";
          v18 = 1024;
          v19 = 405;
          v20 = 2112;
          v21 = v10;
          v22 = 2048;
          v23 = self;
          _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate media type key", buf, 0x30u);
        }
      }
    }
  }
  return v8;
}

- (NSDictionary)participantSpatialAudioSourceIDs
{
  __CFDictionary *mediaTypeToSpatialAudioMetadataEntryMap;
  NSDictionary *v4;
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
  VCSessionParticipantRemote *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  mediaTypeToSpatialAudioMetadataEntryMap = self->_mediaTypeToSpatialAudioMetadataEntryMap;
  if (mediaTypeToSpatialAudioMetadataEntryMap)
  {
    v4 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", CFDictionaryGetCount(mediaTypeToSpatialAudioMetadataEntryMap));
    CFDictionaryApplyFunction(self->_mediaTypeToSpatialAudioMetadataEntryMap, (CFDictionaryApplierFunction)_VCSessionParticipantRemote_AddMetaDataToSpatialAudioSourceID, v4);
  }
  else
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote participantSpatialAudioSourceIDs].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
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
          v12 = "-[VCSessionParticipantRemote participantSpatialAudioSourceIDs]";
          v13 = 1024;
          v14 = 417;
          v15 = 2112;
          v16 = v6;
          v17 = 2048;
          v18 = self;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to get spatial audio source IDs", (uint8_t *)&v9, 0x30u);
        }
      }
    }
    return 0;
  }
  return v4;
}

- (void)setAudioPaused:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCSessionParticipantRemote_setAudioPaused___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __45__VCSessionParticipantRemote_setAudioPaused___block_invoke(uint64_t a1)
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
  void *v13;
  _QWORD v15[5];
  char v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 376) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "updateActiveStateForStreamGroup:", objc_msgSend(*(id *)(a1 + 32), "audioGroup"));
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 376);
        *(_DWORD *)buf = 136315906;
        v18 = v3;
        v19 = 2080;
        v20 = "-[VCSessionParticipantRemote setAudioPaused:]_block_invoke";
        v21 = 1024;
        v22 = 430;
        v23 = 1024;
        LODWORD(v24) = v5;
        v6 = "VCSessionParticipantRemote [%s] %s:%d setAudioPaused=%d";
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
        v12 = *(unsigned __int8 *)(v11 + 376);
        *(_DWORD *)buf = 136316418;
        v18 = v9;
        v19 = 2080;
        v20 = "-[VCSessionParticipantRemote setAudioPaused:]_block_invoke";
        v21 = 1024;
        v22 = 430;
        v23 = 2112;
        v24 = v2;
        v25 = 2048;
        v26 = v11;
        v27 = 1024;
        v28 = v12;
        v6 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setAudioPaused=%d";
        v7 = v10;
        v8 = 54;
        goto LABEL_11;
      }
    }
  }
  v13 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__VCSessionParticipantRemote_setAudioPaused___block_invoke_45;
  v15[3] = &unk_1E9E55118;
  v15[4] = v13;
  v16 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v13, "callDelegateWithBlock:", v15);
}

uint64_t __45__VCSessionParticipantRemote_setAudioPaused___block_invoke_45(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:audioPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
}

- (void)dispatchedSetRemoteAudioPaused:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 remoteAudioPaused;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  _QWORD v23[5];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  VCSessionParticipantRemote *v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  if (self->_remoteAudioPaused != a3)
  {
    self->_remoteAudioPaused = a3;
    -[VCSessionParticipantRemote updateActiveStateForStreamGroup:](self, "updateActiveStateForStreamGroup:", -[VCSessionParticipantRemote audioGroup](self, "audioGroup"));
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      remoteAudioPaused = self->_remoteAudioPaused;
      *(_DWORD *)buf = 136315906;
      v25 = v12;
      v26 = 2080;
      v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioPaused:]";
      v28 = 1024;
      v29 = 441;
      v30 = 1024;
      LODWORD(v31) = remoteAudioPaused;
      v15 = "VCSessionParticipantRemote [%s] %s:%d setRemoteAudioPaused=%d";
      v16 = v13;
      v17 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v22 = self->_remoteAudioPaused;
      *(_DWORD *)buf = 136316418;
      v25 = v20;
      v26 = 2080;
      v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioPaused:]";
      v28 = 1024;
      v29 = 441;
      v30 = 2112;
      v31 = v6;
      v32 = 2048;
      v33 = self;
      v34 = 1024;
      v35 = v22;
      v15 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteAudioPaused=%d";
      v16 = v21;
      v17 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_24:
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __61__VCSessionParticipantRemote_dispatchedSetRemoteAudioPaused___block_invoke;
    v23[3] = &unk_1E9E55140;
    v23[4] = self;
    -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v23);
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v25 = v7;
        v26 = 2080;
        v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioPaused:]";
        v28 = 1024;
        v29 = 446;
        v30 = 1024;
        LODWORD(v31) = v3;
        v9 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteAudioPaused=%d";
        v10 = v8;
        v11 = 34;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v25 = v18;
        v26 = 2080;
        v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioPaused:]";
        v28 = 1024;
        v29 = 446;
        v30 = 2112;
        v31 = v5;
        v32 = 2048;
        v33 = self;
        v34 = 1024;
        v35 = v3;
        v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteAudioPaused=%d";
        v10 = v19;
        v11 = 54;
        goto LABEL_18;
      }
    }
  }
}

uint64_t __61__VCSessionParticipantRemote_dispatchedSetRemoteAudioPaused___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:remoteAudioPausedDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 715));
}

- (void)setRemoteAudioPaused:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCSessionParticipantRemote_setRemoteAudioPaused___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __51__VCSessionParticipantRemote_setRemoteAudioPaused___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetRemoteAudioPaused:", *(unsigned __int8 *)(a1 + 40));
}

- (void)dispatchedSetRemoteAudioEnabled:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 remoteAudioEnabled;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  _QWORD v23[5];
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  VCSessionParticipantRemote *v33;
  __int16 v34;
  _BOOL4 v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  if (self->_remoteAudioEnabled != a3)
  {
    self->_remoteAudioEnabled = a3;
    -[VCSessionParticipantRemote updateActiveStateForStreamGroup:](self, "updateActiveStateForStreamGroup:", -[VCSessionParticipantRemote audioGroup](self, "audioGroup"));
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      remoteAudioEnabled = self->_remoteAudioEnabled;
      *(_DWORD *)buf = 136315906;
      v25 = v12;
      v26 = 2080;
      v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioEnabled:]";
      v28 = 1024;
      v29 = 460;
      v30 = 1024;
      LODWORD(v31) = remoteAudioEnabled;
      v15 = "VCSessionParticipantRemote [%s] %s:%d setRemoteAudioEnabled=%d";
      v16 = v13;
      v17 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v22 = self->_remoteAudioEnabled;
      *(_DWORD *)buf = 136316418;
      v25 = v20;
      v26 = 2080;
      v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioEnabled:]";
      v28 = 1024;
      v29 = 460;
      v30 = 2112;
      v31 = v6;
      v32 = 2048;
      v33 = self;
      v34 = 1024;
      v35 = v22;
      v15 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteAudioEnabled=%d";
      v16 = v21;
      v17 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_24:
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __62__VCSessionParticipantRemote_dispatchedSetRemoteAudioEnabled___block_invoke;
    v23[3] = &unk_1E9E55140;
    v23[4] = self;
    -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v23);
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v25 = v7;
        v26 = 2080;
        v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioEnabled:]";
        v28 = 1024;
        v29 = 465;
        v30 = 1024;
        LODWORD(v31) = v3;
        v9 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteAudioEnabled:%d";
        v10 = v8;
        v11 = 34;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v25 = v18;
        v26 = 2080;
        v27 = "-[VCSessionParticipantRemote dispatchedSetRemoteAudioEnabled:]";
        v28 = 1024;
        v29 = 465;
        v30 = 2112;
        v31 = v5;
        v32 = 2048;
        v33 = self;
        v34 = 1024;
        v35 = v3;
        v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteAudioEnabled:%d";
        v10 = v19;
        v11 = 54;
        goto LABEL_18;
      }
    }
  }
}

uint64_t __62__VCSessionParticipantRemote_dispatchedSetRemoteAudioEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:remoteAudioEnabledDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 714));
}

- (void)setRemoteAudioEnabled:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VCSessionParticipantRemote_setRemoteAudioEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __52__VCSessionParticipantRemote_setRemoteAudioEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetRemoteAudioEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (id)updateActiveStateForStreamGroup:(id)a3
{
  id v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCSessionParticipantRemote;
  v5 = -[VCSessionParticipant updateActiveStateForStreamGroup:](&v7, sel_updateActiveStateForStreamGroup_);
  if (objc_msgSend(a3, "streamGroupID") == 1667329381)
    -[VCSessionParticipantRemote updateShouldEnableMLEnhance](self, "updateShouldEnableMLEnhance");
  return v5;
}

- (void)setVideoPaused:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCSessionParticipantRemote_setVideoPaused___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __45__VCSessionParticipantRemote_setVideoPaused___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  char v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 377) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "updateAudioSpectrumState");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "cameraGroups");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "updateActiveStateForStreamGroup:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v4);
  }
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__VCSessionParticipantRemote_setVideoPaused___block_invoke_2;
  v9[3] = &unk_1E9E55118;
  v9[4] = v7;
  v10 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v7, "callDelegateWithBlock:", v9);
}

uint64_t __45__VCSessionParticipantRemote_setVideoPaused___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:videoPaused:didSucceed:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 1, 0);
}

- (void)dispatchedSetRemoteVideoEnabled:(BOOL)a3
{
  int v3;
  int remoteVideoEnabled;
  VCSessionParticipantRemote *v6;
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
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  _QWORD v29[5];
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  VCSessionParticipantRemote *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  remoteVideoEnabled = self->_remoteVideoEnabled;
  v6 = (VCSessionParticipantRemote *)objc_opt_class();
  if (remoteVideoEnabled != v3)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v36 = v14;
          v37 = 2080;
          v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoEnabled:]";
          v39 = 1024;
          v40 = 501;
          v41 = 1024;
          LODWORD(v42) = v3;
          v16 = "VCSessionParticipantRemote [%s] %s:%d setRemoteVideoEnabled:%d";
          v17 = v15;
          v18 = 34;
LABEL_23:
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v36 = v21;
          v37 = 2080;
          v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoEnabled:]";
          v39 = 1024;
          v40 = 501;
          v41 = 2112;
          v42 = v8;
          v43 = 2048;
          v44 = self;
          v45 = 1024;
          v46 = v3;
          v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteVideoEnabled:%d";
          v17 = v22;
          v18 = 54;
          goto LABEL_23;
        }
      }
    }
    self->_remoteVideoEnabled = v3;
    -[VCSessionParticipantRemote updateAndHandleVideoMediaStall:isOneToOneStream:](self, "updateAndHandleVideoMediaStall:isOneToOneStream:", self->_isRemoteMediaStalled, self->_oneToOneVideoEnabled);
    -[VCSessionParticipantRemote updateAudioSpectrumState](self, "updateAudioSpectrumState");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = -[VCSessionParticipant cameraGroups](self, "cameraGroups");
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v28, "setRemoteVideoEnabled:", self->_remoteVideoEnabled);
          -[VCSessionParticipantRemote updateActiveStateForStreamGroup:](self, "updateActiveStateForStreamGroup:", v28);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
      }
      while (v25);
    }
    goto LABEL_31;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v36 = v9;
        v37 = 2080;
        v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoEnabled:]";
        v39 = 1024;
        v40 = 510;
        v41 = 1024;
        LODWORD(v42) = v3;
        v11 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteVideoEnabled:%d";
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
      v7 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v36 = v19;
        v37 = 2080;
        v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoEnabled:]";
        v39 = 1024;
        v40 = 510;
        v41 = 2112;
        v42 = v7;
        v43 = 2048;
        v44 = self;
        v45 = 1024;
        v46 = v3;
        v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteVideoEnabled:%d";
        v12 = v20;
        v13 = 54;
        goto LABEL_18;
      }
    }
  }
LABEL_31:
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __62__VCSessionParticipantRemote_dispatchedSetRemoteVideoEnabled___block_invoke;
  v29[3] = &unk_1E9E55140;
  v29[4] = self;
  -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v29);
}

uint64_t __62__VCSessionParticipantRemote_dispatchedSetRemoteVideoEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:remoteVideoEnabledDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 544));
}

- (void)setRemoteVideoEnabled:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VCSessionParticipantRemote_setRemoteVideoEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __52__VCSessionParticipantRemote_setRemoteVideoEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetRemoteVideoEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)dispatchedSetRemoteScreenEnabled:(BOOL)a3
{
  int v3;
  int remoteScreenEnabled;
  VCSessionParticipantRemote *v6;
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
  id v23;
  BOOL v24;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  _BOOL4 remoteSystemAudioPaused;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  _BOOL4 v36;
  _QWORD v37[5];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  _BYTE v45[10];
  VCSessionParticipantRemote *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v3 = a3;
  v51 = *MEMORY[0x1E0C80C00];
  remoteScreenEnabled = self->_remoteScreenEnabled;
  v6 = (VCSessionParticipantRemote *)objc_opt_class();
  if (remoteScreenEnabled != v3)
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
      v39 = v14;
      v40 = 2080;
      v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
      v42 = 1024;
      v43 = 525;
      v44 = 1024;
      *(_DWORD *)v45 = v3;
      v16 = "VCSessionParticipantRemote [%s] %s:%d setRemoteScreenEnabled:%d";
      v17 = v15;
      v18 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6
        || (v21 = VRTraceErrorLogLevelToCSTR(),
            v22 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_24:
        self->_remoteScreenEnabled = v3;
        v23 = -[VCSessionParticipantRemote screenGroup](self, "screenGroup");
        objc_msgSend(v23, "setRemoteVideoEnabled:", self->_remoteScreenEnabled);
        if (self->_remoteScreenEnabled)
        {
          objc_msgSend(v23, "start");
          objc_msgSend(-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"), "start");
          v24 = 0;
        }
        else
        {
          objc_msgSend(v23, "stop");
          objc_msgSend(-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"), "stop");
          v24 = 1;
        }
        self->_remoteSystemAudioPaused = v24;
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_38;
          v26 = VRTraceErrorLogLevelToCSTR();
          v27 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_38;
          v28 = objc_msgSend(v23, "state");
          remoteSystemAudioPaused = self->_remoteSystemAudioPaused;
          *(_DWORD *)buf = 136316162;
          v39 = v26;
          v40 = 2080;
          v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
          v42 = 1024;
          v43 = 539;
          v44 = 1024;
          *(_DWORD *)v45 = v28;
          *(_WORD *)&v45[4] = 1024;
          *(_DWORD *)&v45[6] = remoteSystemAudioPaused;
          v30 = "VCSessionParticipantRemote [%s] %s:%d Screen state=%d changed, remoteSystemAudioPaused:%d";
          v31 = v27;
          v32 = 40;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v25 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v25 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_38;
          v33 = VRTraceErrorLogLevelToCSTR();
          v34 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_38;
          v35 = objc_msgSend(v23, "state");
          v36 = self->_remoteSystemAudioPaused;
          *(_DWORD *)buf = 136316674;
          v39 = v33;
          v40 = 2080;
          v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
          v42 = 1024;
          v43 = 539;
          v44 = 2112;
          *(_QWORD *)v45 = v25;
          *(_WORD *)&v45[8] = 2048;
          v46 = self;
          v47 = 1024;
          v48 = v35;
          v49 = 1024;
          v50 = v36;
          v30 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Screen state=%d changed, remoteSystemAudioPaused:%d";
          v31 = v34;
          v32 = 60;
        }
        _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
LABEL_38:
        self->_remoteScreenEnabledStateChanged = 1;
        goto LABEL_39;
      }
      *(_DWORD *)buf = 136316418;
      v39 = v21;
      v40 = 2080;
      v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
      v42 = 1024;
      v43 = 525;
      v44 = 2112;
      *(_QWORD *)v45 = v8;
      *(_WORD *)&v45[8] = 2048;
      v46 = self;
      v47 = 1024;
      v48 = v3;
      v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteScreenEnabled:%d";
      v17 = v22;
      v18 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
    goto LABEL_24;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_39;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    *(_DWORD *)buf = 136315906;
    v39 = v9;
    v40 = 2080;
    v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
    v42 = 1024;
    v43 = 542;
    v44 = 1024;
    *(_DWORD *)v45 = v3;
    v11 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteScreenEnabled:%d";
    v12 = v10;
    v13 = 34;
    goto LABEL_18;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v39 = v19;
      v40 = 2080;
      v41 = "-[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:]";
      v42 = 1024;
      v43 = 542;
      v44 = 2112;
      *(_QWORD *)v45 = v7;
      *(_WORD *)&v45[8] = 2048;
      v46 = self;
      v47 = 1024;
      v48 = v3;
      v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteScreenEnabled:%d";
      v12 = v20;
      v13 = 54;
LABEL_18:
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
LABEL_39:
  if (self->_remoteScreenEnabledStateChanged)
  {
    self->_remoteScreenEnabledStateChanged = 0;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __63__VCSessionParticipantRemote_dispatchedSetRemoteScreenEnabled___block_invoke;
    v37[3] = &unk_1E9E55140;
    v37[4] = self;
    -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v37);
  }
}

uint64_t __63__VCSessionParticipantRemote_dispatchedSetRemoteScreenEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:remoteScreenEnabledDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 545));
}

- (void)dispatchedSetScreenControlEnabled:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  _BOOL4 v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  VCMediaStream *v23;
  unsigned int v24;
  uint64_t v25;
  id v26;
  _BOOL8 v27;
  const __CFString *v28;
  NSString *uuid;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BYTE v37[10];
  VCSessionParticipantRemote *v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v3 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  if (self->_screenControlEnabled != a3)
  {
    v6 = +[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceScreenControlJitterBufferModeFixed"), 0);
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6
        || (v13 = VRTraceErrorLogLevelToCSTR(),
            v14 = *MEMORY[0x1E0CF2758],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_24:
        self->_screenControlEnabled = v3;
        v28 = CFSTR("VCSPUUID");
        uuid = self->super._uuid;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &uuid, &v28, 1);
        -[VCSessionParticipant reportingAgent](self, "reportingAgent");
        reportingGenericEvent();
        v22 = (void *)objc_msgSend(-[VCSessionParticipantRemote systemAudioStreamInfo](self, "systemAudioStreamInfo"), "stream");
        v23 = -[VCSessionParticipantMediaStreamInfo stream](-[VCSessionParticipantRemote screenStreamInfo](self, "screenStreamInfo"), "stream");
        if (v6)
          v24 = 3;
        else
          v24 = 1;
        if (self->_screenControlEnabled)
          v25 = v24;
        else
          v25 = 2;
        objc_msgSend(v22, "setJitterBufferMode:");
        -[VCMediaStream setJitterBufferMode:](v23, "setJitterBufferMode:", v25);
        v26 = -[NSArray firstObject](-[VCSessionParticipantMediaStreamInfo streamConfigs](-[VCSessionParticipantRemote screenStreamInfo](self, "screenStreamInfo"), "streamConfigs"), "firstObject");
        if (objc_msgSend(v26, "looseAVSyncEnabled"))
          -[VCMediaStream setLooseAVSyncEnabled:](v23, "setLooseAVSyncEnabled:", !v3);
        v27 = !v3;
        if (objc_msgSend(v26, "deferredAssemblyEnabled"))
          -[VCMediaStream setDeferredAssemblyEnabled:](v23, "setDeferredAssemblyEnabled:", v27);
        VCJBTargetEstimatorSynchronizer_SetPolicy(objc_msgSend(v26, "jbTargetEstimatorSynchronizer"), v27);
        return;
      }
      *(_DWORD *)buf = 136316162;
      v31 = v13;
      v32 = 2080;
      v33 = "-[VCSessionParticipantRemote dispatchedSetScreenControlEnabled:]";
      v34 = 1024;
      v35 = 555;
      v36 = 1024;
      *(_DWORD *)v37 = v3;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v6;
      v15 = "VCSessionParticipantRemote [%s] %s:%d setScreenControlEnabled=%d forceScreenControlJitterBufferModeFixed=%d";
      v16 = v14;
      v17 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)buf = 136316674;
      v31 = v20;
      v32 = 2080;
      v33 = "-[VCSessionParticipantRemote dispatchedSetScreenControlEnabled:]";
      v34 = 1024;
      v35 = 555;
      v36 = 2112;
      *(_QWORD *)v37 = v7;
      *(_WORD *)&v37[8] = 2048;
      v38 = self;
      v39 = 1024;
      v40 = v3;
      v41 = 1024;
      v42 = v6;
      v15 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setScreenControlEnabled=%d forceScreenControlJitterBufferModeFixed=%d";
      v16 = v21;
      v17 = 60;
    }
    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_24;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v31 = v8;
        v32 = 2080;
        v33 = "-[VCSessionParticipantRemote dispatchedSetScreenControlEnabled:]";
        v34 = 1024;
        v35 = 580;
        v36 = 1024;
        *(_DWORD *)v37 = v3;
        v10 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setScreenControlEnabled:%d";
        v11 = v9;
        v12 = 34;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v31 = v18;
        v32 = 2080;
        v33 = "-[VCSessionParticipantRemote dispatchedSetScreenControlEnabled:]";
        v34 = 1024;
        v35 = 580;
        v36 = 2112;
        *(_QWORD *)v37 = v5;
        *(_WORD *)&v37[8] = 2048;
        v38 = self;
        v39 = 1024;
        v40 = v3;
        v10 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setScreenControlEnabled:%d";
        v11 = v19;
        v12 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)setScreenControlEnabled:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCSessionParticipantRemote_setScreenControlEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __54__VCSessionParticipantRemote_setScreenControlEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetScreenControlEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setRemoteScreenEnabled:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VCSessionParticipantRemote_setRemoteScreenEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __53__VCSessionParticipantRemote_setRemoteScreenEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetRemoteScreenEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)dispatchedSetRemoteSystemAudioPaused:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VCSessionParticipantRemote_dispatchedSetRemoteSystemAudioPaused___block_invoke;
  block[3] = &unk_1E9E521E8;
  v5 = a3;
  block[4] = self;
  dispatch_async(participantQueue, block);
}

void __67__VCSessionParticipantRemote_dispatchedSetRemoteSystemAudioPaused___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  _BYTE *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 547);
  v4 = objc_opt_class();
  v5 = *(_QWORD *)(a1 + 32);
  if (v2 != v3)
  {
    if (v4 == v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v16 = *(unsigned __int8 *)(a1 + 40);
      v29 = 136315906;
      v30 = v14;
      v31 = 2080;
      v32 = "-[VCSessionParticipantRemote dispatchedSetRemoteSystemAudioPaused:]_block_invoke";
      v33 = 1024;
      v34 = 599;
      v35 = 1024;
      LODWORD(v36) = v16;
      v17 = "VCSessionParticipantRemote [%s] %s:%d setRemoteSystemAudioPaused:%d";
      v18 = v15;
      v19 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_24;
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(unsigned __int8 *)(a1 + 40);
      v29 = 136316418;
      v30 = v24;
      v31 = 2080;
      v32 = "-[VCSessionParticipantRemote dispatchedSetRemoteSystemAudioPaused:]_block_invoke";
      v33 = 1024;
      v34 = 599;
      v35 = 2112;
      v36 = v7;
      v37 = 2048;
      v38 = v26;
      v39 = 1024;
      v40 = v27;
      v17 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteSystemAudioPaused:%d";
      v18 = v25;
      v19 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v29, v19);
LABEL_24:
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 547) = *(_BYTE *)(a1 + 40);
    v28 = *(_BYTE **)(a1 + 32);
    if (v28[547])
    {
      objc_msgSend((id)objc_msgSend(v28, "systemAudioGroup"), "pause");
      objc_msgSend(*(id *)(a1 + 32), "swapScreenStreamGroupSyncSourceWithState:", 2);
    }
    else
    {
      objc_msgSend(v28, "swapScreenStreamGroupSyncSourceWithState:", 1);
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "systemAudioGroup"), "resume");
    }
    return;
  }
  if (v4 == v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(unsigned __int8 *)(a1 + 40);
        v29 = 136315906;
        v30 = v8;
        v31 = 2080;
        v32 = "-[VCSessionParticipantRemote dispatchedSetRemoteSystemAudioPaused:]_block_invoke";
        v33 = 1024;
        v34 = 609;
        v35 = 1024;
        LODWORD(v36) = v10;
        v11 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteSystemAudioPaused:%d";
        v12 = v9;
        v13 = 34;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v29, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(unsigned __int8 *)(a1 + 40);
        v29 = 136316418;
        v30 = v20;
        v31 = 2080;
        v32 = "-[VCSessionParticipantRemote dispatchedSetRemoteSystemAudioPaused:]_block_invoke";
        v33 = 1024;
        v34 = 609;
        v35 = 2112;
        v36 = v6;
        v37 = 2048;
        v38 = v22;
        v39 = 1024;
        v40 = v23;
        v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteSystemAudioPaused:%d";
        v12 = v21;
        v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)setRemoteSystemAudioPaused:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCSessionParticipantRemote_setRemoteSystemAudioPaused___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __57__VCSessionParticipantRemote_setRemoteSystemAudioPaused___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetRemoteSystemAudioPaused:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setTransitionToEnabled:(unsigned int)a3
{
  uint64_t v3;
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
  VCSessionParticipantRemote *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)&a3;
  switch(a3)
  {
    case 0u:
      -[VCSessionParticipantRemote dispatchedSetRemoteAudioEnabled:](self, "dispatchedSetRemoteAudioEnabled:", 1);
      -[VCSessionParticipantRemote dispatchedSetRemoteAudioPaused:](self, "dispatchedSetRemoteAudioPaused:", 0);
      break;
    case 1u:
      -[VCSessionParticipantRemote dispatchedSetRemoteVideoEnabled:](self, "dispatchedSetRemoteVideoEnabled:", 1);
      -[VCSessionParticipantRemote dispatchedSetRemoteVideoPaused:](self, "dispatchedSetRemoteVideoPaused:", 0);
      break;
    case 2u:
      -[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:](self, "dispatchedSetRemoteScreenEnabled:", 1);
      break;
    case 3u:
      -[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:](self, "swapScreenStreamGroupSyncSourceWithState:", 1);
      objc_msgSend(-[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", 1937339233), "resume");
      break;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      if (-[VCSessionParticipant updateMediaState:forStreamGroups:](self, "updateMediaState:forStreamGroups:", 1, -[VCSessionParticipant streamGroupsForMediaType:](self, "streamGroupsForMediaType:", *(_QWORD *)&a3)))
      {
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantRemote setTransitionToEnabled:].cold.1();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
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
              v11 = "-[VCSessionParticipantRemote setTransitionToEnabled:]";
              v12 = 1024;
              v13 = 645;
              v14 = 2112;
              v15 = v5;
              v16 = 2048;
              v17 = self;
              v18 = 2112;
              v19 = VCSessionMediaType_Name(v3);
              _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to update mediaState=enabled for mediaType=%@", (uint8_t *)&v8, 0x3Au);
            }
          }
        }
      }
      break;
    default:
      return;
  }
}

- (void)setTransitionToPaused:(unsigned int)a3
{
  uint64_t v3;
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
  VCSessionParticipantRemote *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)&a3;
  switch(a3)
  {
    case 0u:
      -[VCSessionParticipantRemote dispatchedSetRemoteAudioPaused:](self, "dispatchedSetRemoteAudioPaused:", 1);
      break;
    case 1u:
      if (!self->_remoteVideoEnabled)
        -[VCSessionParticipantRemote dispatchedSetRemoteVideoEnabled:](self, "dispatchedSetRemoteVideoEnabled:", 1);
      -[VCSessionParticipantRemote dispatchedSetRemoteVideoPaused:](self, "dispatchedSetRemoteVideoPaused:", 1);
      break;
    case 2u:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote setTransitionToPaused:].cold.1();
      }
      break;
    case 3u:
      objc_msgSend(-[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", 1937339233), "pause");
      -[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:](self, "swapScreenStreamGroupSyncSourceWithState:", 2);
      break;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      if (-[VCSessionParticipant updateMediaState:forStreamGroups:](self, "updateMediaState:forStreamGroups:", 2, -[VCSessionParticipant streamGroupsForMediaType:](self, "streamGroupsForMediaType:", *(_QWORD *)&a3)))
      {
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantRemote setTransitionToPaused:].cold.2();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
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
              v11 = "-[VCSessionParticipantRemote setTransitionToPaused:]";
              v12 = 1024;
              v13 = 679;
              v14 = 2112;
              v15 = v5;
              v16 = 2048;
              v17 = self;
              v18 = 2112;
              v19 = VCSessionMediaType_Name(v3);
              _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to update mediaState=paused for mediaType=%@", (uint8_t *)&v8, 0x3Au);
            }
          }
        }
      }
      break;
    default:
      return;
  }
}

- (void)setTransitionToDisabled:(unsigned int)a3
{
  uint64_t v3;
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
  VCSessionParticipantRemote *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)&a3;
  switch(a3)
  {
    case 0u:
      -[VCSessionParticipantRemote dispatchedSetRemoteAudioEnabled:](self, "dispatchedSetRemoteAudioEnabled:", 0);
      break;
    case 1u:
      -[VCSessionParticipantRemote dispatchedSetRemoteVideoEnabled:](self, "dispatchedSetRemoteVideoEnabled:", 0);
      break;
    case 2u:
      -[VCSessionParticipantRemote dispatchedSetRemoteScreenEnabled:](self, "dispatchedSetRemoteScreenEnabled:", 0);
      break;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      if (-[VCSessionParticipant updateMediaState:forStreamGroups:](self, "updateMediaState:forStreamGroups:", 0, -[VCSessionParticipant streamGroupsForMediaType:](self, "streamGroupsForMediaType:", *(_QWORD *)&a3)))
      {
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantRemote setTransitionToDisabled:].cold.1();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
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
              v11 = "-[VCSessionParticipantRemote setTransitionToDisabled:]";
              v12 = 1024;
              v13 = 705;
              v14 = 2112;
              v15 = v5;
              v16 = 2048;
              v17 = self;
              v18 = 2112;
              v19 = VCSessionMediaType_Name(v3);
              _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to update mediaState=disabled for mediaType=%@", (uint8_t *)&v8, 0x3Au);
            }
          }
        }
      }
      break;
    default:
      return;
  }
}

- (id)updateMediaState:(unsigned int)a3 forStreamGroup:(id)a4
{
  id v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  VCSessionParticipantRemote *v20;
  __int16 v21;
  __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = -[VCSessionParticipant updateMediaState:forStreamGroups:](self, "updateMediaState:forStreamGroups:", *(_QWORD *)&a3, objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a4));
  if (v6)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote updateMediaState:forStreamGroup:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v11 = 136316418;
          v12 = v8;
          v13 = 2080;
          v14 = "-[VCSessionParticipantRemote updateMediaState:forStreamGroup:]";
          v15 = 1024;
          v16 = 717;
          v17 = 2112;
          v18 = v7;
          v19 = 2048;
          v20 = self;
          v21 = 2112;
          v22 = VCSessionMediaType_Name(objc_msgSend(a4, "mediaType"));
          _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to update mediaState=disabled for mediaType=%@", (uint8_t *)&v11, 0x3Au);
        }
      }
    }
  }
  return v6;
}

- (void)setRemoteMediaState:(id)a3 forMediaType:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  NSMutableDictionary *remoteMediaStates;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  __CFString *v22;
  __CFString *v23;
  NSMutableDictionary *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  _BYTE v32[24];
  __int128 v33;
  void *v34;
  _BYTE v35[32];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a4, "unsignedIntValue");
  v8 = objc_msgSend(a3, "unsignedIntValue");
  v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_remoteMediaStates, "objectForKeyedSubscript:", a4);
  if (!v9 || objc_msgSend(a3, "isEqualToNumber:", v9))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_17;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v14 = VCSessionMediaState_Name(v8);
      v15 = VCSessionMediaType_Name(v7);
      remoteMediaStates = self->_remoteMediaStates;
      *(_DWORD *)v32 = 136316418;
      *(_QWORD *)&v32[4] = v12;
      *(_WORD *)&v32[12] = 2080;
      *(_QWORD *)&v32[14] = "-[VCSessionParticipantRemote setRemoteMediaState:forMediaType:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 727;
      WORD2(v33) = 2112;
      *(_QWORD *)((char *)&v33 + 6) = v14;
      HIWORD(v33) = 2112;
      v34 = v15;
      *(_WORD *)v35 = 2112;
      *(_QWORD *)&v35[2] = remoteMediaStates;
      v17 = "VCSessionParticipantRemote [%s] %s:%d Setting remote mediaState=%@ for mediaType=%@ _remoteMediaStates=%@";
      v18 = v13;
      v19 = 58;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_17;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v22 = VCSessionMediaState_Name(v8);
      v23 = VCSessionMediaType_Name(v7);
      v24 = self->_remoteMediaStates;
      *(_DWORD *)v32 = 136316930;
      *(_QWORD *)&v32[4] = v20;
      *(_WORD *)&v32[12] = 2080;
      *(_QWORD *)&v32[14] = "-[VCSessionParticipantRemote setRemoteMediaState:forMediaType:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 727;
      WORD2(v33) = 2112;
      *(_QWORD *)((char *)&v33 + 6) = v10;
      HIWORD(v33) = 2048;
      v34 = self;
      *(_WORD *)v35 = 2112;
      *(_QWORD *)&v35[2] = v22;
      *(_WORD *)&v35[10] = 2112;
      *(_QWORD *)&v35[12] = v23;
      *(_WORD *)&v35[20] = 2112;
      *(_QWORD *)&v35[22] = v24;
      v17 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Setting remote mediaState=%@ for mediaType=%@ _remoteMediaStates=%@";
      v18 = v21;
      v19 = 78;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, v32, v19);
LABEL_17:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_remoteMediaStates, "setObject:forKeyedSubscript:", a3, a4, *(_OWORD *)v32, *(_QWORD *)&v32[16], v33, v34, *(_OWORD *)v35, *(_OWORD *)&v35[16]);
    objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", a4), "setRemoteMediaState:", objc_msgSend(a3, "unsignedIntValue"));
    if ((_DWORD)v8)
    {
      if ((_DWORD)v8 == 2)
      {
        -[VCSessionParticipantRemote setTransitionToPaused:](self, "setTransitionToPaused:", v7);
      }
      else if ((_DWORD)v8 == 1)
      {
        -[VCSessionParticipantRemote setTransitionToEnabled:](self, "setTransitionToEnabled:", v7);
      }
    }
    else
    {
      -[VCSessionParticipantRemote setTransitionToDisabled:](self, "setTransitionToDisabled:", v7);
    }
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v32 = 136316162;
        *(_QWORD *)&v32[4] = v25;
        *(_WORD *)&v32[12] = 2080;
        *(_QWORD *)&v32[14] = "-[VCSessionParticipantRemote setRemoteMediaState:forMediaType:]";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 743;
        WORD2(v33) = 2112;
        *(_QWORD *)((char *)&v33 + 6) = VCSessionMediaState_Name(v8);
        HIWORD(v33) = 2112;
        v34 = VCSessionMediaType_Name(v7);
        v27 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteState=%@ forMediaType=%@";
        v28 = v26;
        v29 = 48;
LABEL_30:
        _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v27, v32, v29);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v32 = 136316674;
        *(_QWORD *)&v32[4] = v30;
        *(_WORD *)&v32[12] = 2080;
        *(_QWORD *)&v32[14] = "-[VCSessionParticipantRemote setRemoteMediaState:forMediaType:]";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 743;
        WORD2(v33) = 2112;
        *(_QWORD *)((char *)&v33 + 6) = v11;
        HIWORD(v33) = 2048;
        v34 = self;
        *(_WORD *)v35 = 2112;
        *(_QWORD *)&v35[2] = VCSessionMediaState_Name(v8);
        *(_WORD *)&v35[10] = 2112;
        *(_QWORD *)&v35[12] = VCSessionMediaType_Name(v7);
        v27 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteState=%@ forMediaType=%@";
        v28 = v31;
        v29 = 68;
        goto LABEL_30;
      }
    }
  }
}

- (id)newSupportedRemoteMediaTypeStatesDict:(id)a3
{
  void *v5;
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__VCSessionParticipantRemote_newSupportedRemoteMediaTypeStatesDict___block_invoke;
  v7[3] = &unk_1E9E55168;
  v7[4] = self;
  v7[5] = v5;
  v7[6] = a3;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);
  return v5;
}

void __68__VCSessionParticipantRemote_newSupportedRemoteMediaTypeStatesDict___block_invoke(id *a1, void *a2, void *a3)
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  __CFString *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*((id *)a1[4] + 48), "objectForKeyedSubscript:", a2))
  {
    objc_msgSend(a1[5], "setObject:forKeyedSubscript:", objc_msgSend(a1[6], "objectForKeyedSubscript:", a2), a2);
    return;
  }
  if ((id)objc_opt_class() == a1[4])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136316162;
        v16 = v7;
        v17 = 2080;
        v18 = "-[VCSessionParticipantRemote newSupportedRemoteMediaTypeStatesDict:]_block_invoke";
        v19 = 1024;
        v20 = 755;
        v21 = 2112;
        v22 = VCSessionMediaType_Name(objc_msgSend(a2, "unsignedIntValue"));
        v23 = 2112;
        v24 = VCSessionMediaState_Name(objc_msgSend(a3, "unsignedIntValue"));
        v9 = "VCSessionParticipantRemote [%s] %s:%d mediaType=%@ not supported. Ignore set remote mediaState=%@";
        v10 = v8;
        v11 = 48;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(a1[4], "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = (__CFString *)a1[4];
        v15 = 136316674;
        v16 = v12;
        v17 = 2080;
        v18 = "-[VCSessionParticipantRemote newSupportedRemoteMediaTypeStatesDict:]_block_invoke";
        v19 = 1024;
        v20 = 755;
        v21 = 2112;
        v22 = (__CFString *)v6;
        v23 = 2048;
        v24 = v14;
        v25 = 2112;
        v26 = VCSessionMediaType_Name(objc_msgSend(a2, "unsignedIntValue"));
        v27 = 2112;
        v28 = VCSessionMediaState_Name(objc_msgSend(a3, "unsignedIntValue"));
        v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) mediaType=%@ not supported. Ignore set remote mediaState=%@";
        v10 = v13;
        v11 = 68;
        goto LABEL_13;
      }
    }
  }
}

- (void)setRemoteMediaTypeStates:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(participantQueue, block);
}

void __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  int v16;
  int v17;
  void *v18;
  _QWORD v19[5];
  int v20;
  int v21;
  _QWORD v22[6];
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cancelAndReleaseFetchTimer");
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "newSupportedRemoteMediaTypeStatesDict:", *(_QWORD *)(a1 + 40));
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke_2;
  v22[3] = &unk_1E9E55190;
  v22[4] = *(_QWORD *)(a1 + 32);
  v22[5] = v2;
  v4 = (void *)v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v22);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = (void *)objc_msgSend(v3, "allKeys");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "setRemoteMediaState:forMediaType:", objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    }
    while (v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "updateAudioSpectrumState");
  objc_msgSend(*(id *)(a1 + 32), "detectConnectionTimingSource");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = (void *)objc_msgSend(v4, "allKeys");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
        v16 = objc_msgSend(v15, "unsignedIntValue");
        v17 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", v15), "unsignedIntValue");
        v18 = *(void **)(a1 + 32);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke_3;
        v19[3] = &unk_1E9E551B8;
        v19[4] = v18;
        v20 = v17;
        v21 = v16;
        objc_msgSend(v18, "callDelegateWithBlock:", v19);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    }
    while (v12);
  }

}

uint64_t __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t result;

  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "objectForKeyedSubscript:", a2);
  if (!v6 || (result = objc_msgSend(v6, "isEqualToNumber:", a3), (result & 1) == 0))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 728), "setObject:forKeyedSubscript:", a3, a2);
    return objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", a3, a2);
  }
  return result;
}

uint64_t __55__VCSessionParticipantRemote_setRemoteMediaTypeStates___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:remoteMediaStateDidChange:forMediaType:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
}

- (unsigned)remoteMediaStateForMediaType:(unsigned int)a3
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteMediaStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3)), "unsignedIntValue");
}

- (void)dispatchedSetRemoteVideoPaused:(BOOL)a3
{
  int v3;
  int remoteVideoPaused;
  VCSessionParticipantRemote *v6;
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
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  _QWORD v29[5];
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  VCSessionParticipantRemote *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  remoteVideoPaused = self->_remoteVideoPaused;
  v6 = (VCSessionParticipantRemote *)objc_opt_class();
  if (remoteVideoPaused != v3)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)buf = 136315906;
      v36 = v14;
      v37 = 2080;
      v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoPaused:]";
      v39 = 1024;
      v40 = 803;
      v41 = 1024;
      LODWORD(v42) = v3;
      v16 = "VCSessionParticipantRemote [%s] %s:%d setRemoteVideoPaused=%d";
      v17 = v15;
      v18 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)buf = 136316418;
      v36 = v21;
      v37 = 2080;
      v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoPaused:]";
      v39 = 1024;
      v40 = 803;
      v41 = 2112;
      v42 = v8;
      v43 = 2048;
      v44 = self;
      v45 = 1024;
      v46 = v3;
      v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setRemoteVideoPaused=%d";
      v17 = v22;
      v18 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_24:
    self->_remoteVideoPaused = v3;
    -[VCSessionParticipantRemote updateAndHandleVideoMediaStall:isOneToOneStream:](self, "updateAndHandleVideoMediaStall:isOneToOneStream:", self->_isRemoteMediaStalled, self->_oneToOneVideoEnabled);
    -[VCSessionParticipantRemote updateAudioSpectrumState](self, "updateAudioSpectrumState");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = -[VCSessionParticipant cameraGroups](self, "cameraGroups");
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v32 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v28, "setRemoteVideoPaused:", self->_remoteVideoPaused);
          -[VCSessionParticipantRemote updateActiveStateForStreamGroup:](self, "updateActiveStateForStreamGroup:", v28);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
      }
      while (v25);
    }
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __61__VCSessionParticipantRemote_dispatchedSetRemoteVideoPaused___block_invoke;
    v29[3] = &unk_1E9E55140;
    v29[4] = self;
    -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v29);
    return;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v36 = v9;
        v37 = 2080;
        v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoPaused:]";
        v39 = 1024;
        v40 = 815;
        v41 = 1024;
        LODWORD(v42) = v3;
        v11 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteVideoPaused=%d";
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
      v7 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v36 = v19;
        v37 = 2080;
        v38 = "-[VCSessionParticipantRemote dispatchedSetRemoteVideoPaused:]";
        v39 = 1024;
        v40 = 815;
        v41 = 2112;
        v42 = v7;
        v43 = 2048;
        v44 = self;
        v45 = 1024;
        v46 = v3;
        v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteVideoPaused=%d";
        v12 = v20;
        v13 = 54;
        goto LABEL_18;
      }
    }
  }
}

uint64_t __61__VCSessionParticipantRemote_dispatchedSetRemoteVideoPaused___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:remoteVideoPausedDidChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 546));
}

- (void)setRemoteVideoPaused:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCSessionParticipantRemote_setRemoteVideoPaused___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __51__VCSessionParticipantRemote_setRemoteVideoPaused___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetRemoteVideoPaused:", *(unsigned __int8 *)(a1 + 40));
}

- (id)applyVideoEnabledSetting:(BOOL)a3
{
  int v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int videoEnabled;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  VCSessionParticipantRemote *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v3 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v28 = v6;
        v29 = 2080;
        v30 = "-[VCSessionParticipantRemote applyVideoEnabledSetting:]";
        v31 = 1024;
        v32 = 828;
        v33 = 1024;
        LODWORD(v34) = v3;
        v8 = "VCSessionParticipantRemote [%s] %s:%d Changing participant videoEnabled to %d";
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
      v5 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v28 = v11;
        v29 = 2080;
        v30 = "-[VCSessionParticipantRemote applyVideoEnabledSetting:]";
        v31 = 1024;
        v32 = 828;
        v33 = 2112;
        v34 = v5;
        v35 = 2048;
        v36 = self;
        v37 = 1024;
        v38 = v3;
        v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Changing participant videoEnabled to %d";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  videoEnabled = self->super._videoEnabled;
  self->super._videoEnabled = v3;
  -[VCSessionParticipantRemote updateAudioSpectrumState](self, "updateAudioSpectrumState");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = -[VCSessionParticipant cameraGroups](self, "cameraGroups");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = -[VCSessionParticipantRemote updateActiveStateForStreamGroup:](self, "updateActiveStateForStreamGroup:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
        if (v19)
        {
          v20 = v19;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantRemote applyVideoEnabledSetting:].cold.1();
          }
          return v20;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      if (v16)
        continue;
      break;
    }
  }
  if (videoEnabled != v3 && self->super._oneToOneModeEnabled)
    objc_msgSend(-[VCSessionParticipant microphoneGroup](self, "microphoneGroup"), "setDeviceRole:operatingMode:", -[VCSessionParticipantOneToOneConfig deviceRole](-[VCSessionParticipant oneToOneConfig](self, "oneToOneConfig"), "deviceRole"), -[VCSessionParticipant operatingMode](self, "operatingMode"));
  return 0;
}

- (void)updateDownlinkBandwithAllocatorClientConfigurations:(id)a3
{
  -[VCSessionParticipantRemote setVideoQuality:](self, "setVideoQuality:", objc_msgSend(a3, "videoQuality"));
  -[VCSessionParticipantRemote setVisibilityIndex:](self, "setVisibilityIndex:", objc_msgSend(a3, "visibilityIndex"));
  -[VCSessionParticipantRemote updateAudioSpectrumState](self, "updateAudioSpectrumState");
}

- (void)setVideoQuality:(unsigned __int8)a3
{
  uint64_t v3;
  int videoQuality;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  const __CFString *v16;
  _QWORD v17[2];

  v3 = a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  videoQuality = self->_videoQuality;
  if (a3 != 10 && videoQuality == 10 || a3 == 10 && videoQuality != 10)
  {
    -[VCSessionParticipant reportingAgent](self, "reportingAgent");
    v16 = CFSTR("VCSPUUID");
    v17[0] = self->super._uuid;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    reportingGenericEvent();
  }
  self->_videoQuality = v3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[VCSessionParticipant cameraGroupsExt](self, "cameraGroupsExt");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "setVideoQuality:", v3);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v8);
  }
  -[VCSessionParticipant participantVideoToken](self, "participantVideoToken");
  kdebug_trace();
  -[VCSessionParticipantRemote updateShouldEnableFaceZoom](self, "updateShouldEnableFaceZoom");
  -[VCSessionParticipantRemote updateShouldEnableMLEnhance](self, "updateShouldEnableMLEnhance");
}

- (void)setVisibilityIndex:(unsigned int)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCSessionParticipantRemote_setVisibilityIndex___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __49__VCSessionParticipantRemote_setVisibilityIndex___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 552) = +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("forceVisibilityIndex"), *(unsigned int *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "participantVideoToken");
  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "updateAndHandleVideoMediaStall:isOneToOneStream:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 578), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 626));
  objc_msgSend(*(id *)(a1 + 32), "updateAudioSpectrumState");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "cameraGroupsExt");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "setVisibilityIndex:", *(unsigned int *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 32), "updateActiveStateForStreamGroup:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "updateShouldEnableFaceZoom");
  return objc_msgSend(*(id *)(a1 + 32), "updateShouldEnableMLEnhance");
}

- (void)setProminenceIndex:(unsigned int)a3
{
  self->_prominenceIndex = +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("forceProminenceIndex"), a3);
  -[VCSessionParticipant participantVideoToken](self, "participantVideoToken");
  kdebug_trace();
}

- (void)updatePositionalInfo:(id)a3 shouldReapply:(BOOL)a4
{
  VCPositionalInfo *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  VCPositionalInfo *positionalInfo;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  VCPositionalInfo *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3 && (v6 = self->_positionalInfo) != 0)
  {
    v7 = a4;
    -[VCPositionalInfo unserialize:](v6, "unserialize:", a3);
    -[VCSessionParticipantRemote updateShouldEnableMLEnhance](self, "updateShouldEnableMLEnhance");
    if (-[VCPositionalInfo hasPendingChanges](self->_positionalInfo, "hasPendingChanges") || v7)
      VCSpatialAudioMetadata_UpdatePositionalInfo((uint64_t)-[VCSessionParticipantRemote spatialMetadataEntryForMediaType:](self, "spatialMetadataEntryForMediaType:", 0), (__int128 *)-[VCPositionalInfo metadataPositionalInfo](self->_positionalInfo, "metadataPositionalInfo"));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      positionalInfo = self->_positionalInfo;
      v11 = 136316162;
      v12 = v8;
      v13 = 2080;
      v14 = "-[VCSessionParticipantRemote updatePositionalInfo:shouldReapply:]";
      v15 = 1024;
      v16 = 888;
      v17 = 2048;
      v18 = a3;
      v19 = 2048;
      v20 = positionalInfo;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d [AVC SPATIAL AUDIO] Positional info not available: positionalInfo=%p _positionalInfo=%p", (uint8_t *)&v11, 0x30u);
    }
  }
}

- (BOOL)isInCanvas
{
  return -[VCPositionalInfo isInCanvas](self->_positionalInfo, "isInCanvas");
}

- (void)updateOneToOneAudioPositionalInfo:(const tagVCSpatialAudioMetadataPositionalInfo *)a3
{
  VCSpatialAudioMetadata_UpdatePositionalInfo((uint64_t)-[VCSessionParticipantRemote spatialMetadataEntryForMediaType:](self, "spatialMetadataEntryForMediaType:", 0), (__int128 *)a3);
}

- (BOOL)processParticipantInfo
{
  void *v3;
  NSString *v4;
  id v5;
  VCCallInfoBlob *v6;
  VCCallInfoBlob *v7;
  uint64_t v8;
  NSObject *v9;
  NSString *uuid;
  BOOL v11;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  VCSessionParticipantRemote *v33;
  __int16 v34;
  VCSessionParticipantRemote *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!-[NSDictionary objectForKeyedSubscript:](self->super._participantInfo, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyUUID")))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote processParticipantInfo].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v27 = v18;
          v28 = 2080;
          v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
          v30 = 1024;
          v31 = 915;
          v32 = 2112;
          v33 = (VCSessionParticipantRemote *)v13;
          v34 = 2048;
          v35 = self;
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Missing participant UUID", buf, 0x30u);
        }
      }
    }
    v7 = 0;
    v3 = 0;
    goto LABEL_62;
  }
  v3 = (void *)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._participantInfo, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyUUID")), "copy");
  v4 = v3;
  self->super._uuid = v4;
  -[VCObject setLogPrefix:](self, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uuid:%@ (remote)"), v4));
  if (!-[NSDictionary objectForKeyedSubscript:](self->super._participantInfo, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyCallInfoBlob")))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote processParticipantInfo].cold.2();
      }
      goto LABEL_61;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_61;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_61;
    *(_DWORD *)buf = 136316162;
    v27 = v20;
    v28 = 2080;
    v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
    v30 = 1024;
    v31 = 920;
    v32 = 2112;
    v33 = (VCSessionParticipantRemote *)v14;
    v34 = 2048;
    v35 = self;
    v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Missing callInfo blob";
    goto LABEL_64;
  }
  v5 = -[NSDictionary objectForKeyedSubscript:](self->super._participantInfo, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyMediaNegotiationData"));
  if (!v5)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote processParticipantInfo].cold.3();
      }
      goto LABEL_61;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_61;
    v23 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_61;
    *(_DWORD *)buf = 136316162;
    v27 = v23;
    v28 = 2080;
    v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
    v30 = 1024;
    v31 = 923;
    v32 = 2112;
    v33 = (VCSessionParticipantRemote *)v15;
    v34 = 2048;
    v35 = self;
    v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to retrieve the negotiation data";
    goto LABEL_64;
  }
  if (!-[VCSessionMediaNegotiator processRemoteNegotiationData:](self->super._mediaNegotiator, "processRemoteNegotiationData:", v5))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote processParticipantInfo].cold.5();
      }
      goto LABEL_61;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_61;
    v24 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_61;
    *(_DWORD *)buf = 136316162;
    v27 = v24;
    v28 = 2080;
    v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
    v30 = 1024;
    v31 = 926;
    v32 = 2112;
    v33 = (VCSessionParticipantRemote *)v16;
    v34 = 2048;
    v35 = self;
    v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Media negotiation failed";
    goto LABEL_64;
  }
  v6 = -[VCCallInfoBlob initWithData:]([VCCallInfoBlob alloc], "initWithData:", -[NSDictionary objectForKeyedSubscript:](self->super._participantInfo, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyCallInfoBlob")));
  if (!v6)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote processParticipantInfo].cold.4();
      }
      goto LABEL_61;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v25 = VRTraceErrorLogLevelToCSTR(),
          v21 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_61:
      v7 = 0;
LABEL_62:
      v11 = 0;
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136316162;
    v27 = v25;
    v28 = 2080;
    v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
    v30 = 1024;
    v31 = 929;
    v32 = 2112;
    v33 = (VCSessionParticipantRemote *)v17;
    v34 = 2048;
    v35 = self;
    v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate callInfo blob";
LABEL_64:
    _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, v22, buf, 0x30u);
    goto LABEL_61;
  }
  v7 = v6;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VCSessionParticipantRemote-info");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      uuid = self->super._uuid;
      *(_DWORD *)buf = 136316418;
      v27 = v8;
      v28 = 2080;
      v29 = "-[VCSessionParticipantRemote processParticipantInfo]";
      v30 = 1024;
      v31 = 931;
      v32 = 2048;
      v33 = self;
      v34 = 2112;
      v35 = (VCSessionParticipantRemote *)uuid;
      v36 = 2112;
      v37 = -[VCCallInfoBlob stringForCheckpoint](v7, "stringForCheckpoint");
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d @:@ VCSessionParticipantRemote-info (%p) uuid=%@, %@", buf, 0x3Au);
    }
  }
  self->super._callInfoBlob = v7;
  self->_capabilities.isPeace = -[VCSessionParticipantRemote isParticipantPeace:](self, "isParticipantPeace:", v7);
  self->_capabilities.isDawnburstOrLater = -[VCSessionParticipantRemote isParticipantDawnburstOrLater](self, "isParticipantDawnburstOrLater");
  self->_receivedFirstFrame = -[VCMediaNegotiatorResults remoteBlobVersion](-[VCSessionMediaNegotiator negotiatedSettings](self->super._mediaNegotiator, "negotiatedSettings"), "remoteBlobVersion") > 1;
  self->super._creationTime.wide = (unint64_t)-[VCMediaNegotiatorResults remoteBlobCreationTime](-[VCSessionMediaNegotiator negotiatedSettings](self->super._mediaNegotiator, "negotiatedSettings"), "remoteBlobCreationTime");
  v11 = 1;
LABEL_10:

  return v11;
}

- (id)getMajorVersionNumber
{
  NSArray *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
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
  NSObject *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  VCSessionParticipantRemote *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = -[NSString componentsSeparatedByString:](-[VCCallInfoBlob frameworkVersion](self->super._callInfoBlob, "frameworkVersion"), "componentsSeparatedByString:", CFSTR("."));
  if (!v3 || (v4 = v3, !-[NSArray count](v3, "count")))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote getMajorVersionNumber].cold.1();
      }
      goto LABEL_45;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_45;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    v23 = 136316162;
    v24 = v16;
    v25 = 2080;
    v26 = "-[VCSessionParticipantRemote getMajorVersionNumber]";
    v27 = 1024;
    v28 = 954;
    v29 = 2112;
    v30 = v12;
    v31 = 2048;
    v32 = self;
    v18 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to parse version string";
    goto LABEL_44;
  }
  v5 = -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", 0);
  if (!v5)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote getMajorVersionNumber].cold.2();
      }
      goto LABEL_45;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_45;
    v19 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    v23 = 136316162;
    v24 = v19;
    v25 = 2080;
    v26 = "-[VCSessionParticipantRemote getMajorVersionNumber]";
    v27 = 1024;
    v28 = 956;
    v29 = 2112;
    v30 = v13;
    v31 = 2048;
    v32 = self;
    v18 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to get substring";
LABEL_44:
    _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v23, 0x30u);
    goto LABEL_45;
  }
  v6 = v5;
  v7 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  if (!v7)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote getMajorVersionNumber].cold.3();
      }
      goto LABEL_45;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v23 = 136316162;
        v24 = v20;
        v25 = 2080;
        v26 = "-[VCSessionParticipantRemote getMajorVersionNumber]";
        v27 = 1024;
        v28 = 958;
        v29 = 2112;
        v30 = v14;
        v31 = 2048;
        v32 = self;
        v18 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate formatter";
        goto LABEL_44;
      }
    }
LABEL_45:
    v8 = 0;
    v10 = &unk_1E9EF4E50;
    goto LABEL_7;
  }
  v8 = v7;
  objc_msgSend(v7, "setNumberStyle:", 1);
  v9 = objc_msgSend(v8, "numberFromString:", v6);
  if (v9)
  {
    v10 = (void *)v9;
  }
  else
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote getMajorVersionNumber].cold.4();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v23 = 136316162;
          v24 = v21;
          v25 = 2080;
          v26 = "-[VCSessionParticipantRemote getMajorVersionNumber]";
          v27 = 1024;
          v28 = 961;
          v29 = 2112;
          v30 = v15;
          v31 = 2048;
          v32 = self;
          _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to get number from string", (uint8_t *)&v23, 0x30u);
        }
      }
    }
    v10 = 0;
  }
LABEL_7:

  return v10;
}

- (BOOL)supportsNegotiatedCoordinateSystem
{
  NSString *v3;
  id v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BYTE v14[24];
  _BYTE v15[24];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[VCCallInfoBlob frameworkVersion](self->super._callInfoBlob, "frameworkVersion");
  v4 = -[VCSessionParticipantRemote getMajorVersionNumber](self, "getMajorVersionNumber");
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 136316162;
        *(_QWORD *)&v14[4] = v6;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCSessionParticipantRemote supportsNegotiatedCoordinateSystem]";
        *(_WORD *)&v14[22] = 1024;
        *(_DWORD *)v15 = 970;
        *(_WORD *)&v15[4] = 1024;
        *(_DWORD *)&v15[6] = (int)objc_msgSend(v4, "intValue") > 1884;
        *(_WORD *)&v15[10] = 2080;
        *(_QWORD *)&v15[12] = -[NSString UTF8String](v3, "UTF8String");
        v8 = "VCSessionParticipantRemote [%s] %s:%d supportsNonZeroRegionOfInterestOrigin=%d remoteFrameworkVersion=%s";
        v9 = v7;
        v10 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v14, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 136316674;
        *(_QWORD *)&v14[4] = v11;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCSessionParticipantRemote supportsNegotiatedCoordinateSystem]";
        *(_WORD *)&v14[22] = 1024;
        *(_DWORD *)v15 = 970;
        *(_WORD *)&v15[4] = 2112;
        *(_QWORD *)&v15[6] = v5;
        *(_WORD *)&v15[14] = 2048;
        *(_QWORD *)&v15[16] = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = (int)objc_msgSend(v4, "intValue") > 1884;
        HIWORD(v16) = 2080;
        v17 = -[NSString UTF8String](v3, "UTF8String");
        v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) supportsNonZeroRegionOfInterestOrigin=%d remoteFrameworkVersion=%s";
        v9 = v12;
        v10 = 64;
        goto LABEL_11;
      }
    }
  }
  return (int)objc_msgSend(v4, "intValue", *(_OWORD *)v14, *(_QWORD *)&v14[16], *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17) > 1884;
}

- (BOOL)supportsGFTSwitchToOneToOne
{
  const __CFString *v3;
  NSString *v4;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  BOOL result;
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
  _BOOL4 v21;
  uint64_t v22;
  NSObject *v23;
  _BYTE v24[24];
  _BYTE v25[24];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_capabilities.participantType == 1)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v9)
        return result;
      *(_DWORD *)v24 = 136315650;
      *(_QWORD *)&v24[4] = v7;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = "-[VCSessionParticipantRemote supportsGFTSwitchToOneToOne]";
      *(_WORD *)&v24[22] = 1024;
      *(_DWORD *)v25 = 976;
      v11 = "VCSessionParticipantRemote [%s] %s:%d Web participants do not support switching from GFT to OneToOne";
      v12 = v8;
      v13 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v21)
        return result;
      *(_DWORD *)v24 = 136316162;
      *(_QWORD *)&v24[4] = v19;
      *(_WORD *)&v24[12] = 2080;
      *(_QWORD *)&v24[14] = "-[VCSessionParticipantRemote supportsGFTSwitchToOneToOne]";
      *(_WORD *)&v24[22] = 1024;
      *(_DWORD *)v25 = 976;
      *(_WORD *)&v25[4] = 2112;
      *(_QWORD *)&v25[6] = v3;
      *(_WORD *)&v25[14] = 2048;
      *(_QWORD *)&v25[16] = self;
      v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Web participants do not support switching from GFT to OneToOne";
      v12 = v20;
      v13 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v24, v13);
    return 0;
  }
  v4 = -[VCCallInfoBlob frameworkVersion](self->super._callInfoBlob, "frameworkVersion");
  v5 = -[VCSessionParticipantRemote getMajorVersionNumber](self, "getMajorVersionNumber");
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return (int)objc_msgSend(v5, "intValue", *(_OWORD *)v24, *(_QWORD *)&v24[16], *(_OWORD *)v25, *(_QWORD *)&v25[16], v26, v27) > 1849;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return (int)objc_msgSend(v5, "intValue", *(_OWORD *)v24, *(_QWORD *)&v24[16], *(_OWORD *)v25, *(_QWORD *)&v25[16], v26, v27) > 1849;
    *(_DWORD *)v24 = 136316162;
    *(_QWORD *)&v24[4] = v14;
    *(_WORD *)&v24[12] = 2080;
    *(_QWORD *)&v24[14] = "-[VCSessionParticipantRemote supportsGFTSwitchToOneToOne]";
    *(_WORD *)&v24[22] = 1024;
    *(_DWORD *)v25 = 982;
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = (int)objc_msgSend(v5, "intValue") > 1849;
    *(_WORD *)&v25[10] = 2080;
    *(_QWORD *)&v25[12] = -[NSString UTF8String](v4, "UTF8String");
    v16 = "VCSessionParticipantRemote [%s] %s:%d supportsGFTSwitchToOneToOne:[%d] remoteFrameworkVersion:[%s] ";
    v17 = v15;
    v18 = 44;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return (int)objc_msgSend(v5, "intValue", *(_OWORD *)v24, *(_QWORD *)&v24[16], *(_OWORD *)v25, *(_QWORD *)&v25[16], v26, v27) > 1849;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return (int)objc_msgSend(v5, "intValue", *(_OWORD *)v24, *(_QWORD *)&v24[16], *(_OWORD *)v25, *(_QWORD *)&v25[16], v26, v27) > 1849;
    *(_DWORD *)v24 = 136316674;
    *(_QWORD *)&v24[4] = v22;
    *(_WORD *)&v24[12] = 2080;
    *(_QWORD *)&v24[14] = "-[VCSessionParticipantRemote supportsGFTSwitchToOneToOne]";
    *(_WORD *)&v24[22] = 1024;
    *(_DWORD *)v25 = 982;
    *(_WORD *)&v25[4] = 2112;
    *(_QWORD *)&v25[6] = v6;
    *(_WORD *)&v25[14] = 2048;
    *(_QWORD *)&v25[16] = self;
    LOWORD(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 2) = (int)objc_msgSend(v5, "intValue") > 1849;
    HIWORD(v26) = 2080;
    v27 = -[NSString UTF8String](v4, "UTF8String");
    v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) supportsGFTSwitchToOneToOne:[%d] remoteFrameworkVersion:[%s] ";
    v17 = v23;
    v18 = 64;
  }
  _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, v24, v18);
  return (int)objc_msgSend(v5, "intValue", *(_OWORD *)v24, *(_QWORD *)&v24[16], *(_OWORD *)v25, *(_QWORD *)&v25[16], v26, v27) > 1849;
}

- (BOOL)supportsIDSParticipantIDBasedKeyIndexMatching
{
  NSString *v3;
  int v4;
  BOOL v5;
  const __CFString *v6;
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
  _BYTE v22[18];
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_capabilities.participantType == 1 || !VCFeatureFlagManager_UseShortMKI())
    return 0;
  v3 = -[VCCallInfoBlob frameworkVersion](self->super._callInfoBlob, "frameworkVersion");
  v4 = objc_msgSend(-[VCSessionParticipantRemote getMajorVersionNumber](self, "getMajorVersionNumber"), "intValue");
  v5 = v4 > 2044;
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136316162;
        v16 = v8;
        v17 = 2080;
        v18 = "-[VCSessionParticipantRemote supportsIDSParticipantIDBasedKeyIndexMatching]";
        v19 = 1024;
        v20 = 1000;
        v21 = 1024;
        *(_DWORD *)v22 = v4 > 2044;
        *(_WORD *)&v22[4] = 2080;
        *(_QWORD *)&v22[6] = -[NSString UTF8String](v3, "UTF8String");
        v10 = "VCSessionParticipantRemote [%s] %s:%d supportsIDSParticipantIDBasedKeyIndexMatching=%d remoteFrameworkVersion=%s";
        v11 = v9;
        v12 = 44;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136316674;
        v16 = v13;
        v17 = 2080;
        v18 = "-[VCSessionParticipantRemote supportsIDSParticipantIDBasedKeyIndexMatching]";
        v19 = 1024;
        v20 = 1000;
        v21 = 2112;
        *(_QWORD *)v22 = v6;
        *(_WORD *)&v22[8] = 2048;
        *(_QWORD *)&v22[10] = self;
        v23 = 1024;
        v24 = v4 > 2044;
        v25 = 2080;
        v26 = -[NSString UTF8String](v3, "UTF8String");
        v10 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) supportsIDSParticipantIDBasedKeyIndexMatching=%d remoteFrameworkVersion=%s";
        v11 = v14;
        v12 = 64;
        goto LABEL_15;
      }
    }
  }
  return v5;
}

- (BOOL)isParticipantPeace:(id)a3
{
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _BYTE v22[18];
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "osVersion");
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^16"), 1, 0), "numberOfMatchesInString:options:range:", v4, 4, 0, objc_msgSend(v4, "length"));
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136316162;
        v16 = v7;
        v17 = 2080;
        v18 = "-[VCSessionParticipantRemote isParticipantPeace:]";
        v19 = 1024;
        v20 = 1009;
        v21 = 1024;
        *(_DWORD *)v22 = v5 != 0;
        *(_WORD *)&v22[4] = 2048;
        *(_QWORD *)&v22[6] = v5;
        v9 = "VCSessionParticipantRemote [%s] %s:%d isParticipantPeace:[%d] numMatchesVersion:[%lu]";
        v10 = v8;
        v11 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136316674;
        v16 = v12;
        v17 = 2080;
        v18 = "-[VCSessionParticipantRemote isParticipantPeace:]";
        v19 = 1024;
        v20 = 1009;
        v21 = 2112;
        *(_QWORD *)v22 = v6;
        *(_WORD *)&v22[8] = 2048;
        *(_QWORD *)&v22[10] = self;
        v23 = 1024;
        v24 = v5 != 0;
        v25 = 2048;
        v26 = v5;
        v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) isParticipantPeace:[%d] numMatchesVersion:[%lu]";
        v10 = v13;
        v11 = 64;
        goto LABEL_11;
      }
    }
  }
  return v5 != 0;
}

- (BOOL)isParticipantDawnburstOrLater
{
  id v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BYTE v21[18];
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = -[VCSessionParticipantRemote getMajorVersionNumber](self, "getMajorVersionNumber");
  v4 = objc_msgSend(v3, "intValue");
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316162;
        v15 = v6;
        v16 = 2080;
        v17 = "-[VCSessionParticipantRemote isParticipantDawnburstOrLater]";
        v18 = 1024;
        v19 = 1017;
        v20 = 1024;
        *(_DWORD *)v21 = v4 > 1964;
        *(_WORD *)&v21[4] = 2112;
        *(_QWORD *)&v21[6] = v3;
        v8 = "VCSessionParticipantRemote [%s] %s:%d isDawnburstOrLater=%d for majorVersionNumber=%@";
        v9 = v7;
        v10 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316674;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCSessionParticipantRemote isParticipantDawnburstOrLater]";
        v18 = 1024;
        v19 = 1017;
        v20 = 2112;
        *(_QWORD *)v21 = v5;
        *(_WORD *)&v21[8] = 2048;
        *(_QWORD *)&v21[10] = self;
        v22 = 1024;
        v23 = v4 > 1964;
        v24 = 2112;
        v25 = v3;
        v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) isDawnburstOrLater=%d for majorVersionNumber=%@";
        v9 = v12;
        v10 = 64;
        goto LABEL_11;
      }
    }
  }
  return v4 > 1964;
}

- (id)setupStreamRTP:(id)a3
{
  return (id)objc_msgSend(a3, "setupRTPForIDS");
}

- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4
{
  return 1;
}

- (void)completeAndReleaseNwActivity:(id)a3 withReason:(int)a4
{
  nw_activity_complete_with_reason();
  nw_release(a3);
}

- (void)cleanupNwActivity
{
  OS_nw_activity *participantMediaStallNwActivity;
  OS_nw_activity *participantPoorConnectionNwActivity;
  VCSessionParticipantRemote *v5;

  participantMediaStallNwActivity = self->_participantMediaStallNwActivity;
  if (participantMediaStallNwActivity)
    -[VCSessionParticipantRemote completeAndReleaseNwActivity:withReason:](self, "completeAndReleaseNwActivity:withReason:", self->_participantMediaStallNwActivity, 3);
  participantPoorConnectionNwActivity = self->_participantPoorConnectionNwActivity;
  if (participantPoorConnectionNwActivity)
  {
    -[VCSessionParticipantRemote completeAndReleaseNwActivity:withReason:](self, "completeAndReleaseNwActivity:withReason:", participantPoorConnectionNwActivity, 3);
    if (!self->_nwActivity)
      return;
    goto LABEL_8;
  }
  if (self->_nwActivity)
  {
    if (!participantMediaStallNwActivity)
    {
      v5 = self;
      goto LABEL_9;
    }
LABEL_8:
    v5 = self;
LABEL_9:
    -[VCSessionParticipantRemote completeAndReleaseNwActivity:withReason:](v5, "completeAndReleaseNwActivity:withReason:");
  }
}

- (BOOL)isActiveMediaType:(unsigned int)a3
{
  uint64_t v3;
  int v5;
  int v6;
  BOOL result;

  v3 = *(_QWORD *)&a3;
  switch(a3)
  {
    case 0u:
      result = -[VCSessionParticipantRemote isAudioActive](self, "isAudioActive");
      break;
    case 1u:
      result = -[VCSessionParticipantRemote isVideoExpected](self, "isVideoExpected");
      break;
    case 2u:
    case 3u:
      result = -[VCSessionParticipantRemote isScreenActive](self, "isScreenActive");
      break;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3)), "mediaState");
      v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteMediaStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), "unsignedIntValue");
      result = v5 == 1 && v6 == 1;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

- (BOOL)isEnabledMediaType:(unsigned int)a3
{
  uint64_t v3;
  int v5;
  int v6;
  BOOL v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  switch(a3)
  {
    case 0u:
      v8 = 373;
      goto LABEL_11;
    case 1u:
      if (!self->super._videoEnabled)
        return 0;
      v8 = 544;
      goto LABEL_11;
    case 2u:
    case 3u:
      if (!self->super._screenEnabled)
        return 0;
      v8 = 545;
LABEL_11:
      v7 = *((_BYTE *)&self->super.super.super.isa + v8) == 0;
      return !v7;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3)), "mediaState");
      v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_remoteMediaStates, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), "unsignedIntValue");
      if (v5)
        v7 = v6 == 0;
      else
        v7 = 1;
      return !v7;
    default:
      return 0;
  }
}

- (BOOL)isStreamGroupActive:(id)a3
{
  id v4;
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
  v4 = +[VCSessionParticipant mediaTypesFromStreamGroupID:](VCSessionParticipant, "mediaTypesFromStreamGroupID:", objc_msgSend(a3, "streamGroupID"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (-[VCSessionParticipantRemote isActiveMediaType:](self, "isActiveMediaType:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "unsignedIntValue")))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (BOOL)setupAudioStreamConfiguration:(id)a3 withStreamGroupConfig:(id)a4 streamGroupStreamConfig:(id)a5
{
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  VCAudioStreamCodecConfig *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  id v23;
  id v24;
  id obj;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "groupID") == 1835623282
    || objc_msgSend(a4, "groupID") == 1937339233
    || objc_msgSend((id)objc_msgSend(a5, "payloads"), "containsObject:", &unk_1E9EF4E68))
  {
    objc_msgSend(a3, "setupRedWithRxPayload:txPayload:", 20, 20);
  }
  v24 = a4;
  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "codecConfigs"), "array");
  v9 = objc_msgSend(v8, "count");
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = a5;
  obj = (id)objc_msgSend(a5, "codecs");
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
LABEL_7:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v12)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v13);
      if ((int)objc_msgSend(v14, "intValue") >= v9)
        break;
      v15 = (void *)objc_msgSend(v8, "objectAtIndexedSubscript:", (int)objc_msgSend(v14, "intValue"));
      v16 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(v15, "codecType"));
      v17 = -[VCAudioStreamCodecConfig initWithCodecType:]([VCAudioStreamCodecConfig alloc], "initWithCodecType:", objc_msgSend(v15, "codecType"));
      -[VCAudioStreamCodecConfig setNetworkPayload:](v17, "setNetworkPayload:", objc_msgSend(v15, "rtpPayload"));
      -[VCAudioStreamCodecConfig setPTime:](v17, "setPTime:", objc_msgSend(v15, "pTime"));
      -[VCAudioStreamCodecConfig setIsOpusInBandFecEnabled:](v17, "setIsOpusInBandFecEnabled:", objc_msgSend(v15, "useInBandFEC"));
      objc_msgSend(a3, "setRtcpEnabled:", objc_msgSend(v15, "rtcpSREnabled"));
      if (objc_msgSend(a3, "isRTCPEnabled"))
      {
        objc_msgSend(a3, "setRtcpSendInterval:", 0.0);
        objc_msgSend(a3, "setRtcpTimeOutEnabled:", 1);
        objc_msgSend(a3, "setRtcpTimeOutInterval:", 30.0);
      }
      +[VCSessionParticipant addCodecModesForPayload:toCodecConfig:](VCSessionParticipant, "addCodecModesForPayload:toCodecConfig:", v16, v17);
      objc_msgSend(a3, "addCodecConfiguration:", v17);

      if (v11 == ++v13)
      {
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
        if (v11)
          goto LABEL_7;
        goto LABEL_15;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_24;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v21)
    {
      *(_DWORD *)buf = 136316162;
      v28 = v19;
      v29 = 2080;
      v30 = "-[VCSessionParticipantRemote setupAudioStreamConfiguration:withStreamGroupConfig:streamGroupStreamConfig:]";
      v31 = 1024;
      v32 = 1128;
      v33 = 2112;
      v34 = v14;
      v35 = 1024;
      v36 = v9;
      _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d codecIndex=%@ out of bounds, codecConfigCount=%d", buf, 0x2Cu);
      goto LABEL_24;
    }
  }
  else
  {
LABEL_15:
    if (objc_msgSend((id)objc_msgSend(a3, "codecConfigurations"), "count"))
    {
      objc_msgSend(a3, "setChannelCount:", objc_msgSend(v23, "audioChannelCount"));
      if (objc_msgSend(a3, "jitterBufferMode") != 3)
        objc_msgSend(a3, "setJitterBufferMode:", 1);
      if (objc_msgSend(v24, "groupID") == 1835623287
        || objc_msgSend(v24, "groupID") == 1936290409)
      {
        v18 = 0;
      }
      else
      {
        if (objc_msgSend(v24, "groupID") == 1937339233)
          objc_msgSend(a3, "setJitterBufferMode:", 0);
        v18 = 1;
      }
      objc_msgSend(a3, "setBundlingScheme:", v18);
      if (objc_msgSend(v24, "groupID") == 1835623282)
        objc_msgSend(a3, "setIsLowLatency:", -[VCSessionParticipant supportsLowLatencyAudio](self, "supportsLowLatencyAudio"));
      if (objc_msgSend(v24, "groupID") == 1835623282)
        objc_msgSend(a3, "setOutOfProcessCodecsEnabled:", self->_outOfProcessCodecsEnabled);
      objc_msgSend(a3, "setIsEnhancedJBAdaptationsEnabled:", self->_isEnhancedJBAdaptationsEnabled);
      LOBYTE(v21) = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v21)
          return v21;
        -[VCSessionParticipantRemote setupAudioStreamConfiguration:withStreamGroupConfig:streamGroupStreamConfig:].cold.1();
      }
LABEL_24:
      LOBYTE(v21) = 0;
    }
  }
  return v21;
}

- (id)checkSubstreams:(id)a3 forLowerQualityIndex:(unsigned int)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
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
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(a3);
      v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
      if (objc_msgSend(v11, "qualityIndex") < a4)
      {
        a4 = objc_msgSend(v11, "qualityIndex");
        v8 = v11;
      }
    }
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  }
  while (v7);
  return v8;
}

- (BOOL)setupBandwidthAllocationTableForMediaStreamConfigs:(id)a3 streamGroupID:(unsigned int)a4 entryType:(unsigned __int8)a5
{
  uint64_t v5;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  VCSessionBandwidthAllocationTableEntry *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  VCSessionBandwidthAllocationTableEntry *v34;
  VCSessionBandwidthAllocationTableEntry *v35;
  VCSessionBandwidthAllocationTableEntry *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  VCSessionBandwidthAllocationTableEntry *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  VCSessionParticipantRemote *v47;
  void *v48;
  VCSessionBandwidthAllocationTableEntry *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unsigned int v53;
  VCSessionBandwidthAllocationTableEntry *v54;
  VCSessionBandwidthAllocationTableEntry *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  VCSessionBandwidthAllocationTableEntry *v60;
  _BOOL4 v61;
  const __CFString *v62;
  uint64_t v63;
  NSObject *v64;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  unsigned int v70;
  uint64_t v71;
  uint64_t v72;
  VCSessionBandwidthAllocationTableEntry *v73;
  id obj;
  unsigned int v76;
  uint64_t v77;
  _BYTE v79[128];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  int v94;
  __int16 v95;
  char *v96;
  __int16 v97;
  _BYTE v98[10];
  char *v99;
  __int16 v100;
  unsigned int v101;
  __int16 v102;
  int v103;
  _BYTE v104[128];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;

  v5 = a5;
  v109 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4)), "unsignedIntValue");
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v105, v104, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v106;
    v11 = -1;
    v76 = -1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v106 != v10)
          objc_enumerationMutation(a3);
        v13 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "isOneToOne") & 1) == 0)
        {
          if (objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "qualityIndex") < v76)
          {
            v76 = objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "qualityIndex");
            v11 = objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "idsStreamID");
          }
          if ((_DWORD)v5 == 2)
          {
            v14 = -[VCSessionParticipantRemote checkSubstreams:forLowerQualityIndex:](self, "checkSubstreams:forLowerQualityIndex:", objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "subStreamConfigs"), v76);
            if (v14)
            {
              v15 = v14;
              v76 = objc_msgSend(v14, "idsStreamID");
              v11 = objc_msgSend(v15, "qualityIndex");
            }
          }
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v105, v104, 16);
    }
    while (v9);
  }
  else
  {
    v11 = -1;
    v76 = -1;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_27;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_DWORD *)buf = 136316418;
    v90 = v17;
    v91 = 2080;
    v92 = "-[VCSessionParticipantRemote setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:]";
    v93 = 1024;
    v94 = 1213;
    v95 = 2080;
    v96 = FourccToCStr(a4);
    v97 = 1024;
    *(_DWORD *)v98 = v76;
    *(_WORD *)&v98[4] = 1024;
    *(_DWORD *)&v98[6] = v11;
    v19 = "VCSessionParticipantRemote [%s] %s:%d StreamGroupID=%s Lowest qualityIndex=%d streamID=%d";
    v20 = v18;
    v21 = 50;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_27;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_DWORD *)buf = 136316930;
    v90 = v22;
    v91 = 2080;
    v92 = "-[VCSessionParticipantRemote setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:]";
    v93 = 1024;
    v94 = 1213;
    v95 = 2112;
    v96 = (char *)v16;
    v97 = 2048;
    *(_QWORD *)v98 = self;
    *(_WORD *)&v98[8] = 2080;
    v99 = FourccToCStr(a4);
    v100 = 1024;
    v101 = v76;
    v102 = 1024;
    v103 = v11;
    v19 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) StreamGroupID=%s Lowest qualityIndex=%d streamID=%d";
    v20 = v23;
    v21 = 70;
  }
  _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_27:
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v24 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v85, v84, 16);
  if (!v24)
  {
LABEL_49:
    LOBYTE(v61) = 1;
    return v61;
  }
  v25 = v24;
  v77 = v7;
  v26 = *(_QWORD *)v86;
  v70 = v5;
  v68 = *(_QWORD *)v86;
  v69 = a3;
LABEL_29:
  v27 = 0;
  v71 = v25;
  while (1)
  {
    if (*(_QWORD *)v86 != v26)
      objc_enumerationMutation(a3);
    v28 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v27);
    if ((objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "isOneToOne") & 1) != 0)
      goto LABEL_47;
    v29 = [VCSessionBandwidthAllocationTableEntry alloc];
    v30 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "maxNetworkBitrate");
    v31 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "maxMediaBitrate");
    v32 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "qualityIndex");
    v33 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "idsStreamID");
    LODWORD(v67) = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "v2StreamID");
    v34 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:](v29, "initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:", self, v5, v77, v30, v31, v32, __PAIR64__(a4, v33), v67);
    if (!v34)
      break;
    v35 = v34;
    v72 = v27;
    -[VCSessionBandwidthAllocationTableEntry setIsLowestQuality:](v34, "setIsLowestQuality:", objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "qualityIndex") == v76);
    v73 = v35;
    -[VCSessionBandwidthAllocationTable addBandwidthAllocationTableEntry:](self->_mediaTable, "addBandwidthAllocationTableEntry:", v35);
    if (objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "hasRepairedStreamID"))
    {
      v36 = [VCSessionBandwidthAllocationTableEntry alloc];
      v37 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "repairedMaxNetworkBitrate");
      v38 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "maxMediaBitrate");
      v39 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "qualityIndex");
      v40 = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "repairedStreamID");
      LODWORD(v67) = objc_msgSend((id)objc_msgSend(v28, "multiwayConfig"), "v2StreamID");
      v41 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:](v36, "initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:", self, v5, v77, v37, v38, v39, __PAIR64__(a4, v40), v67);
      -[VCSessionBandwidthAllocationTableEntry setIsLowestQuality:](v41, "setIsLowestQuality:", -[VCSessionBandwidthAllocationTableEntry isLowestQuality](v73, "isLowestQuality"));
      -[VCSessionBandwidthAllocationTable addBandwidthAllocationTableEntry:](self->_repairMediaTable, "addBandwidthAllocationTableEntry:", v41);

    }
    if ((_DWORD)v5 == 2)
    {
      v42 = (void *)objc_msgSend(v28, "multiwayConfig");
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      obj = (id)objc_msgSend(v42, "subStreamConfigs");
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v79, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v81;
        do
        {
          v46 = 0;
          v47 = self;
          do
          {
            if (*(_QWORD *)v81 != v45)
              objc_enumerationMutation(obj);
            v48 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v46);
            v49 = [VCSessionBandwidthAllocationTableEntry alloc];
            v50 = objc_msgSend(v48, "maxNetworkBitrate");
            v51 = objc_msgSend(v48, "maxMediaBitrate");
            v52 = objc_msgSend(v48, "qualityIndex");
            v53 = objc_msgSend(v48, "idsStreamID");
            LODWORD(v67) = objc_msgSend(v48, "v2StreamID");
            v54 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:](v49, "initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:", v47, 2, v77, v50, v51, v52, __PAIR64__(a4, v53), v67);
            -[VCSessionBandwidthAllocationTableEntry setIsLowestQuality:](v54, "setIsLowestQuality:", objc_msgSend(v48, "qualityIndex") == v76);
            -[VCSessionBandwidthAllocationTable addBandwidthAllocationTableEntry:](v47->_mediaTable, "addBandwidthAllocationTableEntry:", v54);
            if (objc_msgSend(v48, "hasRepairedStreamID"))
            {
              v55 = [VCSessionBandwidthAllocationTableEntry alloc];
              v56 = objc_msgSend(v48, "repairedMaxNetworkBitrate");
              v57 = objc_msgSend(v48, "maxMediaBitrate");
              v58 = objc_msgSend(v48, "qualityIndex");
              v59 = objc_msgSend(v48, "repairedStreamID");
              LODWORD(v67) = objc_msgSend(v48, "v2StreamID");
              v66 = __PAIR64__(a4, v59);
              v47 = self;
              v60 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:](v55, "initWithClient:type:streamToken:networkBitrate:mediaBitrate:qualityIndex:streamID:streamGroupID:v2StreamID:", self, 2, v77, v56, v57, v58, v66, v67);
              -[VCSessionBandwidthAllocationTableEntry setIsLowestQuality:](v60, "setIsLowestQuality:", -[VCSessionBandwidthAllocationTableEntry isLowestQuality](v54, "isLowestQuality"));
              -[VCSessionBandwidthAllocationTable addBandwidthAllocationTableEntry:](self->_repairMediaTable, "addBandwidthAllocationTableEntry:", v60);

            }
            ++v46;
          }
          while (v44 != v46);
          v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v79, 16);
        }
        while (v44);
      }
    }

    v5 = v70;
    v26 = v68;
    a3 = v69;
    v25 = v71;
    v27 = v72;
LABEL_47:
    if (++v27 == v25)
    {
      v25 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v85, v84, 16);
      if (v25)
        goto LABEL_29;
      goto LABEL_49;
    }
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v61 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v61)
        return v61;
      -[VCSessionParticipantRemote setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v62 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v62 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v63 = VRTraceErrorLogLevelToCSTR();
      v64 = *MEMORY[0x1E0CF2758];
      v61 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v61)
        return v61;
      *(_DWORD *)buf = 136316162;
      v90 = v63;
      v91 = 2080;
      v92 = "-[VCSessionParticipantRemote setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:]";
      v93 = 1024;
      v94 = 1230;
      v95 = 2112;
      v96 = (char *)v62;
      v97 = 2048;
      *(_QWORD *)v98 = self;
      _os_log_error_impl(&dword_1D8A54000, v64, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate allocator entry!", buf, 0x30u);
    }
  }
  LOBYTE(v61) = 0;
  return v61;
}

- (id)entryForStreamID:(id)a3
{
  id result;
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
  VCSessionParticipantRemote *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = -[VCSessionBandwidthAllocationTable entryForStreamID:](self->_mediaTable, "entryForStreamID:");
  if (!result)
  {
    result = -[VCSessionBandwidthAllocationTable entryForStreamID:](self->_repairMediaTable, "entryForStreamID:", a3);
    if (!result)
    {
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipantRemote entryForStreamID:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v6 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v6 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v7 = VRTraceErrorLogLevelToCSTR();
          v8 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v9 = 136316418;
            v10 = v7;
            v11 = 2080;
            v12 = "-[VCSessionParticipantRemote entryForStreamID:]";
            v13 = 1024;
            v14 = 1302;
            v15 = 2112;
            v16 = v6;
            v17 = 2048;
            v18 = self;
            v19 = 2112;
            v20 = a3;
            _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) No media entry found for stream ID: %@", (uint8_t *)&v9, 0x3Au);
          }
        }
      }
      return 0;
    }
  }
  return result;
}

- (id)getAudioDumpName
{
  return 0;
}

- (void)setMuted:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__VCSessionParticipantRemote_setMuted___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __39__VCSessionParticipantRemote_setMuted___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 372) = *(_BYTE *)(a1 + 40);
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "micStreamInfo"), "stream"), "setRemoteMuted:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 372));
}

- (void)setActiveStreamIDs:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCSessionParticipantRemote_setActiveStreamIDs___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(participantQueue, block);
}

uint64_t __49__VCSessionParticipantRemote_setActiveStreamIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", *(_QWORD *)(a1 + 32));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 472), "allValues");
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend((id)objc_msgSend(v8, "streamIDToMediaStreamMap"), "allKeys"));
        objc_msgSend(v9, "intersectSet:", v2);
        objc_msgSend(v2, "minusSet:", v9);
        objc_msgSend(v8, "setActiveStreamIDs:", v9);
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (NSNumber)optedInAudioStreamID
{
  return (NSNumber *)-[VCSessionParticipantRemote optedInStreamIDForStreamGroupID:](self, "optedInStreamIDForStreamGroupID:", 1835623282);
}

- (NSNumber)optedInVideoStreamID
{
  return (NSNumber *)-[VCSessionParticipantRemote optedInStreamIDForStreamGroupID:](self, "optedInStreamIDForStreamGroupID:", 1667329381);
}

- (void)appendOptedInStreamID:(id)a3 toOptInStreamsIDs:(id)a4 targetBandwidthEntry:(id)a5 forceSeamlessTransition:(BOOL)a6
{
  _BOOL4 v6;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  NSNumber *v29;
  __int16 v30;
  _BYTE v31[10];
  NSNumber *v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a6;
    if ((objc_msgSend(a4, "containsObject:") & 1) == 0)
    {
      v11 = objc_msgSend(a5, "maxNetworkBitrate");
      v12 = objc_msgSend(-[VCSessionParticipantRemote entryForStreamID:](self, "entryForStreamID:", a3), "maxNetworkBitrate");
      v13 = v12;
      if (v6 || v11 > v12)
      {
        objc_msgSend(a4, "addObject:", a3);
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v22 = 136316674;
              v23 = v15;
              v24 = 2080;
              v25 = "-[VCSessionParticipantRemote appendOptedInStreamID:toOptInStreamsIDs:targetBandwidthEntry:forceSeamlessTransition:]";
              v26 = 1024;
              v27 = 1373;
              v28 = 2112;
              v29 = -[VCSessionParticipantRemote optedInVideoStreamID](self, "optedInVideoStreamID");
              v30 = 1024;
              *(_DWORD *)v31 = v6;
              *(_WORD *)&v31[4] = 1024;
              *(_DWORD *)&v31[6] = v13;
              LOWORD(v32) = 1024;
              *(_DWORD *)((char *)&v32 + 2) = v11;
              v17 = "VCSessionParticipantRemote [%s] %s:%d Adding currently optedInVideoStreamID:%@ to allow seamless vid"
                    "eo stream transition. Force=%d, Bitrate %d -> %d";
              v18 = v16;
              v19 = 56;
LABEL_15:
              _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v22, v19);
            }
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v14 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v14 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v20 = VRTraceErrorLogLevelToCSTR();
            v21 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v22 = 136317186;
              v23 = v20;
              v24 = 2080;
              v25 = "-[VCSessionParticipantRemote appendOptedInStreamID:toOptInStreamsIDs:targetBandwidthEntry:forceSeamlessTransition:]";
              v26 = 1024;
              v27 = 1373;
              v28 = 2112;
              v29 = (NSNumber *)v14;
              v30 = 2048;
              *(_QWORD *)v31 = self;
              *(_WORD *)&v31[8] = 2112;
              v32 = -[VCSessionParticipantRemote optedInVideoStreamID](self, "optedInVideoStreamID");
              v33 = 1024;
              v34 = v6;
              v35 = 1024;
              v36 = v13;
              v37 = 1024;
              v38 = v11;
              v17 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Adding currently optedInVideoStreamID:%@ to allow seaml"
                    "ess video stream transition. Force=%d, Bitrate %d -> %d";
              v18 = v21;
              v19 = 76;
              goto LABEL_15;
            }
          }
        }
      }
    }
  }
}

- (id)recommendedStreamIDsForSelectedMediaEntries:(id)a3 forceSeamlessTransition:(BOOL)a4
{
  NSObject *participantQueue;
  void *v8;
  _QWORD block[7];
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__10;
  v16 = __Block_byref_object_dispose__10;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  v17 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__VCSessionParticipantRemote_recommendedStreamIDsForSelectedMediaEntries_forceSeamlessTransition___block_invoke;
  block[3] = &unk_1E9E551E0;
  block[4] = a3;
  block[5] = self;
  block[6] = &v12;
  v11 = a4;
  dispatch_sync(participantQueue, block);
  v8 = (void *)v13[5];
  _Block_object_dispose(&v12, 8);
  return v8;
}

void __98__VCSessionParticipantRemote_recommendedStreamIDsForSelectedMediaEntries_forceSeamlessTransition___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  char *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
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
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v42;
    *(_QWORD *)&v4 = 136316162;
    v26 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v9 = objc_msgSend(*(id *)(a1 + 40), "streamGroupWithID:", objc_msgSend(v8, "streamGroupID", v26));
        if (v9)
        {
          v10 = (void *)v9;
          if (objc_msgSend(*(id *)(a1 + 40), "isStreamGroupActive:", v9))
          {
            v11 = objc_msgSend(v8, "v2StreamID")
                ? objc_msgSend(v8, "v2StreamID")
                : objc_msgSend(v8, "streamID");
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11));
            if (objc_msgSend(*(id *)(a1 + 40), "isSeamlessTransitionSupportedForStreamGroup:", v10))
              objc_msgSend(*(id *)(a1 + 40), "appendOptedInStreamID:toOptInStreamsIDs:targetBandwidthEntry:forceSeamlessTransition:", objc_msgSend(v10, "optedInStreamID"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8, *(unsigned __int8 *)(a1 + 56));
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v27 = FourccToCStr(objc_msgSend(v8, "streamGroupID"));
            v14 = objc_msgSend(v8, "streamGroupID");
            *(_DWORD *)buf = v26;
            v29 = v12;
            v30 = 2080;
            v31 = "-[VCSessionParticipantRemote recommendedStreamIDsForSelectedMediaEntries:forceSeamlessTransition:]_block_invoke";
            v32 = 1024;
            v33 = 1383;
            v34 = 2080;
            v35 = v27;
            v36 = 1024;
            LODWORD(v37) = v14;
            _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d Stream group '%s' (%d) doesn't exist!", buf, 0x2Cu);
          }
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
    }
    while (v5);
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 136315906;
        v29 = v16;
        v30 = 2080;
        v31 = "-[VCSessionParticipantRemote recommendedStreamIDsForSelectedMediaEntries:forceSeamlessTransition:]_block_invoke";
        v32 = 1024;
        v33 = 1395;
        v34 = 2112;
        v35 = v18;
        v19 = "VCSessionParticipantRemote [%s] %s:%d %@";
        v20 = v17;
        v21 = 38;
LABEL_28:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(a1 + 40);
        v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 136316418;
        v29 = v22;
        v30 = 2080;
        v31 = "-[VCSessionParticipantRemote recommendedStreamIDsForSelectedMediaEntries:forceSeamlessTransition:]_block_invoke";
        v32 = 1024;
        v33 = 1395;
        v34 = 2112;
        v35 = (void *)v15;
        v36 = 2048;
        v37 = v24;
        v38 = 2112;
        v39 = v25;
        v19 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) %@";
        v20 = v23;
        v21 = 58;
        goto LABEL_28;
      }
    }
  }
}

- (void)negotiateAudioRules:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VCSessionParticipantRemote_negotiateAudioRules___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(participantQueue, block);
}

void __50__VCSessionParticipantRemote_negotiateAudioRules___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
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
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "rules"));
  objc_msgSend(v2, "intersectSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(*(id *)(a1 + 40), "rules")));
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "clearAudioRules");
    objc_msgSend(*(id *)(a1 + 40), "addAudioRules:", objc_msgSend(v2, "allObjects"));
    return;
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    v6 = objc_msgSend(*(id *)(a1 + 40), "rules");
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "rules");
    v16 = 136316162;
    v17 = v4;
    v18 = 2080;
    v19 = "-[VCSessionParticipantRemote negotiateAudioRules:]_block_invoke";
    v20 = 1024;
    v21 = 1407;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    v8 = "VCSessionParticipantRemote [%s] %s:%d No compatible stream configuration! localAudioRules=%@ supportedAudioRules=%@";
    v9 = v5;
    v10 = 48;
LABEL_14:
    _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v16, v10);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
  else
    v3 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = objc_msgSend(*(id *)(a1 + 40), "rules");
      v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "rules");
      v16 = 136316674;
      v17 = v11;
      v18 = 2080;
      v19 = "-[VCSessionParticipantRemote negotiateAudioRules:]_block_invoke";
      v20 = 1024;
      v21 = 1407;
      v22 = 2112;
      v23 = (uint64_t)v3;
      v24 = 2048;
      v25 = v13;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) No compatible stream configuration! localAudioRules=%@ supportedAudioRules=%@";
      v9 = v12;
      v10 = 68;
      goto LABEL_14;
    }
  }
}

- (BOOL)isAudioActive
{
  return self->super._audioEnabled
      && self->_remoteAudioEnabled
      && !self->super._audioPaused
      && !self->_remoteAudioPaused;
}

- (void)updateAudioSpectrumState
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  unsigned int visibilityIndex;
  int v7;
  uint64_t EnableAudioPowerSpectrumReport;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSMutableArray *micStreamGroups;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BYTE v39[10];
  VCSessionParticipantRemote *v40;
  _BYTE v41[6];
  _BYTE v42[6];
  _BYTE v43[6];
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = self->super._videoEnabled && self->_remoteVideoEnabled && !self->super._videoPaused;
  v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1E9EF4E80), "mediaState") == 1&& objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1E9EF4E80), "remoteMediaState") == 1;
  v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1E9EF4E98), "mediaState") == 1&& objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1E9EF4E98), "remoteMediaState") == 1;
  visibilityIndex = self->_visibilityIndex;
  if (visibilityIndex)
    v7 = 1;
  else
    v7 = v3;
  if (((v7 | v4) & 1) != 0 || v5)
    EnableAudioPowerSpectrumReport = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
  else
    EnableAudioPowerSpectrumReport = 1;
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_34;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    v12 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_DWORD *)buf = 136317186;
      v33 = v10;
      v34 = 2080;
      v35 = "-[VCSessionParticipantRemote updateAudioSpectrumState]";
      v36 = 1024;
      v37 = 1430;
      v38 = 1024;
      *(_DWORD *)v39 = v3;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v4;
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = v5;
      HIWORD(v40) = 1024;
      *(_DWORD *)v41 = visibilityIndex == 0;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)v42 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)v43 = EnableAudioPowerSpectrumReport;
      v13 = "VCSessionParticipantRemote [%s] %s:%d is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isVisib"
            "le=%d testEnabled=%d => spectrumEnabled=%d";
      v14 = v11;
      v15 = 64;
LABEL_30:
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      goto LABEL_34;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136317186;
      v33 = v10;
      v34 = 2080;
      v35 = "-[VCSessionParticipantRemote updateAudioSpectrumState]";
      v36 = 1024;
      v37 = 1430;
      v38 = 1024;
      *(_DWORD *)v39 = v3;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = v4;
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = v5;
      HIWORD(v40) = 1024;
      *(_DWORD *)v41 = visibilityIndex == 0;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)v42 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
      *(_WORD *)&v42[4] = 1024;
      *(_DWORD *)v43 = EnableAudioPowerSpectrumReport;
      v19 = "VCSessionParticipantRemote [%s] %s:%d is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isVisib"
            "le=%d testEnabled=%d => spectrumEnabled=%d";
      v20 = v11;
      v21 = 64;
      goto LABEL_43;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      v18 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          goto LABEL_34;
        *(_DWORD *)buf = 136317698;
        v33 = v16;
        v34 = 2080;
        v35 = "-[VCSessionParticipantRemote updateAudioSpectrumState]";
        v36 = 1024;
        v37 = 1430;
        v38 = 2112;
        *(_QWORD *)v39 = v9;
        *(_WORD *)&v39[8] = 2048;
        v40 = self;
        *(_WORD *)v41 = 1024;
        *(_DWORD *)&v41[2] = v3;
        *(_WORD *)v42 = 1024;
        *(_DWORD *)&v42[2] = v4;
        *(_WORD *)v43 = 1024;
        *(_DWORD *)&v43[2] = v5;
        v44 = 1024;
        v45 = visibilityIndex == 0;
        v46 = 1024;
        v47 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
        v48 = 1024;
        v49 = EnableAudioPowerSpectrumReport;
        v13 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%"
              "d isVisible=%d testEnabled=%d => spectrumEnabled=%d";
        v14 = v17;
        v15 = 84;
        goto LABEL_30;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136317698;
        v33 = v16;
        v34 = 2080;
        v35 = "-[VCSessionParticipantRemote updateAudioSpectrumState]";
        v36 = 1024;
        v37 = 1430;
        v38 = 2112;
        *(_QWORD *)v39 = v9;
        *(_WORD *)&v39[8] = 2048;
        v40 = self;
        *(_WORD *)v41 = 1024;
        *(_DWORD *)&v41[2] = v3;
        *(_WORD *)v42 = 1024;
        *(_DWORD *)&v42[2] = v4;
        *(_WORD *)v43 = 1024;
        *(_DWORD *)&v43[2] = v5;
        v44 = 1024;
        v45 = visibilityIndex == 0;
        v46 = 1024;
        v47 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
        v48 = 1024;
        v49 = EnableAudioPowerSpectrumReport;
        v19 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%"
              "d isVisible=%d testEnabled=%d => spectrumEnabled=%d";
        v20 = v17;
        v21 = 84;
LABEL_43:
        _os_log_debug_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
      }
    }
  }
LABEL_34:
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  micStreamGroups = self->super._micStreamGroups;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(micStreamGroups);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "setPowerSpectrumEnabled:", EnableAudioPowerSpectrumReport);
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    }
    while (v24);
  }
}

- (BOOL)isScreenActive
{
  return self->super._screenEnabled && self->_remoteScreenEnabled;
}

- (VCSessionParticipantMediaStreamInfo)micStreamInfo
{
  return (VCSessionParticipantMediaStreamInfo *)objc_msgSend((id)objc_msgSend(-[VCSessionParticipant microphoneGroup](self, "microphoneGroup"), "mediaStreamInfoArray"), "firstObject");
}

- (VCSessionParticipantMediaStreamInfo)cameraStreamInfo
{
  return (VCSessionParticipantMediaStreamInfo *)objc_msgSend((id)objc_msgSend(-[VCSessionParticipantRemote videoGroup](self, "videoGroup"), "mediaStreamInfoArray"), "firstObject");
}

- (VCSessionParticipantMediaStreamInfo)screenStreamInfo
{
  VCSessionParticipantMediaStreamInfo *result;

  result = -[VCSessionParticipantRemote screenGroup](self, "screenGroup");
  if (result)
    return (VCSessionParticipantMediaStreamInfo *)objc_msgSend((id)objc_msgSend(-[VCSessionParticipantRemote screenGroup](self, "screenGroup"), "mediaStreamInfoArray"), "firstObject");
  return result;
}

- (id)systemAudioStreamInfo
{
  return (id)objc_msgSend((id)objc_msgSend(-[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"), "mediaStreamInfoArray"), "firstObject");
}

- (int64_t)participantScreenToken
{
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF4EB0), "integerValue");
}

- (id)screenGroup
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._streamGroups, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCSessionParticipantRemote participantScreenToken](self, "participantScreenToken")));
}

- (id)videoGroup
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._streamGroups, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCSessionParticipant participantVideoToken](self, "participantVideoToken")));
}

- (id)audioGroup
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._streamGroups, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCSessionParticipantRemote participantMicrophoneToken](self, "participantMicrophoneToken")));
}

- (_VCSessionParticipantCapabilities)capabilities
{
  _VCSessionParticipantCapabilities *p_capabilities;
  uint64_t v3;
  uint64_t v4;
  _VCSessionParticipantCapabilities result;

  p_capabilities = &self->_capabilities;
  v3 = *(_QWORD *)&self->_capabilities.isPeace;
  v4 = *(_QWORD *)&p_capabilities->controlChannelVersion;
  result.controlChannelVersion = v4;
  result.supportsGFTSwitchToOneToOne = BYTE4(v4);
  result.supportsParticipantIDBasedKeyLookup = BYTE5(v4);
  result.isDawnburstOrLater = BYTE6(v4);
  result.isPeace = v3;
  result.participantType = HIDWORD(v3);
  return result;
}

- (BOOL)isParticipantIDBasedKeyLookupEnabled
{
  return self->_capabilities.supportsParticipantIDBasedKeyLookup;
}

- (int64_t)participantMicrophoneToken
{
  void *v3;

  if ((unint64_t)-[VCSessionParticipantRemote capabilities](self, "capabilities") >> 32 == 1)
    v3 = &unk_1E9EF4E20;
  else
    v3 = &unk_1E9EF4E38;
  return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", v3), "integerValue");
}

- (unsigned)lastDisplayedFrameRTPTimestamp
{
  NSObject *participantQueue;
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
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VCSessionParticipantRemote_lastDisplayedFrameRTPTimestamp__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(participantQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__VCSessionParticipantRemote_lastDisplayedFrameRTPTimestamp__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "cameraGroups"), "firstObject"), "lastDisplayedFrameRTPTimestamp");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)configureWithOneToOneParticipantConfig:(id)a3 operatingMode:(int)a4
{
  NSObject *participantQueue;
  char v5;
  _QWORD block[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__VCSessionParticipantRemote_configureWithOneToOneParticipantConfig_operatingMode___block_invoke;
  block[3] = &unk_1E9E54AA0;
  block[4] = self;
  block[5] = a3;
  block[6] = &v9;
  v8 = a4;
  dispatch_sync(participantQueue, block);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __83__VCSessionParticipantRemote_configureWithOneToOneParticipantConfig_operatingMode___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setOneToOneConfig:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:", objc_msgSend(*(id *)(a1 + 40), "deviceRole"), objc_msgSend(*(id *)(a1 + 40), "negotiatedVideoEnabled"), objc_msgSend(*(id *)(a1 + 40), "negotiatedScreenEnabled"), *(unsigned int *)(a1 + 56));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __83__VCSessionParticipantRemote_configureWithOneToOneParticipantConfig_operatingMode___block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v2 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v5 = *(_QWORD *)(a1 + 32);
          v6 = 136316162;
          v7 = v3;
          v8 = 2080;
          v9 = "-[VCSessionParticipantRemote configureWithOneToOneParticipantConfig:operatingMode:]_block_invoke";
          v10 = 1024;
          v11 = 1503;
          v12 = 2112;
          v13 = v2;
          v14 = 2048;
          v15 = v5;
          _os_log_error_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Fail configure participant", (uint8_t *)&v6, 0x30u);
        }
      }
    }
  }
}

- (void)dispatchedSetVideoReceiverFeedbackDelegate:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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

  v26 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = (void *)objc_msgSend(-[VCSessionParticipantRemote videoGroup](self, "videoGroup"), "mediaStreamInfoArray");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(v9, "stream");
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v11 = (void *)objc_msgSend(v9, "streamConfigs");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v11);
              if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "multiwayConfig"), "isOneToOne"))
              {
                objc_msgSend(v10, "setVideoReceiverFeedbackDelegate:", a3);
                goto LABEL_16;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
            if (v13)
              continue;
            break;
          }
        }
LABEL_16:
        ;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v6);
  }
}

- (void)setVideoReceiverFeedbackDelegate:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VCSessionParticipantRemote_setVideoReceiverFeedbackDelegate___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __63__VCSessionParticipantRemote_setVideoReceiverFeedbackDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedSetVideoReceiverFeedbackDelegate:", *(_QWORD *)(a1 + 40));
}

- (void)setVideoStreamDelegate:(id)a3 delegateFunctions:(const tagVCVideoStreamDelegateRealtimeInstanceVTable *)a4
{
  void *remoteScreenAttributesDidChange;
  NSObject *participantQueue;
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
  VCSessionParticipantRemote *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    remoteScreenAttributesDidChange = a4->remoteScreenAttributesDidChange;
    participantQueue = self->super._participantQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__VCSessionParticipantRemote_setVideoStreamDelegate_delegateFunctions___block_invoke;
    block[3] = &unk_1E9E53820;
    block[4] = self;
    block[5] = a3;
    block[6] = remoteScreenAttributesDidChange;
    dispatch_async(participantQueue, block);
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
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
        v19 = "-[VCSessionParticipantRemote setVideoStreamDelegate:delegateFunctions:]";
        v20 = 1024;
        v21 = 1529;
        v10 = "VCSessionParticipantRemote [%s] %s:%d videoStreamDelegateFunctions is NULL";
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
      v7 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
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
        v19 = "-[VCSessionParticipantRemote setVideoStreamDelegate:delegateFunctions:]";
        v20 = 1024;
        v21 = 1529;
        v22 = 2112;
        v23 = v7;
        v24 = 2048;
        v25 = self;
        v10 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoStreamDelegateFunctions is NULL";
        v11 = v14;
        v12 = 48;
        goto LABEL_14;
      }
    }
  }
}

uint64_t __71__VCSessionParticipantRemote_setVideoStreamDelegate_delegateFunctions___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "videoGroup"), "setVideoStreamDelegate:delegateFunctions:", *(_QWORD *)(a1 + 40), a1 + 48);
}

- (unsigned)actualNetworkBitrateWithAudioBitrates:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t i;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[VCSessionParticipantRemote actualNetworkBitrateForStreamGroup:](self, "actualNetworkBitrateForStreamGroup:", 1835623282);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v9 += -[VCSessionParticipantRemote actualNetworkBitrateForStreamGroup:](self, "actualNetworkBitrateForStreamGroup:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "streamGroupID"));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(a3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5));
  return v9;
}

- (id)startAudioIO
{
  return 0;
}

- (id)stopAudioStreams
{
  return 0;
}

- (id)startScreenGroup
{
  return 0;
}

- (void)updateThermalLevel:(int)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCSessionParticipantRemote_updateThermalLevel___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __49__VCSessionParticipantRemote_updateThermalLevel___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  _BYTE v15[24];
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 652) != v2)
  {
    v3 = result;
    *(_DWORD *)(v1 + 652) = v2;
    if (objc_opt_class() == *(_QWORD *)(result + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(v3 + 32), "updateShouldEnableMLEnhance", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18, v19);
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(v3 + 32), "updateShouldEnableMLEnhance", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18, v19);
      v7 = *(_DWORD *)(v3 + 40);
      *(_DWORD *)v15 = 136315906;
      *(_QWORD *)&v15[4] = v5;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[VCSessionParticipantRemote updateThermalLevel:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 1569;
      WORD2(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 6) = v7;
      v8 = "VCSessionParticipantRemote [%s] %s:%d New thermal level %d";
      v9 = v6;
      v10 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(v3 + 32), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(v3 + 32), "updateShouldEnableMLEnhance", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18, v19);
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(v3 + 32), "updateShouldEnableMLEnhance", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18, v19);
      v13 = *(_QWORD *)(v3 + 32);
      v14 = *(_DWORD *)(v3 + 40);
      *(_DWORD *)v15 = 136316418;
      *(_QWORD *)&v15[4] = v11;
      *(_WORD *)&v15[12] = 2080;
      *(_QWORD *)&v15[14] = "-[VCSessionParticipantRemote updateThermalLevel:]_block_invoke";
      *(_WORD *)&v15[22] = 1024;
      LODWORD(v16) = 1569;
      WORD2(v16) = 2112;
      *(_QWORD *)((char *)&v16 + 6) = v4;
      HIWORD(v16) = 2048;
      v17 = v13;
      LOWORD(v18) = 1024;
      *(_DWORD *)((char *)&v18 + 2) = v14;
      v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) New thermal level %d";
      v9 = v12;
      v10 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v15, v10);
    return objc_msgSend(*(id *)(v3 + 32), "updateShouldEnableMLEnhance", *(_OWORD *)v15, *(_QWORD *)&v15[16], v16, v17, v18, v19);
  }
  return result;
}

- (void)setMediaRecorder:(id)a3
{
  NSObject *participantQueue;
  _QWORD v5[5];
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCSessionParticipantRemote;
  -[VCSessionParticipant setMediaRecorder:](&v6, sel_setMediaRecorder_, a3);
  participantQueue = self->super._participantQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__VCSessionParticipantRemote_setMediaRecorder___block_invoke;
  v5[3] = &unk_1E9E521C0;
  v5[4] = self;
  dispatch_async(participantQueue, v5);
}

uint64_t __47__VCSessionParticipantRemote_setMediaRecorder___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (objc_msgSend(v7, "streamGroupID") == 1835623282)
          return objc_msgSend(v7, "setMediaRecorder:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (void)setStreamGroup:(unsigned int)a3 syncSourceStreamGroupID:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  _BYTE v32[24];
  __int128 v33;
  VCSessionParticipantRemote *v34;
  __int128 v35;
  uint64_t v36;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v36 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  v7 = -[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup");
  v8 = -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", v4);
  v9 = -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", v5);
  v10 = objc_msgSend(-[VCSessionParticipantRemote systemAudioStreamInfo](self, "systemAudioStreamInfo"), "stream");
  if ((_DWORD)v4 == 1937339233)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_32;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      *(_DWORD *)v32 = 136315906;
      *(_QWORD *)&v32[4] = v19;
      *(_WORD *)&v32[12] = 2080;
      *(_QWORD *)&v32[14] = "-[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 1603;
      WORD2(v33) = 2080;
      *(_QWORD *)((char *)&v33 + 6) = FourccToCStr(v5);
      v21 = "VCSessionParticipantRemote [%s] %s:%d Camera Composition has stopped. Removing stream group with streamGroup"
            "ID=%s as a sync source";
      v22 = v20;
      v23 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_32;
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_32;
      *(_DWORD *)v32 = 136316418;
      *(_QWORD *)&v32[4] = v28;
      *(_WORD *)&v32[12] = 2080;
      *(_QWORD *)&v32[14] = "-[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 1603;
      WORD2(v33) = 2112;
      *(_QWORD *)((char *)&v33 + 6) = v12;
      HIWORD(v33) = 2048;
      v34 = self;
      LOWORD(v35) = 2080;
      *(_QWORD *)((char *)&v35 + 2) = FourccToCStr(v5);
      v21 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Camera Composition has stopped. Removing stream group with stre"
            "amGroupID=%s as a sync source";
      v22 = v29;
      v23 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, v32, v23);
LABEL_32:
    objc_msgSend(v8, "removeSyncDestination:", v9, *(_QWORD *)v32, *(_OWORD *)&v32[8], v33, v34, v35);
    objc_msgSend(v7, "addSyncDestination:", v9);
    v26 = (void *)v10;
    v27 = 0;
    goto LABEL_33;
  }
  if ((_DWORD)v4 == 1835623282)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_26;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      *(_DWORD *)v32 = 136315906;
      *(_QWORD *)&v32[4] = v14;
      *(_WORD *)&v32[12] = 2080;
      *(_QWORD *)&v32[14] = "-[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 1596;
      WORD2(v33) = 2080;
      *(_QWORD *)((char *)&v33 + 6) = FourccToCStr(v5);
      v16 = "VCSessionParticipantRemote [%s] %s:%d Camera Composition has resumed. Adding stream group with streamGroupID"
            "=%s as a sync source";
      v17 = v15;
      v18 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_26;
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      *(_DWORD *)v32 = 136316418;
      *(_QWORD *)&v32[4] = v24;
      *(_WORD *)&v32[12] = 2080;
      *(_QWORD *)&v32[14] = "-[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:]";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 1596;
      WORD2(v33) = 2112;
      *(_QWORD *)((char *)&v33 + 6) = v11;
      HIWORD(v33) = 2048;
      v34 = self;
      LOWORD(v35) = 2080;
      *(_QWORD *)((char *)&v35 + 2) = FourccToCStr(v5);
      v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Camera Composition has resumed. Adding stream group with stream"
            "GroupID=%s as a sync source";
      v17 = v25;
      v18 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, v32, v18);
LABEL_26:
    objc_msgSend(v7, "removeSyncDestination:", v9, *(_OWORD *)v32, *(_QWORD *)&v32[16], v33, v34, v35);
    objc_msgSend(v8, "addSyncDestination:", v9);
    v26 = (void *)v10;
    v27 = 1;
LABEL_33:
    objc_msgSend(v26, "setJitterBufferMode:", v27);
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v32 = 136316418;
        *(_QWORD *)&v32[4] = v30;
        *(_WORD *)&v32[12] = 2080;
        *(_QWORD *)&v32[14] = "-[VCSessionParticipantRemote setStreamGroup:syncSourceStreamGroupID:]";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 1610;
        WORD2(v33) = 2112;
        *(_QWORD *)((char *)&v33 + 6) = v13;
        HIWORD(v33) = 2048;
        v34 = self;
        LOWORD(v35) = 2080;
        *(_QWORD *)((char *)&v35 + 2) = FourccToCStr(v5);
        _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Unable to sync the screen stream group with streamGroupID=%s", v32, 0x3Au);
      }
    }
  }
}

- (void)reactionDidStart:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VCSessionParticipantRemote_reactionDidStart___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __47__VCSessionParticipantRemote_reactionDidStart___block_invoke(uint64_t a1)
{
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__VCSessionParticipantRemote_reactionDidStart___block_invoke_2;
  v2[3] = &unk_1E9E55208;
  return objc_msgSend(*(id *)(a1 + 32), "callDelegateWithBlock:", v2);
}

uint64_t __47__VCSessionParticipantRemote_reactionDidStart___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:reactionDidStart:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)didStopReacting
{
  NSObject *participantQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__VCSessionParticipantRemote_didStopReacting__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __45__VCSessionParticipantRemote_didStopReacting__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__VCSessionParticipantRemote_didStopReacting__block_invoke_2;
  v3[3] = &unk_1E9E55140;
  v3[4] = v1;
  return objc_msgSend(v1, "callDelegateWithBlock:", v3);
}

uint64_t __45__VCSessionParticipantRemote_didStopReacting__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipantDidStopReacting:", *(_QWORD *)(a1 + 32));
}

- (id)optedInStreamIDForStreamGroupID:(unsigned int)a3
{
  return (id)objc_msgSend(-[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", *(_QWORD *)&a3), "optedInStreamID");
}

- (id)activeDownlinkStreamIDForStreamGroupID:(unsigned int)a3
{
  return (id)objc_msgSend(-[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", *(_QWORD *)&a3), "activeStreamID");
}

- (unsigned)actualNetworkBitrateForStreamGroup:(unsigned int)a3
{
  id v4;

  v4 = -[VCSessionParticipantRemote optedInStreamIDForStreamGroupID:](self, "optedInStreamIDForStreamGroupID:", *(_QWORD *)&a3);
  if (v4)
    LODWORD(v4) = objc_msgSend(-[VCSessionParticipantRemote entryForStreamID:](self, "entryForStreamID:", v4), "actualNetworkBitrate");
  return v4;
}

- (unsigned)optedInNetworkBitrateForStreamGroup:(unsigned int)a3
{
  id v4;

  v4 = -[VCSessionParticipantRemote optedInStreamIDForStreamGroupID:](self, "optedInStreamIDForStreamGroupID:", *(_QWORD *)&a3);
  if (v4)
    LODWORD(v4) = objc_msgSend(-[VCSessionParticipantRemote entryForStreamID:](self, "entryForStreamID:", v4), "maxNetworkBitrate");
  return v4;
}

- (void)reportConnectionTiming
{
  NSObject *participantQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__VCSessionParticipantRemote_reportConnectionTiming__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __52__VCSessionParticipantRemote_reportConnectionTiming__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportConnectionTimingDispatched");
}

- (void)reportConnectionTimingDispatched
{
  uint64_t v3;
  NSString *uuid;
  TimingCollection *perfTimers;
  opaqueRTCReporting *v6;
  __n128 v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t idsParticipantID;
  uint64_t v12;
  _BOOL4 isCameraUsedForConnectionTiming;
  const __CFString *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  v27[0] = CFSTR("VCSPIDSID");
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->super._idsParticipantID);
  v27[1] = CFSTR("VCSPUUID");
  uuid = self->super._uuid;
  v28[0] = v3;
  v28[1] = uuid;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  perfTimers = self->_perfTimers;
  v6 = -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  VCPerfTimingUtilsReport(perfTimers, (uint64_t)v6, v7);
  v8 = micro();
  -[TimingCollection setStartTime:forKey:](self->_perfTimers, "setStartTime:forKey:", 19);
  -[TimingCollection setStopTime:forKey:](self->_perfTimers, "setStopTime:forKey:", 19, v8);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      idsParticipantID = self->super._idsParticipantID;
      -[TimingCollection totalTimeForKey:](self->_perfTimers, "totalTimeForKey:", 19);
      isCameraUsedForConnectionTiming = self->_isCameraUsedForConnectionTiming;
      v15 = 136316418;
      v16 = v9;
      if (isCameraUsedForConnectionTiming)
        v14 = CFSTR("came");
      else
        v14 = CFSTR("mic");
      v17 = 2080;
      v18 = "-[VCSessionParticipantRemote reportConnectionTimingDispatched]";
      v19 = 1024;
      v20 = 1673;
      v21 = 2048;
      v22 = idsParticipantID;
      v23 = 2048;
      v24 = v12;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Remote participantID=%llu V2 connection timing=%f clocked by '%@' streamGroup", (uint8_t *)&v15, 0x3Au);
    }
  }
}

- (void)reportConnectionTimingWithStreamGroupDispatched:(id)a3
{
  TimingCollection *perfTimers;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  if (!self->_isCameraUsedForConnectionTiming)
    goto LABEL_4;
  if (objc_msgSend(a3, "streamGroupID") != 1667329381)
  {
    if (self->_isCameraUsedForConnectionTiming)
      return;
LABEL_4:
    if (objc_msgSend(a3, "streamGroupID") != 1835623282)
      return;
  }
  if (!self->_isConnectionTimingReported)
  {
    self->_isConnectionTimingReported = 1;
    perfTimers = self->_perfTimers;
    objc_msgSend(a3, "firstMediaFrameReceivedTime");
    -[TimingCollection setStopTime:forKey:](perfTimers, "setStopTime:forKey:", 19);
    objc_msgSend(a3, "setFirstMediaFrameReceivedTime:", 0.0);
    -[VCSessionParticipantRemote reportConnectionTimingDispatched](self, "reportConnectionTimingDispatched");
  }
}

- (void)didReceiveFirstFrameForStreamGroup:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "streamGroupID") == 1667329381
    && self->_capabilities.controlChannelVersion == 1
    && !self->_receivedFirstFrame)
  {
    self->_receivedFirstFrame = 1;
    -[VCSessionParticipantRemote setRemoteVideoEnabled:](self, "setRemoteVideoEnabled:", 1);
  }
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VCSessionParticipantRemote_didReceiveFirstFrameForStreamGroup___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(participantQueue, block);
}

_BYTE *__65__VCSessionParticipantRemote_didReceiveFirstFrameForStreamGroup___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[747])
    return (_BYTE *)objc_msgSend(result, "reportConnectionTimingWithStreamGroupDispatched:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  NSObject *participantQueue;
  _QWORD v8[6];
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!-[VCDefaults forceFECRepairStream](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFECRepairStream"))
  {
    participantQueue = self->super._participantQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke;
    v8[3] = &unk_1E9E522D8;
    v8[4] = a3;
    v8[5] = self;
    v9 = a4;
    dispatch_async(participantQueue, v8);
  }
}

void __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke(uint64_t a1)
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
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[5];
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
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(*(_QWORD *)(a1 + 40) + 440))
    return;
  if (objc_opt_class() == *(_QWORD *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315906;
        v32 = v3;
        v33 = 2080;
        v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke";
        v35 = 1024;
        v36 = 1718;
        v37 = 1024;
        LODWORD(v38) = v5;
        v6 = "VCSessionParticipantRemote [%s] %s:%d New redundancy percentage %d";
        v7 = v4;
        v8 = 34;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v12 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 136316418;
        v32 = v9;
        v33 = 2080;
        v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke";
        v35 = 1024;
        v36 = 1718;
        v37 = 2112;
        v38 = v2;
        v39 = 2048;
        v40 = v11;
        v41 = 1024;
        v42 = v12;
        v6 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) New redundancy percentage %d";
        v7 = v10;
        v8 = 54;
        goto LABEL_13;
      }
    }
  }
  v13 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)(a1 + 48))
  {
    if (*(_BYTE *)(v13 + 577))
      return;
    *(_BYTE *)(v13 + 577) = 1;
    v14 = *(void **)(a1 + 40);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke_91;
    v29[3] = &unk_1E9E55140;
    v29[4] = v14;
    objc_msgSend(v14, "callDelegateWithBlock:", v29);
    if (objc_opt_class() != *(_QWORD *)(a1 + 40))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v26 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136316162;
          v32 = v24;
          v33 = 2080;
          v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke";
          v35 = 1024;
          v36 = 1733;
          v37 = 2112;
          v38 = v15;
          v39 = 2048;
          v40 = v26;
          v20 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Requesting video redundancy";
LABEL_38:
          v22 = v25;
          v23 = 48;
          goto LABEL_39;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v32 = v18;
    v33 = 2080;
    v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke_2";
    v35 = 1024;
    v36 = 1733;
    v20 = "VCSessionParticipantRemote [%s] %s:%d Requesting video redundancy";
LABEL_29:
    v22 = v19;
    v23 = 28;
LABEL_39:
    _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v20, buf, v23);
    return;
  }
  if (!*(_BYTE *)(v13 + 577))
    return;
  *(_BYTE *)(v13 + 577) = 0;
  v16 = *(void **)(a1 + 40);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke_89;
  v30[3] = &unk_1E9E55140;
  v30[4] = v16;
  objc_msgSend(v16, "callDelegateWithBlock:", v30);
  if (objc_opt_class() == *(_QWORD *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v21 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136315650;
    v32 = v21;
    v33 = 2080;
    v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke_2";
    v35 = 1024;
    v36 = 1726;
    v20 = "VCSessionParticipantRemote [%s] %s:%d Dismissing video redundancy";
    goto LABEL_29;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v17 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
  else
    v17 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v27 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      v32 = v27;
      v33 = 2080;
      v34 = "-[VCSessionParticipantRemote redundancyController:redundancyPercentageDidChange:]_block_invoke";
      v35 = 1024;
      v36 = 1726;
      v37 = 2112;
      v38 = v17;
      v39 = 2048;
      v40 = v28;
      v20 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Dismissing video redundancy";
      goto LABEL_38;
    }
  }
}

uint64_t __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke_89(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didRequestVideoRedundancy:", *(_QWORD *)(a1 + 32), 0);
}

uint64_t __81__VCSessionParticipantRemote_redundancyController_redundancyPercentageDidChange___block_invoke_91(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didRequestVideoRedundancy:", *(_QWORD *)(a1 + 32), 1);
}

- (void)collectVideoChannelMetrics:(id *)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  VCMediaChannelMetrics_Reset((uint64_t)a3);
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCSessionParticipantRemote_collectVideoChannelMetrics___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __57__VCSessionParticipantRemote_collectVideoChannelMetrics___block_invoke(uint64_t a1)
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
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 488);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "collectAndLogChannelMetrics:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)collectAudioChannelMetrics:(id *)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  VCMediaChannelMetrics_Reset((uint64_t)a3);
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCSessionParticipantRemote_collectAudioChannelMetrics___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __57__VCSessionParticipantRemote_collectAudioChannelMetrics___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "collectAndLogChannelMetrics:", *(_QWORD *)(a1 + 40));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v4);
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "systemAudioGroup"), "collectAndLogChannelMetrics:", *(_QWORD *)(a1 + 40));
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "streamGroupWithID:", 1936290409), "collectAndLogChannelMetrics:", *(_QWORD *)(a1 + 40));
}

- (void)pushEventToNwActivity:(int64_t)a3 started:(BOOL)a4
{
  int v5;
  int *v7;
  uint64_t v8;
  const __CFString *v9;
  objc_class *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  VCSessionParticipantRemote *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v5 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  if (a3 == 8)
  {
    v7 = &OBJC_IVAR___VCSessionParticipantRemote__participantPoorConnectionNwActivity;
  }
  else
  {
    if (a3 != 9)
    {
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 8)
          return;
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        v13 = *MEMORY[0x1E0CF2758];
        if (!*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[VCSessionParticipantRemote pushEventToNwActivity:started:].cold.1();
          return;
        }
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          return;
        v23 = 136315906;
        v24 = v11;
        v25 = 2080;
        v26 = "-[VCSessionParticipantRemote pushEventToNwActivity:started:]";
        v27 = 1024;
        v28 = 1777;
        v29 = 1024;
        LODWORD(v30) = v5;
        v14 = "VCSessionParticipantRemote [%s] %s:%d Invalid NW activity label:%d";
        v15 = v12;
        v16 = 34;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 8)
          return;
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        v19 = *MEMORY[0x1E0CF2758];
        if (!*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v23 = 136316418;
            v24 = v17;
            v25 = 2080;
            v26 = "-[VCSessionParticipantRemote pushEventToNwActivity:started:]";
            v27 = 1024;
            v28 = 1777;
            v29 = 2112;
            v30 = v9;
            v31 = 2048;
            v32 = self;
            v33 = 1024;
            v34 = v5;
            _os_log_debug_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEBUG, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Invalid NW activity label:%d", (uint8_t *)&v23, 0x36u);
          }
          return;
        }
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          return;
        v23 = 136316418;
        v24 = v17;
        v25 = 2080;
        v26 = "-[VCSessionParticipantRemote pushEventToNwActivity:started:]";
        v27 = 1024;
        v28 = 1777;
        v29 = 2112;
        v30 = v9;
        v31 = 2048;
        v32 = self;
        v33 = 1024;
        v34 = v5;
        v14 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Invalid NW activity label:%d";
        v15 = v18;
        v16 = 54;
      }
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v23, v16);
      return;
    }
    v7 = &OBJC_IVAR___VCSessionParticipantRemote__participantMediaStallNwActivity;
  }
  v8 = *v7;
  if (*(Class *)((char *)&self->super.super.super.isa + v8))
  {
    if (a4)
      return;
LABEL_15:
    nw_activity_complete_with_reason();
    nw_release(*(void **)((char *)&self->super.super.super.isa + v8));
    *(Class *)((char *)&self->super.super.super.isa + v8) = 0;
    return;
  }
  v10 = (objc_class *)nw_activity_create();
  *(Class *)((char *)&self->super.super.super.isa + v8) = v10;
  if (v10)
  {
    if (self->_nwActivity)
      nw_activity_set_parent_activity();
    nw_activity_activate();
    if (!a4)
      goto LABEL_15;
  }
  else if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantRemote pushEventToNwActivity:started:].cold.2();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v23 = 136316162;
        v24 = v21;
        v25 = 2080;
        v26 = "-[VCSessionParticipantRemote pushEventToNwActivity:started:]";
        v27 = 1024;
        v28 = 1783;
        v29 = 2112;
        v30 = v20;
        v31 = 2048;
        v32 = self;
        _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create event nwActivity", (uint8_t *)&v23, 0x30u);
      }
    }
  }
}

- (void)setVideoDegraded:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 isVideoDegraded;
  VCSessionParticipantRemote *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  NSObject *v24;
  int64_t v25;
  _BYTE v26[24];
  __int128 v27;
  VCSessionParticipantRemote *v28;
  uint64_t v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  isVideoDegraded = self->_isVideoDegraded;
  v6 = (VCSessionParticipantRemote *)objc_opt_class();
  if (isVideoDegraded != v3)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)v26 = 136315906;
      *(_QWORD *)&v26[4] = v15;
      *(_WORD *)&v26[12] = 2080;
      *(_QWORD *)&v26[14] = "-[VCSessionParticipantRemote setVideoDegraded:]";
      *(_WORD *)&v26[22] = 1024;
      LODWORD(v27) = 1804;
      WORD2(v27) = 1024;
      *(_DWORD *)((char *)&v27 + 6) = v3;
      v17 = "VCSessionParticipantRemote [%s] %s:%d videoDegraded=%d";
      v18 = v16;
      v19 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)v26 = 136316418;
      *(_QWORD *)&v26[4] = v23;
      *(_WORD *)&v26[12] = 2080;
      *(_QWORD *)&v26[14] = "-[VCSessionParticipantRemote setVideoDegraded:]";
      *(_WORD *)&v26[22] = 1024;
      LODWORD(v27) = 1804;
      WORD2(v27) = 2112;
      *(_QWORD *)((char *)&v27 + 6) = v8;
      HIWORD(v27) = 2048;
      v28 = self;
      LOWORD(v29) = 1024;
      *(_DWORD *)((char *)&v29 + 2) = v3;
      v17 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoDegraded=%d";
      v18 = v24;
      v19 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, v26, v19);
LABEL_24:
    v25 = -[VCMediaStream streamToken](-[VCSessionParticipantMediaStreamInfo stream](-[VCSessionParticipantRemote cameraStreamInfo](self, "cameraStreamInfo", *(_OWORD *)v26, *(_QWORD *)&v26[16], v27, v28, v29, v30), "stream"), "streamToken");
    if (!-[VCDefaults forceDisableVideoDegraded](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableVideoDegraded"))objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteVideoDidDegrade:streamToken:", v3, v25);
    self->_isVideoDegraded = v3;
    -[VCSessionParticipant participantVideoToken](self, "participantVideoToken");
    kdebug_trace();
    -[VCSessionParticipantRemote pushEventToNwActivity:started:](self, "pushEventToNwActivity:started:", 8, v3);
    return;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_isVideoDegraded;
        *(_DWORD *)v26 = 136315906;
        *(_QWORD *)&v26[4] = v9;
        *(_WORD *)&v26[12] = 2080;
        *(_QWORD *)&v26[14] = "-[VCSessionParticipantRemote setVideoDegraded:]";
        *(_WORD *)&v26[22] = 1024;
        LODWORD(v27) = 1800;
        WORD2(v27) = 1024;
        *(_DWORD *)((char *)&v27 + 6) = v11;
        v12 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setVideoDegraded=%d with same value";
        v13 = v10;
        v14 = 34;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v26, v14);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_isVideoDegraded;
        *(_DWORD *)v26 = 136316418;
        *(_QWORD *)&v26[4] = v20;
        *(_WORD *)&v26[12] = 2080;
        *(_QWORD *)&v26[14] = "-[VCSessionParticipantRemote setVideoDegraded:]";
        *(_WORD *)&v26[22] = 1024;
        LODWORD(v27) = 1800;
        WORD2(v27) = 2112;
        *(_QWORD *)((char *)&v27 + 6) = v7;
        HIWORD(v27) = 2048;
        v28 = self;
        LOWORD(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 2) = v22;
        v12 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setVideoDegraded=%d with same value";
        v13 = v21;
        v14 = 54;
        goto LABEL_18;
      }
    }
  }
}

- (void)networkQualityDidDegrade:(BOOL)a3 isLocalNetworkQualityDegraded:(BOOL)a4
{
  objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "networkQualityDidDegrade:isLocalNetworkQualityDegraded:streamToken:", a3, a4, -[VCMediaStream streamToken](-[VCSessionParticipantMediaStreamInfo stream](-[VCSessionParticipantRemote cameraStreamInfo](self, "cameraStreamInfo"), "stream"), "streamToken"));
}

- (void)setRemoteMediaStalled:(BOOL)a3
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 isRemoteMediaStalled;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCSessionParticipantRemote *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_isRemoteMediaStalled != a3)
  {
    self->_isRemoteMediaStalled = a3;
    -[VCSessionParticipantRemote pushEventToNwActivity:started:](self, "pushEventToNwActivity:started:", 9, a3);
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        isRemoteMediaStalled = self->_isRemoteMediaStalled;
        v14 = 136315906;
        v15 = v5;
        v16 = 2080;
        v17 = "-[VCSessionParticipantRemote setRemoteMediaStalled:]";
        v18 = 1024;
        v19 = 1822;
        v20 = 1024;
        LODWORD(v21) = isRemoteMediaStalled;
        v8 = "VCSessionParticipantRemote [%s] %s:%d Ignoring setRemoteMediaStalled=%d with same value";
        v9 = v6;
        v10 = 34;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_isRemoteMediaStalled;
        v14 = 136316418;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCSessionParticipantRemote setRemoteMediaStalled:]";
        v18 = 1024;
        v19 = 1822;
        v20 = 2112;
        v21 = v4;
        v22 = 2048;
        v23 = self;
        v24 = 1024;
        v25 = v13;
        v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Ignoring setRemoteMediaStalled=%d with same value";
        v9 = v12;
        v10 = 54;
        goto LABEL_13;
      }
    }
  }
}

+ (BOOL)isDeviceLargeScreen
{
  return -[VCHardwareSettingsEmbedded isDeviceLargeScreen](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "isDeviceLargeScreen");
}

+ (unsigned)maxAudioNetworkBitrateForLocalInterfaceOnWiFi:(BOOL)a3 isLowLatencyAudio:(BOOL)a4
{
  _BOOL4 v4;
  unsigned int result;
  unsigned int v6;

  v4 = a3;
  result = -[VCHardwareSettings maxNetworkBitrateMultiwayAudioOnWifi:isLowLatencyAudio:](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "maxNetworkBitrateMultiwayAudioOnWifi:isLowLatencyAudio:", a3, a4);
  if (v4)
    v6 = 165600;
  else
    v6 = 55000;
  if (result >= v6)
    return v6;
  return result;
}

+ (unsigned)maxCameraQualityIndexWithRedundancyForVideoQuality:(unsigned __int8)a3 useWiFiTable:(BOOL)a4 enableCameraBitrateV2:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  int v8;
  unsigned int v9;
  unsigned int v10;

  v5 = a5;
  v6 = a4;
  if (a3 == 10)
  {
    if (a4 || a5)
      return 425;
    else
      return 250;
  }
  else if (a3 == 5)
  {
    v8 = objc_msgSend(a1, "isDeviceLargeScreen");
    if (v6 || v5)
      v9 = 250;
    else
      v9 = 125;
    if (v6)
      v10 = 425;
    else
      v10 = 250;
    if (v8)
      return v10;
    else
      return v9;
  }
  else if (a3)
  {
    return 0;
  }
  else
  {
    return 62;
  }
}

+ (unsigned)maxCameraQualityIndexForVideoQuality:(unsigned __int8)a3 useWiFiTable:(BOOL)a4 isSharingEnabled:(BOOL)a5 enableCameraBitrateV2:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  unsigned int v9;
  int v10;
  int v11;
  int v12;

  v6 = a6;
  v8 = a4;
  if (a3 == 10)
  {
    if (a4)
      v9 = 1800;
    else
      v9 = 250;
    if (a4)
      v10 = 1800;
    else
      v10 = 1000;
    if (a6)
      v9 = v10;
  }
  else if (a3 == 5)
  {
    v11 = objc_msgSend(a1, "isDeviceLargeScreen");
    if (v8)
      v9 = 250;
    else
      v9 = 125;
    if (v6)
    {
      v9 = 425;
      v12 = 425;
    }
    else
    {
      v12 = 250;
    }
    if (v8)
      v12 = 1000;
    if (v11)
      v9 = v12;
  }
  else if (a3)
  {
    v9 = 0;
  }
  else
  {
    v9 = 62;
  }
  if (v9 > 0x1A9 && a5)
    return 425;
  else
    return v9;
}

+ (unsigned)maxWebRTCCameraQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4 isSharingEnabled:(BOOL)a5 enableCameraBitrateV2:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  int v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BYTE v38[10];
  id v39;
  _BYTE v40[6];
  _BYTE v41[6];
  _BYTE v42[6];
  _BYTE v43[6];
  __int16 v44;
  _BOOL4 v45;
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  _BOOL4 v49;
  uint64_t v50;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v50 = *MEMORY[0x1E0C80C00];
  v11 = a5
     && +[VCHardwareSettings limitCameraDownlinkBitrateDuringSharing](VCHardwareSettings, "limitCameraDownlinkBitrateDuringSharing");
  v12 = v8 && !v11;
  if (v9 == 10)
  {
    if (v12 | v6)
      v13 = 1250;
    else
      v13 = 400;
  }
  else if (v9 == 5)
  {
    v14 = objc_msgSend(a1, "isDeviceLargeScreen");
    if (v12 | v6)
      v15 = 400;
    else
      v15 = 93;
    if (v12)
      v16 = 1250;
    else
      v16 = 400;
    if (v14)
      v13 = v16;
    else
      v13 = v15;
  }
  else if (v9)
  {
    v13 = 0;
  }
  else
  {
    v13 = 93;
  }
  if ((id)objc_opt_class() != a1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return v13;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    v26 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v31 = 136317954;
        v32 = v24;
        v33 = 2080;
        v34 = "+[VCSessionParticipantRemote maxWebRTCCameraQualityIndexForVideoQuality:isLocalOnWiFi:isSharingEnabled:ena"
              "bleCameraBitrateV2:]";
        v35 = 1024;
        v36 = 1944;
        v37 = 2112;
        *(_QWORD *)v38 = v17;
        *(_WORD *)&v38[8] = 2048;
        v39 = a1;
        *(_WORD *)v40 = 1024;
        *(_DWORD *)&v40[2] = v9;
        *(_WORD *)v41 = 1024;
        *(_DWORD *)&v41[2] = v8;
        *(_WORD *)v42 = 1024;
        *(_DWORD *)&v42[2] = objc_msgSend(a1, "isDeviceLargeScreen");
        *(_WORD *)v43 = 1024;
        *(_DWORD *)&v43[2] = v7;
        v44 = 1024;
        v45 = v11;
        v46 = 1024;
        v47 = v13;
        v48 = 1024;
        v49 = v6;
        v21 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoQuality=%d isLocalOnWiFi=%d isDeviceLargeScreen=%d isSha"
              "ringEnabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableCameraBitrateV2=%d";
        v22 = v25;
        v23 = 90;
        goto LABEL_33;
      }
      return v13;
    }
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      return v13;
    v31 = 136317954;
    v32 = v24;
    v33 = 2080;
    v34 = "+[VCSessionParticipantRemote maxWebRTCCameraQualityIndexForVideoQuality:isLocalOnWiFi:isSharingEnabled:enableC"
          "ameraBitrateV2:]";
    v35 = 1024;
    v36 = 1944;
    v37 = 2112;
    *(_QWORD *)v38 = v17;
    *(_WORD *)&v38[8] = 2048;
    v39 = a1;
    *(_WORD *)v40 = 1024;
    *(_DWORD *)&v40[2] = v9;
    *(_WORD *)v41 = 1024;
    *(_DWORD *)&v41[2] = v8;
    *(_WORD *)v42 = 1024;
    *(_DWORD *)&v42[2] = objc_msgSend(a1, "isDeviceLargeScreen");
    *(_WORD *)v43 = 1024;
    *(_DWORD *)&v43[2] = v7;
    v44 = 1024;
    v45 = v11;
    v46 = 1024;
    v47 = v13;
    v48 = 1024;
    v49 = v6;
    v27 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoQuality=%d isLocalOnWiFi=%d isDeviceLargeScreen=%d isSharing"
          "Enabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableCameraBitrateV2=%d";
    v28 = v25;
    v29 = 90;
LABEL_39:
    _os_log_debug_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEBUG, v27, (uint8_t *)&v31, v29);
    return v13;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8)
    return v13;
  v18 = VRTraceErrorLogLevelToCSTR();
  v19 = *MEMORY[0x1E0CF2758];
  v20 = *MEMORY[0x1E0CF2758];
  if (!*MEMORY[0x1E0CF2748])
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      return v13;
    v31 = 136317442;
    v32 = v18;
    v33 = 2080;
    v34 = "+[VCSessionParticipantRemote maxWebRTCCameraQualityIndexForVideoQuality:isLocalOnWiFi:isSharingEnabled:enableC"
          "ameraBitrateV2:]";
    v35 = 1024;
    v36 = 1944;
    v37 = 1024;
    *(_DWORD *)v38 = v9;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v8;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = objc_msgSend(a1, "isDeviceLargeScreen");
    HIWORD(v39) = 1024;
    *(_DWORD *)v40 = v7;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)v41 = v11;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)v42 = v13;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)v43 = v6;
    v27 = "VCSessionParticipantRemote [%s] %s:%d videoQuality=%d isLocalOnWiFi=%d isDeviceLargeScreen=%d isSharingEnabled"
          "=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableCameraBitrateV2=%d";
    v28 = v19;
    v29 = 70;
    goto LABEL_39;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v31 = 136317442;
    v32 = v18;
    v33 = 2080;
    v34 = "+[VCSessionParticipantRemote maxWebRTCCameraQualityIndexForVideoQuality:isLocalOnWiFi:isSharingEnabled:enableC"
          "ameraBitrateV2:]";
    v35 = 1024;
    v36 = 1944;
    v37 = 1024;
    *(_DWORD *)v38 = v9;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v8;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = objc_msgSend(a1, "isDeviceLargeScreen");
    HIWORD(v39) = 1024;
    *(_DWORD *)v40 = v7;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)v41 = v11;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)v42 = v13;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)v43 = v6;
    v21 = "VCSessionParticipantRemote [%s] %s:%d videoQuality=%d isLocalOnWiFi=%d isDeviceLargeScreen=%d isSharingEnabled"
          "=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableCameraBitrateV2=%d";
    v22 = v19;
    v23 = 70;
LABEL_33:
    _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v31, v23);
  }
  return v13;
}

+ (unsigned)maxCameraQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4 isRedundancyRequested:(BOOL)a5 isSharingEnabled:(BOOL)a6 enableCameraBitrateV2:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  uint64_t v11;
  _BOOL4 v13;
  _BOOL8 v14;
  unsigned int v15;
  unsigned int v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  os_log_t log;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BYTE v38[10];
  id v39;
  _BYTE v40[6];
  _BYTE v41[6];
  _BYTE v42[6];
  _BYTE v43[6];
  _BYTE v44[6];
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v51 = *MEMORY[0x1E0C80C00];
  v13 = a6
     && +[VCHardwareSettings limitCameraDownlinkBitrateDuringSharing](VCHardwareSettings, "limitCameraDownlinkBitrateDuringSharing");
  v14 = v10 && !v13;
  if (v9)
    v15 = objc_msgSend(a1, "maxCameraQualityIndexWithRedundancyForVideoQuality:useWiFiTable:enableCameraBitrateV2:", v11, v14, v7);
  else
    v15 = objc_msgSend(a1, "maxCameraQualityIndexForVideoQuality:useWiFiTable:isSharingEnabled:enableCameraBitrateV2:", v11, v14, v8, v7);
  v16 = v15;
  if ((id)objc_opt_class() != a1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)objc_msgSend(a1, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return v16;
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    log = (os_log_t)*MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136318210;
        v32 = v24;
        v33 = 2080;
        v34 = "+[VCSessionParticipantRemote maxCameraQualityIndexForVideoQuality:isLocalOnWiFi:isRedundancyRequested:isSh"
              "aringEnabled:enableCameraBitrateV2:]";
        v35 = 1024;
        v36 = 1959;
        v37 = 2112;
        *(_QWORD *)v38 = v17;
        *(_WORD *)&v38[8] = 2048;
        v39 = a1;
        *(_WORD *)v40 = 1024;
        *(_DWORD *)&v40[2] = v11;
        *(_WORD *)v41 = 1024;
        *(_DWORD *)&v41[2] = v9;
        *(_WORD *)v42 = 1024;
        *(_DWORD *)&v42[2] = v10;
        *(_WORD *)v43 = 1024;
        *(_DWORD *)&v43[2] = objc_msgSend(a1, "isDeviceLargeScreen");
        *(_WORD *)v44 = 1024;
        *(_DWORD *)&v44[2] = v8;
        v45 = 1024;
        v46 = v13;
        v47 = 1024;
        v48 = v16;
        v49 = 1024;
        v50 = v7;
        v21 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoQuality=%d isRedundancyRequested=%d isLocalOnWiFi=%d isD"
              "eviceLargeScreen=%d isSharingEnabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enable"
              "CameraBitrateV2=%d";
        v22 = log;
        v23 = 96;
        goto LABEL_19;
      }
      return v16;
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      return v16;
    *(_DWORD *)buf = 136318210;
    v32 = v24;
    v33 = 2080;
    v34 = "+[VCSessionParticipantRemote maxCameraQualityIndexForVideoQuality:isLocalOnWiFi:isRedundancyRequested:isSharin"
          "gEnabled:enableCameraBitrateV2:]";
    v35 = 1024;
    v36 = 1959;
    v37 = 2112;
    *(_QWORD *)v38 = v17;
    *(_WORD *)&v38[8] = 2048;
    v39 = a1;
    *(_WORD *)v40 = 1024;
    *(_DWORD *)&v40[2] = v11;
    *(_WORD *)v41 = 1024;
    *(_DWORD *)&v41[2] = v9;
    *(_WORD *)v42 = 1024;
    *(_DWORD *)&v42[2] = v10;
    *(_WORD *)v43 = 1024;
    *(_DWORD *)&v43[2] = objc_msgSend(a1, "isDeviceLargeScreen");
    *(_WORD *)v44 = 1024;
    *(_DWORD *)&v44[2] = v8;
    v45 = 1024;
    v46 = v13;
    v47 = 1024;
    v48 = v16;
    v49 = 1024;
    v50 = v7;
    v26 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoQuality=%d isRedundancyRequested=%d isLocalOnWiFi=%d isDevic"
          "eLargeScreen=%d isSharingEnabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableCameraBitrateV2=%d";
    v27 = log;
    v28 = 96;
LABEL_25:
    _os_log_debug_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEBUG, v26, buf, v28);
    return v16;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8)
    return v16;
  v18 = VRTraceErrorLogLevelToCSTR();
  v19 = *MEMORY[0x1E0CF2758];
  v20 = *MEMORY[0x1E0CF2758];
  if (!*MEMORY[0x1E0CF2748])
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      return v16;
    *(_DWORD *)buf = 136317698;
    v32 = v18;
    v33 = 2080;
    v34 = "+[VCSessionParticipantRemote maxCameraQualityIndexForVideoQuality:isLocalOnWiFi:isRedundancyRequested:isSharin"
          "gEnabled:enableCameraBitrateV2:]";
    v35 = 1024;
    v36 = 1959;
    v37 = 1024;
    *(_DWORD *)v38 = v11;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v9;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = v10;
    HIWORD(v39) = 1024;
    *(_DWORD *)v40 = objc_msgSend(a1, "isDeviceLargeScreen");
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)v41 = v8;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)v42 = v13;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)v43 = v16;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)v44 = v7;
    v26 = "VCSessionParticipantRemote [%s] %s:%d videoQuality=%d isRedundancyRequested=%d isLocalOnWiFi=%d isDeviceLargeS"
          "creen=%d isSharingEnabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableCameraBitrateV2=%d";
    v27 = v19;
    v28 = 76;
    goto LABEL_25;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136317698;
    v32 = v18;
    v33 = 2080;
    v34 = "+[VCSessionParticipantRemote maxCameraQualityIndexForVideoQuality:isLocalOnWiFi:isRedundancyRequested:isSharin"
          "gEnabled:enableCameraBitrateV2:]";
    v35 = 1024;
    v36 = 1959;
    v37 = 1024;
    *(_DWORD *)v38 = v11;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v9;
    LOWORD(v39) = 1024;
    *(_DWORD *)((char *)&v39 + 2) = v10;
    HIWORD(v39) = 1024;
    *(_DWORD *)v40 = objc_msgSend(a1, "isDeviceLargeScreen");
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)v41 = v8;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)v42 = v13;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)v43 = v16;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)v44 = v7;
    v21 = "VCSessionParticipantRemote [%s] %s:%d videoQuality=%d isRedundancyRequested=%d isLocalOnWiFi=%d isDeviceLargeS"
          "creen=%d isSharingEnabled=%d, shouldLimitCameraQualityForSharing=%d, maxQualityIndex=%d, enableCameraBitrateV2=%d";
    v22 = v19;
    v23 = 76;
LABEL_19:
    _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
  }
  return v16;
}

+ (unsigned)maxFtxtQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4 isRedundancyRequested:(BOOL)a5 isSharingEnabled:(BOOL)a6
{
  unsigned int v6;
  int v7;
  unsigned int v8;

  if (a6)
    v6 = 135;
  else
    v6 = 275;
  if (a3)
    v7 = 0;
  else
    v7 = 96;
  if (a3 == 5)
    v8 = 135;
  else
    v8 = v7;
  if (a3 == 10)
    return v6;
  else
    return v8;
}

+ (unsigned)maxBdatQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4
{
  if (a3 == 10 || a3 == 5)
    return 140;
  if (a3)
    return 0;
  return 98;
}

+ (unsigned)maxFdatQualityIndexForVideoQuality:(unsigned __int8)a3 isLocalOnWiFi:(BOOL)a4
{
  if (a3 == 10 || a3 == 5)
    return 145;
  if (a3)
    return 0;
  return 99;
}

+ (unsigned)maxQualityIndexForStreamGroupID:(unsigned int)a3 videoQuality:(unsigned __int8)a4 isLocalOnWiFi:(BOOL)a5 isRedundancyRequested:(BOOL)a6 isSharingEnabled:(BOOL)a7 enableCameraBitrateV2:(BOOL)a8
{
  if ((int)a3 <= 1667329398)
  {
    if (a3 == 1650745716)
      return objc_msgSend(a1, "maxBdatQualityIndexForVideoQuality:isLocalOnWiFi:", a4, a5);
    if (a3 == 1667329381)
      return objc_msgSend(a1, "maxCameraQualityIndexForVideoQuality:isLocalOnWiFi:isRedundancyRequested:isSharingEnabled:enableCameraBitrateV2:", a4, a5, a6, a7, a8);
  }
  else
  {
    switch(a3)
    {
      case 0x63616D77u:
        return objc_msgSend(a1, "maxWebRTCCameraQualityIndexForVideoQuality:isLocalOnWiFi:isSharingEnabled:enableCameraBitrateV2:", a4, a5, a7, a8);
      case 0x66646174u:
        return objc_msgSend(a1, "maxFdatQualityIndexForVideoQuality:isLocalOnWiFi:", a4, a5);
      case 0x66747874u:
        return objc_msgSend(a1, "maxFtxtQualityIndexForVideoQuality:isLocalOnWiFi:isRedundancyRequested:isSharingEnabled:", a4, a5, a6, a7);
    }
  }
  return -1;
}

- (void)appendStreamGroup:(id)a3 maxQualityIndex:(unsigned int)a4 mediaEntries:(id)a5
{
  int *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_isRedundancyRequested && (objc_msgSend(a3, "hasRepairedStreams") & 1) != 0)
    v9 = &OBJC_IVAR___VCSessionParticipantRemote__repairMediaTable;
  else
    v9 = &OBJC_IVAR___VCSessionParticipantRemote__mediaTable;
  v10 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v9), "tableEntriesForStreamToken:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID"))), "unsignedIntValue"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v15, "qualityIndex") <= a4)
          objc_msgSend(a5, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v12);
  }
}

- (unsigned)cappedVideoQualityWithShouldLimitCameraQualityForPIP:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  unsigned int v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BYTE v24[10];
  VCSessionParticipantRemote *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v5 = -[VCSessionParticipantRemote videoQuality](self, "videoQuality");
  if (v3)
  {
    v6 = -[VCSessionParticipantRemote videoQuality](self, "videoQuality");
    if (v6 >= 5)
      v7 = 5;
    else
      v7 = v6;
  }
  else
  {
    v7 = v5;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136316162;
        v18 = v9;
        v19 = 2080;
        v20 = "-[VCSessionParticipantRemote cappedVideoQualityWithShouldLimitCameraQualityForPIP:]";
        v21 = 1024;
        v22 = 2049;
        v23 = 1024;
        *(_DWORD *)v24 = v7;
        *(_WORD *)&v24[4] = 1024;
        *(_DWORD *)&v24[6] = -[VCSessionParticipantRemote videoQuality](self, "videoQuality");
        v11 = "VCSessionParticipantRemote [%s] %s:%d cappedVideoQuality=%d self.videoQuality=%d";
        v12 = v10;
        v13 = 40;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136316674;
        v18 = v14;
        v19 = 2080;
        v20 = "-[VCSessionParticipantRemote cappedVideoQualityWithShouldLimitCameraQualityForPIP:]";
        v21 = 1024;
        v22 = 2049;
        v23 = 2112;
        *(_QWORD *)v24 = v8;
        *(_WORD *)&v24[8] = 2048;
        v25 = self;
        v26 = 1024;
        v27 = v7;
        v28 = 1024;
        v29 = -[VCSessionParticipantRemote videoQuality](self, "videoQuality");
        v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) cappedVideoQuality=%d self.videoQuality=%d";
        v12 = v15;
        v13 = 60;
        goto LABEL_15;
      }
    }
  }
  return v7;
}

- (void)appendStreamGroupsMediaEntries:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  _BOOL4 sharingEnabled;
  _BOOL4 v33;
  int v34;
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BYTE v44[10];
  VCSessionParticipantRemote *v45;
  _BYTE v46[6];
  _BYTE v47[6];
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  int v53;
  _BYTE v54[128];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v4 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
  if (!v5)
  {
    v30 = 0;
    v31 = 0;
    v34 = 0;
    v7 = 0;
    goto LABEL_40;
  }
  v6 = v5;
  v30 = 0;
  v31 = 0;
  v34 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v56;
  v35 = *(_QWORD *)v56;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v56 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v9);
      if (-[VCSessionParticipantRemote isStreamGroupActive:](self, "isStreamGroupActive:", v10))
      {
        if (objc_msgSend(v10, "streamGroupID") == 1667329381
          || objc_msgSend(v10, "streamGroupID") == 1667329399)
        {
          if (!-[VCSessionParticipantRemote isVisible](self, "isVisible"))
            goto LABEL_25;
          v11 = v4;
          v12 = v7;
          if (-[VCSessionParticipantRemote prominenceIndex](self, "prominenceIndex"))
            v13 = -[VCSessionParticipant presentationState](self, "presentationState") == 1;
          else
            v13 = 0;
          v15 = -[VCSessionParticipant isLocalOnWiFi](self, "isLocalOnWiFi") & !v13;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v16 = VRTraceErrorLogLevelToCSTR();
            v17 = *MEMORY[0x1E0CF2758];
            v18 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                sharingEnabled = self->super._sharingEnabled;
                v19 = -[VCSessionParticipant isLocalOnWiFi](self, "isLocalOnWiFi");
                *(_DWORD *)buf = 136316674;
                v38 = v16;
                v39 = 2080;
                v40 = "-[VCSessionParticipantRemote appendStreamGroupsMediaEntries:]";
                v41 = 1024;
                v42 = 2069;
                v43 = 1024;
                *(_DWORD *)v44 = sharingEnabled;
                *(_WORD *)&v44[4] = 1024;
                *(_DWORD *)&v44[6] = v19;
                LOWORD(v45) = 1024;
                *(_DWORD *)((char *)&v45 + 2) = v15;
                HIWORD(v45) = 1024;
                *(_DWORD *)v46 = v13;
                _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d _sharingEnabled=%d, self.isLocalOnWiFi=%d, shouldUseWifiQuality=%d, shouldLimitCameraQualityForPIP=%d", buf, 0x34u);
              }
            }
            else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              v33 = self->super._sharingEnabled;
              v20 = -[VCSessionParticipant isLocalOnWiFi](self, "isLocalOnWiFi");
              *(_DWORD *)buf = 136316674;
              v38 = v16;
              v39 = 2080;
              v40 = "-[VCSessionParticipantRemote appendStreamGroupsMediaEntries:]";
              v41 = 1024;
              v42 = 2069;
              v43 = 1024;
              *(_DWORD *)v44 = v33;
              *(_WORD *)&v44[4] = 1024;
              *(_DWORD *)&v44[6] = v20;
              LOWORD(v45) = 1024;
              *(_DWORD *)((char *)&v45 + 2) = v15;
              HIWORD(v45) = 1024;
              *(_DWORD *)v46 = v13;
              _os_log_debug_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEBUG, "VCSessionParticipantRemote [%s] %s:%d _sharingEnabled=%d, self.isLocalOnWiFi=%d, shouldUseWifiQuality=%d, shouldLimitCameraQualityForPIP=%d", buf, 0x34u);
            }
          }
          v14 = +[VCSessionParticipantRemote maxQualityIndexForStreamGroupID:videoQuality:isLocalOnWiFi:isRedundancyRequested:isSharingEnabled:enableCameraBitrateV2:](VCSessionParticipantRemote, "maxQualityIndexForStreamGroupID:videoQuality:isLocalOnWiFi:isRedundancyRequested:isSharingEnabled:enableCameraBitrateV2:", objc_msgSend(v10, "streamGroupID"), -[VCSessionParticipantRemote cappedVideoQualityWithShouldLimitCameraQualityForPIP:](self, "cappedVideoQualityWithShouldLimitCameraQualityForPIP:", v13), v15, self->_isRedundancyRequested, self->super._sharingEnabled, self->_enableMaxCameraBitrateVideoQualityV2);
          v7 = v12 + 1;
          v4 = v11;
          v8 = v35;
          goto LABEL_24;
        }
        if (objc_msgSend(v10, "streamGroupID") == 1835623282
          || objc_msgSend(v10, "streamGroupID") == 1835623287)
        {
          ++v34;
          goto LABEL_15;
        }
        if (objc_msgSend(v10, "streamGroupID") == 1935897189)
        {
          ++v31;
          goto LABEL_15;
        }
        if (objc_msgSend(v10, "streamGroupID") == 1937339233)
        {
          ++HIDWORD(v30);
          goto LABEL_15;
        }
        if (objc_msgSend(v10, "streamGroupID") == 1667330164)
        {
          LODWORD(v30) = v30 + 1;
          goto LABEL_15;
        }
        if (objc_msgSend(v10, "streamGroupID") == 1718909044
          || objc_msgSend(v10, "streamGroupID") == 1650745716
          || objc_msgSend(v10, "streamGroupID") == 1717854580)
        {
          v8 = v35;
          v14 = +[VCSessionParticipantRemote maxQualityIndexForStreamGroupID:videoQuality:isLocalOnWiFi:isRedundancyRequested:isSharingEnabled:enableCameraBitrateV2:](VCSessionParticipantRemote, "maxQualityIndexForStreamGroupID:videoQuality:isLocalOnWiFi:isRedundancyRequested:isSharingEnabled:enableCameraBitrateV2:", objc_msgSend(v10, "streamGroupID"), -[VCSessionParticipantRemote videoQuality](self, "videoQuality"), -[VCSessionParticipant isLocalOnWiFi](self, "isLocalOnWiFi"), self->_isRedundancyRequested, self->super._sharingEnabled, self->_enableMaxCameraBitrateVideoQualityV2);
        }
        else
        {
LABEL_15:
          v14 = 0xFFFFFFFFLL;
        }
LABEL_24:
        -[VCSessionParticipantRemote appendStreamGroup:maxQualityIndex:mediaEntries:](self, "appendStreamGroup:maxQualityIndex:mediaEntries:", v10, v14, a3);
      }
LABEL_25:
      ++v9;
    }
    while (v6 != v9);
    v21 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
    v6 = v21;
  }
  while (v21);
LABEL_40:
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316930;
        v38 = v23;
        v39 = 2080;
        v40 = "-[VCSessionParticipantRemote appendStreamGroupsMediaEntries:]";
        v41 = 1024;
        v42 = 2087;
        v43 = 1024;
        *(_DWORD *)v44 = v7;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v34;
        LOWORD(v45) = 1024;
        *(_DWORD *)((char *)&v45 + 2) = v31;
        HIWORD(v45) = 1024;
        *(_DWORD *)v46 = HIDWORD(v30);
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)v47 = v30;
        v25 = "VCSessionParticipantRemote [%s] %s:%d appendStreamGroupsMediaEntries, count of streamGroups are cameraStre"
              "amGroupCount=%d, micrStreamGroupCount=%d, screenStreamGroupCount=%d, systemAudioStreamGroupCount=%d, capti"
              "onsStreamGroupCount=%d ";
        v26 = v24;
        v27 = 58;
        goto LABEL_50;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317442;
        v38 = v28;
        v39 = 2080;
        v40 = "-[VCSessionParticipantRemote appendStreamGroupsMediaEntries:]";
        v41 = 1024;
        v42 = 2087;
        v43 = 2112;
        *(_QWORD *)v44 = v22;
        *(_WORD *)&v44[8] = 2048;
        v45 = self;
        *(_WORD *)v46 = 1024;
        *(_DWORD *)&v46[2] = v7;
        *(_WORD *)v47 = 1024;
        *(_DWORD *)&v47[2] = v34;
        v48 = 1024;
        v49 = v31;
        v50 = 1024;
        v51 = HIDWORD(v30);
        v52 = 1024;
        v53 = v30;
        v25 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) appendStreamGroupsMediaEntries, count of streamGroups are cam"
              "eraStreamGroupCount=%d, micrStreamGroupCount=%d, screenStreamGroupCount=%d, systemAudioStreamGroupCount=%d"
              ", captionsStreamGroupCount=%d ";
        v26 = v29;
        v27 = 78;
LABEL_50:
        _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }
  }
}

- (void)validateMediaEntries:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  VCSessionParticipantRemote *v10;
  id v11;
  const __CFString *v12;
  uint64_t v13;
  char IsOSFaultDisabled;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  char v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  _BYTE v25[24];
  __int128 v26;
  VCSessionParticipantRemote *v27;
  _BYTE v28[32];
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!-[VCSessionParticipantRemote isAudioActive](self, "isAudioActive"))
    return;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
  if (!v5)
  {
LABEL_11:
    v10 = -[VCSessionBandwidthAllocationTable tableEntriesForStreamToken:](self->_mediaTable, "tableEntriesForStreamToken:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF4E38), "unsignedIntValue"));
    v11 = -[VCSessionBandwidthAllocationTable tableEntriesForStreamToken:](self->_mediaTable, "tableEntriesForStreamToken:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF4E20), "unsignedIntValue"));
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 2)
        goto LABEL_27;
      v13 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v15 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v25 = 136316418;
          *(_QWORD *)&v25[4] = v13;
          *(_WORD *)&v25[12] = 2080;
          *(_QWORD *)&v25[14] = "-[VCSessionParticipantRemote validateMediaEntries:]";
          *(_WORD *)&v25[22] = 1024;
          LODWORD(v26) = 2106;
          WORD2(v26) = 2112;
          *(_QWORD *)((char *)&v26 + 6) = a3;
          HIWORD(v26) = 2112;
          v27 = v10;
          *(_WORD *)v28 = 2112;
          *(_QWORD *)&v28[2] = v11;
          v16 = "VCSessionParticipantRemote [%s] %s:%d No audio entry was added. addedMediaEntries=%@ micEntries=%@ micwEntries=%@";
          v17 = v15;
          v18 = 58;
LABEL_23:
          _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v16, v25, v18);
        }
LABEL_27:
        VCTerminateProcess((uint64_t)CFSTR("Missing audio entries"), CFSTR("VCSessionParticipantRemote"), (uint64_t)-[VCSessionParticipant reportingAgent](self, "reportingAgent", *(_OWORD *)v25, *(_QWORD *)&v25[16], v26, v27, *(_OWORD *)v28, *(_OWORD *)&v28[16]));
        return;
      }
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        goto LABEL_27;
      *(_DWORD *)v25 = 136316418;
      *(_QWORD *)&v25[4] = v13;
      *(_WORD *)&v25[12] = 2080;
      *(_QWORD *)&v25[14] = "-[VCSessionParticipantRemote validateMediaEntries:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 2106;
      WORD2(v26) = 2112;
      *(_QWORD *)((char *)&v26 + 6) = a3;
      HIWORD(v26) = 2112;
      v27 = v10;
      *(_WORD *)v28 = 2112;
      *(_QWORD *)&v28[2] = v11;
      v22 = "VCSessionParticipantRemote [%s] %s:%d No audio entry was added. addedMediaEntries=%@ micEntries=%@ micwEntries=%@";
      v23 = v15;
      v24 = 58;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 2)
        goto LABEL_27;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = VRTraceIsOSFaultDisabled();
      v21 = *MEMORY[0x1E0CF2758];
      if ((v20 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v25 = 136316930;
          *(_QWORD *)&v25[4] = v19;
          *(_WORD *)&v25[12] = 2080;
          *(_QWORD *)&v25[14] = "-[VCSessionParticipantRemote validateMediaEntries:]";
          *(_WORD *)&v25[22] = 1024;
          LODWORD(v26) = 2106;
          WORD2(v26) = 2112;
          *(_QWORD *)((char *)&v26 + 6) = v12;
          HIWORD(v26) = 2048;
          v27 = self;
          *(_WORD *)v28 = 2112;
          *(_QWORD *)&v28[2] = a3;
          *(_WORD *)&v28[10] = 2112;
          *(_QWORD *)&v28[12] = v10;
          *(_WORD *)&v28[20] = 2112;
          *(_QWORD *)&v28[22] = v11;
          v16 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) No audio entry was added. addedMediaEntries=%@ micEntries=%"
                "@ micwEntries=%@";
          v17 = v21;
          v18 = 78;
          goto LABEL_23;
        }
        goto LABEL_27;
      }
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        goto LABEL_27;
      *(_DWORD *)v25 = 136316930;
      *(_QWORD *)&v25[4] = v19;
      *(_WORD *)&v25[12] = 2080;
      *(_QWORD *)&v25[14] = "-[VCSessionParticipantRemote validateMediaEntries:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 2106;
      WORD2(v26) = 2112;
      *(_QWORD *)((char *)&v26 + 6) = v12;
      HIWORD(v26) = 2048;
      v27 = self;
      *(_WORD *)v28 = 2112;
      *(_QWORD *)&v28[2] = a3;
      *(_WORD *)&v28[10] = 2112;
      *(_QWORD *)&v28[12] = v10;
      *(_WORD *)&v28[20] = 2112;
      *(_QWORD *)&v28[22] = v11;
      v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) No audio entry was added. addedMediaEntries=%@ micEntries=%@ micwEntries=%@";
      v23 = v21;
      v24 = 78;
    }
    _os_log_fault_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_FAULT, v22, v25, v24);
    goto LABEL_27;
  }
  v6 = v5;
  v7 = *(_QWORD *)v31;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v31 != v7)
      objc_enumerationMutation(a3);
    v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
    if (objc_msgSend(v9, "streamGroupID") == 1835623282
      || objc_msgSend(v9, "streamGroupID") == 1835623287)
    {
      break;
    }
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
      if (v6)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
}

- (NSArray)mediaEntries
{
  NSObject *participantQueue;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VCSessionParticipantRemote *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSString *v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSString *uuid;
  NSString *v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  NSString *v25;
  uint64_t v26;
  NSArray *v27;
  _QWORD block[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  VCSessionParticipantRemote *v45;
  __int16 v46;
  NSString *v47;
  __int16 v48;
  VCSessionParticipantRemote *v49;
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3052000000;
  v33 = __Block_byref_object_copy__10;
  v34 = __Block_byref_object_dispose__10;
  v35 = 0xAAAAAAAAAAAAAAAALL;
  v35 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__VCSessionParticipantRemote_mediaEntries__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v30;
  dispatch_sync(participantQueue, block);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v4 = (void *)v31[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v52;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v52 != v6)
          objc_enumerationMutation(v4);
        v8 = *(VCSessionParticipantRemote **)(*((_QWORD *)&v51 + 1) + 8 * v7);
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 8)
            goto LABEL_21;
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E0CF2758];
          v19 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              goto LABEL_21;
            uuid = self->super._uuid;
            *(_DWORD *)buf = 136316162;
            v37 = v17;
            v38 = 2080;
            v39 = "-[VCSessionParticipantRemote mediaEntries]";
            v40 = 1024;
            v41 = 2123;
            v42 = 2112;
            v43 = (const __CFString *)uuid;
            v44 = 2112;
            v45 = v8;
            v14 = v18;
            v15 = "VCSessionParticipantRemote [%s] %s:%d mediaEntries %@: %@";
            v16 = 48;
            goto LABEL_17;
          }
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v25 = self->super._uuid;
            *(_DWORD *)buf = 136316162;
            v37 = v17;
            v38 = 2080;
            v39 = "-[VCSessionParticipantRemote mediaEntries]";
            v40 = 1024;
            v41 = 2123;
            v42 = 2112;
            v43 = (const __CFString *)v25;
            v44 = 2112;
            v45 = v8;
            v22 = v18;
            v23 = "VCSessionParticipantRemote [%s] %s:%d mediaEntries %@: %@";
            v24 = 48;
            goto LABEL_24;
          }
        }
        else
        {
          v9 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v9 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            v10 = VRTraceErrorLogLevelToCSTR();
            v11 = *MEMORY[0x1E0CF2758];
            v12 = *MEMORY[0x1E0CF2758];
            if (*MEMORY[0x1E0CF2748])
            {
              if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                goto LABEL_21;
              v13 = self->super._uuid;
              *(_DWORD *)buf = 136316674;
              v37 = v10;
              v38 = 2080;
              v39 = "-[VCSessionParticipantRemote mediaEntries]";
              v40 = 1024;
              v41 = 2123;
              v42 = 2112;
              v43 = v9;
              v44 = 2048;
              v45 = self;
              v46 = 2112;
              v47 = v13;
              v48 = 2112;
              v49 = v8;
              v14 = v11;
              v15 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) mediaEntries %@: %@";
              v16 = 68;
LABEL_17:
              _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
              goto LABEL_21;
            }
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              v21 = self->super._uuid;
              *(_DWORD *)buf = 136316674;
              v37 = v10;
              v38 = 2080;
              v39 = "-[VCSessionParticipantRemote mediaEntries]";
              v40 = 1024;
              v41 = 2123;
              v42 = 2112;
              v43 = v9;
              v44 = 2048;
              v45 = self;
              v46 = 2112;
              v47 = v21;
              v48 = 2112;
              v49 = v8;
              v22 = v11;
              v23 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) mediaEntries %@: %@";
              v24 = 68;
LABEL_24:
              _os_log_debug_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEBUG, v23, buf, v24);
            }
          }
        }
LABEL_21:
        ++v7;
      }
      while (v5 != v7);
      v26 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
      v5 = v26;
    }
    while (v26);
  }
  v27 = (NSArray *)v31[5];
  _Block_object_dispose(&v30, 8);
  return v27;
}

uint64_t __42__VCSessionParticipantRemote_mediaEntries__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "appendStreamGroupsMediaEntries:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return objc_msgSend(*(id *)(a1 + 32), "validateMediaEntries:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (BOOL)isVisible
{
  return self->_visibilityIndex == 0;
}

- (void)setMediaSuspended:(BOOL)a3 forStreamToken:(id)a4
{
  objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteVideoDidSuspend:streamToken:", a3, objc_msgSend(a4, "unsignedIntValue"));
}

- (BOOL)isVideoExpected
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 videoEnabled;
  _BOOL4 remoteVideoEnabled;
  _BOOL4 videoPaused;
  _BOOL4 remoteVideoPaused;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BYTE v33[10];
  VCSessionParticipantRemote *v34;
  _BYTE v35[6];
  _BYTE v36[6];
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  _BOOL4 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
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
          videoEnabled = self->super._videoEnabled;
          remoteVideoEnabled = self->_remoteVideoEnabled;
          videoPaused = self->super._videoPaused;
          remoteVideoPaused = self->_remoteVideoPaused;
          v26 = 136316930;
          v27 = v4;
          v28 = 2080;
          v29 = "-[VCSessionParticipantRemote isVideoExpected]";
          v30 = 1024;
          v31 = 2137;
          v32 = 1024;
          *(_DWORD *)v33 = videoEnabled;
          *(_WORD *)&v33[4] = 1024;
          *(_DWORD *)&v33[6] = remoteVideoEnabled;
          LOWORD(v34) = 1024;
          *(_DWORD *)((char *)&v34 + 2) = videoPaused;
          HIWORD(v34) = 1024;
          *(_DWORD *)v35 = remoteVideoPaused;
          *(_WORD *)&v35[4] = 1024;
          *(_DWORD *)v36 = -[VCSessionParticipantRemote isVisible](self, "isVisible");
          v11 = "VCSessionParticipantRemote [%s] %s:%d videoEnabled:%d remoteVideoEnabled:%d videoPaused:%d remoteVideoPa"
                "used:%d isVisible:%d";
          v12 = v5;
          v13 = 58;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v26, v13);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[VCSessionParticipantRemote isVideoExpected].cold.1();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return self->super._videoEnabled
          && self->_remoteVideoEnabled
          && !self->super._videoPaused
          && !self->_remoteVideoPaused
          && -[VCSessionParticipantRemote isVisible](self, "isVisible");
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    v16 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = self->super._videoEnabled;
        v18 = self->_remoteVideoEnabled;
        v19 = self->super._videoPaused;
        v20 = self->_remoteVideoPaused;
        v26 = 136317442;
        v27 = v14;
        v28 = 2080;
        v29 = "-[VCSessionParticipantRemote isVideoExpected]";
        v30 = 1024;
        v31 = 2137;
        v32 = 2112;
        *(_QWORD *)v33 = v3;
        *(_WORD *)&v33[8] = 2048;
        v34 = self;
        *(_WORD *)v35 = 1024;
        *(_DWORD *)&v35[2] = v17;
        *(_WORD *)v36 = 1024;
        *(_DWORD *)&v36[2] = v18;
        v37 = 1024;
        v38 = v19;
        v39 = 1024;
        v40 = v20;
        v41 = 1024;
        v42 = -[VCSessionParticipantRemote isVisible](self, "isVisible");
        v11 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoEnabled:%d remoteVideoEnabled:%d videoPaused:%d remoteVi"
              "deoPaused:%d isVisible:%d";
        v12 = v15;
        v13 = 78;
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v21 = self->super._videoEnabled;
      v22 = self->_remoteVideoEnabled;
      v23 = self->super._videoPaused;
      v24 = self->_remoteVideoPaused;
      v26 = 136317442;
      v27 = v14;
      v28 = 2080;
      v29 = "-[VCSessionParticipantRemote isVideoExpected]";
      v30 = 1024;
      v31 = 2137;
      v32 = 2112;
      *(_QWORD *)v33 = v3;
      *(_WORD *)&v33[8] = 2048;
      v34 = self;
      *(_WORD *)v35 = 1024;
      *(_DWORD *)&v35[2] = v21;
      *(_WORD *)v36 = 1024;
      *(_DWORD *)&v36[2] = v22;
      v37 = 1024;
      v38 = v23;
      v39 = 1024;
      v40 = v24;
      v41 = 1024;
      v42 = -[VCSessionParticipantRemote isVisible](self, "isVisible");
      _os_log_debug_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEBUG, "VCSessionParticipantRemote [%s] %s:%d %@(%p) videoEnabled:%d remoteVideoEnabled:%d videoPaused:%d remoteVideoPaused:%d isVisible:%d", (uint8_t *)&v26, 0x4Eu);
    }
  }
  return self->super._videoEnabled
      && self->_remoteVideoEnabled
      && !self->super._videoPaused
      && !self->_remoteVideoPaused
      && -[VCSessionParticipantRemote isVisible](self, "isVisible");
}

- (void)updateScreenStreamConfigurationWithStreamGroupResult:(id)a3 multiwayConfig:(id)a4 screenStreamConfig:(id)a5
{
  double v9;
  uint64_t v10;
  double v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  objc_msgSend(a3, "resolution");
  v10 = (int)v9;
  objc_msgSend(a3, "resolution");
  v12 = +[VideoUtil videoResolutionForWidth:height:](VideoUtil, "videoResolutionForWidth:height:", v10, (int)v11);
  objc_msgSend(a4, "setResolution:", v12);
  objc_msgSend(a5, "setVideoResolution:", v12);
  v13 = 1;
  objc_msgSend(a5, "setCaptureSource:", 1);
  v14 = objc_msgSend(a3, "framerate");
  LODWORD(v10) = v14;
  objc_msgSend(a4, "setFramerate:", v14);
  objc_msgSend(a5, "setFramerate:", v10);
  objc_msgSend(a5, "setRemoteVideoInitialOrientation:", 2);
  v15 = objc_msgSend(a3, "keyFrameInterval");
  objc_msgSend(a4, "setKeyFrameInterval:", v15);
  objc_msgSend(a5, "setKeyFrameInterval:", v15);
  objc_msgSend(a5, "setLtrpEnabled:", 0);
  if (objc_msgSend(a3, "coordinateSystem") == 1)
    v13 = -[VCSessionParticipantRemote supportsNegotiatedCoordinateSystem](self, "supportsNegotiatedCoordinateSystem") ^ 1;
  objc_msgSend(a5, "setForceZeroRegionOfInterestOrigin:", v13);
  objc_msgSend(a5, "setDeferredAssemblyEnabled:", 1);
  objc_msgSend(a5, "setLooseAVSyncEnabled:", 1);
  v16 = +[VCVideoFeatureListStringHelper newFeatureListStringsDictForGroupID:isOneToOne:](VCVideoFeatureListStringHelper, "newFeatureListStringsDictForGroupID:isOneToOne:", 1935897189, objc_msgSend(a4, "isOneToOne"));
  objc_msgSend(a5, "setupTxPayloads:featureStrings:", objc_msgSend((id)objc_msgSend(a4, "payloads"), "allObjects"), v16);
  objc_msgSend(a5, "setupRxPayloads:featureStrings:", objc_msgSend((id)objc_msgSend(a4, "payloads"), "allObjects"), v16);

}

- (void)updateVideoMultiwayConfig:(id)a3 withStreamGroupStreamConfig:(id)a4
{
  double v6;
  double v7;
  int64_t v8;
  double v9;
  uint64_t v10;
  double v11;
  uint64_t v12;

  objc_msgSend(a3, "setIsTemporalStream:", objc_msgSend(a4, "isTemporalStream"));
  if (objc_msgSend(a3, "isTemporalStream"))
    objc_msgSend(a3, "setParentStreamID:", objc_msgSend(a4, "parentStreamID"));
  objc_msgSend(a3, "setIsSubStream:", objc_msgSend(a4, "isSubStream"));
  objc_msgSend(a4, "resolution");
  if (v6 == 0.0 && (objc_msgSend(a4, "resolution"), v7 == 0.0))
  {
    v8 = 11;
  }
  else
  {
    objc_msgSend(a4, "resolution");
    v10 = (int)v9;
    objc_msgSend(a4, "resolution");
    v8 = +[VideoUtil videoResolutionForWidth:height:](VideoUtil, "videoResolutionForWidth:height:", v10, (int)v11);
  }
  objc_msgSend(a3, "setResolution:", v8);
  if (objc_msgSend(a4, "framerate"))
    v12 = objc_msgSend(a4, "framerate");
  else
    v12 = 30;
  objc_msgSend(a3, "setFramerate:", v12);
  objc_msgSend(a3, "setKeyFrameInterval:", objc_msgSend(a4, "keyFrameInterval"));
}

- (id)newMultiwayConfigWithStreamGroupStreamConfig:(id)a3 maxIDSStreamIDCount:(unsigned int)a4 groupID:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  int v9;
  VCMediaStreamMultiwayConfigAudio *v10;
  double v11;
  VCMediaStreamMultiwayConfigVideo *v13;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  if ((int)a5 <= 1936290408)
  {
    if (a5 != 1835623282)
    {
      v9 = 1835623287;
      goto LABEL_6;
    }
LABEL_7:
    v10 = objc_alloc_init(VCMediaStreamMultiwayConfigAudio);
    -[VCMediaStreamMultiwayConfig setShouldIgnoreRTPHeaderExtensions:](v10, "setShouldIgnoreRTPHeaderExtensions:", 1);
LABEL_8:
    -[VCMediaStreamMultiwayConfig setStreamGroupID:](v10, "setStreamGroupID:", v5);
    -[VCMediaStreamMultiwayConfig setSsrc:](v10, "setSsrc:", objc_msgSend(a3, "ssrc"));
    -[VCMediaStreamMultiwayConfig setMaxNetworkBitrate:](v10, "setMaxNetworkBitrate:", objc_msgSend(a3, "maxNetworkBitrate"));
    -[VCMediaStreamMultiwayConfig setMaxMediaBitrate:](v10, "setMaxMediaBitrate:", objc_msgSend(a3, "maxMediaBitrate"));
    *(float *)&v11 = (float)objc_msgSend(a3, "maxPacketsPerSecond");
    -[VCMediaStreamMultiwayConfig setMaxPacketsPerSecond:](v10, "setMaxPacketsPerSecond:", v11);
    -[VCMediaStreamMultiwayConfig setIdsStreamID:](v10, "setIdsStreamID:", objc_msgSend(a3, "streamID"));
    if (objc_msgSend(a3, "repairedStreamID"))
    {
      -[VCMediaStreamMultiwayConfig setRepairedStreamID:](v10, "setRepairedStreamID:", objc_msgSend(a3, "repairedStreamID"));
      -[VCMediaStreamMultiwayConfig setRepairedMaxNetworkBitrate:](v10, "setRepairedMaxNetworkBitrate:", objc_msgSend(a3, "repairedMaxNetworkBitrate"));
    }
    -[VCMediaStreamMultiwayConfig setQualityIndex:](v10, "setQualityIndex:", objc_msgSend(a3, "qualityIndex"));
    -[VCMediaStreamMultiwayConfig setMaxIDSStreamIdCount:](v10, "setMaxIDSStreamIdCount:", v6);
    -[VCMediaStreamMultiwayConfig setStartOnDemand:](v10, "setStartOnDemand:", 0);
    -[VCMediaStreamMultiwayConfig setV2StreamID:](v10, "setV2StreamID:", objc_msgSend(a3, "v2StreamID"));
    return v10;
  }
  if (a5 == 1936290409)
    goto LABEL_7;
  v9 = 1937339233;
LABEL_6:
  if (a5 == v9)
    goto LABEL_7;
  v13 = objc_alloc_init(VCMediaStreamMultiwayConfigVideo);
  if (v13)
  {
    v10 = (VCMediaStreamMultiwayConfigAudio *)v13;
    -[VCSessionParticipantRemote updateVideoMultiwayConfig:withStreamGroupStreamConfig:](self, "updateVideoMultiwayConfig:withStreamGroupStreamConfig:", v13, a3);
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipantRemote newMultiwayConfigWithStreamGroupStreamConfig:maxIDSStreamIDCount:groupID:].cold.1();
  }
  return 0;
}

- (BOOL)setupVideoStreamConfiguration:(id)a3 withStreamGroupStreamConfig:(id)a4 codecConfigs:(id)a5 multiwayConfig:(id)a6 groupID:(unsigned int)a7
{
  uint64_t v7;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  _BOOL4 v21;
  _BOOL8 isServerRTxEnabled;
  BOOL v23;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  id v31;
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
  const __CFString *v44;
  __int16 v45;
  VCSessionParticipantRemote *v46;
  uint64_t v47;

  v7 = *(_QWORD *)&a7;
  v47 = *MEMORY[0x1E0C80C00];
  v13 = +[VCVideoFeatureListStringHelper newFeatureListStringsDictForGroupID:isOneToOne:](VCVideoFeatureListStringHelper, "newFeatureListStringsDictForGroupID:isOneToOne:", *(_QWORD *)&a7, objc_msgSend(a6, "isOneToOne"));
  v14 = v13;
  if (!v13)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:].cold.1();
      }
      goto LABEL_41;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_41;
    v27 = VRTraceErrorLogLevelToCSTR();
    v28 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    *(_DWORD *)buf = 136316162;
    v38 = v27;
    v39 = 2080;
    v40 = "-[VCSessionParticipantRemote setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:]";
    v41 = 1024;
    v42 = 2223;
    v43 = 2112;
    v44 = v25;
    v45 = 2048;
    v46 = self;
    v29 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create featureStringsDict";
    goto LABEL_43;
  }
  v15 = a5;
  v31 = v13;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v16 = (void *)objc_msgSend(a4, "payloads");
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(a6, "addPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "unsignedIntValue"));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    }
    while (v18);
  }
  objc_msgSend(a3, "setRxMinBitrate:", objc_msgSend(a4, "maxNetworkBitrate"));
  objc_msgSend(a3, "setRxMaxBitrate:", objc_msgSend(a4, "maxNetworkBitrate"));
  objc_msgSend(a3, "setTxMinBitrate:", objc_msgSend(a4, "maxNetworkBitrate"));
  objc_msgSend(a3, "setTxMaxBitrate:", objc_msgSend(a4, "maxNetworkBitrate"));
  objc_msgSend(a3, "setKeyFrameInterval:", objc_msgSend(a6, "keyFrameInterval"));
  objc_msgSend(a3, "setMinPlaybackInterval:", (double)-[VCSessionParticipant preferredIOSamplesPerFrameForGroupID:](self, "preferredIOSamplesPerFrameForGroupID:", v7)/ (double)-[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:", v7));
  v14 = v31;
  if (!-[VCSessionParticipantRemote setupStreamConfigWithCodecs:streamConfig:codecConfigs:featureStringsDict:](self, "setupStreamConfigWithCodecs:streamConfig:codecConfigs:featureStringsDict:", objc_msgSend(a4, "codecs"), a3, v15, v31))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:].cold.2();
      }
      goto LABEL_41;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v30 = VRTraceErrorLogLevelToCSTR(),
          v28 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_41:
      v23 = 0;
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136316162;
    v38 = v30;
    v39 = 2080;
    v40 = "-[VCSessionParticipantRemote setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:]";
    v41 = 1024;
    v42 = 2237;
    v43 = 2112;
    v44 = v26;
    v45 = 2048;
    v46 = self;
    v29 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) setupStreamConfigWithCodecs failed";
LABEL_43:
    _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0x30u);
    goto LABEL_41;
  }
  objc_msgSend(a3, "setType:", 3);
  objc_msgSend(a3, "setVideoResolution:", objc_msgSend(a6, "resolution"));
  objc_msgSend(a3, "setRemoteVideoInitialOrientation:", 0);
  objc_msgSend(a3, "setFramerate:", objc_msgSend(a6, "framerate"));
  objc_msgSend(a3, "setSourceFramerate:", 30);
  v21 = -[VCSessionParticipantRemote shouldEnablePacketRetransmissionForStreamGroupID:](self, "shouldEnablePacketRetransmissionForStreamGroupID:", v7);
  isServerRTxEnabled = 0;
  if (v21)
    isServerRTxEnabled = self->_isServerRTxEnabled;
  objc_msgSend(a3, "setIsServerPacketRetransmissionEnabled:", isServerRTxEnabled);
  if ((_DWORD)v7 == 1667329399)
  {
    objc_msgSend(a3, "setIsVariableSliceModeEnabled:", 1);
    objc_msgSend(a3, "setCvoExtensionID:", 1);
    objc_msgSend(a3, "setUseVideoJitterForVideoPlayout:", 0);
    goto LABEL_20;
  }
  if ((_DWORD)v7 == 1718909044)
  {
    objc_msgSend(a3, "setIsVariableSliceModeEnabled:", 1);
    goto LABEL_19;
  }
  if ((_DWORD)v7 != 1935897189)
  {
    if ((v7 & 0xFBFFFFFF) != 0x62646174)
      goto LABEL_20;
LABEL_19:
    objc_msgSend(a3, "setMediaStallTimeout:", 2.0);
    objc_msgSend(a3, "setMediaStallReportRepeatInterval:", 1.0);
    goto LABEL_20;
  }
  -[VCSessionParticipantRemote updateScreenStreamConfigurationWithStreamGroupResult:multiwayConfig:screenStreamConfig:](self, "updateScreenStreamConfigurationWithStreamGroupResult:multiwayConfig:screenStreamConfig:", a4, a6, a3);
LABEL_20:
  -[VCSessionParticipant setFECConfigurationOnStreamConfig:withStreamGroupID:](self, "setFECConfigurationOnStreamConfig:withStreamGroupID:", a3, v7);
  v23 = 1;
LABEL_21:

  return v23;
}

- (id)newMediaStreamConfigWithStreamGroupConfig:(id)a3 streamConfig:(id)a4 rateControlConfig:(id)a5 multiwayConfig:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  int v13;
  VCSessionParticipantAudioStreamConfig *v14;
  void *v15;
  uint64_t v16;
  VCSessionParticipantVideoStreamConfig *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  VCSessionParticipantRemote *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(a3, "groupID");
  v12 = v11;
  if ((int)v11 > 1936290408)
  {
    if ((_DWORD)v11 == 1936290409)
      goto LABEL_7;
    v13 = 1937339233;
  }
  else
  {
    if ((_DWORD)v11 == 1835623282)
      goto LABEL_7;
    v13 = 1835623287;
  }
  if ((_DWORD)v11 == v13)
  {
LABEL_7:
    v14 = objc_alloc_init(VCSessionParticipantAudioStreamConfig);
    if (v14)
    {
      v15 = v14;
      if (-[VCSessionParticipantRemote setupAudioStreamConfiguration:withStreamGroupConfig:streamGroupStreamConfig:](self, "setupAudioStreamConfiguration:withStreamGroupConfig:streamGroupStreamConfig:", v14, a3, a4))
      {
        goto LABEL_9;
      }
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:].cold.6();
        }
        goto LABEL_62;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v21 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v30 = 136316162;
          v31 = v24;
          v32 = 2080;
          v33 = "-[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:]";
          v34 = 1024;
          v35 = 2278;
          v36 = 2112;
          v37 = v21;
          v38 = 2048;
          v39 = self;
          v26 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup the audio stream config";
LABEL_48:
          _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v30, 0x30u);
          goto LABEL_62;
        }
      }
      goto LABEL_62;
    }
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:].cold.5();
      }
      goto LABEL_61;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v30 = 136316162;
        v31 = v22;
        v32 = 2080;
        v33 = "-[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:]";
        v34 = 1024;
        v35 = 2275;
        v36 = 2112;
        v37 = v20;
        v38 = 2048;
        v39 = self;
LABEL_43:
        _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate stream configuration!", (uint8_t *)&v30, 0x30u);
        goto LABEL_61;
      }
    }
    goto LABEL_61;
  }
  v18 = objc_alloc_init(VCSessionParticipantVideoStreamConfig);
  if (!v18)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:].cold.1();
      }
      goto LABEL_61;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v30 = 136316162;
        v31 = v28;
        v32 = 2080;
        v33 = "-[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:]";
        v34 = 1024;
        v35 = 2282;
        v36 = 2112;
        v37 = v27;
        v38 = 2048;
        v39 = self;
        goto LABEL_43;
      }
    }
LABEL_61:
    v15 = 0;
    goto LABEL_62;
  }
  v15 = v18;
  if (!-[VCSessionParticipantRemote setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:](self, "setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:", v18, a4, objc_msgSend((id)objc_msgSend(a3, "codecConfigs"), "array"), a6, v12))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:].cold.4();
      }
      goto LABEL_62;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v29 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v30 = 136316162;
        v31 = v29;
        v32 = 2080;
        v33 = "-[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:]";
        v34 = 1024;
        v35 = 2289;
        v36 = 2112;
        v37 = v19;
        v38 = 2048;
        v39 = self;
        v26 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup the video stream config";
        goto LABEL_48;
      }
    }
LABEL_62:

    return 0;
  }
LABEL_9:
  objc_msgSend(v15, "setMultiwayConfig:", a6);
  objc_msgSend(v15, "setDirection:", 2);
  objc_msgSend(v15, "setRemoteSSRC:", objc_msgSend(a4, "ssrc"));
  objc_msgSend(v15, "setRateControlConfig:", a5);
  if ((_DWORD)v12 == 1667329381)
    -[VCSessionParticipantRemote updateStreamConfigWithMLEnhance:](self, "updateStreamConfigWithMLEnhance:", v15);
  v16 = objc_msgSend(a4, "rtpTimestampRate");
  if (!(_DWORD)v16)
    v16 = -[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:", v12);
  objc_msgSend(v15, "setRtpTimestampRate:", v16);
  if ((objc_msgSend(a4, "applyCipherSuiteOnMediaStreamConfig:codecConfigs:", v15, objc_msgSend(a3, "codecConfigs")) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:].cold.3();
    }
    goto LABEL_62;
  }
  if (!-[VCSessionParticipant completeStreamSetup:rtpCipherSuite:](self, "completeStreamSetup:rtpCipherSuite:", v15, 3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:].cold.2();
    }
    goto LABEL_62;
  }
  return v15;
}

- (BOOL)setupStreamConfigWithCodecs:(id)a3 streamConfig:(id)a4 codecConfigs:(id)a5 featureStringsDict:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  id obj;
  uint64_t v26;
  int v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  int v40;
  _BYTE v41[128];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v28 = objc_msgSend(a5, "count");
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = a3;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = 0;
  v26 = *(_QWORD *)v43;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v43 != v26)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      if ((int)objc_msgSend(v13, "intValue") >= v28)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          return v11;
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          return v11;
        *(_DWORD *)buf = 136316162;
        v30 = v18;
        v31 = 2080;
        v32 = "-[VCSessionParticipantRemote setupStreamConfigWithCodecs:streamConfig:codecConfigs:featureStringsDict:]";
        v33 = 1024;
        v34 = 2334;
        v35 = 2112;
        v36 = (uint64_t)v13;
        v37 = 1024;
        LODWORD(v38) = v28;
        v20 = "VCSessionParticipantRemote [%s] %s:%d codecIndex=%@ out of bounds, codecConfigCount=%d";
        v21 = v19;
        v22 = 44;
LABEL_22:
        _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, v20, buf, v22);
        return v11;
      }
      v14 = (void *)objc_msgSend(a5, "objectAtIndexedSubscript:", (int)objc_msgSend(v13, "intValue"));
      v15 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(v14, "codecType"));
      v16 = objc_msgSend(v14, "rtpPayload");
      objc_msgSend(a4, "addTxPayloadType:networkPayload:", v15, v16);
      objc_msgSend(a4, "addRxPayloadType:networkPayload:", v15, v16);
      if (objc_msgSend(v14, "profileLevelId"))
      {
        objc_msgSend(a4, "setProfileLevel:", +[VCVideoStreamConfig profileLevelStringForId:](VCVideoStreamConfig, "profileLevelStringForId:", objc_msgSend(v14, "profileLevelId")));
        if (!objc_msgSend(a4, "profileLevel"))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            return v11;
          v23 = VRTraceErrorLogLevelToCSTR();
          v24 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            return v11;
          *(_DWORD *)buf = 136316418;
          v30 = v23;
          v31 = 2080;
          v32 = "-[VCSessionParticipantRemote setupStreamConfigWithCodecs:streamConfig:codecConfigs:featureStringsDict:]";
          v33 = 1024;
          v34 = 2342;
          v35 = 2048;
          v36 = objc_msgSend(v14, "profileLevelId");
          v37 = 2112;
          v38 = v13;
          v39 = 1024;
          v40 = v28;
          v20 = "VCSessionParticipantRemote [%s] %s:%d Could not retrieve a valid profileLevel string from profileLevelId"
                "=%lu with codecIndex=%@ codecConfigCount=%d";
          v21 = v24;
          v22 = 54;
          goto LABEL_22;
        }
      }
      objc_msgSend(a4, "setRtcpEnabled:", objc_msgSend(v14, "rtcpSREnabled"));
      objc_msgSend(a4, "setRtcpPSFB_FIREnabled:", objc_msgSend(v14, "rtcpPSFB_FIREnabled"));
      if (objc_msgSend(a4, "isRTCPEnabled"))
      {
        objc_msgSend(a4, "setRtcpSendInterval:", 0.0);
        objc_msgSend(a4, "setRtcpTimeOutEnabled:", 1);
        objc_msgSend(a4, "setRtcpTimeOutInterval:", 30.0);
      }
      objc_msgSend(a4, "addTxCodecFeatureListString:codecType:", objc_msgSend(a6, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15)), objc_msgSend(v14, "codecType"));
      objc_msgSend(a4, "addRxCodecFeatureListString:codecType:", objc_msgSend(a6, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15)), objc_msgSend(v14, "codecType"));
      v11 = 1;
    }
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
    if (v10)
      continue;
    return v11;
  }
}

- (id)newMediaStreamConfigWithStreamConfig:(id)a3 streamGroupConfig:(id)a4 maxIDSStreamIDCount:(unsigned int)a5
{
  uint64_t v5;
  VCMediaStreamRateControlConfig *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  const __CFString *v15;
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
  VCSessionParticipantRemote *v27;
  uint64_t v28;

  v5 = *(_QWORD *)&a5;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(VCMediaStreamRateControlConfig);
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantRemote newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:].cold.1();
    }
    goto LABEL_12;
  }
  v10 = -[VCSessionParticipantRemote newMultiwayConfigWithStreamGroupStreamConfig:maxIDSStreamIDCount:groupID:](self, "newMultiwayConfigWithStreamGroupStreamConfig:maxIDSStreamIDCount:groupID:", a3, v5, objc_msgSend(a4, "groupID"));
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantRemote newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:].cold.2();
    }
LABEL_12:
    v11 = 0;
LABEL_13:
    v13 = 0;
    goto LABEL_5;
  }
  v11 = v10;
  v12 = -[VCSessionParticipantRemote newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:](self, "newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:", a4, a3, v9, v10);
  if (!v12)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v18 = 136316162;
          v19 = v16;
          v20 = 2080;
          v21 = "-[VCSessionParticipantRemote newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:]";
          v22 = 1024;
          v23 = 2375;
          v24 = 2112;
          v25 = v15;
          v26 = 2048;
          v27 = self;
          _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to allocate stream configuration!", (uint8_t *)&v18, 0x30u);
        }
      }
    }
    goto LABEL_13;
  }
  v13 = v12;
LABEL_5:

  return v13;
}

- (id)newMediaStreamInfoWithNegotiationConfig:(id)a3 streamToken:(int64_t)a4
{
  VCSessionParticipantMediaStreamInfo *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  char *v21;
  id v22;
  void *v23;
  VCSessionParticipantMediaStreamInfo *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  int64_t v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  VCSessionParticipantRemote *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(VCSessionParticipantMediaStreamInfo);
  if (!v7)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:].cold.1();
      }
      goto LABEL_38;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v32 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v32 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v35 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v46 = v35;
        v47 = 2080;
        v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
        v49 = 1024;
        v50 = 2393;
        v51 = 2112;
        v52 = (void *)v32;
        v53 = 2048;
        v54 = self;
        v29 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create media stream info";
LABEL_41:
        _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, v29, buf, 0x30u);
      }
    }
LABEL_38:
    v24 = 0;
    v23 = 0;
    goto LABEL_39;
  }
  v39 = a4;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = (void *)objc_msgSend(a3, "streamConfigs");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v42;
LABEL_4:
    v13 = 0;
    v14 = -v11;
    while (1)
    {
      if (*(_QWORD *)v42 != v12)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v13);
      v16 = v14 + objc_msgSend((id)objc_msgSend(a3, "streamConfigs"), "count");
      if (objc_msgSend(v15, "v2StreamID"))
      {
        v16 = (2 * v16);
        if (v16 >= 0xD)
          break;
      }
      v17 = -[VCSessionParticipantRemote newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:](self, "newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:", v15, a3, v16);
      if (!v17)
      {
        if ((VCSessionParticipantRemote *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:].cold.4();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v25 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v25 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v27 = VRTraceErrorLogLevelToCSTR();
            v28 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v46 = v27;
              v47 = 2080;
              v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
              v49 = 1024;
              v50 = 2403;
              v51 = 2112;
              v52 = (void *)v25;
              v53 = 2048;
              v54 = self;
              v29 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create media stream config";
              goto LABEL_41;
            }
          }
        }
        goto LABEL_38;
      }
      v18 = v17;
      -[VCSessionParticipantMediaStreamInfo addStreamConfig:](v7, "addStreamConfig:", v17);

      ++v13;
      --v14;
      if (v10 == v13)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
        v11 = -v14;
        if (v10)
          goto LABEL_4;
        goto LABEL_12;
      }
    }
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:].cold.5();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v26 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v26 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v46 = v30;
          v47 = 2080;
          v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
          v49 = 1024;
          v50 = 2400;
          v51 = 2112;
          v52 = (void *)v26;
          v53 = 2048;
          v54 = self;
          v29 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) maxIDSStreamIDCount is beyond max allowed";
          goto LABEL_41;
        }
      }
    }
    goto LABEL_38;
  }
LABEL_12:
  if (!-[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:](self, "addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:", v7, a3)&& (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v21 = FourccToCStr(objc_msgSend(a3, "groupID"));
      *(_DWORD *)buf = 136315906;
      v46 = v19;
      v47 = 2080;
      v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
      v49 = 1024;
      v50 = 2411;
      v51 = 2080;
      v52 = v21;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Failed to add one to one groupID=%s stream configuration to media stream info", buf, 0x26u);
    }
  }
  v22 = -[VCSessionParticipantRemote newMediaStreamWithNegotiationConfig:streamToken:](self, "newMediaStreamWithNegotiationConfig:streamToken:", a3, v39);
  if (!v22)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:].cold.2();
      }
      goto LABEL_38;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v33 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v33 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v36 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v46 = v36;
        v47 = 2080;
        v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
        v49 = 1024;
        v50 = 2416;
        v51 = 2112;
        v52 = (void *)v33;
        v53 = 2048;
        v54 = self;
        v29 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create media stream";
        goto LABEL_41;
      }
    }
    goto LABEL_38;
  }
  v23 = v22;
  objc_msgSend(v22, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("participantID:%@ streamToken:%d"), self->super._uuid, v39));
  if (-[VCSessionParticipantRemote setupStreamRTP:](self, "setupStreamRTP:", v23))
  {
    -[VCSessionParticipantMediaStreamInfo setStream:](v7, "setStream:", v23);
    v24 = v7;
  }
  else
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v34 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v34 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v46 = v37;
          v47 = 2080;
          v48 = "-[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:]";
          v49 = 1024;
          v50 = 2420;
          v51 = 2112;
          v52 = (void *)v34;
          v53 = 2048;
          v54 = self;
          _os_log_error_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) invalid capabilies dictionary for media stream!", buf, 0x30u);
        }
      }
    }
    v24 = 0;
  }
LABEL_39:

  return v24;
}

- (void)setupMediaStreamGroupConfig:(id)a3 withNegotiationConfig:(id)a4
{
  uint64_t ID;

  objc_msgSend(a3, "setStreamGroupID:", objc_msgSend(a4, "groupID"));
  objc_msgSend(a3, "setSyncGroupID:", objc_msgSend(a4, "syncGroupID"));
  if (objc_msgSend(a4, "groupID") == 1667329381
    || objc_msgSend(a4, "groupID") == 1667329399)
  {
    ID = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", &unk_1E9EF4EC8), "integerValue");
  }
  else
  {
    ID = VCUniqueIDGenerator_GenerateID();
  }
  objc_msgSend(a3, "setStreamToken:", ID);
  objc_msgSend(a3, "setMediaType:", objc_msgSend(a4, "mediaType"));
  objc_msgSend(a3, "setMediaSubtype:", objc_msgSend(a4, "mediaSubtype"));
  objc_msgSend(a3, "setDelegate:", self);
  objc_msgSend(a3, "setDelegateQueue:", self->super._participantQueue);
  objc_msgSend(a3, "setParticipantUUID:", self->super._uuid);
  objc_msgSend(a3, "setIdsParticipantID:", self->super._idsParticipantID);
  objc_msgSend(a3, "setJbTargetEstimatorSynchronizer:", -[NSMutableDictionary objectForKeyedSubscript:](self->_jbSynchronizerPerSyncGroupID, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID"))));
  objc_msgSend(a3, "setNetworkFeedbackController:", self->super._networkFeedbackController);
  objc_msgSend(a3, "setSessionUUID:", self->super._sessionUUID);
}

- (int)spatialChannelIndex:(unsigned int *)a3 spatialAudioSourceID:(unint64_t *)a4 forMediaType:(unsigned int)a5
{
  void *v9;
  uint64_t v10;
  int v11;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  unsigned int v29;
  unint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _BYTE v38[10];
  VCSessionParticipantRemote *v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v29 = 0;
  v9 = -[VCSessionParticipantRemote spatialMetadataEntryForMediaType:](self, "spatialMetadataEntryForMediaType:", *(_QWORD *)&a5);
  if (!v9)
  {
    v11 = 0;
    goto LABEL_13;
  }
  v10 = (uint64_t)v9;
  if (!a3)
  {
    v11 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_7;
  }
  v11 = VCSpatialAudioMetadata_ChannelIndex((uint64_t)v9, &v29);
  if ((v11 & 0x80000000) == 0)
  {
    if (!a4)
      goto LABEL_9;
LABEL_7:
    v11 = VCSpatialAudioMetadata_SpatialAudioSourceID(v10, &v30);
    if (v11 < 0)
    {
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_8;
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        *(_DWORD *)buf = 136316162;
        v32 = v20;
        v33 = 2080;
        v34 = "-[VCSessionParticipantRemote spatialChannelIndex:spatialAudioSourceID:forMediaType:]";
        v35 = 1024;
        v36 = 2464;
        v37 = 1024;
        *(_DWORD *)v38 = a5;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v11;
        v22 = "VCSessionParticipantRemote [%s] %s:%d Failed to retrieve spatial audio source ID for mediaType=%d. status=%08x";
        v23 = v21;
        v24 = 40;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v14 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v14 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_8;
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_8;
        *(_DWORD *)buf = 136316674;
        v32 = v27;
        v33 = 2080;
        v34 = "-[VCSessionParticipantRemote spatialChannelIndex:spatialAudioSourceID:forMediaType:]";
        v35 = 1024;
        v36 = 2464;
        v37 = 2112;
        *(_QWORD *)v38 = v14;
        *(_WORD *)&v38[8] = 2048;
        v39 = self;
        v40 = 1024;
        v41 = a5;
        v42 = 1024;
        v43 = v11;
        v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to retrieve spatial audio source ID for mediaType=%d. status=%08x";
        v23 = v28;
        v24 = 60;
      }
      _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
    }
LABEL_8:
    *a4 = v30;
    goto LABEL_9;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v32 = v15;
        v33 = 2080;
        v34 = "-[VCSessionParticipantRemote spatialChannelIndex:spatialAudioSourceID:forMediaType:]";
        v35 = 1024;
        v36 = 2460;
        v37 = 1024;
        *(_DWORD *)v38 = a5;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v11;
        v17 = "VCSessionParticipantRemote [%s] %s:%d Failed to retrieve channel index for mediaType=%d. status=%08x";
        v18 = v16;
        v19 = 40;
LABEL_31:
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316674;
        v32 = v25;
        v33 = 2080;
        v34 = "-[VCSessionParticipantRemote spatialChannelIndex:spatialAudioSourceID:forMediaType:]";
        v35 = 1024;
        v36 = 2460;
        v37 = 2112;
        *(_QWORD *)v38 = v13;
        *(_WORD *)&v38[8] = 2048;
        v39 = self;
        v40 = 1024;
        v41 = a5;
        v42 = 1024;
        v43 = v11;
        v17 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to retrieve channel index for mediaType=%d. status=%08x";
        v18 = v26;
        v19 = 60;
        goto LABEL_31;
      }
    }
  }
LABEL_13:
  if (a4)
    goto LABEL_8;
LABEL_9:
  if (a3)
    *a3 = v29;
  return v11;
}

- (int)setupSpatialInfoForStreamGroupConfig:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  int v8;
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
  NSObject *v20;
  unsigned int v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BYTE v30[10];
  VCSessionParticipantRemote *v31;
  __int16 v32;
  _BYTE v33[10];
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v21 = 0;
  v5 = (void *)objc_msgSend(a3, "audioStreamGroupConfig");
  v6 = +[VCSessionParticipant mediaTypesFromStreamGroupID:](VCSessionParticipant, "mediaTypesFromStreamGroupID:", objc_msgSend(a3, "streamGroupID"));
  if (objc_msgSend(v6, "count") == 1)
  {
    v7 = objc_msgSend((id)objc_msgSend(v6, "anyObject"), "unsignedIntValue");
    v8 = -[VCSessionParticipantRemote spatialChannelIndex:spatialAudioSourceID:forMediaType:](self, "spatialChannelIndex:spatialAudioSourceID:forMediaType:", &v21, &v22, v7);
    if ((v8 & 0x80000000) == 0)
    {
      objc_msgSend(v5, "setSpatialAudioSourceID:", v22);
      objc_msgSend(v5, "setAudioChannelIndex:", v21);
      goto LABEL_4;
    }
    if ((VCSessionParticipantRemote *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_4;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_4;
      *(_DWORD *)buf = 136316674;
      v24 = v19;
      v25 = 2080;
      v26 = "-[VCSessionParticipantRemote setupSpatialInfoForStreamGroupConfig:]";
      v27 = 1024;
      v28 = 2487;
      v29 = 2112;
      *(_QWORD *)v30 = v11;
      *(_WORD *)&v30[8] = 2048;
      v31 = self;
      v32 = 1024;
      *(_DWORD *)v33 = v7;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v8;
      v14 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to retrieve spatial information for mediaType=%d. status=%08x";
      v15 = v20;
      v16 = 60;
      goto LABEL_30;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v24 = v12;
        v25 = 2080;
        v26 = "-[VCSessionParticipantRemote setupSpatialInfoForStreamGroupConfig:]";
        v27 = 1024;
        v28 = 2487;
        v29 = 1024;
        *(_DWORD *)v30 = v7;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = v8;
        v14 = "VCSessionParticipantRemote [%s] %s:%d Failed to retrieve spatial information for mediaType=%d. status=%08x";
        v15 = v13;
        v16 = 40;
LABEL_30:
        _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote setupSpatialInfoForStreamGroupConfig:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          v24 = v17;
          v25 = 2080;
          v26 = "-[VCSessionParticipantRemote setupSpatialInfoForStreamGroupConfig:]";
          v27 = 1024;
          v28 = 2483;
          v29 = 2112;
          *(_QWORD *)v30 = v10;
          *(_WORD *)&v30[8] = 2048;
          v31 = self;
          v32 = 2048;
          *(_QWORD *)v33 = objc_msgSend(v6, "count");
          *(_WORD *)&v33[8] = 1024;
          v34 = 0;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Unexpected number of media types. Count=%lu. status=%08x", buf, 0x40u);
        }
      }
    }
    v8 = 0;
  }
LABEL_4:
  if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8
    && !v22
    && objc_msgSend(a3, "streamGroupID") == 1937339233)
  {
    objc_msgSend(v5, "setSpatialAudioSourceID:", objc_msgSend(a3, "streamToken"));
    objc_msgSend(v5, "setAudioChannelIndex:", 0);
    return 0;
  }
  return v8;
}

- (id)newStreamGroupConfigWithNegotiationConfig:(id)a3
{
  VCAudioStreamReceiveGroupConfig *v5;
  void *v6;
  VCAudioStreamGroupCommonConfig *v7;
  void *v8;
  uint64_t v9;
  VCVideoStreamReceiveGroupConfig *v10;
  int v11;
  id v12;
  void *v13;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  VCSessionParticipantRemote *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "mediaType") != 1936684398)
  {
    v10 = objc_alloc_init(VCVideoStreamReceiveGroupConfig);
    if (v10)
    {
      v6 = v10;
      -[VCSessionParticipantRemote setupMediaStreamGroupConfig:withNegotiationConfig:](self, "setupMediaStreamGroupConfig:withNegotiationConfig:", v10, a3);
      goto LABEL_12;
    }
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:].cold.4();
      }
      goto LABEL_50;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v30 = 136316162;
        v31 = v27;
        v32 = 2080;
        v33 = "-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]";
        v34 = 1024;
        v35 = 2536;
        v36 = 2112;
        v37 = v17;
        v38 = 2048;
        v39 = self;
        goto LABEL_58;
      }
    }
LABEL_50:
    v6 = 0;
    goto LABEL_51;
  }
  v5 = objc_alloc_init(VCAudioStreamReceiveGroupConfig);
  if (!v5)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:].cold.1();
      }
      goto LABEL_50;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v30 = 136316162;
        v31 = v25;
        v32 = 2080;
        v33 = "-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]";
        v34 = 1024;
        v35 = 2514;
        v36 = 2112;
        v37 = v16;
        v38 = 2048;
        v39 = self;
LABEL_58:
        _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create stream group config", (uint8_t *)&v30, 0x30u);
        goto LABEL_50;
      }
    }
    goto LABEL_50;
  }
  v6 = v5;
  v7 = -[VCAudioStreamReceiveGroupConfig audioStreamGroupConfig](v5, "audioStreamGroupConfig");
  -[VCAudioStreamGroupCommonConfig setAudioSessionID:](v7, "setAudioSessionID:", self->super._transportSessionID);
  -[VCAudioStreamGroupCommonConfig setPreferredIOSampleRate:](v7, "setPreferredIOSampleRate:", -[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:", objc_msgSend(a3, "groupID")));
  -[VCAudioStreamGroupCommonConfig setPreferredIOSamplesPerFrame:](v7, "setPreferredIOSamplesPerFrame:", -[VCSessionParticipant preferredIOSamplesPerFrameForGroupID:](self, "preferredIOSamplesPerFrameForGroupID:", objc_msgSend(a3, "groupID")));
  -[VCAudioStreamGroupCommonConfig setIsGKVoiceChat:](v7, "setIsGKVoiceChat:", self->super._isGKVoiceChat);
  -[VCAudioStreamGroupCommonConfig setProcessID:](v7, "setProcessID:", self->super._processId);
  if (objc_msgSend(a3, "groupID") == 1937339233)
  {
    v8 = v6;
    v9 = 5;
LABEL_9:
    objc_msgSend(v8, "setCaptureSource:", v9);
    goto LABEL_11;
  }
  if (objc_msgSend(a3, "groupID") == 1936290409)
  {
    v8 = v6;
    v9 = 7;
    goto LABEL_9;
  }
  objc_msgSend(v6, "setCaptureSource:", 4);
  -[VCAudioStreamGroupCommonConfig setPowerSpectrumStreamToken:](v7, "setPowerSpectrumStreamToken:", -[VCSessionParticipant participantVideoToken](self, "participantVideoToken"));
  -[VCAudioStreamGroupCommonConfig setCaptionsCoordinator:](v7, "setCaptionsCoordinator:", self->super._captionsCoordinator);
LABEL_11:
  -[VCSessionParticipantRemote setupMediaStreamGroupConfig:withNegotiationConfig:](self, "setupMediaStreamGroupConfig:withNegotiationConfig:", v6, a3);
  v11 = -[VCSessionParticipantRemote setupSpatialInfoForStreamGroupConfig:](self, "setupSpatialInfoForStreamGroupConfig:", v6);
  if (v11 < 0)
  {
    v18 = v11;
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:].cold.2();
      }
      goto LABEL_51;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v30 = 136316418;
        v31 = v28;
        v32 = 2080;
        v33 = "-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]";
        v34 = 1024;
        v35 = 2543;
        v36 = 2112;
        v37 = v19;
        v38 = 2048;
        v39 = self;
        v40 = 1024;
        v41 = v18;
        v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed configure stream group config spatial info. status=%08x";
        v23 = v29;
        v24 = 54;
        goto LABEL_56;
      }
    }
LABEL_51:

    return 0;
  }
LABEL_12:
  v12 = -[VCSessionParticipantRemote newMediaStreamInfoWithNegotiationConfig:streamToken:](self, "newMediaStreamInfoWithNegotiationConfig:streamToken:", a3, objc_msgSend(v6, "streamToken"));
  if (!v12)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:].cold.3();
      }
      goto LABEL_51;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v30 = 136316162;
        v31 = v20;
        v32 = 2080;
        v33 = "-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]";
        v34 = 1024;
        v35 = 2546;
        v36 = 2112;
        v37 = v15;
        v38 = 2048;
        v39 = self;
        v22 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create media stream info";
        v23 = v21;
        v24 = 48;
LABEL_56:
        _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v30, v24);
        goto LABEL_51;
      }
    }
    goto LABEL_51;
  }
  v13 = v12;
  objc_msgSend(v6, "addMediaStreamInfo:", v12);

  return v6;
}

- (id)newMediaStreamWithNegotiationConfig:(id)a3 streamToken:(int64_t)a4
{
  VCAudioStream *v7;
  VCAudioStream *v9;

  if (objc_msgSend(a3, "mediaType") == 1936684398)
  {
    v7 = -[VCAudioStream initWithClientPid:ssrc:transportSessionID:streamToken:]([VCAudioStream alloc], "initWithClientPid:ssrc:transportSessionID:streamToken:", self->super._processId, 0, self->super._transportSessionID, a4);
  }
  else
  {
    if (objc_msgSend(a3, "groupID") == 1667330164)
      return -[VCCaptionsStream initWithTransportSessionID:idsParticipantID:ssrc:streamToken:]([VCCaptionsStream alloc], "initWithTransportSessionID:idsParticipantID:ssrc:streamToken:", self->super._transportSessionID, self->super._idsParticipantID, 0, a4);
    v7 = -[VCVideoStream initWithTransportSessionID:idsParticipantID:ssrc:streamToken:]([VCVideoStream alloc], "initWithTransportSessionID:idsParticipantID:ssrc:streamToken:", self->super._transportSessionID, self->super._idsParticipantID, 0, a4);
  }
  v9 = v7;
  -[VCMediaStream setNetworkFeedbackController:](v7, "setNetworkFeedbackController:", self->super._networkFeedbackController);
  return v9;
}

- (BOOL)addOneToOneStreamConfigToMediaStreamInfo:(id)a3 negotiatorStreamGroupConfig:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  int ErrorLogLevelForModule;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  BOOL v16;
  uint64_t v18;
  id v19;
  id v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  char *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  NSObject *v33;
  char *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v35 = 136315906;
      v36 = v7;
      v37 = 2080;
      v38 = "-[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]";
      v39 = 1024;
      v40 = 2578;
      v41 = 2080;
      v42 = FourccToCStr(objc_msgSend(a4, "groupID"));
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Add one to one stream config to media stream info for groupID=%s", (uint8_t *)&v35, 0x26u);
    }
  }
  if (!-[VCMediaNegotiatorResultsFaceTimeSettings oneToOneModeSupported](-[VCSessionMediaNegotiator negotiatedFaceTimeSettings](self->super._mediaNegotiator, "negotiatedFaceTimeSettings"), "oneToOneModeSupported"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_39;
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    v31 = -[VCMediaNegotiatorResultsFaceTimeSettings oneToOneModeSupported](-[VCSessionMediaNegotiator negotiatedFaceTimeSettings](self->super._mediaNegotiator, "negotiatedFaceTimeSettings"), "oneToOneModeSupported");
    v35 = 136315906;
    v36 = v29;
    v37 = 2080;
    v38 = "-[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]";
    v39 = 1024;
    v40 = 2579;
    v41 = 1024;
    LODWORD(v42) = v31;
    v26 = "VCSessionParticipantRemote [%s] %s:%d No one to one streams to setup oneToOneModeSupported=%d";
    v27 = v30;
    v28 = 34;
    goto LABEL_38;
  }
  if (objc_msgSend(a4, "mediaType") == 1986618469
    || objc_msgSend(a4, "mediaType") == 1835365473)
  {
    v9 = -[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->super._mediaNegotiator, "negotiatedResultsForGroupID:", objc_msgSend(a4, "groupID"));
    if (v9)
    {
      v10 = v9;
      if ((objc_msgSend(v9, "isSupported") & 1) != 0)
      {
        v11 = -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:](self, "newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:", 2, objc_msgSend(a4, "groupID"), objc_msgSend(v10, "remoteSSRC"), 2, v10);
LABEL_10:
        if (objc_msgSend(a4, "groupID") == 1667329381)
          -[VCSessionParticipantRemote updateStreamConfigWithMLEnhance:](self, "updateStreamConfigWithMLEnhance:", v11);
        ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
        if (v11)
        {
          if (ErrorLogLevelForModule >= 7)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v15 = FourccToCStr(objc_msgSend(a4, "groupID"));
              v35 = 136315906;
              v36 = v13;
              v37 = 2080;
              v38 = "-[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]";
              v39 = 1024;
              v40 = 2606;
              v41 = 2080;
              v42 = v15;
              _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Added one to one stream config to %s streamGroup", (uint8_t *)&v35, 0x26u);
            }
          }
          objc_msgSend(a3, "addStreamConfig:", v11);
          goto LABEL_17;
        }
        if (ErrorLogLevelForModule >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:].cold.1();
        }
LABEL_21:
        v11 = 0;
        v16 = 0;
        goto LABEL_22;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v34 = FourccToCStr(objc_msgSend(a4, "groupID"));
        v35 = 136315906;
        v36 = v32;
        v37 = 2080;
        v38 = "-[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]";
        v39 = 1024;
        v40 = 2583;
        v41 = 2080;
        v42 = v34;
        v26 = "VCSessionParticipantRemote [%s] %s:%d One to one video streams not supported for groupID=%s";
        v27 = v33;
        goto LABEL_37;
      }
    }
  }
  else
  {
    if (objc_msgSend(a4, "mediaType") != 1936684398)
    {
      v11 = 0;
      goto LABEL_10;
    }
    v18 = objc_msgSend(a4, "groupID");
    v19 = -[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->super._mediaNegotiator, "negotiatedResultsForGroupID:", v18);
    if (v19)
    {
      v20 = -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:](self, "newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:", v19, 2, objc_msgSend(a4, "groupID"), objc_msgSend(v19, "remoteSSRC"));
      v11 = v20;
      if ((_DWORD)v18 == 1835623282)
        objc_msgSend(v20, "setOutOfProcessCodecsEnabled:", self->_outOfProcessCodecsEnabled);
      objc_msgSend(v11, "setIsEnhancedJBAdaptationsEnabled:", self->_isEnhancedJBAdaptationsEnabled);
      goto LABEL_10;
    }
    v16 = (_DWORD)v18 == 1937339233;
    if ((_DWORD)v18 == 1937339233)
      v21 = 7;
    else
      v21 = 3;
    if (v21 > (int)VRTraceGetErrorLogLevelForModule())
    {
      v11 = 0;
      goto LABEL_22;
    }
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    v24 = *MEMORY[0x1E0CF2758];
    if ((_DWORD)v18 != 1937339233)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:].cold.2();
      goto LABEL_21;
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = FourccToCStr(1937339233);
      v35 = 136315906;
      v36 = v22;
      v37 = 2080;
      v38 = "-[VCSessionParticipantRemote addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:]";
      v39 = 1024;
      v40 = 2592;
      v41 = 2080;
      v42 = v25;
      v26 = "VCSessionParticipantRemote [%s] %s:%d One to one audio streams not supported for groupID=%s";
      v27 = v23;
LABEL_37:
      v28 = 38;
LABEL_38:
      _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v35, v28);
    }
  }
LABEL_39:
  v11 = 0;
LABEL_17:
  v16 = 1;
LABEL_22:

  return v16;
}

- (BOOL)setupStreamGroupWithConfig:(id)a3
{
  int v5;
  id v6;
  void *v7;
  VCAudioStreamReceiveGroup *v8;
  VCAudioStreamReceiveGroup *v9;
  const __CFString *v10;
  uint64_t v11;
  BOOL v12;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
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
  VCSessionParticipantRemote *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!-[VCSessionParticipantRemote shouldSetupStreamGroupWithID:](self, "shouldSetupStreamGroupWithID:", objc_msgSend(a3, "groupID")))
  {
    v9 = 0;
    v7 = 0;
    goto LABEL_15;
  }
  v5 = objc_msgSend(a3, "mediaType");
  v6 = -[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:](self, "newStreamGroupConfigWithNegotiationConfig:", a3);
  if (!v6)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote setupStreamGroupWithConfig:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v26 = 136316162;
          v27 = v17;
          v28 = 2080;
          v29 = "-[VCSessionParticipantRemote setupStreamGroupWithConfig:]";
          v30 = 1024;
          v31 = 2629;
          v32 = 2112;
          v33 = v14;
          v34 = 2048;
          v35 = self;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create stream group config", (uint8_t *)&v26, 0x30u);
        }
      }
    }
    v9 = 0;
    v7 = 0;
    goto LABEL_66;
  }
  v7 = v6;
  if (v5 != 1936684398)
  {
    if (objc_msgSend(v6, "streamGroupID") == 1667330164)
    {
      v9 = -[VCSessionParticipantRemote newCaptionsStreamGroupWithStreamGroupConfig:](self, "newCaptionsStreamGroupWithStreamGroupConfig:", v7);
      if (v9)
        goto LABEL_14;
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipantRemote setupStreamGroupWithConfig:].cold.4();
        }
        goto LABEL_65;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v26 = 136316162;
          v27 = v24;
          v28 = 2080;
          v29 = "-[VCSessionParticipantRemote setupStreamGroupWithConfig:]";
          v30 = 1024;
          v31 = 2646;
          v32 = 2112;
          v33 = v10;
          v34 = 2048;
          v35 = self;
          goto LABEL_68;
        }
      }
    }
    else
    {
      v9 = -[VCSessionParticipantRemote newVideoStreamGroupWithStreamGroupConfig:](self, "newVideoStreamGroupWithStreamGroupConfig:", v7);
      if (v9)
        goto LABEL_14;
      if ((VCSessionParticipantRemote *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipantRemote setupStreamGroupWithConfig:].cold.5();
        }
        goto LABEL_65;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v21 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v21 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v26 = 136316162;
          v27 = v25;
          v28 = 2080;
          v29 = "-[VCSessionParticipantRemote setupStreamGroupWithConfig:]";
          v30 = 1024;
          v31 = 2650;
          v32 = 2112;
          v33 = v21;
          v34 = 2048;
          v35 = self;
          goto LABEL_68;
        }
      }
    }
LABEL_65:
    v9 = 0;
LABEL_66:
    v12 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v6, "setJbTargetEstimatorSynchronizer:", -[NSMutableDictionary objectForKeyedSubscript:](self->_jbSynchronizerPerSyncGroupID, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v6, "streamGroupID"))));
  objc_msgSend(v7, "setNetworkFeedbackController:", self->super._networkFeedbackController);
  v8 = -[VCAudioStreamReceiveGroup initWithConfig:]([VCAudioStreamReceiveGroup alloc], "initWithConfig:", v7);
  if (!v8)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote setupStreamGroupWithConfig:].cold.2();
      }
      goto LABEL_65;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v26 = 136316162;
        v27 = v22;
        v28 = 2080;
        v29 = "-[VCSessionParticipantRemote setupStreamGroupWithConfig:]";
        v30 = 1024;
        v31 = 2637;
        v32 = 2112;
        v33 = v16;
        v34 = 2048;
        v35 = self;
LABEL_68:
        _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create receive media group", (uint8_t *)&v26, 0x30u);
        goto LABEL_65;
      }
    }
    goto LABEL_65;
  }
  v9 = v8;
  if (objc_msgSend(a3, "groupID") == 1835623282
    || objc_msgSend(a3, "groupID") == 1835623287)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._participantStreamTokens, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStreamGroup streamToken](v9, "streamToken")), &unk_1E9EF4EE0);
    -[NSMutableArray addObject:](self->super._micStreamGroups, "addObject:", v9);
  }
LABEL_14:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._streamGroups, "setObject:forKeyedSubscript:", v9, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStreamGroup streamToken](v9, "streamToken")));
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStreamGroup streamToken](v9, "streamToken"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._participantStreamTokens, "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCMediaStreamGroup streamGroupID](v9, "streamGroupID")));
  if (!-[VCSessionParticipantRemote setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:](self, "setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "mediaStreamInfoArray"), "firstObject"), "streamConfigs"), -[VCMediaStreamGroup streamGroupID](v9, "streamGroupID"), +[VCSessionBandwidthAllocationTableEntry entryTypeForMediaType:](VCSessionBandwidthAllocationTableEntry, "entryTypeForMediaType:", -[VCMediaStreamGroup mediaType](v9, "mediaType"))))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote setupStreamGroupWithConfig:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v26 = 136316162;
          v27 = v19;
          v28 = 2080;
          v29 = "-[VCSessionParticipantRemote setupStreamGroupWithConfig:]";
          v30 = 1024;
          v31 = 2660;
          v32 = 2112;
          v33 = v15;
          v34 = 2048;
          v35 = self;
          _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup bandwidth allocation table for video!", (uint8_t *)&v26, 0x30u);
        }
      }
    }
    goto LABEL_66;
  }
LABEL_15:
  v12 = 1;
LABEL_16:

  return v12;
}

- (id)newVideoStreamGroupWithStreamGroupConfig:(id)a3
{
  VCVideoStreamReceiveGroup *v5;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  VCSessionParticipantRemote *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setJbTargetEstimatorSynchronizer:", -[NSMutableDictionary objectForKeyedSubscript:](self->_jbSynchronizerPerSyncGroupID, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "syncGroupID"))));
  objc_msgSend(a3, "setNetworkFeedbackController:", self->super._networkFeedbackController);
  v5 = -[VCVideoStreamReceiveGroup initWithConfig:]([VCVideoStreamReceiveGroup alloc], "initWithConfig:", a3);
  if (v5)
  {
    -[NSMutableArray addObject:](self->super._videoStreamGroups, "addObject:", v5);
  }
  else if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantRemote newVideoStreamGroupWithStreamGroupConfig:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v10 = 136316162;
        v11 = v8;
        v12 = 2080;
        v13 = "-[VCSessionParticipantRemote newVideoStreamGroupWithStreamGroupConfig:]";
        v14 = 1024;
        v15 = 2673;
        v16 = 2112;
        v17 = v7;
        v18 = 2048;
        v19 = self;
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create video receive stream group", (uint8_t *)&v10, 0x30u);
      }
    }
  }
  return v5;
}

- (id)newCaptionsStreamGroupWithStreamGroupConfig:(id)a3
{
  VCCaptionsStreamReceiveGroup *v5;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  VCSessionParticipantRemote *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setJbTargetEstimatorSynchronizer:", -[NSMutableDictionary objectForKeyedSubscript:](self->_jbSynchronizerPerSyncGroupID, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "syncGroupID"))));
  v5 = -[VCVideoStreamReceiveGroup initWithConfig:]([VCCaptionsStreamReceiveGroup alloc], "initWithConfig:", a3);
  if (!v5)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote newCaptionsStreamGroupWithStreamGroupConfig:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v10 = 136316162;
          v11 = v8;
          v12 = 2080;
          v13 = "-[VCSessionParticipantRemote newCaptionsStreamGroupWithStreamGroupConfig:]";
          v14 = 1024;
          v15 = 2683;
          v16 = 2112;
          v17 = v7;
          v18 = 2048;
          v19 = self;
          _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create captions receive stream group", (uint8_t *)&v10, 0x30u);
        }
      }
    }
  }
  return v5;
}

- (BOOL)shouldEnablePacketRetransmissionForStreamGroupID:(unsigned int)a3
{
  BOOL result;
  int v4;

  result = 1;
  if ((int)a3 > 1717854579)
  {
    if (a3 != 1717854580 && a3 != 1718909044)
    {
      v4 = 1935897189;
LABEL_8:
      if (a3 != v4)
        return 0;
    }
  }
  else if (a3 != 1650745716 && a3 != 1667329381)
  {
    v4 = 1667329399;
    goto LABEL_8;
  }
  return result;
}

- (BOOL)shouldSetupStreamGroupWithID:(unsigned int)a3
{
  _BOOL4 BoolValueForKey;
  _BOOL4 v6;
  VCSessionParticipantRemote *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  BOOL result;
  char v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("simulateWebRTCOnlyClient"), 0);
  v6 = BoolValueForKey;
  if ((int)a3 > 1718909043)
  {
    if ((int)a3 > 1935897188)
    {
      if (a3 == 1935897189 || a3 == 1937339233)
      {
        v14 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 6 || v6;
        if ((v14 & 1) == 0)
          return 1;
        goto LABEL_13;
      }
      goto LABEL_25;
    }
    if (a3 != 1718909044)
    {
      if (a3 == 1835623287)
      {
        v7 = self;
        v8 = 1835623282;
        goto LABEL_28;
      }
      goto LABEL_25;
    }
LABEL_9:
    v9 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8 || v6;
    if ((v9 & 1) == 0)
      return 1;
    goto LABEL_13;
  }
  switch(a3)
  {
    case 0x62646174u:
      goto LABEL_9;
    case 0x63616D77u:
      v7 = self;
      v8 = 1667329381;
LABEL_28:
      if (!-[VCSessionParticipant didNegotiateStreamGroupWithID:](v7, "didNegotiateStreamGroupWithID:", v8) || v6)
        return 1;
LABEL_13:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        result = 0;
        if (!v12)
          return result;
        v15 = 136315906;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VCSessionParticipantRemote shouldSetupStreamGroupWithID:]";
        v19 = 1024;
        v20 = 2725;
        v21 = 2080;
        v22 = FourccToCStr(a3);
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Skipping streamGroupID=%s", (uint8_t *)&v15, 0x26u);
      }
      return 0;
    case 0x66646174u:
      goto LABEL_9;
  }
LABEL_25:
  if (BoolValueForKey)
    goto LABEL_13;
  return 1;
}

- (void)createJitterBufferTargetEstimatorSynchronizer:(tagVCJBTargetEstimatorSynchronizer *)a3 syncGroupID:(unsigned int)a4
{
  const char *CStringPtr;
  const char *v8;
  char *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCSessionParticipantRemote *v22;
  __int16 v23;
  VCSessionParticipantRemote *v24;
  _BYTE v25[196];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  memset(&v25[4], 0, 192);
  *(_DWORD *)v25 = 1;
  CStringPtr = CFStringGetCStringPtr((CFStringRef)self->super._sessionUUID, 0x8000100u);
  v8 = CFStringGetCStringPtr((CFStringRef)self->super._uuid, 0x8000100u);
  v9 = FourccToCStr(a4);
  snprintf(&v25[4], 0xC8uLL, "session_%s-participant_%s-groupid_%s", CStringPtr, v8, v9);
  if ((VCJBTargetEstimatorSynchronizer_Create(*MEMORY[0x1E0C9AE00], (uint64_t *)a3, v25) & 0x80000000) != 0)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantRemote createJitterBufferTargetEstimatorSynchronizer:syncGroupID:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v14 = v11;
          v15 = 2080;
          v16 = "-[VCSessionParticipantRemote createJitterBufferTargetEstimatorSynchronizer:syncGroupID:]";
          v17 = 1024;
          v18 = 2738;
          v19 = 2112;
          v20 = v10;
          v21 = 2048;
          v22 = self;
          v23 = 2048;
          v24 = self;
          _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to create Jitter Buffer Target Synchronizer remoteParticipant=%p", buf, 0x3Au);
        }
      }
    }
  }
}

- (void)setupJBTargetSynchronizers
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  NSArray *obj;
  CFTypeRef cf;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  CFTypeRef v35;
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
  obj = -[VCSessionMediaNegotiator negotiatedStreamGroups](self->super._mediaNegotiator, "negotiatedStreamGroups");
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v38;
    *(_QWORD *)&v4 = 136316162;
    v19 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((objc_msgSend(v8, "groupID", v19) == 1935897189 || self->_isVideoJitterForPlayoutEnabled)
          && !-[NSMutableDictionary objectForKey:](self->_jbSynchronizerPerSyncGroupID, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v8, "syncGroupID"))))
        {
          cf = 0;
          -[VCSessionParticipantRemote createJitterBufferTargetEstimatorSynchronizer:syncGroupID:](self, "createJitterBufferTargetEstimatorSynchronizer:syncGroupID:", &cf, objc_msgSend(v8, "syncGroupID"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_jbSynchronizerPerSyncGroupID, "setObject:forKeyedSubscript:", cf, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v8, "syncGroupID")));
          if ((VCSessionParticipantRemote *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v16 = VRTraceErrorLogLevelToCSTR();
              v17 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v8, "syncGroupID"));
                *(_DWORD *)buf = v19;
                v23 = v16;
                v24 = 2080;
                v25 = "-[VCSessionParticipantRemote setupJBTargetSynchronizers]";
                v26 = 1024;
                v27 = 2750;
                v28 = 2112;
                v29 = v18;
                v30 = 2048;
                v31 = (void *)cf;
                v13 = v17;
                v14 = "VCSessionParticipantRemote [%s] %s:%d New Target Synchronizer syncGroupID=%@ jbTargetEstimatorSynchronizer=%p";
                v15 = 48;
LABEL_18:
                _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
              }
            }
          }
          else
          {
            v9 = &stru_1E9E58EE0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v9 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v10 = VRTraceErrorLogLevelToCSTR();
              v11 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v8, "syncGroupID"));
                *(_DWORD *)buf = 136316674;
                v23 = v10;
                v24 = 2080;
                v25 = "-[VCSessionParticipantRemote setupJBTargetSynchronizers]";
                v26 = 1024;
                v27 = 2750;
                v28 = 2112;
                v29 = (uint64_t)v9;
                v30 = 2048;
                v31 = self;
                v32 = 2112;
                v33 = v12;
                v34 = 2048;
                v35 = cf;
                v13 = v11;
                v14 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) New Target Synchronizer syncGroupID=%@ jbTargetEstima"
                      "torSynchronizer=%p";
                v15 = 68;
                goto LABEL_18;
              }
            }
          }
          if (cf)
            CFRelease(cf);
          continue;
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
    }
    while (v5);
  }
}

- (BOOL)setupStreamGroups
{
  NSArray *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  char *v19;
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
  VCSessionParticipantRemote *v31;
  __int16 v32;
  char *v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](-[VCSessionMediaNegotiator negotiatedStreamGroups](self->super._mediaNegotiator, "negotiatedStreamGroups"), "count"))
  {
    -[VCSessionParticipantRemote setupJBTargetSynchronizers](self, "setupJBTargetSynchronizers");
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v3 = -[VCSessionMediaNegotiator negotiatedStreamGroups](self->super._mediaNegotiator, "negotiatedStreamGroups");
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v36;
      *(_QWORD *)&v5 = 136315650;
      v21 = v5;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v36 != v7)
            objc_enumerationMutation(v3);
          v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v8);
          if (objc_msgSend(v9, "groupID", v21) == 1936290409
            && !+[VCHardwareSettings isSiriVoicePlayoutSupported](VCHardwareSettings, "isSiriVoicePlayoutSupported"))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              v10 = VRTraceErrorLogLevelToCSTR();
              v11 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v21;
                v23 = v10;
                v24 = 2080;
                v25 = "-[VCSessionParticipantRemote setupStreamGroups]";
                v26 = 1024;
                v27 = 2769;
                _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d Siri config was negotiated, but device does not support playout", buf, 0x1Cu);
              }
            }
          }
          else if (!-[VCSessionParticipantRemote setupStreamGroupWithConfig:](self, "setupStreamGroupWithConfig:", v9))
          {
            if ((VCSessionParticipantRemote *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
                if (!v13)
                  return v13;
                -[VCSessionParticipantRemote setupStreamGroups].cold.1();
              }
            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v16 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
              else
                v16 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                v17 = VRTraceErrorLogLevelToCSTR();
                v18 = *MEMORY[0x1E0CF2758];
                v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
                if (!v13)
                  return v13;
                v19 = FourccToCStr(objc_msgSend(v9, "groupID"));
                *(_DWORD *)buf = 136316418;
                v23 = v17;
                v24 = 2080;
                v25 = "-[VCSessionParticipantRemote setupStreamGroups]";
                v26 = 1024;
                v27 = 2773;
                v28 = 2112;
                v29 = v16;
                v30 = 2048;
                v31 = self;
                v32 = 2080;
                v33 = v19;
                _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d %@(%p) Failed to setup stream group=%s", buf, 0x3Au);
              }
            }
            LOBYTE(v13) = 0;
            return v13;
          }
          ++v8;
        }
        while (v6 != v8);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
        v6 = v12;
        if (v12)
          continue;
        break;
      }
    }
    LOBYTE(v13) = -[VCSessionParticipant setupStreamGroupMediaSync](self, "setupStreamGroupMediaSync");
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v23 = v14;
        v24 = 2080;
        v25 = "-[VCSessionParticipantRemote setupStreamGroups]";
        v26 = 1024;
        v27 = 2761;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d There are no negotiated stream groups", buf, 0x1Cu);
      }
    }
    LOBYTE(v13) = 1;
  }
  return v13;
}

- (void)updateShouldEnableFaceZoom
{
  const __CFString *v3;
  VCSessionParticipantRemote *v4;
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
  VCSessionParticipantRemote *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[VCDefaults forceDisableFaceZoom](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableFaceZoom"))
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
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
          v16 = "-[VCSessionParticipantRemote updateShouldEnableFaceZoom]";
          v17 = 1024;
          v18 = 2783;
          v8 = "VCSessionParticipantRemote [%s] %s:%d FaceZoom is disabled.";
          v9 = v7;
          v10 = 28;
LABEL_17:
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
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
          v16 = "-[VCSessionParticipantRemote updateShouldEnableFaceZoom]";
          v17 = 1024;
          v18 = 2783;
          v19 = 2112;
          v20 = v3;
          v21 = 2048;
          v22 = self;
          v8 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) FaceZoom is disabled.";
          v9 = v12;
          v10 = 48;
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
    if (self->_videoQuality || !-[VCSessionParticipantRemote isVisible](self, "isVisible"))
    {
      v4 = self;
      v5 = 0;
    }
    else
    {
      v4 = self;
      v5 = 1;
    }
    -[VCSessionParticipantRemote setShouldEnableFaceZoom:](v4, "setShouldEnableFaceZoom:", v5);
  }
}

- (void)setShouldEnableFaceZoom:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
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

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_msgSend(-[VCSessionParticipantRemote videoGroup](self, "videoGroup"), "mediaStreamInfoArray");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
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
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "stream"), "setShouldEnableFaceZoom:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (void)setSharingEnabled:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VCSessionParticipantRemote_setSharingEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __48__VCSessionParticipantRemote_setSharingEnabled___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 409) = *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "updateShouldEnableMLEnhance");
}

- (void)updateStreamConfigWithMLEnhance:(id)a3
{
  _BOOL8 v5;

  if (objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne"))
  {
    v5 = -[VCSessionParticipantRemote shouldEnableMLEnhanceOneToOne](self, "shouldEnableMLEnhanceOneToOne");
LABEL_10:
    objc_msgSend(a3, "setShouldEnableMLEnhance:", v5);
    return;
  }
  if (!objc_msgSend(a3, "videoResolution"))
  {
    v5 = -[VCSessionParticipantRemote shouldEnableMLEnhanceLowTier](self, "shouldEnableMLEnhanceLowTier");
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "videoResolution") == 16)
  {
    v5 = -[VCSessionParticipantRemote shouldEnableMLEnhanceHighTier](self, "shouldEnableMLEnhanceHighTier");
    goto LABEL_10;
  }
  if (objc_msgSend(a3, "videoResolution") == 8 || objc_msgSend(a3, "videoResolution") == 11)
  {
    v5 = -[VCSessionParticipantRemote shouldEnableMLEnhanceMiddleTier](self, "shouldEnableMLEnhanceMiddleTier");
    goto LABEL_10;
  }
}

- (void)updateShouldEnableMLEnhance
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
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
  VCSessionParticipantRemote *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("forceDisableMLEnhance"), 0))
  {
    -[VCSessionParticipantRemote updateShouldEnableMLEnhanceLowTierMultiway](self, "updateShouldEnableMLEnhanceLowTierMultiway");
    -[VCSessionParticipantRemote updateShouldEnableMLEnhanceMiddleTierMultiway](self, "updateShouldEnableMLEnhanceMiddleTierMultiway");
    -[VCSessionParticipantRemote updateShouldEnableMLEnhanceHighTierMultiway](self, "updateShouldEnableMLEnhanceHighTierMultiway");
    -[VCSessionParticipantRemote updateShouldEnableMLEnhanceOneToOne](self, "updateShouldEnableMLEnhanceOneToOne");
    return;
  }
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v4;
        v13 = 2080;
        v14 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhance]";
        v15 = 1024;
        v16 = 2820;
        v6 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance is disabled by default.";
        v7 = v5;
        v8 = 28;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136316162;
        v12 = v9;
        v13 = 2080;
        v14 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhance]";
        v15 = 1024;
        v16 = 2820;
        v17 = 2112;
        v18 = v3;
        v19 = 2048;
        v20 = self;
        v6 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance is disabled by default.";
        v7 = v10;
        v8 = 48;
        goto LABEL_13;
      }
    }
  }
}

- (BOOL)shouldEnableMLEnhanceLowTier
{
  unsigned int thermalLevel;
  BOOL v4;
  int v5;
  int v6;
  BOOL v7;
  char v8;
  char v9;

  thermalLevel = self->_thermalLevel;
  v4 = self->super._sharingEnabled
    && +[VCHardwareSettings disableMLScalarDuringSharing](VCHardwareSettings, "disableMLScalarDuringSharing");
  v5 = -[VCSessionParticipant presentationState](self, "presentationState");
  if ((unint64_t)(+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") - 1) > 1)
    LOBYTE(v6) = 0;
  else
    v6 = !-[VCPositionalInfo isInCanvas](self->_positionalInfo, "isInCanvas");
  v7 = v5 == 1;
  v8 = +[VCHardwareSettings isDeviceLargeScreen](VCHardwareSettings, "isDeviceLargeScreen");
  v9 = thermalLevel > 0x14 || v4;
  return (v9 | v6 | v7 & ~v8) ^ 1;
}

- (BOOL)shouldEnableMLEnhanceOneToOne
{
  return !-[VCSessionParticipantRemote shouldDisableMLEnhanceCommonFactors](self, "shouldDisableMLEnhanceCommonFactors");
}

- (BOOL)shouldDisableMLEnhanceCommonFactors
{
  unsigned int thermalLevel;
  BOOL v4;
  int v5;

  thermalLevel = self->_thermalLevel;
  v4 = self->super._sharingEnabled
    && +[VCHardwareSettings disableMLScalarDuringSharing](VCHardwareSettings, "disableMLScalarDuringSharing");
  v5 = -[VCSessionParticipant presentationState](self, "presentationState");
  if (thermalLevel > 0x14)
    return 1;
  if (v5 == 1)
    return 1;
  return v4;
}

- (BOOL)shouldEnableMLEnhanceHighTier
{
  _BOOL4 v3;
  int64_t v4;
  int v5;
  BOOL v6;
  int64_t v7;
  _BOOL4 v8;
  _BOOL4 v10;
  unsigned int prominenceIndex;
  unsigned int v12;

  v3 = -[VCSessionParticipantRemote shouldDisableMLEnhanceCommonFactors](self, "shouldDisableMLEnhanceCommonFactors");
  v4 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
  if (v4 == 4)
  {
    v5 = 0;
    v6 = -[VCSessionParticipant presentationState](self, "presentationState") == 3;
  }
  else
  {
    v7 = v4;
    v8 = +[VCHardwareSettings isAppleSilicon](VCHardwareSettings, "isAppleSilicon");
    v10 = v7 != 3 && v7 != 0;
    v5 = !v8 || v10;
    v6 = 0;
  }
  prominenceIndex = self->_prominenceIndex;
  v12 = +[VCHardwareSettings maxHighTierMLEnhanceParticipants](VCHardwareSettings, "maxHighTierMLEnhanceParticipants");
  return ((v3 | v5) & 1) == 0
      && !v6
      && prominenceIndex < v12
      && VCDefaults_GetBoolValueForKey(CFSTR("mlEnhanceForHighQualityTierEnabled"), 1);
}

- (BOOL)shouldEnableMLEnhanceMiddleTier
{
  _BOOL4 v3;
  int64_t v4;
  BOOL v5;
  _BOOL4 v6;
  unint64_t v7;
  _BOOL4 v8;
  BOOL v9;
  unsigned int prominenceIndex;
  unsigned int v11;
  BOOL result;

  v3 = -[VCSessionParticipantRemote shouldDisableMLEnhanceCommonFactors](self, "shouldDisableMLEnhanceCommonFactors");
  v4 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
  if (v4 == 4)
  {
    v5 = 0;
    v6 = -[VCSessionParticipant presentationState](self, "presentationState") == 3;
  }
  else
  {
    v7 = v4;
    v8 = +[VCHardwareSettings isAppleSilicon](VCHardwareSettings, "isAppleSilicon");
    v9 = v7 >= 4 || (v7 & 0xF) == 2;
    if (v8)
      v5 = v9;
    else
      v5 = v7 != 1;
    v6 = 0;
  }
  prominenceIndex = self->_prominenceIndex;
  v11 = +[VCHardwareSettings maxHighTierMLEnhanceParticipants](VCHardwareSettings, "maxHighTierMLEnhanceParticipants");
  result = 0;
  if (!v3 && !v6 && !v5 && prominenceIndex < v11)
    return !self->_shouldDisableMiddleTierMLEnhance;
  return result;
}

- (void)updateShouldEnableMLEnhanceLowTierMultiway
{
  _BOOL8 v3;
  id v4;
  _BOOL4 v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BYTE v21[20];
  _BOOL4 v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = -[VCSessionParticipantRemote shouldEnableMLEnhanceLowTier](self, "shouldEnableMLEnhanceLowTier");
  v4 = -[VCSessionParticipantRemote videoGroup](self, "videoGroup");
  v5 = -[VCSessionParticipantRemote setShouldEnableMLEnhance:streamWithVideoResolution:videoStreamGroup:](self, "setShouldEnableMLEnhance:streamWithVideoResolution:videoStreamGroup:", v3, 0, v4);
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316418;
        v15 = v7;
        v16 = 2080;
        v17 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceLowTierMultiway]";
        v18 = 1024;
        v19 = 2914;
        v20 = 1024;
        *(_DWORD *)v21 = v3;
        *(_WORD *)&v21[4] = 2048;
        *(_QWORD *)&v21[6] = objc_msgSend(v4, "streamToken");
        *(_WORD *)&v21[14] = 1024;
        *(_DWORD *)&v21[16] = v5;
        v9 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance for low tier (96x96) shouldEnableMLEnhance=%d streamToken="
             "%ld update didSucceed=%d";
        v10 = v8;
        v11 = 50;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316930;
        v15 = v12;
        v16 = 2080;
        v17 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceLowTierMultiway]";
        v18 = 1024;
        v19 = 2914;
        v20 = 2112;
        *(_QWORD *)v21 = v6;
        *(_WORD *)&v21[8] = 2048;
        *(_QWORD *)&v21[10] = self;
        *(_WORD *)&v21[18] = 1024;
        v22 = v3;
        v23 = 2048;
        v24 = objc_msgSend(v4, "streamToken");
        v25 = 1024;
        v26 = v5;
        v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance for low tier (96x96) shouldEnableMLEnhance=%d strea"
             "mToken=%ld update didSucceed=%d";
        v10 = v13;
        v11 = 70;
        goto LABEL_11;
      }
    }
  }
}

- (void)updateShouldEnableMLEnhanceMiddleTierMultiway
{
  _BOOL8 v3;
  id v4;
  _BOOL4 v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  _BYTE v25[24];
  _BYTE v26[32];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = -[VCSessionParticipantRemote shouldEnableMLEnhanceMiddleTier](self, "shouldEnableMLEnhanceMiddleTier");
  v4 = -[VCSessionParticipantRemote videoGroup](self, "videoGroup");
  v5 = -[VCSessionParticipantRemote setShouldEnableMLEnhance:streamWithVideoResolution:videoStreamGroup:](self, "setShouldEnableMLEnhance:streamWithVideoResolution:videoStreamGroup:", v3, 8, v4);
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v25 = 136316418;
        *(_QWORD *)&v25[4] = v7;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceMiddleTierMultiway]";
        *(_WORD *)&v25[22] = 1024;
        *(_DWORD *)v26 = 2923;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = v3;
        *(_WORD *)&v26[10] = 2048;
        *(_QWORD *)&v26[12] = objc_msgSend(v4, "streamToken");
        *(_WORD *)&v26[20] = 1024;
        *(_DWORD *)&v26[22] = v5;
        v9 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance for Middle tier (320x320) shouldEnableMLEnhance=%d streamT"
             "oken=%ld update didSucceed=%d";
        v10 = v8;
        v11 = 50;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v25, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v25 = 136316930;
        *(_QWORD *)&v25[4] = v12;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceMiddleTierMultiway]";
        *(_WORD *)&v25[22] = 1024;
        *(_DWORD *)v26 = 2923;
        *(_WORD *)&v26[4] = 2112;
        *(_QWORD *)&v26[6] = v6;
        *(_WORD *)&v26[14] = 2048;
        *(_QWORD *)&v26[16] = self;
        *(_WORD *)&v26[24] = 1024;
        *(_DWORD *)&v26[26] = v3;
        *(_WORD *)&v26[30] = 2048;
        v27 = objc_msgSend(v4, "streamToken");
        LOWORD(v28) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = v5;
        v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance for Middle tier (320x320) shouldEnableMLEnhance=%d "
             "streamToken=%ld update didSucceed=%d";
        v10 = v13;
        v11 = 70;
        goto LABEL_11;
      }
    }
  }
  v14 = -[VCSessionParticipantRemote setShouldEnableMLEnhance:streamWithVideoResolution:videoStreamGroup:](self, "setShouldEnableMLEnhance:streamWithVideoResolution:videoStreamGroup:", v3, 11, v4, *(_OWORD *)v25, *(_QWORD *)&v25[16], *(_OWORD *)v26, *(_OWORD *)&v26[16], v27, v28);
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v4, "streamToken");
        *(_DWORD *)v25 = 136316418;
        *(_QWORD *)&v25[4] = v16;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceMiddleTierMultiway]";
        *(_WORD *)&v25[22] = 1024;
        *(_DWORD *)v26 = 2927;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = v3;
        *(_WORD *)&v26[10] = 2048;
        *(_QWORD *)&v26[12] = v18;
        *(_WORD *)&v26[20] = 1024;
        *(_DWORD *)&v26[22] = v14;
        v19 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance for Middle tier (480x480) shouldEnableMLEnhance=%d stream"
              "Token=%ld update didSucceed=%d";
        v20 = v17;
        v21 = 50;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, v25, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(v4, "streamToken");
        *(_DWORD *)v25 = 136316930;
        *(_QWORD *)&v25[4] = v22;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceMiddleTierMultiway]";
        *(_WORD *)&v25[22] = 1024;
        *(_DWORD *)v26 = 2927;
        *(_WORD *)&v26[4] = 2112;
        *(_QWORD *)&v26[6] = v15;
        *(_WORD *)&v26[14] = 2048;
        *(_QWORD *)&v26[16] = self;
        *(_WORD *)&v26[24] = 1024;
        *(_DWORD *)&v26[26] = v3;
        *(_WORD *)&v26[30] = 2048;
        v27 = v24;
        LOWORD(v28) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = v14;
        v19 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance for Middle tier (480x480) shouldEnableMLEnhance=%d"
              " streamToken=%ld update didSucceed=%d";
        v20 = v23;
        v21 = 70;
        goto LABEL_22;
      }
    }
  }
}

- (void)updateShouldEnableMLEnhanceHighTierMultiway
{
  _BOOL8 v3;
  id v4;
  _BOOL4 v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BYTE v21[20];
  _BOOL4 v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = -[VCSessionParticipantRemote shouldEnableMLEnhanceHighTier](self, "shouldEnableMLEnhanceHighTier");
  v4 = -[VCSessionParticipantRemote videoGroup](self, "videoGroup");
  v5 = -[VCSessionParticipantRemote setShouldEnableMLEnhance:streamWithVideoResolution:videoStreamGroup:](self, "setShouldEnableMLEnhance:streamWithVideoResolution:videoStreamGroup:", v3, 16, v4);
  if ((VCSessionParticipantRemote *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316418;
        v15 = v7;
        v16 = 2080;
        v17 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceHighTierMultiway]";
        v18 = 1024;
        v19 = 2936;
        v20 = 1024;
        *(_DWORD *)v21 = v3;
        *(_WORD *)&v21[4] = 2048;
        *(_QWORD *)&v21[6] = objc_msgSend(v4, "streamToken");
        *(_WORD *)&v21[14] = 1024;
        *(_DWORD *)&v21[16] = v5;
        v9 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance for high tier (720x720) shouldEnableMLEnhance=%d streamTok"
             "en=%ld update didSucceed=%d";
        v10 = v8;
        v11 = 50;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316930;
        v15 = v12;
        v16 = 2080;
        v17 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceHighTierMultiway]";
        v18 = 1024;
        v19 = 2936;
        v20 = 2112;
        *(_QWORD *)v21 = v6;
        *(_WORD *)&v21[8] = 2048;
        *(_QWORD *)&v21[10] = self;
        *(_WORD *)&v21[18] = 1024;
        v22 = v3;
        v23 = 2048;
        v24 = objc_msgSend(v4, "streamToken");
        v25 = 1024;
        v26 = v5;
        v9 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance for high tier (720x720) shouldEnableMLEnhance=%d st"
             "reamToken=%ld update didSucceed=%d";
        v10 = v13;
        v11 = 70;
        goto LABEL_11;
      }
    }
  }
}

- (BOOL)setShouldEnableMLEnhance:(BOOL)a3 streamWithVideoResolution:(int64_t)a4 videoStreamGroup:(id)a5
{
  _BOOL4 v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  BOOL v21;
  uint64_t v23;
  id v24;
  _BOOL4 v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v7 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  -[VCSessionParticipantRemote reportingResolutionForResolution:](self, "reportingResolutionForResolution:", a4);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = (void *)objc_msgSend(a5, "mediaStreamInfoArray");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v10)
  {
    v11 = v10;
    v24 = a5;
    v25 = v7;
    v12 = *(_QWORD *)v33;
    v23 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v15 = (void *)objc_msgSend(v14, "streamConfigs");
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v28;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v28 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              if (objc_msgSend(v20, "videoResolution") == a4)
              {
                objc_msgSend(v24, "setShouldEnableMLEnhance:streamID:", v25, objc_msgSend((id)objc_msgSend(v20, "multiwayConfig"), "idsStreamID"));
                v21 = 1;
                goto LABEL_19;
              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
            if (v17)
              continue;
            break;
          }
        }
        v12 = v23;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
      v21 = 0;
    }
    while (v11);
  }
  else
  {
    v21 = 0;
  }
LABEL_19:
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  reportingMLEnhance();
  return v21;
}

- (void)updateShouldEnableMLEnhanceOneToOne
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
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
  char *v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  char *v24;
  __int128 v25;
  id obj;
  id v27;
  _BOOL4 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BYTE v36[18];
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  char *v40;
  _BYTE v41[128];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v28 = -[VCSessionParticipantRemote shouldEnableMLEnhanceOneToOne](self, "shouldEnableMLEnhanceOneToOne");
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v27 = -[VCSessionParticipantRemote videoGroup](self, "videoGroup");
  obj = (id)objc_msgSend(v27, "mediaStreamInfoArray");
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v48;
    *(_QWORD *)&v4 = 136316162;
    v25 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v48 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v9 = (void *)objc_msgSend(v8, "streamConfigs", v25);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v43;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v43 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v14, "multiwayConfig"), "isOneToOne"))
              {
                objc_msgSend(v27, "setShouldEnableMLEnhance:streamID:", v28, objc_msgSend((id)objc_msgSend(v14, "multiwayConfig"), "idsStreamID"));
                if ((VCSessionParticipantRemote *)objc_opt_class() == self)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                    goto LABEL_25;
                  v22 = VRTraceErrorLogLevelToCSTR();
                  v23 = *MEMORY[0x1E0CF2758];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    goto LABEL_25;
                  v24 = FourccToCStr(objc_msgSend(v27, "streamGroupID"));
                  *(_DWORD *)buf = v25;
                  v30 = v22;
                  v31 = 2080;
                  v32 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceOneToOne]";
                  v33 = 1024;
                  v34 = 2964;
                  v35 = 1024;
                  *(_DWORD *)v36 = v28;
                  *(_WORD *)&v36[4] = 2080;
                  *(_QWORD *)&v36[6] = v24;
                  v19 = v23;
                  v20 = "VCSessionParticipantRemote [%s] %s:%d ML Enhance updated for OneToOne shouldEnableMLEnhance=%d streamGroupID=%s";
                  v21 = 44;
                }
                else
                {
                  v15 = &stru_1E9E58EE0;
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v15 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                    goto LABEL_25;
                  v16 = VRTraceErrorLogLevelToCSTR();
                  v17 = *MEMORY[0x1E0CF2758];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    goto LABEL_25;
                  v18 = FourccToCStr(objc_msgSend(v27, "streamGroupID"));
                  *(_DWORD *)buf = 136316674;
                  v30 = v16;
                  v31 = 2080;
                  v32 = "-[VCSessionParticipantRemote updateShouldEnableMLEnhanceOneToOne]";
                  v33 = 1024;
                  v34 = 2964;
                  v35 = 2112;
                  *(_QWORD *)v36 = v15;
                  *(_WORD *)&v36[8] = 2048;
                  *(_QWORD *)&v36[10] = self;
                  v37 = 1024;
                  v38 = v28;
                  v39 = 2080;
                  v40 = v18;
                  v19 = v17;
                  v20 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) ML Enhance updated for OneToOne shouldEnableMLEnhan"
                        "ce=%d streamGroupID=%s";
                  v21 = 64;
                }
                _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
                goto LABEL_25;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v41, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_25:
        ;
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
    }
    while (v5);
  }
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  reportingMLEnhance();
}

- (BOOL)isSeamlessTransitionSupportedForStreamGroup:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "streamGroupID") != 1667329399;
}

- (void)createAndResumeFetchTimer
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate fetch timer dispatch source!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t __55__VCSessionParticipantRemote_createAndResumeFetchTimer__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__VCSessionParticipantRemote_createAndResumeFetchTimer__block_invoke_2;
  v3[3] = &unk_1E9E55140;
  v3[4] = v1;
  return objc_msgSend(v1, "callDelegateWithBlock:", v3);
}

uint64_t __55__VCSessionParticipantRemote_createAndResumeFetchTimer__block_invoke_2(uint64_t a1, void *a2)
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _BYTE v14[24];
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v14 = 136315650;
        *(_QWORD *)&v14[4] = v5;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCSessionParticipantRemote createAndResumeFetchTimer]_block_invoke_2";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 2989;
        v7 = "VCSessionParticipantRemote [%s] %s:%d Fetching stream group state update";
        v8 = v6;
        v9 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v14, v9);
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
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v14 = 136316162;
        *(_QWORD *)&v14[4] = v10;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCSessionParticipantRemote createAndResumeFetchTimer]_block_invoke";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 2989;
        WORD2(v15) = 2112;
        *(_QWORD *)((char *)&v15 + 6) = v4;
        HIWORD(v15) = 2048;
        v16 = v12;
        v7 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Fetching stream group state update";
        v8 = v11;
        v9 = 48;
        goto LABEL_11;
      }
    }
  }
  return objc_msgSend(a2, "vcSessionParticipantFetchStreamGroupState:", *(_QWORD *)(a1 + 32), *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16);
}

void __55__VCSessionParticipantRemote_createAndResumeFetchTimer__block_invoke_128(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 736);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 736) = 0;
  }
}

- (void)cancelAndReleaseFetchTimer
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
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
  VCSessionParticipantRemote *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (self->_remoteStreamGroupStateUpdateTimer)
  {
    if ((VCSessionParticipantRemote *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v11 = 136315650;
      v12 = v4;
      v13 = 2080;
      v14 = "-[VCSessionParticipantRemote cancelAndReleaseFetchTimer]";
      v15 = 1024;
      v16 = 3004;
      v6 = "VCSessionParticipantRemote [%s] %s:%d Cancel stream group state update timer";
      v7 = v5;
      v8 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCSessionParticipantRemote performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v11 = 136316162;
      v12 = v9;
      v13 = 2080;
      v14 = "-[VCSessionParticipantRemote cancelAndReleaseFetchTimer]";
      v15 = 1024;
      v16 = 3004;
      v17 = 2112;
      v18 = v3;
      v19 = 2048;
      v20 = self;
      v6 = "VCSessionParticipantRemote [%s] %s:%d %@(%p) Cancel stream group state update timer";
      v7 = v10;
      v8 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
LABEL_13:
    dispatch_source_cancel((dispatch_source_t)self->_remoteStreamGroupStateUpdateTimer);
  }
}

- (void)updateAndHandleVideoMediaStall:(BOOL)a3 isOneToOneStream:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  _BOOL4 isVideoExpected;
  int isRemoteMediaStalled;
  double v10;
  VCSessionParticipantRemote *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  double lastVideoExpectationSwitch;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v4 = a4;
  v5 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  isVideoExpected = self->_isVideoExpected;
  if (isVideoExpected != -[VCSessionParticipantRemote isVideoExpected](self, "isVideoExpected"))
  {
    self->_isVideoExpected = -[VCSessionParticipantRemote isVideoExpected](self, "isVideoExpected");
    self->_lastVideoExpectationSwitch = micro();
  }
  isRemoteMediaStalled = self->_isRemoteMediaStalled;
  if ((v5 & 1) == 0 && self->_isRemoteMediaStalled)
  {
    if (!self->_isVideoExpected)
      goto LABEL_17;
    isRemoteMediaStalled = 1;
  }
  if (isRemoteMediaStalled == v5)
    return;
  if (!self->_isVideoExpected || !v4)
    return;
  if (!v5)
  {
LABEL_17:
    -[VCSessionParticipantRemote setVideoDegraded:](self, "setVideoDegraded:", 0);
    v11 = self;
    v12 = 0;
    goto LABEL_18;
  }
  v10 = micro();
  if (v10 - self->_lastVideoExpectationSwitch > 10.0)
  {
    -[VCSessionParticipantRemote setVideoDegraded:](self, "setVideoDegraded:", 1);
    v11 = self;
    v12 = 1;
LABEL_18:
    -[VCSessionParticipantRemote setRemoteMediaStalled:](v11, "setRemoteMediaStalled:", v12);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      lastVideoExpectationSwitch = self->_lastVideoExpectationSwitch;
      v16 = 136316418;
      v17 = v13;
      v18 = 2080;
      v19 = "-[VCSessionParticipantRemote updateAndHandleVideoMediaStall:isOneToOneStream:]";
      v20 = 1024;
      v21 = 3032;
      v22 = 2048;
      v23 = v10;
      v24 = 2048;
      v25 = lastVideoExpectationSwitch;
      v26 = 2048;
      v27 = v10 - lastVideoExpectationSwitch;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCSessionParticipantRemote [%s] %s:%d We are experiencing a video stall too soon after we switch video on. Ignoring... currentTime=%f lastVideoExpectationSwitch=%f diff=%f", (uint8_t *)&v16, 0x3Au);
    }
  }
}

- (void)reportCameraCompositionEnabled:(BOOL)a3
{
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("VCSPUUID");
  v5[0] = self->super._uuid;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
}

- (int)reportingResolutionForResolution:(int64_t)a3
{
  if ((unint64_t)a3 < 0x1C)
  {
    if (a3 == 27)
      return 28;
    else
      return a3;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantRemote reportingResolutionForResolution:].cold.1();
    }
    return 28;
  }
}

- (BOOL)isRemoteVideoEnabled
{
  return self->_remoteVideoEnabled;
}

- (unsigned)videoQuality
{
  return self->_videoQuality;
}

- (unsigned)visibilityIndex
{
  return self->_visibilityIndex;
}

- (unsigned)prominenceIndex
{
  return self->_prominenceIndex;
}

- (BOOL)isRemoteVideoPaused
{
  return self->_remoteVideoPaused;
}

- (BOOL)isRemoteScreenEnabled
{
  return self->_remoteScreenEnabled;
}

- (void)setCapabilities:(_VCSessionParticipantCapabilities)a3
{
  self->_capabilities = a3;
}

- (VCPositionalInfo)positionalInfo
{
  return self->_positionalInfo;
}

- (BOOL)isScreenControlEnabled
{
  return self->_screenControlEnabled;
}

- (BOOL)enableMaxCameraBitrateVideoQualityV2
{
  return self->_enableMaxCameraBitrateVideoQualityV2;
}

- (void)setEnableMaxCameraBitrateVideoQualityV2:(BOOL)a3
{
  self->_enableMaxCameraBitrateVideoQualityV2 = a3;
}

- (BOOL)isRemoteAudioEnabled
{
  return self->_remoteAudioEnabled;
}

- (BOOL)isRemoteAudioPaused
{
  return self->_remoteAudioPaused;
}

- (BOOL)isServerRTxEnabled
{
  return self->_isServerRTxEnabled;
}

- (void)setIsServerRTxEnabled:(BOOL)a3
{
  self->_isServerRTxEnabled = a3;
}

- (void)initWithConfig:delegate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed jitter target synchronizer  dictionary!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate positional info!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to copy local configuration!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Nil remote participant data!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to deserialize remote participant data!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.6()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSessionParticipantRemote initWithConfig:delegate:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to setup spatial audio! result=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote initWithConfig:delegate:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to setup stream groups", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to process participant info!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSpatialAudioWithMetadata:spatialMetadataEntryMap:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate channel index map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSpatialAudioWithMetadata:spatialMetadataEntryMap:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate spatial metadata entry. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupSpatialAudioWithMetadata:spatialMetadataEntryMap:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to retrieve the channel index. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupSpatialAudioWithMetadata:spatialMetadataEntryMap:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to store metadata entry for VCSessionMediaTypeMicrophone. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote setupSpatialAudioWithMetadata:spatialMetadataEntryMap:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)spatialMetadataEntryForMediaType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate media type key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)storeSpatialAudioMetadataEntry:forMediaType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate media type key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)participantSpatialAudioSourceIDs
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to get spatial audio source IDs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setTransitionToEnabled:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_16_0(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d Failed to update mediaState=enabled for mediaType=%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)setTransitionToPaused:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Screen pause state is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setTransitionToPaused:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_16_0(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d Failed to update mediaState=paused for mediaType=%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)setTransitionToDisabled:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_16_0(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d Failed to update mediaState=disabled for mediaType=%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)updateMediaState:forStreamGroup:.cold.1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  VCSessionMediaType_Name(objc_msgSend(v0, "mediaType"));
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d Failed to update mediaState=disabled for mediaType=%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)applyVideoEnabledSetting:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSessionParticipantRemote applyVideoEnabledSetting:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to update stream group with videoEnabled=%d", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote applyVideoEnabledSetting:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)processParticipantInfo
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Media negotiation failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getMajorVersionNumber
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to get number from string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamConfiguration:withStreamGroupConfig:streamGroupStreamConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d No codec configurations for stream configuration!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupBandwidthAllocationTableForMediaStreamConfigs:streamGroupID:entryType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate allocator entry!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)entryForStreamID:.cold.1()
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
  v3 = "-[VCSessionParticipantRemote entryForStreamID:]";
  OUTLINED_FUNCTION_4();
  v4 = 1302;
  v5 = 2112;
  v6 = v0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, "VCSessionParticipantRemote [%s] %s:%d No media entry found for stream ID: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __83__VCSessionParticipantRemote_configureWithOneToOneParticipantConfig_operatingMode___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Fail configure participant", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setStreamGroup:syncSourceStreamGroupID:.cold.1()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_8_11(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d Unable to sync the screen stream group with streamGroupID=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)pushEventToNwActivity:started:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCSessionParticipantRemote pushEventToNwActivity:started:]";
  OUTLINED_FUNCTION_4();
  v5 = 1777;
  v6 = v0;
  v7 = v1;
  _os_log_debug_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEBUG, "VCSessionParticipantRemote [%s] %s:%d Invalid NW activity label:%d", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)pushEventToNwActivity:started:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create event nwActivity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isVideoExpected
{
  NSObject *v0;
  unsigned __int8 *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  __int16 v6;
  int v7;
  uint8_t v8[14];
  const char *v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  OUTLINED_FUNCTION_14_2();
  v21 = *MEMORY[0x1E0C80C00];
  v2 = v1[374];
  v3 = v1[544];
  v4 = v1[377];
  v5 = v1[546];
  objc_msgSend(v1, "isVisible");
  OUTLINED_FUNCTION_12_0();
  v9 = "-[VCSessionParticipantRemote isVideoExpected]";
  OUTLINED_FUNCTION_4();
  v10 = 2137;
  v11 = v6;
  v12 = v2;
  v13 = v6;
  v14 = v3;
  v15 = v6;
  v16 = v4;
  v17 = v6;
  v18 = v5;
  v19 = v6;
  v20 = v7;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, "VCSessionParticipantRemote [%s] %s:%d videoEnabled:%d remoteVideoEnabled:%d videoPaused:%d remoteVideoPaused:%d isVisible:%d", v8, 0x3Au);
}

- (void)newMultiwayConfigWithStreamGroupStreamConfig:maxIDSStreamIDCount:groupID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Unable to allocate multiway config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create featureStringsDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoStreamConfiguration:withStreamGroupStreamConfig:codecConfigs:multiwayConfig:groupID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d setupStreamConfigWithCodecs failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate stream configuration!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Stream setup failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d cipher suite setup failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to setup the video stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate stream configuration!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamConfigWithStreamGroupConfig:streamConfig:rateControlConfig:multiwayConfig:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to setup the audio stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Unable to allocate rate control config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Unable to allocate multiway config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamConfigWithStreamConfig:streamGroupConfig:maxIDSStreamIDCount:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to allocate stream configuration!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamInfoWithNegotiationConfig:streamToken:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create media stream info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamInfoWithNegotiationConfig:streamToken:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create media stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamInfoWithNegotiationConfig:streamToken:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d invalid capabilies dictionary for media stream!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamInfoWithNegotiationConfig:streamToken:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create media stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaStreamInfoWithNegotiationConfig:streamToken:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d maxIDSStreamIDCount is beyond max allowed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSpatialInfoForStreamGroupConfig:.cold.1()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  __int16 v3;
  uint8_t v4[14];
  const char *v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  OUTLINED_FUNCTION_14_2();
  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "count");
  OUTLINED_FUNCTION_12_0();
  v5 = "-[VCSessionParticipantRemote setupSpatialInfoForStreamGroupConfig:]";
  OUTLINED_FUNCTION_4();
  v6 = 2483;
  v7 = 2048;
  v8 = v2;
  v9 = v3;
  v10 = 0;
  _os_log_error_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_ERROR, "VCSessionParticipantRemote [%s] %s:%d Unexpected number of media types. Count=%lu. status=%08x", v4, 0x2Cu);
}

- (void)newStreamGroupConfigWithNegotiationConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create stream group config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigWithNegotiationConfig:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed configure stream group config spatial info. status=%08x", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote newStreamGroupConfigWithNegotiationConfig:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigWithNegotiationConfig:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create media stream info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupConfigWithNegotiationConfig:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create stream group config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:.cold.1()
{
  void *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = OUTLINED_FUNCTION_18_0(v0, *MEMORY[0x1E0C80C00]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCSessionParticipantRemote [%s] %s:%d One to one groupID=%s stream configuration not available", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)addOneToOneStreamConfigToMediaStreamInfo:negotiatorStreamGroupConfig:.cold.2()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_8_11(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, "VCSessionParticipantRemote [%s] %s:%d One to one audio streams not supported for groupID=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupStreamGroupWithConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create stream group config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupWithConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create receive media group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupWithConfig:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to setup bandwidth allocation table for video!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupWithConfig:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create receive media group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupWithConfig:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create receive media group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoStreamGroupWithStreamGroupConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create video receive stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newCaptionsStreamGroupWithStreamGroupConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create captions receive stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createJitterBufferTargetEstimatorSynchronizer:syncGroupID:.cold.1()
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
  v3 = "-[VCSessionParticipantRemote createJitterBufferTargetEstimatorSynchronizer:syncGroupID:]";
  OUTLINED_FUNCTION_4();
  v4 = 2738;
  v5 = 2048;
  v6 = v0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, "VCSessionParticipantRemote [%s] %s:%d Failed to create Jitter Buffer Target Synchronizer remoteParticipant=%p", v2);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroups
{
  void *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = OUTLINED_FUNCTION_18_0(v0, *MEMORY[0x1E0C80C00]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCSessionParticipantRemote [%s] %s:%d Failed to setup stream group=%s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)reportingResolutionForResolution:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCSessionParticipantRemote reportingResolutionForResolution:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCSessionParticipantRemote [%s] %s:%d Invalid resolution: %d", v2, *(const char **)v3, (unint64_t)"-[VCSessionParticipantRemote reportingResolutionForResolution:]" >> 16, 3050);
  OUTLINED_FUNCTION_3();
}

@end
