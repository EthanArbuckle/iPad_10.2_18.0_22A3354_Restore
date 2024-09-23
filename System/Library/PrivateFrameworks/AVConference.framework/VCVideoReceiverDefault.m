@implementation VCVideoReceiverDefault

- (VCVideoReceiverDefault)initWithConfig:(tagVCVideoReceiverConfig *)a3 delegate:(id)a4 delegateFunctions:(const tagVCVideoReceiverDelegateRealtimeInstanceVTable *)a5 reportingAgent:(opaqueRTCReporting *)a6 statisticsCollector:(id)a7 transmitterHandle:(tagHANDLE *)a8
{
  VCVideoReceiverDefault *v12;
  VCVideoReceiverDefault *v13;
  tagVCVideoReceiverConfig *p_videoReceiverConfig;
  __CFString *participantId;
  __CFString *sessionId;
  void *mediaControlInfoGenerator;
  unint64_t v18;
  CFTypeRef *p_sframeCryptor;
  const void *v20;
  char v21;
  BOOL isLateFrameRecoveryEnabled;
  tagHANDLE **p_videoReceiverHandle;
  int Handle;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 notifyDelegateVideoAttributeChanges;
  int mode;
  tagHANDLE *v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  _BOOL4 v37;
  tagHANDLE *v38;
  int v39;
  tagHANDLE *rtpHandle;
  uint64_t v41;
  NSObject *v42;
  tagHANDLE *v43;
  VCVideoStreamRateAdaptationFeedbackOnly *rateAdaptation;
  uint64_t v45;
  NSObject *v46;
  objc_super v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  _BYTE v56[26];
  _BOOL4 v57;
  __int16 v58;
  int v59;
  __int16 v60;
  VCVideoReceiverDefault *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)VCVideoReceiverDefault;
  v12 = -[VCVideoReceiverBase initWithDelegate:delegateFunctions:](&v48, sel_initWithDelegate_delegateFunctions_, a4, a5);
  v13 = v12;
  if (!v12)
    return v13;
  p_videoReceiverConfig = &v12->_videoReceiverConfig;
  memcpy(&v12->_videoReceiverConfig, a3, sizeof(v12->_videoReceiverConfig));
  v13->super._vTable.setExternalOutputLatency = _VCVideoReceiverDefault_SetExternalOutputLatency;
  participantId = v13->_videoReceiverConfig.participantId;
  if (participantId)
    CFRetain(participantId);
  sessionId = v13->_videoReceiverConfig.sessionId;
  if (sessionId)
    CFRetain(sessionId);
  v13->_notifyDelegateVideoAttributeChanges = v13->_videoReceiverConfig.mode == 0;
  mediaControlInfoGenerator = a3->mediaControlInfoGenerator;
  if (mediaControlInfoGenerator)
    mediaControlInfoGenerator = (void *)CFRetain(mediaControlInfoGenerator);
  v13->_controlInfoGenerator = mediaControlInfoGenerator;
  if (p_videoReceiverConfig->streamCount)
  {
    v18 = 0;
    p_sframeCryptor = (CFTypeRef *)&v13->_videoReceiverConfig.streamConfigs[0].sframeCryptor;
    do
    {
      v20 = *(p_sframeCryptor - 2);
      if (v20)
        CFRetain(v20);
      if (*p_sframeCryptor)
        CFRetain(*p_sframeCryptor);
      ++v18;
      p_sframeCryptor += 14;
    }
    while (v18 < p_videoReceiverConfig->streamCount);
  }
  -[VCVideoReceiverDefault setUpRemoteAspectRatios](v13, "setUpRemoteAspectRatios");
  -[VCVideoReceiverDefault setUpCannedInjector:](v13, "setUpCannedInjector:", a3);
  a3->callbackContext = v13;
  a3->remoteFrameCallback = _VCVideoReceiverDefault_RemoteFrameCallback;
  a3->sampleBufferCallback = _VCVideoReceiverDefault_SampleBufferCallback;
  a3->streamSwitchCallback = streamSwitchCallback;
  a3->keyFrameGenerationCallback = keyFrameGenerationCallback;
  a3->ackLTRFrameCallback = _VCVideoReceiverDefault_ackLTRWithTS;
  a3->sendLTRAckCallback = _VCVideoReceiverDefault_sendLTRAckWithTS;
  a3->modeSwitchCallback = _VCVideoReceiverDefault_ModeSwitchCallback;
  a3->videoStallPercentageThreshold = objc_msgSend(+[GKSConnectivitySettings readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-reporting-video-stall-percentage-symptom-threshold"), 0, &unk_1E9EF5018, 0), "intValue");
  v21 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-video-enable-late-frame-recovery"), CFSTR("enableLateVideoFrameRecovery"), MEMORY[0x1E0C9AAB0], 0), "BOOLValue");
  isLateFrameRecoveryEnabled = 0;
  if ((v21 & 1) != 0)
    isLateFrameRecoveryEnabled = a3->isLateFrameRecoveryEnabled;
  a3->isLateFrameRecoveryEnabled = isLateFrameRecoveryEnabled;
  if (-[VCDefaults isReceiverTestVerificationEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "isReceiverTestVerificationEnabled"))
  {
    v13->_validationContext = objc_alloc_init(VCVideoHardwareDumpCollector);
  }
  p_videoReceiverHandle = &v13->_videoReceiverHandle;
  Handle = VideoReceiver_CreateHandle((uint64_t *)&v13->_videoReceiverHandle, (uint64_t)a3, a6, 0, a7);
  if ((VCVideoReceiverDefault *)objc_opt_class() == v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        notifyDelegateVideoAttributeChanges = v13->_notifyDelegateVideoAttributeChanges;
        mode = v13->_videoReceiverConfig.mode;
        v30 = *p_videoReceiverHandle;
        *(_DWORD *)buf = 136316674;
        v50 = v26;
        v51 = 2080;
        v52 = "-[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:]";
        v53 = 1024;
        v54 = 179;
        v55 = 1024;
        *(_DWORD *)v56 = mode;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)&v56[6] = notifyDelegateVideoAttributeChanges;
        *(_WORD *)&v56[10] = 1024;
        *(_DWORD *)&v56[12] = (_DWORD)v30;
        *(_WORD *)&v56[16] = 2048;
        *(_QWORD *)&v56[18] = v13;
        v31 = " [%s] %s:%d mode=%d, _notifyDelegateVideoAttributeChanges=%d _videoReceiverHandle=0x%x videoReceiver=%p";
        v32 = v27;
        v33 = 56;
LABEL_29:
        _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[VCVideoReceiverDefault performSelector:](v13, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v34 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v36 = v13->_videoReceiverConfig.mode;
        v37 = v13->_notifyDelegateVideoAttributeChanges;
        v38 = *p_videoReceiverHandle;
        *(_DWORD *)buf = 136317186;
        v50 = v34;
        v51 = 2080;
        v52 = "-[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:]";
        v53 = 1024;
        v54 = 179;
        v55 = 2112;
        *(_QWORD *)v56 = v25;
        *(_WORD *)&v56[8] = 2048;
        *(_QWORD *)&v56[10] = v13;
        *(_WORD *)&v56[18] = 1024;
        *(_DWORD *)&v56[20] = v36;
        *(_WORD *)&v56[24] = 1024;
        v57 = v37;
        v58 = 1024;
        v59 = (int)v38;
        v60 = 2048;
        v61 = v13;
        v31 = " [%s] %s:%d %@(%p) mode=%d, _notifyDelegateVideoAttributeChanges=%d _videoReceiverHandle=0x%x videoReceiver=%p";
        v32 = v35;
        v33 = 76;
        goto LABEL_29;
      }
    }
  }
  if ((Handle & 0x80000000) == 0)
  {
    v13->super._rtpTimestampRate = a3->videoTSRate;
    v13->_videoTransmitterHandle = a8;
    v13->_forceZeroRegionOfInterestOrigin = a3->forceZeroRegionOfInterestOrigin;
    v39 = -[VCVideoReceiverDefault oneToOneStreamIndex](v13, "oneToOneStreamIndex");
    if (a3->isReceiverSideVCRCFeedbackEnabled)
    {
      rtpHandle = a3->streamConfigs[v39].rtpHandle;
      if (rtpHandle == (tagHANDLE *)0xFFFFFFFFLL)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v45 = VRTraceErrorLogLevelToCSTR();
          v46 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:].cold.1(v45, (uint64_t *)&v13->_videoReceiverHandle, v46);
        }
      }
      else
      {
        v13->_rateAdaptation = (VCVideoStreamRateAdaptationFeedbackOnly *)a3->rateAdaptation;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v41 = VRTraceErrorLogLevelToCSTR();
          v42 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v43 = *p_videoReceiverHandle;
            rateAdaptation = v13->_rateAdaptation;
            *(_DWORD *)buf = 136316418;
            v50 = v41;
            v51 = 2080;
            v52 = "-[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:"
                  "transmitterHandle:]";
            v53 = 1024;
            v54 = 195;
            v55 = 1024;
            *(_DWORD *)v56 = (_DWORD)v43;
            *(_WORD *)&v56[4] = 2048;
            *(_QWORD *)&v56[6] = rateAdaptation;
            *(_WORD *)&v56[14] = 1024;
            *(_DWORD *)&v56[16] = (_DWORD)rtpHandle;
            _os_log_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d init video receiver 0x%x and rateAdaptation %p with rtp handle 0x%x", buf, 0x32u);
          }
        }
      }
    }
  }
  return v13;
}

