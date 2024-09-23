@implementation VCRedundancyControlAlgorithmVideo

- (VCRedundancyControlAlgorithmVideo)initWithRedundancyControllerMode:(unsigned int)a3 maxAllowedRedundancyPercentage:(unsigned int)a4 mediaControlInfoFECFeedbackVersion:(unsigned __int8)a5
{
  VCRedundancyControlAlgorithmVideo *v8;
  VCRedundancyControlAlgorithmVideo *v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v13;
  _BYTE buf[40];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCRedundancyControlAlgorithmVideo;
  v8 = -[VCRedundancyControlAlgorithmVideo init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_redundancyMode = a3;
    v8->_redundancyPercentage = 0;
    v8->_maxAllowedRedundancyPercentage = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCRedundancyControlAlgorithmVideo initWithRedundancyControllerMode:maxAllowedRedundancyP"
                              "ercentage:mediaControlInfoFECFeedbackVersion:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 62;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = a4;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting maxAllowedRedundancyPercentage = %d", buf, 0x22u);
      }
    }
    v9->_mediaControlInfoFECFeedbackVersion = a5;
    *(_OWORD *)buf = xmmword_1D9109220;
    *(_OWORD *)&buf[16] = unk_1D9109230;
    *(_QWORD *)&buf[32] = -1;
    -[VCRedundancyControlAlgorithmVideo setupFeedbackAnalyzerConfig](v9, "setupFeedbackAnalyzerConfig");
    v9->_isRedundancyStrategyResetPending = 0;
    VCFECFeedbackAnalyzer_Create(*MEMORY[0x1E0C9AE00], (uint64_t *)&v9->_feedbackAnalyzer, (__int128 *)buf);
    *(_QWORD *)&v9->_freezeReason = 0xFFFFFFFFLL;
  }
  return v9;
}

- (void)dealloc
{
  OpaqueVCFECFeedbackAnalyzer *feedbackAnalyzer;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  feedbackAnalyzer = self->_feedbackAnalyzer;
  if (feedbackAnalyzer)
  {
    CFRelease(feedbackAnalyzer);
    self->_feedbackAnalyzer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCRedundancyControlAlgorithmVideo;
  -[VCRedundancyControlAlgorithmVideo dealloc](&v4, sel_dealloc);
}

- ($C2BB56CA84CB3474CB2B6B99F63D2246)setupFeedbackAnalyzerConfig
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  $C2BB56CA84CB3474CB2B6B99F63D2246 *result;
  double v12;

  retstr->var4 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-fec-feedback-analyzer-level-match-percentile"), 0, &unk_1E9EFB0D8, 1), "doubleValue");
  retstr->var0 = v4;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-fec-feedback-analyzer-buffer-max-length"), 0, &unk_1E9EFB108, 1), "doubleValue");
  v6 = v5;
  retstr->var1 = v5;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-fec-feedback-analyzer-report-min-period"), 0, &unk_1E9EFB118, 1), "doubleValue");
  if (v7 <= 0.0)
  {
    v8 = 0.02;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRedundancyControlAlgorithmVideo setupFeedbackAnalyzerConfig].cold.1(v9);
    }
  }
  else
  {
    v8 = v7;
  }
  retstr->var2 = (int)(v6 / v8);
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-fec-feedback-analyzer-vplr-window-size"), 0, &unk_1E9EFB128, 1), "doubleValue");
  retstr->var3 = v10;
  result = ($C2BB56CA84CB3474CB2B6B99F63D2246 *)objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-fec-feedback-analyzer-interpolation-threshold"), 0, &unk_1E9EFB0E8, 1), "doubleValue");
  retstr->var4 = v12;
  return result;
}

