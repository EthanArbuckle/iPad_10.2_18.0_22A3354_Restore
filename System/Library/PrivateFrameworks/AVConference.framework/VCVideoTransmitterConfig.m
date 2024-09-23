@implementation VCVideoTransmitterConfig

- (VCVideoTransmitterConfig)init
{
  VCVideoTransmitterConfig *v2;
  tagVCVideoTransmitterStreamConfig *v3;
  uint64_t v4;
  NSObject *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoTransmitterConfig;
  v2 = -[VCVideoTransmitterConfig init](&v7, sel_init);
  if (v2)
  {
    v2->_customFeatureListStrings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = (tagVCVideoTransmitterStreamConfig *)malloc_type_calloc(9uLL, 0x20uLL, 0x1020040AC42B1B7uLL);
    v2->_streamConfigs = v3;
    if (!v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoTransmitterConfig init].cold.1(v4, v5);
      }
      return 0;
    }
  }
  return v2;
}

- (id)description
{
  const char *v4;
  void *v5;

  v5 = (void *)MEMORY[0x1E0CB3940];
  if (objc_opt_class())
    v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  else
    v4 = "<nil>";
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("{ %s: videoResolution:%ld codecType:%ld framerate:%lu txMaxBitrate:%lu txMinBitrate:%lu keyFrameInterval:%lu recommendedMTU:%lu cvoExtensionID:%lu enableCVO:%d customWidth %lu, customHeight %lu, pixelFormat: %s}"), v4, self->_videoResolution, self->_codecType, self->_framerate, self->_txMaxBitrate, self->_txMinBitrate, self->_keyFrameInterval, self->_recommendedMTU, self->_cvoExtensionID, self->_enableCVO, self->_customWidth, self->_customHeight, FourccToCStr(self->_pixelFormat));
}

- (void)setMediaControlInfoGenerator:(void *)a3
{
  void *mediaControlInfoGenerator;
  void *v6;

  mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
  if (mediaControlInfoGenerator)
    CFRelease(mediaControlInfoGenerator);
  if (a3)
    v6 = (void *)CFRetain(a3);
  else
    v6 = 0;
  self->_mediaControlInfoGenerator = v6;
}

- (void)dealloc
{
  void *mediaControlInfoGenerator;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  free(self->_streamConfigs);

  mediaControlInfoGenerator = self->_mediaControlInfoGenerator;
  if (mediaControlInfoGenerator)
    CFRelease(mediaControlInfoGenerator);

  v4.receiver = self;
  v4.super_class = (Class)VCVideoTransmitterConfig;
  -[VCVideoTransmitterConfig dealloc](&v4, sel_dealloc);
}

- (void)addCustomFeatureListString:(id)a3 payload:(int)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_customFeatureListStrings, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4));
}

- (int64_t)videoResolution
{
  return self->_videoResolution;
}

- (void)setVideoResolution:(int64_t)a3
{
  self->_videoResolution = a3;
}

- (int64_t)codecType
{
  return self->_codecType;
}

- (void)setCodecType:(int64_t)a3
{
  self->_codecType = a3;
}

- (opaqueRTCReporting)reportingAgent
{
  return self->_reportingAgent;
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  self->_reportingAgent = a3;
}

- (int)reportingParentID
{
  return self->_reportingParentID;
}

- (void)setReportingParentID:(int)a3
{
  self->_reportingParentID = a3;
}

- (unint64_t)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(unint64_t)a3
{
  self->_framerate = a3;
}

- (unint64_t)txMaxBitrate
{
  return self->_txMaxBitrate;
}

- (void)setTxMaxBitrate:(unint64_t)a3
{
  self->_txMaxBitrate = a3;
}

- (unint64_t)txMinBitrate
{
  return self->_txMinBitrate;
}

- (void)setTxMinBitrate:(unint64_t)a3
{
  self->_txMinBitrate = a3;
}

- (unint64_t)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unint64_t)a3
{
  self->_keyFrameInterval = a3;
}