- (void)setUpCannedInjector:(tagVCVideoReceiverConfig *)a3
{
  VCCannedVideoPacketSource *v5;
  id v6;

  if (-[VCDefaults useCannedVideoPackets](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "useCannedVideoPackets"))
  {
    v6 = (id)VCDefaults_CopyStringValueForKey(CFSTR("cannedVideoPacketFile"));
    v5 = -[VCCannedVideoPacketSource initWithMode:filePath:]([VCCannedVideoPacketSource alloc], "initWithMode:filePath:", -[VCDefaults cannedVideoPacketMode](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "cannedVideoPacketMode"), v6);
    self->_cannedPacketSource = v5;
    a3->cannedReplayContext = v5;

  }
}

- (void)setMode:(int)a3
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
  VCVideoReceiverDefault *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  self->_videoReceiverConfig.mode = a3;
  self->_notifyDelegateVideoAttributeChanges = a3 == 0;
  self->_pendingVideoAttributesUpdateOnModeChange = 1;
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
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
        v16 = "-[VCVideoReceiverDefault setMode:]";
        v17 = 1024;
        v18 = 220;
        v19 = 1024;
        LODWORD(v20) = a3;
        v8 = " [%s] %s:%d New mode=%d";
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
      v5 = (const __CFString *)-[VCVideoReceiverDefault performSelector:](self, "performSelector:", sel_logPrefix);
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
        v16 = "-[VCVideoReceiverDefault setMode:]";
        v17 = 1024;
        v18 = 220;
        v19 = 2112;
        v20 = v5;
        v21 = 2048;
        v22 = self;
        v23 = 1024;
        v24 = a3;
        v8 = " [%s] %s:%d %@(%p) New mode=%d";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
}

