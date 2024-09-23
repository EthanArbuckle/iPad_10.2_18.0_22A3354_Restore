@implementation VCVideoTransmitterDefault

- (VCVideoTransmitterDefault)initWithConfig:(id)a3
{
  unsigned int v5;
  VCVideoTransmitterDefault *v6;
  VCVideoTransmitterDefault *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int *v24;
  uint64_t v25;
  __int128 v26;
  double v27;
  __int16 v28;
  VCVideoHardwareDumpCollector *v29;
  tagHANDLE **p_videoTransmitterHandle;
  int Handle;
  const __CFString *v32;
  uint64_t v33;
  NSObject *v34;
  tagHANDLE *v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  uint64_t v39;
  NSObject *v40;
  tagHANDLE *v41;
  uint64_t v43;
  NSObject *v44;
  const __CFString *v45;
  uint64_t v46;
  NSObject *v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  uint64_t v51;
  NSObject *v52;
  objc_super v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56[76];
  void *controlInfoGenerator;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  char v64;
  char v65;
  int v66;
  _BOOL4 v67;
  int v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  int v73;
  unsigned int v74;
  unsigned int encodingHeight;
  int v76;
  unsigned int encodingWidth;
  unsigned int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  double DoubleValueForKey;
  int v84;
  unsigned int audioTimestampRate;
  uint64_t *v86;
  uint64_t v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  __int16 v91;
  int v92;
  BOOL v93;
  int v94;
  int v95;
  int v96;
  int v97;
  uint64_t v98;
  int v99;
  char v100;
  char v101;
  char v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  char v106;
  int v107;
  int v108;
  char v109;
  uint64_t v110;
  int v111;
  int v112;
  VCVideoHardwareDumpCollector *v113;
  char v114;
  char v115;
  CMTime v116;
  int v117;
  __int16 v118;
  _BYTE v119[18];
  _BYTE v120[6];
  __int16 v121;
  _BYTE v122[10];
  __int16 v123;
  int v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v54 = 0;
  v55 = 0;
  if (objc_msgSend(a3, "rtpTimestampRate"))
    v5 = objc_msgSend(a3, "rtpTimestampRate");
  else
    v5 = 24000;
  self->_audioTimestampRate = v5;
  v53.receiver = self;
  v53.super_class = (Class)VCVideoTransmitterDefault;
  v6 = -[VCVideoTransmitterBase initWithConfig:](&v53, sel_initWithConfig_, a3);
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v43 = VRTraceErrorLogLevelToCSTR();
      v44 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoTransmitterDefault initWithConfig:].cold.1(v43, v44);
    }
    goto LABEL_56;
  }
  v7 = v6;
  if (!a3)
  {
    if ((VCVideoTransmitterDefault *)objc_opt_class() == v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_57;
      v46 = VRTraceErrorLogLevelToCSTR();
      v47 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_57;
      LODWORD(v116.value) = 136315650;
      *(CMTimeValue *)((char *)&v116.value + 4) = v46;
      LOWORD(v116.flags) = 2080;
      *(_QWORD *)((char *)&v116.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
      HIWORD(v116.epoch) = 1024;
      v117 = 59;
      v48 = " [%s] %s:%d The provided config is nil";
      v49 = v47;
      v50 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v45 = (const __CFString *)-[VCVideoTransmitterDefault performSelector:](v7, "performSelector:", sel_logPrefix);
      else
        v45 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_57;
      v51 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_57;
      LODWORD(v116.value) = 136316162;
      *(CMTimeValue *)((char *)&v116.value + 4) = v51;
      LOWORD(v116.flags) = 2080;
      *(_QWORD *)((char *)&v116.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
      HIWORD(v116.epoch) = 1024;
      v117 = 59;
      v118 = 2112;
      *(_QWORD *)v119 = v45;
      *(_WORD *)&v119[8] = 2048;
      *(_QWORD *)&v119[10] = v7;
      v48 = " [%s] %s:%d %@(%p) The provided config is nil";
      v49 = v52;
      v50 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v49, OS_LOG_TYPE_DEFAULT, v48, (uint8_t *)&v116, v50);
LABEL_57:

    return 0;
  }
  CMTimeMake(&v116, 0, v6->_audioTimestampRate);
  v8 = *(_OWORD *)&v116.value;
  v7->super._latestSampleBufferTimestamp.epoch = v116.epoch;
  *(_OWORD *)&v7->super._latestSampleBufferTimestamp.value = v8;
  v9 = (void *)objc_msgSend(a3, "mediaControlInfoGenerator");
  if (v9)
    v9 = (void *)CFRetain(v9);
  v7->super._controlInfoGenerator = v9;
  v10 = (void *)objc_msgSend(a3, "customFeatureListStrings");
  v11 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "videoPayload")));
  v7->_transmitterMode = objc_msgSend(a3, "mode");
  v12 = 0;
  if (objc_msgSend(a3, "mode") == 1 && v11)
  {
    if (objc_msgSend(a3, "setupBWEstimationOptionWithFeatureString"))
      +[VCVideoTransmitterDefault setupBandwidthEstimationOptions:featureString:](VCVideoTransmitterDefault, "setupBandwidthEstimationOptions:featureString:", &v54, v11);
    else
      +[VCVideoTransmitterDefault setupBandwidthEstimationOptions:](VCVideoTransmitterDefault, "setupBandwidthEstimationOptions:", &v54);
    if ((VCVideoTransmitterDefault *)objc_opt_class() == v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      LODWORD(v116.value) = 136316674;
      *(CMTimeValue *)((char *)&v116.value + 4) = v14;
      LOWORD(v116.flags) = 2080;
      *(_QWORD *)((char *)&v116.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
      HIWORD(v116.epoch) = 1024;
      v117 = 76;
      v118 = 1024;
      *(_DWORD *)v119 = HIDWORD(v54);
      *(_WORD *)&v119[4] = 1024;
      *(_DWORD *)&v119[6] = v55;
      *(_WORD *)&v119[10] = 1024;
      *(_DWORD *)&v119[12] = HIDWORD(v55);
      *(_WORD *)&v119[16] = 1024;
      *(_DWORD *)v120 = v54;
      v16 = " [%s] %s:%d setup bandwidthEstimationOptions fEnableNewBWEMode=%d, fEnableFakeLargeFrameMode=%d, fEnableActi"
            "veProbingSenderLog=%d, fBWEInitialized=%d";
      v17 = v15;
      v18 = 52;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCVideoTransmitterDefault performSelector:](v7, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      LODWORD(v116.value) = 136317186;
      *(CMTimeValue *)((char *)&v116.value + 4) = v19;
      LOWORD(v116.flags) = 2080;
      *(_QWORD *)((char *)&v116.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
      HIWORD(v116.epoch) = 1024;
      v117 = 76;
      v118 = 2112;
      *(_QWORD *)v119 = v13;
      *(_WORD *)&v119[8] = 2048;
      *(_QWORD *)&v119[10] = v7;
      *(_WORD *)v120 = 1024;
      *(_DWORD *)&v120[2] = HIDWORD(v54);
      v121 = 1024;
      *(_DWORD *)v122 = v55;
      *(_WORD *)&v122[4] = 1024;
      *(_DWORD *)&v122[6] = HIDWORD(v55);
      v123 = 1024;
      v124 = v54;
      v16 = " [%s] %s:%d %@(%p) setup bandwidthEstimationOptions fEnableNewBWEMode=%d, fEnableFakeLargeFrameMode=%d, fEna"
            "bleActiveProbingSenderLog=%d, fBWEInitialized=%d";
      v17 = v20;
      v18 = 72;
    }
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v116, v18);
LABEL_24:
    v12 = VideoUtil_FeatureListStringOptionExists(objc_msgSend(v11, "UTF8String"), (uint64_t)"CR");
    v7->_canLocalResizePIP = +[VCVideoFeatureListStringHelper isResizePIPSupportedInFeatureListString:](VCVideoFeatureListStringHelper, "isResizePIPSupportedInFeatureListString:", v11);
    -[VCVideoTransmitterDefault setUpAspectRatiosFromFeatureListString:](v7, "setUpAspectRatiosFromFeatureListString:", objc_msgSend(v11, "UTF8String"));
  }
  bzero(v56, 0x270uLL);
  if ((int)objc_msgSend(a3, "streamCount") >= 1)
  {
    v21 = 0;
    v22 = 0;
    do
    {
      v23 = v56[0]++;
      v24 = &v56[8 * v23];
      v25 = objc_msgSend(a3, "streamConfigs");
      v26 = *(_OWORD *)(v25 + v21 + 16);
      *(_OWORD *)(v24 + 2) = *(_OWORD *)(v25 + v21);
      *(_OWORD *)(v24 + 6) = v26;
      ++v22;
      v21 += 32;
    }
    while (v22 < (int)objc_msgSend(a3, "streamCount"));
  }
  v97 = objc_msgSend(a3, "encoderUsage");
  if (objc_msgSend(a3, "mode") == 1)
  {
    encodingWidth = v7->super._encodingWidth;
    v74 = v7->super._encodingWidth;
    encodingHeight = v7->super._encodingHeight;
    v78 = v7->super._encodingHeight;
    v76 = objc_msgSend(a3, "framerate");
    v79 = objc_msgSend(a3, "framerate");
  }
  controlInfoGenerator = v7->super._controlInfoGenerator;
  v58 = objc_msgSend(a3, "reportingAgent");
  v59 = objc_msgSend(a3, "reportingParentID");
  v70 = v7->super._encodingWidth;
  v71 = v7->super._encodingHeight;
  v73 = objc_msgSend(a3, "pixelFormat");
  v72 = objc_msgSend(a3, "framerate");
  v80 = objc_msgSend(a3, "txMaxBitrate");
  v84 = objc_msgSend(a3, "videoPayload");
  v81 = -1;
  v82 = objc_msgSend(a3, "keyFrameInterval");
  objc_msgSend(a3, "minKeyFrameGenerationIntervalInSeconds");
  DoubleValueForKey = VCDefaults_GetDoubleValueForKey(CFSTR("minKeyFrameGenerationInterval"), v27);
  v87 = 0x20000000200;
  v90 = objc_msgSend(v11, "UTF8String");
  v68 = v12;
  v67 = (int)VCCPUCount() > 1;
  v69 = 1;
  v62 = 1;
  if (objc_msgSend(a3, "recommendedMTU"))
    v28 = objc_msgSend(a3, "recommendedMTU");
  else
    v28 = 1280;
  v91 = v28;
  v63 = objc_msgSend(a3, "isIPv6");
  v88 = objc_msgSend(a3, "parameterSets");
  v65 = 1;
  v66 = 2;
  v94 = objc_msgSend(a3, "mode");
  v95 = objc_msgSend(a3, "captureSource");
  audioTimestampRate = v7->_audioTimestampRate;
  v96 = objc_msgSend(a3, "encodingMode");
  v89 = objc_msgSend(a3, "colorInfo");
  v98 = objc_msgSend(a3, "videoPriorityPointer");
  v99 = objc_msgSend(a3, "tilesPerFrame");
  v61 = objc_msgSend(a3, "statisticsCollector");
  v64 = objc_msgSend(a3, "useRateControl");
  v104 = objc_msgSend(a3, "qualityIndex");
  v92 = -[VCDefaults enableTxSourceYuvDump](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableTxSourceYuvDump");
  v93 = -[VCDefaults enableTxBitstreamDump](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableTxBitstreamDump");
  v101 = objc_msgSend(a3, "reinitEncoderOnFrameSizeChangeEnabled");
  v103 = objc_msgSend(a3, "remoteIDSParticipantID");
  v60 = objc_msgSend(a3, "mediaController");
  v86 = &v54;
  v105 = objc_msgSend(a3, "profileLevel");
  v102 = objc_msgSend(a3, "isFecGeneratorEnabled");
  v100 = objc_msgSend(a3, "fecHeaderV1Enabled");
  v106 = objc_msgSend(a3, "temporalScalingEnabled");
  v107 = objc_msgSend(a3, "maxSupportedTemporalLayers");
  v108 = objc_msgSend(a3, "cvoExtensionID");
  v109 = objc_msgSend(a3, "useInBandFec");
  v110 = objc_msgSend(a3, "maxEncoderPixels");
  v111 = objc_msgSend(a3, "encoderBitrateAveragingInterval");
  v112 = objc_msgSend(a3, "ltrAckFeedbackType");
  v114 = objc_msgSend(a3, "fecEnabled");
  v115 = objc_msgSend(a3, "rtxEnabled");
  if (-[VCDefaults isTransmitterTestVerificationEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "isTransmitterTestVerificationEnabled"))
  {
    v29 = objc_alloc_init(VCVideoHardwareDumpCollector);
    v7->_verificationContext = v29;
    v113 = v29;
  }
  p_videoTransmitterHandle = &v7->_videoTransmitterHandle;
  Handle = VideoTransmitter_CreateHandle((uint64_t *)&v7->_videoTransmitterHandle, v56);
  if ((VCVideoTransmitterDefault *)objc_opt_class() == v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v35 = *p_videoTransmitterHandle;
        LODWORD(v116.value) = 136316162;
        *(CMTimeValue *)((char *)&v116.value + 4) = v33;
        LOWORD(v116.flags) = 2080;
        *(_QWORD *)((char *)&v116.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
        HIWORD(v116.epoch) = 1024;
        v117 = 156;
        v118 = 1024;
        *(_DWORD *)v119 = (_DWORD)v35;
        *(_WORD *)&v119[4] = 2048;
        *(_QWORD *)&v119[6] = v7;
        v36 = " [%s] %s:%d Created videoTransmitterHandle=0x%x videoTransmitter=%p";
        v37 = v34;
        v38 = 44;
LABEL_45:
        _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, v36, (uint8_t *)&v116, v38);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v32 = (const __CFString *)-[VCVideoTransmitterDefault performSelector:](v7, "performSelector:", sel_logPrefix);
    else
      v32 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v41 = *p_videoTransmitterHandle;
        LODWORD(v116.value) = 136316674;
        *(CMTimeValue *)((char *)&v116.value + 4) = v39;
        LOWORD(v116.flags) = 2080;
        *(_QWORD *)((char *)&v116.flags + 2) = "-[VCVideoTransmitterDefault initWithConfig:]";
        HIWORD(v116.epoch) = 1024;
        v117 = 156;
        v118 = 2112;
        *(_QWORD *)v119 = v32;
        *(_WORD *)&v119[8] = 2048;
        *(_QWORD *)&v119[10] = v7;
        *(_WORD *)v120 = 1024;
        *(_DWORD *)&v120[2] = (_DWORD)v41;
        v121 = 2048;
        *(_QWORD *)v122 = v7;
        v36 = " [%s] %s:%d %@(%p) Created videoTransmitterHandle=0x%x videoTransmitter=%p";
        v37 = v40;
        v38 = 64;
        goto LABEL_45;
      }
    }
  }
  if (Handle < 0)
  {

LABEL_56:
    v7 = 0;
    goto LABEL_57;
  }
  -[VCVideoTransmitterDefault setUpAspectRatios:](v7, "setUpAspectRatios:", 0);
  v7->super._realtimeSPI.setFECRatio = VCVideoTransmitterDefault_SetFECRatio;
  v7->super._realtimeSPI.enqueueVideoFrame = VCVideoTransmitterDefault_EnqueueVideoFrame;
  v7->super._realtimeSPI.setMediaQueueSize = VCVideoTransmitterDefault_SetMediaQueueSize;
  return v7;
}

