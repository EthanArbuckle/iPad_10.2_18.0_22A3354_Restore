@implementation AVCVideoStreamConfig

- (AVCVideoStreamConfig)init
{
  AVCVideoStreamConfig *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)AVCVideoStreamConfig;
  v2 = -[AVCVideoStreamConfig init](&v4, sel_init);
  if (v2)
  {
    v2->_txCodecFeatureListString = (NSString *)objc_opt_new();
    v2->_rxCodecFeatureListString = (NSString *)objc_opt_new();
    v2->_tilesPerFrame = 1;
    v2->_pixelFormat = 875704438;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCVideoStreamConfig;
  -[AVCVideoStreamConfig dealloc](&v3, sel_dealloc);
}

- (BOOL)isValidForDirection:(int64_t)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  unint64_t v7;

  if (-[AVCVideoStreamConfig txCodecType](self, "txCodecType"))
    v5 = -[AVCVideoStreamConfig txCodecType](self, "txCodecType") != 1;
  else
    v5 = 0;
  if (-[AVCVideoStreamConfig rxCodecType](self, "rxCodecType"))
    v6 = -[AVCVideoStreamConfig rxCodecType](self, "rxCodecType") != 1;
  else
    v6 = 0;
  if (a3 == 2)
  {
    if (v5 || v6)
      goto LABEL_17;
  }
  else if (!+[AVCVideoStreamConfig isPixelFormatValid:hdrMode:](AVCVideoStreamConfig, "isPixelFormatValid:hdrMode:", -[AVCVideoStreamConfig pixelFormat](self, "pixelFormat"), -[AVCVideoStreamConfig hdrMode](self, "hdrMode"))|| v5|| v6)
  {
    goto LABEL_17;
  }
  v7 = -[AVCVideoStreamConfig framerate](self, "framerate");
  if (!v7)
    return v7;
  v7 = -[AVCVideoStreamConfig tilesPerFrame](self, "tilesPerFrame");
  if (!v7)
    return v7;
  if (-[AVCVideoStreamConfig tilesPerFrame](self, "tilesPerFrame") > 8)
  {
LABEL_17:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (-[AVCVideoStreamConfig enableCVO](self, "enableCVO"))
  {
    v7 = -[AVCVideoStreamConfig cvoExtensionID](self, "cvoExtensionID");
    if (v7)
      LOBYTE(v7) = -[AVCVideoStreamConfig cvoExtensionID](self, "cvoExtensionID") < 0xF;
  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

+ (int64_t)codecTypeWithClientCodecType:(int64_t)a3
{
  int64_t v3;

  v3 = 102;
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return v3;
  else
    return 100;
}

+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3
{
  return a3 == 102;
}

+ (int64_t)videoResolutionFromClientResolution:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xC)
    return 7;
  else
    return qword_1D9110FC0[a3 - 1];
}

+ (int64_t)clientVideoResolutionFromResolution:(int64_t)a3
{
  if ((unint64_t)(a3 - 6) > 0x15)
    return 0;
  else
    return qword_1D9111028[a3 - 6];
}

+ (int64_t)clientVideoCaptureSourceFromCaptureSource:(int)a3
{
  if ((a3 - 1) > 5)
    return 2;
  else
    return qword_1D91110D8[a3 - 1];
}

+ (int)videoCaptureSourceFromClientCaptureSource:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  else
    return dword_1D9111160[a3];
}

+ (int64_t)clientVideoStreamModeFromVideoStreamType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return qword_1D9111108[a3 - 1];
}

+ (int64_t)videoStreamTypeFromClientVideoStreamMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return qword_1D9111138[a3 - 1];
}

