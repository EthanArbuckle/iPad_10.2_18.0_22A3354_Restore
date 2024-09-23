@implementation AVCMediaStreamNegotiator

+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3
{
  return a3 == 102;
}

+ (int64_t)clientAccessNetworkType:(int)a3
{
  if (a3 == 1)
    return 1;
  if (a3 == 2)
    return 2;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[AVCMediaStreamNegotiator(utils) clientAccessNetworkType:].cold.1();
  }
  return 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCMediaStreamNegotiator;
  -[AVCMediaStreamNegotiator dealloc](&v3, sel_dealloc);
}

- (BOOL)initNegotiatorLocalConfiguration:(id *)a3 options:(id)a4
{
  VCBitrateArbiter *v7;
  VCMediaNegotiatorLocalConfiguration *v8;
  AVCMediaStreamNegotiatorSettings *v9;
  NSDictionary *v10;
  VCMediaNegotiatorVideoConfiguration *v11;
  VCMediaNegotiatorVideoConfiguration *v12;
  uint64_t v13;
  int64_t videoWidth;
  int64_t videoHeight;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  VCMediaNegotiator *v21;
  BOOL v22;
  __CFString *v24;

  -[AVCMediaStreamNegotiator refreshLoggingParameters](self, "refreshLoggingParameters");
  v7 = -[VCBitrateArbiter initWithDeviceRole:callLogFile:]([VCBitrateArbiter alloc], "initWithDeviceRole:callLogFile:", 0, 0);
  if (!v7)
  {
    v10 = 0;
    v12 = 0;
    v8 = 0;
    v22 = 0;
    self->_errorDetailCode = 7;
    v24 = CFSTR("Failed to create bitRateArbiter");
LABEL_35:
    *a3 = v24;
    goto LABEL_19;
  }
  v8 = -[VCMediaNegotiatorLocalConfiguration initWithBitrateArbiter:]([VCMediaNegotiatorLocalConfiguration alloc], "initWithBitrateArbiter:", v7);
  if (!v8)
  {
    v10 = 0;
    v12 = 0;
    v22 = 0;
    self->_errorDetailCode = 7;
    v24 = CFSTR("Failed to create local config object");
    goto LABEL_35;
  }
  v9 = (AVCMediaStreamNegotiatorSettings *)+[AVCMediaStreamNegotiatorSettings negotiatorSettingsForMode:deviceRole:options:errorString:](AVCMediaStreamNegotiatorSettings, "negotiatorSettingsForMode:deviceRole:options:errorString:", self->_mediaStreamMode, self->_deviceRole, a4, a3);
  self->_negotiatorSettings = v9;
  if (!v9)
  {
    v10 = 0;
    v12 = 0;
    v22 = 0;
    self->_errorDetailCode = 7;
    goto LABEL_19;
  }
  v10 = -[AVCMediaStreamNegotiatorSettings featureListString](v9, "featureListString");
  if (!v10)
  {
    v12 = 0;
    v22 = 0;
    self->_errorDetailCode = 3;
    v24 = CFSTR("Failed to create local feature string for media negotiator");
    goto LABEL_35;
  }
  v11 = objc_alloc_init(VCMediaNegotiatorVideoConfiguration);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMediaStreamNegotiator initNegotiatorLocalConfiguration:options:].cold.1();
    }
    v10 = 0;
    v12 = 0;
    goto LABEL_33;
  }
  v12 = v11;
  if (-[AVCMediaStreamNegotiatorSettings videoRuleCollections](self->_negotiatorSettings, "videoRuleCollections"))
    v13 = -[AVCMediaStreamNegotiatorSettings localSSRC](self->_negotiatorSettings, "localSSRC");
  else
    v13 = 0;
  -[VCMediaNegotiatorCommonConfiguration setSsrc:](v12, "setSsrc:", v13);
  -[VCMediaNegotiatorLocalConfiguration setMediaConfiguration:forMediaType:](v8, "setMediaConfiguration:forMediaType:", -[AVCMediaStreamNegotiatorSettings audioConfiguration](self->_negotiatorSettings, "audioConfiguration"), 1);
  -[VCMediaNegotiatorLocalConfiguration setPreferredAudioCodec:](v8, "setPreferredAudioCodec:", -[AVCMediaStreamNegotiatorSettings preferredAudioCodec](self->_negotiatorSettings, "preferredAudioCodec"));
  -[VCMediaNegotiatorVideoConfiguration setVideoRuleCollections:](v12, "setVideoRuleCollections:", -[AVCMediaStreamNegotiatorSettings videoRuleCollections](self->_negotiatorSettings, "videoRuleCollections"));
  -[VCMediaNegotiatorLocalConfiguration setAccessNetworkType:](v8, "setAccessNetworkType:", -[AVCMediaStreamNegotiatorSettings accessNetworkType](self->_negotiatorSettings, "accessNetworkType"));
  -[VCMediaNegotiatorVideoConfiguration setVideoFeatureStrings:](v12, "setVideoFeatureStrings:", v10);
  -[VCMediaNegotiatorLocalConfiguration setAllowRTCPFB:](v8, "setAllowRTCPFB:", 0);
  -[VCMediaNegotiatorLocalConfiguration setIsCaller:](v8, "setIsCaller:", self->_deviceRole == 1);
  -[VCMediaNegotiatorLocalConfiguration setCallLogFile:](v8, "setCallLogFile:", 0);
  -[VCMediaNegotiatorLocalConfiguration setBasebandCodec:](v8, "setBasebandCodec:", 0);
  -[VCMediaNegotiatorLocalConfiguration setBasebandCodecSampleRate:](v8, "setBasebandCodecSampleRate:", 0);
  videoHeight = self->_videoHeight;
  videoWidth = self->_videoWidth;
  if (-[AVCMediaStreamNegotiatorSettings shouldApply16AlignedAdjustment](self->_negotiatorSettings, "shouldApply16AlignedAdjustment"))
  {
    +[VideoUtil compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:](VideoUtil, "compute16AlignedResolutionForNativeWidth:nativeHeight:maxScreenPixelCount:maxScreenEncodingSizeSupported:", LODWORD(self->_videoWidth), LODWORD(self->_videoHeight), 5603328, 5603328);
    v18 = v17;
  }
  else
  {
    v16 = (double)videoWidth;
    v18 = (double)videoHeight;
  }
  -[VCMediaNegotiatorLocalConfiguration setCustomVideoWidth:](v8, "setCustomVideoWidth:", LODWORD(self->_dpiFactor) * (uint64_t)v16);
  -[VCMediaNegotiatorLocalConfiguration setCustomVideoHeight:](v8, "setCustomVideoHeight:", LODWORD(self->_dpiFactor) * (uint64_t)v18);
  -[VCMediaNegotiatorLocalConfiguration setTilesPerVideoFrame:](v8, "setTilesPerVideoFrame:", -[AVCMediaStreamNegotiatorSettings tilesPerFrame](self->_negotiatorSettings, "tilesPerFrame"));
  -[VCMediaNegotiatorLocalConfiguration setLtrpEnabled:](v8, "setLtrpEnabled:", 1);
  -[VCMediaNegotiatorLocalConfiguration setPixelFormats:](v8, "setPixelFormats:", -[AVCMediaStreamNegotiator supportedPixelFormats](self, "supportedPixelFormats"));
  -[VCMediaNegotiatorLocalConfiguration setFecEnabled:](v8, "setFecEnabled:", -[AVCMediaStreamNegotiatorSettings accessNetworkType](self->_negotiatorSettings, "accessNetworkType") == 2);
  -[VCMediaNegotiatorLocalConfiguration setRtxEnabled:](v8, "setRtxEnabled:", 0);
  -[VCMediaNegotiatorLocalConfiguration setBlackFrameOnClearScreenEnabledDefault:](v8, "setBlackFrameOnClearScreenEnabledDefault:", -[AVCMediaStreamNegotiatorSettings blackFrameOnClearScreenEnabledDefault](self->_negotiatorSettings, "blackFrameOnClearScreenEnabledDefault"));
  -[VCMediaNegotiatorLocalConfiguration setBlackFrameOnClearScreenEnabled:](v8, "setBlackFrameOnClearScreenEnabled:", -[AVCMediaStreamNegotiatorSettings blackFrameOnClearScreenEnabled](self->_negotiatorSettings, "blackFrameOnClearScreenEnabled"));
  -[AVCMediaStreamNegotiator addHDRModeSpecificSettings:](self, "addHDRModeSpecificSettings:", v8);
  if (!-[VCMediaNegotiatorLocalConfiguration pixelFormats](v8, "pixelFormats"))
  {
    v10 = 0;
    v22 = 0;
    self->_errorDetailCode = 7;
    v24 = CFSTR("Failed to obtain pixelFormat set");
    goto LABEL_35;
  }
  v19 = -[VCMediaNegotiatorVideoConfiguration copy](v12, "copy");
  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMediaStreamNegotiator initNegotiatorLocalConfiguration:options:].cold.2();
    }
    v10 = 0;