- (void)stateRunning:(tagVCStatisticsMessage *)a3
{
  int v5;
  BOOL *p_isRedundancyStrategyResetPending;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  int freezeReason;
  unsigned int videoReceivedPackets;
  double offChannelTimeRatio;
  unsigned __int8 v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  double v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3->var0.feedback.videoReceivedPackets)
  {
    self->_freezeReason = 0;
  }
  else
  {
    if (self->_offChannelTimeRatio <= 0.4)
    {
      p_isRedundancyStrategyResetPending = &self->_isRedundancyStrategyResetPending;
      do
        v7 = __ldaxr((unsigned __int8 *)p_isRedundancyStrategyResetPending);
      while (__stlxr(0, (unsigned __int8 *)p_isRedundancyStrategyResetPending));
      if ((v7 & 1) == 0)
      {
        if (self->_freezeReason == -1)
          return;
        goto LABEL_12;
      }
      v5 = 2;
    }
    else
    {
      v5 = 1;
    }
    self->_freezeReason = v5;
  }
LABEL_12:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      freezeReason = self->_freezeReason;
      videoReceivedPackets = a3->var0.feedback.videoReceivedPackets;
      offChannelTimeRatio = self->_offChannelTimeRatio;
      v13 = atomic_load((unsigned __int8 *)&self->_isRedundancyStrategyResetPending);
      v14 = 136316674;
      v15 = v8;
      v16 = 2080;
      v17 = "-[VCRedundancyControlAlgorithmVideo stateRunning:]";
      v18 = 1024;
      v19 = 102;
      v20 = 1024;
      v21 = freezeReason;
      v22 = 1024;
      v23 = videoReceivedPackets;
      v24 = 2048;
      v25 = offChannelTimeRatio;
      v26 = 1024;
      v27 = v13 & 1;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy frozen reason=%d isNetworkCongested=%d _offChannelTimeRatio=%2.3f bluetoohResetFlag=%d", (uint8_t *)&v14, 0x38u);
    }
  }
  self->_state = 1;
}

- (void)stateFrozen:(tagVCStatisticsMessage *)a3
{
  int freezeReason;
  uint64_t v6;
  NSObject *v7;
  int v8;
  unsigned int videoReceivedPackets;
  double offChannelTimeRatio;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  freezeReason = self->_freezeReason;
  if (freezeReason)
  {
    if (freezeReason != 2 && (freezeReason != 1 || self->_offChannelTimeRatio >= 0.25))
      return;
  }
  else if (a3->var0.feedback.videoReceivedPackets)
  {
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_freezeReason;
      videoReceivedPackets = a3->var0.feedback.videoReceivedPackets;
      offChannelTimeRatio = self->_offChannelTimeRatio;
      v11 = 136316418;
      v12 = v6;
      v13 = 2080;
      v14 = "-[VCRedundancyControlAlgorithmVideo stateFrozen:]";
      v15 = 1024;
      v16 = 124;
      v17 = 1024;
      v18 = v8;
      v19 = 1024;
      v20 = videoReceivedPackets;
      v21 = 2048;
      v22 = offChannelTimeRatio;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy unfrozen reason=%d isNetworkCongested=%d _offChannelTimeRatio=%2.3f", (uint8_t *)&v11, 0x32u);
    }
  }
  *(_QWORD *)&self->_freezeReason = 0xFFFFFFFFLL;
  -[VCRedundancyControlAlgorithmVideo reset](self, "reset");
}

- (void)checkForRedundancyFreeze:(tagVCStatisticsMessage *)a3
{
  int state;
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
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state == 1)
  {
    v10 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    v26 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    v27 = v10;
    v28 = *((_QWORD *)&a3->var0.localRCEvent + 21);
    v11 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    v22 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    v23 = v11;
    v12 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    v24 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    v25 = v12;
    v13 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    v18 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    v19 = v13;
    v14 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    v20 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    v21 = v14;
    v15 = *(_OWORD *)&a3->isVCRCInternal;
    v16 = *(_OWORD *)&a3->type;
    v17 = v15;
    -[VCRedundancyControlAlgorithmVideo stateFrozen:](self, "stateFrozen:", &v16);
  }
  else if (!state)
  {
    v4 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    v26 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    v27 = v4;
    v28 = *((_QWORD *)&a3->var0.localRCEvent + 21);
    v5 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    v22 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    v23 = v5;
    v6 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    v24 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    v25 = v6;
    v7 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    v18 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    v19 = v7;
    v8 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    v20 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    v21 = v8;
    v9 = *(_OWORD *)&a3->isVCRCInternal;
    v16 = *(_OWORD *)&a3->type;
    v17 = v9;
    -[VCRedundancyControlAlgorithmVideo stateRunning:](self, "stateRunning:", &v16);
  }
}

