@implementation VCVideoStreamConfig

- (VCVideoStreamConfig)init
{
  return -[VCVideoStreamConfig initWithClientDictionary:](self, "initWithClientDictionary:", 0);
}

- (VCVideoStreamConfig)initWithClientDictionary:(id)a3
{
  VCVideoStreamConfig *v4;
  VCVideoStreamConfig *v5;
  const char *v6;
  char *v7;
  os_log_t *v8;
  uint64_t v9;
  NSObject *v10;
  char *__lasts;
  char *__str;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)VCVideoStreamConfig;
  v4 = -[VCMediaStreamConfig initWithClientDictionary:](&v14, sel_initWithClientDictionary_);
  v5 = v4;
  if (v4)
  {
    v4->_tilesPerFrame = 1;
    v4->_txBitrateTiers = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v5->_rxCodecFeatureListStrings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_txCodecFeatureListStrings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_mediaStallTimeout = NAN;
    v5->_mediaStallReportRepeatInterval = NAN;
    if (!a3)
      goto LABEL_15;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      v6 = objc_opt_class()
         ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
         : "<nil>";
      asprintf(&__str, "%s[%p] %s", v6, v5, (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
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
              v16 = v9;
              v17 = 2080;
              v18 = "-[VCVideoStreamConfig initWithClientDictionary:]";
              v19 = 1024;
              v20 = 180;
              v21 = 2080;
              v22 = "-[VCVideoStreamConfig initWithClientDictionary:]";
              v23 = 2080;
              v24 = v7;
              _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          v7 = strtok_r(0, "\n", &__lasts);
        }
        while (v7);
        free(__str);
      }
    }
    if (!-[VCVideoStreamConfig applyVideoStreamClientDictionary:](v5, "applyVideoStreamClientDictionary:", a3))
    {

      return 0;
    }
    else
    {
LABEL_15:
      v5->_useVideoJitterForVideoPlayout = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:](GKSConnectivitySettings, "isFeatureEnabledForStorebagKey:userDefaultKey:featureFlagDomain:featureFlagName:", CFSTR("vc-video-jitter-buffer-for-video-playout"), CFSTR("UseVideoJitterForVideoPlayoutForFaceTime"), "AVConference", "UseVideoJitterForVideoPlayout");
      v5->_resetSendRTPTimestampOnStop = 1;
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamConfig;
  -[VCMediaStreamConfig dealloc](&v3, sel_dealloc);
}

+ (BOOL)validateClientDictionary:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;

  v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRXCodecType")), "integerValue");
  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTXCodecType")), "integerValue");
  LOBYTE(v6) = 0;
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 0x64 && (v5 & 0xFFFFFFFFFFFFFFFDLL) == 0x64)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamFramerate")), "integerValue") < 1
      || objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTilesPerFrame")), "integerValue") < 1|| objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamEnableCVO")), "BOOLValue")&& (unint64_t)(objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCVOExtensionID")), "unsignedIntegerValue")- 1) > 0xD)
    {
      goto LABEL_31;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDirection")), "integerValue") == 2)
    {
LABEL_17:
      LOBYTE(v6) = 1;
      return v6;
    }
    v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamPixelFormat")), "unsignedIntegerValue");
    v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamHDRMode")), "integerValue");
    if (v7 <= 875836533)
    {
      if (v7 == 875704422 || v7 == 875704438)
        goto LABEL_16;
      v9 = 875836518;
    }
    else
    {
      if (v7 > 2016686639)
      {
        if (v7 == 2019963956)
        {
          if ((v8 & 0xFFFFFFFD) == 1)
            goto LABEL_17;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v6)
              return v6;
            +[VCVideoStreamConfig validateClientDictionary:].cold.4();
          }
          goto LABEL_31;
        }
        if (v7 == 2016686640)
        {
          if ((v8 - 3) > 0xFFFFFFFD)
            goto LABEL_17;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v6)
              return v6;
            +[VCVideoStreamConfig validateClientDictionary:].cold.2();
          }
          goto LABEL_31;
        }
        goto LABEL_28;
      }
      if (v7 == 875836534)
      {
LABEL_16:
        if (!v8)
          goto LABEL_17;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (!v6)
            return v6;
          +[VCVideoStreamConfig validateClientDictionary:].cold.3();
        }