- (void)setUpAspectRatios:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 canLocalResizePIP;
  _BOOL4 canRemoteResizePIP;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BYTE v25[24];
  __int128 v26;
  VCVideoTransmitterDefault *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  if ((VCVideoTransmitterDefault *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoTransmitterDefault performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    canLocalResizePIP = self->_canLocalResizePIP;
    canRemoteResizePIP = self->_canRemoteResizePIP;
    *(_DWORD *)v25 = 136316930;
    *(_QWORD *)&v25[4] = v13;
    *(_WORD *)&v25[12] = 2080;
    *(_QWORD *)&v25[14] = "-[VCVideoTransmitterDefault setUpAspectRatios:]";
    *(_WORD *)&v25[22] = 1024;
    LODWORD(v26) = 177;
    WORD2(v26) = 2112;
    *(_QWORD *)((char *)&v26 + 6) = v5;
    HIWORD(v26) = 2048;
    v27 = self;
    LOWORD(v28) = 1024;
    *(_DWORD *)((char *)&v28 + 2) = v3;
    HIWORD(v28) = 1024;
    LODWORD(v29) = canLocalResizePIP;
    WORD2(v29) = 1024;
    *(_DWORD *)((char *)&v29 + 6) = canRemoteResizePIP;
    v10 = " [%s] %s:%d %@(%p) portraitFrameRotated=%d, _canLocalResizePIP=%d, _canRemoteResizePIP=%d";
    v11 = v14;
    v12 = 66;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_canLocalResizePIP;
      v9 = self->_canRemoteResizePIP;
      *(_DWORD *)v25 = 136316418;
      *(_QWORD *)&v25[4] = v6;
      *(_WORD *)&v25[12] = 2080;
      *(_QWORD *)&v25[14] = "-[VCVideoTransmitterDefault setUpAspectRatios:]";
      *(_WORD *)&v25[22] = 1024;
      LODWORD(v26) = 177;
      WORD2(v26) = 1024;
      *(_DWORD *)((char *)&v26 + 6) = v3;
      WORD5(v26) = 1024;
      HIDWORD(v26) = v8;
      LOWORD(v27) = 1024;
      *(_DWORD *)((char *)&v27 + 2) = v9;
      v10 = " [%s] %s:%d portraitFrameRotated=%d, _canLocalResizePIP=%d, _canRemoteResizePIP=%d";
      v11 = v7;
      v12 = 46;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v25, v12);
    }
  }