- (void)reset
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
      v8 = "-[VCRedundancyControlAlgorithmVideo reset]";
      v9 = 1024;
      v10 = 145;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy reset", (uint8_t *)&v5, 0x1Cu);
    }
  }
  self->_plrEnvelope = 0.0;
  *(_QWORD *)&self->_burstyLossArraySize = 0;
  VCFECFeedbackAnalyzer_CleanHistory((uint64_t)self->_feedbackAnalyzer);
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  int type;
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
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  type = a3->type;
  if (a3->type == 13)
  {
    v10 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    v32 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    v33 = v10;
    v34 = *((_QWORD *)&a3->var0.localRCEvent + 21);
    v11 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    v28 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    v29 = v11;
    v12 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    v30 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    v31 = v12;
    v13 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    v24 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    v25 = v13;
    v14 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    v26 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    v27 = v14;
    v15 = *(_OWORD *)&a3->isVCRCInternal;
    v22 = *(_OWORD *)&a3->type;
    v23 = v15;
    -[VCRedundancyControlAlgorithmVideo processRTCPPSFBStatistics:](self, "processRTCPPSFBStatistics:", &v22);
  }
  else if (type == 11)
  {
    v16 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    v32 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    v33 = v16;
    v34 = *((_QWORD *)&a3->var0.localRCEvent + 21);
    v17 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    v28 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    v29 = v17;
    v18 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    v30 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    v31 = v18;
    v19 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    v24 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    v25 = v19;
    v20 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    v26 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    v27 = v20;
    v21 = *(_OWORD *)&a3->isVCRCInternal;
    v22 = *(_OWORD *)&a3->type;
    v23 = v21;
    -[VCRedundancyControlAlgorithmVideo processNWConnectionStatistics:](self, "processNWConnectionStatistics:", &v22);
  }
  else if (type == 3)
  {
    v4 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    v32 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    v33 = v4;
    v34 = *((_QWORD *)&a3->var0.localRCEvent + 21);
    v5 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    v28 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    v29 = v5;
    v6 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    v30 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    v31 = v6;
    v7 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    v24 = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    v25 = v7;
    v8 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    v26 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    v27 = v8;
    v9 = *(_OWORD *)&a3->isVCRCInternal;
    v22 = *(_OWORD *)&a3->type;
    v23 = v9;
    -[VCRedundancyControlAlgorithmVideo processRCNetworkStatistics:](self, "processRCNetworkStatistics:", &v22);
  }
}

- (void)processNWConnectionStatistics:(tagVCStatisticsMessage *)a3
{
  uint64_t v4;
  NSObject *v5;

  if (a3->type == 11)
  {
    LODWORD(self->_offChannelTimeRatio) = a3->var0.probing.packetReceived.bandwidthEstimation;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRedundancyControlAlgorithmVideo processNWConnectionStatistics:].cold.1(v4, &a3->type, v5);
  }
}

- (void)processRTCPPSFBStatistics:(tagVCStatisticsMessage *)a3
{
  double VPLR;

  VCFECFeedbackAnalyzer_ProcessFeedback((uint64_t)self->_feedbackAnalyzer, *(_QWORD *)&a3->arrivalTime, a3->var0.videoLossFeedback.frameSize | ((unint64_t)a3->var0.videoLossFeedback.packetsLost << 16) | 0xAAAAAAAA00000000);
  VPLR = VCFECFeedbackAnalyzer_GetVPLR((uint64_t)self->_feedbackAnalyzer);
  self->_packetLossPercentage = VPLR;
  self->_packetLossPercentageVideo = VPLR;
}