LABEL_33:
    v22 = 0;
    goto LABEL_19;
  }
  v10 = (NSDictionary *)v19;
  if (-[AVCMediaStreamNegotiatorSettings screenRuleCollections](self->_negotiatorSettings, "screenRuleCollections"))
    v20 = -[AVCMediaStreamNegotiatorSettings localSSRC](self->_negotiatorSettings, "localSSRC");
  else
    v20 = 0;
  -[NSDictionary setSsrc:](v10, "setSsrc:", v20);
  -[NSDictionary setVideoRuleCollections:](v10, "setVideoRuleCollections:", -[AVCMediaStreamNegotiatorSettings screenRuleCollections](self->_negotiatorSettings, "screenRuleCollections"));
  -[VCMediaNegotiatorLocalConfiguration setMediaConfiguration:forMediaType:](v8, "setMediaConfiguration:forMediaType:", v12, 2);
  -[VCMediaNegotiatorLocalConfiguration setMediaConfiguration:forMediaType:](v8, "setMediaConfiguration:forMediaType:", v10, 3);
  v21 = -[VCMediaNegotiator initWithMode:localSettings:]([VCMediaNegotiator alloc], "initWithMode:localSettings:", self->_mediaStreamMode, v8);
  self->_mediaNegotiator = v21;
  if (!v21)
  {
    v22 = 0;
    self->_errorDetailCode = 2;
    v24 = CFSTR("Failed to create VCMediaNegotiator");
    goto LABEL_35;
  }
  v22 = 1;
LABEL_19:

  return v22;
}

- (id)supportedPixelFormats
{
  return -[VCHardwareSettings pixelFormatCollections](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "pixelFormatCollections");
}

- (void)addHDRModeSpecificSettings:(id)a3
{
  NSArray *v5;

  v5 = -[AVCMediaStreamNegotiatorSettings hdrModePixelFormats](self->_negotiatorSettings, "hdrModePixelFormats");
  if (v5)
    objc_msgSend(a3, "setPixelFormats:", objc_msgSend((id)objc_msgSend(a3, "pixelFormats"), "setByAddingObjectsFromArray:", v5));
  if (-[AVCMediaStreamNegotiatorSettings hdrModesSupported](self->_negotiatorSettings, "hdrModesSupported"))
    objc_msgSend(a3, "setHdrModesSupported:", -[AVCMediaStreamNegotiatorSettings hdrModesSupported](self->_negotiatorSettings, "hdrModesSupported"));
}

- (AVCMediaStreamNegotiator)initWithMode:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v9;
  NSObject *v10;
  id v11;
  AVCMediaStreamNegotiator *v12;
  AVCMediaStreamNegotiator *v13;
  NSData *v14;
  uint64_t errorDetailCode;
  objc_super v17;
  _BYTE buf[12];
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *a5;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v9;
      v19 = 2080;
      v20 = "-[AVCMediaStreamNegotiator initWithMode:options:error:]";
      v21 = 1024;
      v22 = 226;
      v23 = 2048;
      v24 = a3;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%ld, error=%@", buf, 0x30u);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)AVCMediaStreamNegotiator;
  v12 = -[AVCMediaStreamNegotiator init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    *(_QWORD *)buf = 0;
    v12->_deviceRole = 1;
    v12->_mediaStreamMode = a3;
    *(_OWORD *)&v12->_videoHDRMode = 0u;
    *(_OWORD *)&v12->_mediaStreamAccessNetworkType = 0u;
    if (a4)
      -[AVCMediaStreamNegotiator processOffererInitOptions:errorReason:](v12, "processOffererInitOptions:errorReason:", a4, buf);
    if (-[AVCMediaStreamNegotiator initNegotiatorLocalConfiguration:options:](v13, "initNegotiatorLocalConfiguration:options:", buf, a4))
    {
      v14 = (NSData *)-[VCMediaNegotiator negotiationData](v13->_mediaNegotiator, "negotiationData");
      v13->_mediaBlobCompressed = v14;
      if (v14)
      {
        if (-[AVCMediaStreamNegotiator createOffer](v13, "createOffer"))
          return v13;
        *(_QWORD *)buf = CFSTR("Failed to create offerer dictionary with media blob");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if ((VRTraceIsOSFaultDisabled() & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCMediaStreamNegotiator initWithMode:options:error:].cold.3();
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
          {
            -[AVCMediaStreamNegotiator initWithMode:options:error:].cold.4();
          }
        }
      }
      else
      {
        *(_QWORD *)buf = CFSTR("Failed to create the offerer media blob");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if ((VRTraceIsOSFaultDisabled() & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCMediaStreamNegotiator initWithMode:options:error:].cold.1();
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
          {
            -[AVCMediaStreamNegotiator initWithMode:options:error:].cold.2();
          }
        }
      }
      errorDetailCode = 3;
    }
    else
    {
      errorDetailCode = v13->_errorDetailCode;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCMediaStreamNegotiator initWithMode:options:error:].cold.5();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator initWithMode:options:error:].cold.6();
        }
      }
    }
    if (a5 && !*a5)
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32032, errorDetailCode, 0, 0, *(_QWORD *)buf);

    return 0;
  }
  return v13;
}

- (AVCMediaStreamNegotiator)initWithMode:(int64_t)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *a4;
      v11 = 136316162;
      v12 = v7;
      v13 = 2080;
      v14 = "-[AVCMediaStreamNegotiator initWithMode:error:]";
      v15 = 1024;
      v16 = 269;
      v17 = 2048;
      v18 = a3;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d mode=%ld, error=%@", (uint8_t *)&v11, 0x30u);
    }
  }
  return -[AVCMediaStreamNegotiator initWithMode:options:error:](self, "initWithMode:options:error:", a3, 0, a4);
}