- (int)mode
{
  return self->_videoReceiverConfig.mode;
}

- (void)setFeedbackDelegate:(id)a3
{
  VideoReceiver_SetFeedbackDelegate();
}

- (int)oneToOneStreamIndex
{
  tagVCVideoReceiverConfig *p_videoReceiverConfig;
  uint64_t v4;
  const __CFString *v5;
  uint64_t streamCount;
  BOOL *p_isOneToOne;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  int mode;
  unsigned int v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  unsigned int v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BYTE v28[10];
  VCVideoReceiverDefault *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  p_videoReceiverConfig = &self->_videoReceiverConfig;
  if (self->_videoReceiverConfig.mode || (streamCount = p_videoReceiverConfig->streamCount, (int)streamCount < 1))
  {
LABEL_2:
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = 0;
    p_isOneToOne = &self->_videoReceiverConfig.streamConfigs[0].isOneToOne;
    while (1)
    {
      v8 = *p_isOneToOne;
      p_isOneToOne += 112;
      if (v8)
        break;
      if (streamCount == ++v4)
        goto LABEL_2;
    }
  }
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        mode = p_videoReceiverConfig->mode;
        v12 = p_videoReceiverConfig->streamCount;
        v21 = 136316418;
        v22 = v9;
        v23 = 2080;
        v24 = "-[VCVideoReceiverDefault oneToOneStreamIndex]";
        v25 = 1024;
        v26 = 243;
        v27 = 1024;
        *(_DWORD *)v28 = mode;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&v28[6] = v12;
        LOWORD(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 2) = v4;
        v13 = " [%s] %s:%d mode=%d, streamCount=%d, streamIndex=%d";
        v14 = v10;
        v15 = 46;
LABEL_18:
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, v15);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoReceiverDefault performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = p_videoReceiverConfig->mode;
        v19 = p_videoReceiverConfig->streamCount;
        v21 = 136316930;
        v22 = v16;
        v23 = 2080;
        v24 = "-[VCVideoReceiverDefault oneToOneStreamIndex]";
        v25 = 1024;
        v26 = 243;
        v27 = 2112;
        *(_QWORD *)v28 = v5;
        *(_WORD *)&v28[8] = 2048;
        v29 = self;
        v30 = 1024;
        v31 = v18;
        v32 = 1024;
        v33 = v19;
        v34 = 1024;
        v35 = v4;
        v13 = " [%s] %s:%d %@(%p) mode=%d, streamCount=%d, streamIndex=%d";
        v14 = v17;
        v15 = 66;
        goto LABEL_18;
      }
    }
  }
  return v4;
}

- (void)setUpRemoteAspectRatios
{
  -[VCVideoReceiverDefault setUpRemoteAspectRatiosForPayload:](self, "setUpRemoteAspectRatiosForPayload:", +[VCVideoFeatureListStringHelper defaultPayload:](VCVideoFeatureListStringHelper, "defaultPayload:", self->_videoReceiverConfig.streamConfigs[-[VCVideoReceiverDefault oneToOneStreamIndex](self, "oneToOneStreamIndex")].featureListStrings));
}