LABEL_31:
        LOBYTE(v6) = 0;
        return v6;
      }
      v9 = 1751411059;
    }
    if (v7 == v9)
      goto LABEL_16;
LABEL_28:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      +[VCVideoStreamConfig validateClientDictionary:].cold.1(v10, v7, v11);
    }
    goto LABEL_31;
  }
  return v6;
}

+ (unsigned)profileLevelIdForString:(id)a3
{
  unsigned int result;

  if ((objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CED8C8]) & 1) != 0)
    return 4374559;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    +[VCVideoStreamConfig profileLevelIdForString:].cold.1();
  }
  return 0;
}

+ (id)profileLevelStringForId:(unsigned int)a3
{
  if (a3 == 4374559)
    return (id)*MEMORY[0x1E0CED8C8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[VCVideoStreamConfig profileLevelStringForId:].cold.1();
  }
  return 0;
}

- (unint64_t)tilesPerFrame
{
  return (int)VCDefaults_GetIntValueForKey(CFSTR("tilesPerVideoFrame"), LODWORD(self->_tilesPerFrame));
}

- (BOOL)applyVideoStreamClientDictionary:(id)a3
{
  _BOOL4 v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSString *v13;

  v5 = +[VCVideoStreamConfig validateClientDictionary:](VCVideoStreamConfig, "validateClientDictionary:");
  if (v5)
  {
    -[NSMutableDictionary removeAllObjects](self->super._rxPayloadMap, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->super._txPayloadMap, "removeAllObjects");
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRxPayloadType")))
      -[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRXCodecType")), "integerValue")), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRxPayloadType")), "integerValue"));
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTxPayloadType")))
      -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTXCodecType")), "integerValue")), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTxPayloadType")), "integerValue"));
    self->_framerate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamFramerate")), "integerValue");
    self->_txMinBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTXMinBitrate")), "integerValue");
    self->_txMaxBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTXMaxBitrate")), "integerValue");
    self->_rxMinBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRXMinBitrate")), "integerValue");
    self->_rxMaxBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRXMaxBitrate")), "integerValue");
    self->_keyFrameInterval = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamKeyFrameInterval")), "integerValue");
    self->_remoteVideoInitialOrientation = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRemoteVideoInitialOrientation")), "integerValue");
    self->_enableCVO = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamEnableCVO")), "BOOLValue");
    self->_cvoExtensionID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCVOExtensionID")), "unsignedIntegerValue");
    self->_isVideoProtected = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamIsVideoProtected")), "BOOLValue");
    self->_videoResolution = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamVideoResolution")), "integerValue");
    self->_type = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamVideoStreamMode")), "integerValue");
    self->_captureSourceID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCaptureSourceID")), "integerValue");
    self->_shouldSendBlackFramesOnClearScreen = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamShouldSendBlackFramesOnClearScreen")), "BOOLValue");
    self->_screenDisplayID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDisplayID")), "unsignedIntegerValue");
    self->_tilesPerFrame = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTilesPerFrame")), "unsignedIntegerValue");
    self->_pixelFormat = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamPixelFormat")), "unsignedIntegerValue");
    self->_ltrpEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamIsltrpEnabled")), "BOOLValue");
    if (self->_videoResolution == 27)
    {
      self->_customWidth = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCustomWidth")), "unsignedIntegerValue");
      self->_customHeight = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCustomHeight")), "unsignedIntegerValue");
    }
    self->_hdrMode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamHDRMode")), "integerValue");
    v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcRemoteDeviceName"));
    if ((objc_msgSend(v6, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) != 0)
      v7 = 0;
    else
      v7 = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcRemoteDeviceName"));
    self->_remoteDeviceName = v7;
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRxCodecFeatureListString")))
    {
      v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRXCodecType")), "integerValue");
      v9 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRxCodecFeatureListString"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rxCodecFeatureListStrings, "setObject:forKeyedSubscript:", v9, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8));
    }
    if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTxCodecFeatureListString")))
    {
      v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTXCodecType")), "integerValue");
      v11 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTxCodecFeatureListString"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_txCodecFeatureListStrings, "setObject:forKeyedSubscript:", v11, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10));
    }
    v12 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamProfileLevel"));
    if ((objc_msgSend(v12, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) != 0)
      v13 = 0;
    else
      v13 = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamProfileLevel"));
    self->_profileLevel = v13;
    self->_fecEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamIsFECEnabled")), "BOOLValue");
    self->_rtxEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamIsRTXEnabled")), "BOOLValue");
    self->_transportProtocolType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTransportProtocolType")), "integerValue");
    -[VCVideoStreamConfig initializeParameterSets](self, "initializeParameterSets");
  }
  return v5;
}