- (void)setUpWithDictionary:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;
  NSString *v8;

  self->_txCodecType = +[AVCVideoStreamConfig clientCodecTypeWithCodecType:](AVCVideoStreamConfig, "clientCodecTypeWithCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTXCodecType")), "integerValue"));
  self->_rxCodecType = +[AVCVideoStreamConfig clientCodecTypeWithCodecType:](AVCVideoStreamConfig, "clientCodecTypeWithCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRXCodecType")), "integerValue"));
  self->_videoResolution = +[AVCVideoStreamConfig clientVideoResolutionFromResolution:](AVCVideoStreamConfig, "clientVideoResolutionFromResolution:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamVideoResolution")), "integerValue"));
  self->_synchronizationSourceStreamToken = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSyncStreamToken")), "integerValue");
  self->_framerate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamFramerate")), "integerValue");
  self->_txMaxBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTXMaxBitrate")), "integerValue");
  self->_txMinBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTXMinBitrate")), "integerValue");
  self->_rxMaxBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRXMaxBitrate")), "integerValue");
  self->_rxMinBitrate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRXMinBitrate")), "integerValue");
  self->_txCodecFeatureListString = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTxCodecFeatureListString"));
  self->_rxCodecFeatureListString = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRxCodecFeatureListString"));
  self->_keyFrameInterval = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamKeyFrameInterval")), "integerValue");
  self->_remoteVideoInitialOrientation = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRemoteVideoInitialOrientation")), "integerValue");
  self->_enableCVO = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamEnableCVO")), "BOOLValue");
  self->_cvoExtensionID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCVOExtensionID")), "unsignedIntegerValue");
  self->_isVideoProtected = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamIsVideoProtected")), "BOOLValue");
  self->_videoStreamMode = +[AVCVideoStreamConfig clientVideoStreamModeFromVideoStreamType:](AVCVideoStreamConfig, "clientVideoStreamModeFromVideoStreamType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamVideoStreamMode")), "integerValue"));
  self->_captureSource = +[AVCVideoStreamConfig clientVideoCaptureSourceFromCaptureSource:](AVCVideoStreamConfig, "clientVideoCaptureSourceFromCaptureSource:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCaptureSource")), "integerValue"));
  self->_captureSourceID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCaptureSourceID")), "integerValue");
  self->_screenDisplayID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDisplayID")), "unsignedIntegerValue");
  self->_tilesPerFrame = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTilesPerFrame")), "integerValue");
  self->_pixelFormat = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamPixelFormat")), "unsignedIntegerValue");
  self->_ltrpEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamIsltrpEnabled")), "BOOLValue");
  if (self->_videoResolution == 12)
  {
    self->_customWidth = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCustomWidth")), "integerValue");
    self->_customHeight = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCustomHeight")), "integerValue");
  }
  self->_hdrMode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamHDRMode")), "integerValue");
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcRemoteDeviceName"));
  if ((objc_msgSend(v5, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) != 0)
    v6 = 0;
  else
    v6 = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcRemoteDeviceName"));
  self->_remoteDeviceName = v6;
  self->_latencySensitiveModeEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamLatencySensitiveMode")), "BOOLValue");
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamProfileLevel"));
  if ((objc_msgSend(v7, "isEqual:", objc_msgSend(MEMORY[0x1E0C99E38], "null")) & 1) != 0)
    v8 = 0;
  else
    v8 = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamProfileLevel"));
  self->_profileLevel = v8;
  self->_fecEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamIsFECEnabled")), "BOOLValue");
  self->_rtxEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamIsRTXEnabled")), "BOOLValue");
  self->_transportProtocolType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTransportProtocolType")), "integerValue");
  self->_shouldSendBlackFramesOnClearScreen = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamShouldSendBlackFramesOnClearScreen")), "BOOLValue");
}

- (id)dictionary
{
  uint64_t v3;
  NSObject *v4;
  unsigned int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSString *remoteDeviceName;
  NSString *profileLevel;
  _QWORD v13[32];
  _QWORD v14[9];
  __int128 v15;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSString *v31;
  NSString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("force444"), 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v38 = v3;
        v39 = 2080;
        v40 = "-[AVCVideoStreamConfig dictionary]";
        v41 = 1024;
        v42 = 1275;
        v43 = 2112;
        v44 = CFSTR("force444");
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ set. Setting _pixelFormat to 444f", buf, 0x26u);
      }
    }
    v5 = 875836518;
  }
  else if (+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("force444-10bit"), 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v38 = v6;
        v39 = 2080;
        v40 = "-[AVCVideoStreamConfig dictionary]";
        v41 = 1024;
        v42 = 1278;
        v43 = 2112;
        v44 = CFSTR("force444-10bit");
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d [%@] set. Setting _pixelFormat to 444f 10-bit", buf, 0x26u);
      }
    }
    v5 = 2019963956;
  }
  else
  {
    if (!+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("force420"), 0))goto LABEL_17;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v38 = v8;
        v39 = 2080;
        v40 = "-[AVCVideoStreamConfig dictionary]";
        v41 = 1024;
        v42 = 1281;
        v43 = 2112;
        v44 = CFSTR("force420");
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@ set. Setting _pixelFormat to 420f", buf, 0x26u);
      }
    }
    v5 = 875704422;
  }
  self->_pixelFormat = v5;