- (unint64_t)recommendedMTU
{
  return self->_recommendedMTU;
}

- (void)setRecommendedMTU:(unint64_t)a3
{
  self->_recommendedMTU = a3;
}

- (unint64_t)cvoExtensionID
{
  return self->_cvoExtensionID;
}

- (void)setCvoExtensionID:(unint64_t)a3
{
  self->_cvoExtensionID = a3;
}

- (BOOL)enableCVO
{
  return self->_enableCVO;
}

- (void)setEnableCVO:(BOOL)a3
{
  self->_enableCVO = a3;
}

- (int)videoSource
{
  return self->_videoSource;
}

- (void)setVideoSource:(int)a3
{
  self->_videoSource = a3;
}

- (int)videoPayload
{
  return self->_videoPayload;
}

- (void)setVideoPayload:(int)a3
{
  self->_videoPayload = a3;
}

- (int)encodingMode
{
  return self->_encodingMode;
}

- (void)setEncodingMode:(int)a3
{
  self->_encodingMode = a3;
}

- (NSDictionary)colorInfo
{
  return self->_colorInfo;
}

- (void)setColorInfo:(id)a3
{
  self->_colorInfo = (NSDictionary *)a3;
}

- (unsigned)videoPriorityPointer
{
  return self->_videoPriorityPointer;
}

- (void)setVideoPriorityPointer:(unsigned __int8 *)a3
{
  self->_videoPriorityPointer = a3;
}

- (unint64_t)customWidth
{
  return self->_customWidth;
}

- (void)setCustomWidth:(unint64_t)a3
{
  self->_customWidth = a3;
}

- (unint64_t)customHeight
{
  return self->_customHeight;
}