- (void)addRxCodecFeatureListString:(id)a3 codecType:(int64_t)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rxCodecFeatureListStrings, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4));
}

- (void)addTxCodecFeatureListString:(id)a3 codecType:(int64_t)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_txCodecFeatureListStrings, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4));
}

- (void)addTxBitrateTier:(id)a3
{
  if (objc_msgSend(a3, "unsignedIntegerValue") >= self->_txMinBitrate
    && objc_msgSend(a3, "unsignedIntegerValue") <= self->_txMaxBitrate)
  {
    -[NSMutableOrderedSet addObject:](self->_txBitrateTiers, "addObject:", a3);
    -[NSMutableOrderedSet sortUsingComparator:](self->_txBitrateTiers, "sortUsingComparator:", &__block_literal_global_68);
  }
}

uint64_t __40__VCVideoStreamConfig_addTxBitrateTier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)initializeParameterSets
{
  self->_parameterSets = VCVideoParameterSets_DefaultSupportedSetsForPayloadAndPixelFormat(+[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", -[VCMediaStreamConfig primaryTxCodecType](self, "primaryTxCodecType")), self->_pixelFormat);
}

- (int64_t)videoResolution
{
  return self->_videoResolution;
}

- (void)setVideoResolution:(int64_t)a3
{
  self->_videoResolution = a3;
}

- (unint64_t)framerate
{
  return self->_framerate;
}

- (void)setFramerate:(unint64_t)a3
{
  self->_framerate = a3;
}

- (unint64_t)txMinBitrate
{
  return self->_txMinBitrate;
}

- (void)setTxMinBitrate:(unint64_t)a3
{
  self->_txMinBitrate = a3;
}

- (unint64_t)txMaxBitrate
{
  return self->_txMaxBitrate;
}

- (void)setTxMaxBitrate:(unint64_t)a3
{
  self->_txMaxBitrate = a3;
}

- (NSOrderedSet)txBitrateTiers
{
  return &self->_txBitrateTiers->super;
}

- (unint64_t)txInitialBitrate
{
  return self->_txInitialBitrate;
}

- (void)setTxInitialBitrate:(unint64_t)a3
{
  self->_txInitialBitrate = a3;
}

- (unint64_t)rxMinBitrate
{
  return self->_rxMinBitrate;
}

- (void)setRxMinBitrate:(unint64_t)a3
{
  self->_rxMinBitrate = a3;
}

- (unint64_t)rxMaxBitrate
{
  return self->_rxMaxBitrate;
}

- (void)setRxMaxBitrate:(unint64_t)a3
{
  self->_rxMaxBitrate = a3;
}

- (NSDictionary)rxCodecFeatureListStrings
{
  return &self->_rxCodecFeatureListStrings->super;
}

- (NSDictionary)txCodecFeatureListStrings
{
  return &self->_txCodecFeatureListStrings->super;
}

- (unint64_t)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setKeyFrameInterval:(unint64_t)a3
{
  self->_keyFrameInterval = a3;
}

- (int)remoteVideoInitialOrientation
{
  return self->_remoteVideoInitialOrientation;
}

- (void)setRemoteVideoInitialOrientation:(int)a3
{
  self->_remoteVideoInitialOrientation = a3;
}

- (BOOL)enableCVO
{
  return self->_enableCVO;
}

- (void)setEnableCVO:(BOOL)a3
{
  self->_enableCVO = a3;
}

- (unint64_t)cvoExtensionID
{
  return self->_cvoExtensionID;
}

- (void)setCvoExtensionID:(unint64_t)a3
{
  self->_cvoExtensionID = a3;
}

- (BOOL)isVideoProtected
{
  return self->_isVideoProtected;
}

- (void)setIsVideoProtected:(BOOL)a3
{
  self->_isVideoProtected = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)sourceFramerate
{
  return self->_sourceFramerate;
}

- (void)setSourceFramerate:(unint64_t)a3
{
  self->_sourceFramerate = a3;
}

- (int)encodingMode
{
  return self->_encodingMode;
}

- (void)setEncodingMode:(int)a3
{
  self->_encodingMode = a3;
}

- (unsigned)videoPriorityPointer
{
  return self->_videoPriorityPointer;
}

- (void)setVideoPriorityPointer:(unsigned __int8 *)a3
{
  self->_videoPriorityPointer = a3;
}

- (int64_t)captureSourceID
{
  return self->_captureSourceID;
}

- (void)setCaptureSourceID:(int64_t)a3
{
  self->_captureSourceID = a3;
}

- (BOOL)shouldSendBlackFramesOnClearScreen
{
  return self->_shouldSendBlackFramesOnClearScreen;
}

- (void)setShouldSendBlackFramesOnClearScreen:(BOOL)a3
{
  self->_shouldSendBlackFramesOnClearScreen = a3;
}

- (unsigned)screenDisplayID
{
  return self->_screenDisplayID;
}

- (void)setScreenDisplayID:(unsigned int)a3
{
  self->_screenDisplayID = a3;
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

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (void)setTilesPerFrame:(unint64_t)a3
{
  self->_tilesPerFrame = a3;
}

- (BOOL)ltrpEnabled
{
  return self->_ltrpEnabled;
}

- (void)setLtrpEnabled:(BOOL)a3
{
  self->_ltrpEnabled = a3;
}

- (int)hdrMode
{
  return self->_hdrMode;
}

- (void)setHdrMode:(int)a3
{
  self->_hdrMode = a3;
}

- (NSString)remoteDeviceName
{
  return self->_remoteDeviceName;
}

- (void)setRemoteDeviceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 520);
}

- (NSString)profileLevel
{
  return self->_profileLevel;
}

- (void)setProfileLevel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 528);
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