LABEL_12:
  if (self->_canLocalResizePIP || !self->_canRemoteResizePIP)
  {
    +[VideoUtil computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:](VideoUtil, "computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:", self->super._encodingHeight, self->super._encodingWidth, self->_remoteScreenPortraitAspectRatio.width, self->_remoteScreenPortraitAspectRatio.height, self->_remoteExpectedPortraitAspectRatio.width, self->_remoteExpectedPortraitAspectRatio.height, *(_OWORD *)v25, *(_QWORD *)&v25[16], v26, v27, v28, v29, v30);
    v18 = v17;
    v20 = v19;
    +[VideoUtil computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:](VideoUtil, "computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:", self->super._encodingWidth, self->super._encodingHeight, self->_remoteScreenLandscapeAspectRatio.width, self->_remoteScreenLandscapeAspectRatio.height, self->_remoteExpectedLandscapeAspectRatio.width, self->_remoteExpectedLandscapeAspectRatio.height);
  }
  else
  {
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 0);
    v18 = v23;
    v20 = v24;
    objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 3);
  }
  VideoTransmitter_SetAspectRatios(v18, v20, v21, v22);
}

- (void)dealloc
{
  void *controlInfoGenerator;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  controlInfoGenerator = self->super._controlInfoGenerator;
  if (controlInfoGenerator)
    CFRelease(controlInfoGenerator);
  VideoTransmitter_CloseHandle((uint64_t)self->_videoTransmitterHandle);
  -[VCVideoHardwareDumpCollector invalidate](self->_verificationContext, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)VCVideoTransmitterDefault;
  -[VCVideoTransmitterBase dealloc](&v4, sel_dealloc);
}