- (void)processRCNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  double VPLR;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  unsigned int redundancyPercentage;
  unsigned int redundancyMode;
  float plrEnvelope;
  float packetLossPercentage;
  float packetLossPercentageVideo;
  int mediaControlInfoFECFeedbackVersion;
  uint64_t v29;
  _BYTE buf[48];
  _BYTE v31[32];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a3->type == 3)
  {
    self->_packetLossPercentage = a3->var0.network.packetLossPercentage;
    if (self->_mediaControlInfoFECFeedbackVersion == 1)
      VPLR = VCFECFeedbackAnalyzer_GetVPLR((uint64_t)self->_feedbackAnalyzer);
    else
      VPLR = a3->var0.network.packetLossPercentageVideo;
    self->_packetLossPercentageVideo = VPLR;
    v7 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    v37 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    v38 = v7;
    v39 = *((_QWORD *)&a3->var0.localRCEvent + 21);
    v8 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    v33 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    v34 = v8;
    v9 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    v35 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    v36 = v9;
    v10 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    *(_OWORD *)&buf[32] = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    *(_OWORD *)v31 = v10;
    v11 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    *(_OWORD *)&v31[16] = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    v32 = v11;
    v12 = *(_OWORD *)&a3->isVCRCInternal;
    *(_OWORD *)buf = *(_OWORD *)&a3->type;
    *(_OWORD *)&buf[16] = v12;
    -[VCRedundancyControlAlgorithmVideo checkForRedundancyFreeze:](self, "checkForRedundancyFreeze:", buf);
    if (self->_state != 1)
    {
      if (VCMediaControlInfo_IsLossStatsEnabled(self->_mediaControlInfoFECFeedbackVersion))
      {
        v29 = 0;
        FECUtil_UnpackFrameLoss(*((unsigned __int16 *)&a3->var0.localRCEvent + 28), (int *)&v29 + 1, (int *)&v29);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          v15 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = v13;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[VCRedundancyControlAlgorithmVideo processRCNetworkStatistics:]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 208;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = HIDWORD(v29);
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = v29;
              _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Frame Losss Stats size=%d loss=%d", buf, 0x28u);
            }
          }
          else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v13;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCRedundancyControlAlgorithmVideo processRCNetworkStatistics:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 208;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = HIDWORD(v29);
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = v29;
            _os_log_debug_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Frame Losss Stats size=%d loss=%d", buf, 0x28u);
          }
        }
        VCFECFeedbackAnalyzer_ProcessFeedback((uint64_t)self->_feedbackAnalyzer, *(_QWORD *)&a3->arrivalTime, WORD2(v29) | ((_DWORD)v29 << 16) | 0xAAAAAAAA00000000);
      }
      -[VCRedundancyControlAlgorithmVideo updateBurstyLoss:](self, "updateBurstyLoss:", a3->var0.baseband.transmittedBytes);
      v16 = -[VCRedundancyControlAlgorithmVideo computeRedundancyWithLossPercentage](self, "computeRedundancyWithLossPercentage");
      v17 = -[VCRedundancyControlAlgorithmVideo computeRedundancyWithBurstyLoss](self, "computeRedundancyWithBurstyLoss");
      if (v16 <= v17)
        v18 = v17;
      else
        v18 = v16;
      if (self->_mediaControlInfoFECFeedbackVersion)
        v19 = v16;
      else
        v19 = v18;
      if (self->_redundancyPercentage != v19)
      {
        v20 = v17;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            redundancyPercentage = self->_redundancyPercentage;
            redundancyMode = self->_redundancyMode;
            plrEnvelope = self->_plrEnvelope;
            packetLossPercentage = self->_packetLossPercentage;
            packetLossPercentageVideo = self->_packetLossPercentageVideo;
            mediaControlInfoFECFeedbackVersion = self->_mediaControlInfoFECFeedbackVersion;
            *(_DWORD *)buf = 136317954;
            *(_QWORD *)&buf[4] = v21;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCRedundancyControlAlgorithmVideo processRCNetworkStatistics:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 227;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = redundancyPercentage;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = v19;
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = redundancyMode;
            *(_WORD *)&buf[46] = 1024;
            *(_DWORD *)v31 = v16;
            *(_WORD *)&v31[4] = 1024;
            *(_DWORD *)&v31[6] = v20;
            *(_WORD *)&v31[10] = 2048;
            *(double *)&v31[12] = plrEnvelope;
            *(_WORD *)&v31[20] = 2048;
            *(double *)&v31[22] = packetLossPercentage;
            *(_WORD *)&v31[30] = 2048;
            *(double *)&v32 = packetLossPercentageVideo;
            WORD4(v32) = 1024;
            *(_DWORD *)((char *)&v32 + 10) = mediaControlInfoFECFeedbackVersion;
            _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy level changed from %d to %d _redundancyMode=%d redundancyPercentageBasedOnPLR=%d redundancyPercentageBasedOnBurstyLoss=%d _plrEnvelope=%3.3f _packetLossPercentage=%3.3f _packetLossPercentageVideo=%3.3f _mediaControlInfoFECFeedbackVersion=%d", buf, 0x5Eu);
          }
        }
        self->_redundancyPercentage = v19;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCRedundancyControlAlgorithmVideo processRCNetworkStatistics:].cold.1(v6);
  }
}

