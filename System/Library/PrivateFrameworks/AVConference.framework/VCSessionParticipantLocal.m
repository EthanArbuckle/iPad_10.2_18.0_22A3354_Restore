@implementation VCSessionParticipantLocal

- (VCSessionParticipantLocal)initWithConfig:(id)a3 delegate:(id)a4
{
  VCSessionParticipantLocal *v5;
  VCSessionParticipantLocal *v6;
  int v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 videoPriorityEnabled;
  int v12;
  NSString *v13;
  NSMutableSet *v14;
  NSMutableSet *v15;
  VCAudioPowerSpectrumSource *v16;
  NSMutableDictionary *v17;
  NSArray *v18;
  uint64_t v19;
  VCSessionMediaStreamPresenceConfigurationProvider *v20;
  VCSessionMediaStreamPresenceConfigurationProvider *v21;
  void *v22;
  VCSessionMediaStreamConfigurationProvider *v23;
  VCSessionMediaStreamConfigurationProvider *v24;
  uint64_t v25;
  VCSessionMediaStreamPresenceConfigurationProvider *v26;
  uint64_t v27;
  NSObject *v28;
  NSMutableSet *videoPayloadTypes;
  NSMutableSet *audioPayloadTypes;
  float v31;
  float v32;
  double v33;
  const __CFString *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  uint64_t v58;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  const char *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  objc_super v86;
  uint8_t buf[4];
  uint64_t v88;
  __int16 v89;
  const char *v90;
  __int16 v91;
  int v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  VCSessionParticipantLocal *v96;
  __int16 v97;
  uint64_t v98;
  _QWORD v99[2];
  _QWORD v100[2];
  const __CFString *v101;
  _QWORD v102[3];

  v102[1] = *MEMORY[0x1E0C80C00];
  v86.receiver = self;
  v86.super_class = (Class)VCSessionParticipantLocal;
  v5 = -[VCSessionParticipant initWithConfig:delegate:](&v86, sel_initWithConfig_delegate_, a3, a4);
  v6 = v5;
  if (v5)
  {
    v5->_videoPriority = 0;
    v7 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-video-priority-enabled"), CFSTR("enableVideoPriority"), MEMORY[0x1E0C9AAB0], 0), "BOOLValue");
    v8 = 0;
    if (v7)
      v8 = +[VCHardwareSettings supportsVideoPriority](VCHardwareSettings, "supportsVideoPriority");
    v6->_videoPriorityEnabled = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        videoPriorityEnabled = v6->_videoPriorityEnabled;
        *(_DWORD *)buf = 136315906;
        v88 = v9;
        v89 = 2080;
        v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
        v91 = 1024;
        v92 = 236;
        v93 = 1024;
        LODWORD(v94) = videoPriorityEnabled;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _videoPriorityEnabled=%d", buf, 0x22u);
      }
    }
    v6->super._direction = 1;
    v6->_maxSupportedMultiwayVideoResolution = -[VCSessionParticipantLocal maxCaptureResolution](v6, "maxCaptureResolution");
    v6->super._oneToOneModeEnabled = objc_msgSend(a3, "isOneToOneModeEnabled");
    v6->super._isGKVoiceChat = objc_msgSend(a3, "isGKVoiceChat");
    v6->_isRetransmissionEnabled = objc_msgSend(a3, "isUplinkRetransmissionEnabled");
    v12 = -[VCSessionParticipantLocal maxCaptureCameraFrameRate](v6, "maxCaptureCameraFrameRate");
    v6->_maxSupportedMultiwayCameraFrameRate = v12;
    v6->_currentVideoCaptureFrameRate = v12;
    v13 = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
    v6->super._uuid = v13;
    -[VCObject setLogPrefix:](v6, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uuid:%@ (local)"), v13));
    -[VCSessionParticipantLocal logDashboardLinks](v6, "logDashboardLinks");
    v6->super._creationTime.wide = GetNTPTime();
    v6->_connectionStatsStreamID = -[VCSessionParticipantLocal generateIDSStreamID](v6, "generateIDSStreamID");
    v6->_lastVideoPriority = 0;
    v6->_lastAudioPriority = 0;
    pthread_rwlock_init(&v6->_audioTimestampRWLock, 0);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6->_generatedStreamIDs = v14;
    if (v14)
    {
      v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v6->_generatedSSRCs = v15;
      if (v15)
      {
        v16 = -[VCAudioPowerSpectrumSource initWithStreamToken:delegate:]([VCAudioPowerSpectrumSource alloc], "initWithStreamToken:delegate:", -[VCSessionParticipant participantVideoToken](v6, "participantVideoToken"), v6);
        v6->_powerSpectrumSource = v16;
        if (v16)
        {
          -[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:](+[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance"), "registerAudioPowerMeterSource:", v6->_powerSpectrumSource);
          v6->super._transportSessionID = -[VCSessionParticipant participantVideoToken](v6, "participantVideoToken");
          v6->_peerSubscribedStreams = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v6->_localPublishedStreams = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
          v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v6->_oneToOneSettings.streamInfo = v17;
          if (v17)
          {
            v18 = -[VCSessionParticipantLocal newUplinkBandwidthAllocators](v6, "newUplinkBandwidthAllocators");
            v6->_uplinkBandwidthAllocators = v18;
            if (v18)
            {
              v6->_uplinkBandwidthAllocator = (VCSessionUplinkBandwidthAllocator *)-[NSArray objectAtIndexedSubscript:](v18, "objectAtIndexedSubscript:", v6->super._oneToOneModeEnabled);
              -[VCSessionParticipantLocal setupSystemAudioCapture](v6, "setupSystemAudioCapture");
              v6->_isOneToOneAuthenticationTagEnabled = objc_msgSend(a3, "isOneToOneAuthenticationTagEnabled");
              v19 = -[VCSessionParticipantLocal processCachedParticipantData:](v6, "processCachedParticipantData:", objc_msgSend(a3, "participantData"));
              v6->_audioPayloadTypes = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
              v6->_videoPayloadTypes = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
              if (objc_msgSend(a3, "sessionMode") == 2)
              {
                v20 = -[VCSessionMediaStreamPresenceConfigurationProvider initWithConfigurationType:supportedAudioRules:streamIDGenerator:]([VCSessionMediaStreamPresenceConfigurationProvider alloc], "initWithConfigurationType:supportedAudioRules:streamIDGenerator:", 1, v6->super._supportedAudioRules, v6);
                if (v20)
                {
                  v21 = v20;
                  if (-[VCSessionParticipantLocal setupStreamInputsWithConfig:](v6, "setupStreamInputsWithConfig:", v20))
                  {
                    if (-[VCSessionParticipantLocal setupStreamGroupsWithConfig:negotiatorConfig:](v6, "setupStreamGroupsWithConfig:negotiatorConfig:", v21, v19))
                    {
                      v22 = 0;
                      goto LABEL_25;
                    }
                    if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                          -[VCSessionParticipantLocal initWithConfig:delegate:].cold.9();
                      }
                      goto LABEL_201;
                    }
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                      v54 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
                    else
                      v54 = &stru_1E9E58EE0;
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      v78 = VRTraceErrorLogLevelToCSTR();
                      v73 = *MEMORY[0x1E0CF2758];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136316162;
                        v88 = v78;
                        v89 = 2080;
                        v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                        v91 = 1024;
                        v92 = 293;
                        v93 = 2112;
                        v94 = (uint64_t)v54;
                        v95 = 2048;
                        v96 = v6;
                        v74 = " [%s] %s:%d %@(%p) Failed to setup the stream groups";
                        goto LABEL_169;
                      }
                    }
                  }
                  else
                  {
                    if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                          -[VCSessionParticipantLocal initWithConfig:delegate:].cold.10();
                      }
                      goto LABEL_201;
                    }
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                      v52 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
                    else
                      v52 = &stru_1E9E58EE0;
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      v72 = VRTraceErrorLogLevelToCSTR();
                      v73 = *MEMORY[0x1E0CF2758];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136316162;
                        v88 = v72;
                        v89 = 2080;
                        v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                        v91 = 1024;
                        v92 = 290;
                        v93 = 2112;
                        v94 = (uint64_t)v52;
                        v95 = 2048;
                        v96 = v6;
                        v74 = " [%s] %s:%d %@(%p) Failed to setup the stream inputs";
LABEL_169:
                        _os_log_error_impl(&dword_1D8A54000, v73, OS_LOG_TYPE_ERROR, v74, buf, 0x30u);
                      }
                    }
                  }
LABEL_201:
                  v22 = 0;
                  goto LABEL_202;
                }
                if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                      -[VCSessionParticipantLocal initWithConfig:delegate:].cold.6();
                  }
                  goto LABEL_200;
                }
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v51 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
                else
                  v51 = &stru_1E9E58EE0;
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  v71 = VRTraceErrorLogLevelToCSTR();
                  v59 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    v88 = v71;
                    v89 = 2080;
                    v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                    v91 = 1024;
                    v92 = 287;
                    v93 = 2112;
                    v94 = (uint64_t)v51;
                    v95 = 2048;
                    v96 = v6;
                    v60 = " [%s] %s:%d %@(%p) Failed to allocate config provider";
                    goto LABEL_199;
                  }
                }
LABEL_200:
                v21 = 0;
                goto LABEL_201;
              }
              v6->_videoCaptureSource = 3;
              if (VCDefaults_GetBoolValueForKey(CFSTR("simulateWebRTCOnlyClient"), 0))
              {
                v22 = 0;
              }
              else
              {
                v23 = -[VCSessionMediaStreamConfigurationProvider initWithStreamIDGenerator:sessionMode:supportedAudioRules:]([VCSessionMediaStreamConfigurationProvider alloc], "initWithStreamIDGenerator:sessionMode:supportedAudioRules:", v6, objc_msgSend(a3, "sessionMode"), v6->super._supportedAudioRules);
                if (!v23)
                {
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                        -[VCSessionParticipantLocal initWithConfig:delegate:].cold.14();
                    }
                    goto LABEL_200;
                  }
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v68 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
                  else
                    v68 = &stru_1E9E58EE0;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    v82 = VRTraceErrorLogLevelToCSTR();
                    v59 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      v88 = v82;
                      v89 = 2080;
                      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                      v91 = 1024;
                      v92 = 302;
                      v93 = 2112;
                      v94 = (uint64_t)v68;
                      v95 = 2048;
                      v96 = v6;
                      v60 = " [%s] %s:%d %@(%p) Failed to allocate config provider";
                      goto LABEL_199;
                    }
                  }
                  goto LABEL_200;
                }
                v24 = v23;
                v25 = -[VCSessionMediaStreamConfigurationProvider audioStreamConfigurations](v23, "audioStreamConfigurations");
                v101 = CFSTR("streamGroupID");
                v102[0] = &unk_1E9EF5420;
                if (!-[VCSessionParticipantLocal setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:](v6, "setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:", v25, v19, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, &v101, 1)))
                {
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                        -[VCSessionParticipantLocal initWithConfig:delegate:].cold.16();
                    }
                  }
                  else
                  {
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                      v69 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
                    else
                      v69 = &stru_1E9E58EE0;
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      v83 = VRTraceErrorLogLevelToCSTR();
                      v84 = *MEMORY[0x1E0CF2758];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136316162;
                        v88 = v83;
                        v89 = 2080;
                        v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                        v91 = 1024;
                        v92 = 305;
                        v93 = 2112;
                        v94 = (uint64_t)v69;
                        v95 = 2048;
                        v96 = v6;
                        _os_log_error_impl(&dword_1D8A54000, v84, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup audio streams", buf, 0x30u);
                      }
                    }
                  }
                  v21 = 0;
                  v22 = v24;
                  goto LABEL_202;
                }
                v99[0] = CFSTR("streamGroupID");
                v99[1] = CFSTR("streamGroupSyncGroupID");
                v100[0] = &unk_1E9EF5438;
                v100[1] = &unk_1E9EF5420;
                v22 = v24;
                if (!-[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:](v6, "setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:", -[VCSessionMediaStreamConfigurationProvider videoStreamConfigurations](v24, "videoStreamConfigurations"), v19, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 2)))
                {
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                        -[VCSessionParticipantLocal initWithConfig:delegate:].cold.15();
                    }
                    goto LABEL_211;
                  }
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v70 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
                  else
                    v70 = &stru_1E9E58EE0;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    v85 = VRTraceErrorLogLevelToCSTR();
                    v76 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      v88 = v85;
                      v89 = 2080;
                      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                      v91 = 1024;
                      v92 = 310;
                      v93 = 2112;
                      v94 = (uint64_t)v70;
                      v95 = 2048;
                      v96 = v6;
                      v77 = " [%s] %s:%d %@(%p) Failed to setup video stream";
                      goto LABEL_213;
                    }
                  }
LABEL_211:
                  v21 = 0;
                  goto LABEL_202;
                }
              }
              v26 = -[VCSessionMediaStreamPresenceConfigurationProvider initWithConfigurationType:supportedAudioRules:streamIDGenerator:]([VCSessionMediaStreamPresenceConfigurationProvider alloc], "initWithConfigurationType:supportedAudioRules:streamIDGenerator:", 2, v6->super._supportedAudioRules, v6);
              if (v26)
              {
                v21 = v26;
                if (!-[VCSessionParticipantLocal setupStreamInputsWithConfig:](v6, "setupStreamInputsWithConfig:", v26))
                {
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                        -[VCSessionParticipantLocal initWithConfig:delegate:].cold.13();
                    }
                    goto LABEL_202;
                  }
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v55 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
                  else
                    v55 = &stru_1E9E58EE0;
                  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
                    goto LABEL_202;
                  v79 = VRTraceErrorLogLevelToCSTR();
                  v66 = *MEMORY[0x1E0CF2758];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    goto LABEL_202;
                  *(_DWORD *)buf = 136316162;
                  v88 = v79;
                  v89 = 2080;
                  v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                  v91 = 1024;
                  v92 = 317;
                  v93 = 2112;
                  v94 = (uint64_t)v55;
                  v95 = 2048;
                  v96 = v6;
                  v67 = " [%s] %s:%d %@(%p) Failed to setup the stream inputs";
                  goto LABEL_185;
                }
                if (!-[VCSessionParticipantLocal setupStreamGroupsWithConfig:negotiatorConfig:](v6, "setupStreamGroupsWithConfig:negotiatorConfig:", v21, v19))
                {
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                        -[VCSessionParticipantLocal initWithConfig:delegate:].cold.12();
                    }
                    goto LABEL_202;
                  }
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v56 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
                  else
                    v56 = &stru_1E9E58EE0;
                  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
                    goto LABEL_202;
                  v80 = VRTraceErrorLogLevelToCSTR();
                  v66 = *MEMORY[0x1E0CF2758];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    goto LABEL_202;
                  *(_DWORD *)buf = 136316162;
                  v88 = v80;
                  v89 = 2080;
                  v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                  v91 = 1024;
                  v92 = 320;
                  v93 = 2112;
                  v94 = (uint64_t)v56;
                  v95 = 2048;
                  v96 = v6;
                  v67 = " [%s] %s:%d %@(%p) Failed to setup the stream groups";
                  goto LABEL_185;
                }
LABEL_25:
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v27 = VRTraceErrorLogLevelToCSTR();
                  v28 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  {
                    videoPayloadTypes = v6->_videoPayloadTypes;
                    audioPayloadTypes = v6->_audioPayloadTypes;
                    *(_DWORD *)buf = 136316162;
                    v88 = v27;
                    v89 = 2080;
                    v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                    v91 = 1024;
                    v92 = 322;
                    v93 = 2112;
                    v94 = (uint64_t)videoPayloadTypes;
                    v95 = 2112;
                    v96 = (VCSessionParticipantLocal *)audioPayloadTypes;
                    _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d video payload types=%@, audio payload types=%@", buf, 0x30u);
                  }
                }
                objc_msgSend(-[NSArray objectAtIndexedSubscript:](v6->_uplinkBandwidthAllocators, "objectAtIndexedSubscript:", 0), "addBandwidthAllocationTableEntry:updateNow:", 0, 1);
                if (-[VCSessionParticipantLocal initializeMediaNegotiator](v6, "initializeMediaNegotiator"))
                {
                  if (v6->super._participantInfo)
                  {
                    v6->super._callInfoBlob = -[VCCallInfoBlob initWithData:]([VCCallInfoBlob alloc], "initWithData:", -[NSDictionary objectForKeyedSubscript:](v6->super._participantInfo, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyCallInfoBlob")));
                    v6->super._mediaBlobCompressed = (NSData *)-[NSDictionary objectForKeyedSubscript:](v6->super._participantInfo, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyMediaNegotiationData"));
LABEL_32:
                    -[VCSessionParticipant setupMediaTypeSettingsWithConfig:](v6, "setupMediaTypeSettingsWithConfig:", a3);
                    v6->_fecRatio = -1.0;
                    v6->_averageSilenceAudioPower = -120.0;
                    v6->_audioPriorityRampUp = -[VCDefaults audioPriorityRampUpSpeed](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "audioPriorityRampUpSpeed");
                    v6->_audioPriorityDecaySlow = -[VCDefaults audioPriorityDecaySlow](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "audioPriorityDecaySlow");
                    v6->_audioPriorityDecayFast = -[VCDefaults audioPriorityDecayFast](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "audioPriorityDecayFast");
                    -[VCDefaults audioVoiceDetectionSensitivity](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "audioVoiceDetectionSensitivity");
                    v6->_audioVoiceDetectionSensitivity = v31;
                    v32 = 2.0
                        / (double)(-[VCDefaults silenceLevelMovingAveragePeriod](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "silenceLevelMovingAveragePeriod")+ 1);
                    v6->_audioSilencePowerAverageMultiplier = v32;
                    v6->_forcedAudioPriorityValue = -[VCDefaults forceAudioPriorityValue](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPriorityValue");
                    v6->_forcedAudioPriorityEnabled = -[VCDefaults forceAudioPriorityEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPriorityEnabled");
                    -[VCSessionParticipantLocal createOpaqueData](v6, "createOpaqueData");
                    v33 = micro();
                    v6->_initTime = v33;
                    v6->_lastVideoEnabledChangedTime = v33;
                    v6->_presenceProvider = v21;
                    v6->_isHigherAudioREDCutoverU1Enabled = objc_msgSend(a3, "isHigherAudioREDCutoverU1Enabled");
                    if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                    {
                      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
                        goto LABEL_43;
                      v35 = VRTraceErrorLogLevelToCSTR();
                      v36 = *MEMORY[0x1E0CF2758];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                        goto LABEL_43;
                      v37 = -[VCSessionParticipant description](v6, "description");
                      *(_DWORD *)buf = 136315906;
                      v88 = v35;
                      v89 = 2080;
                      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                      v91 = 1024;
                      v92 = 360;
                      v93 = 2112;
                      v94 = v37;
                      v38 = " [%s] %s:%d Participant init %@";
                      v39 = v36;
                      v40 = 38;
                    }
                    else
                    {
                      if ((objc_opt_respondsToSelector() & 1) != 0)
                        v34 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
                      else
                        v34 = &stru_1E9E58EE0;
                      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
                        goto LABEL_43;
                      v41 = VRTraceErrorLogLevelToCSTR();
                      v42 = *MEMORY[0x1E0CF2758];
                      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                        goto LABEL_43;
                      v43 = -[VCSessionParticipant description](v6, "description");
                      *(_DWORD *)buf = 136316418;
                      v88 = v41;
                      v89 = 2080;
                      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                      v91 = 1024;
                      v92 = 360;
                      v93 = 2112;
                      v94 = (uint64_t)v34;
                      v95 = 2048;
                      v96 = v6;
                      v97 = 2112;
                      v98 = v43;
                      v38 = " [%s] %s:%d %@(%p) Participant init %@";
                      v39 = v42;
                      v40 = 58;
                    }
                    _os_log_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);
LABEL_43:

                    return v6;
                  }
                  if (-[VCSessionParticipantLocal createParticipantInfo](v6, "createParticipantInfo"))
                    goto LABEL_32;
                  if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                        -[VCSessionParticipantLocal initWithConfig:delegate:].cold.7();
                    }
                    goto LABEL_202;
                  }
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v57 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
                  else
                    v57 = &stru_1E9E58EE0;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    v81 = VRTraceErrorLogLevelToCSTR();
                    v66 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136316162;
                      v88 = v81;
                      v89 = 2080;
                      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                      v91 = 1024;
                      v92 = 332;
                      v93 = 2112;
                      v94 = (uint64_t)v57;
                      v95 = 2048;
                      v96 = v6;
                      v67 = " [%s] %s:%d %@(%p) Failed to create participant info";
                      goto LABEL_185;
                    }
                  }
LABEL_202:

                  v22 = v21;
                  v21 = (VCSessionMediaStreamPresenceConfigurationProvider *)v6;
                  v6 = 0;
                  goto LABEL_43;
                }
                if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                      -[VCSessionParticipantLocal initWithConfig:delegate:].cold.8();
                  }
                  goto LABEL_202;
                }
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v50 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
                else
                  v50 = &stru_1E9E58EE0;
                if ((int)VRTraceGetErrorLogLevelForModule() < 3)
                  goto LABEL_202;
                v65 = VRTraceErrorLogLevelToCSTR();
                v66 = *MEMORY[0x1E0CF2758];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  goto LABEL_202;
                *(_DWORD *)buf = 136316162;
                v88 = v65;
                v89 = 2080;
                v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                v91 = 1024;
                v92 = 328;
                v93 = 2112;
                v94 = (uint64_t)v50;
                v95 = 2048;
                v96 = v6;
                v67 = " [%s] %s:%d %@(%p) Failed to initialize media negotiator";
LABEL_185:
                _os_log_error_impl(&dword_1D8A54000, v66, OS_LOG_TYPE_ERROR, v67, buf, 0x30u);
                goto LABEL_202;
              }
              if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCSessionParticipantLocal initWithConfig:delegate:].cold.11();
                }
                goto LABEL_211;
              }
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v53 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
              else
                v53 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                v75 = VRTraceErrorLogLevelToCSTR();
                v76 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316162;
                  v88 = v75;
                  v89 = 2080;
                  v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
                  v91 = 1024;
                  v92 = 314;
                  v93 = 2112;
                  v94 = (uint64_t)v53;
                  v95 = 2048;
                  v96 = v6;
                  v77 = " [%s] %s:%d %@(%p) Failed to allocate config provider";
LABEL_213:
                  _os_log_error_impl(&dword_1D8A54000, v76, OS_LOG_TYPE_ERROR, v77, buf, 0x30u);
                  goto LABEL_211;
                }
              }
              goto LABEL_211;
            }
            if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCSessionParticipantLocal initWithConfig:delegate:].cold.5();
              }
              goto LABEL_200;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v49 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
            else
              v49 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
              goto LABEL_200;
            v64 = VRTraceErrorLogLevelToCSTR();
            v59 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              goto LABEL_200;
            *(_DWORD *)buf = 136316162;
            v88 = v64;
            v89 = 2080;
            v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
            v91 = 1024;
            v92 = 273;
            v93 = 2112;
            v94 = (uint64_t)v49;
            v95 = 2048;
            v96 = v6;
            v60 = " [%s] %s:%d %@(%p) Failed to create uplinkBandwidthAllocators";
          }
          else
          {
            if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCSessionParticipantLocal initWithConfig:delegate:].cold.4();
              }
              goto LABEL_200;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v48 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
            else
              v48 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 3)
              goto LABEL_200;
            v63 = VRTraceErrorLogLevelToCSTR();
            v59 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              goto LABEL_200;
            *(_DWORD *)buf = 136316162;
            v88 = v63;
            v89 = 2080;
            v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
            v91 = 1024;
            v92 = 270;
            v93 = 2112;
            v94 = (uint64_t)v48;
            v95 = 2048;
            v96 = v6;
            v60 = " [%s] %s:%d %@(%p) Failed to allocate oneToOne streamInfo dictionary";
          }
        }
        else
        {
          if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCSessionParticipantLocal initWithConfig:delegate:].cold.3();
            }
            goto LABEL_200;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v47 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
          else
            v47 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_200;
          v62 = VRTraceErrorLogLevelToCSTR();
          v59 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_200;
          *(_DWORD *)buf = 136316162;
          v88 = v62;
          v89 = 2080;
          v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
          v91 = 1024;
          v92 = 259;
          v93 = 2112;
          v94 = (uint64_t)v47;
          v95 = 2048;
          v96 = v6;
          v60 = " [%s] %s:%d %@(%p) Failed to allocate power spectrum source";
        }
      }
      else
      {
        if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantLocal initWithConfig:delegate:].cold.2();
          }
          goto LABEL_200;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v46 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
        else
          v46 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_200;
        v61 = VRTraceErrorLogLevelToCSTR();
        v59 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_200;
        *(_DWORD *)buf = 136316162;
        v88 = v61;
        v89 = 2080;
        v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
        v91 = 1024;
        v92 = 256;
        v93 = 2112;
        v94 = (uint64_t)v46;
        v95 = 2048;
        v96 = v6;
        v60 = " [%s] %s:%d %@(%p) Failed to allocate generated SSRC set";
      }
    }
    else
    {
      if ((VCSessionParticipantLocal *)objc_opt_class() == v6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipantLocal initWithConfig:delegate:].cold.1();
        }
        goto LABEL_200;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v45 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v6, "performSelector:", sel_logPrefix);
      else
        v45 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_200;
      v58 = VRTraceErrorLogLevelToCSTR();
      v59 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_200;
      *(_DWORD *)buf = 136316162;
      v88 = v58;
      v89 = 2080;
      v90 = "-[VCSessionParticipantLocal initWithConfig:delegate:]";
      v91 = 1024;
      v92 = 254;
      v93 = 2112;
      v94 = (uint64_t)v45;
      v95 = 2048;
      v96 = v6;
      v60 = " [%s] %s:%d %@(%p) Failed to allocate generated stream ID set";
    }
LABEL_199:
    _os_log_error_impl(&dword_1D8A54000, v59, OS_LOG_TYPE_ERROR, v60, buf, 0x30u);
    goto LABEL_200;
  }
  return v6;
}

- (void)dealloc
{
  VCAudioPowerSpectrumManager *v3;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[VCSessionParticipantLocal cleanupStreamInputs](self, "cleanupStreamInputs");
  v3 = +[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance");
  -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v3, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCAudioPowerSpectrumSource streamToken](self->_powerSpectrumSource, "streamToken")));
  -[VCAudioPowerSpectrumSource invalidate](self->_powerSpectrumSource, "invalidate");

  pthread_rwlock_destroy(&self->_audioTimestampRWLock);
  -[VCRedundancyControllerAudio unregisterStatistics](self->_oneToOneSettings.audioRedundancyController, "unregisterStatistics");

  v4.receiver = self;
  v4.super_class = (Class)VCSessionParticipantLocal;
  -[VCSessionParticipant dealloc](&v4, sel_dealloc);
}

- (void)logDashboardLinks
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  CFTypeRef v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://avc-gft-dashboard.apple.com/multiway/conference/%@"), self->super._uuid);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v10 = v3;
      v11 = 2080;
      v12 = "-[VCSessionParticipantLocal logDashboardLinks]";
      v13 = 1024;
      v14 = 400;
      v15 = 2112;
      v16 = v2;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCDashboard Participant DisplayURL=%@", buf, 0x26u);
    }
  }
  v5 = VCGetSerialNumber();
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://avc-gft-dashboard.apple.com/multiway?serial=%@"), v5);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v10 = v7;
        v11 = 2080;
        v12 = "-[VCSessionParticipantLocal logDashboardLinks]";
        v13 = 1024;
        v14 = 404;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d AVCDashboard Serial DisplayURL=%@", buf, 0x26u);
      }
    }
  }
}

- (id)newUplinkBandwidthAllocators
{
  void *v3;
  VCSessionUplinkBandwidthAllocatorMultiway *v4;
  VCSessionUplinkBandwidthAllocatorMultiway *v5;
  VCSessionUplinkBandwidthAllocatorOneToOne *v6;
  VCSessionUplinkBandwidthAllocatorOneToOne *v7;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
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
  VCSessionParticipantLocal *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  if (!v3)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newUplinkBandwidthAllocators].cold.1();
      }
      goto LABEL_31;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_31;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    v18 = 136316162;
    v19 = v12;
    v20 = 2080;
    v21 = "-[VCSessionParticipantLocal newUplinkBandwidthAllocators]";
    v22 = 1024;
    v23 = 414;
    v24 = 2112;
    v25 = v9;
    v26 = 2048;
    v27 = self;
    v14 = " [%s] %s:%d %@(%p) Failed to create bandwith allocator array";
    goto LABEL_38;
  }
  v4 = objc_alloc_init(VCSessionUplinkBandwidthAllocatorMultiway);
  if (!v4)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newUplinkBandwidthAllocators].cold.2();
      }
      goto LABEL_31;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v15 = VRTraceErrorLogLevelToCSTR(),
          v13 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_31:
      v5 = 0;
LABEL_32:

      return 0;
    }
    v18 = 136316162;
    v19 = v15;
    v20 = 2080;
    v21 = "-[VCSessionParticipantLocal newUplinkBandwidthAllocators]";
    v22 = 1024;
    v23 = 416;
    v24 = 2112;
    v25 = v10;
    v26 = 2048;
    v27 = self;
    v14 = " [%s] %s:%d %@(%p) Failed to create VCSessionUplinkBandwidthAllocatorMultiway";
LABEL_38:
    _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v18, 0x30u);
    goto LABEL_31;
  }
  v5 = v4;
  v6 = objc_alloc_init(VCSessionUplinkBandwidthAllocatorOneToOne);
  if (!v6)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newUplinkBandwidthAllocators].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v18 = 136316162;
          v19 = v16;
          v20 = 2080;
          v21 = "-[VCSessionParticipantLocal newUplinkBandwidthAllocators]";
          v22 = 1024;
          v23 = 418;
          v24 = 2112;
          v25 = v11;
          v26 = 2048;
          v27 = self;
          _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create VCSessionUplinkBandwidthAllocatorOneToOne", (uint8_t *)&v18, 0x30u);
        }
      }
    }
    goto LABEL_32;
  }
  v7 = v6;
  objc_msgSend(v3, "addObject:", v5);
  objc_msgSend(v3, "addObject:", v7);

  return v3;
}

- (id)processCachedParticipantData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  VCMediaNegotiatorLocalConfiguration *v8;
  VCMediaNegotiatorLocalConfiguration *v9;
  NSString *v10;
  VCMediaNegotiatorLocalConfiguration *v11;

  if (!a3)
  {
LABEL_17:
    v9 = 0;
LABEL_18:
    v11 = 0;
    goto LABEL_7;
  }
  v4 = +[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:");
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal processCachedParticipantData:].cold.1();
    }
    goto LABEL_17;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyMediaNegotiationData"));
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal processCachedParticipantData:].cold.2();
    }
    goto LABEL_17;
  }
  v7 = v6;
  v8 = objc_alloc_init(VCMediaNegotiatorLocalConfiguration);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal processCachedParticipantData:].cold.3();
    }
    goto LABEL_17;
  }
  v9 = v8;
  if (!+[VCSessionMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:](VCSessionMediaNegotiator, "initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:", v8, v7, 0, 104))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal processCachedParticipantData:].cold.4();
    }
    goto LABEL_18;
  }
  self->_isOneToOneAuthenticationTagEnabled = -[VCMediaNegotiatorLocalConfiguration isOneToOneAuthTagEnabled](v9, "isOneToOneAuthTagEnabled");

  v10 = (NSString *)objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyUUID")), "copy");
  self->super._uuid = v10;
  -[VCObject setLogPrefix:](self, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("uuid:%@ "), v10));
  self->super._participantInfo = (NSDictionary *)v5;
  v11 = v9;
LABEL_7:

  return v11;
}

- (void)updateAudioSpectrumState
{
  _BOOL4 v3;
  int v4;
  int v5;
  int v6;
  int presentationState;
  BOOL v8;
  BOOL v9;
  char EnableAudioPowerSpectrumReport;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  _BOOL4 isAudioPowerSpectrumEnabled;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  _BOOL4 v24;
  int v25;
  _BOOL4 v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  NSMutableArray *micStreamGroups;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  int v35;
  _BOOL4 v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  _BYTE v49[10];
  VCSessionParticipantLocal *v50;
  _BYTE v51[6];
  _BYTE v52[6];
  _BYTE v53[6];
  __int16 v54;
  _BOOL4 v55;
  __int16 v56;
  int v57;
  __int16 v58;
  _BOOL4 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v3 = self->super._videoEnabled && !self->super._videoPaused;
  v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1E9EF5450), "mediaState");
  v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", &unk_1E9EF5468), "mediaState");
  v6 = v5;
  presentationState = self->super._presentationState;
  if (v3 || (!self->super._presentationState ? (v8 = v4 == 1) : (v8 = 1), !v8 ? (v9 = v5 == 1) : (v9 = 1), v9))
    EnableAudioPowerSpectrumReport = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
  else
    EnableAudioPowerSpectrumReport = 1;
  self->_isAudioPowerSpectrumEnabled = EnableAudioPowerSpectrumReport;
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_30;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    v14 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      v15 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
      isAudioPowerSpectrumEnabled = self->_isAudioPowerSpectrumEnabled;
      *(_DWORD *)buf = 136317186;
      v43 = v12;
      v44 = 2080;
      v45 = "-[VCSessionParticipantLocal updateAudioSpectrumState]";
      v46 = 1024;
      v47 = 475;
      v48 = 1024;
      *(_DWORD *)v49 = v3;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v4 == 1;
      LOWORD(v50) = 1024;
      *(_DWORD *)((char *)&v50 + 2) = v6 == 1;
      HIWORD(v50) = 1024;
      *(_DWORD *)v51 = presentationState == 0;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)v52 = v15;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)v53 = isAudioPowerSpectrumEnabled;
      v17 = " [%s] %s:%d is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isForeground=%d testEnabled=%d =>"
            " spectrumEnabled=%d";
      v18 = v13;
      v19 = 64;
LABEL_26:
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      goto LABEL_30;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v35 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
      v36 = self->_isAudioPowerSpectrumEnabled;
      *(_DWORD *)buf = 136317186;
      v43 = v12;
      v44 = 2080;
      v45 = "-[VCSessionParticipantLocal updateAudioSpectrumState]";
      v46 = 1024;
      v47 = 475;
      v48 = 1024;
      *(_DWORD *)v49 = v3;
      *(_WORD *)&v49[4] = 1024;
      *(_DWORD *)&v49[6] = v4 == 1;
      LOWORD(v50) = 1024;
      *(_DWORD *)((char *)&v50 + 2) = v6 == 1;
      HIWORD(v50) = 1024;
      *(_DWORD *)v51 = presentationState == 0;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)v52 = v35;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)v53 = v36;
      v27 = " [%s] %s:%d is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isForeground=%d testEnabled=%d =>"
            " spectrumEnabled=%d";
      v28 = v13;
      v29 = 64;
      goto LABEL_39;
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      v22 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          goto LABEL_30;
        v23 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
        v24 = self->_isAudioPowerSpectrumEnabled;
        *(_DWORD *)buf = 136317698;
        v43 = v20;
        v44 = 2080;
        v45 = "-[VCSessionParticipantLocal updateAudioSpectrumState]";
        v46 = 1024;
        v47 = 475;
        v48 = 2112;
        *(_QWORD *)v49 = v11;
        *(_WORD *)&v49[8] = 2048;
        v50 = self;
        *(_WORD *)v51 = 1024;
        *(_DWORD *)&v51[2] = v3;
        *(_WORD *)v52 = 1024;
        *(_DWORD *)&v52[2] = v4 == 1;
        *(_WORD *)v53 = 1024;
        *(_DWORD *)&v53[2] = v6 == 1;
        v54 = 1024;
        v55 = presentationState == 0;
        v56 = 1024;
        v57 = v23;
        v58 = 1024;
        v59 = v24;
        v17 = " [%s] %s:%d %@(%p) is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isForeground=%d testEnab"
              "led=%d => spectrumEnabled=%d";
        v18 = v21;
        v19 = 84;
        goto LABEL_26;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v25 = VCTestMonitorManager_GetEnableAudioPowerSpectrumReport();
        v26 = self->_isAudioPowerSpectrumEnabled;
        *(_DWORD *)buf = 136317698;
        v43 = v20;
        v44 = 2080;
        v45 = "-[VCSessionParticipantLocal updateAudioSpectrumState]";
        v46 = 1024;
        v47 = 475;
        v48 = 2112;
        *(_QWORD *)v49 = v11;
        *(_WORD *)&v49[8] = 2048;
        v50 = self;
        *(_WORD *)v51 = 1024;
        *(_DWORD *)&v51[2] = v3;
        *(_WORD *)v52 = 1024;
        *(_DWORD *)&v52[2] = v4 == 1;
        *(_WORD *)v53 = 1024;
        *(_DWORD *)&v53[2] = v6 == 1;
        v54 = 1024;
        v55 = presentationState == 0;
        v56 = 1024;
        v57 = v25;
        v58 = 1024;
        v59 = v26;
        v27 = " [%s] %s:%d %@(%p) is2DCameraActive=%d is3DCameraActive=%d is3DCameraAltActive=%d isForeground=%d testEnab"
              "led=%d => spectrumEnabled=%d";
        v28 = v21;
        v29 = 84;
LABEL_39:
        _os_log_debug_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEBUG, v27, buf, v29);
      }
    }
  }
LABEL_30:
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  micStreamGroups = self->super._micStreamGroups;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v39 != v33)
          objc_enumerationMutation(micStreamGroups);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "setPowerSpectrumEnabled:", self->_isAudioPowerSpectrumEnabled);
      }
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
    }
    while (v32);
  }
}

- (BOOL)isParticipantIDBasedKeyLookupEnabled
{
  return 0;
}

- (unsigned)mediaStateForMediaType:(unsigned int)a3
{
  unsigned int result;
  int *v4;

  switch(a3)
  {
    case 0u:
      if (!self->super._audioEnabled)
        goto LABEL_11;
      v4 = &OBJC_IVAR___VCSessionParticipant__audioPaused;
      goto LABEL_8;
    case 1u:
      if (!self->super._videoEnabled)
        goto LABEL_11;
      v4 = &OBJC_IVAR___VCSessionParticipant__videoPaused;
LABEL_8:
      if (*((_BYTE *)&self->super.super.super.isa + *v4))
        result = 2;
      else
        result = 1;
      break;
    case 2u:
    case 3u:
      return self->super._screenEnabled;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:")), "mediaState");
    default:
LABEL_11:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)setupAudioStreamGroupWithStreamConfigs:(id)a3 negotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5
{
  BOOL v7;
  _BOOL4 v8;
  NSMutableArray *micStreamGroups;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t i;
  uint64_t v15;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
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
  VCSessionParticipantLocal *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:](self, "setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:", a3, a4, a5);
  if (v7)
  {
    v8 = -[VCSessionParticipant isPersonaCameraEnabled](self, "isPersonaCameraEnabled");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    micStreamGroups = self->super._micStreamGroups;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      v13 = !v8;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(micStreamGroups);
          if (self->super._videoEnabled)
            v15 = 0;
          else
            v15 = v13;
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "setCurrentDTXEnabled:", v15);
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      }
      while (v11);
    }
    -[VCSessionParticipantLocal updatePayloadTypesWithAudioConfigs:](self, "updatePayloadTypesWithAudioConfigs:", a3);
  }
  else if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v26 = v18;
        v27 = 2080;
        v28 = "-[VCSessionParticipantLocal setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:]";
        v29 = 1024;
        v30 = 508;
        v31 = 2112;
        v32 = v17;
        v33 = 2048;
        v34 = self;
        _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup audio streams", buf, 0x30u);
      }
    }
  }
  return v7;
}

- (BOOL)setupCameraStreamGroupWithStreamConfigs:(id)a3 negotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5
{
  _BOOL4 v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCSessionParticipantLocal *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = v12;
          v19 = 2080;
          v20 = "-[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:]";
          v21 = 1024;
          v22 = 524;
          v23 = 2112;
          v24 = v10;
          v25 = 2048;
          v26 = self;
          _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) No video streams to set up", (uint8_t *)&v17, 0x30u);
        }
      }
    }
    goto LABEL_4;
  }
  if (-[VCSessionParticipantLocal setupVideoStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:](self, "setupVideoStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:", a3, a4, a5))
  {
    -[VCSessionParticipantLocal updatePayloadTypesWithVideoConfigs:](self, "updatePayloadTypesWithVideoConfigs:", a3);
LABEL_4:
    LOBYTE(v9) = 1;
    return v9;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:].cold.2();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      v17 = 136316162;
      v18 = v14;
      v19 = 2080;
      v20 = "-[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:]";
      v21 = 1024;
      v22 = 526;
      v23 = 2112;
      v24 = v11;
      v25 = 2048;
      v26 = self;
      _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup video stream", (uint8_t *)&v17, 0x30u);
    }
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (void)setupSystemAudioCapture
{
  opaqueCMFormatDescription *v3;
  const AudioStreamBasicDescription *StreamBasicDescription;
  int processId;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[VCSessionParticipantLocal getAudioFormatDescriptionForStreamGroupID:](self, "getAudioFormatDescriptionForStreamGroupID:", 1835623282);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v3);
  *(_OWORD *)v6 = xmmword_1D910D868;
  memset(&v6[2], 170, 40);
  LODWORD(v6[0]) = -1;
  LODWORD(v7) = self->super._deviceRole;
  HIDWORD(v7) = 6;
  processId = self->super._processId;
  LODWORD(v8) = self->super._transportSessionID;
  HIDWORD(v8) = processId;
  LODWORD(v6[6]) = -[VCSessionParticipant preferredIOSamplesPerFrameForGroupID:](self, "preferredIOSamplesPerFrameForGroupID:", 1835623282, v6[0], *(_QWORD *)&StreamBasicDescription->mSampleRate, *(_QWORD *)&StreamBasicDescription->mFormatID, *(_QWORD *)&StreamBasicDescription->mBytesPerPacket, *(_QWORD *)&StreamBasicDescription->mBytesPerFrame, *(_QWORD *)&StreamBasicDescription->mBitsPerChannel, v6[6], v7, v8);
  self->_systemAudioCaptureSession = -[VCSystemAudioCaptureSession initWithConfiguration:]([VCSystemAudioCaptureSession alloc], "initWithConfiguration:", v6);
  CFRelease(v3);
}

- (int)captureSourceIDFromStreamGroupID:(unsigned int)a3
{
  int result;

  result = 4;
  if ((int)a3 > 1835623286)
  {
    if ((int)a3 > 1936290408)
    {
      if (a3 == 1936290409)
        return 7;
      if (a3 == 1937339233)
        return 5;
      return 0;
    }
    if (a3 != 1835623287)
      return a3 == 1935897189;
  }
  else
  {
    if ((int)a3 <= 1667330163)
    {
      if (a3 == 1667329381 || a3 == 1667329399)
        return 3;
      return 0;
    }
    if (a3 != 1667330164 && a3 != 1835623282)
      return 0;
  }
  return result;
}

- (int)captureSourceIDFromStreamGroupConfig:(id)a3
{
  void *v5;
  int result;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamGroupID"));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      -[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:].cold.1();
    }
    return 0;
  }
  result = -[VCSessionParticipantLocal captureSourceIDFromStreamGroupID:](self, "captureSourceIDFromStreamGroupID:", objc_msgSend(v5, "unsignedIntValue"));
  if (result)
    return result;
  v7 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamInputID"));
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      -[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:].cold.2();
    }
    return 0;
  }
  v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInputIDToCaptureSourceIDMap, "objectForKeyedSubscript:", v7);
  if (v8)
    return objc_msgSend(v8, "unsignedIntValue");
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    return 0;
  v9 = VRTraceErrorLogLevelToCSTR();
  result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (result)
  {
    -[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:].cold.3(v9);
    return 0;
  }
  return result;
}

- (BOOL)setupStreamGroupWithStreamGroupConfig:(id)a3 negotiatorConfig:(id)a4
{
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _BOOL4 v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  VCSessionParticipantLocal *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamGroupMediaType")), "unsignedIntValue");
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamGroupID")), "unsignedIntValue");
  v9 = -[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:](self, "captureSourceIDFromStreamGroupConfig:", a3);
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8)))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._participantStreamTokens, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", VCUniqueIDGenerator_GenerateID()), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
    if (v7 != 1986618469)
    {
      if (v7 == 1936684398)
      {
        if (!-[VCSessionParticipantLocal setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:](self, "setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamConfigurations")), a4, a3))goto LABEL_12;
        goto LABEL_9;
      }
      if (v7 != 1835365473)
        goto LABEL_12;
    }
    v10 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("streamConfigurations"));
    if ((_DWORD)v8 == 1667330164)
    {
      if (!-[VCSessionParticipantLocal setupCaptionsStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:](self, "setupCaptionsStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:", v10, a4, a3))
      {
LABEL_12:
        if ((VCSessionParticipantLocal *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v11)
              return v11;
            -[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:].cold.1();
          }
          goto LABEL_23;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v12 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v12 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v11)
            return v11;
          v23 = 136316162;
          v24 = v13;
          v25 = 2080;
          v26 = "-[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:]";
          v27 = 1024;
          v28 = 634;
          v29 = 2112;
          v30 = v12;
          v31 = 2048;
          v32 = self;
          v15 = " [%s] %s:%d %@(%p) Failed to setup stream";
          v16 = v14;
          v17 = 48;
          goto LABEL_22;
        }
        goto LABEL_23;
      }
    }
    else if (!-[VCSessionParticipantLocal setupVideoStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:](self, "setupVideoStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:", v10, a4, a3))
    {
      goto LABEL_12;
    }
LABEL_9:
    self->_forceMinBitrate = 0;
    self->_minBitrate = 2000000;
    LOBYTE(v11) = 1;
    return v11;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v11)
        return v11;
      -[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:].cold.2(v19);
    }
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v18 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v11)
      return v11;
    v23 = 136316418;
    v24 = v20;
    v25 = 2080;
    v26 = "-[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:]";
    v27 = 1024;
    v28 = 607;
    v29 = 2112;
    v30 = v18;
    v31 = 2048;
    v32 = self;
    v33 = 1024;
    v34 = v9;
    v15 = " [%s] %s:%d %@(%p) Stream token already assigned for captureSourceID=%d";
    v16 = v21;
    v17 = 54;
LABEL_22:
    _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, v17);
  }
LABEL_23:
  LOBYTE(v11) = 0;
  return v11;
}

- (BOOL)setupStreamGroupMediaSync
{
  _BOOL4 v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCSessionParticipantLocal;
  v3 = -[VCSessionParticipant setupStreamGroupMediaSync](&v5, sel_setupStreamGroupMediaSync);
  if (v3)
    LOBYTE(v3) = -[VCSessionParticipant setupMediaSyncForStreamGroup:](self, "setupMediaSyncForStreamGroup:", -[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup"));
  return v3;
}

- (BOOL)setupStreamGroupsWithConfig:(id)a3 negotiatorConfig:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  uint64_t v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_msgSend(a3, "streamGroupConfigurations");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      v12 = -[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:](self, "captureSourceIDFromStreamGroupConfig:", v11);
      if (v12 == 3)
      {
        if (objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("streamGroupID")), "unsignedIntValue") == 1667329381)
        {
          if (!-[VCSessionParticipantLocal setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:](self, "setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("streamConfigurations")), a4, v11))goto LABEL_20;
          goto LABEL_15;
        }
      }
      else if (v12 == 4
             && objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("streamGroupID")), "unsignedIntValue") == 1835623282)
      {
        if (!-[VCSessionParticipantLocal setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:](self, "setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:", objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("streamConfigurations")), a4, v11))goto LABEL_20;
        goto LABEL_15;
      }
      if (!-[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:](self, "setupStreamGroupWithStreamGroupConfig:negotiatorConfig:", v11, a4))
      {
LABEL_20:
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_23;
        v14 = VRTraceErrorLogLevelToCSTR();
        v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (v13)
        {
          -[VCSessionParticipantLocal setupStreamGroupsWithConfig:negotiatorConfig:].cold.2(v14);
          goto LABEL_23;
        }
        return v13;
      }
LABEL_15:
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  if (-[VCSessionParticipantLocal setupStreamGroupMediaSync](self, "setupStreamGroupMediaSync"))
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v13)
        return v13;
      -[VCSessionParticipantLocal setupStreamGroupsWithConfig:negotiatorConfig:].cold.1();
    }
LABEL_23:
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (BOOL)setupStreamInputsWithConfig:(id)a3
{
  NSMutableDictionary *v5;
  VCSessionParticipantLocal *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "streamInputConfigurations"), "count"));
  v6 = self;
  self->_streamInputIDToCaptureSourceIDMap = v5;
  if (v5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = (id)objc_msgSend(a3, "streamInputConfigurations");
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(obj);
          v11 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerStreamInputCaptureSourceWithConfiguration:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          if (!(_DWORD)v11)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCSessionParticipantLocal setupStreamInputsWithConfig:].cold.2();
            }
            goto LABEL_14;
          }
          v12 = v11;
          v13 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "streamInputIDForCaptureSourceID:", v11);
          v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_streamInputIDToCaptureSourceIDMap, "setObject:forKeyedSubscript:", v14, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13));
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
    return 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal setupStreamInputsWithConfig:].cold.1();
    }
LABEL_14:
    -[VCSessionParticipantLocal cleanupStreamInputs](v6, "cleanupStreamInputs");
    return 0;
  }
}

- (void)cleanupStreamInputs
{
  void *v3;
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
  v3 = (void *)-[NSMutableDictionary allValues](self->_streamInputIDToCaptureSourceIDMap, "allValues");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
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
        objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "unregisterStreamInputCaptureSourceWithCaptureSourceID:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "unsignedIntValue"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }

  self->_streamInputIDToCaptureSourceIDMap = 0;
}

- (void)start
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
  VCSessionParticipantLocal *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[VCDefaults forceFECRepairStream](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFECRepairStream"))
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_13;
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136315650;
      v13 = v4;
      v14 = 2080;
      v15 = "-[VCSessionParticipantLocal start]";
      v16 = 1024;
      v17 = 720;
      v6 = " [%s] %s:%d _enableRedundancy set to YES by forceFECRepairStream";
      v7 = v5;
      v8 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_13;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136316162;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCSessionParticipantLocal start]";
      v16 = 1024;
      v17 = 720;
      v18 = 2112;
      v19 = v3;
      v20 = 2048;
      v21 = self;
      v6 = " [%s] %s:%d %@(%p) _enableRedundancy set to YES by forceFECRepairStream";
      v7 = v10;
      v8 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
LABEL_13:
    -[VCSessionParticipantLocal enableRedundancy:](self, "enableRedundancy:", 1);
  }
  -[VCSessionParticipantLocal startVoiceActivityDetection](self, "startVoiceActivityDetection");
  self->_lastSentAudioHostTime = NAN;
  v11.receiver = self;
  v11.super_class = (Class)VCSessionParticipantLocal;
  -[VCSessionParticipant start](&v11, sel_start);
}

- (void)dispatchedStartOneToOneStreams
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 oneToOneModeEnabled;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  _BYTE v13[24];
  __int128 v14;
  VCSessionParticipantLocal *v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        oneToOneModeEnabled = self->super._oneToOneModeEnabled;
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v4;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCSessionParticipantLocal dispatchedStartOneToOneStreams]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 729;
        WORD2(v14) = 1024;
        *(_DWORD *)((char *)&v14 + 6) = oneToOneModeEnabled;
        v7 = " [%s] %s:%d Starting stream groups with oneToOneModeEnabled=%d";
        v8 = v5;
        v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v13, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->super._oneToOneModeEnabled;
        *(_DWORD *)v13 = 136316418;
        *(_QWORD *)&v13[4] = v10;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCSessionParticipantLocal dispatchedStartOneToOneStreams]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 729;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v3;
        HIWORD(v14) = 2048;
        v15 = self;
        LOWORD(v16) = 1024;
        *(_DWORD *)((char *)&v16 + 2) = v12;
        v7 = " [%s] %s:%d %@(%p) Starting stream groups with oneToOneModeEnabled=%d";
        v8 = v11;
        v9 = 54;
        goto LABEL_11;
      }
    }
  }
  -[VCSessionParticipantLocal startMultiwayStreams](self, "startMultiwayStreams", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16, v17);
}

- (void)stop
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCSessionParticipantLocal;
  -[VCSessionParticipant stop](&v3, sel_stop);
  -[VCSessionParticipantLocal reportVideoEnabledStatsWithVideoEnabled:](self, "reportVideoEnabledStatsWithVideoEnabled:", self->super._videoEnabled);
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

- (void)dispatchedSetAudioEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super *v5;
  unsigned int v6;
  objc_super v7;
  _QWORD v8[3];

  v3 = a3;
  v8[2] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  if (self->super._state == 1 && self->super._audioEnabled != v3)
  {
    v6 = -[VCAudioIO state](self->super._audioIO, "state");
    if (v3)
    {
      if (!v6)
        -[VCAudioIO start](self->super._audioIO, "start");
    }
    else if (v6)
    {
      -[VCAudioIO stop](self->super._audioIO, "stop");
    }
    v7.receiver = self;
    v5 = &v7;
  }
  else
  {
    v8[0] = self;
    v5 = (objc_super *)v8;
  }
  v5->super_class = (Class)VCSessionParticipantLocal;
  -[objc_super dispatchedSetAudioEnabled:](v5, sel_dispatchedSetAudioEnabled_, v3);
}

- (int)maxCaptureCameraFrameRate
{
  int v3;
  unsigned int v4;
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
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  VCSessionParticipantLocal *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (self->super._oneToOneModeEnabled)
  {
    if (objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1E9EF5438), "streamConfigs"), "count"))
    {
      v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1E9EF5438), "streamConfigs"), "objectAtIndexedSubscript:", 0), "framerate");
      goto LABEL_7;
    }
    v3 = +[VCHardwareSettings maxOneToOneFramerateSupported](VCHardwareSettings, "maxOneToOneFramerateSupported");
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v24 = 136315906;
          v25 = v16;
          v26 = 2080;
          v27 = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
          v28 = 1024;
          v29 = 775;
          v30 = 1024;
          LODWORD(v31) = v3;
          v18 = " [%s] %s:%d no oneToOneSettings video config found, use default maxFrameRate=%d";
          v19 = v17;
          v20 = 34;
LABEL_32:
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v24, v20);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v24 = 136316418;
          v25 = v21;
          v26 = 2080;
          v27 = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
          v28 = 1024;
          v29 = 775;
          v30 = 2112;
          v31 = v15;
          v32 = 2048;
          v33 = self;
          v34 = 1024;
          v35 = v3;
          v18 = " [%s] %s:%d %@(%p) no oneToOneSettings video config found, use default maxFrameRate=%d";
          v19 = v22;
          v20 = 54;
          goto LABEL_32;
        }
      }
    }
  }
  else
  {
    v4 = +[VCHardwareSettings maxMultiwayFramerateSupported](VCHardwareSettings, "maxMultiwayFramerateSupported");
    if (v4 >= 0x1E)
      v3 = 30;
    else
      v3 = v4;
  }
LABEL_7:
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      v8 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 136315906;
          v25 = v6;
          v26 = 2080;
          v27 = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
          v28 = 1024;
          v29 = 780;
          v30 = 1024;
          LODWORD(v31) = v3;
          v9 = " [%s] %s:%d maxFrameRate=%d";
          v10 = v7;
          v11 = 34;
LABEL_19:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v24, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCSessionParticipantLocal maxCaptureCameraFrameRate].cold.1(v6);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 136316418;
          v25 = v12;
          v26 = 2080;
          v27 = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
          v28 = 1024;
          v29 = 780;
          v30 = 2112;
          v31 = v5;
          v32 = 2048;
          v33 = self;
          v34 = 1024;
          v35 = v3;
          v9 = " [%s] %s:%d %@(%p) maxFrameRate=%d";
          v10 = v13;
          v11 = 54;
          goto LABEL_19;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v24 = 136316418;
        v25 = v12;
        v26 = 2080;
        v27 = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
        v28 = 1024;
        v29 = 780;
        v30 = 2112;
        v31 = v5;
        v32 = 2048;
        v33 = self;
        v34 = 1024;
        v35 = v3;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) maxFrameRate=%d", (uint8_t *)&v24, 0x36u);
      }
    }
  }
  return v3;
}

- (void)setUplinkBitrateCapCell:(unsigned int)a3
{
  uint64_t minBitrate;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
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
  VCSessionParticipantLocal *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  minBitrate = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
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
        v26 = "-[VCSessionParticipantLocal setUplinkBitrateCapCell:]";
        v27 = 1024;
        v28 = 785;
        v29 = 1024;
        LODWORD(v30) = minBitrate;
        v8 = " [%s] %s:%d Setting uplink bit rate cap cell is %d";
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
      v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
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
        v26 = "-[VCSessionParticipantLocal setUplinkBitrateCapCell:]";
        v27 = 1024;
        v28 = 785;
        v29 = 2112;
        v30 = v5;
        v31 = 2048;
        v32 = self;
        v33 = 1024;
        v34 = minBitrate;
        v8 = " [%s] %s:%d %@(%p) Setting uplink bit rate cap cell is %d";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  if (self->_forceMinBitrate)
    minBitrate = self->_minBitrate;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "updateUplinkBitrateCapCell:activeStreamIDs:", minBitrate, -[VCSessionUplinkBandwidthAllocator streamIDsForStreamToken:targetBitrateCap:](self->_uplinkBandwidthAllocator, "streamIDsForStreamToken:targetBitrateCap:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "streamToken"), minBitrate));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v15);
  }
  self->_uplinkBitrateCapCell = minBitrate;
}

- (void)setUplinkBitrateCapWifi:(unsigned int)a3
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
  void *v13;
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
  VCSessionParticipantLocal *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v3 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
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
        v26 = "-[VCSessionParticipantLocal setUplinkBitrateCapWifi:]";
        v27 = 1024;
        v28 = 798;
        v29 = 1024;
        LODWORD(v30) = v3;
        v8 = " [%s] %s:%d Setting uplink bit rate cap wifi is %d";
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
      v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
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
        v26 = "-[VCSessionParticipantLocal setUplinkBitrateCapWifi:]";
        v27 = 1024;
        v28 = 798;
        v29 = 2112;
        v30 = v5;
        v31 = 2048;
        v32 = self;
        v33 = 1024;
        v34 = v3;
        v8 = " [%s] %s:%d %@(%p) Setting uplink bit rate cap wifi is %d";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  if (self->_forceMinBitrate)
    self->_uplinkBitrateCapWifi = self->_minBitrate;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "updateUplinkBitrateCapWifi:activeStreamIDs:", v3, -[VCSessionUplinkBandwidthAllocator streamIDsForStreamToken:targetBitrateCap:](self->_uplinkBandwidthAllocator, "streamIDsForStreamToken:targetBitrateCap:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "streamToken"), v3));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v15);
  }
  self->_uplinkBitrateCapWifi = v3;
}

- (void)setEnableVADFiltering:(BOOL)a3
{
  self->_enableVADFiltering = a3;
  -[VCSessionParticipantLocal updateActiveVoiceOnly](self, "updateActiveVoiceOnly");
}

- (BOOL)reconfigureOneToOneAudioStream:(id)a3 error:(id *)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  int v18;
  int v19;
  __int128 v20;
  BOOL v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  const __CFString *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  VCAudioIO *audioIO;
  int deviceRole;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  uint64_t v42;
  NSObject *v43;
  VCAudioIO *v44;
  int v45;
  uint64_t v46;
  uint8_t v48[4];
  uint64_t v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  _BYTE v57[10];
  VCAudioIO *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  _BYTE buf[48];
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
  _QWORD v77[2];

  v77[1] = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 815;
        v10 = " [%s] %s:%d Updating videoEnabled on the oneToOne audio stream";
        v11 = v9;
        v12 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 815;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v7;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)&buf[40] = self;
        v10 = " [%s] %s:%d %@(%p) Updating videoEnabled on the oneToOne audio stream";
        v11 = v14;
        v12 = 48;
        goto LABEL_11;
      }
    }
  }
  v15 = -[VCSessionParticipant operatingMode](self, "operatingMode");
  v16 = (void *)objc_msgSend(a3, "defaultStreamConfig");
  if ((_DWORD)v15 == objc_msgSend(v16, "oneToOneOperatingMode"))
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 1;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 1;
      v25 = -[VCSessionParticipant dispatchedIsAnyCameraMediaTypeEnabled](self, "dispatchedIsAnyCameraMediaTypeEnabled");
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 819;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v15;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v25;
      v26 = " [%s] %s:%d OneToOne Audio Stream is already configured in mode %d for cameraEnabled=%{BOOL}d";
      v27 = v24;
      v28 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 1;
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 1;
      v31 = -[VCSessionParticipant dispatchedIsAnyCameraMediaTypeEnabled](self, "dispatchedIsAnyCameraMediaTypeEnabled");
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 819;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v17;
      *(_WORD *)&buf[38] = 2048;
      *(_QWORD *)&buf[40] = self;
      LOWORD(v66) = 1024;
      *(_DWORD *)((char *)&v66 + 2) = v15;
      WORD3(v66) = 1024;
      DWORD2(v66) = v31;
      v26 = " [%s] %s:%d %@(%p) OneToOne Audio Stream is already configured in mode %d for cameraEnabled=%{BOOL}d";
      v27 = v30;
      v28 = 60;
    }
    _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    return 1;
  }
  if (self->super._audioEnabled && !self->super._audioPaused && objc_msgSend(a3, "state") == 2)
  {
    objc_msgSend(a3, "stop");
    -[VCAudioIO stop](self->super._audioIO, "stop");
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v16, "setOneToOneOperatingMode:", v15);
  v77[0] = v16;
  v19 = objc_msgSend(a3, "setStreamConfig:withError:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 1), a4);
  if (!*a4 && v19)
  {
    *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v75 = v20;
    v76 = v20;
    v73 = v20;
    v74 = v20;
    v71 = v20;
    v72 = v20;
    v69 = v20;
    v70 = v20;
    v67 = v20;
    v68 = v20;
    *(_OWORD *)&buf[32] = v20;
    v66 = v20;
    *(_OWORD *)buf = v20;
    *(_OWORD *)&buf[16] = v20;
    -[VCSessionParticipantLocal audioIOConfigWithDeviceRole:operatingMode:](self, "audioIOConfigWithDeviceRole:operatingMode:", self->super._deviceRole, v15);
    v21 = -[VCAudioIO reconfigureWithConfig:](self->super._audioIO, "reconfigureWithConfig:", buf);
    if (v21)
    {
      if (v18)
      {
        objc_msgSend(a3, "start");
        -[VCAudioIO start](self->super._audioIO, "start");
      }
      return v21;
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_57;
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_57;
      audioIO = self->super._audioIO;
      deviceRole = self->super._deviceRole;
      *(_DWORD *)v48 = 136316674;
      v49 = v35;
      v50 = 2080;
      v51 = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
      v52 = 1024;
      v53 = 834;
      v54 = 2048;
      v55 = audioIO;
      v56 = 1024;
      *(_DWORD *)v57 = v15;
      *(_WORD *)&v57[4] = 1024;
      *(_DWORD *)&v57[6] = deviceRole;
      LOWORD(v58) = 1024;
      *(_DWORD *)((char *)&v58 + 2) = buf[20];
      v39 = " [%s] %s:%d Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
      v40 = v36;
      v41 = 56;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v32 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v32 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_57;
      v42 = VRTraceErrorLogLevelToCSTR();
      v43 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_57;
      v44 = self->super._audioIO;
      v45 = self->super._deviceRole;
      *(_DWORD *)v48 = 136317186;
      v49 = v42;
      v50 = 2080;
      v51 = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
      v52 = 1024;
      v53 = 834;
      v54 = 2112;
      v55 = (void *)v32;
      v56 = 2048;
      *(_QWORD *)v57 = self;
      *(_WORD *)&v57[8] = 2048;
      v58 = v44;
      v59 = 1024;
      v60 = v15;
      v61 = 1024;
      v62 = v45;
      v63 = 1024;
      v64 = buf[20];
      v39 = " [%s] %s:%d %@(%p) Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
      v40 = v43;
      v41 = 76;
    }
    _os_log_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEFAULT, v39, v48, v41);
LABEL_57:
    v46 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@. Unable to reconfigure _audioIO=%p in _state=%d"), -[VCObject logPrefix](self, "logPrefix"), self->super._audioIO, self->super._state);
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, v46);
    return v21;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCSessionParticipantLocal reconfigureOneToOneAudioStream:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 844;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v22;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)&buf[40] = self;
        _os_log_error_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) OneToOne Audio Stream was unable to be reconfigured", buf, 0x30u);
      }
    }
  }
  return 0;
}

- (BOOL)reconfigureAudioIOForMode:(int)a3 error:(id *)a4
{
  uint64_t v5;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  unsigned int v16;
  __int128 v17;
  BOOL v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  uint64_t v29;
  NSObject *v30;
  VCAudioIO *audioIO;
  int deviceRole;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  VCAudioIO *v38;
  int v39;
  uint64_t v40;
  uint8_t v42[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  _BYTE v51[10];
  VCAudioIO *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  _BYTE buf[48];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v5 = *(_QWORD *)&a3;
  v71 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 851;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v5;
        v10 = " [%s] %s:%d Updating videoEnabled on the local participant audioIO with newMode=%d";
        v11 = v9;
        v12 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 851;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v7;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)&buf[40] = self;
        LOWORD(v60) = 1024;
        *(_DWORD *)((char *)&v60 + 2) = v5;
        v10 = " [%s] %s:%d %@(%p) Updating videoEnabled on the local participant audioIO with newMode=%d";
        v11 = v14;
        v12 = 54;
        goto LABEL_11;
      }
    }
  }
  if (-[VCAudioIO operatingMode](self->super._audioIO, "operatingMode") == (_DWORD)v5)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 1;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 1;
      v22 = -[VCSessionParticipant dispatchedIsAnyCameraMediaTypeEnabled](self, "dispatchedIsAnyCameraMediaTypeEnabled");
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 854;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v5;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v22;
      v23 = " [%s] %s:%d OneToOne Audio Stream is already configured in mode %d for cameraEnabled=%{BOOL}d";
      v24 = v21;
      v25 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 1;
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 1;
      v28 = -[VCSessionParticipant dispatchedIsAnyCameraMediaTypeEnabled](self, "dispatchedIsAnyCameraMediaTypeEnabled");
      *(_DWORD *)buf = 136316674;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 854;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v15;
      *(_WORD *)&buf[38] = 2048;
      *(_QWORD *)&buf[40] = self;
      LOWORD(v60) = 1024;
      *(_DWORD *)((char *)&v60 + 2) = v5;
      WORD3(v60) = 1024;
      DWORD2(v60) = v28;
      v23 = " [%s] %s:%d %@(%p) OneToOne Audio Stream is already configured in mode %d for cameraEnabled=%{BOOL}d";
      v24 = v27;
      v25 = 60;
    }
    _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    return 1;
  }
  v16 = -[VCAudioIO state](self->super._audioIO, "state");
  if (v16 == 2)
    -[VCAudioIO stop](self->super._audioIO, "stop");
  *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v69 = v17;
  v70 = v17;
  v67 = v17;
  v68 = v17;
  v65 = v17;
  v66 = v17;
  v63 = v17;
  v64 = v17;
  v61 = v17;
  v62 = v17;
  *(_OWORD *)&buf[32] = v17;
  v60 = v17;
  *(_OWORD *)buf = v17;
  *(_OWORD *)&buf[16] = v17;
  -[VCSessionParticipantLocal audioIOConfigWithDeviceRole:operatingMode:](self, "audioIOConfigWithDeviceRole:operatingMode:", self->super._deviceRole, v5);
  v18 = -[VCAudioIO reconfigureWithConfig:](self->super._audioIO, "reconfigureWithConfig:", buf);
  if (v18)
  {
    if (v16 == 2)
      -[VCAudioIO start](self->super._audioIO, "start");
    return v18;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        audioIO = self->super._audioIO;
        deviceRole = self->super._deviceRole;
        *(_DWORD *)v42 = 136316674;
        v43 = v29;
        v44 = 2080;
        v45 = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
        v46 = 1024;
        v47 = 866;
        v48 = 2048;
        v49 = audioIO;
        v50 = 1024;
        *(_DWORD *)v51 = v5;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = deviceRole;
        LOWORD(v52) = 1024;
        *(_DWORD *)((char *)&v52 + 2) = buf[20];
        v33 = " [%s] %s:%d Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
        v34 = v30;
        v35 = 56;
LABEL_40:
        _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, v33, v42, v35);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v38 = self->super._audioIO;
        v39 = self->super._deviceRole;
        *(_DWORD *)v42 = 136317186;
        v43 = v36;
        v44 = 2080;
        v45 = "-[VCSessionParticipantLocal reconfigureAudioIOForMode:error:]";
        v46 = 1024;
        v47 = 866;
        v48 = 2112;
        v49 = (void *)v19;
        v50 = 2048;
        *(_QWORD *)v51 = self;
        *(_WORD *)&v51[8] = 2048;
        v52 = v38;
        v53 = 1024;
        v54 = v5;
        v55 = 1024;
        v56 = v39;
        v57 = 1024;
        v58 = buf[20];
        v33 = " [%s] %s:%d %@(%p) Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
        v34 = v37;
        v35 = 76;
        goto LABEL_40;
      }
    }
  }
  v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@. Unable to reconfigure _audioIO=%p in _state=%d"), -[VCObject logPrefix](self, "logPrefix"), self->super._audioIO, self->super._state);
  if (a4)
    *a4 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, v40);
  return v18;
}

- (id)startMicStreamGroups
{
  void *v3;
  NSMutableArray *micStreamGroups;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray mutableCopy](self->super._micStreamGroups, "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  micStreamGroups = self->super._micStreamGroups;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(micStreamGroups);
        if (self->super._oneToOneModeEnabled)
        {
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (!-[VCSessionParticipantLocal isOneToOneStreamGroup:](self, "isOneToOneStreamGroup:", objc_msgSend(v9, "streamGroupID")))objc_msgSend(v3, "removeObject:", v9);
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v6);
  }
  v10 = -[VCSessionParticipant startStreamGroups:](self, "startStreamGroups:", v3);

  return v10;
}

- (id)startCameraStreamGroups
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[VCSessionParticipant cameraGroups](self, "cameraGroups");
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        if (self->super._oneToOneModeEnabled)
        {
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (!-[VCSessionParticipantLocal isOneToOneStreamGroup:](self, "isOneToOneStreamGroup:", objc_msgSend(v9, "streamGroupID")))objc_msgSend(v4, "removeObject:", v9);
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v6);
  }
  v10 = -[VCSessionParticipant startStreamGroups:](self, "startStreamGroups:", v4);

  return v10;
}

- (id)applyVideoEnabledSetting:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[18];
  __int16 v33;
  _BYTE v34[14];
  uint64_t v35;

  v3 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  self->super._videoEnabled = a3;
  v5 = -[VCSessionParticipant updateStreamGroups:](self, "updateStreamGroups:", -[VCSessionParticipant cameraGroups](self, "cameraGroups"));
  if (v5)
  {
    v15 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal applyVideoEnabledSetting:].cold.1();
    }
  }
  else
  {
    v6 = -[VCSessionParticipantLocal applyMicReconfigurationForCameraTransition](self, "applyMicReconfigurationForCameraTransition");
    if (!v6)
    {
      if (self->super._state == 1)
      {
        if (v3)
          -[VCSessionParticipantLocal registerForVideoCapture:](self, "registerForVideoCapture:", self->_currentVideoCaptureFrameRate);
        else
          -[VCSessionParticipantLocal deregisterForVideoCapture](self, "deregisterForVideoCapture");
      }
      -[VCSessionParticipantLocal updateUplinkTargetBitrateForStreamGroups](self, "updateUplinkTargetBitrateForStreamGroups");
      -[VCSessionParticipantLocal reportVideoEnabledStatsWithVideoEnabled:](self, "reportVideoEnabledStatsWithVideoEnabled:", !v3);
      if ((VCSessionParticipantLocal *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          return 0;
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return 0;
        v25 = 136316162;
        v26 = v8;
        v27 = 2080;
        v28 = "-[VCSessionParticipantLocal applyVideoEnabledSetting:]";
        v29 = 1024;
        v30 = 938;
        v31 = 2112;
        *(_QWORD *)v32 = -[VCSessionParticipant description](self, "description");
        *(_WORD *)&v32[8] = 1024;
        *(_DWORD *)&v32[10] = v3;
        v10 = " [%s] %s:%d %@ videoEnabled[%d]";
        v11 = v9;
        v12 = 44;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          return 0;
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return 0;
        v25 = 136316674;
        v26 = v13;
        v27 = 2080;
        v28 = "-[VCSessionParticipantLocal applyVideoEnabledSetting:]";
        v29 = 1024;
        v30 = 938;
        v31 = 2112;
        *(_QWORD *)v32 = v7;
        *(_WORD *)&v32[8] = 2048;
        *(_QWORD *)&v32[10] = self;
        v33 = 2112;
        *(_QWORD *)v34 = -[VCSessionParticipant description](self, "description");
        *(_WORD *)&v34[8] = 1024;
        *(_DWORD *)&v34[10] = v3;
        v10 = " [%s] %s:%d %@(%p) %@ videoEnabled[%d]";
        v11 = v14;
        v12 = 64;
      }
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v25, v12);
      return 0;
    }
    v15 = v6;
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v25 = 136316162;
          v26 = v18;
          v27 = 2080;
          v28 = "-[VCSessionParticipantLocal applyVideoEnabledSetting:]";
          v29 = 1024;
          v30 = 923;
          v31 = 1024;
          *(_DWORD *)v32 = v3;
          *(_WORD *)&v32[4] = 2112;
          *(_QWORD *)&v32[6] = v15;
          v20 = " [%s] %s:%d Failed to apply audio reconfigure for videoEnabled=%d error=%@";
          v21 = v19;
          v22 = 44;
LABEL_33:
          _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v25, v22);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v25 = 136316674;
          v26 = v23;
          v27 = 2080;
          v28 = "-[VCSessionParticipantLocal applyVideoEnabledSetting:]";
          v29 = 1024;
          v30 = 923;
          v31 = 2112;
          *(_QWORD *)v32 = v17;
          *(_WORD *)&v32[8] = 2048;
          *(_QWORD *)&v32[10] = self;
          v33 = 1024;
          *(_DWORD *)v34 = v3;
          *(_WORD *)&v34[4] = 2112;
          *(_QWORD *)&v34[6] = v15;
          v20 = " [%s] %s:%d %@(%p) Failed to apply audio reconfigure for videoEnabled=%d error=%@";
          v21 = v24;
          v22 = 64;
          goto LABEL_33;
        }
      }
    }
  }
  return v15;
}

- (void)applyScreenEnabledSetting:(BOOL)a3
{
  _BOOL4 v3;
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
  NSString *p_isa;
  __int16 v21;
  VCSessionParticipantLocal *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  self->super._screenEnabled = a3;
  -[VCSessionParticipantLocal updateUplinkTargetBitrateForStreamGroups](self, "updateUplinkTargetBitrateForStreamGroups");
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316162;
        v14 = v6;
        v15 = 2080;
        v16 = "-[VCSessionParticipantLocal applyScreenEnabledSetting:]";
        v17 = 1024;
        v18 = 946;
        v19 = 2112;
        p_isa = -[VCSessionParticipant description](self, "description");
        v21 = 1024;
        LODWORD(v22) = v3;
        v8 = " [%s] %s:%d %@ screenEnabled[%d]";
        v9 = v7;
        v10 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316674;
        v14 = v11;
        v15 = 2080;
        v16 = "-[VCSessionParticipantLocal applyScreenEnabledSetting:]";
        v17 = 1024;
        v18 = 946;
        v19 = 2112;
        p_isa = &v5->isa;
        v21 = 2048;
        v22 = self;
        v23 = 2112;
        v24 = -[VCSessionParticipant description](self, "description");
        v25 = 1024;
        v26 = v3;
        v8 = " [%s] %s:%d %@(%p) %@ screenEnabled[%d]";
        v9 = v12;
        v10 = 64;
        goto LABEL_11;
      }
    }
  }
}

- (void)updateVideoPaused:(BOOL)a3
{
  _BOOL4 v3;
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
  VCSessionParticipantLocal *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)v13 = 136315906;
    *(_QWORD *)&v13[4] = v6;
    *(_WORD *)&v13[12] = 2080;
    *(_QWORD *)&v13[14] = "-[VCSessionParticipantLocal updateVideoPaused:]";
    *(_WORD *)&v13[22] = 1024;
    LODWORD(v14) = 950;
    WORD2(v14) = 1024;
    *(_DWORD *)((char *)&v14 + 6) = v3;
    v8 = " [%s] %s:%d Changing participant videoPaused to %d";
    v9 = v7;
    v10 = 34;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v5 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v13 = 136316418;
      *(_QWORD *)&v13[4] = v11;
      *(_WORD *)&v13[12] = 2080;
      *(_QWORD *)&v13[14] = "-[VCSessionParticipantLocal updateVideoPaused:]";
      *(_WORD *)&v13[22] = 1024;
      LODWORD(v14) = 950;
      WORD2(v14) = 2112;
      *(_QWORD *)((char *)&v14 + 6) = v5;
      HIWORD(v14) = 2048;
      v15 = self;
      LOWORD(v16) = 1024;
      *(_DWORD *)((char *)&v16 + 2) = v3;
      v8 = " [%s] %s:%d %@(%p) Changing participant videoPaused to %d";
      v9 = v12;
      v10 = 54;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
    }
  }
LABEL_12:
  self->super._videoPaused = v3;
  -[VCSessionParticipantLocal updateUplinkTargetBitrateForStreamGroups](self, "updateUplinkTargetBitrateForStreamGroups", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16, v17);
  if (v3)
    -[VCSessionParticipantLocal deregisterForVideoCapture](self, "deregisterForVideoCapture");
  else
    -[VCSessionParticipantLocal registerForVideoCapture:](self, "registerForVideoCapture:", self->_currentVideoCaptureFrameRate);
  -[VCSessionParticipantLocal updateAudioSpectrumState](self, "updateAudioSpectrumState");
}

- (void)updateActiveVoiceOnly
{
  NSMutableArray *micStreamGroups;
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
  micStreamGroups = self->super._micStreamGroups;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(micStreamGroups);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setVADFilteringEnabled:", self->_enableVADFiltering);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }
}

- (id)updateMediaState:(unsigned int)a3 forStreamGroups:(id)a4
{
  id v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCSessionParticipantLocal;
  v5 = -[VCSessionParticipant updateMediaState:forStreamGroups:](&v7, sel_updateMediaState_forStreamGroups_, *(_QWORD *)&a3, a4);
  if (!v5)
    -[VCSessionParticipantLocal dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:](self, "dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:", self->_currentUplinkTargetBitrate, self->_currentRateChangeCounter);
  return v5;
}

- (int)currentVideoCaptureFrameRate
{
  NSObject *participantQueue;
  int v3;
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
  v9 = -1431655766;
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCSessionParticipantLocal_currentVideoCaptureFrameRate__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(participantQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __57__VCSessionParticipantLocal_currentVideoCaptureFrameRate__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 920);
  return result;
}

- (void)setCurrentVideoCaptureFrameRate:(int)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__VCSessionParticipantLocal_setCurrentVideoCaptureFrameRate___block_invoke;
  block[3] = &unk_1E9E52300;
  v5 = a3;
  block[4] = self;
  dispatch_async(participantQueue, block);
}

void __61__VCSessionParticipantLocal_setCurrentVideoCaptureFrameRate___block_invoke(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  int v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  _DWORD *v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2 == *(_DWORD *)(v3 + 920))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(_DWORD *)(v6 + 920);
        LODWORD(v6) = *(_DWORD *)(v6 + 924);
        v8 = *(_DWORD *)(a1 + 40);
        v26 = 136316418;
        v27 = v4;
        v28 = 2080;
        v29 = "-[VCSessionParticipantLocal setCurrentVideoCaptureFrameRate:]_block_invoke";
        v30 = 1024;
        v31 = 994;
        v32 = 1024;
        v33 = v7;
        v34 = 1024;
        v35 = v6;
        v36 = 1024;
        v37 = v8;
        v9 = " [%s] %s:%d Ignoring the change of video captureFrameRate. currentVideoCaptureFrameRate %d maxSupportedMult"
             "iwayFrameRate %d framerate %d";
        v10 = v5;
        v11 = 46;
LABEL_23:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v26, v11);
      }
    }
  }
  else
  {
    v12 = *(_DWORD *)(v3 + 924);
    if ((int)v2 >= (int)v12)
      v13 = v12;
    else
      v13 = v2;
    *(_DWORD *)(v3 + 920) = v13;
    v14 = objc_msgSend(*(id *)(a1 + 32), "isEnabledMediaType:", 1);
    v15 = *(_DWORD **)(a1 + 32);
    if (v15[42] == 1 && v14 != 0)
    {
      objc_msgSend(v15, "deregisterForVideoCaptureAndStopProcessingAllMediaRecorderRequests:", 0);
      objc_msgSend(*(id *)(a1 + 32), "registerForVideoCapture:", v13);
      v15 = *(_DWORD **)(a1 + 32);
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v17 = (void *)objc_msgSend(v15, "cameraGroups");
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "setCaptureFrameRate:", v13);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
      }
      while (v19);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(a1 + 32);
        v25 = *(_DWORD *)(v24 + 924);
        LODWORD(v24) = *(_DWORD *)(v24 + 168);
        v26 = 136316674;
        v27 = v22;
        v28 = 2080;
        v29 = "-[VCSessionParticipantLocal setCurrentVideoCaptureFrameRate:]_block_invoke";
        v30 = 1024;
        v31 = 1007;
        v32 = 1024;
        v33 = v13;
        v34 = 1024;
        v35 = v25;
        v36 = 1024;
        v37 = v24;
        v38 = 1024;
        v39 = v14;
        v9 = " [%s] %s:%d Setting local capture rate, currentVideoCaptureFrameRate=%d fps, maxSupportedMultiwayCameraFram"
             "eRate=%d fps state=%d cameraMediaTypeEnabled=%{BOOL}d";
        v10 = v23;
        v11 = 52;
        goto LABEL_23;
      }
    }
  }
}

- (CGSize)captureEncodingSize
{
  _VCSessionParticipantLocalOneToOneSettings *p_oneToOneSettings;
  int64_t maxSupportedMultiwayVideoResolution;
  double v5;
  double v6;
  CGSize result;

  if (self->super._oneToOneModeEnabled
    && (p_oneToOneSettings = &self->_oneToOneSettings,
        objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1E9EF5438), "streamConfigs"), "count")))
  {
    maxSupportedMultiwayVideoResolution = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](p_oneToOneSettings->streamInfo, "objectForKeyedSubscript:", &unk_1E9EF5438), "streamConfigs"), "objectAtIndexedSubscript:", 0), "videoResolution");
  }
  else
  {
    maxSupportedMultiwayVideoResolution = self->_maxSupportedMultiwayVideoResolution;
  }
  +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", maxSupportedMultiwayVideoResolution);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)registerForVideoCapture:(int)a3
{
  uint64_t currentVideoCaptureFrameRate;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 videoEnabled;
  _BOOL4 videoPaused;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSObject *v38;
  VCVideoRule *v39;
  float v40;
  double v41;
  const __CFString *v42;
  uint64_t v43;
  NSObject *v44;
  objc_class *v45;
  NSString *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  uint64_t v50;
  NSObject *v51;
  objc_class *v52;
  NSString *v53;
  id v54;
  double v55;
  VideoAttributes *v56;
  const __CFString *v57;
  double v58;
  uint64_t v59;
  NSObject *v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  NSObject *v66;
  uint32_t v67;
  uint64_t v68;
  NSObject *v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _BYTE v74[24];
  _BYTE v75[72];
  _QWORD v76[4];
  _QWORD v77[6];

  v77[4] = *MEMORY[0x1E0C80C00];
  if (self->_videoCaptureSource != 3)
    return;
  currentVideoCaptureFrameRate = *(_QWORD *)&a3;
  if (self->super._videoEnabled && !self->super._videoPaused)
  {
    -[VCSessionParticipantLocal captureEncodingSize](self, "captureEncodingSize");
    v19 = v17;
    v20 = v18;
    if (self->super._sharingEnabled)
      currentVideoCaptureFrameRate = self->_currentVideoCaptureFrameRate;
    v21 = (int)v17;
    v22 = (int)v18;
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v74 = 136316418;
          *(_QWORD *)&v74[4] = v24;
          *(_WORD *)&v74[12] = 2080;
          *(_QWORD *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
          *(_WORD *)&v74[22] = 1024;
          *(_DWORD *)v75 = 1030;
          *(_WORD *)&v75[4] = 1024;
          *(_DWORD *)&v75[6] = v21;
          *(_WORD *)&v75[10] = 1024;
          *(_DWORD *)&v75[12] = v22;
          *(_WORD *)&v75[16] = 1024;
          *(_DWORD *)&v75[18] = currentVideoCaptureFrameRate;
          v26 = " [%s] %s:%d encodeSize=%dx%d, videoCaptureFrameRate=%d";
          v27 = v25;
          v28 = 46;
LABEL_27:
          _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, v74, v28);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v23 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v74 = 136316930;
          *(_QWORD *)&v74[4] = v29;
          *(_WORD *)&v74[12] = 2080;
          *(_QWORD *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
          *(_WORD *)&v74[22] = 1024;
          *(_DWORD *)v75 = 1030;
          *(_WORD *)&v75[4] = 2112;
          *(_QWORD *)&v75[6] = v23;
          *(_WORD *)&v75[14] = 2048;
          *(_QWORD *)&v75[16] = self;
          *(_WORD *)&v75[24] = 1024;
          *(_DWORD *)&v75[26] = v21;
          *(_WORD *)&v75[30] = 1024;
          *(_DWORD *)&v75[32] = v22;
          *(_WORD *)&v75[36] = 1024;
          *(_DWORD *)&v75[38] = currentVideoCaptureFrameRate;
          v26 = " [%s] %s:%d %@(%p) encodeSize=%dx%d, videoCaptureFrameRate=%d";
          v27 = v30;
          v28 = 66;
          goto LABEL_27;
        }
      }
    }
    if (!-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance", *(_OWORD *)v74, *(_QWORD *)&v74[16], *(_OWORD *)v75, *(_QWORD *)&v75[16], *(_OWORD *)&v75[24], *(_QWORD *)&v75[40]), "forceHWI"))goto LABEL_40;
    v21 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
    v22 = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
    currentVideoCaptureFrameRate = -[VCDefaults forceFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFramerate");
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v74 = 136316418;
          *(_QWORD *)&v74[4] = v32;
          *(_WORD *)&v74[12] = 2080;
          *(_QWORD *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
          *(_WORD *)&v74[22] = 1024;
          *(_DWORD *)v75 = 1036;
          *(_WORD *)&v75[4] = 1024;
          *(_DWORD *)&v75[6] = v21;
          *(_WORD *)&v75[10] = 1024;
          *(_DWORD *)&v75[12] = v22;
          *(_WORD *)&v75[16] = 1024;
          *(_DWORD *)&v75[18] = currentVideoCaptureFrameRate;
          v34 = " [%s] %s:%d forcing capture settings %dx%d@%d fps";
          v35 = v33;
          v36 = 46;
LABEL_39:
          _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, v34, v74, v36);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v31 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v31 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v37 = VRTraceErrorLogLevelToCSTR();
        v38 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v74 = 136316930;
          *(_QWORD *)&v74[4] = v37;
          *(_WORD *)&v74[12] = 2080;
          *(_QWORD *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
          *(_WORD *)&v74[22] = 1024;
          *(_DWORD *)v75 = 1036;
          *(_WORD *)&v75[4] = 2112;
          *(_QWORD *)&v75[6] = v31;
          *(_WORD *)&v75[14] = 2048;
          *(_QWORD *)&v75[16] = self;
          *(_WORD *)&v75[24] = 1024;
          *(_DWORD *)&v75[26] = v21;
          *(_WORD *)&v75[30] = 1024;
          *(_DWORD *)&v75[32] = v22;
          *(_WORD *)&v75[36] = 1024;
          *(_DWORD *)&v75[38] = currentVideoCaptureFrameRate;
          v34 = " [%s] %s:%d %@(%p) forcing capture settings %dx%d@%d fps";
          v35 = v38;
          v36 = 66;
          goto LABEL_39;
        }
      }
    }
LABEL_40:
    self->_currentVideoCaptureFrameRate = currentVideoCaptureFrameRate;

    v39 = [VCVideoRule alloc];
    v40 = (float)(int)currentVideoCaptureFrameRate;
    *(float *)&v41 = (float)(int)currentVideoCaptureFrameRate;
    self->_videoRule = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:](v39, "initWithFrameWidth:frameHeight:frameRate:", v21, v22, v41);
    if (!objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "isClientRegisteredForVideoFrames:fromSource:", self, self->_videoCaptureSource))
    {
      if ((objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerForVideoFramesFromSource:withClient:width:height:frameRate:", 3, self, v21, v22, currentVideoCaptureFrameRate) & 1) == 0)
      {
        -[VCSessionParticipant reportingAgent](self, "reportingAgent");
        v77[0] = &unk_1E9EF5480;
        v76[0] = CFSTR("SymptomReporterOptionalKeyCaptureSource");
        v76[1] = CFSTR("SymptomReporterOptionalKeyCaptureWidth");
        v77[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
        v76[2] = CFSTR("SymptomReporterOptionalKeyCaptureHeight");
        v77[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
        v76[3] = CFSTR("SymptomReporterOptionalKeyCaptureFrameRate");
        v77[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", currentVideoCaptureFrameRate);
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 4);
        reportingSymptom();
      }
LABEL_55:
      if (-[VCSessionParticipant operatingMode](self, "operatingMode", *(_QWORD *)v74, *(_OWORD *)&v74[8], *(_OWORD *)v75, *(_QWORD *)&v75[16]) == 6)
      {
        v56 = objc_alloc_init(VideoAttributes);
        -[VideoAttributes setOrientation:](v56, "setOrientation:", 0);
        -[VideoAttributes setRatio:](v56, "setRatio:", v19, v20);
        VCMediaRecorder_UpdateTargetScreenAttributes((uint64_t)self->super._mediaRecorder, (uint64_t)v56);

      }
      if ((VCSessionParticipantLocal *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_68;
        v59 = VRTraceErrorLogLevelToCSTR();
        v60 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_68;
        v61 = -[VCSessionParticipant operatingMode](self, "operatingMode");
        -[VideoAttributes ratio](-[VCMediaRecorder targetScreenAttributes](self->super._mediaRecorder, "targetScreenAttributes"), "ratio");
        v63 = v62;
        -[VideoAttributes ratio](-[VCMediaRecorder targetScreenAttributes](self->super._mediaRecorder, "targetScreenAttributes"), "ratio");
        *(_DWORD *)v74 = 136316930;
        *(_QWORD *)&v74[4] = v59;
        *(_WORD *)&v74[12] = 2080;
        *(_QWORD *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
        *(_WORD *)&v74[22] = 1024;
        *(_DWORD *)v75 = 1075;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v61;
        *(_WORD *)&v75[10] = 2048;
        *(double *)&v75[12] = v19;
        *(_WORD *)&v75[20] = 2048;
        *(double *)&v75[22] = v20;
        *(_WORD *)&v75[30] = 2048;
        *(_QWORD *)&v75[32] = v63;
        *(_WORD *)&v75[40] = 2048;
        *(_QWORD *)&v75[42] = v64;
        v65 = " [%s] %s:%d operatingMode=%d, encodingSize=%3fx%3f, _mediaRecorder.targetScreenAttributes=%3fx%3f";
        v66 = v60;
        v67 = 74;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v57 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v57 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_68;
        v68 = VRTraceErrorLogLevelToCSTR();
        v69 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_68;
        v70 = -[VCSessionParticipant operatingMode](self, "operatingMode");
        -[VideoAttributes ratio](-[VCMediaRecorder targetScreenAttributes](self->super._mediaRecorder, "targetScreenAttributes"), "ratio");
        v72 = v71;
        -[VideoAttributes ratio](-[VCMediaRecorder targetScreenAttributes](self->super._mediaRecorder, "targetScreenAttributes"), "ratio");
        *(_DWORD *)v74 = 136317442;
        *(_QWORD *)&v74[4] = v68;
        *(_WORD *)&v74[12] = 2080;
        *(_QWORD *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
        *(_WORD *)&v74[22] = 1024;
        *(_DWORD *)v75 = 1075;
        *(_WORD *)&v75[4] = 2112;
        *(_QWORD *)&v75[6] = v57;
        *(_WORD *)&v75[14] = 2048;
        *(_QWORD *)&v75[16] = self;
        *(_WORD *)&v75[24] = 1024;
        *(_DWORD *)&v75[26] = v70;
        *(_WORD *)&v75[30] = 2048;
        *(double *)&v75[32] = v19;
        *(_WORD *)&v75[40] = 2048;
        *(double *)&v75[42] = v20;
        *(_WORD *)&v75[50] = 2048;
        *(_QWORD *)&v75[52] = v72;
        *(_WORD *)&v75[60] = 2048;
        *(_QWORD *)&v75[62] = v73;
        v65 = " [%s] %s:%d %@(%p) operatingMode=%d, encodingSize=%3fx%3f, _mediaRecorder.targetScreenAttributes=%3fx%3f";
        v66 = v69;
        v67 = 94;
      }
      _os_log_impl(&dword_1D8A54000, v66, OS_LOG_TYPE_DEFAULT, v65, v74, v67);
LABEL_68:
      *(float *)&v58 = v40;
      -[VCMediaRecorder setFrameRate:](self->super._mediaRecorder, "setFrameRate:", v58, *(_QWORD *)v74, *(_OWORD *)&v74[8], *(_OWORD *)v75, *(_QWORD *)&v75[16], *(_QWORD *)&v75[24], *(_OWORD *)&v75[32], *(_OWORD *)&v75[48], *(_QWORD *)&v75[64]);
      return;
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_54;
      v43 = VRTraceErrorLogLevelToCSTR();
      v44 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      v45 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v45);
      *(_DWORD *)v74 = 136316162;
      *(_QWORD *)&v74[4] = v43;
      *(_WORD *)&v74[12] = 2080;
      *(_QWORD *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
      *(_WORD *)&v74[22] = 1024;
      *(_DWORD *)v75 = 1044;
      *(_WORD *)&v75[4] = 2112;
      *(_QWORD *)&v75[6] = v46;
      *(_WORD *)&v75[14] = 2048;
      *(_QWORD *)&v75[16] = self;
      v47 = " [%s] %s:%d %@ %p already registered for capture";
      v48 = v44;
      v49 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v42 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v42 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_54;
      v50 = VRTraceErrorLogLevelToCSTR();
      v51 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      v52 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v52);
      *(_DWORD *)v74 = 136316674;
      *(_QWORD *)&v74[4] = v50;
      *(_WORD *)&v74[12] = 2080;
      *(_QWORD *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
      *(_WORD *)&v74[22] = 1024;
      *(_DWORD *)v75 = 1044;
      *(_WORD *)&v75[4] = 2112;
      *(_QWORD *)&v75[6] = v42;
      *(_WORD *)&v75[14] = 2048;
      *(_QWORD *)&v75[16] = self;
      *(_WORD *)&v75[24] = 2112;
      *(_QWORD *)&v75[26] = v53;
      *(_WORD *)&v75[34] = 2048;
      *(_QWORD *)&v75[36] = self;
      v47 = " [%s] %s:%d %@(%p) %@ %p already registered for capture";
      v48 = v51;
      v49 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v48, OS_LOG_TYPE_DEFAULT, v47, v74, v49);
LABEL_54:
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton", *(_QWORD *)v74, *(_OWORD *)&v74[8], *(_OWORD *)v75, *(_QWORD *)&v75[16], *(_QWORD *)&v75[24], *(_OWORD *)&v75[32]), "setCaptureWidth:height:rate:forced:", v21, v22, currentVideoCaptureFrameRate, 0);
    v54 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton");
    *(float *)&v55 = (float)(int)currentVideoCaptureFrameRate;
    objc_msgSend(v54, "updateCaptureRuleForClient:width:height:frameRate:", self, v21, v22, v55);
    goto LABEL_55;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        videoEnabled = self->super._videoEnabled;
        videoPaused = self->super._videoPaused;
        *(_DWORD *)v74 = 136316418;
        *(_QWORD *)&v74[4] = v6;
        *(_WORD *)&v74[12] = 2080;
        *(_QWORD *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
        *(_WORD *)&v74[22] = 1024;
        *(_DWORD *)v75 = 1022;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = videoEnabled;
        *(_WORD *)&v75[10] = 1024;
        *(_DWORD *)&v75[12] = videoPaused;
        *(_WORD *)&v75[16] = 1024;
        *(_DWORD *)&v75[18] = currentVideoCaptureFrameRate;
        v10 = " [%s] %s:%d Cannot register due to videoEnabled=%d videoPaused=%d (caching frame rate=%d)";
        v11 = v7;
        v12 = 46;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v74, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = self->super._videoEnabled;
        v16 = self->super._videoPaused;
        *(_DWORD *)v74 = 136316930;
        *(_QWORD *)&v74[4] = v13;
        *(_WORD *)&v74[12] = 2080;
        *(_QWORD *)&v74[14] = "-[VCSessionParticipantLocal registerForVideoCapture:]";
        *(_WORD *)&v74[22] = 1024;
        *(_DWORD *)v75 = 1022;
        *(_WORD *)&v75[4] = 2112;
        *(_QWORD *)&v75[6] = v5;
        *(_WORD *)&v75[14] = 2048;
        *(_QWORD *)&v75[16] = self;
        *(_WORD *)&v75[24] = 1024;
        *(_DWORD *)&v75[26] = v15;
        *(_WORD *)&v75[30] = 1024;
        *(_DWORD *)&v75[32] = v16;
        *(_WORD *)&v75[36] = 1024;
        *(_DWORD *)&v75[38] = currentVideoCaptureFrameRate;
        v10 = " [%s] %s:%d %@(%p) Cannot register due to videoEnabled=%d videoPaused=%d (caching frame rate=%d)";
        v11 = v14;
        v12 = 66;
        goto LABEL_14;
      }
    }
  }
}

- (void)deregisterForVideoCaptureAndStopProcessingAllMediaRecorderRequests:(BOOL)a3
{
  _BOOL4 v3;

  if (self->_videoCaptureSource == 3)
  {
    v3 = a3;
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 3, self);
    VCMediaRecorder_ClearHistoryBuffer((uint64_t)self->super._mediaRecorder);
    if (v3)
      VCMediaRecorder_StopProcessingAllRequests((uint64_t)self->super._mediaRecorder);
  }
}

- (void)deregisterForVideoCapture
{
  -[VCSessionParticipantLocal deregisterForVideoCaptureAndStopProcessingAllMediaRecorderRequests:](self, "deregisterForVideoCaptureAndStopProcessingAllMediaRecorderRequests:", 1);
}

- (void)resetOneToOneSettings
{
  _VCSessionParticipantLocalOneToOneSettings *p_oneToOneSettings;

  p_oneToOneSettings = &self->_oneToOneSettings;
  -[NSMutableDictionary removeAllObjects](self->_oneToOneSettings.streamInfo, "removeAllObjects");
  p_oneToOneSettings->endToEndConnectionReceived = 0;
}

- (void)suspendStreamsOnOneToOneModeSwitch
{
  NSObject *participantQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__VCSessionParticipantLocal_suspendStreamsOnOneToOneModeSwitch__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(participantQueue, v3);
}

void __63__VCSessionParticipantLocal_suspendStreamsOnOneToOneModeSwitch__block_invoke(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_DWORD **)(a1 + 32);
  if (v2[42] == 1)
  {
    objc_msgSend(v2, "deregisterForVideoCapture");
    if (objc_msgSend(*(id *)(a1 + 32), "stopMultiwayStreams"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __63__VCSessionParticipantLocal_suspendStreamsOnOneToOneModeSwitch__block_invoke_cold_1(v3);
      }
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v4 + 408))
      {
        objc_msgSend((id)v4, "resetOneToOneSettings");
        v4 = *(_QWORD *)(a1 + 32);
      }
      *(_DWORD *)(v4 + 568) = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 572) = 0;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
    }
  }
}

- (void)resumeStreamsOnOneToOneModeSwitch
{
  NSObject *participantQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__VCSessionParticipantLocal_resumeStreamsOnOneToOneModeSwitch__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_sync(participantQueue, v3);
}

uint64_t __62__VCSessionParticipantLocal_resumeStreamsOnOneToOneModeSwitch__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(result + 168))
  {
    if (*(_BYTE *)(result + 408))
      v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 960), "objectForKeyedSubscript:", &unk_1E9EF5438), "streamConfigs"), "objectAtIndexedSubscript:", 0), "framerate");
    else
      v3 = objc_msgSend((id)result, "maxCaptureCameraFrameRate");
    objc_msgSend(*(id *)(a1 + 32), "startMultiwayStreams");
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 924) = v3;
    result = objc_msgSend(*(id *)(a1 + 32), "registerForVideoCapture:", v3);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 379) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 377);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 378) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 376);
  }
  return result;
}

- (void)setRemoteParticipants:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCSessionParticipantLocal_setRemoteParticipants___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(participantQueue, block);
}

void __51__VCSessionParticipantLocal_setRemoteParticipants___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  _BYTE v17[24];
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v17 = 136315650;
        *(_QWORD *)&v17[4] = v3;
        *(_WORD *)&v17[12] = 2080;
        *(_QWORD *)&v17[14] = "-[VCSessionParticipantLocal setRemoteParticipants:]_block_invoke";
        *(_WORD *)&v17[22] = 1024;
        LODWORD(v18) = 1150;
        v5 = " [%s] %s:%d ";
        v6 = v4;
        v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v5, v17, v7);
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
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v17 = 136316162;
        *(_QWORD *)&v17[4] = v8;
        *(_WORD *)&v17[12] = 2080;
        *(_QWORD *)&v17[14] = "-[VCSessionParticipantLocal setRemoteParticipants:]_block_invoke";
        *(_WORD *)&v17[22] = 1024;
        LODWORD(v18) = 1150;
        WORD2(v18) = 2112;
        *(_QWORD *)((char *)&v18 + 6) = v2;
        HIWORD(v18) = 2048;
        v19 = v10;
        v5 = " [%s] %s:%d %@(%p) ";
        v6 = v9;
        v7 = 48;
        goto LABEL_11;
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 379) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 377);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 378) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 376);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1064) = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1072) = (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "count") > 1;
  v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "streamGroupWithID:", 1835623282, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18, v19);
  v12 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1072);
  objc_msgSend(v11, "updateVoiceActivityEnabled:isMediaPriorityEnabled:", v12, v12);
  v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "streamGroupWithID:", 1835623287);
  v14 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1072);
  objc_msgSend(v13, "updateVoiceActivityEnabled:isMediaPriorityEnabled:", v14, v14);
  if (objc_msgSend(*(id *)(a1 + 32), "updateStreamGroups:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "allValues")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __51__VCSessionParticipantLocal_setRemoteParticipants___block_invoke_cold_1(v15);
    }
  }
  else
  {
    v16 = *(_DWORD **)(a1 + 32);
    if (v16[142])
      objc_msgSend(v16, "updateUplinkTargetBitrateForStreamGroups");
  }
}

- (void)startMultiwayStreams
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)&v3[14] = "-[VCSessionParticipantLocal startMultiwayStreams]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to set mode=%d for stream groups", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal startMultiwayStreams]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

uint64_t __49__VCSessionParticipantLocal_startMultiwayStreams__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didStart:error:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VCSessionParticipantLocal_setOneToOneModeEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  v5 = a3;
  block[4] = self;
  dispatch_sync(participantQueue, block);
}

void __52__VCSessionParticipantLocal_setOneToOneModeEnabled___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  int v7;
  int ErrorLogLevelForModule;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 == *(unsigned __int8 *)(v2 + 408))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v3;
        v14 = 2080;
        v15 = "-[VCSessionParticipantLocal setOneToOneModeEnabled:]_block_invoke";
        v16 = 1024;
        v17 = 1199;
        v5 = " [%s] %s:%d We are already in the correct OneToOne mode";
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v12, 0x1Cu);
      }
    }
  }
  else
  {
    *(_BYTE *)(v2 + 408) = v1;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 552) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "objectAtIndexedSubscript:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 408));
    v7 = *(unsigned __int8 *)(a1 + 40);
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v7)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315650;
          v13 = v9;
          v14 = 2080;
          v15 = "-[VCSessionParticipantLocal setOneToOneModeEnabled:]_block_invoke";
          v16 = 1024;
          v17 = 1209;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Switching into oneToOne mode", (uint8_t *)&v12, 0x1Cu);
        }
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 568) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 976);
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 572) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 980);
    }
    else if (ErrorLogLevelForModule >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315650;
        v13 = v11;
        v14 = 2080;
        v15 = "-[VCSessionParticipantLocal setOneToOneModeEnabled:]_block_invoke";
        v16 = 1024;
        v17 = 1215;
        v5 = " [%s] %s:%d Switching out of oneToOne mode";
        goto LABEL_13;
      }
    }
  }
}

- (BOOL)isOneToOneModeEnabled
{
  NSObject *participantQueue;
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
  v9 = -86;
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VCSessionParticipantLocal_isOneToOneModeEnabled__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(participantQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__VCSessionParticipantLocal_isOneToOneModeEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 408);
  return result;
}

- (void)stopVideoCaptureClient
{
  if (self->super._videoEnabled)
    -[VCSessionParticipantLocal deregisterForVideoCapture](self, "deregisterForVideoCapture");
}

- (BOOL)setState:(unsigned int)a3
{
  unsigned int v5;
  BOOL v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCSessionParticipantLocal;
  v5 = -[VCSessionParticipant setState:](&v8, sel_setState_);
  v6 = v5;
  if (a3 == 1 && v5)
  {
    if (self->_currentUplinkTargetBitrate)
      -[VCSessionParticipantLocal updateUplinkTargetBitrateForStreamGroups](self, "updateUplinkTargetBitrateForStreamGroups");
    if (self->super._videoEnabled)
      -[VCSessionParticipantLocal registerForVideoCapture:](self, "registerForVideoCapture:", self->_currentVideoCaptureFrameRate);
  }
  return v6;
}

- (void)startSystemAudioCapture
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  _BYTE v11[24];
  __int128 v12;
  VCSessionParticipantLocal *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136315650;
        *(_QWORD *)&v11[4] = v4;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCSessionParticipantLocal startSystemAudioCapture]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 1259;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v11 = 136316162;
        *(_QWORD *)&v11[4] = v9;
        *(_WORD *)&v11[12] = 2080;
        *(_QWORD *)&v11[14] = "-[VCSessionParticipantLocal startSystemAudioCapture]";
        *(_WORD *)&v11[22] = 1024;
        LODWORD(v12) = 1259;
        WORD2(v12) = 2112;
        *(_QWORD *)((char *)&v12 + 6) = v3;
        HIWORD(v12) = 2048;
        v13 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  -[VCSystemAudioCaptureSession start](self->_systemAudioCaptureSession, "start", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12, v13);
  self->_isMixingSystemAudio = 1;
}

- (void)stopSystemAudioCapture
{
  _BOOL4 isMixingSystemAudio;
  VCSessionParticipantLocal *v4;
  const __CFString *v5;
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
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  _BYTE v21[24];
  __int128 v22;
  VCSessionParticipantLocal *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  isMixingSystemAudio = self->_isMixingSystemAudio;
  v4 = (VCSessionParticipantLocal *)objc_opt_class();
  if (isMixingSystemAudio)
  {
    if (v4 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_16;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      *(_DWORD *)v21 = 136315650;
      *(_QWORD *)&v21[4] = v7;
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "-[VCSessionParticipantLocal stopSystemAudioCapture]";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1266;
      v9 = " [%s] %s:%d stopping";
      v10 = v8;
      v11 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_16;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      *(_DWORD *)v21 = 136316162;
      *(_QWORD *)&v21[4] = v12;
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "-[VCSessionParticipantLocal stopSystemAudioCapture]";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1266;
      WORD2(v22) = 2112;
      *(_QWORD *)((char *)&v22 + 6) = v5;
      HIWORD(v22) = 2048;
      v23 = self;
      v9 = " [%s] %s:%d %@(%p) stopping";
      v10 = v13;
      v11 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v21, v11);
LABEL_16:
    -[VCSystemAudioCaptureSession stop](self->_systemAudioCaptureSession, "stop", *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, v23);
    goto LABEL_17;
  }
  if (v4 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 136315650;
        *(_QWORD *)&v21[4] = v14;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "-[VCSessionParticipantLocal stopSystemAudioCapture]";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 1269;
        v16 = " [%s] %s:%d ignore";
        v17 = v15;
        v18 = 28;
LABEL_25:
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, v21, v18);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v21 = 136316162;
        *(_QWORD *)&v21[4] = v19;
        *(_WORD *)&v21[12] = 2080;
        *(_QWORD *)&v21[14] = "-[VCSessionParticipantLocal stopSystemAudioCapture]";
        *(_WORD *)&v21[22] = 1024;
        LODWORD(v22) = 1269;
        WORD2(v22) = 2112;
        *(_QWORD *)((char *)&v22 + 6) = v6;
        HIWORD(v22) = 2048;
        v23 = self;
        v16 = " [%s] %s:%d %@(%p) ignore";
        v17 = v20;
        v18 = 48;
        goto LABEL_25;
      }
    }
  }
LABEL_17:
  self->_isMixingSystemAudio = 0;
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
  block[2] = __56__VCSessionParticipantLocal_collectVideoChannelMetrics___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __56__VCSessionParticipantLocal_collectVideoChannelMetrics___block_invoke(uint64_t a1)
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
  block[2] = __56__VCSessionParticipantLocal_collectAudioChannelMetrics___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __56__VCSessionParticipantLocal_collectAudioChannelMetrics___block_invoke(uint64_t a1)
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

- (__CFString)activeStreamKeys
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
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
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8++), "activeStreamKeys"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v6);
  }
  v9 = (__CFString *)objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));

  return v9;
}

- (unsigned)calculateUplinkTotalBitrateForMediaStreams:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t i;
  _BOOL4 enableRedundancy;
  void *v11;
  int v12;
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
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(a3);
      enableRedundancy = self->_enableRedundancy;
      v11 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "defaultStreamConfig"), "multiwayConfig");
      if (enableRedundancy)
        v12 = objc_msgSend(v11, "repairedMaxNetworkBitrate");
      else
        v12 = objc_msgSend(v11, "maxNetworkBitrate");
      v7 += v12;
    }
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  }
  while (v6);
  return v7;
}

+ (BOOL)isCameraEnabledWithMediaStates:(id)a3
{
  return objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1E9EF5450), "unsignedIntValue")|| objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1E9EF5468), "unsignedIntValue")|| objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1E9EF5498), "unsignedIntValue")|| objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", &unk_1E9EF54B0), "unsignedIntValue") != 0;
}

- (id)applyMicReconfigurationForCameraTransition
{
  _BOOL4 v3;
  uint64_t v4;
  BOOL v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSMutableArray *micStreamGroups;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t i;
  void *v20;
  void *v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BYTE v35[10];
  VCSessionParticipantLocal *v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v3 = -[VCSessionParticipant dispatchedIsAnyCameraMediaTypeEnabled](self, "dispatchedIsAnyCameraMediaTypeEnabled");
  v4 = -[VCSessionParticipant operatingMode](self, "operatingMode");
  if (self->super._oneToOneModeEnabled)
  {
    if (self->super._audioIO)
    {
      v5 = -[VCSessionParticipantLocal reconfigureAudioIOForMode:error:](self, "reconfigureAudioIOForMode:error:", v4, &v22);
      if (v22 || !v5)
      {
        if ((VCSessionParticipantLocal *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_14;
          v7 = VRTraceErrorLogLevelToCSTR();
          v8 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_14;
          *(_DWORD *)buf = 136316162;
          v29 = v7;
          v30 = 2080;
          v31 = "-[VCSessionParticipantLocal applyMicReconfigurationForCameraTransition]";
          v32 = 1024;
          v33 = 1334;
          v34 = 1024;
          *(_DWORD *)v35 = v3;
          *(_WORD *)&v35[4] = 1024;
          *(_DWORD *)&v35[6] = v4;
          v9 = " [%s] %s:%d Failed to update videoEnabled=%d on the audio stream with operatingMode=%d - stopping call";
          v10 = v8;
          v11 = 40;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v6 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v6 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_14;
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_14;
          *(_DWORD *)buf = 136316674;
          v29 = v12;
          v30 = 2080;
          v31 = "-[VCSessionParticipantLocal applyMicReconfigurationForCameraTransition]";
          v32 = 1024;
          v33 = 1334;
          v34 = 2112;
          *(_QWORD *)v35 = v6;
          *(_WORD *)&v35[8] = 2048;
          v36 = self;
          v37 = 1024;
          v38 = v3;
          v39 = 1024;
          v40 = v4;
          v9 = " [%s] %s:%d %@(%p) Failed to update videoEnabled=%d on the audio stream with operatingMode=%d - stopping call";
          v10 = v13;
          v11 = 60;
        }
        _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v9, buf, v11);
LABEL_14:
        -[VCSessionParticipantLocal stop](self, "stop");
      }
    }
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  micStreamGroups = self->super._micStreamGroups;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    v18 = !v3;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(micStreamGroups);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v20, "setCurrentDTXEnabled:", v18);
        objc_msgSend(v20, "setDeviceRole:operatingMode:", self->super._deviceRole, v4);
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    }
    while (v16);
  }
  -[VCSessionParticipantLocal updateAudioSpectrumState](self, "updateAudioSpectrumState");
  return v22;
}

- (void)updateMediaSettingsWithConfig:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VCSessionParticipantLocal_updateMediaSettingsWithConfig___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(participantQueue, block);
}

uint64_t __59__VCSessionParticipantLocal_updateMediaSettingsWithConfig___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  int v9;
  unsigned __int8 *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(*(_QWORD *)(result + 32) + 168))
  {
    v1 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v2 = VRTraceErrorLogLevelToCSTR();
      v3 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v4 = *(_QWORD *)(v1 + 40);
        v11 = 136315906;
        v12 = v2;
        v13 = 2080;
        v14 = "-[VCSessionParticipantLocal updateMediaSettingsWithConfig:]_block_invoke";
        v15 = 1024;
        v16 = 1352;
        v17 = 2112;
        v18 = v4;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Updating local media settings with config :%@", (uint8_t *)&v11, 0x26u);
      }
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 373) = objc_msgSend(*(id *)(v1 + 40), "audioEnabled");
    v5 = objc_msgSend(*(id *)(v1 + 40), "videoEnabled");
    v6 = *(unsigned __int8 **)(v1 + 32);
    if (v6[374] == v5)
    {
      v7 = objc_msgSend(*(id *)(v1 + 32), "dispatchedIsAnyCameraMediaTypeEnabled");
      v8 = v7 ^ +[VCSessionParticipantLocal isCameraEnabledWithMediaStates:](VCSessionParticipantLocal, "isCameraEnabledWithMediaStates:", objc_msgSend(*(id *)(v1 + 40), "mediaStates"));
    }
    else
    {
      objc_msgSend(v6, "applyVideoEnabledSetting:", objc_msgSend(*(id *)(v1 + 40), "videoEnabled"));
      v8 = 0;
    }
    v9 = objc_msgSend(*(id *)(v1 + 40), "screenEnabled");
    v10 = *(unsigned __int8 **)(v1 + 32);
    if (v10[375] != v9)
      objc_msgSend(v10, "applyScreenEnabledSetting:", objc_msgSend(*(id *)(v1 + 40), "screenEnabled"));
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 376) = objc_msgSend(*(id *)(v1 + 40), "audioPaused");
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 377) = objc_msgSend(*(id *)(v1 + 40), "videoPaused");
    objc_msgSend(*(id *)(v1 + 40), "volume");
    objc_msgSend(*(id *)(v1 + 32), "setVolume:");
    objc_msgSend(*(id *)(v1 + 32), "setMuted:", objc_msgSend(*(id *)(v1 + 40), "audioMuted"));
    result = objc_msgSend(*(id *)(v1 + 32), "updateMediaStatesWithConfig:", *(_QWORD *)(v1 + 40));
    if (v8)
      return objc_msgSend(*(id *)(v1 + 32), "applyMicReconfigurationForCameraTransition");
  }
  return result;
}

- (tagVCAudioIOConfiguration)audioIOConfigWithDeviceRole:(SEL)a3 operatingMode:(int)a4
{
  tagVCAudioIOConfiguration *result;
  __int128 v10;
  unsigned int transportSessionID;
  int processId;
  unsigned int preferredIOSampleRate;

  result = (tagVCAudioIOConfiguration *)+[VCAudioStream audioIODirectionWithMediaStreamDirection:](VCAudioStream, "audioIODirectionWithMediaStreamDirection:", self->super._direction);
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&retstr->var4 = v10;
  *(_OWORD *)&retstr->var8 = v10;
  *(_OWORD *)&retstr->var12 = v10;
  *(_OWORD *)&retstr->var14 = v10;
  *(_OWORD *)&retstr->var16 = v10;
  *(_OWORD *)&retstr->var19.delegate = v10;
  *(_OWORD *)&retstr->var20.captionsToken = v10;
  *(_OWORD *)&retstr->var20.captionsUseSecondaryThread = v10;
  transportSessionID = self->super._transportSessionID;
  *(_OWORD *)&retstr->var21 = v10;
  retstr->var0 = transportSessionID;
  retstr->var1 = 0;
  retstr->var2 = a5;
  retstr->var3 = a4;
  retstr->var4 = 0;
  retstr->var5 = result;
  processId = self->super._processId;
  retstr->var6 = 0;
  preferredIOSampleRate = self->super._preferredIOSampleRate;
  retstr->var7 = self;
  retstr->var8 = processId;
  retstr->var9 = preferredIOSampleRate;
  retstr->var10 = self->super._preferredIOSamplesPerFrame;
  retstr->var11 = 0;
  retstr->var12 = 0;
  retstr->var13 = 1;
  retstr->var14 = 0;
  retstr->var15 = 0;
  *(_WORD *)&retstr->var17 = 0;
  retstr->var16 = 0;
  *(_OWORD *)&retstr->var19.delegate = 0u;
  *(_OWORD *)&retstr->var19.clientContext = v10;
  *(_OWORD *)&retstr->var19.clientContext = 0u;
  *(_OWORD *)&retstr->var19.captionsCoordinator = v10;
  *(_OWORD *)&retstr->var19.captionsCoordinator = 0u;
  *(_OWORD *)&retstr->var19.injector = v10;
  *(_OWORD *)&retstr->var19.injector = 0u;
  *(_OWORD *)&retstr->var20.clientCallback = v10;
  retstr->var20.clientCallback = _VCSessionParticipantLocal_ProcessAudioSamples;
  retstr->var20.clientContext = self;
  retstr->var20.captionsToken = 0;
  retstr->var20.captionsCoordinator = 0;
  retstr->var20.captionsUseSecondaryThread = 0;
  retstr->var20.injector = 0;
  retstr->var21 = 0;
  *(_WORD *)&retstr->var22 = 0;
  return result;
}

- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4
{
  __int128 v7;
  VCAudioIO *audioIO;
  const __CFString *v9;
  VCAudioIO *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  VCAudioIO *v14;
  int v15;
  _BOOL4 v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  VCAudioIO *v22;
  int v23;
  _BOOL4 v24;
  BOOL result;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  VCAudioIO *v29;
  const char *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  VCAudioIO *v34;
  uint64_t v35;
  NSObject *v36;
  VCAudioIO *v37;
  uint32_t v38;
  uint64_t v39;
  NSObject *v40;
  VCAudioIO *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
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
  void *v63;
  __int16 v64;
  _BYTE v65[10];
  VCAudioIO *v66;
  _BYTE v67[6];
  __int16 v68;
  int v69;
  __int16 v70;
  int v71;
  __int16 v72;
  _BOOL4 v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v54 = v7;
  v55 = v7;
  v52 = v7;
  v53 = v7;
  v50 = v7;
  v51 = v7;
  v48 = v7;
  v49 = v7;
  v46 = v7;
  v47 = v7;
  v44 = v7;
  v45 = v7;
  v42 = v7;
  v43 = v7;
  if (self)
  {
    -[VCSessionParticipantLocal audioIOConfigWithDeviceRole:operatingMode:](self, "audioIOConfigWithDeviceRole:operatingMode:", *(_QWORD *)&a3, *(_QWORD *)&a4, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55);
  }
  else
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
  }
  audioIO = self->super._audioIO;
  if (audioIO)
  {
    if (!-[VCAudioIO reconfigureWithConfig:](audioIO, "reconfigureWithConfig:", &v42))
    {
      if ((VCSessionParticipantLocal *)objc_opt_class() != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_44;
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
        v34 = self->super._audioIO;
        *(_DWORD *)buf = 136317186;
        v57 = v32;
        v58 = 2080;
        v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
        v60 = 1024;
        v61 = 1412;
        v62 = 2112;
        v63 = (void *)v9;
        v64 = 2048;
        *(_QWORD *)v65 = self;
        *(_WORD *)&v65[8] = 2048;
        v66 = v34;
        *(_WORD *)v67 = 1024;
        *(_DWORD *)&v67[2] = a4;
        v68 = 1024;
        v69 = a3;
        v70 = 1024;
        v71 = BYTE4(v43);
        v30 = " [%s] %s:%d %@(%p) Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
        v31 = v33;
        goto LABEL_42;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_44;
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_44;
      v29 = self->super._audioIO;
      *(_DWORD *)buf = 136316674;
      v57 = v27;
      v58 = 2080;
      v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
      v60 = 1024;
      v61 = 1412;
      v62 = 2048;
      v63 = v29;
      v64 = 1024;
      *(_DWORD *)v65 = a4;
      *(_WORD *)&v65[4] = 1024;
      *(_DWORD *)&v65[6] = a3;
      LOWORD(v66) = 1024;
      *(_DWORD *)((char *)&v66 + 2) = BYTE4(v43);
      v30 = " [%s] %s:%d Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d";
      v31 = v28;
      goto LABEL_37;
    }
  }
  else
  {
    v10 = -[VCAudioIO initWithConfiguration:]([VCAudioIO alloc], "initWithConfiguration:", &v42);
    self->super._audioIO = v10;
    if (!v10)
    {
      if ((VCSessionParticipantLocal *)objc_opt_class() != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v26 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v26 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_44;
        v39 = VRTraceErrorLogLevelToCSTR();
        v40 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_44;
        v41 = self->super._audioIO;
        *(_DWORD *)buf = 136317186;
        v57 = v39;
        v58 = 2080;
        v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
        v60 = 1024;
        v61 = 1407;
        v62 = 2112;
        v63 = (void *)v26;
        v64 = 2048;
        *(_QWORD *)v65 = self;
        *(_WORD *)&v65[8] = 2048;
        v66 = v41;
        *(_WORD *)v67 = 1024;
        *(_DWORD *)&v67[2] = 6;
        v68 = 1024;
        v69 = a3;
        v70 = 1024;
        v71 = BYTE4(v43);
        v30 = " [%s] %s:%d %@(%p) Failed created audioIO=%p operatingMode:%d deviceRole:%d direction:%d";
        v31 = v40;
LABEL_42:
        v38 = 76;
        goto LABEL_43;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_44;
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_44;
      v37 = self->super._audioIO;
      *(_DWORD *)buf = 136316674;
      v57 = v35;
      v58 = 2080;
      v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
      v60 = 1024;
      v61 = 1407;
      v62 = 2048;
      v63 = v37;
      v64 = 1024;
      *(_DWORD *)v65 = 6;
      *(_WORD *)&v65[4] = 1024;
      *(_DWORD *)&v65[6] = a3;
      LOWORD(v66) = 1024;
      *(_DWORD *)((char *)&v66 + 2) = BYTE4(v43);
      v30 = " [%s] %s:%d Failed created audioIO=%p operatingMode:%d deviceRole:%d direction:%d";
      v31 = v36;
LABEL_37:
      v38 = 56;
LABEL_43:
      _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v38);
LABEL_44:

      result = 0;
      self->super._audioIO = 0;
      return result;
    }
    -[VCAudioIO setIsGKVoiceChat:](v10, "setIsGKVoiceChat:", self->super._isGKVoiceChat);
    -[VCAudioIO setMuted:](self->super._audioIO, "setMuted:", -[VCSessionParticipant isMuted](self, "isMuted"));
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 1;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 1;
    v14 = self->super._audioIO;
    v15 = BYTE4(v43);
    v16 = -[VCSessionParticipant isMuted](self, "isMuted");
    *(_DWORD *)buf = 136316930;
    v57 = v12;
    v58 = 2080;
    v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
    v60 = 1024;
    v61 = 1414;
    v62 = 2048;
    v63 = v14;
    v64 = 1024;
    *(_DWORD *)v65 = a4;
    *(_WORD *)&v65[4] = 1024;
    *(_DWORD *)&v65[6] = a3;
    LOWORD(v66) = 1024;
    *(_DWORD *)((char *)&v66 + 2) = v15;
    HIWORD(v66) = 1024;
    *(_DWORD *)v67 = v16;
    v17 = " [%s] %s:%d configured audioIO=%p operatingMode=%d deviceRole=%d direction=%d isMuted=%d";
    v18 = v13;
    v19 = 62;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 1;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 1;
    v22 = self->super._audioIO;
    v23 = BYTE4(v43);
    v24 = -[VCSessionParticipant isMuted](self, "isMuted");
    *(_DWORD *)buf = 136317442;
    v57 = v20;
    v58 = 2080;
    v59 = "-[VCSessionParticipantLocal configureAudioIOWithDeviceRole:operatingMode:]";
    v60 = 1024;
    v61 = 1414;
    v62 = 2112;
    v63 = (void *)v11;
    v64 = 2048;
    *(_QWORD *)v65 = self;
    *(_WORD *)&v65[8] = 2048;
    v66 = v22;
    *(_WORD *)v67 = 1024;
    *(_DWORD *)&v67[2] = a4;
    v68 = 1024;
    v69 = a3;
    v70 = 1024;
    v71 = v23;
    v72 = 1024;
    v73 = v24;
    v17 = " [%s] %s:%d %@(%p) configured audioIO=%p operatingMode=%d deviceRole=%d direction=%d isMuted=%d";
    v18 = v21;
    v19 = 82;
  }
  _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
  return 1;
}

- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3
{
  objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1E9EF5438), "stream"), "setMediaSuggestion:", a3);
}

- (void)setEncryptionInfoReceived:(BOOL)a3
{
  self->_encryptionInfoReceived = a3;
}

- (unsigned)currentUplinkTotalBitrate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
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
  v2 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v2);
      v5 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "currentUplinkTotalBitrate");
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  }
  while (v4);
  return v5;
}

- (void)setCellularUniqueTag:(unsigned int)a3
{
  uint64_t v3;
  NSMutableArray *micStreamGroups;
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

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  self->super._cellularUniqueTag = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  micStreamGroups = self->super._micStreamGroups;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(micStreamGroups);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setCellularUniqueTag:", v3);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](micStreamGroups, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (BOOL)isActiveMediaType:(unsigned int)a3
{
  int *v5;

  switch(a3)
  {
    case 0u:
      if (!self->super._audioEnabled)
        return 0;
      v5 = &OBJC_IVAR___VCSessionParticipant__audioPaused;
      return *((_BYTE *)&self->super.super.super.isa + *v5) == 0;
    case 1u:
      if (!self->super._videoEnabled)
        return 0;
      v5 = &OBJC_IVAR___VCSessionParticipant__videoPaused;
      return *((_BYTE *)&self->super.super.super.isa + *v5) == 0;
    case 2u:
    case 3u:
      return self->super._screenEnabled;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      return objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:")), "mediaState") == 1;
    default:
      return 1;
  }
}

- (BOOL)isEnabledMediaType:(unsigned int)a3
{
  BOOL v3;
  int *v4;
  BOOL result;

  switch(a3)
  {
    case 0u:
      v4 = &OBJC_IVAR___VCSessionParticipant__audioEnabled;
      goto LABEL_7;
    case 1u:
      v4 = &OBJC_IVAR___VCSessionParticipant__videoEnabled;
      goto LABEL_7;
    case 2u:
    case 3u:
      v4 = &OBJC_IVAR___VCSessionParticipant__screenEnabled;
LABEL_7:
      v3 = *((_BYTE *)&self->super.super.super.isa + *v4) == 0;
      goto LABEL_8;
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
      v3 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._mediaTypeSettingsDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:")), "mediaState") == 0;
LABEL_8:
      result = !v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)nativeParticipantSupportsStreamGroupID:(unsigned int)a3
{
  BOOL result;
  int v4;

  result = 1;
  if ((int)a3 <= 1835623281)
  {
    if (a3 == 1667329381)
      return result;
    v4 = 1667330164;
    goto LABEL_7;
  }
  if (a3 != 1835623282 && a3 != 1935897189)
  {
    v4 = 1937339233;
LABEL_7:
    if (a3 != v4)
      return 0;
  }
  return result;
}

- (BOOL)webParticipantSupportsStreamGroupID:(unsigned int)a3
{
  return a3 == 1667329399 || a3 == 1835623287;
}

- (BOOL)wolfParticipantSupportsStreamGroupID:(unsigned int)a3
{
  BOOL result;
  int v4;

  result = 1;
  if ((int)a3 > 1718909043)
  {
    if ((int)a3 > 1935897188)
    {
      if (a3 == 1935897189)
        return result;
      v4 = 1937339233;
    }
    else
    {
      if (a3 == 1718909044)
        return result;
      v4 = 1835623282;
    }
    goto LABEL_10;
  }
  if (a3 != 1650745716 && a3 != 1667329381)
  {
    v4 = 1717854580;
LABEL_10:
    if (a3 != v4)
      return 0;
  }
  return result;
}

- (BOOL)remoteParticipantsSupportStreamGroupID:(unsigned int)a3
{
  uint64_t v5;
  NSArray *remoteParticipants;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3 - 1684108337 < 5 || a3 - 1986618417 < 4 || a3 == 1936290409)
  {
LABEL_9:
    LOBYTE(v8) = 1;
  }
  else
  {
    v5 = *(_QWORD *)&a3;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    remoteParticipants = self->_remoteParticipants;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](remoteParticipants, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(remoteParticipants);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "capabilities");
          if (HIDWORD(v12) == 2)
          {
            if (-[VCSessionParticipantLocal wolfParticipantSupportsStreamGroupID:](self, "wolfParticipantSupportsStreamGroupID:", v5))
            {
              goto LABEL_9;
            }
          }
          else if (HIDWORD(v12) == 1)
          {
            if (-[VCSessionParticipantLocal webParticipantSupportsStreamGroupID:](self, "webParticipantSupportsStreamGroupID:", v5))
            {
              goto LABEL_9;
            }
          }
          else if (!HIDWORD(v12)
                 && -[VCSessionParticipantLocal nativeParticipantSupportsStreamGroupID:](self, "nativeParticipantSupportsStreamGroupID:", v5))
          {
            goto LABEL_9;
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](remoteParticipants, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        LOBYTE(v8) = 0;
      }
      while (v9);
    }
  }
  return v8;
}

- (BOOL)isOneToOneStreamGroup:(unsigned int)a3
{
  BOOL result;
  int v5;
  int v6;

  result = 1;
  if ((int)a3 <= 1718909043)
  {
    if ((int)a3 > 1667330163)
    {
      if (a3 - 1684108337 >= 5 && a3 != 1667330164)
      {
        v5 = 1717854580;
        goto LABEL_13;
      }
      return 0;
    }
    if (a3 != 1650745716)
    {
      if (a3 == 1667329381)
        return -[VCSessionParticipantOneToOneConfig negotiatedVideoEnabled](self->super._oneToOneConfig, "negotiatedVideoEnabled");
      v5 = 1667329399;
LABEL_13:
      if (a3 != v5)
        return result;
      return 0;
    }
    return objc_msgSend(-[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->super._mediaNegotiator, "negotiatedResultsForGroupID:"), "isSupported");
  }
  if ((int)a3 > 1936290408)
  {
    if (a3 - 1986618417 < 4 || a3 == 1936290409)
      return 0;
    v6 = 1937339233;
  }
  else
  {
    if (a3 == 1718909044)
      return objc_msgSend(-[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->super._mediaNegotiator, "negotiatedResultsForGroupID:"), "isSupported");
    if (a3 == 1835623287)
      return 0;
    v6 = 1935897189;
  }
  if (a3 == v6)
    return -[VCSessionParticipantOneToOneConfig negotiatedScreenEnabled](self->super._oneToOneConfig, "negotiatedScreenEnabled");
  return result;
}

- (BOOL)isStreamGroupActive:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
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
  if (!self->super._oneToOneModeEnabled
    || (LODWORD(v5) = -[VCSessionParticipantLocal isOneToOneStreamGroup:](self, "isOneToOneStreamGroup:", objc_msgSend(a3, "streamGroupID")), (_DWORD)v5))
  {
    v6 = objc_msgSend(a3, "streamGroupID");
    v7 = +[VCSessionParticipant mediaTypesFromStreamGroupID:](VCSessionParticipant, "mediaTypesFromStreamGroupID:", v6);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v5)
    {
      v8 = v5;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          if (-[VCSessionParticipantLocal isActiveMediaType:](self, "isActiveMediaType:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "unsignedIntValue")))
          {
            LOBYTE(v5) = -[VCSessionParticipantLocal remoteParticipantsSupportStreamGroupID:](self, "remoteParticipantsSupportStreamGroupID:", v6);
            return v5;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        LOBYTE(v5) = 0;
        if (v8)
          continue;
        break;
      }
    }
  }
  return v5;
}

- (BOOL)applyCachedMediaStreams:(id)a3 toMultiwayConfig:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
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
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = objc_msgSend(a4, "qualityIndex");
        if (v11 == objc_msgSend(v10, "qualityIndex"))
        {
          v12 = objc_msgSend(a4, "hasRepairedStreamID");
          if (v12 == objc_msgSend(v10, "hasRepairedStreamID"))
          {
            objc_msgSend(a4, "setSsrc:", objc_msgSend(v10, "ssrc"));
            objc_msgSend(a4, "setIdsStreamID:", objc_msgSend(v10, "streamID"));
            if (objc_msgSend(a4, "hasV2StreamID"))
              objc_msgSend(a4, "setV2StreamID:", objc_msgSend(v10, "v2StreamID"));
            if (objc_msgSend(a4, "hasRepairedStreamID"))
              objc_msgSend(a4, "setRepairedStreamID:", objc_msgSend(v10, "repairedStreamID"));
            LOBYTE(v6) = 1;
            return v6;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return v6;
}

- (BOOL)applyCachedStreamGroupMediaStreams:(id)a3 toMultiwayConfig:(id)a4
{
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
  int v15;
  int v16;
  BOOL v19;
  uint64_t v20;
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
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v19 = 0;
  v20 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v28 != v20)
        objc_enumerationMutation(a3);
      v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v9 = (void *)objc_msgSend(v8, "streamConfigs");
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v23;
        while (2)
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v23 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
            v15 = objc_msgSend(a4, "qualityIndex");
            if (v15 == objc_msgSend(v14, "qualityIndex"))
            {
              v16 = objc_msgSend(a4, "hasRepairedStreamID");
              if (v16 != (objc_msgSend(v14, "repairedStreamID") == 0))
              {
                objc_msgSend(a4, "setSsrc:", objc_msgSend(v14, "ssrc"));
                objc_msgSend(a4, "setIdsStreamID:", objc_msgSend(v14, "streamID"));
                if (objc_msgSend(a4, "hasV2StreamID"))
                  objc_msgSend(a4, "setV2StreamID:", objc_msgSend(v14, "v2StreamID"));
                if (objc_msgSend(v8, "mediaType") == 1986618469)
                  objc_msgSend(a4, "setParentStreamID:", objc_msgSend(v14, "parentStreamID"));
                if (objc_msgSend(a4, "hasRepairedStreamID"))
                  objc_msgSend(a4, "setRepairedStreamID:", objc_msgSend(v14, "repairedStreamID"));
                v19 = 1;
                goto LABEL_23;
              }
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_23:
      ;
    }
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  }
  while (v6);
  return v19;
}

- (BOOL)setupVideoStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5
{
  _BOOL4 v8;

  v8 = -[VCSessionParticipantLocal applyCachedMediaStreamsWithStreamConfigurations:mediaNegotiatorConfig:](self, "applyCachedMediaStreamsWithStreamConfigurations:mediaNegotiatorConfig:", a3, a4);
  if (v8)
    LOBYTE(v8) = -[VCSessionParticipantLocal setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:](self, "setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:", a3, a5);
  return v8;
}

- (BOOL)setupCaptionsStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5
{
  _BOOL4 v8;

  v8 = -[VCSessionParticipantLocal applyCachedMediaStreamsWithStreamConfigurations:mediaNegotiatorConfig:](self, "applyCachedMediaStreamsWithStreamConfigurations:mediaNegotiatorConfig:", a3, a4);
  if (v8)
    LOBYTE(v8) = -[VCSessionParticipantLocal setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:](self, "setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:", a3, a5);
  return v8;
}

- (BOOL)applyCachedMediaStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
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
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a4
    || (v38 = 0u,
        v39 = 0u,
        v36 = 0u,
        v37 = 0u,
        (v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v36, v35, 16)) == 0))
  {
    LOBYTE(v17) = 1;
    return v17;
  }
  v8 = v7;
  v9 = *(_QWORD *)v37;
  v24 = *(_QWORD *)v37;
LABEL_4:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v37 != v9)
      objc_enumerationMutation(a3);
    v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
    if (!-[VCSessionParticipantLocal applyCachedMediaStreams:toMultiwayConfig:](self, "applyCachedMediaStreams:toMultiwayConfig:", objc_msgSend(a4, "multiwayVideoStreams"), objc_msgSend(v11, "multiwayConfig")))break;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v12 = (void *)objc_msgSend((id)objc_msgSend(v11, "multiwayConfig"), "subStreamConfigs");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
LABEL_10:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        v17 = -[VCSessionParticipantLocal applyCachedMediaStreams:toMultiwayConfig:](self, "applyCachedMediaStreams:toMultiwayConfig:", objc_msgSend(a4, "multiwayVideoStreams"), *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v16));
        if (!v17)
          return v17;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
          if (v14)
            goto LABEL_10;
          break;
        }
      }
    }
LABEL_26:
    ++v10;
    v9 = v24;
    if (v10 == v8)
    {
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
      LOBYTE(v17) = 1;
      if (v8)
        goto LABEL_4;
      return v17;
    }
  }
  if (-[VCSessionParticipantLocal applyCachedStreamGroupMediaStreams:toMultiwayConfig:](self, "applyCachedStreamGroupMediaStreams:toMultiwayConfig:", objc_msgSend(a4, "streamGroupConfigs"), objc_msgSend(v11, "multiwayConfig")))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = (void *)objc_msgSend((id)objc_msgSend(v11, "multiwayConfig"), "subStreamConfigs");
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
LABEL_20:
      v22 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        v17 = -[VCSessionParticipantLocal applyCachedStreamGroupMediaStreams:toMultiwayConfig:](self, "applyCachedStreamGroupMediaStreams:toMultiwayConfig:", objc_msgSend(a4, "streamGroupConfigs"), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v22));
        if (!v17)
          return v17;
        if (v20 == ++v22)
        {
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
          if (v20)
            goto LABEL_20;
          goto LABEL_26;
        }
      }
    }
    goto LABEL_26;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v17)
      return v17;
    -[VCSessionParticipantLocal applyCachedMediaStreamsWithStreamConfigurations:mediaNegotiatorConfig:].cold.1();
  }
  LOBYTE(v17) = 0;
  return v17;
}

- (BOOL)setupAudioStreamsWithStreamConfigurations:(id)a3 mediaNegotiatorConfig:(id)a4 streamGroupConfiguration:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:].cold.1();
    }
LABEL_19:
    LOBYTE(v14) = 0;
    return v14;
  }
  if (a4
    && (v19 = 0u,
        v20 = 0u,
        v17 = 0u,
        v18 = 0u,
        (v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v16, 16)) != 0))
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(a3);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
      if (!-[VCSessionParticipantLocal applyCachedMediaStreams:toMultiwayConfig:](self, "applyCachedMediaStreams:toMultiwayConfig:", objc_msgSend(a4, "multiwayAudioStreams"), objc_msgSend(v13, "multiwayConfig"))&& !-[VCSessionParticipantLocal applyCachedStreamGroupMediaStreams:toMultiwayConfig:](self, "applyCachedStreamGroupMediaStreams:toMultiwayConfig:", objc_msgSend(a4, "streamGroupConfigs"), objc_msgSend(v13, "multiwayConfig")))
      {
        break;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
        if (v10)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_19;
    VRTraceErrorLogLevelToCSTR();
    v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v14)
    {
      -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:].cold.2();
      goto LABEL_19;
    }
  }
  else
  {
LABEL_12:
    LOBYTE(v14) = -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:](self, "setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:", a3, a5);
  }
  return v14;
}

- (id)newVideoSendGroupConfigWithStreamGroupID:(unsigned int)a3 streamGroupConfiguration:(id)a4
{
  uint64_t v5;
  VCVideoStreamSendGroupConfig *v7;
  uint64_t v8;
  uint64_t v9;
  const opaqueCMFormatDescription *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  char *v27;
  uint64_t v28;

  v5 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(VCVideoStreamSendGroupConfig);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal newVideoSendGroupConfigWithStreamGroupID:streamGroupConfiguration:].cold.1();
    }
    goto LABEL_25;
  }
  v8 = -[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:](self, "captureSourceIDFromStreamGroupConfig:", a4);
  v9 = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "newFormatDescriptionForCaptureSource:", v8);
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v18 = 136316162;
        v19 = v16;
        v20 = 2080;
        v21 = "-[VCSessionParticipantLocal newVideoSendGroupConfigWithStreamGroupID:streamGroupConfiguration:]";
        v22 = 1024;
        v23 = 1747;
        v24 = 1024;
        v25 = v8;
        v26 = 2080;
        v27 = FourccToCStr(v5);
        _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to retrieve the format for captureSource=%d streamGroupID=%s", (uint8_t *)&v18, 0x2Cu);
      }
    }
LABEL_25:

    return 0;
  }
  v10 = (const opaqueCMFormatDescription *)v9;
  -[VCMediaStreamGroupConfig setStreamGroupID:](v7, "setStreamGroupID:", v5);
  -[VCMediaStreamGroupConfig setMediaType:](v7, "setMediaType:", CMFormatDescriptionGetMediaType(v10));
  -[VCMediaStreamGroupConfig setMediaSubtype:](v7, "setMediaSubtype:", CMFormatDescriptionGetMediaSubType(v10));
  CFRelease(v10);
  -[VCMediaStreamGroupConfig setStreamToken:](v7, "setStreamToken:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5)), "unsignedIntValue"));
  -[VCMediaStreamGroupConfig setDelegate:](v7, "setDelegate:", self);
  -[VCMediaStreamGroupConfig setDelegateQueue:](v7, "setDelegateQueue:", self->super._participantQueue);
  -[VCMediaStreamGroupConfig setParticipantUUID:](v7, "setParticipantUUID:", self->super._uuid);
  -[VCVideoStreamSendGroupConfig setCaptureSource:](v7, "setCaptureSource:", v8);
  -[VCMediaStreamGroupConfig setIdsParticipantID:](v7, "setIdsParticipantID:", self->super._idsParticipantID);
  -[VCMediaStreamGroupConfig setSessionUUID:](v7, "setSessionUUID:", self->super._sessionUUID);
  -[VCMediaStreamSendGroupConfig setShouldSynchronizeWithSourceRTPTimestamps:](v7, "setShouldSynchronizeWithSourceRTPTimestamps:", (_DWORD)v5 != 1667329399);
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupSyncGroupID")))
    -[VCMediaStreamGroupConfig setSyncGroupID:](v7, "setSyncGroupID:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupSyncGroupID")), "unsignedIntValue"));
  -[VCMediaStreamGroupConfig setNetworkFeedbackController:](v7, "setNetworkFeedbackController:", self->super._networkFeedbackController);
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupMode")))
    v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupMode")), "unsignedIntValue");
  else
    v11 = 0;
  -[VCMediaStreamSendGroupConfig setStreamGroupMode:](v7, "setStreamGroupMode:", v11);
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyMode")))
    v12 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyMode")), "unsignedIntValue");
  else
    v12 = 6;
  -[VCMediaStreamSendGroupConfig setRedundancyMode:](v7, "setRedundancyMode:", v12);
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyPercent")))
    v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyPercent")), "unsignedIntValue");
  else
    v13 = 100;
  -[VCMediaStreamSendGroupConfig setRedundancyPercentage:](v7, "setRedundancyPercentage:", v13);
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyControllerEnabled")))
    v14 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyControllerEnabled")), "BOOLValue");
  else
    v14 = 0;
  -[VCMediaStreamSendGroupConfig setStreamGroupRedundancyControlEnabled:](v7, "setStreamGroupRedundancyControlEnabled:", v14);
  -[VCMediaStreamSendGroupConfig setStatisticsCollector:](v7, "setStatisticsCollector:", self->super._statisticsCollector);
  return v7;
}

- (id)newAudioSendGroupConfigWithStreamGroupID:(unsigned int)a3 streamGroupConfiguration:(id)a4
{
  uint64_t v5;
  VCAudioStreamSendGroupConfig *v7;
  uint64_t v8;
  opaqueCMFormatDescription *v9;
  const opaqueCMFormatDescription *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  VCAudioStreamGroupCommonConfig *v16;
  uint64_t v18;
  NSObject *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v5 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(VCAudioStreamSendGroupConfig);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:].cold.1();
    }
    goto LABEL_35;
  }
  v8 = -[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:](self, "captureSourceIDFromStreamGroupConfig:", a4);
  if ((_DWORD)v5 == 1667330164)
    v9 = -[VCSessionParticipantLocal getCaptionsFormatDescription](self, "getCaptionsFormatDescription");
  else
    v9 = -[VCSessionParticipantLocal getAudioFormatDescriptionForStreamGroupID:](self, "getAudioFormatDescriptionForStreamGroupID:", v5);
  v10 = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v20 = 136316162;
        v21 = v18;
        v22 = 2080;
        v23 = "-[VCSessionParticipantLocal newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:]";
        v24 = 1024;
        v25 = 1823;
        v26 = 1024;
        v27 = v8;
        v28 = 2080;
        v29 = FourccToCStr(v5);
        _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to retrieve the format for captureSource=%d streamGroupID=%s", (uint8_t *)&v20, 0x2Cu);
      }
    }
LABEL_35:

    return 0;
  }
  -[VCMediaStreamGroupConfig setMediaType:](v7, "setMediaType:", CMFormatDescriptionGetMediaType(v9));
  -[VCMediaStreamGroupConfig setMediaSubtype:](v7, "setMediaSubtype:", CMFormatDescriptionGetMediaSubType(v10));
  CFRelease(v10);
  -[VCMediaStreamGroupConfig setStreamGroupID:](v7, "setStreamGroupID:", v5);
  -[VCMediaStreamGroupConfig setStreamToken:](v7, "setStreamToken:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5)), "unsignedIntValue"));
  -[VCMediaStreamGroupConfig setDelegate:](v7, "setDelegate:", self);
  -[VCMediaStreamGroupConfig setDelegateQueue:](v7, "setDelegateQueue:", self->super._participantQueue);
  -[VCMediaStreamGroupConfig setParticipantUUID:](v7, "setParticipantUUID:", self->super._uuid);
  -[VCMediaStreamGroupConfig setIdsParticipantID:](v7, "setIdsParticipantID:", self->super._idsParticipantID);
  -[VCMediaStreamSendGroupConfig setShouldSynchronizeWithSourceRTPTimestamps:](v7, "setShouldSynchronizeWithSourceRTPTimestamps:", (_DWORD)v5 == 1937339233);
  -[VCMediaStreamGroupConfig setSessionUUID:](v7, "setSessionUUID:", self->super._sessionUUID);
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupSyncGroupID")))
  {
    v11 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupSyncGroupID")), "unsignedIntValue");
LABEL_9:
    -[VCMediaStreamGroupConfig setSyncGroupID:](v7, "setSyncGroupID:", v11);
    goto LABEL_10;
  }
  v12 = -[VCMediaStreamGroupConfig mediaType](v7, "mediaType");
  v11 = 1835623282;
  if (v12 != 1936684398)
    goto LABEL_9;
LABEL_10:
  -[VCMediaStreamGroupConfig setCaptureSource:](v7, "setCaptureSource:", v8);
  if ((_DWORD)v5 == 1835623282)
    -[VCAudioStreamSendGroupConfig setSystemAudioCaptureSession:](v7, "setSystemAudioCaptureSession:", self->_systemAudioCaptureSession);
  -[VCMediaStreamGroupConfig setNetworkFeedbackController:](v7, "setNetworkFeedbackController:", self->super._networkFeedbackController);
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupMode")))
    v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupMode")), "unsignedIntValue");
  else
    v13 = 0;
  -[VCMediaStreamSendGroupConfig setStreamGroupMode:](v7, "setStreamGroupMode:", v13);
  if ((!self->_isVCMediaQueueScheduledForServerBasedStreams
     || -[VCMediaStreamSendGroupConfig streamGroupMode](v7, "streamGroupMode") == 1)
    && ((_DWORD)v5 == 1835623287 || (_DWORD)v5 == 1835623282))
  {
    -[VCAudioStreamSendGroupConfig setShouldScheduleMediaQueue:](v7, "setShouldScheduleMediaQueue:", 1);
    if (!-[VCMediaStreamSendGroupConfig streamGroupMode](v7, "streamGroupMode"))
      self->_isVCMediaQueueScheduledForServerBasedStreams = 1;
  }
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyMode")))
    v14 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyMode")), "unsignedIntValue");
  else
    v14 = 4;
  -[VCMediaStreamSendGroupConfig setRedundancyMode:](v7, "setRedundancyMode:", v14);
  if (objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyControllerEnabled")))
    v15 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupRedundancyControllerEnabled")), "BOOLValue");
  else
    v15 = 1;
  -[VCMediaStreamSendGroupConfig setStreamGroupRedundancyControlEnabled:](v7, "setStreamGroupRedundancyControlEnabled:", v15);
  -[VCMediaStreamSendGroupConfig setStatisticsCollector:](v7, "setStatisticsCollector:", self->super._statisticsCollector);
  v16 = -[VCAudioStreamSendGroupConfig audioStreamGroupConfig](v7, "audioStreamGroupConfig");
  -[VCAudioStreamGroupCommonConfig setAudioSessionID:](v16, "setAudioSessionID:", self->super._transportSessionID);
  -[VCAudioStreamGroupCommonConfig setIsMuted:](v16, "setIsMuted:", self->super._isMuted);
  -[VCAudioStreamGroupCommonConfig setProcessID:](v16, "setProcessID:", self->super._processId);
  -[VCAudioStreamGroupCommonConfig setPreferredIOSampleRate:](v16, "setPreferredIOSampleRate:", -[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:", v5));
  -[VCAudioStreamGroupCommonConfig setPreferredIOSamplesPerFrame:](v16, "setPreferredIOSamplesPerFrame:", -[VCSessionParticipant preferredIOSamplesPerFrameForGroupID:](self, "preferredIOSamplesPerFrameForGroupID:", v5));
  -[VCAudioStreamGroupCommonConfig setIsGKVoiceChat:](v16, "setIsGKVoiceChat:", self->super._isGKVoiceChat);
  -[VCAudioStreamGroupCommonConfig setPowerSpectrumStreamToken:](v16, "setPowerSpectrumStreamToken:", -[VCMediaStreamGroupConfig streamToken](v7, "streamToken"));
  return v7;
}

- (opaqueCMFormatDescription)getAudioFormatDescriptionForStreamGroupID:(unsigned int)a3
{
  __int128 v3;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  AudioStreamBasicDescription asbd;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&asbd.mFormatID = v3;
  *(_OWORD *)&asbd.mBytesPerFrame = v3;
  formatDescriptionOut = (CMAudioFormatDescriptionRef)0xAAAAAAAAAAAAAAAALL;
  asbd.mSampleRate = NAN;
  Format_Float((uint64_t)&asbd, 1, -[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:", *(_QWORD *)&a3));
  CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &asbd, 0, 0, 0, 0, 0, &formatDescriptionOut);
  return formatDescriptionOut;
}

- (opaqueCMFormatDescription)getCaptionsFormatDescription
{
  CMFormatDescriptionRef v3[2];

  v3[1] = *(CMFormatDescriptionRef *)MEMORY[0x1E0C80C00];
  v3[0] = (CMFormatDescriptionRef)0xAAAAAAAAAAAAAAAALL;
  CMFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D657461u, 0x63617074u, 0, v3);
  return v3[0];
}

- (BOOL)setupVideoStreamsWithStreamConfiguration:(id)a3 streamGroupConfiguration:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  VCVideoStreamSendGroup *v11;
  VCVideoStreamSendGroup *v12;
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
  VCSessionParticipantLocal *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupID")), "unsignedIntValue");
  v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupMediaType")), "unsignedIntValue");
  v9 = -[VCSessionParticipantLocal newVideoSendGroupConfigWithStreamGroupID:streamGroupConfiguration:](self, "newVideoSendGroupConfigWithStreamGroupID:streamGroupConfiguration:", v7, a4);
  if (v9)
  {
    v10 = -[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:](self, "setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:", a3, v9, v7, v8);
    v11 = -[VCVideoStreamSendGroup initWithConfig:]([VCVideoStreamSendGroup alloc], "initWithConfig:", v9);
    if (v11)
    {
      v12 = v11;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._streamGroups, "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStreamGroup streamToken](v11, "streamToken")));
      -[NSMutableArray addObject:](self->super._videoStreamGroups, "addObject:", v12);

      v10 = 1;
    }
    else if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = v15;
          v19 = 2080;
          v20 = "-[VCSessionParticipantLocal setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:]";
          v21 = 1024;
          v22 = 1920;
          v23 = 2112;
          v24 = v14;
          v25 = 2048;
          v26 = self;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to initalize video stream group", (uint8_t *)&v17, 0x30u);
        }
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:].cold.1();
    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)setupCaptionsStreamsWithStreamConfiguration:(id)a3 streamGroupConfiguration:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  VCCaptionsStreamSendGroup *v11;
  VCCaptionsStreamSendGroup *v12;
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
  VCSessionParticipantLocal *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupID")), "unsignedIntValue");
  v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupMediaType")), "unsignedIntValue");
  v9 = -[VCSessionParticipantLocal newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:](self, "newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:", v7, a4);
  if (v9)
  {
    v10 = -[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:](self, "setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:", a3, v9, v7, v8);
    v11 = -[VCCaptionsStreamSendGroup initWithConfig:]([VCCaptionsStreamSendGroup alloc], "initWithConfig:", v9);
    if (v11)
    {
      v12 = v11;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._streamGroups, "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCMediaStreamGroup streamToken](v11, "streamToken")));

      v10 = 1;
    }
    else if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v17 = 136316162;
          v18 = v15;
          v19 = 2080;
          v20 = "-[VCSessionParticipantLocal setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:]";
          v21 = 1024;
          v22 = 1944;
          v23 = 2112;
          v24 = v14;
          v25 = 2048;
          v26 = self;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to initalize video stream group", (uint8_t *)&v17, 0x30u);
        }
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:].cold.1();
    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)setupVideoMediaStreamsWithStreamGroupConfiguration:(id)a3 streamGroupConfig:(id)a4 streamGroupID:(unsigned int)a5 mediaType:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  NSObject *v19;
  int v20;
  int v21;
  int v22;
  NSObject *v23;
  const char *v24;
  uint32_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  int v33;
  int v34;
  const __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  const char *v39;
  NSObject *v40;
  const __CFString *v41;
  uint64_t v43;
  NSObject *v44;
  int v45;
  NSObject *v46;
  int v47;
  int v48;
  int v49;
  int v50;
  char *v51;
  int v52;
  uint64_t v53;
  char *v54;
  unsigned int v55;
  unsigned int v57;
  id v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  _BYTE v68[10];
  char *v69;
  _BYTE v70[6];
  _BYTE v71[6];
  __int16 v72;
  int v73;
  __int16 v74;
  int v75;
  __int16 v76;
  int v77;
  uint64_t v78;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v78 = *MEMORY[0x1E0C80C00];
  v58 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((int)objc_msgSend(a3, "count") < 1)
  {
LABEL_50:
    v11 = 0;
    goto LABEL_51;
  }
  v10 = 0;
  v11 = 0;
  LODWORD(v12) = 0;
  v57 = 15000;
  v55 = v6;
  while (1)
  {
    v13 = (void *)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v10), "multiwayConfig");
    if (!objc_msgSend(v13, "isTemporalStream") || !objc_msgSend(v13, "parentStreamID"))
      break;
    if (objc_msgSend(v13, "isTemporalStream"))
    {
      if (!objc_msgSend(v58, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v13, "parentStreamID"))))
      {
        if ((VCSessionParticipantLocal *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:].cold.2();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v41 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v41 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v43 = VRTraceErrorLogLevelToCSTR();
            v44 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v45 = objc_msgSend(v13, "idsStreamID");
              *(_DWORD *)buf = 136316418;
              v60 = v43;
              v61 = 2080;
              v62 = "-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:str"
                    "eamGroupID:mediaType:]";
              v63 = 1024;
              v64 = 1977;
              v65 = 2112;
              v66 = (void *)v41;
              v67 = 2048;
              *(_QWORD *)v68 = self;
              *(_WORD *)&v68[8] = 1024;
              LODWORD(v69) = v45;
              v39 = " [%s] %s:%d %@(%p) Base temporal layer hasn't been configured for streamID=%d";
              v40 = v44;
              goto LABEL_43;
            }
          }
        }
        goto LABEL_51;
      }
      if (!-[VCSessionParticipantLocal completeStreamSetup:rtpCipherSuite:](self, "completeStreamSetup:rtpCipherSuite:", objc_msgSend(a3, "objectAtIndexedSubscript:", v10), 3))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:].cold.3();
        }
        goto LABEL_50;
      }
      -[VCSessionParticipantLocal setupEncodingModeWithVideoStreamConfig:](self, "setupEncodingModeWithVideoStreamConfig:", objc_msgSend(a3, "objectAtIndexedSubscript:", v10));
      v14 = (void *)objc_msgSend(v58, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v13, "parentStreamID")));
      objc_msgSend(v14, "addStreamConfig:", objc_msgSend(a3, "objectAtIndexedSubscript:", v10));
      v15 = objc_msgSend(v58, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v13, "parentStreamID")));
      objc_msgSend(v58, "setObject:forKeyedSubscript:", v15, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v13, "idsStreamID")));
      v16 = objc_msgSend((id)objc_msgSend(v14, "streamConfigs"), "objectAtIndexedSubscript:", 0);
      if (!v16)
      {
LABEL_32:
        v11 = 1;
        v6 = v55;
        goto LABEL_17;
      }
      v17 = (void *)v16;
      if ((VCSessionParticipantLocal *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_32;
        v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E0CF2758];
        v6 = v55;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_31;
        v54 = FourccToCStr(v7);
        v52 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "idsStreamID");
        v50 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "repairedStreamID");
        v48 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "maxNetworkBitrate");
        v33 = objc_msgSend(v13, "idsStreamID");
        v34 = objc_msgSend(v13, "maxNetworkBitrate");
        *(_DWORD *)buf = 136317186;
        v60 = v31;
        v61 = 2080;
        v62 = "-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGro"
              "upID:mediaType:]";
        v63 = 1024;
        v64 = 1989;
        v65 = 2080;
        v66 = v54;
        v67 = 1024;
        *(_DWORD *)v68 = v52;
        *(_WORD *)&v68[4] = 1024;
        *(_DWORD *)&v68[6] = v50;
        LOWORD(v69) = 1024;
        *(_DWORD *)((char *)&v69 + 2) = v48;
        HIWORD(v69) = 1024;
        *(_DWORD *)v70 = v33;
        *(_WORD *)&v70[4] = 1024;
        *(_DWORD *)v71 = v34;
        v23 = v32;
        v24 = " [%s] %s:%d temporalStream configured streamGroupID=%s baseStreamId=%d repairStreamId=%d maxNetworkBitrate"
              "=%d temporalID=%d maxNetworkBitrate=%d";
        v25 = 68;
      }
      else
      {
        v18 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v18 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_32;
        v53 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        v6 = v55;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_31;
        v51 = FourccToCStr(v7);
        v49 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "idsStreamID");
        v47 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "repairedStreamID");
        v20 = objc_msgSend((id)objc_msgSend(v17, "multiwayConfig"), "maxNetworkBitrate");
        v46 = v19;
        v21 = objc_msgSend(v13, "idsStreamID");
        v22 = objc_msgSend(v13, "maxNetworkBitrate");
        *(_DWORD *)buf = 136317698;
        v60 = v53;
        v61 = 2080;
        v62 = "-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGro"
              "upID:mediaType:]";
        v63 = 1024;
        v64 = 1989;
        v65 = 2112;
        v66 = (void *)v18;
        v67 = 2048;
        *(_QWORD *)v68 = self;
        *(_WORD *)&v68[8] = 2080;
        v69 = v51;
        *(_WORD *)v70 = 1024;
        *(_DWORD *)&v70[2] = v49;
        *(_WORD *)v71 = 1024;
        *(_DWORD *)&v71[2] = v47;
        v72 = 1024;
        v73 = v20;
        v74 = 1024;
        v75 = v21;
        v76 = 1024;
        v77 = v22;
        v23 = v46;
        v24 = " [%s] %s:%d %@(%p) temporalStream configured streamGroupID=%s baseStreamId=%d repairStreamId=%d maxNetwork"
              "Bitrate=%d temporalID=%d maxNetworkBitrate=%d";
        v25 = 88;
      }
      _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, v25);
LABEL_31:
      v11 = 1;
    }
LABEL_17:
    if (objc_msgSend(v13, "parentStreamID"))
      v12 = v12;
    else
      v12 = (v12 + 1);
    if ((objc_msgSend(v13, "isOneToOne") & 1) == 0)
    {
      v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v10), "multiwayConfig"), "maxNetworkBitrate");
      v29 = objc_msgSend(a3, "objectAtIndexedSubscript:", v10);
      if ((_DWORD)v7 == 1935897189)
        v30 = v57;
      else
        v30 = v28;
      -[VCSessionParticipantLocal updateMultiwayBandwithAllocationTable:mediaType:streamGroupID:encoderGroupID:minNetworkBitrate:maxNetworkBitrate:](self, "updateMultiwayBandwithAllocationTable:mediaType:streamGroupID:encoderGroupID:minNetworkBitrate:maxNetworkBitrate:", v29, v6, v7, v12, v30, v28);
      v57 = v28 + 1;
    }
    if (++v10 >= (int)objc_msgSend(a3, "count"))
      goto LABEL_51;
  }
  v26 = -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:](self, "newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:", objc_msgSend(a3, "objectAtIndexedSubscript:", v10), v7, 3);
  if (v26)
  {
    v27 = v26;
    objc_msgSend(a4, "addMediaStreamInfo:", v26);
    objc_msgSend(v58, "setObject:forKeyedSubscript:", v27, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v13, "idsStreamID")));

    goto LABEL_17;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v36 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:].cold.1(v36);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v35 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v35 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v60 = v37;
        v61 = 2080;
        v62 = "-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGro"
              "upID:mediaType:]";
        v63 = 1024;
        v64 = 1970;
        v65 = 2112;
        v66 = (void *)v35;
        v67 = 2048;
        *(_QWORD *)v68 = self;
        *(_WORD *)&v68[8] = 1024;
        LODWORD(v69) = v10;
        v39 = " [%s] %s:%d %@(%p) Failed to set up video stream %d";
        v40 = v38;
LABEL_43:
        _os_log_error_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_ERROR, v39, buf, 0x36u);
      }
    }
  }
LABEL_51:

  return v11 & 1;
}

- (BOOL)setupAudioStreamsWithStreamConfiguration:(id)a3 streamGroupConfiguration:(id)a4
{
  uint64_t v7;
  id v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const __CFString *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  VCSessionParticipantLocal *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("streamGroupID")), "unsignedIntValue");
  v8 = -[VCSessionParticipantLocal newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:](self, "newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:", v7, a4);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:].cold.1();
    }
    goto LABEL_21;
  }
  v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7)), "unsignedIntValue");
  if ((int)objc_msgSend(a3, "count") >= 1)
  {
    v10 = 0;
    while (1)
    {
      v11 = -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:](self, "newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:", objc_msgSend(a3, "objectAtIndexedSubscript:", v10), v9, 1, v7);
      if (!v11)
        break;
      v12 = v11;
      objc_msgSend(v8, "addMediaStreamInfo:", v11);

      if (++v10 >= (int)objc_msgSend(a3, "count"))
        goto LABEL_6;
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:].cold.2(v18);
      }
      goto LABEL_21;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_21;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v27 = 136316418;
    v28 = v19;
    v29 = 2080;
    v30 = "-[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:]";
    v31 = 1024;
    v32 = 2021;
    v33 = 2112;
    v34 = v17;
    v35 = 2048;
    v36 = self;
    v37 = 1024;
    v38 = v10;
    v22 = " [%s] %s:%d %@(%p) Failed to set up audio stream %d";
    v23 = v20;
    v24 = 54;
    goto LABEL_32;
  }
LABEL_6:
  v13 = -[VCSessionParticipantLocal newAudioStreamSendGroupWithConfig:streamGroupID:](self, "newAudioStreamSendGroupWithConfig:streamGroupID:", v8, v7);
  if (!v13)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:].cold.3();
      }
      goto LABEL_21;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v25 = VRTraceErrorLogLevelToCSTR(),
          v26 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_21:
      v15 = 0;
      goto LABEL_11;
    }
    v27 = 136316162;
    v28 = v25;
    v29 = 2080;
    v30 = "-[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:]";
    v31 = 1024;
    v32 = 2028;
    v33 = 2112;
    v34 = v21;
    v35 = 2048;
    v36 = self;
    v22 = " [%s] %s:%d %@(%p) Failed to initalize audio stream group";
    v23 = v26;
    v24 = 48;
LABEL_32:
    _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v27, v24);
    goto LABEL_21;
  }
  v14 = v13;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._streamGroups, "setObject:forKeyedSubscript:", v13, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "streamToken")));
  if ((_DWORD)v7 == 1835623287 || (_DWORD)v7 == 1835623282)
  {
    -[NSMutableArray addObject:](self->super._micStreamGroups, "addObject:", v14);
    objc_msgSend(v14, "setVADFilteringEnabled:", self->_enableVADFiltering);
    -[VCSessionParticipantLocal updateAudioSpectrumState](self, "updateAudioSpectrumState");
  }

  v15 = 1;
LABEL_11:

  return v15;
}

- (id)newAudioStreamSendGroupWithConfig:(id)a3 streamGroupID:(unsigned int)a4
{
  __objc2_class **v4;

  v4 = &off_1E9E4D610;
  if (a4 != 1667330164)
    v4 = off_1E9E4D5F8;
  return (id)objc_msgSend(objc_alloc(*v4), "initWithConfig:", a3);
}

- (id)newStreamInfoWithVideoStreamWithConfiguration:(id)a3 streamGroupID:(unsigned int)a4 rtpCipherSuite:(int64_t)a5
{
  uint64_t v5;
  id result;
  const __CFString *v9;
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
  VCSessionParticipantLocal *v21;
  __int16 v22;
  char *v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  if (-[VCSessionParticipantLocal completeStreamSetup:rtpCipherSuite:](self, "completeStreamSetup:rtpCipherSuite:", a3, a5))
  {
    result = -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:](self, "newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:", a3, self->super._idsDestination, v5);
    if (result)
      return result;
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v12 = 136316418;
          v13 = v10;
          v14 = 2080;
          v15 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:]";
          v16 = 1024;
          v17 = 2068;
          v18 = 2112;
          v19 = v9;
          v20 = 2048;
          v21 = self;
          v22 = 2080;
          v23 = FourccToCStr(v5);
          _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup video stream for streamGroupId=%s", (uint8_t *)&v12, 0x3Au);
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:].cold.2();
  }
  return 0;
}

- (void)updateMultiwayBandwithAllocationTable:(id)a3 mediaType:(unsigned int)a4 streamGroupID:(unsigned int)a5 encoderGroupID:(unsigned int)a6 minNetworkBitrate:(unsigned int)a7 maxNetworkBitrate:(unsigned int)a8
{
  char v8;
  int v9;
  int v10;
  uint64_t i;
  void *v12;
  unsigned int v13;
  char v14;
  int v15;
  int v16;
  char v17;
  char v18;
  VCSessionBandwidthAllocationTableEntry *v19;
  unsigned int v20;
  unsigned int v21;
  char v22;
  int v23;
  int v24;
  char v25;
  char v26;
  VCSessionBandwidthAllocationTableEntry *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id obj;
  uint64_t v34;
  unsigned __int8 v36;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  VCSessionBandwidthAllocationTableEntry *v47;
  VCSessionBandwidthAllocationTableEntry *v48;
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (a4 == 1986618469)
    v8 = 2;
  else
    v8 = 3;
  v36 = v8;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = (id)objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "subStreamConfigs");
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
  v9 = 0;
  v10 = 0;
  if (v39)
  {
    v34 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v52 != v34)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v47 = [VCSessionBandwidthAllocationTableEntry alloc];
        v45 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5)), "unsignedIntValue");
        v44 = objc_msgSend(v12, "maxNetworkBitrate") - v9;
        v43 = objc_msgSend(v12, "maxNetworkBitrate") - v9;
        v41 = objc_msgSend(v12, "maxMediaBitrate");
        v40 = objc_msgSend(v12, "qualityIndex");
        v13 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
        v14 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "hasRepairedStreamID");
        v15 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedStreamID");
        v16 = objc_msgSend(v12, "repairedMaxNetworkBitrate") - v10;
        v17 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand") ^ 1;
        v18 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand");
        LODWORD(v30) = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "v2StreamID");
        BYTE5(v29) = v18;
        BYTE4(v29) = v17;
        HIDWORD(v28) = v15;
        LODWORD(v29) = v16;
        LOBYTE(v28) = v14;
        v19 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:](v47, "initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:", 0, v36, v45, v44, v43, v41, __PAIR64__(v13, v40), v28, v29, __PAIR64__(a6, a5), v30);
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_uplinkBandwidthAllocators, "objectAtIndexedSubscript:", 0), "addBandwidthAllocationTableEntry:updateNow:", v19, 0);

        v9 = objc_msgSend(v12, "maxNetworkBitrate");
        v10 = objc_msgSend(v12, "repairedMaxNetworkBitrate");
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
    }
    while (v39);
  }
  v48 = [VCSessionBandwidthAllocationTableEntry alloc];
  v46 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5)), "unsignedIntValue");
  v42 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxMediaBitrate");
  v20 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "qualityIndex");
  v21 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
  v22 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "hasRepairedStreamID");
  v23 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedStreamID");
  v24 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedMaxNetworkBitrate") - v10;
  v25 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand") ^ 1;
  v26 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand");
  LODWORD(v30) = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "v2StreamID");
  BYTE5(v29) = v26;
  BYTE4(v29) = v25;
  HIDWORD(v28) = v23;
  LODWORD(v29) = v24;
  LOBYTE(v28) = v22;
  v27 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:](v48, "initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:", 0, v36, v46, a7 - v9, a8 - v9, v42, __PAIR64__(v21, v20), v28, v29, __PAIR64__(a6, a5), v30);
  objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_uplinkBandwidthAllocators, "objectAtIndexedSubscript:", 0), "addBandwidthAllocationTableEntry:updateNow:", v27, 0);

}

- (id)newStreamInfoWithAudioStreamWithConfiguration:(id)a3 streamToken:(int64_t)a4 isMultiway:(BOOL)a5 streamGroupID:(unsigned int)a6
{
  uint64_t v6;
  _BOOL8 v7;
  id v11;
  void *v12;
  char v13;
  int v14;
  int v15;
  char v16;
  char v17;
  VCSessionBandwidthAllocationTableEntry *v18;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  VCSessionBandwidthAllocationTableEntry *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  VCSessionParticipantLocal *v40;
  uint64_t v41;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  if (!-[VCSessionParticipantLocal completeStreamSetup:rtpCipherSuite:](self, "completeStreamSetup:rtpCipherSuite:", a3, 3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:].cold.2();
    }
    return 0;
  }
  v11 = -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:](self, "newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:", a3, self->super._idsDestination, v7, v6, a4);
  if (!v11)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v20 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v32 = v21;
          v33 = 2080;
          v34 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:]";
          v35 = 1024;
          v36 = 2146;
          v37 = 2112;
          v38 = v20;
          v39 = 2048;
          v40 = self;
          _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to setup audio stream", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  v12 = v11;
  if ((objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne") & 1) == 0)
  {
    v30 = [VCSessionBandwidthAllocationTableEntry alloc];
    v29 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxNetworkBitrate");
    v28 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxNetworkBitrate");
    v27 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxMediaBitrate");
    v26 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "qualityIndex");
    HIDWORD(v25) = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
    v13 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "hasRepairedStreamID");
    v14 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedStreamID");
    v15 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedMaxNetworkBitrate");
    v16 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand") ^ 1;
    v17 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "startOnDemand");
    LODWORD(v25) = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "v2StreamID");
    BYTE5(v24) = v17;
    BYTE4(v24) = v16;
    HIDWORD(v23) = v14;
    LODWORD(v24) = v15;
    LOBYTE(v23) = v13;
    v18 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:](v30, "initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:", 0, 1, a4, v29, v28, v27, __PAIR64__(HIDWORD(v25), v26), v23, v24, v6, v25);
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_uplinkBandwidthAllocators, "objectAtIndexedSubscript:", 0), "addBandwidthAllocationTableEntry:updateNow:", v18, 0);

  }
  return v12;
}

- (BOOL)completeStreamSetup:(id)a3 rtpCipherSuite:(int64_t)a4
{
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setCName:", -[VCSessionParticipant uuid](self, "uuid"));
  v8.receiver = self;
  v8.super_class = (Class)VCSessionParticipantLocal;
  return -[VCSessionParticipant completeStreamSetup:rtpCipherSuite:](&v8, sel_completeStreamSetup_rtpCipherSuite_, a3, a4);
}

- (id)multiwayAudioStreamNegotiatorConfigForStreamConfig:(id)a3
{
  VCMediaNegotiatorMultiwayAudioStream *v4;
  float v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(VCMediaNegotiatorMultiwayAudioStream);
  -[VCMediaNegotiatorMultiwayMediaStream setSsrc:](v4, "setSsrc:", objc_msgSend(a3, "ssrc"));
  -[VCMediaNegotiatorMultiwayMediaStream setMaxNetworkBitrate:](v4, "setMaxNetworkBitrate:", objc_msgSend(a3, "maxNetworkBitrate"));
  -[VCMediaNegotiatorMultiwayMediaStream setMaxMediaBitrate:](v4, "setMaxMediaBitrate:", objc_msgSend(a3, "maxMediaBitrate"));
  objc_msgSend(a3, "maxPacketsPerSecond");
  -[VCMediaNegotiatorMultiwayMediaStream setMaxPacketsPerSecond:](v4, "setMaxPacketsPerSecond:", v5);
  -[VCMediaNegotiatorMultiwayMediaStream setStreamID:](v4, "setStreamID:", objc_msgSend(a3, "idsStreamID"));
  -[VCMediaNegotiatorMultiwayMediaStream setV2StreamID:](v4, "setV2StreamID:", objc_msgSend(a3, "v2StreamID"));
  -[VCMediaNegotiatorMultiwayMediaStream setHasV2StreamID:](v4, "setHasV2StreamID:", objc_msgSend(a3, "hasV2StreamID"));
  -[VCMediaNegotiatorMultiwayMediaStream setQualityIndex:](v4, "setQualityIndex:", objc_msgSend(a3, "qualityIndex"));
  -[VCMediaNegotiatorMultiwayMediaStream setHasRepairedStreamID:](v4, "setHasRepairedStreamID:", objc_msgSend(a3, "hasRepairedStreamID"));
  -[VCMediaNegotiatorMultiwayMediaStream setRepairedStreamID:](v4, "setRepairedStreamID:", objc_msgSend(a3, "repairedStreamID"));
  -[VCMediaNegotiatorMultiwayMediaStream setRepairedMaxNetworkBitrate:](v4, "setRepairedMaxNetworkBitrate:", objc_msgSend(a3, "repairedMaxNetworkBitrate"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "audioRules"), "rules");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
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
        -[VCMediaNegotiatorMultiwayAudioStream addPayload:](v4, "addPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10++), "payload"));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v8);
  }
  return v4;
}

- (id)multiwayVideoStreamNegotiatorConfigForStreamConfig:(id)a3 isSubstream:(BOOL)a4
{
  _BOOL8 v4;
  VCMediaNegotiatorMultiwayVideoStream *v6;
  float v7;
  uint64_t v9;
  _OWORD v10[4];
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(VCMediaNegotiatorMultiwayVideoStream);
  -[VCMediaNegotiatorMultiwayMediaStream setSsrc:](v6, "setSsrc:", objc_msgSend(a3, "ssrc"));
  -[VCMediaNegotiatorMultiwayMediaStream setMaxNetworkBitrate:](v6, "setMaxNetworkBitrate:", objc_msgSend(a3, "maxNetworkBitrate"));
  -[VCMediaNegotiatorMultiwayMediaStream setMaxMediaBitrate:](v6, "setMaxMediaBitrate:", objc_msgSend(a3, "maxMediaBitrate"));
  objc_msgSend(a3, "maxPacketsPerSecond");
  -[VCMediaNegotiatorMultiwayMediaStream setMaxPacketsPerSecond:](v6, "setMaxPacketsPerSecond:", v7);
  -[VCMediaNegotiatorMultiwayMediaStream setIsSubstream:](v6, "setIsSubstream:", v4);
  -[VCMediaNegotiatorMultiwayMediaStream setStreamID:](v6, "setStreamID:", objc_msgSend(a3, "idsStreamID"));
  -[VCMediaNegotiatorMultiwayMediaStream setQualityIndex:](v6, "setQualityIndex:", objc_msgSend(a3, "qualityIndex"));
  +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", objc_msgSend(a3, "resolution"));
  -[VCMediaNegotiatorMultiwayVideoStream setSize:](v6, "setSize:");
  -[VCMediaNegotiatorMultiwayVideoStream setFrameRate:](v6, "setFrameRate:", objc_msgSend(a3, "framerate"));
  -[VCMediaNegotiatorMultiwayVideoStream setKeyFrameInterval:](v6, "setKeyFrameInterval:", objc_msgSend(a3, "keyFrameInterval"));
  -[VCMediaNegotiatorMultiwayMediaStream setHasRepairedStreamID:](v6, "setHasRepairedStreamID:", objc_msgSend(a3, "hasRepairedStreamID"));
  -[VCMediaNegotiatorMultiwayMediaStream setRepairedStreamID:](v6, "setRepairedStreamID:", objc_msgSend(a3, "repairedStreamID"));
  -[VCMediaNegotiatorMultiwayMediaStream setRepairedMaxNetworkBitrate:](v6, "setRepairedMaxNetworkBitrate:", objc_msgSend(a3, "repairedMaxNetworkBitrate"));
  memset(v10, 0, sizeof(v10));
  if (objc_msgSend((id)objc_msgSend(a3, "payloads"), "countByEnumeratingWithState:objects:count:", v10, &v9, 16))
    -[VCMediaNegotiatorMultiwayVideoStream setPayload:](v6, "setPayload:", objc_msgSend(**((id **)&v10[0] + 1), "unsignedIntValue"));
  return v6;
}

- (id)newMediaNegotiatorAudioConfigurationForMediaType:(unsigned int)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  VCAudioRule *v8;
  VCMediaNegotiatorAudioConfiguration *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  UInt32 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = -[VCDefaults useSBR](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "useSBR");
  v6 = -[VCDefaults audioRecordingEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "audioRecordingEnabled");
  v14 = 0;
  v7 = (void *)-[VCAudioRuleCollection copy](self->super._supportedAudioRules, "copy");
  if (a3)
  {
    if (a3 != 3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newMediaNegotiatorAudioConfigurationForMediaType:].cold.1();
      }
      goto LABEL_9;
    }
    v8 = -[VCAudioRule initWithPayload:isSecondary:sbr:samplesPerBlock:]([VCAudioRule alloc], "initWithPayload:isSecondary:sbr:samplesPerBlock:", 101, 0, 0, 480);
    objc_msgSend(v7, "clearAudioRules");
    objc_msgSend(v7, "addAudioRule:", v8);

  }
  AUIOGetAUNumber(&v14);
  v9 = [VCMediaNegotiatorAudioConfiguration alloc];
  v10 = -[VCSessionParticipantLocal generateSSRC](self, "generateSSRC");
  v11 = -[VCMediaNegotiatorAudioConfiguration initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:](v9, "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:", 1, v6, v5, v10, v14, v7);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal newMediaNegotiatorAudioConfigurationForMediaType:].cold.2();
    }
LABEL_9:

    v7 = 0;
    v12 = 0;
    goto LABEL_10;
  }
  v12 = (void *)v11;
LABEL_10:

  return v12;
}

- (BOOL)featureListStringsRequiredForMediaType:(unsigned __int8)a3
{
  int v3;
  char v5;
  const __CFString *v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCSessionParticipantLocal *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3 - 2;
  if ((a3 - 2) < 5 && ((0x1Bu >> v5) & 1) != 0)
    return (0xFu >> v5) & 1;
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      -[VCSessionParticipantLocal featureListStringsRequiredForMediaType:].cold.1(v7);
    }
LABEL_14:
    LOBYTE(v8) = 0;
    return v8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v6 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_14;
  v9 = VRTraceErrorLogLevelToCSTR();
  v10 = *MEMORY[0x1E0CF2758];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v8)
  {
    v12 = 136316418;
    v13 = v9;
    v14 = 2080;
    v15 = "-[VCSessionParticipantLocal featureListStringsRequiredForMediaType:]";
    v16 = 1024;
    v17 = 2287;
    v18 = 2112;
    v19 = v6;
    v20 = 2048;
    v21 = self;
    v22 = 1024;
    v23 = v3;
    _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v12, 0x36u);
    goto LABEL_14;
  }
  return v8;
}

- (BOOL)v1FeatureListStringsSupportedForMediaType:(unsigned __int8)a3
{
  int v3;
  char v5;
  const __CFString *v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCSessionParticipantLocal *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3 - 2;
  if ((a3 - 2) < 5 && ((0x1Bu >> v5) & 1) != 0)
    return (7u >> v5) & 1;
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      -[VCSessionParticipantLocal v1FeatureListStringsSupportedForMediaType:].cold.1(v7);
    }
LABEL_14:
    LOBYTE(v8) = 0;
    return v8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v6 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_14;
  v9 = VRTraceErrorLogLevelToCSTR();
  v10 = *MEMORY[0x1E0CF2758];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v8)
  {
    v12 = 136316418;
    v13 = v9;
    v14 = 2080;
    v15 = "-[VCSessionParticipantLocal v1FeatureListStringsSupportedForMediaType:]";
    v16 = 1024;
    v17 = 2309;
    v18 = 2112;
    v19 = v6;
    v20 = 2048;
    v21 = self;
    v22 = 1024;
    v23 = v3;
    _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v12, 0x36u);
    goto LABEL_14;
  }
  return v8;
}

- (id)u1VideoRuleCollectionsForMediaType:(unsigned __int8)a3
{
  int v3;
  id result;
  const __CFString *v6;
  __objc2_class *v7;
  uint64_t v8;
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
  VCSessionParticipantLocal *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 2u:
      return -[VCVideoRuleCollections videoRulesCollectionsByRemovingPayload:andPayload:removeCellular:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "videoRulesCollectionsByRemovingPayload:andPayload:removeCellular:", 126, 128, 0);
    case 3u:
      goto LABEL_16;
    case 5u:
      v7 = VCVideoRuleCollectionsFaceTexture;
      goto LABEL_8;
    case 6u:
      v7 = VCVideoRuleCollectionsBodyData;
LABEL_8:
      result = (id)-[__objc2_class newU1VideoRuleCollections](v7, "newU1VideoRuleCollections");
      break;
    default:
      if ((VCSessionParticipantLocal *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipantLocal u1VideoRuleCollectionsForMediaType:].cold.1(v8);
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v6 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v6 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v11 = 136316418;
            v12 = v9;
            v13 = 2080;
            v14 = "-[VCSessionParticipantLocal u1VideoRuleCollectionsForMediaType:]";
            v15 = 1024;
            v16 = 2335;
            v17 = 2112;
            v18 = v6;
            v19 = 2048;
            v20 = self;
            v21 = 1024;
            v22 = v3;
            _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected mediaType=%hhu", (uint8_t *)&v11, 0x36u);
          }
        }
      }
LABEL_16:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)addFeatureListStringsForVideoConfiguration:(id)a3 mediaType:(unsigned __int8)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  _BOOL4 v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  int v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  VCSessionParticipantLocal *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v4 = a4;
  v48 = *MEMORY[0x1E0C80C00];
  if (!+[VCMediaNegotiatorBase featureListStringsRequiredForMediaType:](VCMediaNegotiatorBase, "featureListStringsRequiredForMediaType:", a4))
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_28;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      v32 = 136315906;
      v33 = v13;
      v34 = 2080;
      v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
      v36 = 1024;
      v37 = 2342;
      v38 = 1024;
      LODWORD(v39) = v4;
      v15 = " [%s] %s:%d [FLS] Skipping generation as it is NOT required for mediaType=%hhu";
      v16 = v14;
      v17 = 34;
      goto LABEL_27;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_28;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v32 = 136316418;
    v33 = v20;
    v34 = 2080;
    v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
    v36 = 1024;
    v37 = 2342;
    v38 = 2112;
    v39 = (uint64_t)v12;
    v40 = 2048;
    v41 = self;
    v42 = 1024;
    LODWORD(v43) = v4;
    v15 = " [%s] %s:%d %@(%p) [FLS] Skipping generation as it is NOT required for mediaType=%hhu";
    v16 = v21;
    goto LABEL_22;
  }
  v7 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringFixedPositionWithType:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringFixedPositionWithType:", +[VCMediaNegotiatorBase featureListStringTypeForMediaType:](VCMediaNegotiatorBase, "featureListStringTypeForMediaType:", v4));
  if (v7)
  {
    v8 = v7;
    objc_msgSend(a3, "setVideoFeatureStringsFixedPosition:", -[VCSessionParticipantLocal featureListString:removingPayload:andPayload:mediaType:](self, "featureListString:removingPayload:andPayload:mediaType:", v7, 126, 128, v4));

    if (!+[VCMediaNegotiatorBase v1FeatureListStringsSupportedForMediaType:](VCMediaNegotiatorBase, "v1FeatureListStringsSupportedForMediaType:", v4))
    {
LABEL_6:
      if ((VCSessionParticipantLocal *)objc_opt_class() != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v11 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_28;
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_28;
        v32 = 136316930;
        v33 = v22;
        v34 = 2080;
        v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
        v36 = 1024;
        v37 = 2362;
        v38 = 2112;
        v39 = (uint64_t)v11;
        v40 = 2048;
        v41 = self;
        v42 = 2112;
        v43 = objc_msgSend(a3, "videoFeatureStrings");
        v44 = 2112;
        v45 = objc_msgSend(a3, "videoFeatureStringsFixedPosition");
        v46 = 1024;
        v47 = v4;
        v15 = " [%s] %s:%d %@(%p) [FLS] init videoFeatureStrings=%@, videoFeatureStringsFixedPosition=%@, mediaType=%hhu";
        v16 = v23;
        v17 = 74;
        goto LABEL_27;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_28;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      v32 = 136316418;
      v33 = v18;
      v34 = 2080;
      v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
      v36 = 1024;
      v37 = 2362;
      v38 = 2112;
      v39 = objc_msgSend(a3, "videoFeatureStrings");
      v40 = 2112;
      v41 = (VCSessionParticipantLocal *)objc_msgSend(a3, "videoFeatureStringsFixedPosition");
      v42 = 1024;
      LODWORD(v43) = v4;
      v15 = " [%s] %s:%d [FLS] init videoFeatureStrings=%@, videoFeatureStringsFixedPosition=%@, mediaType=%hhu";
      v16 = v19;
LABEL_22:
      v17 = 54;
LABEL_27:
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v32, v17);
LABEL_28:
      LOBYTE(v24) = 1;
      return v24;
    }
    v9 = +[VCVideoFeatureListStringHelper newFeatureListStringsDictForGroupID:isOneToOne:](VCVideoFeatureListStringHelper, "newFeatureListStringsDictForGroupID:isOneToOne:", VCMediaNegotiatorMediaType_StreamGroupIDFromMediaType(v4), 1);
    if (v9)
    {
      v10 = v9;
      objc_msgSend(a3, "setVideoFeatureStrings:", -[VCSessionParticipantLocal featureListString:removingPayload:andPayload:mediaType:](self, "featureListString:removingPayload:andPayload:mediaType:", v9, 126, 128, v4));

      goto LABEL_6;
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v24)
          return v24;
        -[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:].cold.2();
      }
      goto LABEL_51;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v24)
        return v24;
      v32 = 136316162;
      v33 = v30;
      v34 = 2080;
      v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
      v36 = 1024;
      v37 = 2357;
      v38 = 2112;
      v39 = (uint64_t)v26;
      v40 = 2048;
      v41 = self;
      v29 = " [%s] %s:%d %@(%p) Failed to allocate the feature list strings";
LABEL_50:
      _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&v32, 0x30u);
    }
  }
  else
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v24)
          return v24;
        -[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:].cold.1();
      }
      goto LABEL_51;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v24)
        return v24;
      v32 = 136316162;
      v33 = v27;
      v34 = 2080;
      v35 = "-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:]";
      v36 = 1024;
      v37 = 2351;
      v38 = 2112;
      v39 = (uint64_t)v25;
      v40 = 2048;
      v41 = self;
      v29 = " [%s] %s:%d %@(%p) Failed to allocate the fixed position feature list strings";
      goto LABEL_50;
    }
  }
LABEL_51:
  LOBYTE(v24) = 0;
  return v24;
}

- (id)newVideoConfigurationForMediaType:(unsigned __int8)a3
{
  uint64_t v3;
  VCMediaNegotiatorVideoConfiguration *v5;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
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
  VCSessionParticipantLocal *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(VCMediaNegotiatorVideoConfiguration);
  if (!v5)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newVideoConfigurationForMediaType:].cold.1();
      }
      goto LABEL_23;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_23;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v13 = 136316418;
    v14 = v9;
    v15 = 2080;
    v16 = "-[VCSessionParticipantLocal newVideoConfigurationForMediaType:]";
    v17 = 1024;
    v18 = 2372;
    v19 = 2112;
    v20 = v7;
    v21 = 2048;
    v22 = self;
    v23 = 1024;
    v24 = v3;
    v11 = " [%s] %s:%d %@(%p) Failed to allocate videoConfiguration for mediaType=%hhu";
    goto LABEL_25;
  }
  -[VCMediaNegotiatorCommonConfiguration setSsrc:](v5, "setSsrc:", -[VCSessionParticipantLocal generateSSRC](self, "generateSSRC"));
  -[VCMediaNegotiatorVideoConfiguration setVideoRuleCollections:](v5, "setVideoRuleCollections:", -[VCSessionParticipantLocal u1VideoRuleCollectionsForMediaType:](self, "u1VideoRuleCollectionsForMediaType:", v3));
  if (!-[VCSessionParticipantLocal addFeatureListStringsForVideoConfiguration:mediaType:](self, "addFeatureListStringsForVideoConfiguration:mediaType:", v5, v3))
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newVideoConfigurationForMediaType:].cold.2();
      }
      goto LABEL_23;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v12 = VRTraceErrorLogLevelToCSTR(),
          v10 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_23:

      return 0;
    }
    v13 = 136316418;
    v14 = v12;
    v15 = 2080;
    v16 = "-[VCSessionParticipantLocal newVideoConfigurationForMediaType:]";
    v17 = 1024;
    v18 = 2378;
    v19 = 2112;
    v20 = v8;
    v21 = 2048;
    v22 = self;
    v23 = 1024;
    v24 = v3;
    v11 = " [%s] %s:%d %@(%p) Failed to add FLS settings for mediaType=%hhu";
LABEL_25:
    _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v13, 0x36u);
    goto LABEL_23;
  }
  return v5;
}

- (void)streamGroupNegotiationVideoConfigForStreamGroup:(id)a3 streamConfig:(id)a4 mediaConfig:(id)a5
{
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v8 = (void *)objc_msgSend(a5, "multiwayConfig");
  if (objc_msgSend(a3, "mediaType") == 1986618469)
  {
    if (objc_msgSend(a3, "streamGroupID") == 1935897189)
      v9 = 1;
    else
      v9 = 3;
    objc_msgSend(a4, "setCoordinateSystem:", v9);
    if (objc_msgSend(a5, "videoResolution") == 27)
    {
      v10 = (double)(unint64_t)objc_msgSend(a5, "customWidth");
      v11 = (double)(unint64_t)objc_msgSend(a5, "customHeight");
    }
    else
    {
      +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", objc_msgSend(a5, "videoResolution"));
      v10 = v12;
    }
    objc_msgSend(a4, "setResolution:", v10, v11);
    objc_msgSend(a4, "setFramerate:", objc_msgSend(a5, "framerate"));
    objc_msgSend(a4, "setKeyFrameInterval:", objc_msgSend(a5, "keyFrameInterval"));
    objc_msgSend(a4, "setIsSubStream:", objc_msgSend(v8, "isSubStream"));
  }
  else
  {
    if (objc_msgSend(a3, "mediaType") != 1835365473)
      return;
    objc_msgSend(a4, "setFramerate:", objc_msgSend(a5, "framerate"));
  }
  objc_msgSend(a4, "setIsTemporalStream:", objc_msgSend(v8, "isTemporalStream"));
  objc_msgSend(a4, "setParentStreamID:", objc_msgSend(v8, "parentStreamID"));
}

+ (BOOL)negotiatorCipherSuite:(unsigned int *)a3 fromMediaStreamConfig:(id)a4
{
  int v6;
  unsigned int v7;

  v6 = objc_msgSend(a4, "sframeCipherSuite");
  if (v6 == 2)
  {
    v7 = 2;
LABEL_7:
    *a3 = v7;
LABEL_8:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (v6 == 1)
  {
    *a3 = 1;
    return v6;
  }
  if (objc_msgSend(a4, "SRTPCipherSuite") == 3)
  {
    v7 = 3;
    goto LABEL_7;
  }
  if (-[VCDefaults forceDisableMediaEncryption](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableMediaEncryption")&& !objc_msgSend(a4, "SRTPCipherSuite"))
  {
    *a3 = 0;
    goto LABEL_8;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v6)
      return v6;
    +[VCSessionParticipantLocal negotiatorCipherSuite:fromMediaStreamConfig:].cold.1();
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (id)newStreamGroupNegotiationConfigForStreamGroup:(id)a3
{
  VCMediaNegotiatorStreamGroupConfiguration *v4;
  __objc2_class **p_superclass;
  uint64_t v6;
  __objc2_class **v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  float v20;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v21;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v31;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
  id v45;
  id v46;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  _BYTE v71[128];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = -[VCMediaNegotiatorStreamGroupConfiguration initWithGroupID:mediaType:subtype:syncGroupID:]([VCMediaNegotiatorStreamGroupConfiguration alloc], "initWithGroupID:mediaType:subtype:syncGroupID:", objc_msgSend(a3, "streamGroupID"), objc_msgSend(a3, "mediaType"), objc_msgSend(a3, "mediaSubtype"), objc_msgSend(a3, "syncGroupID"));
  if (v4)
  {
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = (id)objc_msgSend(a3, "mediaStreamInfoArray");
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
    if (v42)
    {
      p_superclass = VCMediaNegotiatorResultsCaptions.superclass;
      v6 = *(_QWORD *)v78;
      v7 = VCMediaNegotiatorResultsCaptions.superclass;
      v45 = a3;
      v41 = *(_QWORD *)v78;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v78 != v6)
          {
            v9 = v8;
            objc_enumerationMutation(obj);
            v8 = v9;
          }
          v44 = v8;
          v10 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v8);
          v72 = 0u;
          v73 = 0u;
          v74 = 0u;
          v75 = 0u;
          v46 = (id)objc_msgSend(v10, "streamConfigs", v41);
          v50 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
          if (v50)
          {
            v49 = *(_QWORD *)v73;
            while (2)
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v73 != v49)
                  objc_enumerationMutation(v46);
                v12 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v11);
                v13 = objc_alloc_init((Class)(p_superclass + 29));
                v52 = 0;
                if (!v13)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                      -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:].cold.2();
                  }
                  goto LABEL_56;
                }
                v14 = v13;
                if ((objc_msgSend(v7 + 464, "negotiatorCipherSuite:fromMediaStreamConfig:", &v52, v12) & 1) == 0)
                {

                  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                  {
                    VRTraceErrorLogLevelToCSTR();
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                      -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:].cold.7();
                  }
                  goto LABEL_56;
                }
                v15 = (void *)objc_msgSend(v12, "multiwayConfig");
                v51 = v11;
                if ((objc_msgSend(v15, "negotiationProtocolMask") & 2) != 0)
                {
                  objc_msgSend(v14, "setSsrc:", objc_msgSend(v15, "ssrc"));
                  objc_msgSend(v14, "setStreamID:", objc_msgSend(v15, "idsStreamID"));
                  objc_msgSend(v14, "setV2StreamID:", objc_msgSend(v15, "v2StreamID"));
                  objc_msgSend(v14, "setQualityIndex:", objc_msgSend(v15, "qualityIndex"));
                  objc_msgSend(v14, "setMaxNetworkBitrate:", objc_msgSend(v15, "maxNetworkBitrate"));
                  objc_msgSend(v14, "setMaxMediaBitrate:", objc_msgSend(v15, "maxMediaBitrate"));
                  objc_msgSend(v15, "maxPacketsPerSecond");
                  objc_msgSend(v14, "setMaxPacketsPerSecond:", v20);
                  objc_msgSend(v14, "setRepairedStreamID:", objc_msgSend(v15, "repairedStreamID"));
                  objc_msgSend(v14, "setRepairedMaxNetworkBitrate:", objc_msgSend(v15, "repairedMaxNetworkBitrate"));
                  objc_msgSend(v14, "setRtpTimestampRate:", objc_msgSend(v12, "rtpTimestampRate"));
                  v48 = v15;
                  if (objc_msgSend(a3, "mediaType") == 1986618469
                    || objc_msgSend(a3, "mediaType") == 1835365473)
                  {
                    -[VCSessionParticipantLocal streamGroupNegotiationVideoConfigForStreamGroup:streamConfig:mediaConfig:](self, "streamGroupNegotiationVideoConfigForStreamGroup:streamConfig:mediaConfig:", a3, v14, v12);
                    v21 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
                    if (!v21)
                    {

                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                          -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:].cold.3();
                      }
                      goto LABEL_56;
                    }
                    v22 = v21;
                    v23 = (void *)objc_msgSend((id)objc_msgSend(v12, "txPayloadMap"), "allKeys");
                    if (objc_msgSend(v23, "count") != 1)
                    {

                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                          -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:].cold.5();
                      }
                      goto LABEL_56;
                    }
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v22, "setCodecType:", +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", objc_msgSend((id)objc_msgSend(v23, "objectAtIndexedSubscript:", 0), "unsignedIntValue")));
                    v24 = (void *)objc_msgSend((id)objc_msgSend(v12, "txPayloadMap"), "allValues");
                    if (objc_msgSend(v24, "count") != 1)
                    {

                      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                      {
                        VRTraceErrorLogLevelToCSTR();
                        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                          -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:].cold.4();
                      }
                      goto LABEL_56;
                    }
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v22, "setRtpPayload:", objc_msgSend((id)objc_msgSend(v24, "objectAtIndexedSubscript:", 0), "unsignedIntValue"));
                    if (objc_msgSend(v12, "profileLevel"))
                      -[VCMediaNegotiatorStreamGroupCodecConfiguration setProfileLevelId:](v22, "setProfileLevelId:", +[VCVideoStreamConfig profileLevelIdForString:](VCVideoStreamConfig, "profileLevelIdForString:", objc_msgSend(v12, "profileLevel")));
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpSREnabled:](v22, "setRtcpSREnabled:", objc_msgSend(v12, "isRTCPEnabled"));
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpPSFB_FIREnabled:](v22, "setRtcpPSFB_FIREnabled:", objc_msgSend(v12, "rtcpPSFB_FIREnabled"));
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setH264PacketizationMode:](v22, "setH264PacketizationMode:", 1);
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v22, "setCipherSuite:", v52);
                    -[VCMediaNegotiatorStreamGroupCodecConfiguration setEncoderUsage:](v22, "setEncoderUsage:", objc_msgSend(v12, "encoderUsage"));
                    -[VCMediaNegotiatorStreamGroupConfiguration addCodecConfig:](v4, "addCodecConfig:", v22);
                    objc_msgSend(v14, "addCodec:", -[VCMediaNegotiatorStreamGroupConfiguration indexOfCodecConfig:](v4, "indexOfCodecConfig:", v22));

                  }
                  else if (objc_msgSend(a3, "mediaType") == 1936684398)
                  {
                    objc_msgSend(v14, "setAudioChannelCount:", objc_msgSend(v12, "channelCount"));
                    if (objc_msgSend(v12, "codecConfigurations"))
                    {
                      v56 = 0uLL;
                      v57 = 0uLL;
                      v54 = 0uLL;
                      v55 = 0uLL;
                      v25 = (void *)objc_msgSend(v12, "codecConfigurations");
                      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
                      if (v26)
                      {
                        v27 = v26;
                        v28 = *(_QWORD *)v55;
                        while (2)
                        {
                          for (i = 0; i != v27; ++i)
                          {
                            if (*(_QWORD *)v55 != v28)
                              objc_enumerationMutation(v25);
                            v30 = (void *)objc_msgSend((id)objc_msgSend(v12, "codecConfigurations"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i));
                            v31 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
                            if (!v31)
                            {

                              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                              {
                                VRTraceErrorLogLevelToCSTR();
                                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                                  -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:].cold.6();
                              }
                              goto LABEL_56;
                            }
                            v32 = v31;
                            -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v31, "setCodecType:", objc_msgSend(v30, "codecType"));
                            -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v32, "setRtpPayload:", objc_msgSend(v30, "networkPayload"));
                            -[VCMediaNegotiatorStreamGroupCodecConfiguration setPTime:](v32, "setPTime:", objc_msgSend(v30, "pTime"));
                            -[VCMediaNegotiatorStreamGroupCodecConfiguration setUseInBandFEC:](v32, "setUseInBandFEC:", objc_msgSend(v30, "isOpusInBandFecEnabled"));
                            -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtcpSREnabled:](v32, "setRtcpSREnabled:", objc_msgSend(v12, "isRTCPEnabled"));
                            -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v32, "setCipherSuite:", v52);
                            -[VCMediaNegotiatorStreamGroupConfiguration addCodecConfig:](v4, "addCodecConfig:", v32);
                            objc_msgSend(v14, "addCodec:", -[VCMediaNegotiatorStreamGroupConfiguration indexOfCodecConfig:](v4, "indexOfCodecConfig:", v32));

                          }
                          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
                          a3 = v45;
                          if (v27)
                            continue;
                          break;
                        }
                      }
                    }
                    else
                    {
                      v61 = 0uLL;
                      v62 = 0uLL;
                      v59 = 0uLL;
                      v60 = 0uLL;
                      v33 = (void *)objc_msgSend((id)objc_msgSend(v12, "txPayloadMap"), "allKeys");
                      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
                      if (v34)
                      {
                        v35 = v34;
                        v36 = *(_QWORD *)v60;
                        do
                        {
                          for (j = 0; j != v35; ++j)
                          {
                            if (*(_QWORD *)v60 != v36)
                              objc_enumerationMutation(v33);
                            objc_msgSend(v14, "addPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "unsignedIntValue"));
                          }
                          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
                        }
                        while (v35);
                      }
                    }
                  }
                  -[VCMediaNegotiatorStreamGroupConfiguration addStreamConfig:](v4, "addStreamConfig:", v14);

                  -[NSMutableSet addObjectsFromArray:](self->_localPublishedStreams, "addObjectsFromArray:", objc_msgSend(v48, "streamIds"));
                  p_superclass = (__objc2_class **)(VCMediaNegotiatorResultsCaptions + 8);
                  v7 = (__objc2_class **)(VCMediaNegotiatorResultsCaptions + 8);
                }
                else
                {
                  v16 = v15;
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    v17 = VRTraceErrorLogLevelToCSTR();
                    v18 = *MEMORY[0x1E0CF2758];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    {
                      v19 = objc_msgSend(v16, "qualityIndex");
                      *(_DWORD *)buf = 136315906;
                      v64 = v17;
                      v65 = 2080;
                      v66 = "-[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:]";
                      v67 = 1024;
                      v68 = 2457;
                      v69 = 1024;
                      v70 = v19;
                      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping stream = %d", buf, 0x22u);
                    }
                  }

                }
                v11 = v51 + 1;
              }
              while (v51 + 1 != v50);
              v38 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v72, v71, 16);
              v50 = v38;
              if (v38)
                continue;
              break;
            }
          }
          v8 = v44 + 1;
          v6 = v41;
        }
        while (v44 + 1 != v42);
        v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v76, 16);
        v6 = v41;
        v42 = v39;
      }
      while (v39);
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:].cold.1();
    }
LABEL_56:

    return 0;
  }
  return v4;
}

- (void)initializeMultiwayAudioStreamGroup:(id)a3 forLocalConfig:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  v6 = (void *)objc_msgSend(a3, "mediaStreamInfoArray");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
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
        v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
        if ((objc_msgSend(v11, "negotiationProtocolMask") & 1) != 0)
          objc_msgSend(a4, "addMultiwayAudioStream:", -[VCSessionParticipantLocal multiwayAudioStreamNegotiatorConfigForStreamConfig:](self, "multiwayAudioStreamNegotiatorConfigForStreamConfig:", v11));
        -[NSMutableSet addObjectsFromArray:](self->_localPublishedStreams, "addObjectsFromArray:", objc_msgSend(v11, "streamIds"));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v8);
  }
}

- (void)initializeMultiwayVideoStreamGroup:(id)a3 forLocalConfig:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  v6 = (void *)objc_msgSend(a3, "mediaStreamInfoArray");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
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
        v11 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
        if ((objc_msgSend(v11, "negotiationProtocolMask") & 1) != 0)
        {
          objc_msgSend(a4, "addMultiwayVideoStream:", -[VCSessionParticipantLocal multiwayVideoStreamNegotiatorConfigForStreamConfig:isSubstream:](self, "multiwayVideoStreamNegotiatorConfigForStreamConfig:isSubstream:", v11, 0));
          -[NSMutableSet addObjectsFromArray:](self->_localPublishedStreams, "addObjectsFromArray:", objc_msgSend(v11, "streamIds"));
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v8);
  }
}

- (BOOL)initializeStreamGroupsForLocalConfig:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  char v12;
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
  v5 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
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
        if (objc_msgSend(v10, "streamGroupID") == 1667329381)
        {
          -[VCSessionParticipantLocal initializeMultiwayVideoStreamGroup:forLocalConfig:](self, "initializeMultiwayVideoStreamGroup:forLocalConfig:", v10, a3);
        }
        else if (objc_msgSend(v10, "streamGroupID") == 1835623282)
        {
          -[VCSessionParticipantLocal initializeMultiwayAudioStreamGroup:forLocalConfig:](self, "initializeMultiwayAudioStreamGroup:forLocalConfig:", v10, a3);
        }
        if (!-[VCSessionParticipantLocal initializeOneToOneStreamGroup:forLocalConfig:](self, "initializeOneToOneStreamGroup:forLocalConfig:", v10, a3))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantLocal initializeStreamGroupsForLocalConfig:].cold.1();
          }
          v11 = 0;
          v12 = 0;
          return v11 | v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      if (v7)
        continue;
      break;
    }
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  v12 = 1;
  return v11 | v12;
}

- (BOOL)initializeOneToOneStreamGroup:(id)a3 forLocalConfig:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  char v10;
  _BOOL4 v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = -[VCSessionParticipantLocal newStreamGroupNegotiationConfigForStreamGroup:](self, "newStreamGroupNegotiationConfigForStreamGroup:");
  if (v6)
  {
    v7 = -[VCMediaNegotiatorStreamGroupU1Configuration initStreamGroupU1ConfigForGroupId:withLocalConfig:]([VCMediaNegotiatorStreamGroupU1Configuration alloc], "initStreamGroupU1ConfigForGroupId:withLocalConfig:", objc_msgSend(a3, "streamGroupID"), a4);
    if (v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v17 = 136315906;
          v18 = v8;
          v19 = 2080;
          v20 = "-[VCSessionParticipantLocal initializeOneToOneStreamGroup:forLocalConfig:]";
          v21 = 1024;
          v22 = 2598;
          v23 = 2080;
          v24 = FourccToCStr(objc_msgSend(v6, "groupID"));
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Successfully created stream group U1 config for groupID=%s", (uint8_t *)&v17, 0x26u);
        }
      }
      objc_msgSend(v6, "setU1Config:", v7);
    }
    else
    {
      v11 = +[VCMediaNegotiatorBase isU1StreamGroup:](VCMediaNegotiatorBase, "isU1StreamGroup:", objc_msgSend(v6, "groupID"));
      if (v11)
        v12 = 3;
      else
        v12 = 5;
      if (v12 > (int)VRTraceGetErrorLogLevelForModule())
      {
        v10 = !v11;
        goto LABEL_17;
      }
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      v15 = *MEMORY[0x1E0CF2758];
      if (v11)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal initializeOneToOneStreamGroup:forLocalConfig:].cold.2();
        v10 = 0;
        goto LABEL_17;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315906;
        v18 = v13;
        v19 = 2080;
        v20 = "-[VCSessionParticipantLocal initializeOneToOneStreamGroup:forLocalConfig:]";
        v21 = 1024;
        v22 = 2605;
        v23 = 2080;
        v24 = FourccToCStr(objc_msgSend(v6, "groupID"));
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to create stream group U1 config for groupID=%s", (uint8_t *)&v17, 0x26u);
      }
    }
    v10 = 1;
LABEL_17:
    objc_msgSend(a4, "addStreamGroupConfig:", v6);

    goto LABEL_18;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipantLocal initializeOneToOneStreamGroup:forLocalConfig:].cold.1();
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (id)featureListString:(id)a3 removingPayload:(int)a4 andPayload:(int)a5 mediaType:(unsigned __int8)a6
{
  id result;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  result = a3;
  if (a6 == 2)
  {
    v7 = *(_QWORD *)&a5;
    v8 = *(_QWORD *)&a4;
    v9 = (void *)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7));
    return v9;
  }
  return result;
}

- (BOOL)addVideoConfigurationsToLocalConfiguration:(id)a3
{
  int v5;
  id v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  const __CFString *v10;
  uint64_t v12;
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
  VCSessionParticipantLocal *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = 2;
  v6 = -[VCSessionParticipantLocal newVideoConfigurationForMediaType:](self, "newVideoConfigurationForMediaType:", 2);
  if (v6)
  {
    v7 = v6;
    v8 = 1u;
    while (1)
    {
      objc_msgSend(a3, "setMediaConfiguration:forMediaType:", v7, v5);

      if (v8 == 4)
        return 1;
      v5 = *((unsigned __int8 *)&unk_1D910D8B0 + v8);
      v7 = -[VCSessionParticipantLocal newVideoConfigurationForMediaType:](self, "newVideoConfigurationForMediaType:", *((unsigned __int8 *)&unk_1D910D8B0 + v8++));
      if (!v7)
      {
        v9 = (unint64_t)(v8 - 2) > 2;
        goto LABEL_6;
      }
    }
  }
  else
  {
    v9 = 0;
LABEL_6:
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal addVideoConfigurationsToLocalConfiguration:].cold.1(v12);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v15 = 136316418;
          v16 = v13;
          v17 = 2080;
          v18 = "-[VCSessionParticipantLocal addVideoConfigurationsToLocalConfiguration:]";
          v19 = 1024;
          v20 = 2636;
          v21 = 2112;
          v22 = v10;
          v23 = 2048;
          v24 = self;
          v25 = 1024;
          v26 = v5;
          _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create videoConfiguration for mediaType=%hhu", (uint8_t *)&v15, 0x36u);
        }
      }
    }
  }
  return v9;
}

- (BOOL)addMediaConfigurationsToLocalConfiguration:(id)a3
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
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
  VCSessionParticipantLocal *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = -[VCSessionParticipantLocal newMediaNegotiatorAudioConfigurationForMediaType:](self, "newMediaNegotiatorAudioConfigurationForMediaType:", 0);
  if (!v5)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:].cold.1();
      }
      goto LABEL_30;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_30;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v19 = 136316162;
    v20 = v13;
    v21 = 2080;
    v22 = "-[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:]";
    v23 = 1024;
    v24 = 2652;
    v25 = 2112;
    v26 = v10;
    v27 = 2048;
    v28 = self;
    v15 = " [%s] %s:%d %@(%p) Failed to create microphoneConfiguration";
    goto LABEL_37;
  }
  v6 = -[VCSessionParticipantLocal newMediaNegotiatorAudioConfigurationForMediaType:](self, "newMediaNegotiatorAudioConfigurationForMediaType:", 3);
  if (!v6)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:].cold.2();
      }
      goto LABEL_30;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v16 = VRTraceErrorLogLevelToCSTR(),
          v14 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_30:
      v7 = 0;
LABEL_31:
      v8 = 0;
      goto LABEL_4;
    }
    v19 = 136316162;
    v20 = v16;
    v21 = 2080;
    v22 = "-[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:]";
    v23 = 1024;
    v24 = 2656;
    v25 = 2112;
    v26 = v11;
    v27 = 2048;
    v28 = self;
    v15 = " [%s] %s:%d %@(%p) Failed to create systemAudioConfiguration";
LABEL_37:
    _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v19, 0x30u);
    goto LABEL_30;
  }
  v7 = v6;
  v8 = 1;
  objc_msgSend(a3, "setMediaConfiguration:forMediaType:", v5, 1);
  objc_msgSend(a3, "setMediaConfiguration:forMediaType:", v7, 4);
  if (!-[VCSessionParticipantLocal addVideoConfigurationsToLocalConfiguration:](self, "addVideoConfigurationsToLocalConfiguration:", a3))
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v19 = 136316162;
          v20 = v17;
          v21 = 2080;
          v22 = "-[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:]";
          v23 = 1024;
          v24 = 2663;
          v25 = 2112;
          v26 = v12;
          v27 = 2048;
          v28 = self;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to add U+1 video configurations to local settings", (uint8_t *)&v19, 0x30u);
        }
      }
    }
    goto LABEL_31;
  }
LABEL_4:

  return v8;
}

- (BOOL)initializeMediaNegotiator
{
  VCBitrateArbiter *v3;
  VCMediaNegotiatorLocalConfiguration *v4;
  VCMediaNegotiatorLocalConfiguration *v5;
  VCSwitchManager *v6;
  BOOL v7;
  const __CFString *v9;
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
  VCSessionParticipantLocal *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = -[VCBitrateArbiter initWithDeviceRole:callLogFile:]([VCBitrateArbiter alloc], "initWithDeviceRole:callLogFile:", 0, 0);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal initializeMediaNegotiator].cold.1();
    }
    goto LABEL_15;
  }
  v4 = -[VCMediaNegotiatorLocalConfiguration initWithBitrateArbiter:]([VCMediaNegotiatorLocalConfiguration alloc], "initWithBitrateArbiter:", v3);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal initializeMediaNegotiator].cold.2();
    }
LABEL_15:
    v5 = 0;
LABEL_16:
    v7 = 0;
    goto LABEL_8;
  }
  v5 = v4;
  -[VCMediaNegotiatorLocalConfiguration setPreferredAudioCodec:](v4, "setPreferredAudioCodec:", 104);
  -[VCMediaNegotiatorLocalConfiguration setAllowRTCPFB:](v5, "setAllowRTCPFB:", 0);
  -[VCMediaNegotiatorLocalConfiguration setIsCaller:](v5, "setIsCaller:", 1);
  -[VCMediaNegotiatorLocalConfiguration setCallLogFile:](v5, "setCallLogFile:", 0);
  -[VCMediaNegotiatorLocalConfiguration setBasebandCodec:](v5, "setBasebandCodec:", 0);
  -[VCMediaNegotiatorLocalConfiguration setBasebandCodecSampleRate:](v5, "setBasebandCodecSampleRate:", 0);
  -[VCMediaNegotiatorLocalConfiguration setCreationTime:](v5, "setCreationTime:", self->super._creationTime.wide);
  -[VCMediaNegotiatorLocalConfiguration setOneToOneAuthTagEnabled:](v5, "setOneToOneAuthTagEnabled:", self->_isOneToOneAuthenticationTagEnabled);
  if (-[VCDefaults supportsOneToOneMode](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "supportsOneToOneMode")&& !+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("simulateWebRTCOnlyClient"), 0))
  {
    -[VCMediaNegotiatorLocalConfiguration setOneToOneModeSupported:](v5, "setOneToOneModeSupported:", 1);
    -[VCMediaNegotiatorLocalConfiguration setMediaControlInfoVersion:](v5, "setMediaControlInfoVersion:", 2);
  }
  -[VCSessionParticipantLocal addMediaConfigurationsToLocalConfiguration:](self, "addMediaConfigurationsToLocalConfiguration:", v5);
  if (!-[VCSessionParticipantLocal initializeStreamGroupsForLocalConfig:](self, "initializeStreamGroupsForLocalConfig:", v5))
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal initializeMediaNegotiator].cold.3();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v12 = 136316162;
          v13 = v10;
          v14 = 2080;
          v15 = "-[VCSessionParticipantLocal initializeMediaNegotiator]";
          v16 = 1024;
          v17 = 2696;
          v18 = 2112;
          v19 = v9;
          v20 = 2048;
          v21 = self;
          _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to initialize stream groups for local configuration", (uint8_t *)&v12, 0x30u);
        }
      }
    }
    goto LABEL_16;
  }
  -[VCMediaNegotiatorLocalConfiguration setMediaRecorderVideoCodecs:](v5, "setMediaRecorderVideoCodecs:", -[VCVideoRuleCollectionsMediaRecorder mediaRecorderVideoCodecs](+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance"), "mediaRecorderVideoCodecs"));
  -[VCMediaNegotiatorLocalConfiguration setMediaRecorderImageTypes:](v5, "setMediaRecorderImageTypes:", -[VCVideoRuleCollectionsMediaRecorder mediaRecorderImageTypes](+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance"), "mediaRecorderImageTypes"));

  v6 = objc_alloc_init(VCSwitchManager);
  self->_oneToOneSettings.switchManager = v6;
  -[VCSwitchManager initializeLocalSwitches](v6, "initializeLocalSwitches");
  -[VCMediaNegotiatorLocalConfiguration setFaceTimeSwitches:](v5, "setFaceTimeSwitches:", -[VCSwitchManager localSwitches](self->_oneToOneSettings.switchManager, "localSwitches"));
  self->super._mediaNegotiator = -[VCSessionMediaNegotiator initWithLocalConfiguration:]([VCSessionMediaNegotiator alloc], "initWithLocalConfiguration:", v5);
  v7 = 1;
LABEL_8:

  return v7;
}

- (void)updatePayloadTypesWithVideoConfigs:(id)a3
{
  uint64_t v5;

  if ((int)objc_msgSend(a3, "count") >= 1)
  {
    v5 = 0;
    do
      -[NSMutableSet addObjectsFromArray:](self->_videoPayloadTypes, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v5++), "txPayloadMap"), "allKeys"));
    while (v5 < (int)objc_msgSend(a3, "count"));
  }
}

- (void)updatePayloadTypesWithAudioConfigs:(id)a3
{
  uint64_t v5;
  void *v6;

  if ((int)objc_msgSend(a3, "count") >= 1)
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v5);
      -[NSMutableSet addObjectsFromArray:](self->_audioPayloadTypes, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(v6, "txPayloadMap"), "allKeys"));
      -[NSMutableSet addObjectsFromArray:](self->_audioPayloadTypes, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "multiwayConfig"), "txPayloadMap"), "allKeys"));
      ++v5;
    }
    while (v5 < (int)objc_msgSend(a3, "count"));
  }
}

- (unsigned)oneToOneVideoStreamRedundancyPercentage
{
  _BOOL4 v2;
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  double v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = -[VCSwitchManager isSwitchEnabled:](self->_oneToOneSettings.switchManager, "isSwitchEnabled:", 4);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315906;
      v16 = v5;
      v17 = 2080;
      v18 = "-[VCSessionParticipantLocal oneToOneVideoStreamRedundancyPercentage]";
      v19 = 1024;
      v20 = 2734;
      v21 = 1024;
      v22 = v2;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch highFecEnabled %d", (uint8_t *)&v15, 0x22u);
    }
  }
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-video-redundancy-percentage-max"), CFSTR("videoRedundancyPercentageMax"), &unk_1E9EF54C8, 1), "doubleValue");
  v8 = v7;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315906;
      v16 = v9;
      v17 = 2080;
      v18 = "-[VCSessionParticipantLocal oneToOneVideoStreamRedundancyPercentage]";
      v19 = 1024;
      v20 = 2736;
      v21 = 1024;
      v22 = v8;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d currentRedundancyPercentage before abTestSwitch %d", (uint8_t *)&v15, 0x22u);
    }
  }
  if (v2)
    v11 = v8;
  else
    v11 = 100;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315906;
      v16 = v12;
      v17 = 2080;
      v18 = "-[VCSessionParticipantLocal oneToOneVideoStreamRedundancyPercentage]";
      v19 = 1024;
      v20 = 2738;
      v21 = 1024;
      v22 = v11;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d maxAllowedRedundancyPercentage after abTestSwitch %d", (uint8_t *)&v15, 0x22u);
    }
  }
  return v11;
}

- (unsigned)oneToOneVideoStreamRedundancyMode
{
  _BOOL4 v3;
  uint64_t v4;
  NSObject *v5;
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
  v3 = -[VCSwitchManager isSwitchEnabled:](self->_oneToOneSettings.switchManager, "isSwitchEnabled:", 16);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCSessionParticipantLocal oneToOneVideoStreamRedundancyMode]";
      v11 = 1024;
      v12 = 2745;
      v13 = 1024;
      v14 = v3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch vplrFecEnabled %d", (uint8_t *)&v7, 0x22u);
    }
  }
  if (-[VCMediaNegotiatorResults mediaControlInfoVersion](-[VCSessionMediaNegotiator negotiatedSettings](self->super._mediaNegotiator, "negotiatedSettings"), "mediaControlInfoVersion") > 1&& v3)
  {
    return 6;
  }
  else
  {
    return 5;
  }
}

- (unsigned)oneToOneAudioStreamRedundancyMode
{
  if (-[VCMediaNegotiatorResultsAudio redPayload](-[VCSessionMediaNegotiator negotiatedAudioSettings](self->super._mediaNegotiator, "negotiatedAudioSettings"), "redPayload") != 20)return 1;
  if (self->_isHigherAudioREDCutoverU1Enabled)
    return 3;
  return 2;
}

- (int)negotiateOneToOne:(id)a3
{
  void *v5;
  void *v6;
  VCSessionMediaNegotiator *v7;
  VCSessionMediaNegotiator *v8;
  id v9;
  uint64_t v10;
  int v11;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  VCSessionParticipantLocal *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[VCMediaNegotiatorLocalConfiguration copy](-[VCSessionMediaNegotiator localSettings](self->super._mediaNegotiator, "localSettings"), "copy");
  v6 = v5;
  if (!v5)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      v11 = -2143813630;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_45;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      v27 = 136316162;
      v28 = v18;
      v29 = 2080;
      v30 = "-[VCSessionParticipantLocal negotiateOneToOne:]";
      v31 = 1024;
      v32 = 2765;
      v33 = 2112;
      v34 = v13;
      v35 = 2048;
      v36 = self;
      v20 = " [%s] %s:%d %@(%p) Failed to copy the local configuration";
LABEL_60:
      _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v27, 0x30u);
      goto LABEL_61;
    }
    v11 = -2143813630;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        -[VCSessionParticipantLocal negotiateOneToOne:].cold.1();
LABEL_61:
        v8 = 0;
        v11 = -2143813630;
        goto LABEL_7;
      }
    }
LABEL_45:
    v8 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v5, "setIsCaller:", 0);
  v7 = -[VCSessionMediaNegotiator initWithLocalConfiguration:]([VCSessionMediaNegotiator alloc], "initWithLocalConfiguration:", v6);
  if (!v7)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      v11 = -2143813630;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_45;
      v21 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      v27 = 136316162;
      v28 = v21;
      v29 = 2080;
      v30 = "-[VCSessionParticipantLocal negotiateOneToOne:]";
      v31 = 1024;
      v32 = 2769;
      v33 = 2112;
      v34 = v14;
      v35 = 2048;
      v36 = self;
      v20 = " [%s] %s:%d %@(%p) Failed to reinitialize the 1:1 media negotiator";
      goto LABEL_60;
    }
    v11 = -2143813630;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        -[VCSessionParticipantLocal negotiateOneToOne:].cold.2();
        goto LABEL_61;
      }
    }
    goto LABEL_45;
  }
  v8 = v7;
  v9 = +[VCSessionParticipant participantInfoWithParticipantData:](VCSessionParticipant, "participantInfoWithParticipantData:", objc_msgSend(a3, "opaqueData"));
  -[VCSessionParticipantLocal logRemoteParticipantInfo:](self, "logRemoteParticipantInfo:", v9);
  v10 = objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyMediaNegotiationData"));
  if (!v10)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      v11 = -2143813631;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal negotiateOneToOne:].cold.3();
      }
      goto LABEL_7;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    v11 = -2143813631;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_7;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v27 = 136316162;
    v28 = v22;
    v29 = 2080;
    v30 = "-[VCSessionParticipantLocal negotiateOneToOne:]";
    v31 = 1024;
    v32 = 2775;
    v33 = 2112;
    v34 = v15;
    v35 = 2048;
    v36 = self;
    v24 = " [%s] %s:%d %@(%p) Failed to extract media blob from remote participant info";
LABEL_58:
    _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v27, 0x30u);
    goto LABEL_7;
  }
  if (!-[VCSessionMediaNegotiator processRemoteNegotiationData:](v8, "processRemoteNegotiationData:", v10))
  {
    v11 = -2143813631;
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal negotiateOneToOne:].cold.5();
      }
      goto LABEL_7;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_7;
    v25 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v27 = 136316162;
    v28 = v25;
    v29 = 2080;
    v30 = "-[VCSessionParticipantLocal negotiateOneToOne:]";
    v31 = 1024;
    v32 = 2778;
    v33 = 2112;
    v34 = v16;
    v35 = 2048;
    v36 = self;
    v24 = " [%s] %s:%d %@(%p) Failed to negotiate one to one settings with remote media blob";
    goto LABEL_58;
  }
  if (-[VCMediaNegotiatorResultsFaceTimeSettings oneToOneModeSupported](-[VCSessionMediaNegotiator negotiatedFaceTimeSettings](v8, "negotiatedFaceTimeSettings"), "oneToOneModeSupported"))
  {

    v11 = 0;
    self->super._mediaNegotiator = v8;
    goto LABEL_7;
  }
  v11 = -2143813631;
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal negotiateOneToOne:].cold.4();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v27 = 136316162;
        v28 = v26;
        v29 = 2080;
        v30 = "-[VCSessionParticipantLocal negotiateOneToOne:]";
        v31 = 1024;
        v32 = 2779;
        v33 = 2112;
        v34 = v17;
        v35 = 2048;
        v36 = self;
        v24 = " [%s] %s:%d %@(%p) Failed to negotiate with devices that does not support one to one";
        goto LABEL_58;
      }
    }
  }
LABEL_7:

  return v11;
}

- (void)logRemoteParticipantInfo:(id)a3
{
  VCCallInfoBlob *v3;
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
  v3 = -[VCCallInfoBlob initWithData:]([VCCallInfoBlob alloc], "initWithData:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcSessionParticipantKeyCallInfoBlob")));
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend((id)-[VCCallInfoBlob formattedText](v3, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", ")))
        {
          v6 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[VCCallInfoBlob formattedText](v3, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", ")), "description"), "UTF8String");
        }
        else
        {
          v6 = "<nil>";
        }
        v7 = 136315906;
        v8 = v4;
        v9 = 2080;
        v10 = "-[VCSessionParticipantLocal logRemoteParticipantInfo:]";
        v11 = 1024;
        v12 = 2795;
        v13 = 2080;
        v14 = v6;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Remote callInfoBlob = %s", (uint8_t *)&v7, 0x26u);
      }
    }
  }

}

- (void)overrideVideoStreamConfigWithDefaults:(id)a3 streamGroupID:(unsigned int)a4
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
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a4 == 1667329381)
  {
    if (-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
    {
      objc_msgSend(a3, "setVideoResolution:", 27);
      objc_msgSend(a3, "setCustomWidth:", -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth"));
      objc_msgSend(a3, "setCustomHeight:", -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight"));
      objc_msgSend(a3, "setFramerate:", -[VCDefaults forceFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFramerate"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136316418;
          v8 = v5;
          v9 = 2080;
          v10 = "-[VCSessionParticipantLocal overrideVideoStreamConfigWithDefaults:streamGroupID:]";
          v11 = 1024;
          v12 = 2807;
          v13 = 2048;
          v14 = objc_msgSend(a3, "customWidth");
          v15 = 2048;
          v16 = objc_msgSend(a3, "customHeight");
          v17 = 2048;
          v18 = objc_msgSend(a3, "framerate");
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forcing oneToOneVideoConfig settings width=%lu, height=%lu, framerate=%lufps", (uint8_t *)&v7, 0x3Au);
        }
      }
    }
  }
}

- (BOOL)setupOneToOneVideoStreamWithConfig:(id)a3 streamGroupID:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  VCSessionParticipantLocal *v13;
  VCSessionParticipantLocal *v14;
  __CFString *v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v20;
  const __CFString *v21;
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
  VCSessionParticipantLocal *v35;
  __int16 v36;
  char *v37;
  uint64_t v38;

  v4 = *(_QWORD *)&a4;
  v38 = *MEMORY[0x1E0C80C00];
  v7 = -[VCSessionParticipantLocal newVideoStreamOneToOneConfigurationWithStreamGroupId:](self, "newVideoStreamOneToOneConfigurationWithStreamGroupId:", *(_QWORD *)&a4);
  if (!v7)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:].cold.1();
      }
      goto LABEL_38;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_38;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_38;
    v26 = 136316418;
    v27 = v22;
    v28 = 2080;
    v29 = "-[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:]";
    v30 = 1024;
    v31 = 2818;
    v32 = 2112;
    v33 = v20;
    v34 = 2048;
    v35 = self;
    v36 = 2080;
    v37 = FourccToCStr(v4);
    v24 = " [%s] %s:%d %@(%p) Error setting up the config for one-to-one mode for streamGroupId=%s";
    goto LABEL_40;
  }
  objc_msgSend((id)objc_msgSend(v7, "multiwayConfig"), "setRemoteIDSParticipantID:", objc_msgSend(a3, "idsParticipantID"));
  objc_msgSend(v7, "setTxMaxBitrate:", 1000* -[VCSessionMediaNegotiator remoteMaxBandwidthForArbiterMode:connectionType:](self->super._mediaNegotiator, "remoteMaxBandwidthForArbiterMode:connectionType:", 1, 3));
  objc_msgSend(v7, "setVideoResolution:", objc_msgSend((id)objc_msgSend(v7, "multiwayConfig"), "resolution"));
  if ((_DWORD)v4 == 1935897189)
    objc_msgSend(v7, "setPixelFormat:", 875704422);
  -[VCSessionParticipantLocal overrideVideoStreamConfigWithDefaults:streamGroupID:](self, "overrideVideoStreamConfigWithDefaults:streamGroupID:", v7, v4);
  v8 = -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:](self, "newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:", v7, v4, -[VCMediaNegotiatorResultsVideo cipherSuite](-[VCSessionMediaNegotiator negotiatedVideoSettings](self->super._mediaNegotiator, "negotiatedVideoSettings"), "cipherSuite"));
  if (!v8)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:].cold.2();
      }
      goto LABEL_38;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v25 = VRTraceErrorLogLevelToCSTR(),
          v23 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_38:
      v12 = 0;
      v14 = 0;
      v9 = 0;
LABEL_13:
      v16 = 0;
      goto LABEL_14;
    }
    v26 = 136316418;
    v27 = v25;
    v28 = 2080;
    v29 = "-[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:]";
    v30 = 1024;
    v31 = 2829;
    v32 = 2112;
    v33 = v21;
    v34 = 2048;
    v35 = self;
    v36 = 2080;
    v37 = FourccToCStr(v4);
    v24 = " [%s] %s:%d %@(%p) Failed to set up video stream for streamGroupId=%s";
LABEL_40:
    _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v26, 0x3Au);
    goto LABEL_38;
  }
  v9 = v8;
  -[NSMutableDictionary setObject:forKey:](self->_oneToOneSettings.streamInfo, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  -[VCSessionParticipantLocal updateOneToOneBandwidthAllocationTable:mediaType:streamGroupID:](self, "updateOneToOneBandwidthAllocationTable:mediaType:streamGroupID:", v9, 2, v4);
  v10 = -[VCSessionParticipantLocal oneToOneVideoStreamRedundancyMode](self, "oneToOneVideoStreamRedundancyMode");
  v11 = -[VCSessionParticipantLocal oneToOneVideoStreamRedundancyPercentage](self, "oneToOneVideoStreamRedundancyPercentage");
  v12 = (void *)objc_msgSend(-[VCSessionMediaStreamPresenceConfigurationProvider defaultEndToEndStreamGroupConfigurationForStreamGroup:](self->_presenceProvider, "defaultEndToEndStreamGroupConfigurationForStreamGroup:", v4), "mutableCopy");
  objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10), CFSTR("streamGroupRedundancyMode"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11), CFSTR("streamGroupRedundancyPercent"));
  v13 = -[VCSessionParticipantLocal newVideoSendGroupConfigWithStreamGroupID:streamGroupConfiguration:](self, "newVideoSendGroupConfigWithStreamGroupID:streamGroupConfiguration:", v4, v12);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:].cold.3();
    }
    v14 = 0;
    goto LABEL_13;
  }
  v14 = v13;
  if ((_DWORD)v4 == 1935897189)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfigs"), "firstObject"), "setIsRedundancyControlEnabled:", 1);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfigs"), "firstObject"), "setMaxRedundancyPercentage:", 100);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfigs"), "firstObject"), "setRedundancyControllerMode:", 9);
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfigs"), "firstObject"), "setRedundancyControllerFECVersion:", 1);
  }
  else
  {
    -[VCSessionParticipant setStatisticsCollector:](v13, "setStatisticsCollector:", -[VCSessionParticipantOneToOneConfig statisticsCollector](self->super._oneToOneConfig, "statisticsCollector"));
  }
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "streamConfigs"), "firstObject"), "setCaptureSource:", -[VCSessionParticipantLocal captureSource](v14, "captureSource"));
  -[VCSessionParticipantLocal addMediaStreamInfo:](v14, "addMediaStreamInfo:", v9);
  v15 = -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", v4);
  v16 = 1;
  if ((-[__CFString updateConfig:forMode:](v15, "updateConfig:forMode:", v14, 1) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v26 = 136316162;
        v27 = v17;
        v28 = 2080;
        v29 = "-[VCSessionParticipantLocal setupOneToOneVideoStreamWithConfig:streamGroupID:]";
        v30 = 1024;
        v31 = 2861;
        v32 = 2112;
        v33 = v15;
        v34 = 2112;
        v35 = v14;
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to update config for stream group=%@ configuration=%@", (uint8_t *)&v26, 0x30u);
      }
    }
    goto LABEL_13;
  }
LABEL_14:

  return v16;
}

- (void)setupOneToOneAudioStreamWithConfig:(id)a3 streamGroupID:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  VCNetworkFeedbackController *networkFeedbackController;
  VCNetworkFeedbackController *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  VCSessionParticipantLocal *v15;
  VCSessionParticipantLocal *v16;
  __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  _QWORD v26[3];
  _QWORD v27[3];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  VCSessionParticipantLocal *v37;
  __int16 v38;
  char *v39;
  uint64_t v40;

  v4 = *(_QWORD *)&a4;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = -[VCSessionParticipantLocal newAudioStreamOneToOneConfigurationWithStreamGroupId:](self, "newAudioStreamOneToOneConfigurationWithStreamGroupId:", *(_QWORD *)&a4);
  if (!v7)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:].cold.1();
      }
      goto LABEL_39;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_39;
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_DWORD *)buf = 136316418;
    v29 = v22;
    v30 = 2080;
    v31 = "-[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:]";
    v32 = 1024;
    v33 = 2878;
    v34 = 2112;
    v35 = v20;
    v36 = 2048;
    v37 = self;
    v38 = 2080;
    v39 = FourccToCStr(v4);
    v24 = " [%s] %s:%d %@(%p) Error setting up the audio config for one-to-one mode for streamGroupId=%s";
    goto LABEL_41;
  }
  networkFeedbackController = self->super._networkFeedbackController;
  v9 = (VCNetworkFeedbackController *)objc_msgSend(a3, "networkFeedbackController");
  self->super._networkFeedbackController = v9;
  if (v9)
    CFRetain(v9);
  if (networkFeedbackController)
    CFRelease(networkFeedbackController);
  objc_msgSend((id)objc_msgSend(v7, "multiwayConfig"), "setMaxNetworkBitrate:", 1000* -[VCSessionMediaNegotiator remoteMaxBandwidthForArbiterMode:connectionType:](self->super._mediaNegotiator, "remoteMaxBandwidthForArbiterMode:connectionType:", VCBitrateArbiter_ModeFromOperatingMode(-[VCSessionParticipant operatingMode](self, "operatingMode")), 3));
  objc_msgSend(v7, "setUseWifiTiers:", objc_msgSend(a3, "initUsingWifiTiers"));
  v10 = -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:](self, "newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:", v7, self->super._idsDestination, 0, v4, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4)), "unsignedIntValue"));
  if (!v10)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:].cold.2();
      }
      goto LABEL_39;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v25 = VRTraceErrorLogLevelToCSTR(),
          v23 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_39:
      v16 = 0;
      v11 = 0;
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136316418;
    v29 = v25;
    v30 = 2080;
    v31 = "-[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:]";
    v32 = 1024;
    v33 = 2888;
    v34 = 2112;
    v35 = v21;
    v36 = 2048;
    v37 = self;
    v38 = 2080;
    v39 = FourccToCStr(v4);
    v24 = " [%s] %s:%d %@(%p) Error setting up the audio stream for one-to-one mode for streamGroupId=%s";
LABEL_41:
    _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x3Au);
    goto LABEL_39;
  }
  v11 = v10;
  -[VCSessionParticipantLocal updateOneToOneBandwidthAllocationTable:mediaType:streamGroupID:](self, "updateOneToOneBandwidthAllocationTable:mediaType:streamGroupID:", v10, 1, v4);
  v12 = -[VCSessionParticipantLocal oneToOneAudioStreamRedundancyMode](self, "oneToOneAudioStreamRedundancyMode");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v29 = v13;
      v30 = 2080;
      v31 = "-[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:]";
      v32 = 1024;
      v33 = 2893;
      v34 = 1024;
      LODWORD(v35) = v12;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio Redundancy Mode=%u", buf, 0x22u);
    }
  }
  v27[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4, CFSTR("streamGroupID"));
  v27[1] = &unk_1E9EF54B0;
  v26[1] = CFSTR("streamGroupMode");
  v26[2] = CFSTR("streamGroupRedundancyMode");
  v27[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v15 = -[VCSessionParticipantLocal newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:](self, "newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:", v4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3));
  if (v15)
  {
    v16 = v15;
    -[VCSessionParticipant setStatisticsCollector:](v15, "setStatisticsCollector:", -[VCSessionParticipantOneToOneConfig statisticsCollector](self->super._oneToOneConfig, "statisticsCollector"));
    -[VCSessionParticipantLocal addMediaStreamInfo:](v16, "addMediaStreamInfo:", v11);
    v17 = -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", v4);
    if ((-[__CFString updateConfig:forMode:](v17, "updateConfig:forMode:", v16, 1) & 1) == 0
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v29 = v18;
        v30 = 2080;
        v31 = "-[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:]";
        v32 = 1024;
        v33 = 2908;
        v34 = 2112;
        v35 = v17;
        v36 = 2112;
        v37 = v16;
        _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to update config for stream group=%@ configuration=%@", buf, 0x30u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal setupOneToOneAudioStreamWithConfig:streamGroupID:].cold.3();
    }
    v16 = 0;
  }
LABEL_15:

}

- (BOOL)configureMultiwayStreamGroups
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
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
  v3 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
      objc_msgSend(v8, "setReportingAgent:", -[VCSessionParticipant reportingAgent](self, "reportingAgent"));
      v9 = (void *)objc_msgSend(v8, "streamGroupConfigForMode:", 0);
      if (v9)
      {
        v10 = v9;
        if (!-[VCSessionParticipant configureStreamInfosForMultiway:streamGroupID:](self, "configureStreamInfosForMultiway:streamGroupID:", objc_msgSend(v9, "mediaStreamInfoArray"), objc_msgSend(v8, "streamGroupID")))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v11)
              return v11;
            -[VCSessionParticipantLocal configureMultiwayStreamGroups].cold.2();
          }
LABEL_19:
          LOBYTE(v11) = 0;
          return v11;
        }
        if ((objc_msgSend(v8, "updateConfig:forMode:", v10, 0) & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v11)
              return v11;
            -[VCSessionParticipantLocal configureMultiwayStreamGroups].cold.1();
          }
          goto LABEL_19;
        }
      }
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }
  LOBYTE(v11) = 1;
  return v11;
}

- (BOOL)configureWithOneToOneParticipantConfig:(id)a3 shouldConfigureGFTStreams:(BOOL)a4
{
  NSObject *participantQueue;
  char v5;
  _QWORD block[7];
  BOOL v8;
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
  block[2] = __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke;
  block[3] = &unk_1E9E551E0;
  block[4] = self;
  block[5] = a3;
  v8 = a4;
  block[6] = &v9;
  dispatch_sync(participantQueue, block);
  v5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
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
  NSObject *v15;
  int v16;
  int v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  int v24;
  int v25;
  const __CFString *v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[24];
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v37 = 136315650;
      *(_QWORD *)&v37[4] = v2;
      *(_WORD *)&v37[12] = 2080;
      *(_QWORD *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStreams:]_block_invoke";
      *(_WORD *)&v37[22] = 1024;
      LODWORD(v38) = 2942;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting one-to-one remote participant data", v37, 0x1Cu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setOneToOneConfig:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setupOneToOneAudioStreamWithConfig:streamGroupID:", *(_QWORD *)(a1 + 40), 1835623282);
  if (objc_msgSend(*(id *)(a1 + 40), "negotiatedVideoEnabled"))
    objc_msgSend(*(id *)(a1 + 32), "setupOneToOneVideoStreamWithConfig:streamGroupID:", *(_QWORD *)(a1 + 40), 1667329381);
  if (objc_msgSend(*(id *)(a1 + 40), "negotiatedScreenEnabled"))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_18;
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_DWORD *)v37 = 136315650;
      *(_QWORD *)&v37[4] = v5;
      *(_WORD *)&v37[12] = 2080;
      *(_QWORD *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStreams:]_block_invoke";
      *(_WORD *)&v37[22] = 1024;
      LODWORD(v38) = 2955;
      v7 = " [%s] %s:%d Configuring U+1 screen and system audio streams";
      v8 = v6;
      v9 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_18;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v37 = 136316162;
      *(_QWORD *)&v37[4] = v10;
      *(_WORD *)&v37[12] = 2080;
      *(_QWORD *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStreams:]_block_invoke";
      *(_WORD *)&v37[22] = 1024;
      LODWORD(v38) = 2955;
      WORD2(v38) = 2112;
      *(_QWORD *)((char *)&v38 + 6) = v4;
      HIWORD(v38) = 2048;
      v39 = v12;
      v7 = " [%s] %s:%d %@(%p) Configuring U+1 screen and system audio streams";
      v8 = v11;
      v9 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v37, v9);
LABEL_18:
    objc_msgSend(*(id *)(a1 + 32), "setupOneToOneVideoStreamWithConfig:streamGroupID:", *(_QWORD *)(a1 + 40), 1935897189, *(_OWORD *)v37, *(_QWORD *)&v37[16], v38, v39);
    objc_msgSend(*(id *)(a1 + 32), "setupOneToOneAudioStreamWithConfig:streamGroupID:", *(_QWORD *)(a1 + 40), 1937339233);
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "negotiatedResultsForGroupID:", 1718909044), "isSupported"))objc_msgSend(*(id *)(a1 + 32), "setupOneToOneVideoStreamWithConfig:streamGroupID:", *(_QWORD *)(a1 + 40), 1718909044);
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "negotiatedResultsForGroupID:", 1650745716), "isSupported"))objc_msgSend(*(id *)(a1 + 32), "setupOneToOneVideoStreamWithConfig:streamGroupID:", *(_QWORD *)(a1 + 40), 1650745716);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend(*(id *)(a1 + 40), "operatingMode");
        v17 = *(unsigned __int8 *)(a1 + 56);
        *(_DWORD *)v37 = 136316162;
        *(_QWORD *)&v37[4] = v14;
        *(_WORD *)&v37[12] = 2080;
        *(_QWORD *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStrea"
                              "ms:]_block_invoke";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 2969;
        WORD2(v38) = 1024;
        *(_DWORD *)((char *)&v38 + 6) = v16;
        WORD5(v38) = 1024;
        HIDWORD(v38) = v17;
        v18 = " [%s] %s:%d Calling configureWithDeviceRole with AVC operatingMode=%d shouldConfigureGFTStreams=%d";
        v19 = v15;
        v20 = 40;
LABEL_33:
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, v37, v20);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(_QWORD *)(a1 + 32);
        v24 = objc_msgSend(*(id *)(a1 + 40), "operatingMode");
        v25 = *(unsigned __int8 *)(a1 + 56);
        *(_DWORD *)v37 = 136316674;
        *(_QWORD *)&v37[4] = v21;
        *(_WORD *)&v37[12] = 2080;
        *(_QWORD *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStrea"
                              "ms:]_block_invoke";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 2969;
        WORD2(v38) = 2112;
        *(_QWORD *)((char *)&v38 + 6) = v13;
        HIWORD(v38) = 2048;
        v39 = v23;
        LOWORD(v40) = 1024;
        *(_DWORD *)((char *)&v40 + 2) = v24;
        HIWORD(v40) = 1024;
        LODWORD(v41) = v25;
        v18 = " [%s] %s:%d %@(%p) Calling configureWithDeviceRole with AVC operatingMode=%d shouldConfigureGFTStreams=%d";
        v19 = v22;
        v20 = 60;
        goto LABEL_33;
      }
    }
  }
  if (*(_BYTE *)(a1 + 56))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "dispatchedConfigureWithDeviceRole:negotiatedVideoEnabled:negotiatedScreenEnabled:operatingMode:", objc_msgSend(*(id *)(a1 + 40), "deviceRole"), objc_msgSend(*(id *)(a1 + 40), "negotiatedVideoEnabled"), objc_msgSend(*(id *)(a1 + 40), "negotiatedScreenEnabled"), objc_msgSend(*(id *)(a1 + 40), "operatingMode")) & 1) == 0)
    {
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke_cold_2();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v26 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        else
          v26 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v32 = VRTraceErrorLogLevelToCSTR();
          v33 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v34 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)v37 = 136316162;
            *(_QWORD *)&v37[4] = v32;
            *(_WORD *)&v37[12] = 2080;
            *(_QWORD *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTS"
                                  "treams:]_block_invoke";
            *(_WORD *)&v37[22] = 1024;
            LODWORD(v38) = 2973;
            WORD2(v38) = 2112;
            *(_QWORD *)((char *)&v38 + 6) = v26;
            HIWORD(v38) = 2048;
            v39 = v34;
LABEL_66:
            _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Fail configure participant", v37, 0x30u);
            return;
          }
        }
      }
      return;
    }
LABEL_40:
    objc_msgSend(*(id *)(a1 + 32), "setupOneToOneEncryptionInfoWithConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)v37, *(_OWORD *)&v37[8], v38, v39, v40, v41);
    v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 960), "objectForKeyedSubscript:", &unk_1E9EF5438), "streamConfigs"), "objectAtIndexedSubscript:", 0), "framerate");
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 924) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 920);
    v28 = *(_QWORD *)(a1 + 32);
    v29 = v27;
    if (*(_BYTE *)(v28 + 409))
      v29 = *(_DWORD *)(v28 + 920);
    *(_DWORD *)(v28 + 920) = v29;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 924) = v27;
    v30 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v30 + 408) && *(_BYTE *)(v30 + 374) && !*(_BYTE *)(v30 + 377) && *(_DWORD *)(v30 + 168) == 1)
      objc_msgSend((id)v30, "registerForVideoCapture:", *(unsigned int *)(v30 + 920));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "configureOneToOneWithConfig:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    goto LABEL_40;
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v31 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v31 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v35 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v36 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v37 = 136316162;
        *(_QWORD *)&v37[4] = v35;
        *(_WORD *)&v37[12] = 2080;
        *(_QWORD *)&v37[14] = "-[VCSessionParticipantLocal configureWithOneToOneParticipantConfig:shouldConfigureGFTStrea"
                              "ms:]_block_invoke";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 2976;
        WORD2(v38) = 2112;
        *(_QWORD *)((char *)&v38 + 6) = v31;
        HIWORD(v38) = 2048;
        v39 = v36;
        goto LABEL_66;
      }
    }
  }
}

- (BOOL)configureOneToOneVideoStreamsWithDeviceRole:(int)a3
{
  uint64_t v3;
  NSMutableArray *videoStreamGroups;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v3 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  videoStreamGroups = self->super._videoStreamGroups;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoStreamGroups, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v17;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(videoStreamGroups);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      if (-[VCSessionParticipantLocal isOneToOneStreamGroup:](self, "isOneToOneStreamGroup:", objc_msgSend(v11, "streamGroupID")))
      {
        v12 = (void *)objc_msgSend(v11, "streamGroupConfigForMode:", 1);
        if (!v12)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantLocal configureOneToOneVideoStreamsWithDeviceRole:].cold.1();
          }
          return v8;
        }
        v13 = v12;
        if (!-[VCSessionParticipant configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:](self, "configureOneToOneVideoStreamsWithDeviceRole:streamInfoArray:", v3, objc_msgSend(v12, "mediaStreamInfoArray")))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantLocal configureOneToOneVideoStreamsWithDeviceRole:].cold.3();
          }
          return 0;
        }
        v8 = 1;
        if ((objc_msgSend(v11, "updateConfig:forMode:", v13, 1) & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCSessionParticipantLocal configureOneToOneVideoStreamsWithDeviceRole:].cold.2();
          }
          return 0;
        }
      }
    }
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoStreamGroups, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    if (v7)
      continue;
    break;
  }
  return v8;
}

- (BOOL)configureOneToOneAudioStreamsWithDeviceRole:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v3 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->super._micStreamGroups);
  v6 = -[VCSessionParticipant systemAudioGroup](self, "systemAudioGroup");
  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
      if (-[VCSessionParticipantLocal isOneToOneStreamGroup:](self, "isOneToOneStreamGroup:", objc_msgSend(v11, "streamGroupID"))&& objc_msgSend(v11, "streamGroupConfigForMode:", 1))
      {
        v12 = (void *)objc_msgSend(v11, "streamGroupConfigForMode:", 1);
        if (!-[VCSessionParticipant configureOneToOneAudioStreamsWithDeviceRole:streamInfoArray:](self, "configureOneToOneAudioStreamsWithDeviceRole:streamInfoArray:", v3, objc_msgSend(v12, "mediaStreamInfoArray")))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v13)
              return v13;
            -[VCSessionParticipantLocal configureOneToOneAudioStreamsWithDeviceRole:].cold.2();
          }
LABEL_22:
          LOBYTE(v13) = 0;
          return v13;
        }
        if ((objc_msgSend(v11, "updateConfig:forMode:", v12, 1) & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v13)
              return v13;
            -[VCSessionParticipantLocal configureOneToOneAudioStreamsWithDeviceRole:].cold.1();
          }
          goto LABEL_22;
        }
      }
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
        if (v8)
          goto LABEL_5;
        break;
      }
    }
  }
  LOBYTE(v13) = 1;
  return v13;
}

- (void)updateOneToOneBandwidthAllocationTable:(id)a3 mediaType:(unsigned __int8)a4 streamGroupID:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  VCSessionBandwidthAllocationTableEntry *v15;
  VCSessionBandwidthAllocationTableEntry *v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = (void *)objc_msgSend(a3, "streamConfigs");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v13, "multiwayConfig"), "isOneToOne") & 1) != 0)
        {
          if (v13)
          {
            v14 = (void *)objc_msgSend(v13, "multiwayConfig");
            v15 = [VCSessionBandwidthAllocationTableEntry alloc];
            v16 = -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:streamID:streamGroupID:](v15, "initWithClient:type:streamToken:streamID:streamGroupID:", self, v6, objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._participantStreamTokens, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5)), "unsignedIntValue"), objc_msgSend(v14, "idsStreamID"), v5);
            objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_uplinkBandwidthAllocators, "objectAtIndexedSubscript:", 1), "addBandwidthAllocationTableEntry:updateNow:", v16, 0);

          }
          return;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      if (v10)
        continue;
      break;
    }
  }
}

- (void)setupOneToOneEncryptionInfoWithConfiguration:(id)a3
{
  id v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  _VCSessionParticipantLocalOneToOneSettings *p_oneToOneSettings;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[VCSecurityKeyManager latestSendKeyMaterialWithSecurityKeyMode:](self->super._securityKeyManager, "latestSendKeyMaterialWithSecurityKeyMode:", 1);
  v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SecurityLocallyGenerated")), "BOOLValue");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315650;
        v12 = v8;
        v13 = 2080;
        v14 = "-[VCSessionParticipantLocal setupOneToOneEncryptionInfoWithConfiguration:]";
        v15 = 1024;
        v16 = 3077;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Already received Key material, updating oneToOne streams with the cached key material", (uint8_t *)&v11, 0x1Cu);
      }
    }
    p_oneToOneSettings = &self->_oneToOneSettings;
    objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](p_oneToOneSettings->streamInfo, "objectForKeyedSubscript:", &unk_1E9EF5420), "stream"), "handleEncryptionInfoChange:", v5);
    if (objc_msgSend(a3, "negotiatedVideoEnabled"))
      objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](p_oneToOneSettings->streamInfo, "objectForKeyedSubscript:", &unk_1E9EF5438), "stream"), "handleEncryptionInfoChange:", v5);
    if (objc_msgSend(a3, "negotiatedScreenEnabled"))
      objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](p_oneToOneSettings->streamInfo, "objectForKeyedSubscript:", &unk_1E9EF54E0), "stream"), "handleEncryptionInfoChange:", v5);
  }
}

- (id)newAudioStreamOneToOneConfigurationWithStreamGroupId:(unsigned int)a3
{
  uint64_t v3;
  id v5;
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
  VCSessionParticipantLocal *v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v3 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  v5 = -[VCSessionParticipant newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:](self, "newOneToOneAudioStreamConfigWithAudioSettings:streamDirection:streamGroupId:streamSsrc:", -[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->super._mediaNegotiator, "negotiatedResultsForGroupID:", v3), 1, v3, objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](-[VCSessionMediaNegotiator localSettings](self->super._mediaNegotiator, "localSettings"), "mediaConfigurationForMediaType:", VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(a3)), "ssrc"));
  if ((_DWORD)v3 == 1835623282)
    objc_msgSend(v5, "setIsLowLatency:", -[VCSessionParticipant supportsLowLatencyAudio](self, "supportsLowLatencyAudio"));
  if (!v5)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newAudioStreamOneToOneConfigurationWithStreamGroupId:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v10 = 136316418;
          v11 = v8;
          v12 = 2080;
          v13 = "-[VCSessionParticipantLocal newAudioStreamOneToOneConfigurationWithStreamGroupId:]";
          v14 = 1024;
          v15 = 3102;
          v16 = 2112;
          v17 = v7;
          v18 = 2048;
          v19 = self;
          v20 = 2080;
          v21 = FourccToCStr(v3);
          _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create one to one audio stream config for streamGroupId=%s", (uint8_t *)&v10, 0x3Au);
        }
      }
    }
  }
  return v5;
}

- (id)newVideoStreamOneToOneConfigurationWithStreamGroupId:(unsigned int)a3
{
  id v4;
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
  VCSessionParticipantLocal *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = -[VCSessionParticipant newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:](self, "newOneToOneVideoStreamConfigWithStreamDirection:streamGroupId:streamSsrc:encodingType:videoSettings:", 1, *(_QWORD *)&a3, objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](-[VCSessionMediaNegotiator localSettings](self->super._mediaNegotiator, "localSettings"), "mediaConfigurationForMediaType:", VCMediaNegotiatorMediaType_MediaTypeFromStreamGroupID(a3)), "ssrc"), 1, -[VCSessionMediaNegotiator negotiatedResultsForGroupID:](self->super._mediaNegotiator, "negotiatedResultsForGroupID:", *(_QWORD *)&a3));
  if (!v4)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newVideoStreamOneToOneConfigurationWithStreamGroupId:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
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
          v12 = "-[VCSessionParticipantLocal newVideoStreamOneToOneConfigurationWithStreamGroupId:]";
          v13 = 1024;
          v14 = 3113;
          v15 = 2112;
          v16 = v6;
          v17 = 2048;
          v18 = self;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create one to one video stream config", (uint8_t *)&v9, 0x30u);
        }
      }
    }
  }
  return v4;
}

- (id)supportedAudioRules
{
  return self->super._supportedAudioRules;
}

- (void)updateSupportedAudioRules:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  VCAudioRuleCollection *v11;
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
  v4 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1E9EF5420), "streamConfigs");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend((id)objc_msgSend(v9, "audioRules"), "rules"));
        objc_msgSend(v10, "intersectSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "rules")));
        if (objc_msgSend(v10, "count"))
        {
          v11 = objc_alloc_init(VCAudioRuleCollection);
          -[VCAudioRuleCollection addAudioRules:](v11, "addAudioRules:", objc_msgSend(v10, "allObjects"));
          objc_msgSend(v9, "setAudioRulesNegotiated:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v6);
  }
}

- (BOOL)containsStreamWithSSRC:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  if ((-[NSMutableSet containsObject:](self->_generatedSSRCs, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:")) & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
    v5 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    if (!v5)
      return v5;
    v7 = v5;
    v8 = *(_QWORD *)v13;
LABEL_6:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v6);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "containsStreamWithSSRC:", v3) & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
        LOBYTE(v5) = 0;
        if (v7)
          goto LABEL_6;
        return v5;
      }
    }
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (BOOL)isRemotePresentationLarge:(CGRect)a3
{
  return a3.size.width > 600.0 || a3.size.height > 600.0;
}

- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v9;
  uint64_t v10;
  int isRemotePresentationLarge;
  int remotePresentationState;
  int v14;
  BOOL v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  _BYTE v26[24];
  _BYTE v27[32];
  double v28;
  __int128 v29;
  uint64_t v30;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  v10 = *(_QWORD *)&a3;
  v30 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    self->super._presentationState = a3;
    -[VCSessionParticipant reportingAgent](self, "reportingAgent");
    reportingPIPEnabled();
    goto LABEL_20;
  }
  isRemotePresentationLarge = self->_isRemotePresentationLarge;
  remotePresentationState = self->_remotePresentationState;
  self->_remotePresentationState = a3;
  v14 = -[VCSessionParticipantLocal isRemotePresentationLarge:](self, "isRemotePresentationLarge:", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  self->_isRemotePresentationLarge = v14;
  v15 = remotePresentationState == (_DWORD)v10 && isRemotePresentationLarge == v14;
  if (!v15 && self->super._oneToOneModeEnabled)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_19;
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v19 = self->_isRemotePresentationLarge;
      *(_DWORD *)v26 = 136316674;
      *(_QWORD *)&v26[4] = v17;
      *(_WORD *)&v26[12] = 2080;
      *(_QWORD *)&v26[14] = "-[VCSessionParticipantLocal updateWindowState:isLocal:windowRect:]";
      *(_WORD *)&v26[22] = 1024;
      *(_DWORD *)v27 = 3174;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = v19;
      *(_WORD *)&v27[10] = 2048;
      *(double *)&v27[12] = width;
      *(_WORD *)&v27[20] = 2048;
      *(double *)&v27[22] = height;
      *(_WORD *)&v27[30] = 1024;
      LODWORD(v28) = v10;
      v20 = " [%s] %s:%d Recalculating bandwidth allocation _isRemotePresentationLarge=%u width=%f height=%f, presentationState=%u";
      v21 = v18;
      v22 = 60;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_19;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v25 = self->_isRemotePresentationLarge;
      *(_DWORD *)v26 = 136317186;
      *(_QWORD *)&v26[4] = v23;
      *(_WORD *)&v26[12] = 2080;
      *(_QWORD *)&v26[14] = "-[VCSessionParticipantLocal updateWindowState:isLocal:windowRect:]";
      *(_WORD *)&v26[22] = 1024;
      *(_DWORD *)v27 = 3174;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = v16;
      *(_WORD *)&v27[14] = 2048;
      *(_QWORD *)&v27[16] = self;
      *(_WORD *)&v27[24] = 1024;
      *(_DWORD *)&v27[26] = v25;
      *(_WORD *)&v27[30] = 2048;
      v28 = width;
      LOWORD(v29) = 2048;
      *(double *)((char *)&v29 + 2) = height;
      WORD5(v29) = 1024;
      HIDWORD(v29) = v10;
      v20 = " [%s] %s:%d %@(%p) Recalculating bandwidth allocation _isRemotePresentationLarge=%u width=%f height=%f, pres"
            "entationState=%u";
      v21 = v24;
      v22 = 80;
    }
    _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, v26, v22);
LABEL_19:
    -[VCSessionUplinkBandwidthAllocator addBandwidthAllocationTableEntry:updateNow:](self->_uplinkBandwidthAllocator, "addBandwidthAllocationTableEntry:updateNow:", 0, 1, *(_OWORD *)v26, *(_QWORD *)&v26[16], *(_OWORD *)v27, *(_OWORD *)&v27[16], *(_QWORD *)&v28, v29);
    -[VCSessionParticipantLocal updateUplinkTargetBitrateForStreamGroups](self, "updateUplinkTargetBitrateForStreamGroups");
  }
LABEL_20:
  objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_oneToOneSettings.streamInfo, "objectForKeyedSubscript:", &unk_1E9EF5438), "stream"), "updateWindowState:isLocal:windowRect:", v10, v9, x, y, width, height);
  -[VCSessionParticipantLocal updateAudioSpectrumState](self, "updateAudioSpectrumState");
}

- (id)audioRuleCollectionWithAudioStreamConfig:(id)a3
{
  VCSessionParticipantLocal *v4;
  void *v5;
  uint64_t v6;
  int v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  VCSessionParticipantLocal *v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  VCAudioRuleCollection *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  id obj;
  int v35;
  uint64_t v36;
  uint64_t v37;
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
  _BYTE v50[10];
  _BYTE v51[10];
  _BYTE v52[10];
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  _BYTE v57[128];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v4 = self;
  v67 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](-[VCAudioRuleCollection rules](self->super._supportedAudioRules, "rules"), "count"));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = (id)objc_msgSend((id)objc_msgSend(a3, "codecConfigurations"), "allKeys");
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v64;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v64 != v36)
        objc_enumerationMutation(obj);
      v35 = objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v6), "integerValue");
      v7 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:");
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v8 = -[VCAudioRuleCollection rules](v4->super._supportedAudioRules, "rules");
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
      if (!v9)
        break;
      v10 = v9;
      v11 = v4;
      v12 = 0;
      v13 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v59 != v13)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          if (objc_msgSend(v15, "payload") == v7)
          {
            objc_msgSend(v5, "setObject:atIndexedSubscript:", v15, objc_msgSend(v5, "count"));
            v12 = 1;
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
      }
      while (v10);
      v4 = v11;
      if ((v12 & 1) == 0)
        break;
      if (++v6 == v37)
      {
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
        if (v37)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_35;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_35;
      v25 = -[VCAudioRuleCollection rules](v4->super._supportedAudioRules, "rules");
      v26 = -[VCAudioRuleCollection secondaryPayloads](v4->super._supportedAudioRules, "secondaryPayloads");
      *(_DWORD *)buf = 136316674;
      v44 = v23;
      v45 = 2080;
      v46 = "-[VCSessionParticipantLocal audioRuleCollectionWithAudioStreamConfig:]";
      v47 = 1024;
      v48 = 3198;
      v49 = 1024;
      *(_DWORD *)v50 = v7;
      *(_WORD *)&v50[4] = 1024;
      *(_DWORD *)&v50[6] = v35;
      *(_WORD *)v51 = 2112;
      *(_QWORD *)&v51[2] = v25;
      *(_WORD *)v52 = 2112;
      *(_QWORD *)&v52[2] = v26;
      v27 = " [%s] %s:%d Missing payload:%d (codecType:%d). Supported rules:%@ secondary:%@";
      v28 = v24;
      v29 = 60;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v22 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](v4, "performSelector:", sel_logPrefix);
      else
        v22 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_35;
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_35;
      v32 = -[VCAudioRuleCollection rules](v4->super._supportedAudioRules, "rules");
      v33 = -[VCAudioRuleCollection secondaryPayloads](v4->super._supportedAudioRules, "secondaryPayloads");
      *(_DWORD *)buf = 136317186;
      v44 = v30;
      v45 = 2080;
      v46 = "-[VCSessionParticipantLocal audioRuleCollectionWithAudioStreamConfig:]";
      v47 = 1024;
      v48 = 3198;
      v49 = 2112;
      *(_QWORD *)v50 = v22;
      *(_WORD *)&v50[8] = 2048;
      *(_QWORD *)v51 = v4;
      *(_WORD *)&v51[8] = 1024;
      *(_DWORD *)v52 = v7;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v35;
      v53 = 2112;
      v54 = v32;
      v55 = 2112;
      v56 = v33;
      v27 = " [%s] %s:%d %@(%p) Missing payload:%d (codecType:%d). Supported rules:%@ secondary:%@";
      v28 = v31;
      v29 = 80;
    }
    _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, v27, buf, v29);
LABEL_35:

    return 0;
  }
LABEL_18:
  v16 = objc_alloc_init(VCAudioRuleCollection);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v17 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v5);
        -[VCAudioRuleCollection addAudioRule:](v16, "addAudioRule:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    }
    while (v18);
  }

  return v16;
}

- (id)setupStreamRTP:(id)a3
{
  return (id)objc_msgSend(a3, "setupRTPForIDS");
}

- (void)addCallInfoBlobToParticipantInfo:(id)a3
{
  VCCallInfoBlob *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  VCSessionParticipantLocal *v28;
  __int16 v29;
  uint64_t v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(VCCallInfoBlob);
  self->super._callInfoBlob = v5;
  -[VCCallInfoBlob setCallID:](v5, "setCallID:", self->super._transportSessionID);
  -[VCCallInfoBlob setClientVersion:](self->super._callInfoBlob, "setClientVersion:", +[VCCallInfo getVCCurrentVersion](VCCallInfo, "getVCCurrentVersion"));
  memset(v32, 170, 20);
  VCGetDeviceModelString((char *)v32, 0x14uLL);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v32, 1);
  -[VCCallInfoBlob setDeviceType:](self->super._callInfoBlob, "setDeviceType:", v6);
  memset(v31, 170, 20);
  VCGetSystemBuildVersionString((char *)v31, 20);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v31, 1);
  -[VCCallInfoBlob setOsVersion:](self->super._callInfoBlob, "setOsVersion:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", "2055.64.1.1.2", 1);
  -[VCCallInfoBlob setFrameworkVersion:](self->super._callInfoBlob, "setFrameworkVersion:", v8);
  objc_msgSend(a3, "setObject:forKeyedSubscript:", -[VCCallInfoBlob data](self->super._callInfoBlob, "data"), CFSTR("vcSessionParticipantKeyCallInfoBlob"));
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend((id)-[VCCallInfoBlob formattedText](self->super._callInfoBlob, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", "));
        v19 = 136315906;
        v20 = v10;
        v21 = 2080;
        v22 = "-[VCSessionParticipantLocal addCallInfoBlobToParticipantInfo:]";
        v23 = 1024;
        v24 = 3237;
        v25 = 2112;
        v26 = v12;
        v13 = " [%s] %s:%d Local Participant callInfoBlob = %@";
        v14 = v11;
        v15 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend((id)-[VCCallInfoBlob formattedText](self->super._callInfoBlob, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", "));
        v19 = 136316418;
        v20 = v16;
        v21 = 2080;
        v22 = "-[VCSessionParticipantLocal addCallInfoBlobToParticipantInfo:]";
        v23 = 1024;
        v24 = 3237;
        v25 = 2112;
        v26 = (uint64_t)v9;
        v27 = 2048;
        v28 = self;
        v29 = 2112;
        v30 = v18;
        v13 = " [%s] %s:%d %@(%p) Local Participant callInfoBlob = %@";
        v14 = v17;
        v15 = 58;
        goto LABEL_11;
      }
    }
  }

}

- (BOOL)createParticipantInfo
{
  id v3;
  NSData *v4;
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
  VCSessionParticipantLocal *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v3)
  {
    v4 = (NSData *)-[VCSessionMediaNegotiator negotiationData](self->super._mediaNegotiator, "negotiationData");
    self->super._mediaBlobCompressed = v4;
    if (v4)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", self->super._uuid, CFSTR("vcSessionParticipantKeyUUID"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", self->super._mediaBlobCompressed, CFSTR("vcSessionParticipantKeyMediaNegotiationData"));
      -[VCSessionParticipantLocal addCallInfoBlobToParticipantInfo:](self, "addCallInfoBlobToParticipantInfo:", v3);
      self->super._participantInfo = (NSDictionary *)v3;
      goto LABEL_4;
    }
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal createParticipantInfo].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v12 = 136316162;
          v13 = v11;
          v14 = 2080;
          v15 = "-[VCSessionParticipantLocal createParticipantInfo]";
          v16 = 1024;
          v17 = 3249;
          v18 = 2112;
          v19 = v7;
          v20 = 2048;
          v21 = self;
          v10 = " [%s] %s:%d %@(%p) Failed to create new invite blob";
          goto LABEL_25;
        }
      }
    }
  }
  else if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal createParticipantInfo].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v12 = 136316162;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCSessionParticipantLocal createParticipantInfo]";
        v16 = 1024;
        v17 = 3246;
        v18 = 2112;
        v19 = v6;
        v20 = 2048;
        v21 = self;
        v10 = " [%s] %s:%d %@(%p) Failed to allocate participant info";
LABEL_25:
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x30u);
      }
    }
  }
LABEL_4:

  return self->super._participantInfo != 0;
}

- (void)createOpaqueData
{
  self->super._opaqueData = (NSData *)+[VCSessionParticipant participantDataWithParticipantInfo:](VCSessionParticipant, "participantDataWithParticipantInfo:", self->super._participantInfo);
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
  block[2] = __38__VCSessionParticipantLocal_setMuted___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __38__VCSessionParticipantLocal_setMuted___block_invoke(uint64_t a1)
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
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 372) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "setMuted:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 372));
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "setMuted:", *(unsigned __int8 *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)isHighPriorityAudioWithPower:(float)a3 voiceActive:(BOOL)a4
{
  BOOL v4;

  if (!a4)
  {
    if (a3 != -120.0)
    {
      v4 = 0;
      self->_averageSilenceAudioPower = self->_averageSilenceAudioPower
                                      + (float)((float)(a3 - self->_averageSilenceAudioPower)
                                              * self->_audioSilencePowerAverageMultiplier);
      return v4;
    }
    return 0;
  }
  return (float)(self->_averageSilenceAudioPower + self->_audioVoiceDetectionSensitivity) < a3;
}

- (void)startVoiceActivityDetection
{
  opaqueVCVoiceDetector *v3;

  v3 = (opaqueVCVoiceDetector *)VCVoiceDetector_Create(0);
  self->_voiceDetector = v3;
  VCVoiceDetector_Start(v3, (uint64_t)-[VCAudioIO clientFormat](self->super._audioIO, "clientFormat"));
}

- (void)stopVoiceActivityDetection
{
  void **p_voiceDetector;

  p_voiceDetector = (void **)&self->_voiceDetector;
  VCVoiceDetector_Stop(self->_voiceDetector);
  VCVoiceDetector_Destroy(p_voiceDetector);
}

- (void)updateAudioPriorityWithSampleBuffer:(opaqueVCAudioBufferList *)a3
{
  int Priority;
  double v6;
  int forcedAudioPriorityValue;
  _QWORD v8[5];
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  Priority = VCAudioBufferList_GetPriority((uint64_t)a3);
  if (!self->_forcedAudioPriorityEnabled)
    goto LABEL_6;
  v6 = micro();
  if (v6 - self->_forcedAudioPriorityLastUpdateTime > 1.0)
  {
    self->_forcedAudioPriorityValue = -[VCDefaults forceAudioPriorityValue](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPriorityValue");
    self->_forcedAudioPriorityLastUpdateTime = v6;
  }
  forcedAudioPriorityValue = self->_forcedAudioPriorityValue;
  if (self->_forcedAudioPriorityValue)
  {
    VCAudioBufferList_SetPriority((uint64_t)a3, self->_forcedAudioPriorityValue);
    Priority = forcedAudioPriorityValue;
  }
  else
  {
LABEL_6:
    if (!Priority)
    {
      if (self->super._oneToOneModeEnabled)
        Priority = 0;
      else
        Priority = VCVoiceDetector_ProcessSampleBuffer(self->_voiceDetector, (uint64_t)a3, self->super._isMuted);
    }
  }
  if (Priority != self->_lastAudioPriority)
  {
    self->_lastAudioPriority = Priority;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__VCSessionParticipantLocal_updateAudioPriorityWithSampleBuffer___block_invoke;
    v8[3] = &unk_1E9E55118;
    v8[4] = self;
    v9 = Priority;
    -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v8);
  }
}

uint64_t __65__VCSessionParticipantLocal_updateAudioPriorityWithSampleBuffer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didChangeMediaPriority:description:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), CFSTR("MediaTypeAudio"));
}

- (id)getAudioDumpName
{
  return 0;
}

- (id)newStreamInfoWithVideoStreamWithConfiguration:(id)a3 idsDestination:(id)a4 groupID:(unsigned int)a5
{
  uint64_t v5;
  _BOOL8 isRetransmissionEnabled;
  __CFString *v9;
  VCSessionParticipantLocal *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  VCSessionParticipantMediaStreamInfo *v19;
  VCSessionParticipantMediaStreamInfo *v20;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  char *v35;
  const char *v36;
  uint64_t v37;
  char *v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  _BYTE v50[10];
  char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v5 = *(_QWORD *)&a5;
  v56 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:].cold.1();
      }
      goto LABEL_57;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_57;
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_57;
    *(_DWORD *)buf = 136316418;
    v40 = v26;
    v41 = 2080;
    v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
    v43 = 1024;
    v44 = 3373;
    v45 = 2112;
    v46 = v22;
    v47 = 2048;
    v48 = self;
    v49 = 2080;
    *(_QWORD *)v50 = FourccToCStr(v5);
    v28 = " [%s] %s:%d %@(%p) Video stream config is missing for streamGroupID=%s!";
    v29 = v27;
    v30 = 58;
    goto LABEL_67;
  }
  if (!objc_msgSend(a3, "rtpTimestampRate"))
    objc_msgSend(a3, "setRtpTimestampRate:", -[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:", v5));
  if (-[VCSessionParticipantLocal shouldEnableUplinkRetransmissionForStreamGroupID:](self, "shouldEnableUplinkRetransmissionForStreamGroupID:", v5))
  {
    isRetransmissionEnabled = self->_isRetransmissionEnabled;
  }
  else
  {
    isRetransmissionEnabled = 0;
  }
  objc_msgSend(a3, "setIsUplinkRetransmissionEnabled:", isRetransmissionEnabled);
  if (self->_isRetransmissionEnabled && (objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne") & 1) == 0)
  {
    objc_msgSend(a3, "setLtrpEnabled:", 1);
    objc_msgSend(a3, "setRtcpEnabled:", 1);
  }
  -[VCSessionParticipant setFECConfigurationOnStreamConfig:withStreamGroupID:](self, "setFECConfigurationOnStreamConfig:withStreamGroupID:", a3, v5);
  v9 = -[VCSessionParticipantLocal newVideoStreamWithConfig:groupID:](self, "newVideoStreamWithConfig:groupID:", a3, v5);
  v10 = (VCSessionParticipantLocal *)objc_opt_class();
  if (!v9)
  {
    if (v10 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:].cold.2();
      }
      goto LABEL_57;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v31 = VRTraceErrorLogLevelToCSTR(),
          v32 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_57:
      v20 = 0;
      v9 = 0;
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316162;
    v40 = v31;
    v41 = 2080;
    v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
    v43 = 1024;
    v44 = 3386;
    v45 = 2112;
    v46 = v23;
    v47 = 2048;
    v48 = self;
    v28 = " [%s] %s:%d %@(%p) Failed to allocate video stream!";
    v29 = v32;
    v30 = 48;
LABEL_67:
    _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    goto LABEL_57;
  }
  if (v10 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v40 = v12;
        v41 = 2080;
        v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
        v43 = 1024;
        v44 = 3387;
        v45 = 2048;
        v46 = v9;
        v47 = 2080;
        v48 = FourccToCStr(v5);
        v49 = 1024;
        *(_DWORD *)v50 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
        *(_WORD *)&v50[4] = 1024;
        *(_DWORD *)&v50[6] = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedStreamID");
        v14 = " [%s] %s:%d video stream successfully created: %p! streamGroupID=%s streamId=%d repairStreamId=%d";
        v15 = v13;
        v16 = 60;
LABEL_21:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        v40 = v17;
        v41 = 2080;
        v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
        v43 = 1024;
        v44 = 3387;
        v45 = 2112;
        v46 = v11;
        v47 = 2048;
        v48 = self;
        v49 = 2048;
        *(_QWORD *)v50 = v9;
        *(_WORD *)&v50[8] = 2080;
        v51 = FourccToCStr(v5);
        v52 = 1024;
        v53 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
        v54 = 1024;
        v55 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "repairedStreamID");
        v14 = " [%s] %s:%d %@(%p) video stream successfully created: %p! streamGroupID=%s streamId=%d repairStreamId=%d";
        v15 = v18;
        v16 = 80;
        goto LABEL_21;
      }
    }
  }
  -[__CFString setReportingAgent:](v9, "setReportingAgent:", -[VCSessionParticipant reportingAgent](self, "reportingAgent"));
  -[__CFString setDelegate:](v9, "setDelegate:", self);
  -[__CFString setLogPrefix:](v9, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("participantID:%@ streamGroupId=%s"), self->super._uuid, FourccToCStr(v5)));
  -[VCSessionParticipantLocal setupEncodingModeWithVideoStreamConfig:](self, "setupEncodingModeWithVideoStreamConfig:", a3);
  if (!-[VCSessionParticipantLocal setupStreamRTP:](self, "setupStreamRTP:", v9))
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:].cold.3();
      }
      goto LABEL_65;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_65;
    v33 = VRTraceErrorLogLevelToCSTR();
    v34 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_65;
    v35 = FourccToCStr(v5);
    *(_DWORD *)buf = 136316418;
    v40 = v33;
    v41 = 2080;
    v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
    v43 = 1024;
    v44 = 3395;
    v45 = 2112;
    v46 = v24;
    v47 = 2048;
    v48 = self;
    v49 = 2080;
    *(_QWORD *)v50 = v35;
    v36 = " [%s] %s:%d %@(%p) invalid capabilies dictionary for streamGroupID=%s!";
    goto LABEL_69;
  }
  v19 = objc_alloc_init(VCSessionParticipantMediaStreamInfo);
  if (!v19)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:].cold.4();
      }
      goto LABEL_65;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v37 = VRTraceErrorLogLevelToCSTR(),
          v34 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_65:
      v20 = 0;
      goto LABEL_25;
    }
    v38 = FourccToCStr(v5);
    *(_DWORD *)buf = 136316418;
    v40 = v37;
    v41 = 2080;
    v42 = "-[VCSessionParticipantLocal newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:]";
    v43 = 1024;
    v44 = 3398;
    v45 = 2112;
    v46 = v25;
    v47 = 2048;
    v48 = self;
    v49 = 2080;
    *(_QWORD *)v50 = v38;
    v36 = " [%s] %s:%d %@(%p) Failed to allocate participant video stream info for streamGroupID=%s";
LABEL_69:
    _os_log_error_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_ERROR, v36, buf, 0x3Au);
    goto LABEL_65;
  }
  v20 = v19;
  -[VCSessionParticipantMediaStreamInfo setStream:](v19, "setStream:", v9);
  -[VCSessionParticipantMediaStreamInfo addStreamConfig:](v20, "addStreamConfig:", a3);
LABEL_25:

  return v20;
}

- (BOOL)shouldEnableUplinkRetransmissionForStreamGroupID:(unsigned int)a3
{
  BOOL result;
  int v4;

  result = 1;
  if ((int)a3 <= 1835623286)
  {
    if ((int)a3 > 1684108336)
    {
      if (a3 - 1684108337 >= 5)
      {
        v4 = 1835623282;
        goto LABEL_13;
      }
      return 0;
    }
    if (a3 == 1667329399)
      return 0;
    v4 = 1667330164;
LABEL_13:
    if (a3 != v4)
      return result;
    return 0;
  }
  if ((int)a3 <= 1986618416)
  {
    if (a3 == 1835623287 || a3 == 1936290409)
      return 0;
    v4 = 1937339233;
    goto LABEL_13;
  }
  if (a3 - 1986618417 <= 3)
    return 0;
  return result;
}

- (id)newVideoStreamWithConfig:(id)a3 groupID:(unsigned int)a4
{
  __objc2_class **v4;

  v4 = off_1E9E4D608;
  if (a4 != 1667330164)
    v4 = off_1E9E4D690;
  return (id)objc_msgSend(objc_alloc(*v4), "initWithTransportSessionID:idsParticipantID:ssrc:streamToken:", self->super._transportSessionID, self->super._idsParticipantID, objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "ssrc"), -[VCSessionParticipant participantVideoToken](self, "participantVideoToken"));
}

- (id)newStreamInfoWithAudioStreamWithConfiguration:(id)a3 idsDestination:(id)a4 isMultiway:(BOOL)a5 streamGroupID:(unsigned int)a6 streamToken:(int64_t)a7
{
  uint64_t v9;
  VCAudioStream *v12;
  VCSessionParticipantLocal *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  VCSessionParticipantMediaStreamInfo *v23;
  VCSessionParticipantMediaStreamInfo *v24;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  _BYTE v51[10];
  char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:].cold.1();
      }
      goto LABEL_64;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_64;
    v31 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_64;
    *(_DWORD *)buf = 136316162;
    v41 = v31;
    v42 = 2080;
    v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGrou"
          "pID:streamToken:]";
    v44 = 1024;
    v45 = 3454;
    v46 = 2112;
    v47 = (void *)v26;
    v48 = 2048;
    v49 = self;
    v33 = " [%s] %s:%d %@(%p) Audio stream config is missing!";
    goto LABEL_83;
  }
  v9 = *(_QWORD *)&a6;
  if (!objc_msgSend(a3, "rtpTimestampRate"))
    objc_msgSend(a3, "setRtpTimestampRate:", -[VCSessionParticipant preferredIOSampleRateForGroupID:](self, "preferredIOSampleRateForGroupID:", v9));
  v12 = -[VCAudioStream initWithClientPid:ssrc:transportSessionID:streamToken:]([VCAudioStream alloc], "initWithClientPid:ssrc:transportSessionID:streamToken:", self->super._processId, objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "ssrc"), self->super._transportSessionID, a7);
  v13 = (VCSessionParticipantLocal *)objc_opt_class();
  if (!v12)
  {
    if (v13 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:].cold.2();
      }
      goto LABEL_64;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v34 = VRTraceErrorLogLevelToCSTR(),
          v32 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_64:
      v24 = 0;
      v12 = 0;
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136316162;
    v41 = v34;
    v42 = 2080;
    v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGrou"
          "pID:streamToken:]";
    v44 = 1024;
    v45 = 3464;
    v46 = 2112;
    v47 = (void *)v27;
    v48 = 2048;
    v49 = self;
    v33 = " [%s] %s:%d %@(%p) Failed to allocate audio stream!";
LABEL_83:
    _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x30u);
    goto LABEL_64;
  }
  if (v13 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_16;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136316674;
    v41 = v15;
    v42 = 2080;
    v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGrou"
          "pID:streamToken:]";
    v44 = 1024;
    v45 = 3465;
    v46 = 2048;
    v47 = v12;
    v48 = 2080;
    v49 = FourccToCStr(v9);
    v50 = 1024;
    *(_DWORD *)v51 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
    *(_WORD *)&v51[4] = 1024;
    *(_DWORD *)&v51[6] = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "v2StreamID");
    v17 = " [%s] %s:%d audio stream successfully created: %p! streamGroupID=%s streamId=%d v2StreamID=%d";
    v18 = v16;
    v19 = 60;
    goto LABEL_15;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v14 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136317186;
      v41 = v20;
      v42 = 2080;
      v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGr"
            "oupID:streamToken:]";
      v44 = 1024;
      v45 = 3465;
      v46 = 2112;
      v47 = (void *)v14;
      v48 = 2048;
      v49 = self;
      v50 = 2048;
      *(_QWORD *)v51 = v12;
      *(_WORD *)&v51[8] = 2080;
      v52 = FourccToCStr(v9);
      v53 = 1024;
      v54 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "idsStreamID");
      v55 = 1024;
      v56 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "v2StreamID");
      v17 = " [%s] %s:%d %@(%p) audio stream successfully created: %p! streamGroupID=%s streamId=%d v2StreamID=%d";
      v18 = v21;
      v19 = 80;
LABEL_15:
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    }
  }
LABEL_16:
  -[VCObject setLogPrefix:](v12, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("participantID:%@ "), self->super._uuid));
  if (objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne"))
    v22 = objc_msgSend(a3, "networkFeedbackController");
  else
    v22 = 0;
  -[VCMediaStream setNetworkFeedbackController:](v12, "setNetworkFeedbackController:", v22);
  if (!-[VCSessionParticipantLocal setupStreamRTP:](self, "setupStreamRTP:", v12))
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:].cold.3();
      }
      goto LABEL_81;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v28 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_81;
    v35 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_81;
    *(_DWORD *)buf = 136316162;
    v41 = v35;
    v42 = 2080;
    v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGrou"
          "pID:streamToken:]";
    v44 = 1024;
    v45 = 3471;
    v46 = 2112;
    v47 = (void *)v28;
    v48 = 2048;
    v49 = self;
    v37 = " [%s] %s:%d %@(%p) invalid capabilies dictionary!";
    goto LABEL_80;
  }
  v23 = objc_alloc_init(VCSessionParticipantMediaStreamInfo);
  if (!v23)
  {
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:].cold.4();
      }
      goto LABEL_81;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v29 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_81;
    v38 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_81;
    *(_DWORD *)buf = 136316162;
    v41 = v38;
    v42 = 2080;
    v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGrou"
          "pID:streamToken:]";
    v44 = 1024;
    v45 = 3474;
    v46 = 2112;
    v47 = (void *)v29;
    v48 = 2048;
    v49 = self;
    v37 = " [%s] %s:%d %@(%p) Failed to allocate participant audio stream info";
LABEL_80:
    _os_log_error_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_ERROR, v37, buf, 0x30u);
    goto LABEL_81;
  }
  v24 = v23;
  if ((_DWORD)v9 != 1937339233 && !a5)
  {
    objc_msgSend(a3, "setAudioRules:", -[VCSessionParticipantLocal audioRuleCollectionWithAudioStreamConfig:](self, "audioRuleCollectionWithAudioStreamConfig:", a3));
    if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "audioRules"), "rules"), "count"))
    {

      if ((VCSessionParticipantLocal *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:].cold.5();
        }
        goto LABEL_81;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v39 = VRTraceErrorLogLevelToCSTR();
        v36 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v41 = v39;
          v42 = 2080;
          v43 = "-[VCSessionParticipantLocal newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:stre"
                "amGroupID:streamToken:]";
          v44 = 1024;
          v45 = 3478;
          v46 = 2112;
          v47 = (void *)v30;
          v48 = 2048;
          v49 = self;
          v37 = " [%s] %s:%d %@(%p) Failed to initialize audio rule collection!";
          goto LABEL_80;
        }
      }
LABEL_81:
      v24 = 0;
      goto LABEL_29;
    }
  }
  objc_msgSend(a3, "setForceEVSWideBand:", -[VCHardwareSettingsEmbedded deviceClass](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "deviceClass") == 6);
  if (-[VCDefaults forceEVSWideBand](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEVSWideBand"))
  {
    objc_msgSend(a3, "setForceEVSWideBand:", 1);
  }
  -[VCSessionParticipantMediaStreamInfo setStream:](v24, "setStream:", v12);
  -[VCSessionParticipantMediaStreamInfo addStreamConfig:](v24, "addStreamConfig:", a3);
  if (!a5 && objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "isOneToOne"))
    -[NSMutableDictionary setObject:forKey:](self->_oneToOneSettings.streamInfo, "setObject:forKey:", v24, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9));
LABEL_29:

  return v24;
}

- (void)setupEncodingModeWithVideoStreamConfig:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  _BOOL4 videoPriorityEnabled;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "setEncodingMode:", 0);
  objc_msgSend(a3, "setVideoPriorityPointer:", &self->_videoPriority);
  if (self->_videoPriorityEnabled)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxMediaBitrate") == 20000)
      objc_msgSend(a3, "setEncodingMode:", 1);
  }
  else
  {
    atomic_store(0, &self->_videoPriority);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      videoPriorityEnabled = self->_videoPriorityEnabled;
      v8 = 136316418;
      v9 = v5;
      v10 = 2080;
      v11 = "-[VCSessionParticipantLocal setupEncodingModeWithVideoStreamConfig:]";
      v12 = 1024;
      v13 = 3509;
      v14 = 1024;
      v15 = videoPriorityEnabled;
      v16 = 1024;
      v17 = objc_msgSend((id)objc_msgSend(a3, "multiwayConfig"), "maxMediaBitrate");
      v18 = 1024;
      v19 = objc_msgSend(a3, "encodingMode");
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _videoPriorityEnabled=%d, maxMediaBitrate=%u, encodingMode=%d", (uint8_t *)&v8, 0x2Eu);
    }
  }
}

- (void)generateKeyFrameWithStreamID:(id)a3 streamGroupID:(unsigned int)a4 firType:(int)a5
{
  uint64_t v5;
  id v9;
  void *v10;
  NSMutableArray *videoStreamGroups;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v5 = *(_QWORD *)&a5;
  v21 = *MEMORY[0x1E0C80C00];
  v9 = -[VCSessionParticipant streamGroupWithID:](self, "streamGroupWithID:", *(_QWORD *)&a4);
  if (a4 && (v10 = v9) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "generateKeyFrameWithStreamID:firType:", a3, v5);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    videoStreamGroups = self->super._videoStreamGroups;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoStreamGroups, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
LABEL_7:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(videoStreamGroups);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "generateKeyFrameWithStreamID:firType:", a3, v5) & 1) != 0)
          break;
        if (v13 == ++v15)
        {
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoStreamGroups, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
          if (v13)
            goto LABEL_7;
          return;
        }
      }
    }
  }
}

- (BOOL)checkSubscribedStreamsConsistency:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  _BOOL4 BoolValueForKey;
  BOOL v11;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  __CFDictionary *Mutable;
  _QWORD v18[5];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCSessionParticipantLocal *v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("simulateStreamFracture"), 0);
        if (-[NSMutableSet containsObject:](self->_localPublishedStreams, "containsObject:", v9))
          v11 = !BoolValueForKey;
        else
          v11 = 0;
        if (!v11)
        {
          if ((VCSessionParticipantLocal *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v14 = VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCSessionParticipantLocal checkSubscribedStreamsConsistency:].cold.1(v14);
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v13 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v13 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v15 = VRTraceErrorLogLevelToCSTR();
              v16 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316418;
                v20 = v15;
                v21 = 2080;
                v22 = "-[VCSessionParticipantLocal checkSubscribedStreamsConsistency:]";
                v23 = 1024;
                v24 = 3530;
                v25 = 2112;
                v26 = v13;
                v27 = 2048;
                v28 = self;
                v29 = 2112;
                v30 = v9;
                _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) MEDIA FRACTURE SITUATION! peer asking for unknown stream:%@", buf, 0x3Au);
              }
            }
          }
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __63__VCSessionParticipantLocal_checkSubscribedStreamsConsistency___block_invoke;
          v18[3] = &unk_1E9E55140;
          v18[4] = self;
          -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v18);
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          CFDictionaryAddValue(Mutable, CFSTR("VCSErrorDetected"), &unk_1E9EF54F8);
          -[VCSessionParticipant reportingAgent](self, "reportingAgent");
          reportingGenericEvent();
          if (Mutable)
            CFRelease(Mutable);
          return 0;
        }
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
      if (v6)
        continue;
      break;
    }
  }
  return 1;
}

uint64_t __63__VCSessionParticipantLocal_checkSubscribedStreamsConsistency___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didDetectError:", *(_QWORD *)(a1 + 32), +[VCSessionErrorUtils VCSessionErrorEvent:errorPath:returnCode:](VCSessionErrorUtils, "VCSessionErrorEvent:errorPath:returnCode:", 13, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCSessionParticipantLocal.m", 3532), 0));
}

- (void)setPeerSubscribedStreams:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCSessionParticipantLocal_setPeerSubscribedStreams___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(participantQueue, block);
}

void __54__VCSessionParticipantLocal_setPeerSubscribedStreams___block_invoke(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  const char *v4;
  const char *v5;
  void *v6;
  const void *v7;
  const char *v8;
  char *v9;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
  os_log_t *v14;
  uint64_t v15;
  NSObject *v16;
  __CFString *v17;
  void *v18;
  const char *v19;
  const char *v20;
  _QWORD *v21;
  void *v22;
  const char *v23;
  char *v24;
  os_log_t *v25;
  uint64_t v26;
  NSObject *v27;
  char *v28;
  os_log_t *v29;
  uint64_t v30;
  NSObject *v31;
  _BYTE *v32;
  const __CFString *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  NSObject *v42;
  uint32_t v43;
  uint64_t v44;
  NSObject *v45;
  char *v46;
  char *__lasts;
  char *__str;
  _BYTE v49[128];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  char *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v3 = *(void **)(a1 + 40);
      v4 = v3 ? (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s", v4);
      if (__str)
      {
        __lasts = 0;
        v13 = strtok_r(__str, "\n", &__lasts);
        v14 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *v14;
            if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v55 = v15;
              v56 = 2080;
              v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
              v58 = 1024;
              v59 = 3549;
              v60 = 2080;
              v61 = "peerSubscribedStreams=";
              v62 = 2080;
              v63 = v13;
              _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v13 = strtok_r(0, "\n", &__lasts);
        }
        while (v13);
        goto LABEL_26;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (__CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v5 = (const char *)-[__CFString UTF8String](v2, "UTF8String");
      v7 = *(const void **)(a1 + 32);
      v6 = *(void **)(a1 + 40);
      v8 = v6 ? (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) %s", v5, v7, v8);
      if (__str)
      {
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
              v55 = v11;
              v56 = 2080;
              v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
              v58 = 1024;
              v59 = 3549;
              v60 = 2080;
              v61 = "peerSubscribedStreams=";
              v62 = 2080;
              v63 = v9;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v9 = strtok_r(0, "\n", &__lasts);
        }
        while (v9);
LABEL_26:
        free(__str);
      }
    }
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v18 = *(void **)(*(_QWORD *)(a1 + 32) + 816);
      v19 = v18 ? (const char *)objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s", v19);
      if (__str)
      {
        __lasts = 0;
        v28 = strtok_r(__str, "\n", &__lasts);
        v29 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v30 = VRTraceErrorLogLevelToCSTR();
            v31 = *v29;
            if (os_log_type_enabled(*v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v55 = v30;
              v56 = 2080;
              v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
              v58 = 1024;
              v59 = 3550;
              v60 = 2080;
              v61 = "localPublishedStreams=";
              v62 = 2080;
              v63 = v28;
              _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v28 = strtok_r(0, "\n", &__lasts);
        }
        while (v28);
        goto LABEL_52;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (__CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      __str = 0;
      v20 = (const char *)-[__CFString UTF8String](v17, "UTF8String");
      v21 = *(_QWORD **)(a1 + 32);
      v22 = (void *)v21[102];
      v23 = v22 ? (const char *)objc_msgSend((id)objc_msgSend(v22, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "%s(%p) %s", v20, v21, v23);
      if (__str)
      {
        __lasts = 0;
        v24 = strtok_r(__str, "\n", &__lasts);
        v25 = (os_log_t *)MEMORY[0x1E0CF2758];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v26 = VRTraceErrorLogLevelToCSTR();
            v27 = *v25;
            if (os_log_type_enabled(*v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              v55 = v26;
              v56 = 2080;
              v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
              v58 = 1024;
              v59 = 3550;
              v60 = 2080;
              v61 = "localPublishedStreams=";
              v62 = 2080;
              v63 = v24;
              _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v24 = strtok_r(0, "\n", &__lasts);
        }
        while (v24);
LABEL_52:
        free(__str);
      }
    }
  }
  v32 = *(_BYTE **)(a1 + 32);
  if (v32[408])
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v39 = VRTraceErrorLogLevelToCSTR();
        v40 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v55 = v39;
          v56 = 2080;
          v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
          v58 = 1024;
          v59 = 3553;
          v41 = " [%s] %s:%d Peer subscribed streams update occured while in OneToOne mode. Ignoring subscribed streams update";
          v42 = v40;
          v43 = 28;
LABEL_72:
          _os_log_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_DEFAULT, v41, buf, v43);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v33 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v33 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v44 = VRTraceErrorLogLevelToCSTR();
        v45 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v46 = *(char **)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          v55 = v44;
          v56 = 2080;
          v57 = "-[VCSessionParticipantLocal setPeerSubscribedStreams:]_block_invoke";
          v58 = 1024;
          v59 = 3553;
          v60 = 2112;
          v61 = (const char *)v33;
          v62 = 2048;
          v63 = v46;
          v41 = " [%s] %s:%d %@(%p) Peer subscribed streams update occured while in OneToOne mode. Ignoring subscribed streams update";
          v42 = v45;
          v43 = 48;
          goto LABEL_72;
        }
      }
    }
  }
  else
  {
    objc_msgSend(v32, "checkSubscribedStreamsConsistency:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "updateRedundancyEnabledForPeerSubscribedStreams:", *(_QWORD *)(a1 + 40));
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v34 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "allValues");
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v51 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(*(id *)(a1 + 32), "updatePeerSubscribedStreams:streamGroup:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
      }
      while (v36);
    }
    objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 568), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 572));
  }
}

- (void)updateRedundancyEnabledForPeerSubscribedStreams:(id)a3
{
  uint64_t v5;
  void *v6;
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
  if (!-[VCDefaults forceFECRepairStream](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFECRepairStream"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (!v7)
    {
      v5 = 0;
      goto LABEL_3;
    }
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_6:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      v11 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[VCSessionUplinkBandwidthAllocator repairStreamIDsForStreamToken:](self->_uplinkBandwidthAllocator, "repairStreamIDsForStreamToken:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "streamToken")));
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3), "intersectsSet:", v11) & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        v5 = 0;
        if (v8)
          goto LABEL_6;
        goto LABEL_3;
      }
    }
  }
  v5 = 1;
LABEL_3:
  -[VCSessionParticipantLocal enableRedundancy:](self, "enableRedundancy:", v5);
}

- (void)updatePeerSubscribedStreams:(id)a3 streamGroup:(id)a4
{
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend((id)objc_msgSend(a4, "streamIDToMediaStreamMap"), "allKeys"));
  objc_msgSend(v7, "intersectSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a3));
  v8 = (void *)objc_msgSend((id)objc_msgSend(v7, "allObjects"), "mutableCopy");
  v9 = +[VCSessionParticipantLocal updateUplinkStreamsForPeerSubscribedStreams:streamGroup:uplinkBandwidthAllocator:](VCSessionParticipantLocal, "updateUplinkStreamsForPeerSubscribedStreams:streamGroup:uplinkBandwidthAllocator:", v8, a4, self->_uplinkBandwidthAllocator);
  v10 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[VCSessionUplinkBandwidthAllocator repairStreamIDsForStreamToken:](self->_uplinkBandwidthAllocator, "repairStreamIDsForStreamToken:", objc_msgSend(a4, "streamToken")));
  LOBYTE(v10) = objc_msgSend(a4, "updatePeerSubscribedStreams:containsRepairStreams:", v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8), "intersectsSet:", v10));

  if ((v10 & 1) != 0 || v9)
    -[VCSessionParticipantLocal updateMediaStreamsForStreamGroup:uplinkBitrateCap:rateChangeCounter:](self, "updateMediaStreamsForStreamGroup:uplinkBitrateCap:rateChangeCounter:", a4, self->_currentUplinkTargetBitrate, self->_currentRateChangeCounter);
}

+ (BOOL)updateBandwidthAllocator:(id)a3 activeStream:(id)a4 peerSubscribedStreams:(id)a5 streamGroup:(id)a6
{
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v11 = (void *)objc_msgSend(a4, "multiwayConfig");
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v12 = (void *)objc_msgSend(v11, "streamIds");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
  if (!v13)
    return v13;
  v14 = v13;
  v33 = a3;
  v34 = a1;
  v32 = v11;
  LOBYTE(v15) = 0;
  LOBYTE(a1) = 0;
  v16 = *(_QWORD *)v51;
  while (2)
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v51 != v16)
        objc_enumerationMutation(v12);
      v18 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
      if ((v15 & 1) != 0)
      {
        v15 = 1;
        if ((a1 & 1) == 0)
          goto LABEL_8;
      }
      else
      {
        v15 = objc_msgSend((id)objc_msgSend(a6, "peerSubscribedStreams"), "containsObject:", v18);
        if ((a1 & 1) == 0)
        {
LABEL_8:
          a1 = (id)objc_msgSend(a6, "shouldSubscribeToStreamID:peerSubscribedStreams:", v18, a5);
          goto LABEL_11;
        }
      }
      a1 = (id)1;
LABEL_11:
      if ((v15 & a1 & 1) != 0)
        goto LABEL_18;
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
    if (v14)
      continue;
    break;
  }
  if (v15 == (_DWORD)a1)
  {
LABEL_18:
    LOBYTE(v13) = 0;
    return v13;
  }
  if ((id)objc_opt_class() == v34)
  {
    v20 = v32;
    v19 = v33;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if ((_DWORD)a1)
          v24 = "subscribed to";
        else
          v24 = "unsubscribed from";
        *(_DWORD *)buf = 136316162;
        v36 = v22;
        v37 = 2080;
        v38 = "+[VCSessionParticipantLocal updateBandwidthAllocator:activeStream:peerSubscribedStreams:streamGroup:]";
        v39 = 1024;
        v40 = 3627;
        v41 = 2080;
        v42 = (void *)v24;
        v43 = 2112;
        v44 = objc_msgSend(a6, "streamDescriptionForMediaStreamConfig:", a4);
        v25 = " [%s] %s:%d Remote %s %@";
        v26 = v23;
        v27 = 48;
LABEL_33:
        _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }
  }
  else
  {
    v20 = v32;
    v19 = v33;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)objc_msgSend(v34, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if ((_DWORD)a1)
          v30 = "subscribed to";
        else
          v30 = "unsubscribed from";
        *(_DWORD *)buf = 136316674;
        v36 = v28;
        v37 = 2080;
        v38 = "+[VCSessionParticipantLocal updateBandwidthAllocator:activeStream:peerSubscribedStreams:streamGroup:]";
        v39 = 1024;
        v40 = 3627;
        v41 = 2112;
        v42 = (void *)v21;
        v43 = 2048;
        v44 = (uint64_t)v34;
        v45 = 2080;
        v46 = v30;
        v47 = 2112;
        v48 = objc_msgSend(a6, "streamDescriptionForMediaStreamConfig:", a4);
        v25 = " [%s] %s:%d %@(%p) Remote %s %@";
        v26 = v29;
        v27 = 68;
        goto LABEL_33;
      }
    }
  }
  LOBYTE(v13) = objc_msgSend(v19, "peerSubscription:streamID:", a1, objc_msgSend(v20, "idsStreamID"));
  return v13;
}

+ (BOOL)updateUplinkStreamsForPeerSubscribedStreams:(id)a3 streamGroup:(id)a4 uplinkBandwidthAllocator:(id)a5
{
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_msgSend(a4, "mediaStreamInfoArray");
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  v8 = 0;
  if (v20)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(obj);
        v21 = v9;
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v9);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v11 = (void *)objc_msgSend(v10, "streamConfigs");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v24;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v24 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              if (objc_msgSend((id)objc_msgSend(v16, "multiwayConfig"), "startOnDemand"))
                v8 |= +[VCSessionParticipantLocal updateBandwidthAllocator:activeStream:peerSubscribedStreams:streamGroup:](VCSessionParticipantLocal, "updateBandwidthAllocator:activeStream:peerSubscribedStreams:streamGroup:", a5, v16, a3, a4);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
          }
          while (v13);
        }
        v9 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    }
    while (v20);
  }
  return v8 & 1;
}

- (BOOL)enableRedundancy:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 enableRedundancy;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  _BOOL4 v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  enableRedundancy = self->_enableRedundancy;
  if (enableRedundancy != a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v20 = v6;
        v21 = 2080;
        v22 = "-[VCSessionParticipantLocal enableRedundancy:]";
        v23 = 1024;
        v24 = 3657;
        v25 = 1024;
        v26 = v3;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sender side redundancy changed to[%d]", buf, 0x22u);
      }
    }
    self->_enableRedundancy = v3;
    -[VCSessionUplinkBandwidthAllocator setRedundancyEnabled:](self->_uplinkBandwidthAllocator, "setRedundancyEnabled:", v3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
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
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "enableRedundancy:", v3);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v10);
    }
  }
  return enableRedundancy != v3;
}

- (void)setRetransmissionEnabled:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCSessionParticipantLocal_setRetransmissionEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __54__VCSessionParticipantLocal_setRetransmissionEnabled___block_invoke(uint64_t a1)
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
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "allValues");
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (objc_msgSend(*(id *)(a1 + 32), "shouldEnableUplinkRetransmissionForStreamGroupID:", objc_msgSend(v7, "streamGroupID")))objc_msgSend(v7, "setRetransmissionEnabled:", *(unsigned __int8 *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v4 = result;
    }
    while (result);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1073) = *(_BYTE *)(a1 + 40);
  return result;
}

- (void)setUpCaptions
{
  NSObject *participantQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__VCSessionParticipantLocal_setUpCaptions__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __42__VCSessionParticipantLocal_setUpCaptions__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _OWORD v4[2];
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 520))
  {
    v1 = result;
    *(_QWORD *)(*(_QWORD *)(result + 32) + 1104) = VCUniqueIDGenerator_GenerateID();
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 216), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(v1 + 32) + 1104)), &unk_1E9EF5510);
    v5 = 0u;
    memset(v4, 0, sizeof(v4));
    v2 = *(_QWORD *)(v1 + 32);
    v3 = *(_QWORD *)(v2 + 1104);
    BYTE8(v5) = 1;
    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 520), "registerStreamWithConfig:", &v3, Format_Float((uint64_t)v4, 1, *(_DWORD *)(v2 + 400)));
  }
  return result;
}

- (void)updateUplinkTargetBitrate:(unsigned int)a3 rateChangeCounter:(unsigned int)a4
{
  NSObject *participantQueue;
  _QWORD block[5];
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__VCSessionParticipantLocal_updateUplinkTargetBitrate_rateChangeCounter___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_async(participantQueue, block);
}

uint64_t __73__VCSessionParticipantLocal_updateUplinkTargetBitrate_rateChangeCounter___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  int *v12;
  int v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  int v17;
  uint64_t v18;
  _DWORD *v19;
  _BYTE v21[24];
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_18;
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_DWORD *)(v5 + 568);
    if (*(_BYTE *)(v5 + 1000))
      v7 = (int *)(v5 + 1004);
    else
      v7 = (int *)(a1 + 40);
    v17 = *v7;
    *(_DWORD *)v21 = 136316162;
    *(_QWORD *)&v21[4] = v3;
    *(_WORD *)&v21[12] = 2080;
    *(_QWORD *)&v21[14] = "-[VCSessionParticipantLocal updateUplinkTargetBitrate:rateChangeCounter:]_block_invoke";
    *(_WORD *)&v21[22] = 1024;
    LODWORD(v22) = 3717;
    WORD2(v22) = 1024;
    *(_DWORD *)((char *)&v22 + 6) = v6;
    WORD5(v22) = 1024;
    HIDWORD(v22) = v17;
    v14 = " [%s] %s:%d Uplink TargetBitrate changed from %u to %u";
    v15 = v4;
    v16 = 40;
    goto LABEL_17;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
  else
    v2 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_DWORD *)(v10 + 568);
      if (*(_BYTE *)(v10 + 1000))
        v12 = (int *)(v10 + 1004);
      else
        v12 = (int *)(a1 + 40);
      v13 = *v12;
      *(_DWORD *)v21 = 136316674;
      *(_QWORD *)&v21[4] = v8;
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "-[VCSessionParticipantLocal updateUplinkTargetBitrate:rateChangeCounter:]_block_invoke";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 3717;
      WORD2(v22) = 2112;
      *(_QWORD *)((char *)&v22 + 6) = v2;
      HIWORD(v22) = 2048;
      v23 = v10;
      LOWORD(v24) = 1024;
      *(_DWORD *)((char *)&v24 + 2) = v11;
      HIWORD(v24) = 1024;
      LODWORD(v25) = v13;
      v14 = " [%s] %s:%d %@(%p) Uplink TargetBitrate changed from %u to %u";
      v15 = v9;
      v16 = 60;
LABEL_17:
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, v21, v16);
    }
  }
LABEL_18:
  v18 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v18 + 1000))
    v19 = (_DWORD *)(v18 + 1004);
  else
    v19 = (_DWORD *)(a1 + 40);
  *(_DWORD *)(v18 + 568) = *v19;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 572) = *(_DWORD *)(a1 + 44);
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, v23, v24, v25);
}

- (void)updateUplinkTargetBitrateForStreamGroups
{
  NSObject *participantQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__VCSessionParticipantLocal_updateUplinkTargetBitrateForStreamGroups__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __69__VCSessionParticipantLocal_updateUplinkTargetBitrateForStreamGroups__block_invoke(uint64_t a1)
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
  _BYTE v14[24];
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 568);
        *(_DWORD *)v14 = 136315906;
        *(_QWORD *)&v14[4] = v3;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCSessionParticipantLocal updateUplinkTargetBitrateForStreamGroups]_block_invoke";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 3726;
        WORD2(v15) = 1024;
        *(_DWORD *)((char *)&v15 + 6) = v5;
        v6 = " [%s] %s:%d Uplink TargetBitrate set to %u";
        v7 = v4;
        v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v14, v8);
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
        v12 = *(_DWORD *)(v11 + 568);
        *(_DWORD *)v14 = 136316418;
        *(_QWORD *)&v14[4] = v9;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCSessionParticipantLocal updateUplinkTargetBitrateForStreamGroups]_block_invoke";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 3726;
        WORD2(v15) = 2112;
        *(_QWORD *)((char *)&v15 + 6) = v2;
        HIWORD(v15) = 2048;
        v16 = v11;
        LOWORD(v17) = 1024;
        *(_DWORD *)((char *)&v17 + 2) = v12;
        v6 = " [%s] %s:%d %@(%p) Uplink TargetBitrate set to %u";
        v7 = v10;
        v8 = 54;
        goto LABEL_11;
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 568), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 572), *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16, v17, v18);
}

- (void)dispatchedUpdateUplinkTargetBitrate:(unsigned int)a3 rateChangeCounter:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->super._state == 1)
  {
    v4 = *(_QWORD *)&a4;
    v5 = *(_QWORD *)&a3;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (void *)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v12, "setCurrentUplinkTargetBitrate:", v5);
          -[VCSessionParticipantLocal updateMediaStreamsForStreamGroup:uplinkBitrateCap:rateChangeCounter:](self, "updateMediaStreamsForStreamGroup:uplinkBitrateCap:rateChangeCounter:", v12, v5, v4);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v9);
    }
  }
}

- (void)updateTargetBitrateOneToOne:(unsigned int)a3 rateChangeCounter:(unsigned int)a4
{
  NSObject *participantQueue;
  _QWORD block[5];
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__VCSessionParticipantLocal_updateTargetBitrateOneToOne_rateChangeCounter___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_async(participantQueue, block);
}

uint64_t __75__VCSessionParticipantLocal_updateTargetBitrateOneToOne_rateChangeCounter___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
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
  int v17;
  int v18;
  _BYTE v20[24];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = v5 + 944;
        LODWORD(v5) = *(_DWORD *)(v5 + 168);
        LODWORD(v6) = *(_DWORD *)(v6 + 32);
        v7 = *(_DWORD *)(a1 + 40);
        v8 = *(_DWORD *)(a1 + 44);
        *(_DWORD *)v20 = 136316674;
        *(_QWORD *)&v20[4] = v3;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCSessionParticipantLocal updateTargetBitrateOneToOne:rateChangeCounter:]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 3743;
        WORD2(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 6) = v6;
        WORD5(v21) = 1024;
        HIDWORD(v21) = v7;
        LOWORD(v22) = 1024;
        *(_DWORD *)((char *)&v22 + 2) = v5;
        HIWORD(v22) = 1024;
        LODWORD(v23) = v8;
        v9 = " [%s] %s:%d OneToOne TargetBitrate changed from %u to %u (state=%u, rateChangeCounter=%u)";
        v10 = v4;
        v11 = 52;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v20, v11);
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
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(_DWORD *)(v14 + 168);
        v16 = *(_DWORD *)(v14 + 976);
        v17 = *(_DWORD *)(a1 + 40);
        v18 = *(_DWORD *)(a1 + 44);
        *(_DWORD *)v20 = 136317186;
        *(_QWORD *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCSessionParticipantLocal updateTargetBitrateOneToOne:rateChangeCounter:]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 3743;
        WORD2(v21) = 2112;
        *(_QWORD *)((char *)&v21 + 6) = v2;
        HIWORD(v21) = 2048;
        v22 = v14;
        LOWORD(v23) = 1024;
        *(_DWORD *)((char *)&v23 + 2) = v16;
        HIWORD(v23) = 1024;
        LODWORD(v24) = v17;
        WORD2(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 6) = v15;
        WORD5(v24) = 1024;
        HIDWORD(v24) = v18;
        v9 = " [%s] %s:%d %@(%p) OneToOne TargetBitrate changed from %u to %u (state=%u, rateChangeCounter=%u)";
        v10 = v13;
        v11 = 72;
        goto LABEL_11;
      }
    }
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 976) = *(_DWORD *)(a1 + 40);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 980) = *(_DWORD *)(a1 + 44);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 568) = *(_DWORD *)(a1 + 40);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 572) = *(_DWORD *)(a1 + 44);
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:", *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(_OWORD *)v20, *(_QWORD *)&v20[16], v21, v22, v23, v24, v25);
}

- (void)updateVCMediaQueueSize:(unsigned int)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__VCSessionParticipantLocal_updateVCMediaQueueSize___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __52__VCSessionParticipantLocal_updateVCMediaQueueSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateVCMediaQueueSize:", *(unsigned int *)(a1 + 40));
}

- (void)dispatchedUpdateVCMediaQueueSize:(unsigned int)a3
{
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  unsigned int currentVCMediaQueueSize;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  NSMutableArray *videoStreamGroups;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BYTE v35[10];
  VCSessionParticipantLocal *v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (self->super._state == 1)
  {
    v4 = *(_QWORD *)&a3;
    if (self->_currentVCMediaQueueSize == a3)
      return;
    if ((VCSessionParticipantLocal *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          currentVCMediaQueueSize = self->_currentVCMediaQueueSize;
          *(_DWORD *)buf = 136316162;
          v29 = v9;
          v30 = 2080;
          v31 = "-[VCSessionParticipantLocal dispatchedUpdateVCMediaQueueSize:]";
          v32 = 1024;
          v33 = 3765;
          v34 = 1024;
          *(_DWORD *)v35 = currentVCMediaQueueSize;
          *(_WORD *)&v35[4] = 1024;
          *(_DWORD *)&v35[6] = v4;
          v12 = " [%s] %s:%d VCMediaQueue size changed from old=%ums to new=%ums";
          v13 = v10;
          v14 = 40;
LABEL_23:
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v17 = self->_currentVCMediaQueueSize;
          *(_DWORD *)buf = 136316674;
          v29 = v15;
          v30 = 2080;
          v31 = "-[VCSessionParticipantLocal dispatchedUpdateVCMediaQueueSize:]";
          v32 = 1024;
          v33 = 3765;
          v34 = 2112;
          *(_QWORD *)v35 = v5;
          *(_WORD *)&v35[8] = 2048;
          v36 = self;
          v37 = 1024;
          v38 = v17;
          v39 = 1024;
          v40 = v4;
          v12 = " [%s] %s:%d %@(%p) VCMediaQueue size changed from old=%ums to new=%ums";
          v13 = v16;
          v14 = 60;
          goto LABEL_23;
        }
      }
    }
    self->_currentVCMediaQueueSize = v4;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    videoStreamGroups = self->super._videoStreamGroups;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoStreamGroups, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(videoStreamGroups);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "setMediaQueueSize:", v4);
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](videoStreamGroups, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      }
      while (v20);
    }
    return;
  }
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionParticipantLocal dispatchedUpdateVCMediaQueueSize:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v29 = v7;
        v30 = 2080;
        v31 = "-[VCSessionParticipantLocal dispatchedUpdateVCMediaQueueSize:]";
        v32 = 1024;
        v33 = 3761;
        v34 = 2112;
        *(_QWORD *)v35 = v6;
        *(_WORD *)&v35[8] = 2048;
        v36 = self;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) VCMediaQueue size should only be updated when participant is running", buf, 0x30u);
      }
    }
  }
}

- (unsigned)generateIDSStreamID
{
  return (unint64_t)-[VCSessionParticipantLocal generateSSRC:streamID:repairStreamID:v2StreamID:](self, "generateSSRC:streamID:repairStreamID:v2StreamID:", 0, 1, 0, 0) >> 32;
}

- (unsigned)generateSSRC
{
  return -[VCSessionParticipantLocal generateSSRC:streamID:repairStreamID:v2StreamID:](self, "generateSSRC:streamID:repairStreamID:v2StreamID:", 1, 0, 0, 0);
}

- (tagVCNetworkStreamIdentifiers)generateSSRC:(BOOL)a3 streamID:(BOOL)a4 repairStreamID:(BOOL)a5 v2StreamID:(BOOL)a6
{
  NSObject *participantQueue;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  _QWORD v11[6];
  BOOL v12;
  BOOL v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  const char *v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  tagVCNetworkStreamIdentifiers result;

  v22 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3010000000;
  v19 = "";
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v21 = -1431655766;
  participantQueue = self->super._participantQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__VCSessionParticipantLocal_generateSSRC_streamID_repairStreamID_v2StreamID___block_invoke;
  v11[3] = &unk_1E9E54AC8;
  v12 = a3;
  v11[4] = self;
  v11[5] = &v16;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  dispatch_sync(participantQueue, v11);
  v7 = v17[4];
  v8 = *((_DWORD *)v17 + 10);
  _Block_object_dispose(&v16, 8);
  v9 = v7;
  v10 = v8;
  result.var0 = v9;
  result.var1 = WORD2(v9);
  result.var2 = HIWORD(v9);
  result.var3 = v10;
  return result;
}

uint64_t __77__VCSessionParticipantLocal_generateSSRC_streamID_repairStreamID_v2StreamID___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unsigned __int16 v4;
  __int16 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;

  do
  {
    result = RTPGenerateSSRC();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 36) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 32);
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 38) = *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 36)
                                                               + 1;
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(_WORD *)(v3 + 36);
    if (v4 < 0xFF9Bu)
      v5 = 100;
    else
      v5 = 101;
    *(_WORD *)(v3 + 40) = v5 + v4;
    if (*(_BYTE *)(a1 + 48))
    {
      result = objc_msgSend(*(id *)(a1 + 32), "containsStreamWithSSRC:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
      v6 = (result & 1) == 0 && *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) > 0x3Fu;
    }
    else
    {
      v6 = 1;
    }
    if (*(_BYTE *)(a1 + 49))
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 36)));
      v7 = (result & 1) == 0 && *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 36) != 0;
    }
    else
    {
      v7 = 1;
    }
    if (*(_BYTE *)(a1 + 50))
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 38)));
      v8 = (result & 1) == 0 && *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 38) != 0;
    }
    else
    {
      v8 = 1;
    }
    if (*(_BYTE *)(a1 + 51))
    {
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)));
      v9 = (result & 1) == 0 && *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
    }
    else
    {
      v9 = 1;
    }
  }
  while (!v6 || !v7 || !v8 || !v9);
  if (*(_BYTE *)(a1 + 49))
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 36)));
  else
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 36) = 0;
  if (*(_BYTE *)(a1 + 50))
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 38)));
  else
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 38) = 0;
  if (*(_BYTE *)(a1 + 51))
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)));
  else
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  if (*(_BYTE *)(a1 + 48))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 0;
  return result;
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  VCSessionPartipantLocal_OnVideoFrame((uint64_t)self, a3, (uint64_t)a3, (uint64_t)a5);
  return 1;
}

- (BOOL)prepareVideoFrame:(opaqueCMSampleBuffer *)a3
{
  VCMediaRecorder_PrepareVideoSampleBuffer((uint64_t)self->super._mediaRecorder, a3);
  return 1;
}

- (void)sourceFrameRateDidChange:(unsigned int)a3
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
  const __CFString *v20;
  __int16 v21;
  VCSessionParticipantLocal *v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
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
        v16 = "-[VCSessionParticipantLocal sourceFrameRateDidChange:]";
        v17 = 1024;
        v18 = 3865;
        v19 = 1024;
        LODWORD(v20) = a3;
        v8 = " [%s] %s:%d frameRate=%u";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
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
        v16 = "-[VCSessionParticipantLocal sourceFrameRateDidChange:]";
        v17 = 1024;
        v18 = 3865;
        v19 = 2112;
        v20 = v5;
        v21 = 2048;
        v22 = self;
        v23 = 1024;
        v24 = a3;
        v8 = " [%s] %s:%d %@(%p) frameRate=%u";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
}

- (id)copyOnVideoFrameBlock
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__VCSessionParticipantLocal_copyOnVideoFrameBlock__block_invoke;
  v3[3] = &unk_1E9E56490;
  v3[4] = self;
  return _Block_copy(v3);
}

uint64_t __50__VCSessionParticipantLocal_copyOnVideoFrameBlock__block_invoke(uint64_t a1, opaqueCMSampleBuffer *a2, uint64_t a3, uint64_t a4)
{
  VCSessionPartipantLocal_OnVideoFrame(*(_QWORD *)(a1 + 32), a2, a3, a4);
  return 1;
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
  VCSessionParticipantLocal *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
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
        v16 = "-[VCSessionParticipantLocal avConferencePreviewError:]";
        v17 = 1024;
        v18 = 3877;
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
      v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
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
        v16 = "-[VCSessionParticipantLocal avConferencePreviewError:]";
        v17 = 1024;
        v18 = 3877;
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
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSArray *remoteParticipants;
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
  VCSessionParticipantLocal *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v3 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
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
        v26 = "-[VCSessionParticipantLocal thermalLevelDidChange:]";
        v27 = 1024;
        v28 = 3885;
        v29 = 1024;
        LODWORD(v30) = v3;
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
      v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
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
        v26 = "-[VCSessionParticipantLocal thermalLevelDidChange:]";
        v27 = 1024;
        v28 = 3885;
        v29 = 2112;
        v30 = v5;
        v31 = 2048;
        v32 = self;
        v33 = 1024;
        v34 = v3;
        v8 = " [%s] %s:%d %@(%p) thermalLevelDidChange %u";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  micro();
  reportingThermal();
  -[VCSessionParticipantLocal checkAndReportThermalIncreaseAudioOnly:](self, "checkAndReportThermalIncreaseAudioOnly:", v3);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  remoteParticipants = self->_remoteParticipants;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](remoteParticipants, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(remoteParticipants);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "updateThermalLevel:", v3);
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](remoteParticipants, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v15);
  }
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
  VCSessionParticipantLocal *v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if ((VCSessionParticipantLocal *)objc_opt_class() == self)
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
      v18 = "-[VCSessionParticipantLocal cameraAvailabilityDidChange:]";
      v19 = 1024;
      v20 = 3894;
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
      -[VCSessionParticipantLocal cameraAvailabilityDidChange:].cold.1();
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionParticipantLocal performSelector:](self, "performSelector:", sel_logPrefix);
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
        v18 = "-[VCSessionParticipantLocal cameraAvailabilityDidChange:]";
        v19 = 1024;
        v20 = 3894;
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
        v18 = "-[VCSessionParticipantLocal cameraAvailabilityDidChange:]";
        v19 = 1024;
        v20 = 3894;
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

- (void)captureSourcePositionDidChange:(BOOL)a3
{
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
}

- (void)captureSourceCenterStageEnabledDidChange:(BOOL)a3
{
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
}

- (void)captureSourcePortraitBlurEnabledDidChange:(BOOL)a3
{
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
}

- (void)updateCaptureSourceVideoFeatureStatus:(tagVCVideoCaptureFeatureStatus)a3
{
  uint64_t v3;
  _QWORD v5[5];
  _QWORD v6[6];

  v3 = *(_QWORD *)&a3.var0;
  v6[5] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("VideoEyeContact");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", a3.var0);
  v5[1] = CFSTR("PMFENB");
  v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", ((int)((_DWORD)v3 << 8) >> 24));
  v5[2] = CFSTR("SLFENB");
  v6[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", ((int)v3 >> 24));
  v5[3] = CFSTR("CSFENB");
  v6[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", ((__int16)v3 >> 8));
  v5[4] = CFSTR("REFENB");
  v6[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", v3 << 24 >> 56);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 5);
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
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
  CFDictionaryAddValue(Mutable, CFSTR("VCSPUUID"), self->super._uuid);
  CFDictionaryAddValue(Mutable, CFSTR("VCSPFR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7));
  CFDictionaryAddValue(Mutable, CFSTR("VCSPTLC"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6));
  CFDictionaryAddValue(Mutable, CFSTR("VCSPPLC"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5));
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
  if (Mutable)
    CFRelease(Mutable);
}

- (void)captureSource1080pAvailabilityDidChange:(BOOL)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__VCSessionParticipantLocal_captureSource1080pAvailabilityDidChange___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __69__VCSessionParticipantLocal_captureSource1080pAvailabilityDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setCamera1080pAvailable:", *(unsigned __int8 *)(a1 + 40));
}

- (void)reactionDidStart:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCSessionParticipantLocal_reactionDidStart___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __46__VCSessionParticipantLocal_reactionDidStart___block_invoke(uint64_t a1)
{
  _QWORD v2[7];

  v2[6] = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__VCSessionParticipantLocal_reactionDidStart___block_invoke_2;
  v2[3] = &unk_1E9E55208;
  return objc_msgSend(*(id *)(a1 + 32), "callDelegateWithBlock:", v2);
}

uint64_t __46__VCSessionParticipantLocal_reactionDidStart___block_invoke_2(uint64_t a1, void *a2)
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
  v3[2] = __44__VCSessionParticipantLocal_didStopReacting__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(participantQueue, v3);
}

uint64_t __44__VCSessionParticipantLocal_didStopReacting__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__VCSessionParticipantLocal_didStopReacting__block_invoke_2;
  v3[3] = &unk_1E9E55140;
  v3[4] = v1;
  return objc_msgSend(v1, "callDelegateWithBlock:", v3);
}

uint64_t __44__VCSessionParticipantLocal_didStopReacting__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipantDidStopReacting:", *(_QWORD *)(a1 + 32));
}

- (void)reportVideoEnabledStatsWithVideoEnabled:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double lastVideoEnabledChangedTime;
  NSString *uuid;
  _QWORD v8[3];
  _QWORD v9[4];

  v3 = a3;
  v9[3] = *MEMORY[0x1E0C80C00];
  v5 = micro();
  lastVideoEnabledChangedTime = self->_lastVideoEnabledChangedTime;
  v8[0] = CFSTR("VCSPUUID");
  uuid = self->super._uuid;
  if (!uuid)
    uuid = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9[0] = uuid;
  v8[1] = CFSTR("VIDSTATE");
  v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8[2] = CFSTR("VIDDRTN");
  v9[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (v5 - lastVideoEnabledChangedTime));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  -[VCSessionParticipant reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
  self->_lastVideoEnabledChangedTime = v5;
}

- (void)dispatchedHandleActiveConnectionChangeForStreamGroups:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  id obj;
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
  obj = (id)-[NSMutableDictionary allValues](self->super._streamGroups, "allValues");
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
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
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "streamToken");
        v11 = self->super._oneToOneModeEnabled || objc_msgSend(v9, "streamGroupID") == 1935897189;
        objc_msgSend(v9, "setActiveConnection:uplinkBitrateCap:activeMediaStreamIDs:mediaBitrates:rateChangeCounter:", a3, self->_currentUplinkTargetBitrate, -[VCSessionUplinkBandwidthAllocator streamIDsForStreamToken:targetBitrate:](self->_uplinkBandwidthAllocator, "streamIDsForStreamToken:targetBitrate:", v10, self->_currentUplinkTargetBitrate), -[VCSessionUplinkBandwidthAllocator targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:](self->_uplinkBandwidthAllocator, "targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:", v10, self->_currentUplinkTargetBitrate, v11), self->_currentRateChangeCounter);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v6);
  }
  -[VCSessionParticipantLocal dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:](self, "dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:", self->_currentUplinkTargetBitrate, self->_currentRateChangeCounter);
}

- (void)updateMediaStreamsForStreamGroup:(id)a3 uplinkBitrateCap:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  _BOOL8 v10;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v9 = objc_msgSend(a3, "streamToken");
  v10 = self->super._oneToOneModeEnabled || objc_msgSend(a3, "streamGroupID") == 1935897189;
  objc_msgSend(a3, "updateUplinkBitrateCapCell:activeStreamIDs:", self->_uplinkBitrateCapCell, -[VCSessionUplinkBandwidthAllocator streamIDsForStreamToken:targetBitrateCap:](self->_uplinkBandwidthAllocator, "streamIDsForStreamToken:targetBitrateCap:", v9, self->_uplinkBitrateCapCell));
  objc_msgSend(a3, "updateUplinkBitrateCapWifi:activeStreamIDs:", self->_uplinkBitrateCapWifi, -[VCSessionUplinkBandwidthAllocator streamIDsForStreamToken:targetBitrateCap:](self->_uplinkBandwidthAllocator, "streamIDsForStreamToken:targetBitrateCap:", v9, self->_uplinkBitrateCapWifi));
  objc_msgSend(a3, "updateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:", -[VCSessionUplinkBandwidthAllocator streamIDsForStreamToken:targetBitrate:](self->_uplinkBandwidthAllocator, "streamIDsForStreamToken:targetBitrate:", v9, v6), v6, -[VCSessionUplinkBandwidthAllocator targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:](self->_uplinkBandwidthAllocator, "targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:", v9, v6, v10), v5);
}

- (void)serverDidDie
{
  -[VCSessionParticipantDelegate serverDidDie](-[VCSessionParticipant delegate](self, "delegate"), "serverDidDie");
}

- (void)handleActiveConnectionChange:(id)a3
{
  NSObject *participantQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__VCSessionParticipantLocal_handleActiveConnectionChange___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __58__VCSessionParticipantLocal_handleActiveConnectionChange___block_invoke(uint64_t a1)
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
  int IsEndToEndLink;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  const __CFString *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  int IsLocalOnCellular;
  uint64_t v29;
  unsigned int v30;
  _BYTE v32[24];
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = objc_msgSend(*(id *)(a1 + 40), "uplinkBitrateCap");
        *(_DWORD *)v32 = 136315906;
        *(_QWORD *)&v32[4] = v3;
        *(_WORD *)&v32[12] = 2080;
        *(_QWORD *)&v32[14] = "-[VCSessionParticipantLocal handleActiveConnectionChange:]_block_invoke";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 4087;
        WORD2(v33) = 1024;
        *(_DWORD *)((char *)&v33 + 6) = v5;
        v6 = " [%s] %s:%d Active connection changed with new connection uplinkBitrateCap %d";
        v7 = v4;
        v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v32, v8);
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
        v12 = objc_msgSend(*(id *)(a1 + 40), "uplinkBitrateCap");
        *(_DWORD *)v32 = 136316418;
        *(_QWORD *)&v32[4] = v9;
        *(_WORD *)&v32[12] = 2080;
        *(_QWORD *)&v32[14] = "-[VCSessionParticipantLocal handleActiveConnectionChange:]_block_invoke";
        *(_WORD *)&v32[22] = 1024;
        LODWORD(v33) = 4087;
        WORD2(v33) = 2112;
        *(_QWORD *)((char *)&v33 + 6) = v2;
        HIWORD(v33) = 2048;
        v34 = v11;
        LOWORD(v35) = 1024;
        *(_DWORD *)((char *)&v35 + 2) = v12;
        v6 = " [%s] %s:%d %@(%p) Active connection changed with new connection uplinkBitrateCap %d";
        v7 = v10;
        v8 = 54;
        goto LABEL_11;
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 432) = VCConnection_IsLocalOnWiFiOrWired(*(_QWORD *)(a1 + 40));
  IsEndToEndLink = VCConnection_IsEndToEndLink(*(_QWORD *)(a1 + 40));
  v14 = *(_QWORD *)(a1 + 32);
  if (IsEndToEndLink)
  {
    if ((objc_msgSend((id)v14, "dispatchedIsAnyCameraMediaTypeEnabled") & 1) != 0
      || *(_BYTE *)(*(_QWORD *)(a1 + 32) + 375))
    {
      v15 = objc_msgSend(*(id *)(a1 + 40), "uplinkBitrateCapOneToOne", *(_OWORD *)v32, *(_QWORD *)&v32[16], v33, v34, v35, v36);
    }
    else
    {
      v15 = objc_msgSend(*(id *)(a1 + 40), "uplinkAudioBitrateCapOneToOne");
    }
    v16 = v15;
    v17 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v17 + 1000))
      v16 = *(_DWORD *)(v17 + 1004);
    if (v16 < *(_DWORD *)(v17 + 976))
    {
      *(_DWORD *)(v17 + 976) = v16;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 568) = v16;
    }
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_35;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      *(_DWORD *)v32 = 136315906;
      *(_QWORD *)&v32[4] = v20;
      *(_WORD *)&v32[12] = 2080;
      *(_QWORD *)&v32[14] = "-[VCSessionParticipantLocal handleActiveConnectionChange:]_block_invoke";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 4098;
      WORD2(v33) = 1024;
      *(_DWORD *)((char *)&v33 + 6) = v16;
      v22 = " [%s] %s:%d Active connection changed with new connection oneToOneUplinkBitrateCap %d";
      v23 = v21;
      v24 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v18 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v18 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_35;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v32 = 136316418;
      *(_QWORD *)&v32[4] = v25;
      *(_WORD *)&v32[12] = 2080;
      *(_QWORD *)&v32[14] = "-[VCSessionParticipantLocal handleActiveConnectionChange:]_block_invoke";
      *(_WORD *)&v32[22] = 1024;
      LODWORD(v33) = 4098;
      WORD2(v33) = 2112;
      *(_QWORD *)((char *)&v33 + 6) = v18;
      HIWORD(v33) = 2048;
      v34 = v27;
      LOWORD(v35) = 1024;
      *(_DWORD *)((char *)&v35 + 2) = v16;
      v22 = " [%s] %s:%d %@(%p) Active connection changed with new connection oneToOneUplinkBitrateCap %d";
      v23 = v26;
      v24 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, v32, v24);
LABEL_35:
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 984) = 1;
    goto LABEL_36;
  }
  if (*(_BYTE *)(v14 + 1000))
  {
    v19 = *(_DWORD *)(v14 + 1004);
  }
  else
  {
    v19 = objc_msgSend(*(id *)(a1 + 40), "uplinkBitrateCap");
    v14 = *(_QWORD *)(a1 + 32);
  }
  *(_DWORD *)(v14 + 568) = v19;
LABEL_36:
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 568) = VCDefaults_GetIntValueForKey(CFSTR("forcedTxRate"), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 568));
  objc_msgSend(*(id *)(a1 + 32), "dispatchedHandleActiveConnectionChangeForStreamGroups:", *(_QWORD *)(a1 + 40));
  IsLocalOnCellular = VCConnection_IsLocalOnCellular(*(_QWORD *)(a1 + 40));
  v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424);
  if (IsLocalOnCellular)
    v30 = objc_msgSend(*(id *)(a1 + 40), "connectionMTU");
  else
    v30 = 1280;
  return VCMediaQueue_SetMTUBytes(v29, v30);
}

- (void)didReceiveReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipantLocal didReceiveReportPacket:arrivalNTPTime:].cold.1();
  }
}

- (void)didReceiveCustomReportPacket:(tagRTCPPACKET *)a3 arrivalNTPTime:(tagNTP)a4
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCSessionParticipantLocal didReceiveCustomReportPacket:arrivalNTPTime:].cold.1();
  }
}

- (void)streamGroup:(id)a3 didSuspendStreams:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 isMixingSystemAudio;
  void *v10;
  int v11;
  uint64_t *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *);
  void *v21;
  VCSessionParticipantLocal *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *);
  void *v27;
  VCSessionParticipantLocal *v28;
  uint64_t v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  _BOOL4 v41;
  uint64_t v42;

  v4 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      isMixingSystemAudio = self->_isMixingSystemAudio;
      *(_DWORD *)buf = 136316418;
      v31 = v7;
      v32 = 2080;
      v33 = "-[VCSessionParticipantLocal streamGroup:didSuspendStreams:]";
      v34 = 1024;
      v35 = 4130;
      v36 = 2112;
      v37 = a3;
      v38 = 1024;
      v39 = v4;
      v40 = 1024;
      v41 = isMixingSystemAudio;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamGroup=%@ didSuspendStreams=%d isMixingSystemAudio=%d", buf, 0x32u);
    }
  }
  if (self->super._state == 1)
  {
    if (objc_msgSend(a3, "streamGroupID") == 1937339233 && self->super._screenEnabled)
    {
      v10 = (void *)objc_msgSend((id)objc_opt_class(), "mediaTypesFromStreamGroupID:", objc_msgSend(a3, "streamGroupID"));
      if (objc_msgSend(v10, "count") == 1)
      {
        v11 = objc_msgSend((id)objc_msgSend(v10, "anyObject"), "unsignedIntValue");
        if (v4)
        {
          if (self->_isMixingSystemAudio)
            return;
          -[VCSessionParticipantLocal startSystemAudioCapture](self, "startSystemAudioCapture");
          -[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:](self, "swapScreenStreamGroupSyncSourceWithState:", 2);
          v24 = MEMORY[0x1E0C809B0];
          v25 = 3221225472;
          v26 = __59__VCSessionParticipantLocal_streamGroup_didSuspendStreams___block_invoke;
          v27 = &unk_1E9E564B8;
          v28 = self;
          LODWORD(v29) = v11;
          v12 = &v24;
        }
        else
        {
          if (!self->_isMixingSystemAudio)
            return;
          -[VCSessionParticipantLocal stopSystemAudioCapture](self, "stopSystemAudioCapture");
          -[VCSessionParticipant swapScreenStreamGroupSyncSourceWithState:](self, "swapScreenStreamGroupSyncSourceWithState:", 1);
          v18 = MEMORY[0x1E0C809B0];
          v19 = 3221225472;
          v20 = __59__VCSessionParticipantLocal_streamGroup_didSuspendStreams___block_invoke_2;
          v21 = &unk_1E9E564B8;
          v22 = self;
          LODWORD(v23) = v11;
          v12 = &v18;
        }
        -[VCSessionParticipant callDelegateWithBlock:](self, "callDelegateWithBlock:", v12, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v17 = self->_isMixingSystemAudio;
          *(_DWORD *)buf = 136316418;
          v31 = v15;
          v32 = 2080;
          v33 = "-[VCSessionParticipantLocal streamGroup:didSuspendStreams:]";
          v34 = 1024;
          v35 = 4138;
          v36 = 2112;
          v37 = a3;
          v38 = 1024;
          v39 = v4;
          v40 = 1024;
          v41 = v17;
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected number of mediaTypes for streamGroup=%@ didSuspendStreams=%d isMixingSystemAudio=%d", buf, 0x32u);
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v31 = v13;
      v32 = 2080;
      v33 = "-[VCSessionParticipantLocal streamGroup:didSuspendStreams:]";
      v34 = 1024;
      v35 = 4132;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Participant is not running, ignoring delegate callback.", buf, 0x1Cu);
    }
  }
}

uint64_t __59__VCSessionParticipantLocal_streamGroup_didSuspendStreams___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:mediaStateDidChange:forMediaType:didSucceed:error:", *(_QWORD *)(a1 + 32), 2, *(unsigned int *)(a1 + 40), 1, 0);
}

uint64_t __59__VCSessionParticipantLocal_streamGroup_didSuspendStreams___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:mediaStateDidChange:forMediaType:didSucceed:error:", *(_QWORD *)(a1 + 32), 1, *(unsigned int *)(a1 + 40), 1, 0);
}

- (void)streamGroup:(id)a3 didChangeState:(unsigned int)a4
{
  -[VCSessionUplinkBandwidthAllocator streamToken:enabled:](self->_uplinkBandwidthAllocator, "streamToken:enabled:", objc_msgSend(a3, "streamToken"), a4 == 1);
}

- (void)streamGroup:(id)a3 didRequestRedundancy:(BOOL)a4
{
  NSObject *participantQueue;
  _QWORD block[5];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__VCSessionParticipantLocal_streamGroup_didRequestRedundancy___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v6 = a4;
  dispatch_async(participantQueue, block);
}

_BYTE *__62__VCSessionParticipantLocal_streamGroup_didRequestRedundancy___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (result[408])
  {
    objc_msgSend(result, "enableRedundancy:", *(unsigned __int8 *)(a1 + 40));
    return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "dispatchedUpdateUplinkTargetBitrate:rateChangeCounter:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 568), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 572));
  }
  return result;
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

- (void)checkAndReportThermalIncreaseAudioOnly:(int)a3
{
  NSObject *participantQueue;
  _QWORD block[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  participantQueue = self->super._participantQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__VCSessionParticipantLocal_checkAndReportThermalIncreaseAudioOnly___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_async(participantQueue, block);
}

uint64_t __68__VCSessionParticipantLocal_checkAndReportThermalIncreaseAudioOnly___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
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
  result = objc_msgSend(*(id *)(a1 + 32), "dispatchedIsAnyCameraMediaTypeEnabled");
  if ((result & 1) == 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
    result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v11;
LABEL_5:
      v6 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        result = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "isAnyCameraMediaTypeEnabled");
        if ((result & 1) != 0)
          break;
        if (v4 == ++v6)
        {
          result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
          v4 = result;
          if (result)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      if (*(_DWORD *)(a1 + 40))
      {
        v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CFSTR("SymptomReporterOptionalKeyThermalPressureLevel"));
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
        objc_msgSend(*(id *)(a1 + 32), "reportingAgent");
        return reportingSymptom();
      }
    }
  }
  return result;
}

- (id)qualityTierTableForStreamToken:(int64_t)a3
{
  uint64_t v4;
  _BOOL8 isRemotePresentationLarge;

  v4 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._streamGroups, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "streamGroupID");
  if (self->_remotePresentationState)
    isRemotePresentationLarge = 0;
  else
    isRemotePresentationLarge = self->_isRemotePresentationLarge;
  return +[VCSessionMediaStreamPresenceConfigurationProvider oneToOneTierTableForStreamGroupID:splitType:redundancyEnabled:](VCSessionMediaStreamPresenceConfigurationProvider, "oneToOneTierTableForStreamGroupID:splitType:redundancyEnabled:", v4, isRemotePresentationLarge, self->_enableRedundancy);
}

- (BOOL)shouldCapStream:(int64_t)a3 cappedBitrate:(unsigned int *)a4
{
  int v6;
  BOOL v7;
  unsigned int v10;

  v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._streamGroups, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "streamGroupID");
  if (self->_remotePresentationState)
    v7 = v6 == 1667329381;
  else
    v7 = 0;
  if (v7)
  {
    if (a4)
    {
      v10 = 432400;
LABEL_14:
      *a4 = v10;
    }
  }
  else
  {
    if (!self->super._sharingEnabled || v6 != 1835623282)
      return 0;
    if (a4)
    {
      v10 = 130000;
      goto LABEL_14;
    }
  }
  return 1;
}

- (unsigned)remainderBitrateSplitForStreamToken:(int64_t)a3
{
  uint64_t v5;
  _BOOL8 isRemotePresentationLarge;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  v5 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._streamGroups, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3)), "streamGroupID");
  if (self->_remotePresentationState)
    isRemotePresentationLarge = 0;
  else
    isRemotePresentationLarge = self->_isRemotePresentationLarge;
  return +[VCSessionMediaStreamPresenceConfigurationProvider remainingBitrateSplitQualityIndexForStreamGroup:splitType:](VCSessionMediaStreamPresenceConfigurationProvider, "remainingBitrateSplitQualityIndexForStreamGroup:splitType:", v5, isRemotePresentationLarge);
}

- (id)microphoneOnlyBandwidthTable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  if (-[VCSessionParticipant supportsLowLatencyAudio](self, "supportsLowLatencyAudio"))
    return (id)VCSessionLowLatencyMicrophoneOnlyBandwidthTable();
  else
    return (id)VCSessionMicrophoneOnlyBandwidthTable();
}

- (id)videoCallMicrophoneBandwidthTable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._participantQueue);
  if (-[VCSessionParticipant supportsLowLatencyAudio](self, "supportsLowLatencyAudio"))
    return (id)VCSessionLowLatencyVideoCallMicrophoneBandwidthTable();
  else
    return (id)VCSessionVideoCallMicrophoneBandwidthTable();
}

- (BOOL)encryptionInfoReceived
{
  return self->_encryptionInfoReceived;
}

- (unsigned)connectionStatsStreamID
{
  return self->_connectionStatsStreamID;
}

- (unsigned)uplinkBitrateCapWifi
{
  return self->_uplinkBitrateCapWifi;
}

- (unsigned)uplinkBitrateCapCell
{
  return self->_uplinkBitrateCapCell;
}

- (BOOL)enableVADFiltering
{
  return self->_enableVADFiltering;
}

- (NSArray)peerSubscribedStreams
{
  return self->_peerSubscribedStreams;
}

- (NSSet)audioPayloadTypes
{
  return &self->_audioPayloadTypes->super;
}

- (NSSet)videoPayloadTypes
{
  return &self->_videoPayloadTypes->super;
}

- (_VCSessionParticipantLocalOneToOneSettings)oneToOneSettings
{
  __int128 v3;

  v3 = *(_OWORD *)&self[20].audioRedundancyController;
  *(_OWORD *)&retstr->audioRedundancyController = *(_OWORD *)&self[19].targetBitrate;
  *(_OWORD *)&retstr->streamInfo = v3;
  *(_OWORD *)&retstr->targetBitrate = *(_OWORD *)&self[20].streamInfo;
  return self;
}

- (BOOL)isRemoteOnPeace
{
  return self->_isRemoteOnPeace;
}

- (void)setIsRemoteOnPeace:(BOOL)a3
{
  self->_isRemoteOnPeace = a3;
}

- (BOOL)isRetransmissionEnabled
{
  return self->_isRetransmissionEnabled;
}

- (NSArray)remoteParticipants
{
  return self->_remoteParticipants;
}

uint64_t __VCSessionParticipantLocal_UpdateAudioPriorityWithSampleBuffer_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vcSessionParticipant:didChangeMediaPriority:description:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), CFSTR("MediaTypeAudio"));
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate generated stream ID set", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate generated SSRC set", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate power spectrum source", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate oneToOne streamInfo dictionary", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create uplinkBandwidthAllocators", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate config provider", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create participant info", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize media negotiator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.9()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the stream groups", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.10()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the stream inputs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.11()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate config provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.12()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the stream groups", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.13()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the stream inputs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.14()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate config provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.15()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup video stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:delegate:.cold.16()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup audio streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newUplinkBandwidthAllocators
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create VCSessionUplinkBandwidthAllocatorOneToOne", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processCachedParticipantData:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to unserialize the participant info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processCachedParticipantData:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Media blob not found in participant info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processCachedParticipantData:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the negotiation local configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processCachedParticipantData:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize the negotiation local configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup audio streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No video streams to set up", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupCameraStreamGroupWithStreamConfigs:negotiatorConfig:streamGroupConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup video stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)captureSourceIDFromStreamGroupConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream group ID missing in stream group config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)captureSourceIDFromStreamGroupConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream input ID missing in stream group config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)captureSourceIDFromStreamGroupConfig:(uint64_t)a1 .cold.3(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = 136315906;
  v3 = a1;
  OUTLINED_FUNCTION_7_1();
  v4 = "-[VCSessionParticipantLocal captureSourceIDFromStreamGroupConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d Unknown stream input ID=%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupWithStreamGroupConfig:negotiatorConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupWithStreamGroupConfig:(uint64_t)a1 negotiatorConfig:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)&v3[14] = "-[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Stream token already assigned for captureSourceID=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal setupStreamGroupWithStreamGroupConfig:negotiatorConfig:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupsWithConfig:negotiatorConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d setupStreamGroupMediaSync failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamGroupsWithConfig:(uint64_t)a1 negotiatorConfig:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)&v3[14] = "-[VCSessionParticipantLocal setupStreamGroupsWithConfig:negotiatorConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to register stream group for capture source ID=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal setupStreamGroupsWithConfig:negotiatorConfig:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamInputsWithConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate registered stream group configuration set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupStreamInputsWithConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate registered stream input set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)maxCaptureCameraFrameRate
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)&v3[14] = "-[VCSessionParticipantLocal maxCaptureCameraFrameRate]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v1, v2, " [%s] %s:%d maxFrameRate=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal maxCaptureCameraFrameRate]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)reconfigureOneToOneAudioStream:error:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d OneToOne Audio Stream was unable to be reconfigured", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)applyVideoEnabledSetting:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;
  int v4;
  int v5;

  v2 = 136315906;
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to update camera stream group with videoEnabled=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __63__VCSessionParticipantLocal_suspendStreamsOnOneToOneModeSwitch__block_invoke_cold_1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = 136315906;
  v3 = a1;
  OUTLINED_FUNCTION_7_1();
  v4 = "-[VCSessionParticipantLocal suspendStreamsOnOneToOneModeSwitch]_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d Failed to stop Multiway streams. error=%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

void __51__VCSessionParticipantLocal_setRemoteParticipants___block_invoke_cold_1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = 136315906;
  v3 = a1;
  OUTLINED_FUNCTION_7_1();
  v4 = "-[VCSessionParticipantLocal setRemoteParticipants:]_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d updateStreamGroups failed with error=%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

- (void)applyCachedMediaStreamsWithStreamConfigurations:mediaNegotiatorConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to apply the cached configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d streamConfigurations cannot be nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamsWithStreamConfigurations:mediaNegotiatorConfig:streamGroupConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to apply the cached configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoSendGroupConfigWithStreamGroupID:streamGroupConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newAudioSendGroupConfigWithStreamGroupID:streamGroupConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initalize video stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupCaptionsStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initalize video stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoMediaStreamsWithStreamGroupConfiguration:(uint64_t)a1 streamGroupConfig:streamGroupID:mediaType:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)&v3[14] = "-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:"
                       "streamGroupID:mediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to set up video stream %d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:.cold.2()
{
  NSObject *v0;
  id v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_14_2();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "idsStreamID");
  OUTLINED_FUNCTION_12_0();
  v4 = "-[VCSessionParticipantLocal setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v2, " [%s] %s:%d Base temporal layer hasn't been configured for streamID=%d", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupVideoMediaStreamsWithStreamGroupConfiguration:streamGroupConfig:streamGroupID:mediaType:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream setup failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate audio stream group config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamsWithStreamConfiguration:(uint64_t)a1 streamGroupConfiguration:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)&v3[14] = "-[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to set up audio stream %d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioStreamsWithStreamConfiguration:streamGroupConfiguration:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initalize audio stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:.cold.1()
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
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to setup video stream for streamGroupId=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:streamGroupID:rtpCipherSuite:.cold.2()
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
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Stream setup failed for streamGroupId=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup audio stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:streamToken:isMultiway:streamGroupID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Stream setup failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaNegotiatorAudioConfigurationForMediaType:.cold.1()
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
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Audio configuration for media negotiator not supported for mediaType=%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newMediaNegotiatorAudioConfigurationForMediaType:.cold.2()
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
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to create audio configuration for media negotiator for mediaType=%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)featureListStringsRequiredForMediaType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)&v3[14] = "-[VCSessionParticipantLocal featureListStringsRequiredForMediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Unexpected mediaType=%hhu", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal featureListStringsRequiredForMediaType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)v1FeatureListStringsSupportedForMediaType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)&v3[14] = "-[VCSessionParticipantLocal v1FeatureListStringsSupportedForMediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Unexpected mediaType=%hhu", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal v1FeatureListStringsSupportedForMediaType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)u1VideoRuleCollectionsForMediaType:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)&v3[14] = "-[VCSessionParticipantLocal u1VideoRuleCollectionsForMediaType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Unexpected mediaType=%hhu", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal u1VideoRuleCollectionsForMediaType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)addFeatureListStringsForVideoConfiguration:mediaType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the fixed position feature list strings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addFeatureListStringsForVideoConfiguration:mediaType:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the feature list strings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoConfigurationForMediaType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;
  int v4;
  int v5;

  v2 = 136315906;
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate videoConfiguration for mediaType=%hhu", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)newVideoConfigurationForMediaType:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;
  int v4;
  int v5;

  v2 = 136315906;
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add FLS settings for mediaType=%hhu", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

+ (void)negotiatorCipherSuite:fromMediaStreamConfig:.cold.1()
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
  objc_msgSend(v0, "SRTPCipherSuite");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to convert mediaStreamConfig cipherSuite(%ld) to negotiatorStreamGroupConfig cipherSuite", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group codec config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_25_1(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Invalid rtpPayload for video, rtpPayload size: %lu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_25_1(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_14_4();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Invalid payload for video, payload size: %lu", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media blob stream group codec config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupNegotiationConfigForStreamGroup:.cold.7()
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
  v1 = OUTLINED_FUNCTION_18_1(v0, *MEMORY[0x1E0C80C00]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Failed to retrieve the cipher suite for stream. streamGroupID=%s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)initializeStreamGroupsForLocalConfig:.cold.1()
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
  v1 = OUTLINED_FUNCTION_18_1(v0, *MEMORY[0x1E0C80C00]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Failed to create U1 stream group negotiation config for groupID=%s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)initializeOneToOneStreamGroup:forLocalConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create new stream group negotiation config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeOneToOneStreamGroup:forLocalConfig:.cold.2()
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
  FourccToCStr(objc_msgSend(v0, "groupID"));
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to create stream group U1 config for groupID=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)addVideoConfigurationsToLocalConfiguration:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[22];
  int v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  OUTLINED_FUNCTION_7_1();
  *(_QWORD *)&v3[14] = "-[VCSessionParticipantLocal addVideoConfigurationsToLocalConfiguration:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to create videoConfiguration for mediaType=%hhu", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSessionParticipantLocal addVideoConfigurationsToLocalConfiguration:]" >> 16, v4);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create microphoneConfiguration", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create systemAudioConfiguration", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add U+1 video configurations to local settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initializeMediaNegotiator
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize stream groups for local configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateOneToOne:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to copy the local configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateOneToOne:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to reinitialize the 1:1 media negotiator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateOneToOne:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to extract media blob from remote participant info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateOneToOne:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate with devices that does not support one to one", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateOneToOne:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate one to one settings with remote media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupOneToOneVideoStreamWithConfig:streamGroupID:.cold.1()
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
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Error setting up the config for one-to-one mode for streamGroupId=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupOneToOneVideoStreamWithConfig:streamGroupID:.cold.2()
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
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to set up video stream for streamGroupId=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupOneToOneVideoStreamWithConfig:streamGroupID:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate audio stream group config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupOneToOneAudioStreamWithConfig:streamGroupID:.cold.1()
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
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Error setting up the audio config for one-to-one mode for streamGroupId=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupOneToOneAudioStreamWithConfig:streamGroupID:.cold.2()
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
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Error setting up the audio stream for one-to-one mode for streamGroupId=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupOneToOneAudioStreamWithConfig:streamGroupID:.cold.3()
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
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to allocate audio stream group config for streamGroupId=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)configureMultiwayStreamGroups
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
  v1 = OUTLINED_FUNCTION_18_1(v0, *MEMORY[0x1E0C80C00]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Error configuring stream infos for streamGroupID=%s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

void __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Fail configure participant", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __94__VCSessionParticipantLocal_configureWithOneToOneParticipantConfig_shouldConfigureGFTStreams___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Fail configure participant", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureOneToOneVideoStreamsWithDeviceRole:.cold.1()
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
  v1 = OUTLINED_FUNCTION_18_1(v0, *MEMORY[0x1E0C80C00]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d U+1 config for StreamGroupID=%s not set", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)configureOneToOneVideoStreamsWithDeviceRole:.cold.2()
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
  v1 = OUTLINED_FUNCTION_18_1(v0, *MEMORY[0x1E0C80C00]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Failed to update config for StreamGroupID=%s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)configureOneToOneVideoStreamsWithDeviceRole:.cold.3()
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
  v1 = OUTLINED_FUNCTION_18_1(v0, *MEMORY[0x1E0C80C00]);
  FourccToCStr(v1);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Failed to configure one to one video streams StreamGroupID=%s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)configureOneToOneAudioStreamsWithDeviceRole:.cold.1()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_18_1(v1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v4 = "-[VCSessionParticipantLocal configureOneToOneAudioStreamsWithDeviceRole:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v2, " [%s] %s:%d Failed to update config for StreamGroupID=%u", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)configureOneToOneAudioStreamsWithDeviceRole:.cold.2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_18_1(v1, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  v4 = "-[VCSessionParticipantLocal configureOneToOneAudioStreamsWithDeviceRole:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v2, " [%s] %s:%d Failed to configure one to one audio streams StreamGroupID=%u", v3);
  OUTLINED_FUNCTION_3_0();
}

- (void)newAudioStreamOneToOneConfigurationWithStreamGroupId:.cold.1()
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
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to create one to one audio stream config for streamGroupId=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newVideoStreamOneToOneConfigurationWithStreamGroupId:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create one to one video stream config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createParticipantInfo
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create new invite blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:.cold.1()
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
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Video stream config is missing for streamGroupID=%s!", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate video stream!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:.cold.3()
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
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d invalid capabilies dictionary for streamGroupID=%s!", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newStreamInfoWithVideoStreamWithConfiguration:idsDestination:groupID:.cold.4()
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
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to allocate participant video stream info for streamGroupID=%s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Audio stream config is missing!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate audio stream!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d invalid capabilies dictionary!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate participant audio stream info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamInfoWithAudioStreamWithConfiguration:idsDestination:isMultiway:streamGroupID:streamToken:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize audio rule collection!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)checkSubscribedStreamsConsistency:(uint64_t)a1 .cold.1(uint64_t a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = 136315906;
  v3 = a1;
  OUTLINED_FUNCTION_7_1();
  v4 = "-[VCSessionParticipantLocal checkSubscribedStreamsConsistency:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d MEDIA FRACTURE SITUATION! peer asking for unknown stream:%@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedUpdateVCMediaQueueSize:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCMediaQueue size should only be updated when participant is running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)cameraAvailabilityDidChange:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;
  int v4;
  int v5;

  v2 = 136315906;
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d cameraAvailabilityDidChange=%d ignored", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)didReceiveReportPacket:arrivalNTPTime:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d This should no longer get called, VCSessionParticipantLocal is no longer managing U+1 streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didReceiveCustomReportPacket:arrivalNTPTime:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d This should no longer get called, VCSessionParticipantLocal is no longer managing U+1 streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