- (void)setUpAspectRatiosFromFeatureListString:(const char *)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  int v19;
  unint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  int v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[10];
  VCVideoTransmitterDefault *v33;
  _BYTE v34[6];
  const char *v35;
  _BYTE v36[6];
  _BYTE v37[6];
  const char *v38;
  _BYTE v39[6];
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  self->_canRemoteResizePIP = 0;
  v24 = -1431655766;
  v22 = -1431655766;
  v23 = 0xAAAAAAAAAAAAAAAALL;
  if (+[VCVideoFeatureListStringHelper extractAspectRatios:landscapeX:landscapeY:portraitX:portraitY:](VCVideoFeatureListStringHelper, "extractAspectRatios:landscapeX:landscapeY:portraitX:portraitY:", a3, &v24, (char *)&v23 + 4, &v23, &v22))
  {
    if (+[VCVideoFeatureListStringHelper isResizePIPSupportedInFeatureListString:](VCVideoFeatureListStringHelper, "isResizePIPSupportedInFeatureListString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3)))
    {
      self->_canRemoteResizePIP = 1;
    }
  }
  else
  {
    v24 = 3;
    v22 = 3;
    v23 = 0x200000002;
  }
  v21 = -1431655766;
  v19 = -1431655766;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  if (!+[VCVideoFeatureListStringHelper extractExpectedAspectRatios:expectedLandscapeX:expectedLandscapeY:expectedPortraitX:expectedPortraitY:](VCVideoFeatureListStringHelper, "extractExpectedAspectRatios:expectedLandscapeX:expectedLandscapeY:expectedPortraitX:expectedPortraitY:", a3, &v21, (char *)&v20 + 4, &v20, &v19))
  {
    v21 = v24;
    v19 = v22;
    v20 = v23;
  }
  if ((VCVideoTransmitterDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (self->_canRemoteResizePIP)
          v8 = "";
        else
          v8 = "No ";
        *(_DWORD *)buf = 136317954;
        v26 = v6;
        v27 = 2080;
        v28 = "-[VCVideoTransmitterDefault setUpAspectRatiosFromFeatureListString:]";
        v29 = 1024;
        v30 = 259;
        v31 = 1024;
        *(_DWORD *)v32 = v24;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = HIDWORD(v23);
        LOWORD(v33) = 1024;
        *(_DWORD *)((char *)&v33 + 2) = v23;
        HIWORD(v33) = 1024;
        *(_DWORD *)v34 = v22;
        *(_WORD *)&v34[4] = 2080;
        v35 = v8;
        *(_WORD *)v36 = 1024;
        *(_DWORD *)&v36[2] = v21;
        *(_WORD *)v37 = 1024;
        *(_DWORD *)&v37[2] = HIDWORD(v20);
        LOWORD(v38) = 1024;
        *(_DWORD *)((char *)&v38 + 2) = v20;
        HIWORD(v38) = 1024;
        *(_DWORD *)v39 = v19;
        v9 = " [%s] %s:%d Setting remote screen aspect ratio numbers %d/%d,%d/%d (%sPR), remote expects to receive %d/%d,%d/%d";
        v10 = v7;
        v11 = 86;
        goto LABEL_23;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoTransmitterDefault performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (self->_canRemoteResizePIP)
          v14 = "";
        else
          v14 = "No ";
        *(_DWORD *)buf = 136318466;
        v26 = v12;
        v27 = 2080;
        v28 = "-[VCVideoTransmitterDefault setUpAspectRatiosFromFeatureListString:]";
        v29 = 1024;
        v30 = 259;
        v31 = 2112;
        *(_QWORD *)v32 = v5;
        *(_WORD *)&v32[8] = 2048;
        v33 = self;
        *(_WORD *)v34 = 1024;
        *(_DWORD *)&v34[2] = v24;
        LOWORD(v35) = 1024;
        *(_DWORD *)((char *)&v35 + 2) = HIDWORD(v23);
        HIWORD(v35) = 1024;
        *(_DWORD *)v36 = v23;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)v37 = v22;
        *(_WORD *)&v37[4] = 2080;
        v38 = v14;
        *(_WORD *)v39 = 1024;
        *(_DWORD *)&v39[2] = v21;
        v40 = 1024;
        v41 = HIDWORD(v20);
        v42 = 1024;
        v43 = v20;
        v44 = 1024;
        v45 = v19;
        v9 = " [%s] %s:%d %@(%p) Setting remote screen aspect ratio numbers %d/%d,%d/%d (%sPR), remote expects to receive %d/%d,%d/%d";
        v10 = v13;
        v11 = 106;
LABEL_23:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  v15 = (double)v22;
  self->_remoteScreenPortraitAspectRatio.width = (double)(int)v23;
  self->_remoteScreenPortraitAspectRatio.height = v15;
  v16 = (double)SHIDWORD(v23);
  self->_remoteScreenLandscapeAspectRatio.width = (double)v24;
  self->_remoteScreenLandscapeAspectRatio.height = v16;
  v17 = (double)v19;
  self->_remoteExpectedPortraitAspectRatio.width = (double)(int)v20;
  self->_remoteExpectedPortraitAspectRatio.height = v17;
  v18 = (double)SHIDWORD(v20);
  self->_remoteExpectedLandscapeAspectRatio.width = (double)v21;
  self->_remoteExpectedLandscapeAspectRatio.height = v18;
}

- (void)startVideo
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
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
  VCVideoTransmitterDefault *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((VCVideoTransmitterDefault *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCVideoTransmitterDefault performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v13 = 136316162;
    v14 = v9;
    v15 = 2080;
    v16 = "-[VCVideoTransmitterDefault startVideo]";
    v17 = 1024;
    v18 = 269;
    v19 = 2112;
    v20 = v3;
    v21 = 2048;
    v22 = self;
    v6 = " [%s] %s:%d %@(%p) ";
    v7 = v10;
    v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = v4;
      v15 = 2080;
      v16 = "-[VCVideoTransmitterDefault startVideo]";
      v17 = 1024;
      v18 = 269;
      v6 = " [%s] %s:%d ";
      v7 = v5;
      v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
    }
  }
LABEL_12:
  if ((VideoTransmitter_ResumeEncoder() & 0x80000000) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = v11;
      v15 = 2080;
      v16 = "-[VCVideoTransmitterDefault startVideo]";
      v17 = 1024;
      v18 = 271;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Start Video Failed", (uint8_t *)&v13, 0x1Cu);
    }
  }
}