- (void)setUpRemoteAspectRatiosForPayload:(int)a3
{
  uint64_t v3;
  int v5;
  __int128 v6;
  _OWORD v7[8];
  _BYTE v8[22];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 != 128)
  {
    v3 = *(_QWORD *)&a3;
    v5 = -[VCVideoReceiverDefault oneToOneStreamIndex](self, "oneToOneStreamIndex");
    *(_QWORD *)&v8[14] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v7[7] = v6;
    *(_OWORD *)v8 = v6;
    v7[5] = v6;
    v7[6] = v6;
    v7[3] = v6;
    v7[4] = v6;
    v7[1] = v6;
    v7[2] = v6;
    v7[0] = v6;
    if (+[VCVideoFeatureListStringHelper featureListString:maxSize:payload:featureListStrings:](VCVideoFeatureListStringHelper, "featureListString:maxSize:payload:featureListStrings:", v7, 150, v3, self->_videoReceiverConfig.streamConfigs[v5].featureListStrings))
    {
      -[VCVideoReceiverDefault setUpRemoteAspectRatiosFromFreatureListString:](self, "setUpRemoteAspectRatiosFromFreatureListString:", v7);
    }
  }
}

- (void)setUpRemoteAspectRatiosFromFreatureListString:(const char *)a3
{
  _BOOL4 v5;
  BOOL v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 remoteSupportsExpectedAspectRatio;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  int v29;
  unint64_t v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  _BYTE v42[10];
  _BYTE v43[10];
  _BYTE v44[14];
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v34 = 3;
  v32 = 3;
  v33 = 0x200000002;
  v5 = +[VCVideoFeatureListStringHelper extractAspectRatios:landscapeX:landscapeY:portraitX:portraitY:](VCVideoFeatureListStringHelper, "extractAspectRatios:landscapeX:landscapeY:portraitX:portraitY:", a3, &v34, (char *)&v33 + 4, &v33, &v32);
  self->_canRemoteResizePIP = +[VCVideoFeatureListStringHelper isResizePIPSupportedInFeatureListString:](VCVideoFeatureListStringHelper, "isResizePIPSupportedInFeatureListString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3));
  v31 = -1431655766;
  v29 = -1431655766;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v6 = +[VCVideoFeatureListStringHelper extractExpectedAspectRatios:expectedLandscapeX:expectedLandscapeY:expectedPortraitX:expectedPortraitY:](VCVideoFeatureListStringHelper, "extractExpectedAspectRatios:expectedLandscapeX:expectedLandscapeY:expectedPortraitX:expectedPortraitY:", a3, &v31, (char *)&v30 + 4, &v30, &v29);
  self->_remoteSupportsExpectedAspectRatio = v6;
  if (!v6)
  {
    v31 = v34;
    v29 = v32;
    v30 = v33;
  }
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        remoteSupportsExpectedAspectRatio = self->_remoteSupportsExpectedAspectRatio;
        *(_DWORD *)buf = 136316162;
        v36 = v8;
        v37 = 2080;
        v38 = "-[VCVideoReceiverDefault setUpRemoteAspectRatiosFromFreatureListString:]";
        v39 = 1024;
        v40 = 295;
        v41 = 1024;
        *(_DWORD *)v42 = v5;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = remoteSupportsExpectedAspectRatio;
        v11 = " [%s] %s:%d containsAspectRatios=%d, _remoteSupportsExpectedAspectRatio=%d";
        v12 = v9;
        v13 = 40;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCVideoReceiverDefault performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_remoteSupportsExpectedAspectRatio;
        *(_DWORD *)buf = 136316674;
        v36 = v14;
        v37 = 2080;
        v38 = "-[VCVideoReceiverDefault setUpRemoteAspectRatiosFromFreatureListString:]";
        v39 = 1024;
        v40 = 295;
        v41 = 2112;
        *(_QWORD *)v42 = v7;
        *(_WORD *)&v42[8] = 2048;
        *(_QWORD *)v43 = self;
        *(_WORD *)&v43[8] = 1024;
        *(_DWORD *)v44 = v5;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v16;
        v11 = " [%s] %s:%d %@(%p) containsAspectRatios=%d, _remoteSupportsExpectedAspectRatio=%d";
        v12 = v15;
        v13 = 60;
        goto LABEL_13;
      }
    }
  }
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316930;
        v36 = v18;
        v37 = 2080;
        v38 = "-[VCVideoReceiverDefault setUpRemoteAspectRatiosFromFreatureListString:]";
        v39 = 1024;
        v40 = 296;
        v41 = 2080;
        *(_QWORD *)v42 = a3;
        *(_WORD *)&v42[8] = 1024;
        *(_DWORD *)v43 = v34;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = HIDWORD(v33);
        *(_WORD *)v44 = 1024;
        *(_DWORD *)&v44[2] = v30;
        *(_WORD *)&v44[6] = 1024;
        *(_DWORD *)&v44[8] = v29;
        v20 = " [%s] %s:%d featureListString=%s, AR=%d/%d, XR=%d/%d";
        v21 = v19;
        v22 = 62;