- (void)processOffererInitOptions:(id)a3 errorReason:(id *)a4
{
  if (objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorHDRMode"), a4))
    self->_videoHDRMode = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorHDRMode")), "intValue");
  if (objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorTransportType")))
    self->_mediaStreamTransportType = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorTransportType")), "intValue");
  if (objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorTransportProtocolType")))
    self->_mediaStreamTransportProtocolType = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorTransportProtocolType")), "intValue");
}

- (BOOL)createOffer
{
  void *v2;
  const __CFUUID *v3;
  id v5;
  const __CFAllocator *v6;
  __CFString *v7;
  NSData *v8;
  BOOL v9;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  AVCMediaStreamNegotiator *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v5)
  {
    if ((AVCMediaStreamNegotiator *)objc_opt_class() == self)
      -[AVCMediaStreamNegotiator createOffer].cold.1((uint64_t)&v19);
    -[AVCMediaStreamNegotiator createOffer].cold.2();
    goto LABEL_19;
  }
  v2 = v5;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (!v3)
  {
    if ((AVCMediaStreamNegotiator *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[AVCMediaStreamNegotiator performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_39;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      v19 = 136316162;
      v20 = v14;
      v21 = 2080;
      v22 = "-[AVCMediaStreamNegotiator createOffer]";
      v23 = 1024;
      v24 = 296;
      v25 = 2112;
      v26 = v11;
      v27 = 2048;
      v28 = self;
      v16 = " [%s] %s:%d %@(%p) uuid generation failed";
      goto LABEL_41;
    }
LABEL_19:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMediaStreamNegotiator createOffer].cold.3();
    }
    goto LABEL_39;
  }
  v7 = (__CFString *)CFUUIDCreateString(v6, v3);
  self->_dataSessionID = &v7->isa;
  if (!v7)
  {
    if ((AVCMediaStreamNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMediaStreamNegotiator createOffer].cold.4();
      }
      goto LABEL_39;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[AVCMediaStreamNegotiator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_39;
    v17 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    v19 = 136316162;
    v20 = v17;
    v21 = 2080;
    v22 = "-[AVCMediaStreamNegotiator createOffer]";
    v23 = 1024;
    v24 = 299;
    v25 = 2112;
    v26 = v12;
    v27 = 2048;
    v28 = self;
    v16 = " [%s] %s:%d %@(%p) could not generate dataSessionID";
    goto LABEL_41;
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("avcMediaStreamOptionCallID"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", self->_mediaBlobCompressed, CFSTR("avcMediaStreamNegotiatorMediaBlob"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mediaStreamMode), CFSTR("avcMediaStreamNegotiatorMode"));
  if (!-[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:](self, "addLocalCallInfoBlobToOutgoingDictionary:", v2))
  {
    if ((AVCMediaStreamNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMediaStreamNegotiator createOffer].cold.5();
      }
      goto LABEL_39;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[AVCMediaStreamNegotiator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v18 = VRTraceErrorLogLevelToCSTR(),
          v15 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_39:
      v9 = 0;
      goto LABEL_6;
    }
    v19 = 136316162;
    v20 = v18;
    v21 = 2080;
    v22 = "-[AVCMediaStreamNegotiator createOffer]";
    v23 = 1024;
    v24 = 305;
    v25 = 2112;
    v26 = v13;
    v27 = 2048;
    v28 = self;
    v16 = " [%s] %s:%d %@(%p) could not generate callInfoBlob on offerer";
LABEL_41:
    _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, 0x30u);
    goto LABEL_39;
  }
  v8 = (NSData *)(id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, 0);
  self->_offer = v8;
  v9 = v8 != 0;
LABEL_6:
  CFRelease(v3);

  return v9;
}

- (BOOL)processOfferWithError:(id *)a3 errorReason:(id *)a4
{
  NSData *v6;
  NSData *v7;
  __CFString *v8;

  v6 = (NSData *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", self->_offer, 0, 0, a3);
  if (!v6)
  {
    self->_errorDetailCode = 4;
    v8 = CFSTR("Failed to deserialize media blob on answerer");
LABEL_8:
    *a4 = v8;
    return (char)v6;
  }
  v7 = v6;
  self->_mediaStreamMode = (int)objc_msgSend((id)-[NSData objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("avcMediaStreamNegotiatorMode")), "intValue");
  self->_dataSessionID = (NSString *)(id)-[NSData objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionCallID"));
  v6 = (NSData *)(id)-[NSData objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("avcMediaStreamNegotiatorMediaBlob"));
  self->_mediaBlobCompressed = v6;
  if (!v6)
  {
    self->_errorDetailCode = 4;
    v8 = CFSTR("Failed to extract incoming media blob on answerer");
    goto LABEL_8;
  }
  if (-[NSData objectForKey:](v7, "objectForKey:", CFSTR("avcMediaStreamOptionRemoteEndpointInfo")))
    self->_remoteCallInfoBlob = (NSData *)(id)-[NSData objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRemoteEndpointInfo"));
  LOBYTE(v6) = 1;
  return (char)v6;
}

- (BOOL)processAnswererInitOptions:(id)a3 errorReason:(id *)a4
{
  void *v7;
  __CFString *v8;

  self->_dpiFactor = 1;
  if (objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorVideoWidth")))
  {
    v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorVideoWidth"));
    if (!v7)
    {
      self->_errorDetailCode = 7;
      v8 = CFSTR("cannot get video width from Init options");
      goto LABEL_20;
    }
    self->_videoWidth = (int)objc_msgSend(v7, "intValue");
  }
  if (objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorVideoHeight")))
  {
    v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorVideoHeight"));
    if (!v7)
    {
      self->_errorDetailCode = 7;
      v8 = CFSTR("cannot get video height from Init options");
      goto LABEL_20;
    }
    self->_videoHeight = (int)objc_msgSend(v7, "intValue");
  }
  if (objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorVideoResolution")))
  {
    v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorVideoResolution"));
    if (v7)
    {
      self->_dpiFactor = (int)objc_msgSend(v7, "intValue");
      goto LABEL_10;
    }
    self->_errorDetailCode = 7;
    v8 = CFSTR("cannot get DPI scaling facfor from Init options");
LABEL_20:
    *a4 = v8;
    return (char)v7;
  }
LABEL_10:
  if (objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorHDRMode")))
    self->_videoHDRMode = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorHDRMode")), "intValue");
  if (objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorTransportType")))
    self->_mediaStreamTransportType = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorTransportType")), "intValue");
  if (objc_msgSend(a3, "objectForKey:", CFSTR("AVCMediaStreamNegotiatorTransportProtocolType")))
    self->_mediaStreamTransportProtocolType = (int)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVCMediaStreamNegotiatorTransportProtocolType")), "intValue");
  LOBYTE(v7) = 1;
  return (char)v7;
}

- (AVCMediaStreamNegotiator)initWithOffer:(id)a3 error:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *a4;
      v11 = 136316162;
      v12 = v7;
      v13 = 2080;
      v14 = "-[AVCMediaStreamNegotiator initWithOffer:error:]";
      v15 = 1024;
      v16 = 380;
      v17 = 2112;
      v18 = a3;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d offer=%@, error=%@", (uint8_t *)&v11, 0x30u);
    }
  }
  return -[AVCMediaStreamNegotiator initWithOffer:options:error:](self, "initWithOffer:options:error:", a3, 0, a4);
}

- (AVCMediaStreamNegotiator)initWithOffer:(id)a3 options:(id)a4 error:(id *)a5
{
  const char *v9;
  const char *v10;
  const char *v11;
  char *v12;
  os_log_t *v13;
  uint64_t v14;
  NSObject *v15;
  AVCMediaStreamNegotiator *v16;
  AVCMediaStreamNegotiator *v17;
  uint64_t v18;
  uint64_t errorDetailCode;
  AVCMediaStreamNegotiator *v21;
  id *v22;
  objc_super v23;
  char *__lasts;
  char *__str;
  _BYTE buf[12];
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() < 6)
    goto LABEL_17;
  __str = 0;
  if (a3)
  {
    v9 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (a4)
    {
LABEL_4:
      v10 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      goto LABEL_7;
    }
  }
  else
  {
    v9 = "<nil>";
    if (a4)
      goto LABEL_4;
  }
  v10 = "<nil>";
LABEL_7:
  if (*a5)
    v11 = (const char *)objc_msgSend((id)objc_msgSend(*a5, "description"), "UTF8String");
  else
    v11 = "<nil>";
  asprintf(&__str, "offer=%s, options=%s, error=%s", v9, v10, v11);
  if (__str)
  {
    v21 = self;
    v22 = a5;
    __lasts = 0;
    v12 = strtok_r(__str, "\n", &__lasts);
    v13 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v14;
          v27 = 2080;
          v28 = "-[AVCMediaStreamNegotiator initWithOffer:options:error:]";
          v29 = 1024;
          v30 = 385;
          v31 = 2080;
          v32 = "";
          v33 = 2080;
          v34 = v12;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v12 = strtok_r(0, "\n", &__lasts);
    }
    while (v12);
    free(__str);
    a5 = v22;
    self = v21;
  }
LABEL_17:
  v23.receiver = self;
  v23.super_class = (Class)AVCMediaStreamNegotiator;
  v16 = -[AVCMediaStreamNegotiator init](&v23, sel_init);
  v17 = v16;
  if (v16)
  {
    *(_QWORD *)buf = 0;
    v16->_mediaStreamTransportType = 0;
    v16->_mediaStreamAccessNetworkType = 0;
    v16->_videoHDRMode = 0;
    v16->_deviceRole = 2;
    v16->_offer = (NSData *)a3;
    if (-[AVCMediaStreamNegotiator processOfferWithError:errorReason:](v17, "processOfferWithError:errorReason:", a5, buf))
    {
      if (a4
        && !-[AVCMediaStreamNegotiator processAnswererInitOptions:errorReason:](v17, "processAnswererInitOptions:errorReason:", a4, buf))
      {
        errorDetailCode = v17->_errorDetailCode;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if ((VRTraceIsOSFaultDisabled() & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.9();
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
          {
            -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.10();
          }
        }
      }
      else if (-[AVCMediaStreamNegotiator initNegotiatorLocalConfiguration:options:](v17, "initNegotiatorLocalConfiguration:options:", buf, a4))
      {
        if (-[VCMediaNegotiator processRemoteNegotiationData:](v17->_mediaNegotiator, "processRemoteNegotiationData:", v17->_mediaBlobCompressed))
        {
          v18 = -[VCMediaNegotiator newResponseBlob](v17->_mediaNegotiator, "newResponseBlob");
          v17->_mediaBlobNegotiated = (NSData *)v18;
          if (v18)
          {
            if (-[AVCMediaStreamNegotiator createAnswer](v17, "createAnswer"))
              return v17;
            *(_QWORD *)buf = CFSTR("Failed to create answer dictionary on answerer");
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if ((VRTraceIsOSFaultDisabled() & 1) != 0)
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.3();
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
              {
                -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.4();
              }
            }
            errorDetailCode = 7;
          }
          else
          {
            *(_QWORD *)buf = CFSTR("Failed to create the response media blob on answerer");
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if ((VRTraceIsOSFaultDisabled() & 1) != 0)
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.1();
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
              {
                -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.2();
              }
            }
            errorDetailCode = 3;
          }
        }
        else
        {
          *(_QWORD *)buf = CFSTR("Failed to process incoming blob on answerer");
          if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
          {
            VRTraceErrorLogLevelToCSTR();
            if ((VRTraceIsOSFaultDisabled() & 1) != 0)
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.5();
            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
            {
              -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.6();
            }
          }
          errorDetailCode = 4;
        }
      }
      else
      {
        errorDetailCode = v17->_errorDetailCode;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if ((VRTraceIsOSFaultDisabled() & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.7();
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
          {
            -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.8();
          }
        }
      }
    }
    else
    {
      errorDetailCode = v17->_errorDetailCode;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.11();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator initWithOffer:options:error:].cold.12();
        }
      }
    }
    if (a5 && !*a5)
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32033, errorDetailCode, 0, 0, *(_QWORD *)buf);

    return 0;
  }
  return v17;
}

- (BOOL)createAnswer
{
  id v3;
  void *v4;
  NSData *v5;
  BOOL v6;

  if (!self->_remoteCallInfoBlob)
  {
    v4 = 0;
    self->_answer = self->_mediaBlobNegotiated;
    v6 = 1;
    goto LABEL_6;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMediaStreamNegotiator createAnswer].cold.1();
    }
    v4 = 0;
    goto LABEL_14;
  }
  v4 = v3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_mediaBlobNegotiated, CFSTR("avcMediaStreamNegotiatorMediaBlob"));
  if (!-[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:](self, "addLocalCallInfoBlobToOutgoingDictionary:", v4))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMediaStreamNegotiator createAnswer].cold.2();
    }