- (void)stopVideo
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
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
  VCVideoTransmitterDefault *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((VCVideoTransmitterDefault *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCVideoTransmitterDefault performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v13 = 136316162;
    v14 = v9;
    v15 = 2080;
    v16 = "-[VCVideoTransmitterDefault stopVideo]";
    v17 = 1024;
    v18 = 279;
    v19 = 2112;
    v20 = v3;
    v21 = 2048;
    v22 = self;
    v6 = " [%s] %s:%d %@(%p) ";
    v7 = v10;
    v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = v4;
      v15 = 2080;
      v16 = "-[VCVideoTransmitterDefault stopVideo]";
      v17 = 1024;
      v18 = 279;
      v6 = " [%s] %s:%d ";
      v7 = v5;
      v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v13, v8);
    }
  }
LABEL_12:
  if ((VideoTransmitter_PauseEncoder() & 0x80000000) != 0 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315650;
      v14 = v11;
      v15 = 2080;
      v16 = "-[VCVideoTransmitterDefault stopVideo]";
      v17 = 1024;
      v18 = 281;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stop Video Failed", (uint8_t *)&v13, 0x1Cu);
    }
  }
}

+ (void)setupBandwidthEstimationOptions:(tagBWEOPTION *)a3
{
  *a3 = (tagBWEOPTION)xmmword_1D910D6D0;
}