LABEL_24:
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCVideoReceiverDefault performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317442;
        v36 = v23;
        v37 = 2080;
        v38 = "-[VCVideoReceiverDefault setUpRemoteAspectRatiosFromFreatureListString:]";
        v39 = 1024;
        v40 = 296;
        v41 = 2112;
        *(_QWORD *)v42 = v17;
        *(_WORD *)&v42[8] = 2048;
        *(_QWORD *)v43 = self;
        *(_WORD *)&v43[8] = 2080;
        *(_QWORD *)v44 = a3;
        *(_WORD *)&v44[8] = 1024;
        *(_DWORD *)&v44[10] = v34;
        v45 = 1024;
        v46 = HIDWORD(v33);
        v47 = 1024;
        v48 = v30;
        v49 = 1024;
        v50 = v29;
        v20 = " [%s] %s:%d %@(%p) featureListString=%s, AR=%d/%d, XR=%d/%d";
        v21 = v24;
        v22 = 82;
        goto LABEL_24;
      }
    }
  }
  v25 = (double)v32;
  self->_remoteScreenPortraitAspectRatio.width = (double)(int)v33;
  self->_remoteScreenPortraitAspectRatio.height = v25;
  v26 = (double)SHIDWORD(v33);
  self->_remoteScreenLandscapeAspectRatio.width = (double)v34;
  self->_remoteScreenLandscapeAspectRatio.height = v26;
  v27 = (double)v29;
  self->_remoteExpectedPortraitAspectRatio.width = (double)(int)v30;
  self->_remoteExpectedPortraitAspectRatio.height = v27;
  v28 = (double)SHIDWORD(v30);
  self->_remoteExpectedLandscapeAspectRatio.width = (double)v31;
  self->_remoteExpectedLandscapeAspectRatio.height = v28;
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
  tagVCVideoReceiverConfig *p_videoReceiverConfig;
  __CFString *participantId;
  __CFString *sessionId;
  void *controlInfoGenerator;
  unint64_t v15;
  tagVCCryptor **p_sframeCryptor;
  const void *v17;
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
  VCVideoReceiverDefault *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v20 = v4;
        v21 = 2080;
        v22 = "-[VCVideoReceiverDefault dealloc]";
        v23 = 1024;
        v24 = 304;
        v6 = " [%s] %s:%d dealloc called";
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
      v3 = (const __CFString *)-[VCVideoReceiverDefault performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v20 = v9;
        v21 = 2080;
        v22 = "-[VCVideoReceiverDefault dealloc]";
        v23 = 1024;
        v24 = 304;
        v25 = 2112;
        v26 = v3;
        v27 = 2048;
        v28 = self;
        v6 = " [%s] %s:%d %@(%p) dealloc called";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }
  -[VCVideoReceiverDefault cleanUpDisplayLink](self, "cleanUpDisplayLink");
  if (self->_videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL)
  {
    VideoReceiver_CloseHandle();
    self->_videoReceiverHandle = (tagHANDLE *)0xFFFFFFFFLL;
  }

  p_videoReceiverConfig = &self->_videoReceiverConfig;
  participantId = self->_videoReceiverConfig.participantId;
  if (participantId)
  {
    CFRelease(participantId);
    self->_videoReceiverConfig.participantId = 0;
  }
  sessionId = self->_videoReceiverConfig.sessionId;
  if (sessionId)
  {
    CFRelease(sessionId);
    self->_videoReceiverConfig.sessionId = 0;
  }
  controlInfoGenerator = self->_controlInfoGenerator;
  if (controlInfoGenerator)
    CFRelease(controlInfoGenerator);
  if (p_videoReceiverConfig->streamCount)
  {
    v15 = 0;
    p_sframeCryptor = &self->_videoReceiverConfig.streamConfigs[0].sframeCryptor;
    do
    {
      v17 = *(p_sframeCryptor - 2);
      if (v17)
        CFRelease(v17);
      if (*p_sframeCryptor)
        CFRelease(*p_sframeCryptor);
      ++v15;
      p_sframeCryptor += 14;
    }
    while (v15 < p_videoReceiverConfig->streamCount);
  }

  -[VCVideoHardwareDumpCollector invalidate](self->_validationContext, "invalidate");
  v18.receiver = self;
  v18.super_class = (Class)VCVideoReceiverDefault;
  -[VCVideoReceiverBase dealloc](&v18, sel_dealloc);
}

- (void)setVideoExpected:(BOOL)a3
{
  VideoReceiver_UpdateVideoExpected((uint64_t)self->_videoReceiverHandle, a3);
}