LABEL_14:
    v6 = 0;
    goto LABEL_6;
  }
  v5 = (NSData *)(id)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);
  self->_answer = v5;
  v6 = v5 != 0;
LABEL_6:

  return v6;
}

- (BOOL)processAnswerWithError:(id *)a3 errorReason:(id *)a4
{
  void *v6;
  void *v7;
  NSData *v8;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", self->_answer, 0, 0, a3);
  if (v6)
  {
    v7 = v6;
    v8 = (NSData *)(id)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("avcMediaStreamNegotiatorMediaBlob"));
    self->_mediaBlobNegotiated = v8;
    if (!v8)
    {
      self->_errorDetailCode = 4;
      *a4 = CFSTR("Failed to extract negotiated media blob on offerer");
      return (char)v8;
    }
    if (objc_msgSend(v7, "objectForKey:", CFSTR("avcMediaStreamOptionRemoteEndpointInfo")))
      self->_remoteCallInfoBlob = (NSData *)(id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("avcMediaStreamOptionRemoteEndpointInfo"));
  }
  else
  {
    self->_mediaBlobNegotiated = self->_answer;
  }
  LOBYTE(v8) = 1;
  return (char)v8;
}

- (BOOL)setAnswer:(id)a3 withError:(id *)a4
{
  uint64_t v7;
  NSObject *v8;
  id v9;
  int64_t errorDetailCode;
  _BYTE v12[12];
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *a4;
      *(_DWORD *)v12 = 136316162;
      *(_QWORD *)&v12[4] = v7;
      v13 = 2080;
      v14 = "-[AVCMediaStreamNegotiator setAnswer:withError:]";
      v15 = 1024;
      v16 = 482;
      v17 = 2112;
      v18 = a3;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d answer=%@, error=%@", v12, 0x30u);
    }
  }
  *(_QWORD *)v12 = 0;
  if (self->_deviceRole == 2)
  {
    *(_QWORD *)v12 = CFSTR("Can't set answer blob on answerer");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMediaStreamNegotiator setAnswer:withError:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[AVCMediaStreamNegotiator setAnswer:withError:].cold.2();
      }
    }
    errorDetailCode = 1;
  }
  else if (a3)
  {

    self->_answer = (NSData *)a3;
    if (-[AVCMediaStreamNegotiator processAnswerWithError:errorReason:](self, "processAnswerWithError:errorReason:", a4, v12))
    {
      return 1;
    }
    errorDetailCode = self->_errorDetailCode;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMediaStreamNegotiator setAnswer:withError:].cold.5();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[AVCMediaStreamNegotiator setAnswer:withError:].cold.6();
      }
    }
  }
  else
  {
    *(_QWORD *)v12 = CFSTR("Empty answer blob cannot be set on offerer");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMediaStreamNegotiator setAnswer:withError:].cold.3();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[AVCMediaStreamNegotiator setAnswer:withError:].cold.4();
      }
    }
    errorDetailCode = 6;
  }
  if (a4)
  {
    if (!*a4)
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32034, errorDetailCode, 0, 0, *(_QWORD *)v12);
  }
  return 0;
}

- (BOOL)setupAudioStreamConfiguration:(id)a3 errorReason:(id *)a4
{
  int64_t v6;
  void *v7;
  VCCallInfoBlob *v8;
  uint64_t v9;
  NSObject *v10;
  int64_t mediaStreamMode;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = +[AVCAudioStreamConfig clientCodecTypeWithCodecType:](AVCAudioStreamConfig, "clientCodecTypeWithCodecType:", +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", -[VCMediaNegotiatorResultsAudio primaryPayload](-[VCMediaNegotiatorBase negotiatedAudioSettings](self->_mediaNegotiator, "negotiatedAudioSettings", a3, a4), "primaryPayload")));
  objc_msgSend(a3, "setRemoteSSRC:", -[VCMediaNegotiatorResultsAudio remoteSSRC](-[VCMediaNegotiatorBase negotiatedAudioSettings](self->_mediaNegotiator, "negotiatedAudioSettings"), "remoteSSRC"));
  objc_msgSend(a3, "setTxPayloadType:", -[VCMediaNegotiatorResultsAudio primaryPayload](-[VCMediaNegotiatorBase negotiatedAudioSettings](self->_mediaNegotiator, "negotiatedAudioSettings"), "primaryPayload"));
  objc_msgSend(a3, "setRxPayloadType:", objc_msgSend(a3, "txPayloadType"));
  objc_msgSend((id)objc_msgSend(a3, "audio"), "setCodecType:", v6);
  objc_msgSend((id)objc_msgSend(a3, "audio"), "setAudioStreamMode:", -[AVCMediaStreamNegotiatorSettings audioStreamMode](self->_negotiatorSettings, "audioStreamMode"));
  objc_msgSend((id)objc_msgSend(a3, "audio"), "setChannelCount:", -[AVCMediaStreamNegotiatorSettings audioChannelCount](self->_negotiatorSettings, "audioChannelCount"));
  objc_msgSend((id)objc_msgSend(a3, "audio"), "setPtime:", -[AVCMediaStreamNegotiatorSettings ptime](self->_negotiatorSettings, "ptime"));
  objc_msgSend((id)objc_msgSend(a3, "audio"), "setPreferredMediaBitRate:", -[AVCMediaStreamNegotiatorSettings preferredMediaBitRate](self->_negotiatorSettings, "preferredMediaBitRate"));
  v7 = (void *)objc_msgSend((id)objc_msgSend(a3, "audio"), "remoteDeviceInfo");
  if (self->_remoteCallInfoBlob)
  {
    v8 = -[VCCallInfoBlob initWithData:]([VCCallInfoBlob alloc], "initWithData:", self->_remoteCallInfoBlob);
    if (-[VCCallInfoBlob audioDeviceUID](v8, "audioDeviceUID"))
    {
      objc_msgSend(v7, "setDeviceUID:", -[VCCallInfoBlob audioDeviceUID](v8, "audioDeviceUID"));
      objc_msgSend(v7, "setDeviceName:", -[VCCallInfoBlob deviceName](v8, "deviceName"));
      objc_msgSend(v7, "setModelUID:", -[VCCallInfoBlob deviceType](v8, "deviceType"));
    }

  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      mediaStreamMode = self->_mediaStreamMode;
      *(_DWORD *)buf = 136318466;
      v14 = v9;
      v15 = 2080;
      v16 = "-[AVCMediaStreamNegotiator setupAudioStreamConfiguration:errorReason:]";
      v17 = 1024;
      v18 = 540;
      v19 = 1024;
      v20 = mediaStreamMode;
      v21 = 1024;
      v22 = objc_msgSend((id)objc_msgSend(a3, "audio"), "audioStreamMode");
      v23 = 1024;
      v24 = objc_msgSend((id)objc_msgSend(a3, "audio"), "codecType");
      v25 = 1024;
      v26 = objc_msgSend((id)objc_msgSend(a3, "audio"), "ptime");
      v27 = 1024;
      v28 = objc_msgSend(a3, "txPayloadType");
      v29 = 1024;
      v30 = objc_msgSend(a3, "rxPayloadType");
      v31 = 1024;
      v32 = objc_msgSend(a3, "jitterBufferMode");
      v33 = 1024;
      v34 = objc_msgSend((id)objc_msgSend(a3, "audio"), "channelCount");
      v35 = 2112;
      v36 = objc_msgSend(v7, "deviceUID");
      v37 = 2112;
      v38 = objc_msgSend(v7, "deviceName");
      v39 = 2112;
      v40 = objc_msgSend(v7, "modelUID");
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiated values: mediaStreamMode=%u, audioStreamMode=%u, codecType=%u, pTime=%u, txPayloadType=%u, rxPayloadType=%u, jitterBufferMode=%u, channelCount=%u, deviceUID=%@, deviceName=%@, modelUID=%@", buf, 0x6Au);
    }
  }
  return 1;
}