+ (void)setupBandwidthEstimationOptions:(tagBWEOPTION *)a3 featureString:(id)a4
{
  int v5;
  int v6;
  int v7;
  BOOL v8;
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v8 = 0;
  VideoUtil_ParseFeatureListString(objc_msgSend(a4, "UTF8String"), &v9, &v8);
  v5 = objc_msgSend((id)(id)CFPreferencesCopyAppValue(CFSTR("useFakeLF"), CFSTR("com.apple.VideoConference")), "BOOLValue");
  if (v8)
    v6 = 1;
  else
    v6 = v5;
  if (v8)
    v7 = 0;
  else
    v7 = v5;
  a3->var2 = v7;
  a3->var3 = 0;
  a3->var0 = v6 | v7;
  a3->var1 = v6;
}

- (void)generateKeyFrameWithFIRType:(int)a3
{
  int v3;
  tagHANDLE *videoTransmitterHandle;
  double v6[2];

  v3 = a3;
  v6[1] = *(double *)MEMORY[0x1E0C80C00];
  videoTransmitterHandle = self->_videoTransmitterHandle;
  if (a3 != 2)
    *(_QWORD *)&a3 = 0;
  VideoTransmitter_GenerateKeyFrameNow((uint64_t)videoTransmitterHandle, 0, *(uint64_t *)&a3, 0, 1, v3);
  v6[0] = NAN;
  VideoTransmitter_GetLastKeyFrameSentTime((uint64_t)self->_videoTransmitterHandle, v6);
  -[VCVideoTransmitterBase setLastKeyFrameSentTime:](self, "setLastKeyFrameSentTime:", v6[0]);
}

- (unsigned)setTemporaryMaximumBitrate:(unsigned int)a3
{
  unsigned int result;

  result = self->super._temporaryMaximumBitrate;
  if (result == a3)
    return a3;
  if (self->super._txMaxBitrate >= a3 && self->super._txMinBitrate <= a3)
  {
    VideoTransmitter_SetBitrate((uint64_t)self->_videoTransmitterHandle, a3);
    self->super._temporaryMaximumBitrate = a3;
    return a3;
  }
  return result;
}

- (void)setTargetBitrate:(unsigned int)a3
{
  if (self->super._targetBitrate != a3 && self->super._txMaxBitrate >= a3 && self->super._txMinBitrate <= a3)
  {
    VideoTransmitter_SetTargetBitrate((uint64_t)self->_videoTransmitterHandle, a3, self->super._targetBitrateChangeCounter, 0);
    self->super._targetBitrate = a3;
  }
}