- (BOOL)initializeDisplayLink
{
  uint64_t v3;
  uint64_t v4;
  VCDisplayLink *v5;
  double v6;
  VCDisplayLink *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, double *);
  void *v12;
  VCVideoReceiverDefault *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_videoReceiverConfig.enableQueueAlarmForDisplay)
    v3 = 3;
  else
    v3 = 0;
  if (self->_videoReceiverConfig.enableQueueAlarmForDisplay)
    v4 = 2;
  else
    v4 = 39;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __47__VCVideoReceiverDefault_initializeDisplayLink__block_invoke;
  v12 = &unk_1E9E555A8;
  v13 = self;
  v5 = [VCDisplayLink alloc];
  LODWORD(v6) = 0;
  v7 = -[VCDisplayLink initWithHandler:threadPriority:threadOptions:threadIdentifier:preferredFrameRate:](v5, "initWithHandler:threadPriority:threadOptions:threadIdentifier:preferredFrameRate:", &v9, v4, v3, CFSTR("com.apple.VCVideoReceiverDefault.VCDisplayLink"), v6);
  self->_displayLink = v7;
  if (v7)
  {
    if (-[VCDisplayLink activate](v7, "activate", v9, v10, v11, v12, v13, v14))
      return 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoReceiverDefault initializeDisplayLink].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoReceiverDefault initializeDisplayLink].cold.1();
  }
  -[VCVideoReceiverDefault cleanUpDisplayLink](self, "cleanUpDisplayLink", v9, v10, v11, v12, v13);
  return 0;
}

uint64_t __47__VCVideoReceiverDefault_initializeDisplayLink__block_invoke(uint64_t a1, double *a2)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1496);
  if (result != 0xFFFFFFFFLL)
    return VideoReceiver_DisplayLinkTick(a2[1], *a2, a2[2]);
  return result;
}

- (void)cleanUpDisplayLink
{
  -[VCDisplayLink deactivate](self->_displayLink, "deactivate");

  self->_displayLink = 0;
}

- (void)startVideo
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  tagHANDLE *videoReceiverHandle;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  tagHANDLE *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_videoReceiverConfig.useDisplayLink)
    -[VCVideoReceiverDefault initializeDisplayLink](self, "initializeDisplayLink");
  v3 = VideoReceiver_SetVTHandleAndStart((uint64_t)self->_videoReceiverHandle, (uint64_t)self->_videoTransmitterHandle);
  -[VCCannedVideoPacketSource startCannedInjection](self->_cannedPacketSource, "startCannedInjection");
  if (v3 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      videoReceiverHandle = self->_videoReceiverHandle;
      v7 = 136316418;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCVideoReceiverDefault startVideo]";
      v11 = 1024;
      v12 = 388;
      v13 = 1024;
      v14 = 388;
      v15 = 2048;
      v16 = videoReceiverHandle;
      v17 = 1024;
      v18 = v3;
      _os_log_error_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCVideoReceiverDefault.m:%d: VideoReceiver[%p] startVideo failed (%d)", (uint8_t *)&v7, 0x32u);
    }
  }
}

- (void)stopVideo
{
  -[VCVideoReceiverDefault cleanUpDisplayLink](self, "cleanUpDisplayLink");
  -[VCVideoStreamRateAdaptationFeedbackOnly setEnableRateAdaptation:maxBitrate:minBitrate:adaptationInterval:](self->_rateAdaptation, "setEnableRateAdaptation:maxBitrate:minBitrate:adaptationInterval:", 0, 0, 0, 0.0);
  -[VCCannedVideoPacketSource stopCannedInjection](self->_cannedPacketSource, "stopCannedInjection");
  if (self->_videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL)
  {
    VideoReceiver_CloseHandle();
    self->_videoReceiverHandle = (tagHANDLE *)0xFFFFFFFFLL;
  }
}

- (double)lastReceivedVideoRTPPacketTime
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x7FF8000000000000;
  VideoReceiver_GetLastReceivedVideoRTPPacketTime((uint64_t)self->_videoReceiverHandle, v3);
  return *(double *)v3;
}

- (double)lastReceivedVideoRTCPPacketTime
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0x7FF8000000000000;
  VideoReceiver_GetLastReceivedVideoRTCPPacketTime((uint64_t)self->_videoReceiverHandle, v3);
  return *(double *)v3;
}

- (float)lastLastVideoStallDuration
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = NAN;
  VideoReceiver_GetLastVideoStallDuration((uint64_t)self->_videoReceiverHandle, &v3);
  return v3;
}

- (void)setTargetStreamID:(unsigned __int16)a3
{
  tagHANDLE *videoReceiverHandle;

  videoReceiverHandle = self->_videoReceiverHandle;
  if (videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL)
    VideoReceiver_SetTargetStreamID((uint64_t)videoReceiverHandle, a3);
}

- (unsigned)lastDisplayedFrameRTPTimestamp
{
  if (self->_videoReceiverHandle == (tagHANDLE *)0xFFFFFFFFLL)
    return 0;
  else
    return VideoReceiver_GetShowFrameRTPTimestamp();
}