- (BOOL)isVariableSliceModeEnabled
{
  return self->_isVariableSliceModeEnabled;
}

- (void)setIsVariableSliceModeEnabled:(BOOL)a3
{
  self->_isVariableSliceModeEnabled = a3;
}

- (BOOL)rtcpPSFB_FIREnabled
{
  return self->_rtcpPSFB_FIREnabled;
}

- (void)setRtcpPSFB_FIREnabled:(BOOL)a3
{
  self->_rtcpPSFB_FIREnabled = a3;
}

- (VCMediaStreamSyncSource)syncSource
{
  return self->_syncSource;
}

- (void)setSyncSource:(id)a3
{
  self->_syncSource = (VCMediaStreamSyncSource *)a3;
}

- (BOOL)resetSendRTPTimestampOnStop
{
  return self->_resetSendRTPTimestampOnStop;
}

- (void)setResetSendRTPTimestampOnStop:(BOOL)a3
{
  self->_resetSendRTPTimestampOnStop = a3;
}

- (int)encoderUsage
{
  return self->_encoderUsage;
}

- (void)setEncoderUsage:(int)a3
{
  self->_encoderUsage = a3;
}

- (BOOL)useInBandFEC
{
  return self->_useInBandFEC;
}

- (void)setUseInBandFEC:(BOOL)a3
{
  self->_useInBandFEC = a3;
}

- (unsigned)audioIOSampleRate
{
  return self->_audioIOSampleRate;
}