- (void)setTemporalBitrateArray:(id)a3
{
  VideoTransmitter_SetTemporalBitrates((uint64_t)self->_videoTransmitterHandle, a3);
}

- (void)setHighestActiveQualityIndex:(unsigned int)a3
{
  VideoTransmitter_SetHighestActiveQualityIndex((uint64_t)self->_videoTransmitterHandle, a3);
}

- (void)setKeyFrameOnlyStreamID:(unsigned __int16)a3
{
  VideoTransmitter_SetKeyFrameOnlyStreamID((uint64_t)self->_videoTransmitterHandle, a3);
}

- (void)setStreamIDs:(unsigned __int16 *)a3 numOfStreamIDs:(unsigned __int8)a4 repairedStreamIDs:(unsigned __int16 *)a5 numOfRepairedStreamIDs:(unsigned __int8)a6
{
  VideoTransmitter_SetStreamIDs((uint64_t)self->_videoTransmitterHandle, a3, a4, a5, a6);
}

- (void)setFECRatio:(double)a3
{
  VideoTransmitter_SetFECRatio(a3);
}

- (void)setFECRedundancyVector:(id *)a3
{
  VideoTransmitter_SetFECLevelPerGroupSizeVector((uint64_t)self->_videoTransmitterHandle, a3->var0, (char *)a3->var1);
}

- (void)setIsServerBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->super._isServerBasedBandwidthProbingEnabled = a3;
  VideoTransmitter_SetServerBasedBandwidthProbing((uint64_t)self->_videoTransmitterHandle, a3);
}

- (void)setIsEndToEndBasedBandwidthProbingEnabled:(BOOL)a3
{
  self->super._isEndToEndBasedBandwidthProbingEnabled = a3;
  VideoTransmitter_SetEndToEndBasedBandwidthProbing((uint64_t)self->_videoTransmitterHandle, a3);
}

- (void)collectChannelMetrics:(id *)a3 interval:(float)a4
{
  unsigned int v7;
  double v8;
  double v9[2];

  v9[1] = *(double *)MEMORY[0x1E0C80C00];
  v8 = 0.0;
  v9[0] = 0.0;
  v7 = 0;
  VideoTransmitter_GetBitrate(a4, (uint64_t)self->_videoTransmitterHandle, v9);
  VideoTransmitter_GetFramerate(a4, (uint64_t)self->_videoTransmitterHandle, &v8);
  VideoTransmitter_GetLastVideoSampleTime((uint64_t)self->_videoTransmitterHandle, &v7);
  a3->var0 = (v9[0] / 1000.0);
  a3->var3 = v8;
  a3->var2 = 0;
  a3->var5 = self->super._lastSentAudioHostTime;
  a3->var6 = self->super._lastSentAudioSampleTime;
  a3->var7 = self->_lastSentVideoHostTime;
  a3->var8 = v7;
}

- (void)setMediaSuggestion:(VCRateControlMediaSuggestion *)a3
{
  VideoTransmitter_SetMediaSuggestion((uint64_t)self->_videoTransmitterHandle, (uint64_t)*a3);
}

- (BOOL)setEncodingMode:(int)a3
{
  return (int)VideoTransmitter_SetEncodingMode((uint64_t)self->_videoTransmitterHandle, *(uint64_t *)&a3) >= 0;
}

- (void)handleThermalLevelChange:(int)a3
{
  VideoTransmitter_SetThermalLevel((uint64_t)self->_videoTransmitterHandle, a3);
}

- (void)updateWindowState:(int)a3 isLocal:(BOOL)a4 windowRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v9;
  CGRect v11;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4;
  VideoTransmitter_SetWindowState((uint64_t)self->_videoTransmitterHandle, a4, a3);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (!CGRectEqualToRect(v11, *MEMORY[0x1E0C9D648]))
    VideoTransmitter_SetVisualRectangle(x, y, width, height, (uint64_t)self->_videoTransmitterHandle, v9);
}