- (void)updateBurstyLoss:(unsigned int)a3
{
  unsigned int burstyLossArraySize;

  self->_burstyLoss[self->_burstyLossArrayIndex] = a3;
  burstyLossArraySize = self->_burstyLossArraySize;
  self->_burstyLossArrayIndex = (self->_burstyLossArrayIndex + 1) & 7;
  if (burstyLossArraySize <= 7)
    self->_burstyLossArraySize = burstyLossArraySize + 1;
}

- (unsigned)computeRedundancyWithLossPercentage
{
  double packetLossPercentageVideo;
  double plrEnvelope;
  double v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  float packetLossPercentage;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  float VPLR;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  float v24;
  double v25;
  float v26;
  double v27;
  float v28;
  double v29;
  float v30;
  double v31;
  float v32;
  int v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (self->_redundancyMode == 6)
  {
    packetLossPercentageVideo = self->_packetLossPercentageVideo;
    plrEnvelope = self->_plrEnvelope;
    v5 = dbl_1D9109210[plrEnvelope < packetLossPercentageVideo];
    v6 = plrEnvelope * (1.0 - v5) + packetLossPercentageVideo * v5;
    self->_plrEnvelope = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      v9 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          packetLossPercentage = self->_packetLossPercentage;
          v11 = packetLossPercentage;
          v12 = self->_packetLossPercentageVideo;
          v13 = v12;
          v14 = self->_plrEnvelope;
          v15 = v14;
          v16 = v6;
          v17 = v16;
          VPLR = VCFECFeedbackAnalyzer_GetVPLR((uint64_t)self->_feedbackAnalyzer);
          v33 = 136316930;
          v34 = v7;
          v35 = 2080;
          v36 = "-[VCRedundancyControlAlgorithmVideo computeRedundancyWithLossPercentage]";
          v37 = 1024;
          v38 = 275;
          v39 = 2048;
          v40 = v11;
          v41 = 2048;
          v42 = v13;
          v43 = 2048;
          v44 = v15;
          v45 = 2048;
          v46 = v17;
          v47 = 2048;
          v48 = VPLR;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Redundancy level _packetLossPercentage=%2.2f _packetLossPercentageVideo=%2.2f _plrEnvelope=%2.2f currentPLR=%2.2f GetFECVPLR=%2.2f", (uint8_t *)&v33, 0x4Eu);
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v24 = self->_packetLossPercentage;
        v25 = v24;
        v26 = self->_packetLossPercentageVideo;
        v27 = v26;
        v28 = self->_plrEnvelope;
        v29 = v28;
        v30 = v6;
        v31 = v30;
        v32 = VCFECFeedbackAnalyzer_GetVPLR((uint64_t)self->_feedbackAnalyzer);
        v33 = 136316930;
        v34 = v7;
        v35 = 2080;
        v36 = "-[VCRedundancyControlAlgorithmVideo computeRedundancyWithLossPercentage]";
        v37 = 1024;
        v38 = 275;
        v39 = 2048;
        v40 = v25;
        v41 = 2048;
        v42 = v27;
        v43 = 2048;
        v44 = v29;
        v45 = 2048;
        v46 = v31;
        v47 = 2048;
        v48 = v32;
        _os_log_debug_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Redundancy level _packetLossPercentage=%2.2f _packetLossPercentageVideo=%2.2f _plrEnvelope=%2.2f currentPLR=%2.2f GetFECVPLR=%2.2f", (uint8_t *)&v33, 0x4Eu);
      }
    }
  }
  else
  {
    v6 = self->_packetLossPercentage;
  }
  if (v6 >= 0.05)
  {
    if (v6 >= 30.0)
      v20 = 300;
    else
      v20 = 200;
    if (v6 >= 20.0)
      v21 = v20;
    else
      v21 = 100;
    if (v6 >= 5.0)
      v22 = v21;
    else
      v22 = 50;
    if (v6 >= 2.0)
      v19 = v22;
    else
      v19 = 25;
  }
  else
  {
    v19 = 0;
  }
  if (v19 >= self->_maxAllowedRedundancyPercentage)
    return self->_maxAllowedRedundancyPercentage;
  else
    return v19;
}