- (void)setCustomHeight:(unint64_t)a3
{
  self->_customHeight = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (int)captureSource
{
  return self->_captureSource;
}

- (void)setCaptureSource:(int)a3
{
  self->_captureSource = a3;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (tagVCVideoTransmitterStreamConfig)streamConfigs
{
  return self->_streamConfigs;
}

- (int)streamCount
{
  return self->_streamCount;
}

- (void)setStreamCount:(int)a3
{
  self->_streamCount = a3;
}

- (int)tilesPerFrame
{
  return self->_tilesPerFrame;
}

- (void)setTilesPerFrame:(int)a3
{
  self->_tilesPerFrame = a3;
}

- (BOOL)useRateControl
{
  return self->_useRateControl;
}

- (void)setUseRateControl:(BOOL)a3
{
  self->_useRateControl = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (NSDictionary)customFeatureListStrings
{
  return &self->_customFeatureListStrings->super;
}

- (BOOL)reinitEncoderOnFrameSizeChangeEnabled
{
  return self->_reinitEncoderOnFrameSizeChangeEnabled;
}

- (void)setReinitEncoderOnFrameSizeChangeEnabled:(BOOL)a3
{
  self->_reinitEncoderOnFrameSizeChangeEnabled = a3;
}

- (VCRateControlMediaController)mediaController
{
  return self->_mediaController;
}

- (void)setMediaController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (void)mediaControlInfoGenerator
{
  return self->_mediaControlInfoGenerator;
}

- (BOOL)isIPv6
{
  return self->_isIPv6;
}

- (void)setIsIPv6:(BOOL)a3
{
  self->_isIPv6 = a3;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (void)setQualityIndex:(unsigned int)a3
{
  self->_qualityIndex = a3;
}

- (unsigned)rtpTimestampRate
{
  return self->_rtpTimestampRate;
}

- (void)setRtpTimestampRate:(unsigned int)a3
{
  self->_rtpTimestampRate = a3;
}

- (NSString)profileLevel
{
  return self->_profileLevel;
}

- (void)setProfileLevel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 216);
}

- (unsigned)parameterSets
{
  return self->_parameterSets;
}

- (void)setParameterSets:(unsigned int)a3
{
  self->_parameterSets = a3;
}

- (BOOL)temporalScalingEnabled
{
  return self->_temporalScalingEnabled;
}

- (void)setTemporalScalingEnabled:(BOOL)a3
{
  self->_temporalScalingEnabled = a3;
}

- (unsigned)maxSupportedTemporalLayers
{
  return self->_maxSupportedTemporalLayers;
}

- (void)setMaxSupportedTemporalLayers:(unsigned int)a3
{
  self->_maxSupportedTemporalLayers = a3;
}

- (tagVCCryptor)sframeCryptor
{
  return self->_sframeCryptor;
}

- (void)setSframeCryptor:(tagVCCryptor *)a3
{
  self->_sframeCryptor = a3;
}

- (int)reportingClientType
{
  return self->_reportingClientType;
}

- (void)setReportingClientType:(int)a3
{
  self->_reportingClientType = a3;
}

- (int)encoderUsage
{
  return self->_encoderUsage;
}

- (void)setEncoderUsage:(int)a3
{
  self->_encoderUsage = a3;
}

- (unsigned)encoderBitrateAveragingInterval
{
  return self->_encoderBitrateAveragingInterval;
}

- (void)setEncoderBitrateAveragingInterval:(unsigned int)a3
{
  self->_encoderBitrateAveragingInterval = a3;
}

- (int)ltrAckFeedbackType
{
  return self->_ltrAckFeedbackType;
}

- (void)setLtrAckFeedbackType:(int)a3
{
  self->_ltrAckFeedbackType = a3;
}

- (BOOL)rtxEnabled
{
  return self->_rtxEnabled;
}

- (void)setRtxEnabled:(BOOL)a3
{
  self->_rtxEnabled = a3;
}

- (BOOL)setupBWEstimationOptionWithFeatureString
{
  return self->_setupBWEstimationOptionWithFeatureString;
}

- (void)setSetupBWEstimationOptionWithFeatureString:(BOOL)a3
{
  self->_setupBWEstimationOptionWithFeatureString = a3;
}

- (BOOL)isFecGeneratorEnabled
{
  return self->_isFecGeneratorEnabled;
}

- (void)setIsFecGeneratorEnabled:(BOOL)a3
{
  self->_isFecGeneratorEnabled = a3;
}

- (BOOL)fecHeaderV1Enabled
{
  return self->_fecHeaderV1Enabled;
}

- (void)setFecHeaderV1Enabled:(BOOL)a3
{
  self->_fecHeaderV1Enabled = a3;
}

- (unint64_t)remoteIDSParticipantID
{
  return self->_remoteIDSParticipantID;
}

- (void)setRemoteIDSParticipantID:(unint64_t)a3
{
  self->_remoteIDSParticipantID = a3;
}

- (BOOL)useInBandFec
{
  return self->_useInBandFec;
}

- (void)setUseInBandFec:(BOOL)a3
{
  self->_useInBandFec = a3;
}

- (unint64_t)maxEncoderPixels
{
  return self->_maxEncoderPixels;
}

- (void)setMaxEncoderPixels:(unint64_t)a3
{
  self->_maxEncoderPixels = a3;
}

- (BOOL)fecEnabled
{
  return self->_fecEnabled;
}

- (void)setFecEnabled:(BOOL)a3
{
  self->_fecEnabled = a3;
}

- (int)accessNetworkType
{
  return self->_accessNetworkType;
}

- (void)setAccessNetworkType:(int)a3
{
  self->_accessNetworkType = a3;
}

- (double)minKeyFrameGenerationIntervalInSeconds
{
  return self->_minKeyFrameGenerationIntervalInSeconds;
}

- (void)setMinKeyFrameGenerationIntervalInSeconds:(double)a3
{
  self->_minKeyFrameGenerationIntervalInSeconds = a3;
}

- (void)init
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = 136315906;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCVideoTransmitterConfig init]";
  v6 = 1024;
  v7 = 108;
  v8 = 1024;
  v9 = 288;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d calloc(%d) failed", (uint8_t *)&v2, 0x22u);
}

@end