- (void)setAudioIOSampleRate:(unsigned int)a3
{
  self->_audioIOSampleRate = a3;
}

- (BOOL)fecEnabled
{
  return self->_fecEnabled;
}

- (void)setFecEnabled:(BOOL)a3
{
  self->_fecEnabled = a3;
}

- (BOOL)rtxEnabled
{
  return self->_rtxEnabled;
}

- (void)setRtxEnabled:(BOOL)a3
{
  self->_rtxEnabled = a3;
}

- (int)transportProtocolType
{
  return self->_transportProtocolType;
}

- (void)setTransportProtocolType:(int)a3
{
  self->_transportProtocolType = a3;
}

- (double)minPlaybackInterval
{
  return self->_minPlaybackInterval;
}

- (void)setMinPlaybackInterval:(double)a3
{
  self->_minPlaybackInterval = a3;
}

- (double)mediaStallTimeout
{
  return self->_mediaStallTimeout;
}

- (void)setMediaStallTimeout:(double)a3
{
  self->_mediaStallTimeout = a3;
}

- (double)mediaStallReportRepeatInterval
{
  return self->_mediaStallReportRepeatInterval;
}

- (void)setMediaStallReportRepeatInterval:(double)a3
{
  self->_mediaStallReportRepeatInterval = a3;
}

- (int)fecHeaderVersion
{
  return self->_fecHeaderVersion;
}

- (void)setFecHeaderVersion:(int)a3
{
  self->_fecHeaderVersion = a3;
}

- (BOOL)fecGeneratorEnabled
{
  return self->_fecGeneratorEnabled;
}

- (void)setFecGeneratorEnabled:(BOOL)a3
{
  self->_fecGeneratorEnabled = a3;
}

- (BOOL)useVideoJitterForVideoPlayout
{
  return self->_useVideoJitterForVideoPlayout;
}

- (void)setUseVideoJitterForVideoPlayout:(BOOL)a3
{
  self->_useVideoJitterForVideoPlayout = a3;
}

- (unint64_t)maxEncoderPixels
{
  return self->_maxEncoderPixels;
}

- (void)setMaxEncoderPixels:(unint64_t)a3
{
  self->_maxEncoderPixels = a3;
}

- (BOOL)forceZeroRegionOfInterestOrigin
{
  return self->_forceZeroRegionOfInterestOrigin;
}

- (void)setForceZeroRegionOfInterestOrigin:(BOOL)a3
{
  self->_forceZeroRegionOfInterestOrigin = a3;
}

- (BOOL)shouldEnableMLEnhance
{
  return self->_shouldEnableMLEnhance;
}

- (void)setShouldEnableMLEnhance:(BOOL)a3
{
  self->_shouldEnableMLEnhance = a3;
}

- (BOOL)deferredAssemblyEnabled
{
  return self->_deferredAssemblyEnabled;
}

- (void)setDeferredAssemblyEnabled:(BOOL)a3
{
  self->_deferredAssemblyEnabled = a3;
}

- (BOOL)looseAVSyncEnabled
{
  return self->_looseAVSyncEnabled;
}

- (void)setLooseAVSyncEnabled:(BOOL)a3
{
  self->_looseAVSyncEnabled = a3;
}

+ (void)validateClientDictionary:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "+[VCVideoStreamConfig validateClientDictionary:]";
  v8 = 1024;
  v9 = 234;
  v10 = 2080;
  v11 = FourccToCStr(a2);
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unexpected pixel format in video configuration. pixelFormat=%s", (uint8_t *)&v4, 0x26u);
}

+ (void)validateClientDictionary:.cold.2()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "+[VCVideoStreamConfig validateClientDictionary:]";
  v6 = 1024;
  v7 = 221;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid HDR mode in video configuration: hdrMode=%d", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

+ (void)validateClientDictionary:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d HDR mode set for non-HDR pixel format in video configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateClientDictionary:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d 444-10 bit can only be used for HDR10/HDR10Reference mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)profileLevelIdForString:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unsupported profile level string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)profileLevelStringForId:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unsupported profile level id", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