- (unsigned)computeRedundancyWithBurstyLoss
{
  uint64_t burstyLossArraySize;
  unsigned int v3;
  unsigned int *burstyLoss;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;

  burstyLossArraySize = self->_burstyLossArraySize;
  if ((_DWORD)burstyLossArraySize)
  {
    v3 = 0;
    burstyLoss = self->_burstyLoss;
    do
    {
      v6 = *burstyLoss++;
      v5 = v6;
      if (v3 <= v6)
        v3 = v5;
      --burstyLossArraySize;
    }
    while (burstyLossArraySize);
    if (v3 >= 5)
      v7 = 300;
    else
      v7 = dword_1D9109248[v3];
  }
  else
  {
    v7 = 0;
  }
  if (v7 >= self->_maxAllowedRedundancyPercentage)
    return self->_maxAllowedRedundancyPercentage;
  else
    return v7;
}

- ($CB0759397B546F099C641D8C4C77BDE7)getFecLevelPerFrameSizeVector
{
  retstr->var1[31] = 0;
  *(_OWORD *)&retstr->var1[15].var0 = 0u;
  *(_OWORD *)&retstr->var1[23].var0 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1[7].var0 = 0u;
  return ($CB0759397B546F099C641D8C4C77BDE7 *)VCFECFeedbackAnalyzer_GetFECLevelVector((uint64_t)self->_feedbackAnalyzer, (uint64_t)retstr);
}

- (BOOL)isRedundancyStrategyResetPending
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isRedundancyStrategyResetPending);
  return v2 & 1;
}

- (void)setIsRedundancyStrategyResetPending:(BOOL)a3
{
  BOOL *p_isRedundancyStrategyResetPending;
  unsigned __int8 v4;

  p_isRedundancyStrategyResetPending = &self->_isRedundancyStrategyResetPending;
  do
    v4 = __ldaxr((unsigned __int8 *)p_isRedundancyStrategyResetPending);
  while (__stlxr(v4 | a3, (unsigned __int8 *)p_isRedundancyStrategyResetPending));
}

- (unsigned)redundancyPercentage
{
  return self->_redundancyPercentage;
}

- (double)redundancyInterval
{
  return self->_redundancyInterval;
}

- (void)setupFeedbackAnalyzerConfig
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = 136316162;
  v4 = a1;
  OUTLINED_FUNCTION_1();
  v5 = 84;
  v6 = 2048;
  v7 = v1;
  v8 = 2048;
  v9 = 0x3F947AE147AE147BLL;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected reportMinPeriod storebag value %f, falling back to default %f", (uint8_t *)&v3, 0x30u);
}

- (void)processNWConnectionStatistics:(os_log_t)log .cold.1(uint64_t a1, int *a2, os_log_t log)
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
  v7 = "-[VCRedundancyControlAlgorithmVideo processNWConnectionStatistics:]";
  v8 = 1024;
  v9 = 170;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl type=%d", (uint8_t *)&v4, 0x22u);
}

- (void)processRCNetworkStatistics:(uint64_t)a1 .cold.1(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  OUTLINED_FUNCTION_1();
  v4 = 191;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d wrong type of statistics message is processed by VCRedundancyControl", (uint8_t *)&v2, 0x1Cu);
}

@end
