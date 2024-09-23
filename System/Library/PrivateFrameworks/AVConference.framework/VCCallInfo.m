@implementation VCCallInfo

- (VCCallInfo)init
{
  VCCallInfo *v2;
  VCCallInfo *v3;
  double v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  double videoDegradedThreshold;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)VCCallInfo;
  v2 = -[VCCallInfo init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->callID = -1;
    v2->participantID = 0;
    *(_QWORD *)&v2->auNumber = 0x25800000000;
    v2->cellBandwidth = 100;
    objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", CFSTR("gk-p2p-video-degraded-threshold")), "doubleValue");
    if (v4 < 5.0)
      v4 = 5.0;
    v3->videoDegradedThreshold = v4;
    v3->videoDegradedThreshold = VCDefaults_GetDoubleValueForKey(CFSTR("videoDegradedThreshold"), v4);
    objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("gk-p2p-video-near-degraded-threshold"), CFSTR("videoNearDegradedThreshold"), &unk_1E9EFB258, 1), "doubleValue");
    v3->_videoNearDegradedThreshold = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        videoDegradedThreshold = v3->videoDegradedThreshold;
        *(_DWORD *)buf = 136315906;
        v12 = v6;
        v13 = 2080;
        v14 = "-[VCCallInfo init]";
        v15 = 1024;
        v16 = 44;
        v17 = 2048;
        v18 = videoDegradedThreshold;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d videoDegradedThreshold = %f", buf, 0x26u);
      }
    }
    v3->u8Version = 1;
    v3->useNewPLCalc = 0;
    v3->isPreLionOS = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  self->participantID = 0;
  v3.receiver = self;
  v3.super_class = (Class)VCCallInfo;
  -[VCCallInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)requiresImplicitFeatureString
{
  return self->is4x;
}

- (void)setAuNumber:(unsigned int)a3
{
  unsigned int v3;

  if (a3)
  {
    self->auNumber = a3;
  }
  else
  {
    if (self->is4x)
      v3 = 1;
    else
      v3 = 2;
    self->auNumber = v3;
  }
}

- (BOOL)updateWithLastDecodedFrameTime:(double)a3 time:(double)a4
{
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 videoIsPaused;
  BOOL result;
  double firstDegradedMeasure;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    v9 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        videoIsPaused = self->videoIsPaused;
        v14 = 136316674;
        v15 = v7;
        v16 = 2080;
        v17 = "-[VCCallInfo updateWithLastDecodedFrameTime:time:]";
        v18 = 1024;
        v19 = 87;
        v20 = 2048;
        v21 = a4;
        v22 = 2048;
        v23 = a3;
        v24 = 2048;
        v25 = a4 - a3;
        v26 = 1024;
        v27 = videoIsPaused;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d microTime=%f lastDecodedFrameTime=%f currentFrameTimeDiff=%f videoIsPaused=%d", (uint8_t *)&v14, 0x40u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v13 = self->videoIsPaused;
      v14 = 136316674;
      v15 = v7;
      v16 = 2080;
      v17 = "-[VCCallInfo updateWithLastDecodedFrameTime:time:]";
      v18 = 1024;
      v19 = 87;
      v20 = 2048;
      v21 = a4;
      v22 = 2048;
      v23 = a3;
      v24 = 2048;
      v25 = a4 - a3;
      v26 = 1024;
      v27 = v13;
      _os_log_debug_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEBUG, " [%s] %s:%d microTime=%f lastDecodedFrameTime=%f currentFrameTimeDiff=%f videoIsPaused=%d", (uint8_t *)&v14, 0x40u);
    }
  }
  if (self->videoIsPaused)
    return 0;
  if (a4 == 0.0 || (firstDegradedMeasure = self->firstDegradedMeasure, firstDegradedMeasure == 0.0))
  {
    self->firstDegradedMeasure = a4;
    firstDegradedMeasure = a4;
  }
  if (a4 - firstDegradedMeasure >= 10.0)
  {
    if (a4 - a3 <= self->videoDegradedThreshold)
    {
      if (self->isVideoQualityDegraded)
      {
        self->isVideoQualityDegraded = 0;
        return 1;
      }
      else
      {
        result = 0;
        self->_isVideoQualityNearDegraded = a4 - a3 > self->_videoNearDegradedThreshold;
      }
    }
    else
    {
      if (self->isVideoQualityDegraded)
        return 0;
      result = 1;
      self->isVideoQualityDegraded = 1;
    }
  }
  else
  {
    result = self->isVideoQualityDegraded;
    self->isVideoQualityDegraded = 0;
  }
  return result;
}

- (BOOL)supportsDynamicContentsRectWithAspectPreservation
{
  return -[SDPMini allowsContentsChangeWithAspectPreservation](self->sdp, "allowsContentsChangeWithAspectPreservation");
}

- (void)setVideoIsPaused:(BOOL)a3
{
  if (self->videoIsPaused != a3)
  {
    self->videoIsPaused = a3;
    self->firstDegradedMeasure = 0.0;
  }
}