- (void)handleActiveConnectionChangeDefault:(id)a3
{
  int IsLocalOnCellular;
  uint64_t IsRemoteOnCellular;
  tagHANDLE *videoTransmitterHandle;
  int v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  unsigned int txMaxBitrate;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  int IsIPv6;
  tagHANDLE *v22;
  int v23;
  tagHANDLE *v24;
  unsigned __int16 v26;
  _BYTE v27[24];
  __int128 v28;
  VCVideoTransmitterDefault *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  IsRemoteOnCellular = VCConnection_IsRemoteOnCellular((uint64_t)a3);
  videoTransmitterHandle = self->_videoTransmitterHandle;
  v8 = VCConnection_LocalCellTech((uint64_t)a3);
  v9 = VCConnection_RemoteCellTech((uint64_t)a3);
  VideoTransmitter_SetCellTech((uint64_t)videoTransmitterHandle, IsLocalOnCellular, v8, IsRemoteOnCellular, v9);
  if (self->_transmitterMode != 1)
    goto LABEL_14;
  if ((VCVideoTransmitterDefault *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_13;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    txMaxBitrate = self->super._txMaxBitrate;
    *(_DWORD *)v27 = 136316162;
    *(_QWORD *)&v27[4] = v11;
    *(_WORD *)&v27[12] = 2080;
    *(_QWORD *)&v27[14] = "-[VCVideoTransmitterDefault handleActiveConnectionChangeDefault:]";
    *(_WORD *)&v27[22] = 1024;
    LODWORD(v28) = 509;
    WORD2(v28) = 1024;
    *(_DWORD *)((char *)&v28 + 6) = txMaxBitrate;
    WORD5(v28) = 1024;
    HIDWORD(v28) = objc_msgSend(a3, "uplinkBitrateCapOneToOne");
    v14 = " [%s] %s:%d Received new connection, changing max tx bitrate from [%d] to [%d]";
    v15 = v12;
    v16 = 40;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCVideoTransmitterDefault performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_13;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v19 = self->super._txMaxBitrate;
    *(_DWORD *)v27 = 136316674;
    *(_QWORD *)&v27[4] = v17;
    *(_WORD *)&v27[12] = 2080;
    *(_QWORD *)&v27[14] = "-[VCVideoTransmitterDefault handleActiveConnectionChangeDefault:]";
    *(_WORD *)&v27[22] = 1024;
    LODWORD(v28) = 509;
    WORD2(v28) = 2112;
    *(_QWORD *)((char *)&v28 + 6) = v10;
    HIWORD(v28) = 2048;
    v29 = self;
    LOWORD(v30) = 1024;
    *(_DWORD *)((char *)&v30 + 2) = v19;
    HIWORD(v30) = 1024;
    LODWORD(v31) = objc_msgSend(a3, "uplinkBitrateCapOneToOne");
    v14 = " [%s] %s:%d %@(%p) Received new connection, changing max tx bitrate from [%d] to [%d]";
    v15 = v18;
    v16 = 60;
  }
  _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, v27, v16);
LABEL_13:
  self->super._txMaxBitrate = objc_msgSend(a3, "uplinkBitrateCapOneToOne", *(_OWORD *)v27, *(_QWORD *)&v27[16], v28, v29, v30, v31);
LABEL_14:
  IsIPv6 = VCConnection_IsIPv6((uint64_t)a3);
  if (self->_transmitterMode != 1 || (IsLocalOnCellular | IsRemoteOnCellular) == 0)
  {
    v22 = self->_videoTransmitterHandle;
    if (IsLocalOnCellular)
    {
      v23 = (unsigned __int16)objc_msgSend(a3, "connectionMTU");
      v24 = v22;
    }
    else
    {
      v24 = self->_videoTransmitterHandle;
      v23 = 1280;
    }
  }
  else
  {
    if (objc_msgSend(a3, "maxConnectionMTU"))
      v26 = objc_msgSend(a3, "maxConnectionMTU");
    else
      v26 = objc_msgSend(a3, "connectionMTU");
    v23 = v26;
    v24 = self->_videoTransmitterHandle;
  }
  VideoTransmitter_UpdateMTU((uint64_t)v24, v23, IsIPv6);
  -[VCVideoTransmitterDefault setUpAspectRatios:](self, "setUpAspectRatios:", IsRemoteOnCellular);
}

- (void)handleActiveConnectionChangeMultiway:(id)a3
{
  int IsIPv6;

  IsIPv6 = VCConnection_IsIPv6((uint64_t)a3);
  VideoTransmitter_UpdateMTU((uint64_t)self->_videoTransmitterHandle, (unsigned __int16)objc_msgSend(a3, "maxConnectionMTU"), IsIPv6);
}

- (void)handleActiveConnectionChange:(id)a3
{
  if (self->_transmitterMode == 2)
    -[VCVideoTransmitterDefault handleActiveConnectionChangeMultiway:](self, "handleActiveConnectionChangeMultiway:", a3);
  else
    -[VCVideoTransmitterDefault handleActiveConnectionChangeDefault:](self, "handleActiveConnectionChangeDefault:", a3);
}

- (BOOL)isRtxEnabled
{
  return self->super._rtxEnabled;
}

- (void)setRtxEnabled:(BOOL)a3
{
  tagHANDLE *videoTransmitterHandle;

  self->super._rtxEnabled = a3;
  videoTransmitterHandle = self->_videoTransmitterHandle;
  if (videoTransmitterHandle != (tagHANDLE *)0xFFFFFFFFLL)
    VideoTransmitter_SetIsRtxEnabled((uint64_t)videoTransmitterHandle, a3);
}

- (tagHANDLE)videoTransmitterHandle
{
  return self->_videoTransmitterHandle;
}

- (void)initWithConfig:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCVideoTransmitterDefault initWithConfig:]";
  v6 = 1024;
  v7 = 58;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to initialize the transmitter.", (uint8_t *)&v2, 0x1Cu);
}

@end