- (BOOL)setupVideoStreamConfiguration:(id)a3 errorReason:(id *)a4
{
  VCMediaNegotiatorLocalConfiguration *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int64_t v11;
  VCMediaNegotiator *mediaNegotiator;
  VCMediaNegotiatorResultsVideo *v13;
  VCMediaNegotiatorResultsVideo *v14;
  unsigned __int8 v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int64_t v25;
  unsigned int v26;
  uint64_t v27;
  NSDictionary *v28;
  NSDictionary *v29;
  float v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  NSObject *v37;
  __CFString *v38;
  unsigned int v40;
  AVCMediaStreamNegotiator *v41;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  _BYTE v77[128];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v6 = -[VCMediaNegotiatorBase localSettings](self->_mediaNegotiator, "localSettings");
  v7 = -[AVCMediaStreamNegotiatorSettings connectionType](self->_negotiatorSettings, "connectionType");
  v8 = objc_msgSend(-[NSSet anyObject](-[NSSet filteredSetUsingPredicate:](-[VCMediaNegotiatorLocalConfiguration bandwidthConfigurations](v6, "bandwidthConfigurations"), "filteredSetUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("connectionType = %d AND mode = %d"), v7, VCBitrateArbiter_ModeFromOperatingMode(-[AVCMediaStreamNegotiatorSettings operatingMode](self->_negotiatorSettings, "operatingMode")))), "anyObject"), "maxBandwidth");
  v9 = -[VCMediaNegotiator remoteMaxBandwidthForArbiterMode:connectionType:](self->_mediaNegotiator, "remoteMaxBandwidthForArbiterMode:connectionType:", VCBitrateArbiter_ModeFromOperatingMode(-[AVCMediaStreamNegotiatorSettings operatingMode](self->_negotiatorSettings, "operatingMode")), v7);
  if (v8 >= v9)
    v10 = v9;
  else
    v10 = v8;
  v11 = -[AVCMediaStreamNegotiatorSettings captureSource](self->_negotiatorSettings, "captureSource");
  mediaNegotiator = self->_mediaNegotiator;
  if (v11 == 1)
    v13 = -[VCMediaNegotiatorBase negotiatedScreenSettings](mediaNegotiator, "negotiatedScreenSettings");
  else
    v13 = -[VCMediaNegotiatorBase negotiatedVideoSettings](mediaNegotiator, "negotiatedVideoSettings");
  v14 = v13;
  if (v13)
  {
    if (-[VCMediaNegotiatorResultsVideo videoRuleCollections](v13, "videoRuleCollections")
      && -[VCVideoRuleCollections supportedPayloads](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v14, "videoRuleCollections"), "supportedPayloads"))
    {
      v40 = v10;
      v41 = self;
      v78 = 0u;
      v79 = 0u;
      if (objc_msgSend(a3, "direction") == 1)
        v15 = 1;
      else
        v15 = 2;
      v80 = 0uLL;
      v81 = 0uLL;
      v16 = -[VCVideoRuleCollections supportedPayloads](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v14, "videoRuleCollections"), "supportedPayloads");
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v78, v77, 16);
      if (!v17)
        goto LABEL_23;
      v18 = v17;
      v19 = *(_QWORD *)v79;
LABEL_15:
      v20 = 0;
      while (1)
      {
        if (*(_QWORD *)v79 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v20);
        if (-[NSMutableArray containsObject:](-[VCVideoRuleCollections supportedPayloads](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v14, "videoRuleCollections"), "supportedPayloads"), "containsObject:", &unk_1E9EF6608)&& -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v14, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(&unk_1E9EF6608, "unsignedIntValue"), v15))
        {
          v21 = &unk_1E9EF6608;
          goto LABEL_30;
        }
        if (-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v14, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(v21, "unsignedIntValue"), v15))
        {
          break;
        }
        if (v18 == ++v20)
        {
          v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v78, v77, 16);
          if (v18)
            goto LABEL_15;
LABEL_23:
          v41->_errorDetailCode = 5;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
          {
            VRTraceErrorLogLevelToCSTR();
            if ((VRTraceIsOSFaultDisabled() & 1) != 0)
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.5();
            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
            {
              -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.6();
            }
          }
          v35 = 0;
          v38 = CFSTR("No valid payload found in the negotiated settings");
          goto LABEL_59;
        }
      }
      if (!v21)
        goto LABEL_23;