- (double)roundTripTime
{
  return self->super._roundTripTime;
}

- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6
{
  -[VCVideoStreamRateAdaptationFeedbackOnly setEnableRateAdaptation:maxBitrate:minBitrate:adaptationInterval:](self->_rateAdaptation, "setEnableRateAdaptation:maxBitrate:minBitrate:adaptationInterval:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

- (void)handleRequestingKeyFrameGenerationWithStreamID:(unsigned __int16)a3 firType:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  double v7;
  double lastKeyFrameRequestTime;
  BOOL v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
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
  _BYTE v34[10];
  VCVideoReceiverDefault *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  v7 = micro();
  if (!self->_videoReceiverConfig.mode
    || self->_lastKeyFrameRequestStreamID != (_DWORD)v5
    || ((lastKeyFrameRequestTime = self->_lastKeyFrameRequestTime, lastKeyFrameRequestTime != 0.0)
      ? (v9 = v7 - lastKeyFrameRequestTime < 0.5)
      : (v9 = 0),
        !v9))
  {
    if ((VCVideoReceiverDefault *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_18;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v27 = 136316162;
      v28 = v11;
      v29 = 2080;
      v30 = "-[VCVideoReceiverDefault handleRequestingKeyFrameGenerationWithStreamID:firType:]";
      v31 = 1024;
      v32 = 603;
      v33 = 1024;
      *(_DWORD *)v34 = v5;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = v4;
      v13 = " [%s] %s:%d Requesting Key Frame with streamID:%d FIRType:%d";
      v14 = v12;
      v15 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCVideoReceiverDefault performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_18;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v27 = 136316674;
      v28 = v16;
      v29 = 2080;
      v30 = "-[VCVideoReceiverDefault handleRequestingKeyFrameGenerationWithStreamID:firType:]";
      v31 = 1024;
      v32 = 603;
      v33 = 2112;
      *(_QWORD *)v34 = v10;
      *(_WORD *)&v34[8] = 2048;
      v35 = self;
      v36 = 1024;
      v37 = v5;
      v38 = 1024;
      v39 = v4;
      v13 = " [%s] %s:%d %@(%p) Requesting Key Frame with streamID:%d FIRType:%d";
      v14 = v17;
      v15 = 60;
    }
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v27, v15);
LABEL_18:
    self->_lastKeyFrameRequestTime = v7;
    self->_lastKeyFrameRequestStreamID = v5;
    v18 = (void *)MEMORY[0x1DF086F1C](&self->super._delegate);
    objc_msgSend(v18, "vcVideoReceiver:requestKeyFrameGenerationWithStreamID:firType:", self, v5, v4);
    CFRelease(v18);
    VideoReceiver_IncrementFIRCount((uint64_t)self->_videoReceiverHandle, v4);
    return;
  }
  if ((VCVideoReceiverDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v27 = 136315906;
        v28 = v20;
        v29 = 2080;
        v30 = "-[VCVideoReceiverDefault handleRequestingKeyFrameGenerationWithStreamID:firType:]";
        v31 = 1024;
        v32 = 599;
        v33 = 1024;
        *(_DWORD *)v34 = v5;
        v22 = " [%s] %s:%d Ignoring key frame request key frame too soon for the same streamID:%d";
        v23 = v21;
        v24 = 34;
LABEL_30:
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v27, v24);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCVideoReceiverDefault performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v27 = 136316418;
        v28 = v25;
        v29 = 2080;
        v30 = "-[VCVideoReceiverDefault handleRequestingKeyFrameGenerationWithStreamID:firType:]";
        v31 = 1024;
        v32 = 599;
        v33 = 2112;
        *(_QWORD *)v34 = v19;
        *(_WORD *)&v34[8] = 2048;
        v35 = self;
        v36 = 1024;
        v37 = v5;
        v22 = " [%s] %s:%d %@(%p) Ignoring key frame request key frame too soon for the same streamID:%d";
        v23 = v26;
        v24 = 54;
        goto LABEL_30;
      }
    }
  }
}

- (void)handleKeyFrameRequestWithSizeAndFistMBs:(unsigned __int16 *)a3 count:(int)a4 didReceiveRTCPFB:(BOOL)a5 didReceiveFIR:(BOOL)a6
{
  void *v7;

  v7 = (void *)MEMORY[0x1DF086F1C](&self->super._delegate, a2, a3, *(_QWORD *)&a4, a5, a6);
  objc_msgSend(v7, "vcVideoReceiverRequestKeyFrame:rtcpPSFBType:", self, 4);
  CFRelease(v7);
}

- (void)didSwitchFromStreamID:(unsigned __int16)a3 toStreamID:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;

  v4 = a4;
  v5 = a3;
  v7 = (void *)MEMORY[0x1DF086F1C](&self->super._delegate, a2);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "vcVideoReceiver:didSwitchFromStreamID:toStreamID:", self, v5, v4);
  CFRelease(v7);
}