- (VoiceIOFarEndVersionInfo)audioVersionInfo:(SEL)a3
{
  VoiceIOFarEndVersionInfo *result;

  retstr->farEndAUVersion = 0;
  *(_OWORD *)&retstr->farEndOSVersion[32] = 0u;
  *(_OWORD *)&retstr->farEndOSVersion[48] = 0u;
  *(_OWORD *)retstr->farEndOSVersion = 0u;
  *(_OWORD *)&retstr->farEndOSVersion[16] = 0u;
  *(_OWORD *)&retstr->farEndHwModel[32] = 0u;
  *(_OWORD *)&retstr->farEndHwModel[48] = 0u;
  *(_OWORD *)retstr->farEndHwModel = 0u;
  *(_OWORD *)&retstr->farEndHwModel[16] = 0u;
  if (a4)
    result = (VoiceIOFarEndVersionInfo *)1;
  else
    result = (VoiceIOFarEndVersionInfo *)-[VCCallInfo auNumber](self, "auNumber");
  retstr->farEndAUVersion = result;
  return result;
}

- (void)setUserAgent:(id)a3
{
  uint64_t v5;
  BOOL v6;
  unsigned int v7;
  const __CFString *v8;

  self->isIOS = objc_msgSend(a3, "rangeOfString:", CFSTR("/GK")) != 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a3, "rangeOfString:", CFSTR("Viceroy 1.4.0")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = objc_msgSend(a3, "rangeOfString:", CFSTR("Viceroy 1.4.1"));
    self->is4x = v5 != 0x7FFFFFFFFFFFFFFFLL;
    v6 = v5 == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(a3, "rangeOfString:", CFSTR("Viceroy 1.4.2")) == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v6 = 0;
    self->is4x = 1;
  }
  self->supportsSpecialAACBundle = v6;
  self->usesInitialFECImplementation = objc_msgSend(a3, "rangeOfString:", CFSTR("Viceroy 1.4")) != 0x7FFFFFFFFFFFFFFFLL;
  if (self->isIOS)
  {
    self->visibleRectCropping = 1;
LABEL_12:
    v8 = CFSTR("Viceroy 1.6");
    goto LABEL_13;
  }
  if (objc_msgSend(a3, "rangeOfString:", CFSTR("Viceroy 1.4")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a3, "rangeOfString:", CFSTR("Viceroy 1.5"));
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  self->visibleRectCropping = v7;
  if (self->isIOS)
    goto LABEL_12;
  v8 = CFSTR("Viceroy 1.7");
LABEL_13:
  self->useNewPLCalc = objc_msgSend(a3, "localizedCaseInsensitiveCompare:", v8) != -1;
}

- (BOOL)supportSDPCompression
{
  return self->u8Version != 0;
}

+ (unsigned)getVCCurrentVersion
{
  return 1;
}

- (BOOL)isHDVideoSupported
{
  return !self->isPreLionOS;
}

- (unsigned)callID
{
  return self->callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->callID = a3;
}

- (NSString)participantID
{
  return self->participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)auNumber
{
  return self->auNumber;
}

- (unsigned)maxBandwidth
{
  return self->maxBandwidth;
}

- (void)setMaxBandwidth:(unsigned int)a3
{
  self->maxBandwidth = a3;
}

- (unsigned)cellBandwidth
{
  return self->cellBandwidth;
}

- (void)setCellBandwidth:(unsigned int)a3
{
  self->cellBandwidth = a3;
}

- (BOOL)isPreLionOS
{
  return self->isPreLionOS;
}

- (void)setIsPreLionOS:(BOOL)a3
{
  self->isPreLionOS = a3;
}

- (BOOL)isVideoQualityDegraded
{
  return self->isVideoQualityDegraded;
}

- (void)setIsVideoQualityDegraded:(BOOL)a3
{
  self->isVideoQualityDegraded = a3;
}

- (BOOL)videoIsPaused
{
  return self->videoIsPaused;
}

- (BOOL)isIOS
{
  return self->isIOS;
}

- (BOOL)usesInitialFECImplementation
{
  return self->usesInitialFECImplementation;
}

- (BOOL)supportsDynamicMaxBitrate
{
  return self->supportsDynamicMaxBitrate;
}

- (void)setSupportsDynamicMaxBitrate:(BOOL)a3
{
  self->supportsDynamicMaxBitrate = a3;
}

- (NSString)sdpString
{
  return self->sdpString;
}

- (void)setSdpString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (SDPMini)sdp
{
  return self->sdp;
}

- (void)setSdp:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unsigned)visibleRectCropping
{
  return self->visibleRectCropping;
}

- (void)setVisibleRectCropping:(unsigned int)a3
{
  self->visibleRectCropping = a3;
}

- (BOOL)useNewPLCalc
{
  return self->useNewPLCalc;
}

- (BOOL)supportsSpecialAACBundle
{
  return self->supportsSpecialAACBundle;
}

- (BOOL)supportsSKEOptimization
{
  return self->supportsSKEOptimization;
}

- (void)setSupportsSKEOptimization:(BOOL)a3
{
  self->supportsSKEOptimization = a3;
}

- (unsigned)u8Version
{
  return self->u8Version;
}

- (void)setU8Version:(unsigned __int8)a3
{
  self->u8Version = a3;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)OSVersion
{
  return self->_osVersion;
}

- (void)setOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)frameworkVersion
{
  return self->_frameworkVersion;
}

- (void)setFrameworkVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isVideoQualityNearDegraded
{
  return self->_isVideoQualityNearDegraded;
}

- (void)setIsVideoQualityNearDegraded:(BOOL)a3
{
  self->_isVideoQualityNearDegraded = a3;
}

@end