LABEL_30:
      v22 = (void *)objc_msgSend(-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v14, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(v21, "intValue"), v15), "objectAtIndex:", 0);
      if (v22)
      {
        v23 = v22;
        v24 = objc_msgSend(v22, "iPayload");
        v25 = +[AVCMediaStreamNegotiator clientCodecTypeWithCodecType:](AVCMediaStreamNegotiator, "clientCodecTypeWithCodecType:", +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v24));
        objc_msgSend(a3, "setRemoteSSRC:", -[VCMediaNegotiatorResultsVideo remoteSSRC](v14, "remoteSSRC"));
        objc_msgSend(a3, "setTxPayloadType:", v24);
        objc_msgSend(a3, "setRxPayloadType:", objc_msgSend(a3, "txPayloadType"));
        if (-[NSSet count](-[VCMediaNegotiatorResultsVideo hdrModesNegotiated](v14, "hdrModesNegotiated"), "count"))
          -[AVCMediaStreamNegotiator pickBestHDRMode:](v41, "pickBestHDRMode:", -[VCMediaNegotiatorResultsVideo hdrModesNegotiated](v14, "hdrModesNegotiated"));
        v26 = v40;
        if (objc_msgSend(a3, "direction") == 1 || objc_msgSend(a3, "direction") == 3)
        {
          v27 = -[AVCMediaStreamNegotiator pickBestPixelFormatFromSet:](v41, "pickBestPixelFormatFromSet:", -[VCMediaNegotiatorResultsVideo pixelFormats](v14, "pixelFormats"));
          if (!(_DWORD)v27)
          {
            v41->_errorDetailCode = 5;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if ((VRTraceIsOSFaultDisabled() & 1) != 0)
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.9();
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
              {
                -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.10();
              }
            }
            v35 = 0;
            v38 = CFSTR("No valid pixel format found in the negotiated screen settings");
            goto LABEL_59;
          }
          objc_msgSend((id)objc_msgSend(a3, "video"), "setPixelFormat:", v27);
        }
        if (v41->_mediaStreamTransportType == 2 && v41->_videoHDRMode == 3)
          v26 = 80000000;
        if (!v41->_mediaStreamTransportProtocolType)
          v41->_mediaStreamTransportProtocolType = 1;
        objc_msgSend((id)objc_msgSend(a3, "video"), "setHdrMode:", v41->_videoHDRMode);
        v28 = -[VCMediaNegotiatorResultsVideo featureStrings](v14, "featureStrings");
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTxCodecFeatureListString:", -[NSDictionary objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24)));
        v29 = -[VCMediaNegotiatorResultsVideo featureStrings](v14, "featureStrings");
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRxCodecFeatureListString:", -[NSDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24)));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setVideoStreamMode:", -[AVCMediaStreamNegotiatorSettings videoStreamMode](v41->_negotiatorSettings, "videoStreamMode"));
        objc_msgSend(v23, "fRate");
        objc_msgSend((id)objc_msgSend(a3, "video"), "setFramerate:", (unint64_t)v30);
        if (-[VCMediaNegotiatorResultsVideo customVideoWidth](v14, "customVideoWidth"))
          v31 = -[VCMediaNegotiatorResultsVideo customVideoWidth](v14, "customVideoWidth");
        else
          v31 = objc_msgSend(v23, "iWidth");
        objc_msgSend((id)objc_msgSend(a3, "video"), "setCustomWidth:", v31);
        if (-[VCMediaNegotiatorResultsVideo customVideoHeight](v14, "customVideoHeight"))
          v32 = -[VCMediaNegotiatorResultsVideo customVideoHeight](v14, "customVideoHeight");
        else
          v32 = objc_msgSend(v23, "iHeight");
        objc_msgSend((id)objc_msgSend(a3, "video"), "setCustomHeight:", v32);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTilesPerFrame:", -[VCMediaNegotiatorResultsVideo tilesPerFrame](v14, "tilesPerFrame"));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setLtrpEnabled:", -[VCMediaNegotiatorResultsVideo ltrpEnabled](v14, "ltrpEnabled"));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setFecEnabled:", -[VCMediaNegotiatorResultsVideo fecEnabled](v14, "fecEnabled"));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRtxEnabled:", -[VCMediaNegotiatorResultsVideo rtxEnabled](v14, "rtxEnabled"));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTxCodecType:", v25);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRxCodecType:", v25);
        v33 = v26;
        v34 = v26;
        if (-[AVCMediaStreamNegotiatorSettings maxBandwidth](v41->_negotiatorSettings, "maxBandwidth") < v26)
          v34 = -[AVCMediaStreamNegotiatorSettings maxBandwidth](v41->_negotiatorSettings, "maxBandwidth");
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTxMaxBitrate:", v34);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTxMinBitrate:", -[AVCMediaStreamNegotiatorSettings minBandwidth](v41->_negotiatorSettings, "minBandwidth"));
        if (-[AVCMediaStreamNegotiatorSettings maxBandwidth](v41->_negotiatorSettings, "maxBandwidth") < v26)
          v33 = -[AVCMediaStreamNegotiatorSettings maxBandwidth](v41->_negotiatorSettings, "maxBandwidth");
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRxMaxBitrate:", v33);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRxMinBitrate:", -[AVCMediaStreamNegotiatorSettings minBandwidth](v41->_negotiatorSettings, "minBandwidth"));
        v35 = 1;
        objc_msgSend(a3, "setRateAdaptationEnabled:", 1);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setEnableCVO:", 0);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setCvoExtensionID:", 0);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setCaptureSource:", -[AVCMediaStreamNegotiatorSettings captureSource](v41->_negotiatorSettings, "captureSource"));
        objc_msgSend((id)objc_msgSend(a3, "video"), "setKeyFrameInterval:", 0);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setIsVideoProtected:", 0);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setVideoResolution:", 12);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setRemoteVideoInitialOrientation:", 3);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setTransportProtocolType:", v41->_mediaStreamTransportProtocolType);
        objc_msgSend((id)objc_msgSend(a3, "video"), "setShouldSendBlackFramesOnClearScreen:", -[VCMediaNegotiatorResultsVideo blackFrameOnClearScreenEnabled](v14, "blackFrameOnClearScreenEnabled"));
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7
          && (v36 = VRTraceErrorLogLevelToCSTR(),
              v37 = *MEMORY[0x1E0CF2758],
              os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
        {
          *(_DWORD *)buf = 136319234;
          v44 = v36;
          v45 = 2080;
          v46 = "-[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:]";
          v47 = 1024;
          v48 = 642;
          v49 = 2048;
          v50 = objc_msgSend((id)objc_msgSend(a3, "video"), "tilesPerFrame");
          v51 = 1024;
          v52 = objc_msgSend((id)objc_msgSend(a3, "video"), "isLTRPEnabled");
          v53 = 1024;
          v54 = objc_msgSend((id)objc_msgSend(a3, "video"), "isFECEnabled");
          v55 = 1024;
          v56 = objc_msgSend((id)objc_msgSend(a3, "video"), "isRTXEnabled");
          v57 = 1024;
          v58 = objc_msgSend((id)objc_msgSend(a3, "video"), "shouldSendBlackFramesOnClearScreen");
          v59 = 1024;
          v60 = objc_msgSend((id)objc_msgSend(a3, "video"), "transportProtocolType");
          v61 = 1024;
          v62 = objc_msgSend(a3, "accessNetworkType");
          v63 = 2048;
          v64 = objc_msgSend((id)objc_msgSend(a3, "video"), "customWidth");
          v65 = 2048;
          v66 = objc_msgSend((id)objc_msgSend(a3, "video"), "customHeight");
          v67 = 2048;
          v68 = objc_msgSend(a3, "txPayloadType");
          v69 = 2048;
          v70 = objc_msgSend((id)objc_msgSend(a3, "video"), "hdrMode");
          v71 = 2048;
          v72 = objc_msgSend((id)objc_msgSend(a3, "video"), "framerate");
          v73 = 2048;
          v74 = objc_msgSend((id)objc_msgSend(a3, "video"), "txMaxBitrate");
          v75 = 2080;
          v76 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "video"), "txCodecFeatureListString"), "UTF8String");
          _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiated values: tilesPerFrame=%lu, ltrpEnabled=%i, fecEnabled=%i, rtxEnabled=%i, shouldSendBlackFramesOnClearScreen=%i, transportProtocolType=%u, accessNetworkType=%u, videoWidth=%lu, videoHeight=%lu, payloadType=%lu, videoHDRMode = %lu, frameRate=%lu, maxTxBitRate=%lu, FLS=%s", buf, 0x90u);
          v38 = 0;
          v35 = 1;
        }
        else
        {
          v38 = 0;
        }
        goto LABEL_59;
      }
      v41->_errorDetailCode = 5;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.7();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.8();
        }
      }
      v35 = 0;
      v38 = CFSTR("No valid video rules found found in the negotiated screen settings");
    }
    else
    {
      self->_errorDetailCode = 5;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.3();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.4();
        }
      }
      v35 = 0;
      v38 = CFSTR("RuleCollection not correct in negotiated settings");
    }
  }
  else
  {
    self->_errorDetailCode = 5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:].cold.2();
      }
    }
    v35 = 0;
    v38 = CFSTR("Settings not found in negotiated settings");
  }
LABEL_59:
  if (a4)
    *a4 = v38;
  return v35;
}

- (id)generateMediaStreamConfigurationWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  AVCMediaStreamConfig *v8;
  AVCMediaStreamConfig *v9;
  VCMediaNegotiator *mediaNegotiator;
  int64_t v11;
  _BYTE v13[12];
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *a3;
      *(_DWORD *)v13 = 136315906;
      *(_QWORD *)&v13[4] = v5;
      v14 = 2080;
      v15 = "-[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:]";
      v16 = 1024;
      v17 = 652;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d error=%@", v13, 0x26u);
    }
  }
  *(_QWORD *)v13 = 0;
  v8 = objc_alloc_init(AVCMediaStreamConfig);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        -[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:].cold.1();
        if (a3)
          goto LABEL_38;
        return 0;
      }
    }