LABEL_17:
  v14[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AVCVideoStreamConfig codecTypeWithClientCodecType:](AVCVideoStreamConfig, "codecTypeWithClientCodecType:", self->_txCodecType, CFSTR("vcMediaStreamTXCodecType")));
  v13[1] = CFSTR("vcMediaStreamRXCodecType");
  v14[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AVCVideoStreamConfig codecTypeWithClientCodecType:](AVCVideoStreamConfig, "codecTypeWithClientCodecType:", self->_rxCodecType));
  v13[2] = CFSTR("vcMediaStreamVideoResolution");
  v14[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AVCVideoStreamConfig videoResolutionFromClientResolution:](AVCVideoStreamConfig, "videoResolutionFromClientResolution:", self->_videoResolution));
  v13[3] = CFSTR("vcMediaStreamSyncStreamToken");
  v14[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_synchronizationSourceStreamToken);
  v13[4] = CFSTR("vcMediaStreamFramerate");
  v14[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_framerate);
  v13[5] = CFSTR("vcMediaStreamTXMaxBitrate");
  v14[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_txMaxBitrate);
  v13[6] = CFSTR("vcMediaStreamTXMinBitrate");
  v14[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_txMinBitrate);
  v13[7] = CFSTR("vcMediaStreamRXMaxBitrate");
  v14[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_rxMaxBitrate);
  v13[8] = CFSTR("vcMediaStreamRXMinBitrate");
  v14[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_rxMinBitrate);
  v13[9] = CFSTR("vcMediaStreamTxCodecFeatureListString");
  v13[10] = CFSTR("vcMediaStreamRxCodecFeatureListString");
  v15 = *(_OWORD *)&self->_txCodecFeatureListString;
  v13[11] = CFSTR("vcMediaStreamKeyFrameInterval");
  v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_keyFrameInterval);
  v13[12] = CFSTR("vcMediaStreamRemoteVideoInitialOrientation");
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_remoteVideoInitialOrientation);
  v13[13] = CFSTR("vcMediaStreamEnableCVO");
  v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableCVO);
  v13[14] = CFSTR("vcMediaStreamCVOExtensionID");
  v19 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cvoExtensionID);
  v13[15] = CFSTR("vcMediaStreamIsVideoProtected");
  v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isVideoProtected);
  v13[16] = CFSTR("vcMediaStreamVideoStreamMode");
  v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AVCVideoStreamConfig videoStreamTypeFromClientVideoStreamMode:](AVCVideoStreamConfig, "videoStreamTypeFromClientVideoStreamMode:", self->_videoStreamMode));
  v13[17] = CFSTR("vcMediaStreamCaptureSource");
  v22 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", +[AVCVideoStreamConfig videoCaptureSourceFromClientCaptureSource:](AVCVideoStreamConfig, "videoCaptureSourceFromClientCaptureSource:", self->_captureSource));
  v13[18] = CFSTR("vcMediaStreamCaptureSourceID");
  v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_captureSourceID);
  v13[19] = CFSTR("vcMediaStreamDisplayID");
  v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_screenDisplayID);
  v13[20] = CFSTR("vcMediaStreamCustomWidth");
  v25 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_customWidth);
  v13[21] = CFSTR("vcMediaStreamCustomHeight");
  v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_customHeight);
  v13[22] = CFSTR("vcMediaStreamTilesPerFrame");
  v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_tilesPerFrame);
  v13[23] = CFSTR("vcMediaStreamPixelFormat");
  v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_pixelFormat);
  v13[24] = CFSTR("vcMediaStreamIsltrpEnabled");
  v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_ltrpEnabled);
  v13[25] = CFSTR("vcMediaStreamHDRMode");
  v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_hdrMode);
  v13[26] = CFSTR("vcRemoteDeviceName");
  remoteDeviceName = self->_remoteDeviceName;
  if (!remoteDeviceName)
    remoteDeviceName = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v31 = remoteDeviceName;
  v13[27] = CFSTR("vcMediaStreamProfileLevel");
  profileLevel = self->_profileLevel;
  if (!profileLevel)
    profileLevel = (NSString *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v32 = profileLevel;
  v13[28] = CFSTR("vcMediaStreamIsFECEnabled");
  v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_fecEnabled);
  v13[29] = CFSTR("vcMediaStreamIsRTXEnabled");
  v34 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_rtxEnabled);
  v13[30] = CFSTR("vcMediaStreamTransportProtocolType");
  v35 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_transportProtocolType);
  v13[31] = CFSTR("vcMediaStreamShouldSendBlackFramesOnClearScreen");
  v36 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldSendBlackFramesOnClearScreen);
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 32);
}

+ (BOOL)isPixelFormatValid:(unsigned int)a3 hdrMode:(unint64_t)a4
{
  int v4;
  BOOL v5;
  _BOOL4 v6;

  if ((int)a3 <= 875836533)
  {
    if (a3 == 875704422 || a3 == 875704438)
      goto LABEL_9;
    v4 = 875836518;
  }
  else
  {
    if ((int)a3 > 2016686639)
    {
      if (a3 == 2016686640)
      {
        LOBYTE(v6) = a4 - 1 < 2;
        return v6;
      }
      if (a3 == 2019963956)
      {
        v5 = (a4 & 0xFFFFFFFFFFFFFFFDLL) == 1;
LABEL_10:
        LOBYTE(v6) = v5;
        return v6;
      }
      goto LABEL_17;
    }
    if (a3 == 875836534)
    {
LABEL_9:
      v5 = a4 == 0;
      goto LABEL_10;
    }
    v4 = 1751411059;
  }
  if (a3 == v4)
    goto LABEL_9;
LABEL_17:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v6)
      return v6;
    +[AVCVideoStreamConfig isPixelFormatValid:hdrMode:].cold.1();
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (int64_t)txCodecType
{
  return self->_txCodecType;
}