- (void)collectChannelMetrics:(id *)a3 interval:(float)a4
{
  a3->var0 = 0;
  a3->var2 = 0;
  a3->var4.width = 0.0;
  a3->var4.height = 0.0;
  a3->var3 = 0.0;
  VideoReceiver_GetMediaChannelMetrics(a4, (uint64_t)self->_videoReceiverHandle, (uint64_t)a3);
}

- (void)setSynchronizer:(id)a3
{
  VideoReceiver_SetSynchronizer((uint64_t)self->_videoReceiverHandle, (uint64_t)a3);
}

- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3
{
  tagHANDLE *videoReceiverHandle;

  videoReceiverHandle = self->_videoReceiverHandle;
  if (videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL)
    VideoReceiver_UpdateSourcePlayoutTime((uint64_t)videoReceiverHandle, a3);
}

- (void)handleActiveConnectionChange:(id)a3
{
  VideoReceiver_CellTechChanged();
}

- (void)setShouldEnableFaceZoom:(BOOL)a3
{
  tagHANDLE *videoReceiverHandle;

  self->_shouldEnableFaceZoom = a3;
  videoReceiverHandle = self->_videoReceiverHandle;
  if (videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL)
    VideoReceiver_SetShouldEnableFaceZoom((uint64_t)videoReceiverHandle, a3);
}

- (void)setShouldEnableMLEnhance:(BOOL)a3 streamID:(unsigned __int16)a4
{
  tagHANDLE *videoReceiverHandle;

  videoReceiverHandle = self->_videoReceiverHandle;
  if (videoReceiverHandle != (tagHANDLE *)0xFFFFFFFFLL)
    VideoReceiver_SetShouldEnableMLEnhance((uint64_t)videoReceiverHandle, a4, a3);
}

- (double)videoReceiverRxFrameRate
{
  double *p_videoReceiverRxFrameRate;
  tagHANDLE *videoReceiverHandle;

  p_videoReceiverRxFrameRate = &self->_videoReceiverRxFrameRate;
  self->_videoReceiverRxFrameRate = 0.0;
  videoReceiverHandle = self->_videoReceiverHandle;
  if (videoReceiverHandle == (tagHANDLE *)0xFFFFFFFFLL)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoReceiverDefault videoReceiverRxFrameRate].cold.1();
    }
  }
  else
  {
    VideoReceiver_GetFramerate(5.0, (uint64_t)videoReceiverHandle, p_videoReceiverRxFrameRate);
  }
  return *p_videoReceiverRxFrameRate;
}

- (void)setJitterBufferMode:(int)a3
{
  VideoReceiver_SetJitterBufferMode((uint64_t)self->_videoReceiverHandle, a3);
}

- (void)setDeferredAssemblyEnabled:(BOOL)a3
{
  VideoReceiver_SetDeferredAssemblyEnabled((uint64_t)self->_videoReceiverHandle, a3);
}

- (void)setLooseAVSyncEnabled:(BOOL)a3
{
  VideoReceiver_SetLooseAVSyncEnabled((uint64_t)self->_videoReceiverHandle, a3);
}

- (VideoAttributes)remoteVideoAttributes
{
  return (VideoAttributes *)objc_getProperty(self, a2, 1528, 1);
}

- (void)setRemoteVideoAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1528);
}

- (BOOL)shouldEnableFaceZoom
{
  return self->_shouldEnableFaceZoom;
}

- (BOOL)shouldUpdateRemoteScreenAttributes
{
  return self->_shouldUpdateRemoteScreenAttributes;
}

- (void)setShouldUpdateRemoteScreenAttributes:(BOOL)a3
{
  self->_shouldUpdateRemoteScreenAttributes = a3;
}

- (tagVCVideoReceiverConfig)videoReceiverConfig
{
  tagVCVideoReceiverConfig *result;

  objc_copyStruct(retstr, &self->_videoReceiverConfig, 1384, 1, 0);
  return result;
}

- (void)setVideoReceiverConfig:(tagVCVideoReceiverConfig *)a3
{
  objc_copyStruct(&self->_videoReceiverConfig, a3, 1384, 1, 0);
}

- (BOOL)receivedFirstRemoteFrame
{
  return self->_receivedFirstRemoteFrame;
}

- (void)setReceivedFirstRemoteFrame:(BOOL)a3
{
  self->_receivedFirstRemoteFrame = a3;
}

- (void)initWithConfig:(os_log_t)log delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
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
  v7 = "-[VCVideoReceiverDefault initWithConfig:delegate:delegateFunctions:reportingAgent:statisticsCollector:transmitterHandle:]";
  v8 = 1024;
  v9 = 191;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d init video receiver 0x%x with an invalid rtp handle", (uint8_t *)&v4, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)initializeDisplayLink
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to activate VCDisplayLink", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)videoReceiverRxFrameRate
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d handle is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