LABEL_37:
    if (a3)
      goto LABEL_38;
    return 0;
  }
  v9 = v8;
  mediaNegotiator = self->_mediaNegotiator;
  if (self->_deviceRole == 1)
  {
    if (!-[VCMediaNegotiator processResponseBlob:](mediaNegotiator, "processResponseBlob:", self->_mediaBlobNegotiated))
    {
      *(_QWORD *)v13 = CFSTR("Failed to process the response blob on the offerer");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            -[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:].cold.4();
            if (!a3)
              return 0;
            goto LABEL_38;
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:].cold.5();
          if (!a3)
            return 0;
          goto LABEL_38;
        }
      }
      goto LABEL_37;
    }
    self->_mediaStreamAccessNetworkType = -[AVCMediaStreamNegotiatorSettings accessNetworkType](self->_negotiatorSettings, "accessNetworkType");
  }
  else if (-[VCMediaNegotiatorResults accessNetworkType](-[VCMediaNegotiatorBase negotiatedSettings](mediaNegotiator, "negotiatedSettings"), "accessNetworkType"))
  {
    v11 = +[AVCMediaStreamNegotiator clientAccessNetworkType:](AVCMediaStreamNegotiator, "clientAccessNetworkType:", -[VCMediaNegotiatorResults accessNetworkType](-[VCMediaNegotiatorBase negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings"), "accessNetworkType"));
    self->_mediaStreamAccessNetworkType = v11;
    -[AVCMediaStreamNegotiatorSettings setAccessNetworkType:](self->_negotiatorSettings, "setAccessNetworkType:", v11);
  }
  -[AVCMediaStreamConfig setDirection:](v9, "setDirection:", -[AVCMediaStreamNegotiatorSettings mediaStreamDirection](self->_negotiatorSettings, "mediaStreamDirection"));
  -[AVCMediaStreamConfig setLocalSSRC:](v9, "setLocalSSRC:", -[AVCMediaStreamNegotiatorSettings localSSRC](self->_negotiatorSettings, "localSSRC"));
  -[AVCMediaStreamConfig setAccessNetworkType:](v9, "setAccessNetworkType:", self->_mediaStreamAccessNetworkType);
  -[AVCMediaStreamConfig setRtpTimeOutEnabled:](v9, "setRtpTimeOutEnabled:", 0);
  -[AVCMediaStreamConfig setRtpTimeOutInterval:](v9, "setRtpTimeOutInterval:", 0.0);
  -[AVCMediaStreamConfig setRtcpEnabled:](v9, "setRtcpEnabled:", 1);
  -[AVCMediaStreamConfig setRtcpTimeOutEnabled:](v9, "setRtcpTimeOutEnabled:", -[AVCMediaStreamNegotiatorSettings rtcpTimeOutEnabled](self->_negotiatorSettings, "rtcpTimeOutEnabled"));
  -[AVCMediaStreamNegotiatorSettings rtcpTimeOutInterval](self->_negotiatorSettings, "rtcpTimeOutInterval");
  -[AVCMediaStreamConfig setRtcpTimeOutInterval:](v9, "setRtcpTimeOutInterval:");
  -[AVCMediaStreamNegotiatorSettings rtcpSendInterval](self->_negotiatorSettings, "rtcpSendInterval");
  -[AVCMediaStreamConfig setRtcpSendInterval:](v9, "setRtcpSendInterval:");
  if ((-[AVCMediaStreamConfig direction](v9, "direction") == 2
     || -[AVCMediaStreamConfig direction](v9, "direction") == 3)
    && -[AVCMediaStreamNegotiatorSettings shouldSetJitterBufferMode](self->_negotiatorSettings, "shouldSetJitterBufferMode"))
  {
    -[AVCMediaStreamConfig setJitterBufferMode:](v9, "setJitterBufferMode:", -[AVCMediaStreamNegotiatorSettings jitterBufferMode](self->_negotiatorSettings, "jitterBufferMode"));
  }
  if (-[AVCMediaStreamNegotiatorSettings audioConfiguration](self->_negotiatorSettings, "audioConfiguration"))
  {
    if (!-[AVCMediaStreamNegotiator setupAudioStreamConfiguration:errorReason:](self, "setupAudioStreamConfiguration:errorReason:", v9, v13))
    {
LABEL_23:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            -[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:].cold.2();
            if (!a3)
              return 0;
LABEL_38:
            if (!*a3)
              +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32035, self->_errorDetailCode, 0, 0, *(_QWORD *)v13);
            return 0;
          }
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[AVCMediaStreamNegotiator generateMediaStreamConfigurationWithError:].cold.3();
          if (!a3)
            return 0;
          goto LABEL_38;
        }
      }
      goto LABEL_37;
    }
  }
  else if (!-[AVCMediaStreamNegotiator setupVideoStreamConfiguration:errorReason:](self, "setupVideoStreamConfiguration:errorReason:", v9, v13))
  {
    goto LABEL_23;
  }
  return v9;
}

- (BOOL)addLocalCallInfoBlobToOutgoingDictionary:(id)a3
{
  VCCallInfoBlob *v5;
  VCCallInfoBlob *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  BOOL v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const char *v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(VCCallInfoBlob);
  v6 = v5;
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:].cold.1();
    }
    goto LABEL_22;
  }
  -[VCCallInfoBlob setCallID:](v5, "setCallID:", 0);
  -[VCCallInfoBlob setClientVersion:](v6, "setClientVersion:", +[VCCallInfo getVCCurrentVersion](VCCallInfo, "getVCCurrentVersion"));
  memset(v28, 170, 20);
  VCGetDeviceModelString((char *)v28, 0x14uLL);
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v28, 1);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:].cold.2();
    }
LABEL_22:
    v12 = 0;
    v10 = 0;
    v8 = 0;
LABEL_31:
    v17 = 0;
    goto LABEL_15;
  }
  v8 = (void *)v7;
  -[VCCallInfoBlob setDeviceType:](v6, "setDeviceType:", v7);
  memset(v27, 170, 20);
  VCGetSystemBuildVersionString((char *)v27, 20);
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v27, 1);
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:].cold.3();
    }
    v12 = 0;
    v10 = 0;
    goto LABEL_31;
  }
  v10 = (void *)v9;
  -[VCCallInfoBlob setOsVersion:](v6, "setOsVersion:", v9);
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", "2055.64.1.1.2", 1);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:].cold.4();
    }
    v12 = 0;
    goto LABEL_31;
  }
  v12 = (void *)v11;
  -[VCCallInfoBlob setFrameworkVersion:](v6, "setFrameworkVersion:", v11);
  if (-[AVCMediaStreamNegotiatorSettings audioDeviceUID](self->_negotiatorSettings, "audioDeviceUID"))
  {
    -[VCCallInfoBlob setAudioDeviceUID:](v6, "setAudioDeviceUID:", -[AVCMediaStreamNegotiatorSettings audioDeviceUID](self->_negotiatorSettings, "audioDeviceUID"));
    v13 = VCCopyDeviceName();
    -[VCCallInfoBlob setDeviceName:](v6, "setDeviceName:", v13);
    if (v13)
      CFRelease(v13);
  }
  objc_msgSend(a3, "setObject:forKeyedSubscript:", -[VCCallInfoBlob data](v6, "data"), CFSTR("avcMediaStreamOptionRemoteEndpointInfo"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend((id)-[VCCallInfoBlob formattedText](v6, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", ")))
      {
        v16 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[VCCallInfoBlob formattedText](v6, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", ")), "description"), "UTF8String");
      }
      else
      {
        v16 = "<nil>";
      }
      v19 = 136315906;
      v20 = v14;
      v21 = 2080;
      v22 = "-[AVCMediaStreamNegotiator addLocalCallInfoBlobToOutgoingDictionary:]";
      v23 = 1024;
      v24 = 750;
      v25 = 2080;
      v26 = v16;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Local callInfoBlob = %s", (uint8_t *)&v19, 0x26u);
    }
  }
  v17 = 1;
LABEL_15:

  return v17;
}

- (id)generateMediaStreamInitOptionsWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  NSData *remoteCallInfoBlob;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *a3;
      v12 = 136315906;
      v13 = v5;
      v14 = 2080;
      v15 = "-[AVCMediaStreamNegotiator generateMediaStreamInitOptionsWithError:]";
      v16 = 1024;
      v17 = 762;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d error=%@", (uint8_t *)&v12, 0x26u);
    }
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setObject:forKey:", self->_dataSessionID, CFSTR("avcMediaStreamOptionCallID"));
    remoteCallInfoBlob = self->_remoteCallInfoBlob;
    if (remoteCallInfoBlob)
      objc_msgSend(v9, "setObject:forKey:", remoteCallInfoBlob, CFSTR("avcMediaStreamOptionRemoteEndpointInfo"));
    return v9;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 2)
    goto LABEL_14;
  VRTraceErrorLogLevelToCSTR();
  if ((VRTraceIsOSFaultDisabled() & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      -[AVCMediaStreamNegotiator generateMediaStreamInitOptionsWithError:].cold.1();
      if (!a3)
        return v9;
      goto LABEL_15;
    }
LABEL_14:
    if (!a3)
      return v9;
    goto LABEL_15;
  }
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    goto LABEL_14;
  -[AVCMediaStreamNegotiator generateMediaStreamInitOptionsWithError:].cold.2();
  if (!a3)
    return v9;