- (void)setTxCodecType:(int64_t)a3
{
  self->_txCodecType = a3;
}

- (int64_t)rxCodecType
{
  return self->_rxCodecType;
}

- (void)setRxCodecType:(int64_t)a3
{
  self->_rxCodecType = a3;
}

- (int64_t)videoResolution
{
  return self->_videoResolution;
}

- (void)setVideoResolution:(int64_t)a3
{
  self->_videoResolution = a3;
}

- (int64_t)synchronizationSourceStreamToken
{
  return self->_synchronizationSourceStreamToken;
}

- (void)setSynchronizationSourceStreamToken:(int64_t)a3
{
  self->_synchronizationSourceStreamToken = a3;
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

- (unint64_t)rxMaxBitrate
{
  return self->_rxMaxBitrate;
}

- (void)setRxMaxBitrate:(unint64_t)a3
{
  self->_rxMaxBitrate = a3;
}

- (unint64_t)rxMinBitrate
{
  return self->_rxMinBitrate;
}

- (void)setRxMinBitrate:(unint64_t)a3
{
  self->_rxMinBitrate = a3;
}

- (NSString)txCodecFeatureListString
{
  return self->_txCodecFeatureListString;
}

- (void)setTxCodecFeatureListString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)rxCodecFeatureListString
{
  return self->_rxCodecFeatureListString;
}

- (void)setRxCodecFeatureListString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
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

- (int64_t)videoStreamMode
{
  return self->_videoStreamMode;
}

- (void)setVideoStreamMode:(int64_t)a3
{
  self->_videoStreamMode = a3;
}

- (int64_t)captureSource
{
  return self->_captureSource;
}

- (void)setCaptureSource:(int64_t)a3
{
  self->_captureSource = a3;
}

- (int64_t)captureSourceID
{
  return self->_captureSourceID;
}

- (void)setCaptureSourceID:(int64_t)a3
{
  self->_captureSourceID = a3;
}

- (unint64_t)screenDisplayID
{
  return self->_screenDisplayID;
}

- (void)setScreenDisplayID:(unint64_t)a3
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

- (unint64_t)tilesPerFrame
{
  return self->_tilesPerFrame;
}

- (void)setTilesPerFrame:(unint64_t)a3
{
  self->_tilesPerFrame = a3;
}

- (unsigned)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unsigned int)a3
{
  self->_pixelFormat = a3;
}

- (BOOL)isLTRPEnabled
{
  return self->_ltrpEnabled;
}

- (void)setLtrpEnabled:(BOOL)a3
{
  self->_ltrpEnabled = a3;
}

- (unint64_t)hdrMode
{
  return self->_hdrMode;
}

- (void)setHdrMode:(unint64_t)a3
{
  self->_hdrMode = a3;
}

- (NSString)remoteDeviceName
{
  return self->_remoteDeviceName;
}

- (void)setRemoteDeviceName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (BOOL)isLatencySensitiveModeEnabled
{
  return self->_latencySensitiveModeEnabled;
}

- (void)setLatencySensitiveModeEnabled:(BOOL)a3
{
  self->_latencySensitiveModeEnabled = a3;
}

- (NSString)profileLevel
{
  return self->_profileLevel;
}

- (void)setProfileLevel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (BOOL)isFECEnabled
{
  return self->_fecEnabled;
}

- (void)setFecEnabled:(BOOL)a3
{
  self->_fecEnabled = a3;
}

- (BOOL)isRTXEnabled
{
  return self->_rtxEnabled;
}

- (void)setRtxEnabled:(BOOL)a3
{
  self->_rtxEnabled = a3;
}

- (int64_t)transportProtocolType
{
  return self->_transportProtocolType;
}

- (void)setTransportProtocolType:(int64_t)a3
{
  self->_transportProtocolType = a3;
}

- (BOOL)shouldSendBlackFramesOnClearScreen
{
  return self->_shouldSendBlackFramesOnClearScreen;
}

- (void)setShouldSendBlackFramesOnClearScreen:(BOOL)a3
{
  self->_shouldSendBlackFramesOnClearScreen = a3;
}

+ (void)isPixelFormatValid:hdrMode:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v4 = 1336;
  v5 = v0;
  v6 = 1336;
  v7 = v0;
  v8 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/AVCMediaStreamConfig.m:%d: Unexpected pixel format type: %d", v3, 0x28u);
  OUTLINED_FUNCTION_3();
}

@end