LABEL_15:
  if (!*a3)
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32036, 5, 0, 0, CFSTR("failed to create mediastream init options dictionary"));
  return v9;
}

- (unsigned)pickBestPixelFormatFromSet:(id)a3
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t videoHDRMode;
  void *v7;
  unsigned int v8;
  unint64_t v10;

  v3 = 1;
  v4 = &AVCPixelFormatPreferenceListCoreDeviceSDR;
  v5 = 1;
  switch(self->_mediaStreamMode)
  {
    case 1:
    case 7:
    case 9:
      videoHDRMode = self->_videoHDRMode;
      v7 = &AVCPixelFormatPreferenceListDefault;
      if (videoHDRMode == 3)
      {
        v7 = &AVCPixelFormatPreferenceListIPadCompanionHDR;
        v8 = 3;
      }
      else
      {
        v8 = 1;
      }
      if (videoHDRMode)
        v4 = v7;
      else
        v4 = &AVCPixelFormatPreferenceListIPadCompanion;
      if (videoHDRMode)
        v3 = v8;
      else
        v3 = 2;
      v5 = 1;
      break;
    case 2:
      v5 = 0;
      v10 = self->_videoHDRMode;
      if (v10)
        v4 = &AVCPixelFormatPreferenceListAirPlayMirroringHDR;
      else
        v4 = &AVCPixelFormatPreferenceListAirPlayMirroringNoHDR;
      if (v10)
        v3 = 2;
      else
        v3 = 1;
      break;
    case 3:
      if (self->_videoHDRMode)
        v4 = &AVCPixelFormatPreferenceListRemoteCameraHDR;
      else
        v4 = &AVCPixelFormatPreferenceListRemoteCameraSDR;
      break;
    case 5:
      return -[AVCMediaStreamNegotiator pickBestPixelFormatFromSet:preferenceList:count:acceptDefault:](self, "pickBestPixelFormatFromSet:preferenceList:count:acceptDefault:", a3, v4, v3, v5);
    default:
      v3 = 1;
      v4 = &AVCPixelFormatPreferenceListDefault;
      v5 = 1;
      break;
  }
  return -[AVCMediaStreamNegotiator pickBestPixelFormatFromSet:preferenceList:count:acceptDefault:](self, "pickBestPixelFormatFromSet:preferenceList:count:acceptDefault:", a3, v4, v3, v5);
}

- (unsigned)pickBestPixelFormatFromSet:(id)a3 preferenceList:(unsigned int *)a4 count:(int)a5 acceptDefault:(BOOL)a6
{
  _BOOL4 v6;
  int v9;
  uint64_t v11;
  unsigned int *v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  char *v17;
  int64_t mediaStreamMode;
  unint64_t videoHDRMode;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v9 = a5 - 1;
  if (a5 < 1)
  {
LABEL_5:
    v14 = 0;
LABEL_7:
    if (v6)
      v14 = a4[v9];
    goto LABEL_9;
  }
  v11 = a5;
  v12 = a4;
  while (1)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *v12);
    if (objc_msgSend(a3, "containsObject:", v13))
      break;

    ++v12;
    if (!--v11)
      goto LABEL_5;
  }
  v14 = *v12;

  if (!v14)
    goto LABEL_7;
LABEL_9:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = FourccToCStr(v14);
      mediaStreamMode = self->_mediaStreamMode;
      videoHDRMode = self->_videoHDRMode;
      v21 = 136316418;
      v22 = v15;
      v23 = 2080;
      v24 = "-[AVCMediaStreamNegotiator pickBestPixelFormatFromSet:preferenceList:count:acceptDefault:]";
      v25 = 1024;
      v26 = 844;
      v27 = 2080;
      v28 = v17;
      v29 = 2048;
      v30 = mediaStreamMode;
      v31 = 2048;
      v32 = videoHDRMode;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Negotiated pixelFormat=%s for mediaStreamMode=%lu in videoHDRMode=%lu", (uint8_t *)&v21, 0x3Au);
    }
  }
  return v14;
}

- (void)pickBestHDRMode:(id)a3
{
  int64_t mediaStreamMode;
  unint64_t v6;

  mediaStreamMode = self->_mediaStreamMode;
  if (mediaStreamMode != 7)
  {
    if (mediaStreamMode == 3)
    {
      if (objc_msgSend(a3, "containsObject:", &unk_1E9EF6650))
      {
        v6 = 1;
        goto LABEL_8;
      }
      goto LABEL_10;
    }
    if (mediaStreamMode != 1)
      return;
  }
  if (objc_msgSend(a3, "containsObject:", &unk_1E9EF6620))
  {
    v6 = 3;
LABEL_8:
    self->_videoHDRMode = v6;
    return;
  }
  if (objc_msgSend(a3, "containsObject:", &unk_1E9EF6638))
  {
LABEL_10:
    self->_videoHDRMode = 0;
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[AVCMediaStreamNegotiator pickBestHDRMode:].cold.1();
  }
}

- (NSData)offer
{
  return self->_offer;
}

- (NSData)answer
{
  return self->_answer;
}

- (void)initNegotiatorLocalConfiguration:options:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate cameraConfiguration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initNegotiatorLocalConfiguration:options:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[AVCMediaStreamNegotiator initNegotiatorLocalConfiguration:options:]";
  v4 = 1024;
  v5 = 188;
  v6 = 2112;
  v7 = v0;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to copy cameraConfiguration=%@", v2, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)initWithMode:options:error:.cold.1()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithMode:options:error:.cold.2()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithMode:options:error:.cold.3()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithMode:options:error:.cold.4()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithMode:options:error:.cold.5()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithMode:options:error:.cold.6()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)createOffer
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d could not generate callInfoBlob on offerer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOffer:options:error:.cold.1()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithOffer:options:error:.cold.2()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithOffer:options:error:.cold.3()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithOffer:options:error:.cold.4()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithOffer:options:error:.cold.5()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithOffer:options:error:.cold.6()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithOffer:options:error:.cold.7()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithOffer:options:error:.cold.8()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithOffer:options:error:.cold.9()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithOffer:options:error:.cold.10()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithOffer:options:error:.cold.11()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithOffer:options:error:.cold.12()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)createAnswer
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to add VCCallInfo dictionary on answerer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setAnswer:withError:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("Can't set answer blob on answerer"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setAnswer:withError:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("Can't set answer blob on answerer"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setAnswer:withError:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("Empty answer blob cannot be set on offerer"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setAnswer:withError:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("Empty answer blob cannot be set on offerer"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setAnswer:withError:.cold.5()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)setAnswer:withError:.cold.6()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("Settings not found in negotiated settings"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("Settings not found in negotiated settings"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("RuleCollection not correct in negotiated settings"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("RuleCollection not correct in negotiated settings"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("No valid payload found in the negotiated settings"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("No valid payload found in the negotiated settings"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("No valid video rules found found in the negotiated screen settings"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("No valid video rules found found in the negotiated screen settings"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("No valid pixel format found in the negotiated screen settings"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupVideoStreamConfiguration:errorReason:.cold.10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("No valid pixel format found in the negotiated screen settings"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)generateMediaStreamConfigurationWithError:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media stream config object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)generateMediaStreamConfigurationWithError:.cold.2()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)generateMediaStreamConfigurationWithError:.cold.3()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_14_2();
  OUTLINED_FUNCTION_5_13(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v1, v2, " [%s] %s:%d %s.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)generateMediaStreamConfigurationWithError:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("Failed to process the response blob on the offerer"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)generateMediaStreamConfigurationWithError:.cold.5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("Failed to process the response blob on the offerer"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)addLocalCallInfoBlobToOutgoingDictionary:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate callInfo blob object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addLocalCallInfoBlobToOutgoingDictionary:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create deviceType string for VCCallInfo blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addLocalCallInfoBlobToOutgoingDictionary:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to osVersion string for VCCallInfo blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addLocalCallInfoBlobToOutgoingDictionary:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to frameworkVersionString string for VCCallInfo blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)generateMediaStreamInitOptionsWithError:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("failed to create mediastream init options dictionary"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)generateMediaStreamInitOptionsWithError:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_45();
  objc_msgSend(CFSTR("failed to create mediastream init options dictionary"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_22(&dword_1D8A54000, v0, v1, " [%s] %s:%d %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)pickBestHDRMode:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Negotiation of hdr modes is incorrect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
