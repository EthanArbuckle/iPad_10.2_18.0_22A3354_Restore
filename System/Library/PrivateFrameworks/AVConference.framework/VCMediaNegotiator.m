@implementation VCMediaNegotiator

- (VCMediaNegotiator)initWithLocalSettings:(id)a3
{
  VCMediaNegotiator *v4;
  VCMediaNegotiatorResultsCaptions *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaNegotiator;
  v4 = -[VCMediaNegotiatorBase initWithLocalSettings:](&v7, sel_initWithLocalSettings_);
  if (v4)
  {
    if (+[VCMediaNegotiator validateLocalConfiguration:](VCMediaNegotiator, "validateLocalConfiguration:", a3))
    {
      v5 = objc_alloc_init(VCMediaNegotiatorResultsCaptions);
      v4->_negotiatedCaptionsSettings = v5;
      if (v5)
      {
        v4->_isCellular16x9Capable = -[VCMediaNegotiator isCellular16x9EncodeCapable](v4, "isCellular16x9EncodeCapable");
        return v4;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator initWithLocalSettings:].cold.1();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator initWithLocalSettings:].cold.2();
    }

    return 0;
  }
  return v4;
}

- (VCMediaNegotiator)initWithMode:(int64_t)a3 localSettings:(id)a4
{
  VCMediaNegotiator *v5;
  VCMediaNegotiator *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCMediaNegotiator;
  v5 = -[VCMediaNegotiatorBase initWithLocalSettings:](&v8, sel_initWithLocalSettings_, a4);
  v6 = v5;
  if (v5)
  {
    v5->_negotiationMode = a3;
    if (!-[VCMediaNegotiator isNegotiationModeValid:](v5, "isNegotiationModeValid:", a3))
    {

      return 0;
    }
  }
  return v6;
}

- (BOOL)isCaller
{
  return -[VCMediaNegotiatorLocalConfiguration isCaller](self->super._localSettings, "isCaller");
}

- (BOOL)isCellular16x9EncodeCapable
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  BOOL result;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 2), "videoRuleCollections");
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v3 = (void *)objc_msgSend(v2, "supportedPayloads");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v36;
    v21 = *(_QWORD *)v36;
    v22 = v3;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v36 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_msgSend(v2, "getVideoRulesForTransport:payload:encodingType:", 2, objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "unsignedIntValue", v21), 1);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v31;
          while (2)
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v31 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              v14 = objc_msgSend(v13, "iWidth");
              if (objc_msgSend(v13, "iHeight") * v14 == 130560)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v19 = VRTraceErrorLogLevelToCSTR();
                  v20 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v24 = v19;
                    v25 = 2080;
                    v26 = "-[VCMediaNegotiator isCellular16x9EncodeCapable]";
                    v27 = 1024;
                    v28 = 104;
                    _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Capable of streaming 16x9 cellular!", buf, 0x1Cu);
                  }
                }
                return 1;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
            if (v10)
              continue;
            break;
          }
        }
        v6 = v21;
        v3 = v22;
      }
      v5 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v5);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v17)
      return result;
    *(_DWORD *)buf = 136315650;
    v24 = v15;
    v25 = 2080;
    v26 = "-[VCMediaNegotiator isCellular16x9EncodeCapable]";
    v27 = 1024;
    v28 = 109;
    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Not capable of streaming 16x9 cellular!", buf, 0x1Cu);
  }
  return 0;
}

- (BOOL)isNegotiationModeValid:(int64_t)a3
{
  unint64_t v3;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 0xA && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiator isNegotiationModeValid:].cold.1();
  }
  return v3 < 0xA;
}

- (BOOL)isNegotiationModeForScreenShare:(int64_t)a3
{
  _BOOL4 v3;

  if ((unint64_t)(a3 - 1) >= 0xA)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v3 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v3)
        return v3;
      -[VCMediaNegotiator isNegotiationModeForScreenShare:].cold.1();
    }
    LOBYTE(v3) = 0;
    return v3;
  }
  return (0x153u >> (a3 - 1)) & 1;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiator;
  -[VCMediaNegotiatorBase dealloc](&v3, sel_dealloc);
}

- (id)negotiationData
{
  __objc2_class_ro **v3;
  VCMediaNegotiationBlob *v4;
  VCMediaNegotiationBlob *v5;
  _BOOL8 v6;
  id v7;
  VCMediaNegotiationBlobAudioSettings *v8;
  id v9;
  uint64_t v10;
  __objc2_class_ro **p_info;
  int *v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  _BOOL8 isCellular16x9Capable;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  BOOL v23;
  NSSet *v24;
  NSSet *v25;
  BOOL v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  void *v30;
  VCMediaNegotiationBlobAudioSettings *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  _BOOL4 v40;
  unsigned int v41;
  unsigned int v42;
  id v43;
  VCMediaNegotiationBlobVideoSettings *v44;
  void *v45;
  VCMediaNegotiationBlobAudioSettings *v46;

  v3 = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
  if (!-[VCMediaNegotiatorLocalConfiguration isCaller](self->super._localSettings, "isCaller"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator negotiationData].cold.7();
    }
    goto LABEL_41;
  }
  v4 = objc_alloc_init(VCMediaNegotiationBlob);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator negotiationData].cold.1();
    }
LABEL_41:
    v21 = 0;
    v19 = 0;
    v31 = 0;
    v5 = 0;
LABEL_52:
    v30 = 0;
    goto LABEL_34;
  }
  v5 = v4;
  -[VCMediaNegotiationBlob setBlobVersion:](v4, "setBlobVersion:", 2);
  -[VCMediaNegotiationBlob setUserAgent:](v5, "setUserAgent:", CFSTR("Viceroy 1.7.0/GK"));
  -[VCMediaNegotiationBlob setBasebandCodecSampleRate:](v5, "setBasebandCodecSampleRate:", -[VCMediaNegotiatorLocalConfiguration basebandCodecSampleRate](self->super._localSettings, "basebandCodecSampleRate"));
  -[VCMediaNegotiationBlob setBasebandCodec:](v5, "setBasebandCodec:", -[VCMediaNegotiatorLocalConfiguration basebandCodec](self->super._localSettings, "basebandCodec"));
  -[VCMediaNegotiationBlob setNtpTime:](v5, "setNtpTime:", -[VCMediaNegotiatorLocalConfiguration creationTime](self->super._localSettings, "creationTime"));
  -[VCMediaNegotiationBlob setMediaControlInfoVersion:](v5, "setMediaControlInfoVersion:", -[VCMediaNegotiatorLocalConfiguration mediaControlInfoVersion](self->super._localSettings, "mediaControlInfoVersion"));
  if (-[VCMediaNegotiatorLocalConfiguration accessNetworkType](self->super._localSettings, "accessNetworkType"))
    -[VCMediaNegotiationBlob setAccessNetworkType:](v5, "setAccessNetworkType:", -[VCMediaNegotiatorLocalConfiguration accessNetworkType](self->super._localSettings, "accessNetworkType"));
  v6 = self->_negotiationMode != 1;
  -[VCMediaNegotiationBlob setAllowDynamicMaxBitrate:](v5, "setAllowDynamicMaxBitrate:", v6);
  -[VCMediaNegotiationBlob setAllowsContentsChangeWithAspectPreservation:](v5, "setAllowsContentsChangeWithAspectPreservation:", v6);
  if (!-[VCMediaNegotiator setupBandwidthSettingsForMediaBlob:](self, "setupBandwidthSettingsForMediaBlob:", v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator negotiationData].cold.6();
    }
LABEL_51:
    v21 = 0;
    v19 = 0;
    v31 = 0;
    goto LABEL_52;
  }
  v7 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 1);
  if (v7)
  {
    v8 = -[VCMediaNegotiationBlobAudioSettings initWithAudioConfiguration:]([VCMediaNegotiationBlobAudioSettings alloc], "initWithAudioConfiguration:", v7);
    if (v8)
    {
      v46 = v8;
      -[VCMediaNegotiationBlob setAudioSettings:](v5, "setAudioSettings:");
      goto LABEL_10;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator negotiationData].cold.5();
    }
    goto LABEL_51;
  }
  v46 = 0;
LABEL_10:
  v9 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 2);
  v10 = objc_msgSend(v9, "videoRuleCollections");
  p_info = VCCaptionsReceiver.info;
  v12 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__expectedProcessEndTime;
  if (v10)
  {
    v13 = v10;
    v44 = [VCMediaNegotiationBlobVideoSettings alloc];
    v42 = objc_msgSend(v9, "ssrc");
    v14 = -[VCMediaNegotiatorLocalConfiguration allowRTCPFB](self->super._localSettings, "allowRTCPFB");
    v15 = objc_msgSend(v9, "videoFeatureStrings");
    isCellular16x9Capable = self->_isCellular16x9Capable;
    v17 = -[VCMediaNegotiatorLocalConfiguration tilesPerVideoFrame](self->super._localSettings, "tilesPerVideoFrame");
    LOBYTE(v33) = -[VCMediaNegotiatorLocalConfiguration ltrpEnabled](self->super._localSettings, "ltrpEnabled");
    v18 = -[VCMediaNegotiationBlobVideoSettings initWithSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:](v44, "initWithSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:", v42, v14, v13, v15, isCellular16x9Capable, v17, v33, -[VCMediaNegotiatorLocalConfiguration pixelFormats](self->super._localSettings, "pixelFormats"), -[VCMediaNegotiatorLocalConfiguration hdrModesSupported](self->super._localSettings, "hdrModesSupported"));
    if (!v18)
    {
      v3 = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator negotiationData].cold.4();
      }
      v21 = 0;
      v19 = 0;
      goto LABEL_61;
    }
    v19 = (void *)v18;
    -[VCMediaNegotiationBlob setVideoSettings:](v5, "setVideoSettings:", v18);
    v12 = &OBJC_IVAR___VCEmulatedNetworkAlgorithmQueueLoss__expectedProcessEndTime;
    p_info = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
  }
  else
  {
    v19 = 0;
  }
  v20 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 3);
  v21 = (void *)objc_msgSend(v20, "videoRuleCollections");
  if (v21)
  {
    v45 = v19;
    v43 = objc_alloc((Class)(p_info + 451));
    v41 = objc_msgSend(v20, "ssrc");
    v40 = -[VCMediaNegotiatorLocalConfiguration allowRTCPFB](self->super._localSettings, "allowRTCPFB");
    v39 = objc_msgSend(v20, "videoFeatureStrings");
    v38 = *((unsigned __int8 *)&self->super.super.isa + v12[477]);
    v37 = -[VCMediaNegotiatorLocalConfiguration customVideoWidth](self->super._localSettings, "customVideoWidth");
    v36 = -[VCMediaNegotiatorLocalConfiguration customVideoHeight](self->super._localSettings, "customVideoHeight");
    v22 = -[VCMediaNegotiatorLocalConfiguration tilesPerVideoFrame](self->super._localSettings, "tilesPerVideoFrame");
    v23 = -[VCMediaNegotiatorLocalConfiguration ltrpEnabled](self->super._localSettings, "ltrpEnabled");
    v24 = -[VCMediaNegotiatorLocalConfiguration pixelFormats](self->super._localSettings, "pixelFormats");
    v25 = -[VCMediaNegotiatorLocalConfiguration hdrModesSupported](self->super._localSettings, "hdrModesSupported");
    v26 = -[VCMediaNegotiatorLocalConfiguration fecEnabled](self->super._localSettings, "fecEnabled");
    v27 = -[VCMediaNegotiatorLocalConfiguration rtxEnabled](self->super._localSettings, "rtxEnabled");
    BYTE2(v35) = -[VCMediaNegotiatorLocalConfiguration blackFrameOnClearScreenEnabled](self->super._localSettings, "blackFrameOnClearScreenEnabled");
    BYTE1(v35) = v27;
    LOBYTE(v35) = v26;
    LOBYTE(v34) = v23;
    v28 = objc_msgSend(v43, "initWithScreenSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:", v41, v40, v21, v39, v38, v37, __PAIR64__(v22, v36), v34, v24, v25, v35);
    if (!v28)
    {
      v3 = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
      v19 = v45;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator negotiationData].cold.3();
      }
      v21 = 0;
      goto LABEL_61;
    }
    v21 = (void *)v28;
    -[VCMediaNegotiationBlob setScreenSettings:](v5, "setScreenSettings:", v28);
    v3 = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
    v19 = v45;
  }
  else
  {
    v3 = VCCaptionsReceiver.info;
  }
  if (-[VCMediaNegotiatorLocalConfiguration captionsSenderLanguages](self->super._localSettings, "captionsSenderLanguages")|| -[VCMediaNegotiatorLocalConfiguration captionsReceiverLanguages](self->super._localSettings, "captionsReceiverLanguages"))
  {
    -[VCMediaNegotiator setupCaptionsForMediaBlob:](self, "setupCaptionsForMediaBlob:", v5);
  }
  if (-[VCMediaNegotiatorLocalConfiguration mediaRecorderVideoCodecs](self->super._localSettings, "mediaRecorderVideoCodecs")|| -[VCMediaNegotiatorLocalConfiguration mediaRecorderImageTypes](self->super._localSettings, "mediaRecorderImageTypes"))
  {
    -[VCMediaNegotiator setupMomentsForMediaBlob:](self, "setupMomentsForMediaBlob:", v5);
  }
  if (-[VCMediaNegotiatorLocalConfiguration secureMessagingRequired](self->super._localSettings, "secureMessagingRequired")|| -[VCMediaNegotiatorLocalConfiguration SIPDisabled](self->super._localSettings, "SIPDisabled")|| -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches")|| -[VCMediaNegotiatorLocalConfiguration oneToOneModeSupported](self->super._localSettings, "oneToOneModeSupported")|| -[VCMediaNegotiatorLocalConfiguration mediaControlInfoFECFeedbackVersion](self->super._localSettings, "mediaControlInfoFECFeedbackVersion")|| -[VCMediaNegotiatorLocalConfiguration linkProbingCapabilityVersion](self->super._localSettings, "linkProbingCapabilityVersion"))
  {
    -[VCMediaNegotiator setupFaceTimeSettingsForMediaBlob:isResponse:](self, "setupFaceTimeSettingsForMediaBlob:isResponse:", v5, 0);
  }
  -[VCMediaNegotiator setupMultiwayAudioStreamsForMediaBlob:](self, "setupMultiwayAudioStreamsForMediaBlob:", v5);
  -[VCMediaNegotiator setupMultiwayVideoStreamsForMediaBlob:](self, "setupMultiwayVideoStreamsForMediaBlob:", v5);
  v29 = (void *)objc_msgSend(v3 + 461, "newCompressedBlob:", -[VCMediaNegotiationBlob data](v5, "data"));
  if (!v29)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator negotiationData].cold.2();
    }
LABEL_61:
    v30 = 0;
    goto LABEL_33;
  }
  v30 = v29;
  -[VCMediaNegotiationBlob printWithTitle:blobSize:logFile:](v5, "printWithTitle:blobSize:logFile:", CFSTR("Created invite media blob"), objc_msgSend(v29, "length"), -[VCMediaNegotiatorLocalConfiguration callLogFile](self->super._localSettings, "callLogFile"));
LABEL_33:
  v31 = v46;
LABEL_34:

  objc_msgSend(v3 + 461, "dumpBlob:prefix:force:", v30, CFSTR("mediablob_invite"), 0);
  return v30;
}

- (BOOL)processRemoteNegotiationData:(id)a3
{
  id v5;
  void *v6;
  VCMediaNegotiationBlob *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  BOOL v13;
  _BYTE v15[12];
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[VCMediaNegotiator dumpBlob:prefix:force:](VCMediaNegotiator, "dumpBlob:prefix:force:", a3, CFSTR("mediablob_invite_remote"), 0);
  if (-[VCMediaNegotiatorLocalConfiguration isCaller](self->super._localSettings, "isCaller"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.1();
    }
    goto LABEL_37;
  }
  v5 = +[VCMediaNegotiator newDecompressedBlob:](VCMediaNegotiator, "newDecompressedBlob:", a3);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.2();
    }
LABEL_37:
    v6 = 0;
LABEL_65:
    v7 = 0;
LABEL_66:
    v13 = 0;
    goto LABEL_30;
  }
  v6 = v5;
  v7 = -[VCMediaNegotiationBlob initWithData:]([VCMediaNegotiationBlob alloc], "initWithData:", v5);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.3();
    }
    goto LABEL_65;
  }
  -[VCMediaNegotiationBlob printWithTitle:blobSize:logFile:](v7, "printWithTitle:blobSize:logFile:", CFSTR("Received invite media blob"), objc_msgSend(v6, "length"), -[VCMediaNegotiatorLocalConfiguration callLogFile](self->super._localSettings, "callLogFile"));
  -[VCMediaNegotiatorResults setSupportsDynamicMaxBitrate:](self->super._negotiatedSettings, "setSupportsDynamicMaxBitrate:", -[VCMediaNegotiationBlob allowDynamicMaxBitrate](v7, "allowDynamicMaxBitrate"));
  -[VCMediaNegotiatorResults setRemoteBlobVersion:](self->super._negotiatedSettings, "setRemoteBlobVersion:", -[VCMediaNegotiationBlob blobVersion](v7, "blobVersion"));
  -[VCMediaNegotiatorResults setRemoteUserAgent:](self->super._negotiatedSettings, "setRemoteUserAgent:", -[VCMediaNegotiationBlob userAgent](v7, "userAgent"));
  -[VCMediaNegotiatorResults setRemoteBasebandCodec:](self->super._negotiatedSettings, "setRemoteBasebandCodec:", -[VCMediaNegotiationBlob basebandCodec](v7, "basebandCodec"));
  -[VCMediaNegotiatorResults setRemoteBasebandCodecSampleRate:](self->super._negotiatedSettings, "setRemoteBasebandCodecSampleRate:", -[VCMediaNegotiationBlob basebandCodecSampleRate](v7, "basebandCodecSampleRate"));
  v8 = -[VCMediaNegotiationBlob mediaControlInfoVersion](v7, "mediaControlInfoVersion");
  if (v8 >= 2)
    v9 = 2;
  else
    v9 = v8;
  -[VCMediaNegotiatorResults setMediaControlInfoVersion:](self->super._negotiatedSettings, "setMediaControlInfoVersion:", v9);
  -[VCMediaNegotiatorResults setControlChannelVersion:](self->super._negotiatedSettings, "setControlChannelVersion:", 1);
  -[VCMediaNegotiatorResults setAccessNetworkType:](self->super._negotiatedSettings, "setAccessNetworkType:", -[VCMediaNegotiationBlob accessNetworkType](v7, "accessNetworkType"));
  -[VCMediaNegotiatorResults setRemoteBlobCreationTime:](self->super._negotiatedSettings, "setRemoteBlobCreationTime:", -[VCMediaNegotiationBlob ntpTime](v7, "ntpTime"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[VCMediaNegotiatorResults mediaControlInfoVersion](self->super._negotiatedSettings, "mediaControlInfoVersion");
      *(_DWORD *)v15 = 136315906;
      *(_QWORD *)&v15[4] = v10;
      v16 = 2080;
      v17 = "-[VCMediaNegotiator processRemoteNegotiationData:]";
      v18 = 1024;
      v19 = 301;
      v20 = 1024;
      v21 = v12 == 2;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch after negotiation updatedAFRCHeaderEnabled %d", v15, 0x22u);
    }
  }
  -[VCMediaNegotiator saveRemoteBandwidthSettingsWithMediaBlob:](self, "saveRemoteBandwidthSettingsWithMediaBlob:", v7, *(_QWORD *)v15);
  if (-[VCMediaNegotiationBlob faceTimeSettings](v7, "faceTimeSettings")
    && !-[VCMediaNegotiator negotiateFaceTimeSettings:](self, "negotiateFaceTimeSettings:", -[VCMediaNegotiationBlob faceTimeSettings](v7, "faceTimeSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.11();
    }
    goto LABEL_66;
  }
  if (!-[VCMediaNegotiationBlob hasBlobVersion](v7, "hasBlobVersion")
    || !-[VCMediaNegotiationBlob blobVersion](v7, "blobVersion"))
  {
    -[VCMediaNegotiationBlobAudioSettings setUseSBR:](-[VCMediaNegotiationBlob audioSettings](v7, "audioSettings"), "setUseSBR:", 0);
  }
  if (-[VCMediaNegotiationBlob audioSettings](v7, "audioSettings")
    && !-[VCMediaNegotiator negotiateAudioSettings:](self, "negotiateAudioSettings:", -[VCMediaNegotiationBlob audioSettings](v7, "audioSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.10();
    }
    goto LABEL_66;
  }
  if (-[VCMediaNegotiationBlob videoSettings](v7, "videoSettings")
    && !-[VCMediaNegotiator negotiateVideoSettings:](self, "negotiateVideoSettings:", -[VCMediaNegotiationBlob videoSettings](v7, "videoSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.9();
    }
    goto LABEL_66;
  }
  if (-[VCMediaNegotiationBlob screenSettings](v7, "screenSettings")
    && !-[VCMediaNegotiator negotiateScreenSettings:](self, "negotiateScreenSettings:", -[VCMediaNegotiationBlob screenSettings](v7, "screenSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.8();
    }
    goto LABEL_66;
  }
  if (-[VCMediaNegotiationBlob captionsSettings](v7, "captionsSettings")
    && !-[VCMediaNegotiator negotiateCaptionsWithCaptionsSettings:](self, "negotiateCaptionsWithCaptionsSettings:", -[VCMediaNegotiationBlob captionsSettings](v7, "captionsSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.7();
    }
    goto LABEL_66;
  }
  if (-[VCMediaNegotiationBlob momentsSettings](v7, "momentsSettings")
    && !-[VCMediaNegotiator negotiateMomentsWithMomentsSettings:](self, "negotiateMomentsWithMomentsSettings:", -[VCMediaNegotiationBlob momentsSettings](v7, "momentsSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.6();
    }
    goto LABEL_66;
  }
  if (-[NSMutableArray count](-[VCMediaNegotiationBlob multiwayAudioStreams](v7, "multiwayAudioStreams"), "count")
    && !-[VCMediaNegotiator negotiateMultiwayAudioStreams:](self, "negotiateMultiwayAudioStreams:", -[VCMediaNegotiationBlob multiwayAudioStreams](v7, "multiwayAudioStreams")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.5();
    }
    goto LABEL_66;
  }
  if (-[NSMutableArray count](-[VCMediaNegotiationBlob multiwayVideoStreams](v7, "multiwayVideoStreams"), "count")
    && !-[VCMediaNegotiator negotiateMultiwayVideoStreams:](self, "negotiateMultiwayVideoStreams:", -[VCMediaNegotiationBlob multiwayVideoStreams](v7, "multiwayVideoStreams")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processRemoteNegotiationData:].cold.4();
    }
    goto LABEL_66;
  }
  v13 = 1;
LABEL_30:

  return v13;
}

+ (id)negotiationBlobFromData:(id)a3
{
  id v3;
  VCMediaNegotiationBlob *v4;

  v3 = +[VCMediaNegotiator newDecompressedBlob:](VCMediaNegotiator, "newDecompressedBlob:");
  v4 = -[VCMediaNegotiationBlob initWithData:]([VCMediaNegotiationBlob alloc], "initWithData:", v3);

  return v4;
}

+ (id)localConfigurationWithData:(id)a3 deviceRole:(int)a4 preferredAudioPayload:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  VCMediaNegotiatorLocalConfiguration *v8;
  VCMediaNegotiatorLocalConfiguration *v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = objc_alloc_init(VCMediaNegotiatorLocalConfiguration);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiator localConfigurationWithData:deviceRole:preferredAudioPayload:].cold.1();
    }
    goto LABEL_11;
  }
  if (!+[VCMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:](VCMediaNegotiator, "initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:", v8, a3, v6, v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiator localConfigurationWithData:deviceRole:preferredAudioPayload:].cold.2();
    }
LABEL_11:
    v9 = 0;
    goto LABEL_4;
  }
  v9 = v8;
LABEL_4:

  return v9;
}

+ (BOOL)addMediaConfigurationsToLocalConfiguration:(id)a3 withBlob:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;

  v6 = (void *)objc_msgSend(a4, "videoSettings");
  v7 = objc_msgSend(a4, "screenSettings");
  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "audioSettings"), "newMediaNegotiatorAudioConfiguration");
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiator addMediaConfigurationsToLocalConfiguration:withBlob:].cold.1();
    }
    goto LABEL_17;
  }
  objc_msgSend(a3, "setMediaConfiguration:forMediaType:", v8, 1);
  if (!v6)
    goto LABEL_5;
  v9 = objc_msgSend((id)objc_msgSend(a4, "videoSettings"), "newCameraConfiguration");
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiator addMediaConfigurationsToLocalConfiguration:withBlob:].cold.3();
    }
LABEL_17:
    v6 = 0;
LABEL_18:
    v11 = 0;
    v12 = 0;
    goto LABEL_10;
  }
  v6 = (void *)v9;
  objc_msgSend(a3, "setMediaConfiguration:forMediaType:", v9, 2);
LABEL_5:
  if (!v7)
  {
    v11 = 0;
    goto LABEL_9;
  }
  v10 = objc_msgSend((id)objc_msgSend(a4, "screenSettings"), "newScreenConfigurationWithCameraConfiguration:", v6);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiator addMediaConfigurationsToLocalConfiguration:withBlob:].cold.2();
    }
    goto LABEL_18;
  }
  v11 = (void *)v10;
  objc_msgSend(a3, "setMediaConfiguration:forMediaType:", v10, 3);
LABEL_9:
  v12 = 1;
LABEL_10:

  return v12;
}

+ (BOOL)initializeLocalConfiguration:(id)a3 negotiationData:(id)a4 deviceRole:(int)a5 preferredAudioPayload:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v41;
  id v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
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
  uint64_t v63;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v63 = *MEMORY[0x1E0C80C00];
  v11 = +[VCMediaNegotiator negotiationBlobFromData:](VCMediaNegotiator, "negotiationBlobFromData:", a4);
  if (v11)
  {
    v12 = v11;
    v42 = a1;
    v13 = objc_msgSend(v11, "ntpTime");
    objc_msgSend(a3, "setDeviceRole:", v7);
    objc_msgSend(a3, "setPreferredAudioCodec:", v6);
    objc_msgSend(a3, "setCreationTime:", v13);
    objc_msgSend(a3, "setMediaControlInfoVersion:", objc_msgSend(v12, "mediaControlInfoVersion"));
    objc_msgSend(a3, "setAllowRTCPFB:", objc_msgSend((id)objc_msgSend(v12, "videoSettings"), "allowRTCPFB"));
    objc_msgSend(a3, "setIsCaller:", 1);
    objc_msgSend(a3, "setAccessNetworkType:", objc_msgSend(v12, "accessNetworkType"));
    objc_msgSend(a3, "setCustomVideoWidth:", objc_msgSend((id)objc_msgSend(v12, "screenSettings"), "customVideoWidth"));
    objc_msgSend(a3, "setCustomVideoHeight:", objc_msgSend((id)objc_msgSend(v12, "screenSettings"), "customVideoHeight"));
    objc_msgSend(a3, "setTilesPerVideoFrame:", objc_msgSend((id)objc_msgSend(v12, "screenSettings"), "tilesPerFrame"));
    objc_msgSend(a3, "setBlackFrameOnClearScreenEnabled:", objc_msgSend((id)objc_msgSend(v12, "screenSettings"), "blackFrameOnClearScreenEnabled"));
    objc_msgSend(a3, "setBasebandCodec:", objc_msgSend(v12, "basebandCodec"));
    objc_msgSend(a3, "setBasebandCodecSampleRate:", objc_msgSend(v12, "basebandCodecSampleRate"));
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v14 = (void *)objc_msgSend(v12, "multiwayAudioStreams");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v60;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v60 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v18), "newMultiwayAudioStream");
          objc_msgSend(a3, "addMultiwayAudioStream:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
      }
      while (v16);
    }
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v20 = (void *)objc_msgSend(v12, "multiwayVideoStreams");
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v55;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v55 != v23)
            objc_enumerationMutation(v20);
          v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v24), "newMultiwayVideoStream");
          objc_msgSend(a3, "addMultiwayVideoStream:", v25);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
      }
      while (v22);
    }
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v26 = (void *)objc_msgSend(v12, "bandwidthSettings", a4);
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v50;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v50 != v29)
            objc_enumerationMutation(v26);
          v31 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * v30), "newBandwidthConfigurations");
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v45;
            do
            {
              v35 = 0;
              do
              {
                if (*(_QWORD *)v45 != v34)
                  objc_enumerationMutation(v31);
                objc_msgSend(a3, "addBandwidthConfiguration:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v35++));
              }
              while (v33 != v35);
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
            }
            while (v33);
          }

          ++v30;
        }
        while (v30 != v28);
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
      }
      while (v28);
    }
    v36 = (void *)objc_msgSend((id)objc_msgSend(v12, "momentsSettings"), "newVideoCodecSet");
    objc_msgSend(a3, "setMediaRecorderVideoCodecs:", v36);

    v37 = (void *)objc_msgSend((id)objc_msgSend(v12, "momentsSettings"), "newImageTypeSet");
    objc_msgSend(a3, "setMediaRecorderImageTypes:", v37);

    v38 = (void *)objc_msgSend(v12, "faceTimeSettings");
    objc_msgSend(a3, "setSIPDisabled:", objc_msgSend(v38, "SIPDisabled"));
    objc_msgSend(a3, "setSecureMessagingRequired:", objc_msgSend(v38, "secureMessagingRequired"));
    objc_msgSend(a3, "setFaceTimeSwitches:", objc_msgSend(v38, "switches"));
    objc_msgSend(a3, "setOneToOneModeSupported:", objc_msgSend(v38, "oneToOneModeSupported"));
    objc_msgSend(a3, "setMediaControlInfoFECFeedbackVersion:", objc_msgSend(v38, "mediaControlInfoFECFeedbackVersion"));
    objc_msgSend(a3, "setLinkProbingCapabilityVersion:", objc_msgSend(v38, "linkProbingCapabilityVersion"));
    if ((objc_msgSend(v42, "addMediaConfigurationsToLocalConfiguration:withBlob:", a3, v12) & 1) != 0)
    {
      objc_msgSend(v12, "printWithTitle:blobSize:logFile:", CFSTR("Cached invite media blob"), objc_msgSend(v41, "length"), objc_msgSend(a3, "callLogFile"));
      LOBYTE(v39) = 1;
      return v39;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v39 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v39)
        return v39;
      +[VCMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v39 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v39)
      return v39;
    +[VCMediaNegotiator initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:].cold.1();
  }
  LOBYTE(v39) = 0;
  return v39;
}

- (id)newResponseBlob
{
  __objc2_class_ro **p_info;
  VCMediaNegotiationBlob *v4;
  VCMediaNegotiationBlob *v5;
  _BOOL8 v6;
  void *v7;
  id v8;
  VCMediaNegotiatorAudioConfiguration *v9;
  VCMediaNegotiatorAudioConfiguration *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  VCMediaNegotiationBlobAudioSettings *v16;
  VCMediaNegotiationBlobAudioSettings *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 isCellular16x9Capable;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  VCMediaNegotiationBlobVideoSettings *v28;
  unsigned int v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  unsigned int v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  VCMediaNegotiationBlobVideoSettings *v52;
  void *v53;
  VCMediaNegotiationBlobAudioSettings *v54;
  VCMediaNegotiationBlob *v55;
  _BYTE v56[128];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  p_info = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
  if (-[VCMediaNegotiatorLocalConfiguration isCaller](self->super._localSettings, "isCaller"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator newResponseBlob].cold.1();
    }
    goto LABEL_46;
  }
  v4 = objc_alloc_init(VCMediaNegotiationBlob);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator newResponseBlob].cold.2();
    }
LABEL_46:
    v38 = 0;
    v36 = 0;
    v25 = 0;
    v17 = 0;
    v10 = 0;
    v5 = 0;
    goto LABEL_39;
  }
  v5 = v4;
  -[VCMediaNegotiationBlob setBlobVersion:](v4, "setBlobVersion:", 2);
  -[VCMediaNegotiationBlob setUserAgent:](v5, "setUserAgent:", CFSTR("Viceroy 1.7.0/GK"));
  -[VCMediaNegotiationBlob setBasebandCodecSampleRate:](v5, "setBasebandCodecSampleRate:", -[VCMediaNegotiatorLocalConfiguration basebandCodecSampleRate](self->super._localSettings, "basebandCodecSampleRate"));
  -[VCMediaNegotiationBlob setBasebandCodec:](v5, "setBasebandCodec:", -[VCMediaNegotiatorLocalConfiguration basebandCodec](self->super._localSettings, "basebandCodec"));
  -[VCMediaNegotiationBlob setMediaControlInfoVersion:](v5, "setMediaControlInfoVersion:", -[VCMediaNegotiatorResults mediaControlInfoVersion](self->super._negotiatedSettings, "mediaControlInfoVersion"));
  if (self->_negotiationMode == 1)
  {
    -[VCMediaNegotiationBlob setAllowDynamicMaxBitrate:](v5, "setAllowDynamicMaxBitrate:", 0);
    v6 = 0;
  }
  else
  {
    -[VCMediaNegotiationBlob setAllowDynamicMaxBitrate:](v5, "setAllowDynamicMaxBitrate:", 1);
    v6 = -[VCMediaNegotiatorResults supportsDynamicMaxBitrate](self->super._negotiatedSettings, "supportsDynamicMaxBitrate");
  }
  -[VCMediaNegotiationBlob setAllowsContentsChangeWithAspectPreservation:](v5, "setAllowsContentsChangeWithAspectPreservation:", v6);
  if (!-[VCMediaNegotiator setupBandwidthSettingsForMediaBlob:](self, "setupBandwidthSettingsForMediaBlob:", v5))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator newResponseBlob].cold.8();
    }
    goto LABEL_57;
  }
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BA0);
  v8 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 1);
  if (!v7)
  {
    v17 = 0;
    v10 = 0;
    goto LABEL_23;
  }
  v9 = -[VCMediaNegotiatorAudioConfiguration initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:]([VCMediaNegotiatorAudioConfiguration alloc], "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:", objc_msgSend(v7, "allowSwitching"), objc_msgSend(v7, "allowRecording"), 1, objc_msgSend(v8, "ssrc"), objc_msgSend(v8, "audioUnitNumber"));
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
      v38 = 0;
      v36 = 0;
      v25 = 0;
      v17 = 0;
      v10 = 0;
      goto LABEL_72;
    }
    VRTraceErrorLogLevelToCSTR();
    p_info = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiator newResponseBlob].cold.6();
LABEL_57:
    v38 = 0;
    v36 = 0;
    v25 = 0;
    v17 = 0;
    v10 = 0;
    goto LABEL_39;
  }
  v10 = v9;
  -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v9, "addAudioPayload:isSecondary:", objc_msgSend(v7, "primaryPayload"), 0);
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v11 = (void *)objc_msgSend(v7, "secondaryPayloads");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v58 != v14)
          objc_enumerationMutation(v11);
        -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v10, "addAudioPayload:isSecondary:", objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "intValue"), 1);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v57, v56, 16);
    }
    while (v13);
  }
  if (objc_msgSend(v7, "redPayload") != 128)
    -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v10, "addAudioPayload:isSecondary:", objc_msgSend(v7, "redPayload"), 1);
  if (objc_msgSend(v7, "dtxPayload") != 128)
    -[VCMediaNegotiatorAudioConfiguration addAudioPayload:isSecondary:](v10, "addAudioPayload:isSecondary:", objc_msgSend(v7, "dtxPayload"), 1);
  v16 = -[VCMediaNegotiationBlobAudioSettings initWithAudioConfiguration:]([VCMediaNegotiationBlobAudioSettings alloc], "initWithAudioConfiguration:", v10);
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      p_info = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator newResponseBlob].cold.7();
      v38 = 0;
      v36 = 0;
      v25 = 0;
      v17 = 0;
      goto LABEL_39;
    }
    v38 = 0;
    v36 = 0;
    v25 = 0;
    v17 = 0;
LABEL_72:
    p_info = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
    goto LABEL_39;
  }
  v17 = v16;
  -[VCMediaNegotiationBlob setAudioSettings:](v5, "setAudioSettings:", v16);
LABEL_23:
  v55 = v5;
  v18 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BB8);
  v19 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 2);
  v54 = v17;
  if (objc_msgSend(v18, "isSupported"))
  {
    v52 = [VCMediaNegotiationBlobVideoSettings alloc];
    v50 = objc_msgSend(v19, "ssrc");
    v48 = objc_msgSend(v18, "isRTCPFBEnabled");
    v20 = objc_msgSend(v18, "videoRuleCollections");
    v21 = objc_msgSend(v19, "videoFeatureStrings");
    isCellular16x9Capable = self->_isCellular16x9Capable;
    v23 = -[VCMediaNegotiatorLocalConfiguration tilesPerVideoFrame](self->super._localSettings, "tilesPerVideoFrame");
    LOBYTE(v40) = -[VCMediaNegotiatorLocalConfiguration ltrpEnabled](self->super._localSettings, "ltrpEnabled");
    v24 = -[VCMediaNegotiationBlobVideoSettings initWithSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:](v52, "initWithSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:", v50, v48, v20, v21, isCellular16x9Capable, v23, v40, objc_msgSend(v18, "pixelFormats"), objc_msgSend(v18, "hdrModesNegotiated"));
    if (!v24)
    {
      p_info = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      {
        v38 = 0;
        v36 = 0;
        v25 = 0;
      }
      else
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator newResponseBlob].cold.3();
        v38 = 0;
        v36 = 0;
        v25 = 0;
      }
      goto LABEL_39;
    }
    v25 = (void *)v24;
    -[VCMediaNegotiationBlob setVideoSettings:](v5, "setVideoSettings:", v24);
  }
  else
  {
    v25 = 0;
  }
  v26 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BD0);
  v27 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 3);
  if (!objc_msgSend(v26, "isSupported"))
  {
    v36 = 0;
    p_info = VCCaptionsReceiver.info;
    goto LABEL_31;
  }
  v53 = v25;
  v28 = [VCMediaNegotiationBlobVideoSettings alloc];
  v51 = objc_msgSend(v27, "ssrc");
  v49 = objc_msgSend(v26, "isRTCPFBEnabled");
  v47 = objc_msgSend(v26, "videoRuleCollections");
  v46 = objc_msgSend(v26, "featureStrings");
  v45 = self->_isCellular16x9Capable;
  v44 = -[VCMediaNegotiatorLocalConfiguration customVideoWidth](self->super._localSettings, "customVideoWidth");
  v43 = -[VCMediaNegotiatorLocalConfiguration customVideoHeight](self->super._localSettings, "customVideoHeight");
  v29 = objc_msgSend(v26, "tilesPerFrame");
  v30 = objc_msgSend(v26, "ltrpEnabled");
  v31 = objc_msgSend(v26, "pixelFormats");
  v32 = objc_msgSend(v26, "hdrModesNegotiated");
  v33 = objc_msgSend(v26, "fecEnabled");
  v34 = objc_msgSend(v26, "rtxEnabled");
  BYTE2(v42) = objc_msgSend(v26, "blackFrameOnClearScreenEnabled");
  BYTE1(v42) = v34;
  LOBYTE(v42) = v33;
  LOBYTE(v41) = v30;
  v35 = -[VCMediaNegotiationBlobVideoSettings initWithScreenSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:](v28, "initWithScreenSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:", v51, v49, v47, v46, v45, v44, __PAIR64__(v29, v43), v41, v31, v32, v42);
  v5 = v55;
  if (v35)
  {
    v36 = (void *)v35;
    -[VCMediaNegotiationBlob setScreenSettings:](v55, "setScreenSettings:", v35);
    p_info = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
    v25 = v53;
    v17 = v54;
LABEL_31:
    if (self->_negotiatedCaptionsSettings)
      -[VCMediaNegotiator setupCaptionsForMediaBlob:](self, "setupCaptionsForMediaBlob:", v5);
    if (self->super._negotiatedMediaRecorderSettings)
      -[VCMediaNegotiator setupMomentsForMediaBlob:](self, "setupMomentsForMediaBlob:", v5);
    if (self->super._negotiatedFaceTimeSettings)
      -[VCMediaNegotiator setupFaceTimeSettingsForMediaBlob:isResponse:](self, "setupFaceTimeSettingsForMediaBlob:isResponse:", v5, 1);
    v37 = (void *)objc_msgSend(p_info + 461, "newCompressedBlob:", -[VCMediaNegotiationBlob data](v5, "data"));
    if (v37)
    {
      v38 = v37;
      -[VCMediaNegotiationBlob printWithTitle:blobSize:logFile:](v5, "printWithTitle:blobSize:logFile:", CFSTR("Created response media blob"), objc_msgSend(v37, "length"), -[VCMediaNegotiatorLocalConfiguration callLogFile](self->super._localSettings, "callLogFile"));
      self->_usePreNegotiation = 1;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator newResponseBlob].cold.5();
      }
      v38 = 0;
    }
    goto LABEL_39;
  }
  p_info = (__objc2_class_ro **)(VCCaptionsReceiver + 32);
  v25 = v53;
  v17 = v54;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiator newResponseBlob].cold.4();
  }
  v38 = 0;
  v36 = 0;
LABEL_39:

  objc_msgSend(p_info + 461, "dumpBlob:prefix:force:", v38, CFSTR("mediablob_response"), 0);
  return v38;
}

- (BOOL)processResponseBlob:(id)a3
{
  id v5;
  void *v6;
  VCMediaNegotiationBlob *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  BOOL v11;
  _BYTE v13[12];
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[VCMediaNegotiator dumpBlob:prefix:force:](VCMediaNegotiator, "dumpBlob:prefix:force:", a3, CFSTR("mediablob_response_remote"), 0);
  if (!-[VCMediaNegotiatorLocalConfiguration isCaller](self->super._localSettings, "isCaller"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processResponseBlob:].cold.10();
    }
    goto LABEL_30;
  }
  v5 = +[VCMediaNegotiator newDecompressedBlob:](VCMediaNegotiator, "newDecompressedBlob:", a3);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processResponseBlob:].cold.1();
    }
LABEL_30:
    v6 = 0;
LABEL_53:
    v11 = 0;
    v7 = 0;
    goto LABEL_23;
  }
  v6 = v5;
  v7 = -[VCMediaNegotiationBlob initWithData:]([VCMediaNegotiationBlob alloc], "initWithData:", v5);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processResponseBlob:].cold.2();
    }
    goto LABEL_53;
  }
  -[VCMediaNegotiationBlob printWithTitle:blobSize:logFile:](v7, "printWithTitle:blobSize:logFile:", CFSTR("Received response media blob"), objc_msgSend(v6, "length"), -[VCMediaNegotiatorLocalConfiguration callLogFile](self->super._localSettings, "callLogFile"));
  -[VCMediaNegotiatorResults setSupportsDynamicMaxBitrate:](self->super._negotiatedSettings, "setSupportsDynamicMaxBitrate:", -[VCMediaNegotiationBlob allowDynamicMaxBitrate](v7, "allowDynamicMaxBitrate"));
  -[VCMediaNegotiatorResults setRemoteUserAgent:](self->super._negotiatedSettings, "setRemoteUserAgent:", -[VCMediaNegotiationBlob userAgent](v7, "userAgent"));
  -[VCMediaNegotiatorResults setRemoteBasebandCodec:](self->super._negotiatedSettings, "setRemoteBasebandCodec:", -[VCMediaNegotiationBlob basebandCodec](v7, "basebandCodec"));
  -[VCMediaNegotiatorResults setRemoteBasebandCodecSampleRate:](self->super._negotiatedSettings, "setRemoteBasebandCodecSampleRate:", -[VCMediaNegotiationBlob basebandCodecSampleRate](v7, "basebandCodecSampleRate"));
  -[VCMediaNegotiatorResults setAccessNetworkType:](self->super._negotiatedSettings, "setAccessNetworkType:", -[VCMediaNegotiationBlob accessNetworkType](v7, "accessNetworkType"));
  -[VCMediaNegotiatorResults setMediaControlInfoVersion:](self->super._negotiatedSettings, "setMediaControlInfoVersion:", -[VCMediaNegotiationBlob mediaControlInfoVersion](v7, "mediaControlInfoVersion"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = -[VCMediaNegotiatorResults mediaControlInfoVersion](self->super._negotiatedSettings, "mediaControlInfoVersion");
      *(_DWORD *)v13 = 136315906;
      *(_QWORD *)&v13[4] = v8;
      v14 = 2080;
      v15 = "-[VCMediaNegotiator processResponseBlob:]";
      v16 = 1024;
      v17 = 643;
      v18 = 1024;
      v19 = v10 == 2;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch after negotiation updatedAFRCHeaderEnabled %d", v13, 0x22u);
    }
  }
  -[VCMediaNegotiator saveRemoteBandwidthSettingsWithMediaBlob:](self, "saveRemoteBandwidthSettingsWithMediaBlob:", v7, *(_QWORD *)v13);
  if (!-[VCMediaNegotiationBlob hasBlobVersion](v7, "hasBlobVersion")
    || !-[VCMediaNegotiationBlob blobVersion](v7, "blobVersion"))
  {
    -[VCMediaNegotiationBlobAudioSettings setUseSBR:](-[VCMediaNegotiationBlob audioSettings](v7, "audioSettings"), "setUseSBR:", 0);
  }
  if (-[VCMediaNegotiationBlob audioSettings](v7, "audioSettings")
    && !-[VCMediaNegotiator setupAudioWithNegotiatedSettings:](self, "setupAudioWithNegotiatedSettings:", -[VCMediaNegotiationBlob audioSettings](v7, "audioSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processResponseBlob:].cold.8();
    }
    goto LABEL_49;
  }
  if (-[VCMediaNegotiationBlob videoSettings](v7, "videoSettings")
    && !-[VCMediaNegotiator setupVideoWithNegotiatedSettings:](self, "setupVideoWithNegotiatedSettings:", -[VCMediaNegotiationBlob videoSettings](v7, "videoSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processResponseBlob:].cold.7();
    }
    goto LABEL_49;
  }
  if (-[VCMediaNegotiationBlob screenSettings](v7, "screenSettings")
    && !-[VCMediaNegotiator setupScreenWithNegotiatedSettings:](self, "setupScreenWithNegotiatedSettings:", -[VCMediaNegotiationBlob screenSettings](v7, "screenSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processResponseBlob:].cold.6();
    }
    goto LABEL_49;
  }
  if (-[VCMediaNegotiationBlob captionsSettings](v7, "captionsSettings")
    && !-[VCMediaNegotiator negotiateCaptionsWithCaptionsSettings:](self, "negotiateCaptionsWithCaptionsSettings:", -[VCMediaNegotiationBlob captionsSettings](v7, "captionsSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processResponseBlob:].cold.5();
    }
    goto LABEL_49;
  }
  if (-[VCMediaNegotiationBlob momentsSettings](v7, "momentsSettings")
    && !-[VCMediaNegotiator negotiateMomentsWithMomentsSettings:](self, "negotiateMomentsWithMomentsSettings:", -[VCMediaNegotiationBlob momentsSettings](v7, "momentsSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processResponseBlob:].cold.4();
    }
    goto LABEL_49;
  }
  if (-[VCMediaNegotiationBlob faceTimeSettings](v7, "faceTimeSettings")
    && !-[VCMediaNegotiator negotiateFaceTimeSettings:](self, "negotiateFaceTimeSettings:", -[VCMediaNegotiationBlob faceTimeSettings](v7, "faceTimeSettings")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator processResponseBlob:].cold.3();
    }
LABEL_49:
    v11 = 0;
    goto LABEL_23;
  }
  v11 = 1;
  self->_usePreNegotiation = 1;
LABEL_23:

  return v11;
}

- (unsigned)remoteMaxBandwidthForArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
  return -[VCMediaNegotiatorResults maxBandwidthWithArbiterMode:connectionType:](self->super._negotiatedSettings, "maxBandwidthWithArbiterMode:connectionType:", a3, *(_QWORD *)&a4);
}

+ (id)negotiatedFeaturesStringWithLocalFeaturesString:(id)a3 remoteFeaturesString:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  _QWORD v21[6];
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
  v5 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(";"));
  v6 = (void *)objc_msgSend(a4, "componentsSeparatedByString:", CFSTR(";"));
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiator negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:].cold.1();
    }
    goto LABEL_25;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v5);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR(":")), "firstObject"));
      }
      v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    }
    while (v10);
  }
  v13 = objc_opt_new();
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiator negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:].cold.2();
    }
LABEL_25:
    v14 = 0;
    v19 = 0;
    goto LABEL_18;
  }
  v14 = (void *)v13;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v6);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "componentsSeparatedByString:", CFSTR(":")), "firstObject"));
      }
      v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v16);
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __90__VCMediaNegotiator_negotiatedFeaturesStringWithLocalFeaturesString_remoteFeaturesString___block_invoke;
  v21[3] = &unk_1E9E56F40;
  v21[4] = v8;
  v21[5] = v7;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v21);
  v19 = (void *)objc_msgSend(v7, "componentsJoinedByString:", CFSTR(";"));
LABEL_18:

  return v19;
}

uint64_t __90__VCMediaNegotiator_negotiatedFeaturesStringWithLocalFeaturesString_remoteFeaturesString___block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v5;

  if (a2)
  {
    v5 = result;
    result = objc_msgSend(a2, "length");
    if (result)
    {
      result = objc_msgSend(*(id *)(v5 + 32), "objectForKeyedSubscript:", a2);
      if (result)
        return objc_msgSend(*(id *)(v5 + 40), "addObject:", a3);
    }
  }
  return result;
}

+ (BOOL)validateMultiwayVideoStreamConfigurations:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  int ErrorLogLevelForModule;
  uint64_t v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
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
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v28;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v7)
        objc_enumerationMutation(a3);
      v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
      if (objc_msgSend(v9, "isSubstream"))
      {
        if (!v6)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v11)
              return v11;
            +[VCMediaNegotiator validateMultiwayVideoStreamConfigurations:].cold.1();
          }
LABEL_20:
          LOBYTE(v11) = 0;
          return v11;
        }
        v10 = objc_msgSend(v9, "ssrc");
        if (v10 != objc_msgSend(v6, "ssrc"))
        {
          ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
          if (ErrorLogLevelForModule >= 3)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *MEMORY[0x1E0CF2758];
            v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
            if (!v11)
              return v11;
            v16 = 136316162;
            v17 = v13;
            v18 = 2080;
            v19 = "+[VCMediaNegotiator validateMultiwayVideoStreamConfigurations:]";
            v20 = 1024;
            v21 = 747;
            v22 = 1024;
            v23 = objc_msgSend(v9, "ssrc");
            v24 = 1024;
            v25 = objc_msgSend(v6, "ssrc");
            _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Substream ssrc[%x] doesn't match its corresponding parent stream[%x]", (uint8_t *)&v16, 0x28u);
          }
          goto LABEL_20;
        }
      }
      else
      {
        v6 = v9;
      }
      if (v5 == ++v8)
      {
        v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }
  LOBYTE(v11) = 1;
  return v11;
}

+ (BOOL)validateMultiwayAudioStreamConfigurations:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(a3);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "isSubstream"))
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      +[VCMediaNegotiator validateMultiwayAudioStreamConfigurations:].cold.1();
    }
    LOBYTE(v8) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v8) = 1;
  }
  return v8;
}

+ (BOOL)validateLocalConfiguration:(id)a3
{
  _BOOL4 v4;

  v4 = +[VCMediaNegotiator validateMultiwayVideoStreamConfigurations:](VCMediaNegotiator, "validateMultiwayVideoStreamConfigurations:", objc_msgSend(a3, "multiwayVideoStreams"));
  if (v4)
    LOBYTE(v4) = +[VCMediaNegotiator validateMultiwayAudioStreamConfigurations:](VCMediaNegotiator, "validateMultiwayAudioStreamConfigurations:", objc_msgSend(a3, "multiwayAudioStreams"));
  return v4;
}

+ (void)dumpBlob:(id)a3 prefix:(id)a4 force:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  FILE **v11;
  uint8_t buf[12];
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v5 = a5;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[VCDefaults dumpMediaBlob](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "dumpMediaBlob")|| v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v8;
        v13 = 2080;
        v14 = "+[VCMediaNegotiator dumpBlob:prefix:force:]";
        v15 = 1024;
        v16 = 779;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob dump enabled !!", buf, 0x1Cu);
      }
    }
    v10 = objc_msgSend(a4, "UTF8String");
    memset(buf, 170, sizeof(buf));
    __sprintf_chk((char *)buf, 0, 0xCuLL, "%010u", 0);
    v11 = VRLogfileAlloc(0, (uint64_t)buf, v10, (uint64_t)".blob", "com.apple.VideoConference.MediaBlob", 9);
    VRLogfileWrite(v11, objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"));
    VRLogfileFree((uint64_t *)&v11);
  }
}

- (BOOL)addBandwidthSettingsForMediaBlob:(id)a3 arbiterMode:(unsigned __int8)a4 connectionType:(int)a5 maxBitrate:(unsigned int)a6
{
  uint64_t v6;
  int v8;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  VCMediaNegotiationBlobBandwidthSettings *v18;
  VCMediaNegotiationBlobBandwidthSettings *v19;
  uint64_t v20;
  NSObject *v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  _BYTE v33[128];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v6 = *(_QWORD *)&a6;
  v8 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v10 = +[VCMediaNegotiationBlobBandwidthSettings bandwidthConfigurationWithArbiterMode:connectionType:](VCMediaNegotiationBlobBandwidthSettings, "bandwidthConfigurationWithArbiterMode:connectionType:", a4, *(_QWORD *)&a5);
  if (v10)
  {
    v11 = v10;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = (void *)objc_msgSend(a3, "bandwidthSettings");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v17, "maxBandwidth") == (_DWORD)v6)
          {
            if (v11 < 4096)
              objc_msgSend(v17, "setConfiguration:", objc_msgSend(v17, "configuration") | v11);
            else
              objc_msgSend(v17, "setConfigurationExtension:", objc_msgSend(v17, "configurationExtension") | v11);
            goto LABEL_22;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v33, 16);
        if (v14)
          continue;
        break;
      }
    }
    v18 = objc_alloc_init(VCMediaNegotiationBlobBandwidthSettings);
    if (!v18)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v10)
          return v10;
        v23 = 136316162;
        v24 = v20;
        v25 = 2080;
        v26 = "-[VCMediaNegotiator addBandwidthSettingsForMediaBlob:arbiterMode:connectionType:maxBitrate:]";
        v27 = 1024;
        v28 = 816;
        v29 = 1024;
        v30 = a5;
        v31 = 1024;
        v32 = v8;
        _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create bandwidth setting: connection type=%d, operating mode=%hhu", (uint8_t *)&v23, 0x28u);
      }
      LOBYTE(v10) = 0;
      return v10;
    }
    v19 = v18;
    -[VCMediaNegotiationBlobBandwidthSettings setMaxBandwidth:](v18, "setMaxBandwidth:", v6);
    if (v11 < 4096)
      -[VCMediaNegotiationBlobBandwidthSettings setConfiguration:](v19, "setConfiguration:", -[VCMediaNegotiationBlobBandwidthSettings configuration](v19, "configuration") | v11);
    else
      -[VCMediaNegotiationBlobBandwidthSettings setConfigurationExtension:](v19, "setConfigurationExtension:", -[VCMediaNegotiationBlobBandwidthSettings configurationExtension](v19, "configurationExtension") | v11);
    objc_msgSend(a3, "addBandwidthSettings:", v19);

LABEL_22:
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)setupBandwidthSettingsForMediaBlob:(id)a3
{
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
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
  v5 = -[VCMediaNegotiatorLocalConfiguration bandwidthConfigurations](self->super._localSettings, "bandwidthConfigurations");
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = -[VCMediaNegotiator addBandwidthSettingsForMediaBlob:arbiterMode:connectionType:maxBitrate:](self, "addBandwidthSettingsForMediaBlob:arbiterMode:connectionType:maxBitrate:", a3, objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "mode"), objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "connectionType"), objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "maxBandwidth"));
      if (!v10)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (void)saveRemoteBandwidthSettingsWithMediaBlob:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_msgSend(a3, "bandwidthSettings");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "newBandwidthConfigurations");
        -[VCMediaNegotiatorResults addBandwidthConfigurations:](self->super._negotiatedSettings, "addBandwidthConfigurations:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
}

+ (id)newDecompressedBlob:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  _BYTE __b[2500];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  objc_msgSend(a3, "bytes");
  objc_msgSend(a3, "length");
  if (CompressionUtils_DecompressWithZlib())
    return 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v8 = v5;
      v9 = 2080;
      v10 = "+[VCMediaNegotiator newDecompressedBlob:]";
      v11 = 1024;
      v12 = 856;
      v13 = 2080;
      v14 = "+[VCMediaNegotiator newDecompressedBlob:]";
      v15 = 1024;
      v16 = objc_msgSend(a3, "length");
      v17 = 1024;
      v18 = 2500;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob size %s: %d -> %d bytes", buf, 0x32u);
    }
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", __b, 2500);
}

+ (id)newCompressedBlob:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  double v20;
  _BYTE __b[2500];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  objc_msgSend(a3, "bytes");
  objc_msgSend(a3, "length");
  if (CompressionUtils_CompressWithZLib())
    return 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      v8 = v5;
      v9 = 2080;
      v10 = "+[VCMediaNegotiator newCompressedBlob:]";
      v11 = 1024;
      v12 = 867;
      v13 = 2080;
      v14 = "+[VCMediaNegotiator newCompressedBlob:]";
      v15 = 1024;
      v16 = objc_msgSend(a3, "length");
      v17 = 1024;
      v18 = 2500;
      v19 = 2048;
      v20 = (float)((float)2500 / (float)(int)objc_msgSend(a3, "length"));
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media blob size %s: %d -> %d bytes with ratio %f", buf, 0x3Cu);
    }
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", __b, 2500);
}

- (void)negotiateAudioAllowRecording:(id)a3 microphoneConfiguration:(id)a4
{
  void *v6;
  uint64_t v7;

  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BA0);
  if (objc_msgSend(a4, "allowAudioRecording"))
    v7 = objc_msgSend(a3, "allowAudioRecording");
  else
    v7 = 0;
  objc_msgSend(v6, "setAllowRecording:", v7);
}

- (void)negotiateAudioUseSBR:(id)a3
{
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BA0), "setUseSBR:", objc_msgSend(a3, "useSBR"));
}

- (BOOL)negotiateAudioPrimaryPayload:(id)a3 microphoneConfiguration:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = +[VCAudioRuleCollection getForcedPayload](VCAudioRuleCollection, "getForcedPayload");
  v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BA0);
  if ((_DWORD)v7 == 128)
  {
    v9 = (void *)objc_msgSend(a4, "audioPayloads");
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = (void *)objc_msgSend(a3, "audioPayloads");
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      v14 = 0x7FFFFFFFFFFFFFFFLL;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "intValue");
          if ((_DWORD)v17 == -[VCMediaNegotiatorLocalConfiguration preferredAudioCodec](self->super._localSettings, "preferredAudioCodec"))
          {
            v21 = v8;
            v22 = v17;
            goto LABEL_19;
          }
          if (objc_msgSend(v9, "containsObject:", v16))
          {
            v18 = objc_msgSend(&unk_1E9EFA238, "indexOfObject:", v16);
            if (v18 < v14)
              v14 = v18;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
        if (v12)
          continue;
        break;
      }
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v8, "setPrimaryPayload:", objc_msgSend((id)objc_msgSend(&unk_1E9EFA238, "objectAtIndexedSubscript:", v14), "unsignedIntValue"));
    }
    LOBYTE(v19) = objc_msgSend(v8, "primaryPayload") != 128;
  }
  else
  {
    v20 = (void *)objc_msgSend(a3, "audioPayloads");
    v19 = objc_msgSend(v20, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7));
    if (v19)
    {
      v21 = v8;
      v22 = v7;
LABEL_19:
      objc_msgSend(v21, "setPrimaryPayload:", v22);
      LOBYTE(v19) = 1;
    }
  }
  return v19;
}

- (BOOL)negotiateAudioDTXPayload:(id)a3
{
  void *v4;
  _BOOL4 v5;

  v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BA0);
  if (objc_msgSend(v4, "primaryPayload") == 13)
    goto LABEL_9;
  if (objc_msgSend((id)objc_msgSend(a3, "audioPayloads"), "containsObject:", &unk_1E9EF5C78))
    objc_msgSend(v4, "setDtxPayload:", 13);
  if (objc_msgSend(v4, "dtxPayload") != 128)
  {
LABEL_9:
    LOBYTE(v5) = 1;
    return v5;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_8;
  VRTraceErrorLogLevelToCSTR();
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v5)
  {
    -[VCMediaNegotiator negotiateAudioDTXPayload:].cold.1();
LABEL_8:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)negotiateAudioREDPayload:(id)a3 microphoneConfiguration:(id)a4
{
  void *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BA0);
  if (objc_msgSend((id)objc_msgSend(a3, "audioPayloads"), "containsObject:", &unk_1E9EF5CF0)
    && objc_msgSend((id)objc_msgSend(a4, "audioPayloads"), "containsObject:", &unk_1E9EF5CF0))
  {
    objc_msgSend(v6, "setRedPayload:", 20);
  }
  v7 = objc_msgSend(v6, "redPayload");
  if (v7 == 128 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = v8;
      v13 = 2080;
      v14 = "-[VCMediaNegotiator negotiateAudioREDPayload:microphoneConfiguration:]";
      v15 = 1024;
      v16 = 944;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RED payload not available!", (uint8_t *)&v11, 0x1Cu);
    }
  }
  return v7 != 128;
}

- (void)negotiateAudioSecondaryPayloads:(id)a3 microphoneConfiguration:(id)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BA0);
  objc_msgSend(v7, "setAllowSwitching:", objc_msgSend(a4, "allowAudioSwitching"));
  if (+[VCPayloadUtils isUseCaseWatchContinuity:primaryPayload:](VCPayloadUtils, "isUseCaseWatchContinuity:primaryPayload:", -[VCMediaNegotiatorLocalConfiguration deviceRole](self->super._localSettings, "deviceRole"), objc_msgSend(v7, "primaryPayload")))
  {
    objc_msgSend(v7, "setAllowSwitching:", 0);
  }
  if (objc_msgSend(v7, "allowSwitching"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (void *)objc_msgSend(a3, "audioPayloads");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "intValue");
          if ((_DWORD)v13 != 13 && (_DWORD)v13 != 20)
          {
            v15 = v13;
            if (objc_msgSend(a4, "isSecondaryPayload:", v13)
              && objc_msgSend(a3, "isSecondaryPayload:", v15))
            {
              objc_msgSend(v7, "addSecondaryPayload:", v15);
            }
          }
          ++v12;
        }
        while (v10 != v12);
        v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        v10 = v16;
      }
      while (v16);
    }
    objc_msgSend(v7, "setAllowSwitching:", objc_msgSend((id)objc_msgSend(v7, "secondaryPayloads"), "count") != 0);
  }
}

- (BOOL)negotiateAudioSettings:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BA0);
  v6 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 1);
  objc_msgSend(v5, "setRemoteSSRC:", objc_msgSend(a3, "rtpSSRC"));
  objc_msgSend(v5, "setAudioUnitModel:", objc_msgSend(a3, "audioUnitModel"));
  v7 = (void *)objc_msgSend(a3, "newMediaNegotiatorAudioConfiguration");
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator negotiateAudioSettings:].cold.1();
    }
    goto LABEL_11;
  }
  -[VCMediaNegotiator negotiateAudioUseSBR:](self, "negotiateAudioUseSBR:", v7);
  -[VCMediaNegotiator negotiateAudioAllowRecording:microphoneConfiguration:](self, "negotiateAudioAllowRecording:microphoneConfiguration:", v7, v6);
  if (!-[VCMediaNegotiator negotiateAudioPrimaryPayload:microphoneConfiguration:](self, "negotiateAudioPrimaryPayload:microphoneConfiguration:", v7, v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator negotiateAudioSettings:].cold.2();
    }
LABEL_11:
    v8 = 0;
    goto LABEL_4;
  }
  -[VCMediaNegotiator negotiateAudioDTXPayload:](self, "negotiateAudioDTXPayload:", v7);
  -[VCMediaNegotiator negotiateAudioREDPayload:microphoneConfiguration:](self, "negotiateAudioREDPayload:microphoneConfiguration:", v7, v6);
  -[VCMediaNegotiator negotiateAudioSecondaryPayloads:microphoneConfiguration:](self, "negotiateAudioSecondaryPayloads:microphoneConfiguration:", v7, v6);
  v8 = 1;
LABEL_4:

  return v8;
}

- (BOOL)setupAudioWithNegotiatedSettings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "newMediaNegotiatorAudioConfiguration");
  if (v4)
  {
    v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BA0);
    objc_msgSend(v5, "setAllowRecording:", objc_msgSend(v4, "allowAudioRecording"));
    objc_msgSend(v5, "setAudioUnitModel:", objc_msgSend(v4, "audioUnitNumber"));
    objc_msgSend(v5, "setRemoteSSRC:", objc_msgSend(v4, "ssrc"));
    objc_msgSend(v5, "setUseSBR:", objc_msgSend(v4, "useSBR"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = (void *)objc_msgSend(v4, "audioPayloads");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v6);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "intValue");
          if ((objc_msgSend(v4, "isSecondaryPayload:", v12) & 1) != 0)
          {
            if ((_DWORD)v12 == 20)
            {
              objc_msgSend(v5, "setRedPayload:", 20);
              v9 = 1;
            }
            else if ((_DWORD)v12 == 13)
            {
              objc_msgSend(v5, "setDtxPayload:", 13);
            }
            else
            {
              objc_msgSend(v5, "addSecondaryPayload:", v12);
            }
          }
          else
          {
            objc_msgSend(v5, "setPrimaryPayload:", v12);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }
    v13 = objc_msgSend((id)objc_msgSend(v4, "audioPayloads"), "count");
    v14 = 1;
    if ((v9 & 1) != 0)
      v14 = 2;
    objc_msgSend(v5, "setAllowSwitching:", v13 > v14);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiator setupAudioWithNegotiatedSettings:].cold.1();
  }

  return v4 != 0;
}

- (id)selectVideoFeatureString:(id)a3 selectedPayload:(int)a4 videoConfiguration:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)objc_msgSend(a5, "videoFeatureStrings"), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4)))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (void *)objc_msgSend(a3, "videoPayloadCollections");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v12, "payload") == a4)
          {
            v13 = (id)objc_msgSend((id)objc_msgSend(v12, "featureString"), "copy");
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
        if (v9)
          continue;
        break;
      }
    }
    v13 = 0;
LABEL_12:
    if (objc_msgSend(v13, "length"))
      return v13;
    else
      return 0;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator selectVideoFeatureString:selectedPayload:videoConfiguration:].cold.1();
    }
    return 0;
  }
}

- (BOOL)selectBestVideoRuleForTransport:(unsigned __int8)a3 payload:(int)a4 encodingType:(unsigned __int8)a5 localVideoRuleCollection:(id)a6 remoteVideoSettings:(id)a7 negotiatedVideoSettings:(id)a8 isScreen:(BOOL)a9
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  BOOL v28;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  NSObject *v39;
  int v40;
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v12 = a5;
  v13 = *(_QWORD *)&a4;
  v14 = a3;
  v52 = *MEMORY[0x1E0C80C00];
  v16 = (void *)objc_msgSend(a7, "newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:", a9, self->_isCellular16x9Capable, 0);
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_36;
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    v28 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v40 = 136316418;
    v41 = v30;
    v42 = 2080;
    v43 = "-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoS"
          "ettings:negotiatedVideoSettings:isScreen:]";
    v44 = 1024;
    v45 = 1074;
    v46 = 1024;
    v47 = v13;
    v48 = 1024;
    v49 = v14;
    v50 = 1024;
    v51 = v12;
    v32 = " [%s] %s:%d Failed to extract the remote video rules for payload=%d transport=%d encoding=%d";
LABEL_34:
    v36 = v31;
    v37 = 46;
LABEL_35:
    _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v40, v37);
    goto LABEL_36;
  }
  v17 = objc_msgSend(a6, "getVideoRulesForTransport:payload:encodingType:", v14, v13, v12);
  if (!v17)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_36;
    v33 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    v28 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v40 = 136316418;
    v41 = v33;
    v42 = 2080;
    v43 = "-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoS"
          "ettings:negotiatedVideoSettings:isScreen:]";
    v44 = 1024;
    v45 = 1077;
    v46 = 1024;
    v47 = v13;
    v48 = 1024;
    v49 = v14;
    v50 = 1024;
    v51 = v12;
    v32 = " [%s] %s:%d No local video rules for payload=%d transport=%d encoding=%d";
    goto LABEL_34;
  }
  v18 = v17;
  if ((_DWORD)v12 == 2)
    v19 = 1;
  else
    v19 = 2;
  v20 = objc_msgSend(v16, "getVideoRulesForTransport:payload:encodingType:", v14, v13, v19);
  if (!v20)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_36;
    v34 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    v28 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v40 = 136316418;
    v41 = v34;
    v42 = 2080;
    v43 = "-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoS"
          "ettings:negotiatedVideoSettings:isScreen:]";
    v44 = 1024;
    v45 = 1080;
    v46 = 1024;
    v47 = v13;
    v48 = 1024;
    v49 = v14;
    v50 = 1024;
    v51 = v12;
    v32 = " [%s] %s:%d No remote video rules for payload=%d transport=%d encoding=%d";
    goto LABEL_34;
  }
  if ((_DWORD)v12 == 1)
    v21 = v18;
  else
    v21 = v20;
  if ((_DWORD)v12 == 1)
    v22 = v20;
  else
    v22 = v18;
  v23 = +[VCMediaNegotiatorBase negotiateVideoMaxResolutionWithEncodeRules:decodeRules:isEncoder:](VCMediaNegotiatorBase, "negotiateVideoMaxResolutionWithEncodeRules:decodeRules:isEncoder:", v21, v22, (_DWORD)v12 == 1);
  if (!v23)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_36;
    v35 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    v28 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v40 = 136316418;
    v41 = v35;
    v42 = 2080;
    v43 = "-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoS"
          "ettings:negotiatedVideoSettings:isScreen:]";
    v44 = 1024;
    v45 = 1086;
    v46 = 1024;
    v47 = v13;
    v48 = 1024;
    v49 = v14;
    v50 = 1024;
    v51 = v12;
    v32 = " [%s] %s:%d No matching remote rules for payload=%d transport=%d encoding=%d";
    goto LABEL_34;
  }
  v24 = v23;
  v25 = (void *)objc_msgSend(a8, "featureStrings");
  if (!objc_msgSend(v25, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13)))
  {
    if (a9)
      v26 = 3;
    else
      v26 = 2;
    v27 = -[VCMediaNegotiator selectVideoFeatureString:selectedPayload:videoConfiguration:](self, "selectVideoFeatureString:selectedPayload:videoConfiguration:", a7, v13, -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", v26));
    if (v27)
    {
      objc_msgSend(a8, "addFeatureString:payload:", v27, v13);
      goto LABEL_20;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E0CF2758];
      v28 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      v40 = 136315906;
      v41 = v38;
      v42 = 2080;
      v43 = "-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVide"
            "oSettings:negotiatedVideoSettings:isScreen:]";
      v44 = 1024;
      v45 = 1092;
      v46 = 1024;
      v47 = v13;
      v32 = " [%s] %s:%d Failed to select feature string for payload=%d";
      v36 = v39;
      v37 = 34;
      goto LABEL_35;
    }
LABEL_36:
    v28 = 0;
    goto LABEL_21;
  }
LABEL_20:
  objc_msgSend(a8, "addVideoRules:transportType:payload:encodingType:", v24, v14, v13, v12);
  v28 = 1;
LABEL_21:

  return v28;
}

- (void)negotiateRTCPFB:(id)a3 negotiatedVideoSettings:(id)a4
{
  uint64_t v6;

  if (-[VCMediaNegotiatorLocalConfiguration allowRTCPFB](self->super._localSettings, "allowRTCPFB"))
    v6 = objc_msgSend(a3, "allowRTCPFB");
  else
    v6 = 0;
  objc_msgSend(a4, "setIsRTCPFBEnabled:", v6);
}

- (void)negotiateTilesPerFrame:(id)a3 negotiatedSettings:(id)a4
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v6 = -[VCMediaNegotiatorLocalConfiguration tilesPerVideoFrame](self->super._localSettings, "tilesPerVideoFrame");
  v7 = objc_msgSend(a3, "tilesPerFrame");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  objc_msgSend(a4, "setTilesPerFrame:", v8);
}

- (BOOL)processPixelFormats:(id)a3 videoResults:(id)a4
{
  unsigned int v6;
  int v7;
  BOOL v8;
  int v9;

  v6 = +[VCMediaNegotiationBlobVideoSettings storePixelFormatsInBitMap:](VCMediaNegotiationBlobVideoSettings, "storePixelFormatsInBitMap:", -[VCMediaNegotiatorLocalConfiguration pixelFormats](self->super._localSettings, "pixelFormats"));
  v7 = objc_msgSend(a3, "pixelFormats");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
    return 1;
  v9 = v7 & v6;
  if (v9)
  {
    if ((v9 & 1) != 0)
    {
      objc_msgSend(a4, "addPixelFormatSet:", &unk_1E9EF5D08);
      if ((v9 & 2) == 0)
      {
LABEL_8:
        if ((v9 & 8) == 0)
          goto LABEL_9;
        goto LABEL_17;
      }
    }
    else if ((v9 & 2) == 0)
    {
      goto LABEL_8;
    }
    objc_msgSend(a4, "addPixelFormatSet:", &unk_1E9EF5D20);
    if ((v9 & 8) == 0)
    {
LABEL_9:
      if ((v9 & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_18;
    }
LABEL_17:
    objc_msgSend(a4, "addPixelFormatSet:", &unk_1E9EF5D38);
    if ((v9 & 0x10) == 0)
    {
LABEL_10:
      if ((v9 & 4) == 0)
        goto LABEL_11;
      goto LABEL_19;
    }
LABEL_18:
    objc_msgSend(a4, "addPixelFormatSet:", &unk_1E9EF5D50);
    if ((v9 & 4) == 0)
    {
LABEL_11:
      if ((v9 & 0x20) == 0)
        return 1;
LABEL_12:
      objc_msgSend(a4, "addPixelFormatSet:", &unk_1E9EF5D80);
      return 1;
    }
LABEL_19:
    objc_msgSend(a4, "addPixelFormatSet:", &unk_1E9EF5D68);
    if ((v9 & 0x20) == 0)
      return 1;
    goto LABEL_12;
  }
  return 0;
}

- (BOOL)negotiateHDRMode:(id)a3 videoResults:(id)a4
{
  unsigned int v6;
  int v7;
  BOOL v8;
  int v9;

  v6 = +[VCMediaNegotiationBlobVideoSettings hdrModesBitmapWithSupportedModes:](VCMediaNegotiationBlobVideoSettings, "hdrModesBitmapWithSupportedModes:", -[VCMediaNegotiatorLocalConfiguration hdrModesSupported](self->super._localSettings, "hdrModesSupported"));
  v7 = objc_msgSend(a3, "hdrModesSupported");
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
    return 1;
  v9 = v7 & v6;
  if (v9)
  {
    if ((v9 & 1) != 0)
    {
      objc_msgSend(a4, "addNegotiatedHDRMode:", &unk_1E9EF5D98);
      if ((v9 & 2) == 0)
      {
LABEL_8:
        if ((v9 & 4) == 0)
          goto LABEL_9;
        goto LABEL_15;
      }
    }
    else if ((v9 & 2) == 0)
    {
      goto LABEL_8;
    }
    objc_msgSend(a4, "addNegotiatedHDRMode:", &unk_1E9EF5DB0);
    if ((v9 & 4) == 0)
    {
LABEL_9:
      if ((v9 & 8) == 0)
        return 1;
LABEL_10:
      objc_msgSend(a4, "addNegotiatedHDRMode:", &unk_1E9EF5DE0);
      return 1;
    }
LABEL_15:
    objc_msgSend(a4, "addNegotiatedHDRMode:", &unk_1E9EF5DC8);
    if ((v9 & 8) == 0)
      return 1;
    goto LABEL_10;
  }
  return 0;
}

- (BOOL)processParameterSets:(id)a3 videoResults:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  int v12;
  uint64_t v13;
  _BOOL4 v14;
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
  v5 = (void *)objc_msgSend(a3, "videoPayloadCollections");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      if (!objc_msgSend(v10, "parameterSet"))
        break;
      v11 = objc_msgSend(v10, "parameterSet");
      v12 = objc_msgSend(v10, "parameterSet") & 4 | v11 & 1;
      v13 = v12 | (objc_msgSend(v10, "parameterSet") & 2);
      if ((objc_msgSend(v10, "parameterSet") & 8) != 0)
      {
        v13 = v13 | 8;
      }
      else if (!(_DWORD)v13)
      {
        break;
      }
      objc_msgSend(a4, "addParameterSet:payload:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13), objc_msgSend(v10, "payload"));
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        return v14;
      -[VCMediaNegotiator processParameterSets:videoResults:].cold.1();
    }
    LOBYTE(v14) = 0;
  }
  else
  {
LABEL_13:
    LOBYTE(v14) = 1;
  }
  return v14;
}

- (BOOL)negotiateVideoSettings:(id)a3
{
  VCMediaNegotiator *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  VCMediaNegotiator *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  char v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  int v34;
  int v35;
  uint64_t v36;
  void *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  _BYTE v58[128];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;

  v4 = self;
  v73 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BB8);
  v47 = (void *)objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](v4->super._localSettings, "mediaConfigurationForMediaType:", 2), "videoRuleCollections");
  if (objc_msgSend((id)objc_msgSend(v47, "rules"), "count"))
  {
    v6 = (void *)objc_msgSend(a3, "newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:", 0, v4->_isCellular16x9Capable, 0);
    v7 = v6;
    if (!v6)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator negotiateVideoSettings:].cold.1();
      }
      goto LABEL_79;
    }
    if (objc_msgSend((id)objc_msgSend(v6, "supportedPayloads"), "count"))
    {
      objc_msgSend(v5, "setRemoteSSRC:", objc_msgSend(a3, "rtpSSRC"));
      if (-[VCMediaNegotiator processParameterSets:videoResults:](v4, "processParameterSets:videoResults:", a3, v5))
      {
        -[VCMediaNegotiator negotiateRTCPFB:negotiatedVideoSettings:](v4, "negotiateRTCPFB:negotiatedVideoSettings:", a3, v5);
        -[VCMediaNegotiator negotiateTilesPerFrame:negotiatedSettings:](v4, "negotiateTilesPerFrame:negotiatedSettings:", a3, v5);
        if (objc_msgSend(a3, "ltrpEnabled"))
          v8 = -[VCMediaNegotiatorLocalConfiguration ltrpEnabled](v4->super._localSettings, "ltrpEnabled");
        else
          v8 = 0;
        objc_msgSend(v5, "setLtrpEnabled:", v8);
        v46 = +[VCMediaNegotiatorBase getPreferredVideoPayloadList:localSupportedPayloads:mediaType:](VCMediaNegotiator, "getPreferredVideoPayloadList:localSupportedPayloads:mediaType:", objc_msgSend(v7, "supportedPayloads"), objc_msgSend(v47, "supportedPayloads"), 2);
        if (objc_msgSend(v46, "count"))
        {
          if (-[VCMediaNegotiator processPixelFormats:videoResults:](v4, "processPixelFormats:videoResults:", a3, v5))
          {
            if (-[VCMediaNegotiator negotiateHDRMode:videoResults:](v4, "negotiateHDRMode:videoResults:", a3, v5))
            {
              v14 = (void *)objc_msgSend(a3, "newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:", 0, v4->_isCellular16x9Capable, 0);
              v42 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
              if (objc_msgSend(v47, "isEncodeSupported")
                && objc_msgSend(v14, "isDecodeSupported"))
              {
                objc_msgSend(v42, "setObject:atIndexedSubscript:", &unk_1E9EF5BA0, objc_msgSend(v42, "count"));
              }
              if (objc_msgSend(v47, "isDecodeSupported")
                && objc_msgSend(v14, "isEncodeSupported"))
              {
                objc_msgSend(v42, "setObject:atIndexedSubscript:", &unk_1E9EF5BB8, objc_msgSend(v42, "count"));
              }

              v69 = 0u;
              v70 = 0u;
              v71 = 0u;
              v72 = 0u;
              obj = (id)objc_msgSend(v47, "supportedTransportTypes");
              v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v68, 16);
              if (v39)
              {
                v40 = *(_QWORD *)v70;
                v37 = v7;
                do
                {
                  v15 = v4;
                  v16 = a3;
                  v17 = v5;
                  v18 = 0;
                  do
                  {
                    if (*(_QWORD *)v70 != v40)
                      objc_enumerationMutation(obj);
                    v41 = v18;
                    v19 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v18);
                    v64 = 0u;
                    v65 = 0u;
                    v66 = 0u;
                    v67 = 0u;
                    v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v64, v63, 16);
                    if (v44)
                    {
                      v43 = *(_QWORD *)v65;
                      while (2)
                      {
                        for (i = 0; i != v44; ++i)
                        {
                          if (*(_QWORD *)v65 != v43)
                            objc_enumerationMutation(v42);
                          v21 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
                          v59 = 0u;
                          v60 = 0u;
                          v61 = 0u;
                          v62 = 0u;
                          v22 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
                          if (v22)
                          {
                            v23 = v22;
                            v45 = i;
                            v24 = *(_QWORD *)v60;
                            while (2)
                            {
                              for (j = 0; j != v23; ++j)
                              {
                                if (*(_QWORD *)v60 != v24)
                                  objc_enumerationMutation(v46);
                                LOBYTE(v36) = 0;
                                if (-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoSettings:negotiatedVideoSettings:isScreen:](v15, "selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoSettings:negotiatedVideoSettings:isScreen:", objc_msgSend(v19, "unsignedIntValue"), objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "unsignedIntValue"), objc_msgSend(v21, "unsignedIntValue"), v47, v16, v17, v36))
                                {
                                  v26 = 1;
                                  goto LABEL_46;
                                }
                              }
                              v23 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
                              if (v23)
                                continue;
                              break;
                            }
                            v26 = 0;
LABEL_46:
                            i = v45;
                          }
                          else
                          {
                            v26 = 0;
                          }
                          if (-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
                          {
                            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                            {
                              v27 = VRTraceErrorLogLevelToCSTR();
                              v28 = *MEMORY[0x1E0CF2758];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                              {
                                v29 = objc_msgSend(v19, "unsignedIntValue");
                                v30 = objc_msgSend(v21, "unsignedIntValue");
                                *(_DWORD *)buf = 136316162;
                                v49 = v27;
                                v50 = 2080;
                                v51 = "-[VCMediaNegotiator negotiateVideoSettings:]";
                                v52 = 1024;
                                v53 = 1275;
                                v54 = 1024;
                                v55 = v29;
                                v56 = 1024;
                                v57 = v30;
                                _os_log_error_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_ERROR, " [%s] %s:%d forceHWI enabled! No match found when select video rules for transport=%d, encoding=%d", buf, 0x28u);
                              }
                            }
                          }
                          else if ((v26 & 1) == 0)
                          {
                            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                            {
                              v31 = VRTraceErrorLogLevelToCSTR();
                              v32 = *MEMORY[0x1E0CF2758];
                              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                              {
                                v34 = objc_msgSend(v19, "unsignedIntValue");
                                v35 = objc_msgSend(v21, "unsignedIntValue");
                                *(_DWORD *)buf = 136316162;
                                v49 = v31;
                                v50 = 2080;
                                v51 = "-[VCMediaNegotiator negotiateVideoSettings:]";
                                v52 = 1024;
                                v53 = 1273;
                                v54 = 1024;
                                v55 = v34;
                                v56 = 1024;
                                v57 = v35;
                                _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unable to find a video rule for transport=%d encoding=%d", buf, 0x28u);
                              }
                            }
                            v13 = 1;
                            v7 = v37;
                            goto LABEL_62;
                          }
                        }
                        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v64, v63, 16);
                        if (v44)
                          continue;
                        break;
                      }
                    }
                    v18 = v41 + 1;
                  }
                  while (v41 + 1 != v39);
                  v7 = v37;
                  v5 = v17;
                  a3 = v16;
                  v4 = v15;
                  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v68, 16);
                }
                while (v39);
              }
              objc_msgSend(v5, "setIsSupported:", objc_msgSend(v42, "count") != 0);
              v13 = 1;
              goto LABEL_62;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCMediaNegotiator negotiateVideoSettings:].cold.3();
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaNegotiator negotiateVideoSettings:].cold.4();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiator negotiateVideoSettings:].cold.2();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator negotiateVideoSettings:].cold.5();
      }
LABEL_79:
      v13 = 0;
LABEL_62:

      return v13;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v49 = v11;
        v50 = 2080;
        v51 = "-[VCMediaNegotiator negotiateVideoSettings:]";
        v52 = 1024;
        v53 = 1221;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating video settings, as the remote device does not support video", buf, 0x1Cu);
      }
    }
    objc_msgSend(v5, "setIsSupported:", 0);

  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v49 = v9;
        v50 = 2080;
        v51 = "-[VCMediaNegotiator negotiateVideoSettings:]";
        v52 = 1024;
        v53 = 1213;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating video settings, as this device does not support video", buf, 0x1Cu);
      }
    }
    objc_msgSend(v5, "setIsSupported:", 0);
  }
  return 1;
}

- (BOOL)setupVideoWithNegotiatedSettings:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  BOOL v14;
  _QWORD v16[5];
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:", 0, self->_isCellular16x9Capable, 0);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator setupVideoWithNegotiatedSettings:].cold.1();
    }
    goto LABEL_23;
  }
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BB8);
  objc_msgSend(v6, "setRemoteSSRC:", objc_msgSend(a3, "rtpSSRC"));
  objc_msgSend(v6, "setIsRTCPFBEnabled:", objc_msgSend(a3, "allowRTCPFB"));
  objc_msgSend(v6, "setTilesPerFrame:", objc_msgSend(a3, "tilesPerFrame"));
  objc_msgSend(v6, "setLtrpEnabled:", objc_msgSend(a3, "ltrpEnabled"));
  if (!-[VCMediaNegotiator processPixelFormats:videoResults:](self, "processPixelFormats:videoResults:", a3, v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator setupVideoWithNegotiatedSettings:].cold.4();
    }
    goto LABEL_23;
  }
  if (!-[VCMediaNegotiator negotiateHDRMode:videoResults:](self, "negotiateHDRMode:videoResults:", a3, v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator setupVideoWithNegotiatedSettings:].cold.3();
    }
LABEL_23:
    v7 = 0;
    v14 = 0;
    goto LABEL_13;
  }
  if (-[VCMediaNegotiator processParameterSets:videoResults:](self, "processParameterSets:videoResults:", a3, v6))
  {
    v7 = (void *)objc_msgSend(a3, "newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:", 0, self->_isCellular16x9Capable, 0);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = (void *)objc_msgSend(a3, "videoPayloadCollections");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v6, "addFeatureString:payload:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "featureString"), objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "payload"));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      }
      while (v10);
    }
    v13 = (void *)objc_msgSend(v7, "rules");
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__VCMediaNegotiator_setupVideoWithNegotiatedSettings___block_invoke;
    v16[3] = &unk_1E9E54C08;
    v16[4] = v6;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v16);
    v14 = 1;
    objc_msgSend(v6, "setIsSupported:", 1);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator setupVideoWithNegotiatedSettings:].cold.2();
    }
    v7 = 0;
    v14 = 1;
  }
LABEL_13:

  return v14;
}

uint64_t __54__VCMediaNegotiator_setupVideoWithNegotiatedSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
  v5 = objc_msgSend(a2, "transportType");
  v6 = objc_msgSend(a2, "payload");
  if (objc_msgSend(a2, "encodingType") == 2)
    v7 = 1;
  else
    v7 = 2;
  return objc_msgSend(v3, "addVideoRules:transportType:payload:encodingType:", v4, v5, v6, v7);
}

- (id)getPreferredScreenPayloadList
{
  if (-[VCMediaNegotiator isNegotiationModeValid:](self, "isNegotiationModeValid:", self->_negotiationMode))
    return &unk_1E9EFA250;
  else
    return &unk_1E9EFA268;
}

- (BOOL)negotiateScreenSettings:(id)a3
{
  void *v5;
  void *v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  BOOL v12;
  _BOOL8 v13;
  _BOOL8 v14;
  VCMediaNegotiator *v15;
  _BOOL8 v16;
  uint64_t v17;
  void *v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id v25;
  void *v26;
  unsigned __int8 v27;
  uint64_t v28;
  unsigned __int8 v29;
  uint64_t v30;
  void *v31;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  void *v42;
  VCMediaNegotiator *v43;
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BD0);
  v42 = (void *)objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 3), "videoRuleCollections");
  if (objc_msgSend((id)objc_msgSend(v42, "rules"), "count"))
  {
    v43 = self;
    v6 = (void *)objc_msgSend(a3, "newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:", 1, self->_isCellular16x9Capable, 0);
    if (!v6)
    {
      v31 = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator negotiateScreenSettings:].cold.1();
      }
      v12 = 0;
      goto LABEL_64;
    }
    v34 = v6;
    if (objc_msgSend((id)objc_msgSend(v6, "supportedPayloads"), "count"))
    {
      objc_msgSend(v5, "setRemoteSSRC:", objc_msgSend(a3, "rtpSSRC"));
      if (-[VCMediaNegotiatorLocalConfiguration customVideoHeight](self->super._localSettings, "customVideoHeight")
        || -[VCMediaNegotiatorLocalConfiguration customVideoWidth](self->super._localSettings, "customVideoWidth"))
      {
        objc_msgSend(v5, "setCustomVideoWidth:", -[VCMediaNegotiatorLocalConfiguration customVideoWidth](self->super._localSettings, "customVideoWidth"));
        objc_msgSend(v5, "setCustomVideoHeight:", -[VCMediaNegotiatorLocalConfiguration customVideoHeight](self->super._localSettings, "customVideoHeight"));
      }
      if (-[VCMediaNegotiator processParameterSets:videoResults:](self, "processParameterSets:videoResults:", a3, v5))
      {
        -[VCMediaNegotiator negotiateRTCPFB:negotiatedVideoSettings:](self, "negotiateRTCPFB:negotiatedVideoSettings:", a3, v5);
        -[VCMediaNegotiator negotiateTilesPerFrame:negotiatedSettings:](self, "negotiateTilesPerFrame:negotiatedSettings:", a3, v5);
        if (objc_msgSend(a3, "ltrpEnabled"))
          v7 = -[VCMediaNegotiatorLocalConfiguration ltrpEnabled](self->super._localSettings, "ltrpEnabled");
        else
          v7 = 0;
        objc_msgSend(v5, "setLtrpEnabled:", v7);
        if (objc_msgSend(a3, "fecEnabled"))
          v13 = -[VCMediaNegotiatorResults accessNetworkType](self->super._negotiatedSettings, "accessNetworkType") == 2;
        else
          v13 = 0;
        objc_msgSend(v5, "setFecEnabled:", v13);
        if (objc_msgSend(a3, "rtxEnabled"))
          v14 = -[VCMediaNegotiatorResults accessNetworkType](self->super._negotiatedSettings, "accessNetworkType") == 2
             || -[VCMediaNegotiatorResults accessNetworkType](self->super._negotiatedSettings, "accessNetworkType") == 1;
        else
          v14 = 0;
        objc_msgSend(v5, "setRtxEnabled:", v14);
        if (objc_msgSend(a3, "blackFrameOnClearScreenEnabled"))
        {
          v15 = self;
          v16 = -[VCMediaNegotiatorLocalConfiguration blackFrameOnClearScreenEnabled](self->super._localSettings, "blackFrameOnClearScreenEnabled");
        }
        else
        {
          v16 = 0;
          v15 = self;
        }
        objc_msgSend(v5, "setBlackFrameOnClearScreenEnabled:", v16);
        obj = -[VCMediaNegotiator getPreferredScreenPayloadList](v15, "getPreferredScreenPayloadList");
        if (objc_msgSend(obj, "count"))
        {
          if (-[VCMediaNegotiator processPixelFormats:videoResults:](v15, "processPixelFormats:videoResults:", a3, v5))
          {
            if (-[VCMediaNegotiator negotiateHDRMode:videoResults:](v15, "negotiateHDRMode:videoResults:", a3, v5))
            {
              if (-[VCMediaNegotiator isNegotiationModeForScreenShare:](v15, "isNegotiationModeForScreenShare:", v15->_negotiationMode))
              {
                v38 = -[VCMediaNegotiator selectBestScreenRule:preferredPayloadOrder:](v15, "selectBestScreenRule:preferredPayloadOrder:", a3, obj);
              }
              else
              {
                v57 = 0u;
                v58 = 0u;
                v55 = 0u;
                v56 = 0u;
                v36 = objc_msgSend(&unk_1E9EFA280, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
                if (v36)
                {
                  v38 = 0;
                  v35 = *(_QWORD *)v56;
                  do
                  {
                    v17 = 0;
                    do
                    {
                      if (*(_QWORD *)v56 != v35)
                        objc_enumerationMutation(&unk_1E9EFA280);
                      v37 = v17;
                      v18 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v17);
                      v50 = 0u;
                      v51 = 0u;
                      v52 = 0u;
                      v53 = 0u;
                      v40 = objc_msgSend(&unk_1E9EFA298, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
                      if (v40)
                      {
                        v39 = *(_QWORD *)v51;
                        do
                        {
                          for (i = 0; i != v40; ++i)
                          {
                            if (*(_QWORD *)v51 != v39)
                              objc_enumerationMutation(&unk_1E9EFA298);
                            v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
                            v45 = 0u;
                            v46 = 0u;
                            v47 = 0u;
                            v48 = 0u;
                            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
                            if (v21)
                            {
                              v22 = v21;
                              v23 = *(_QWORD *)v46;
                              while (2)
                              {
                                for (j = 0; j != v22; ++j)
                                {
                                  v25 = a3;
                                  if (*(_QWORD *)v46 != v23)
                                    objc_enumerationMutation(obj);
                                  v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
                                  v27 = objc_msgSend(v18, "unsignedIntValue");
                                  v28 = objc_msgSend(v26, "unsignedIntValue");
                                  v29 = objc_msgSend(v20, "unsignedIntValue");
                                  LOBYTE(v33) = 1;
                                  v30 = v27;
                                  a3 = v25;
                                  if (-[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoSettings:negotiatedVideoSettings:isScreen:](v43, "selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoSettings:negotiatedVideoSettings:isScreen:", v30, v28, v29, v42, v25, v5, v33))
                                  {
                                    v38 = 1;
                                    goto LABEL_56;
                                  }
                                }
                                v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
                                if (v22)
                                  continue;
                                break;
                              }
                            }
LABEL_56:
                            ;
                          }
                          v40 = objc_msgSend(&unk_1E9EFA298, "countByEnumeratingWithState:objects:count:", &v50, v49, 16);
                        }
                        while (v40);
                      }
                      v17 = v37 + 1;
                    }
                    while (v37 + 1 != v36);
                    v36 = objc_msgSend(&unk_1E9EFA280, "countByEnumeratingWithState:objects:count:", &v55, v54, 16);
                  }
                  while (v36);
                }
                else
                {
                  v38 = 0;
                }
              }
              objc_msgSend(v5, "setIsSupported:", v38 & 1);
              v12 = 1;
              goto LABEL_63;
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCMediaNegotiator negotiateScreenSettings:].cold.3();
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaNegotiator negotiateScreenSettings:].cold.4();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiator negotiateScreenSettings:].cold.2();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator negotiateScreenSettings:].cold.5();
      }
      v12 = 0;
LABEL_63:
      v31 = v34;
LABEL_64:

      return v12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v60 = v10;
        v61 = 2080;
        v62 = "-[VCMediaNegotiator negotiateScreenSettings:]";
        v63 = 1024;
        v64 = 1356;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating screen video settings, as the remote device does not have a screen.", buf, 0x1Cu);
      }
    }
    objc_msgSend(v5, "setIsSupported:", 0);

  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v60 = v8;
        v61 = 2080;
        v62 = "-[VCMediaNegotiator negotiateScreenSettings:]";
        v63 = 1024;
        v64 = 1346;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating screen video settings, as this device does not have a screen.", buf, 0x1Cu);
      }
    }
    objc_msgSend(v5, "setIsSupported:", 0);
  }
  return 1;
}

- (BOOL)setupScreenWithNegotiatedSettings:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  _QWORD v17[5];
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:", 1, self->_isCellular16x9Capable, 0);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator setupScreenWithNegotiatedSettings:].cold.1();
    }
    goto LABEL_26;
  }
  v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BD0);
  objc_msgSend(v6, "setRemoteSSRC:", objc_msgSend(a3, "rtpSSRC"));
  objc_msgSend(v6, "setIsRTCPFBEnabled:", objc_msgSend(a3, "allowRTCPFB"));
  objc_msgSend(v6, "setCustomVideoHeight:", objc_msgSend(a3, "customVideoHeight"));
  objc_msgSend(v6, "setCustomVideoWidth:", objc_msgSend(a3, "customVideoWidth"));
  objc_msgSend(v6, "setTilesPerFrame:", objc_msgSend(a3, "tilesPerFrame"));
  objc_msgSend(v6, "setLtrpEnabled:", objc_msgSend(a3, "ltrpEnabled"));
  objc_msgSend(v6, "setFecEnabled:", objc_msgSend(a3, "fecEnabled"));
  objc_msgSend(v6, "setRtxEnabled:", objc_msgSend(a3, "rtxEnabled"));
  if (objc_msgSend(a3, "hasBlackFrameOnClearScreenEnabled"))
    v7 = objc_msgSend(a3, "blackFrameOnClearScreenEnabled");
  else
    v7 = -[VCMediaNegotiatorLocalConfiguration blackFrameOnClearScreenEnabledDefault](self->super._localSettings, "blackFrameOnClearScreenEnabledDefault");
  objc_msgSend(v6, "setBlackFrameOnClearScreenEnabled:", v7);
  if (!-[VCMediaNegotiator processPixelFormats:videoResults:](self, "processPixelFormats:videoResults:", a3, v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator setupScreenWithNegotiatedSettings:].cold.4();
    }
    goto LABEL_26;
  }
  if (!-[VCMediaNegotiator negotiateHDRMode:videoResults:](self, "negotiateHDRMode:videoResults:", a3, v6))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator setupScreenWithNegotiatedSettings:].cold.3();
    }
LABEL_26:
    v8 = 0;
    v15 = 0;
    goto LABEL_16;
  }
  if (-[VCMediaNegotiator processParameterSets:videoResults:](self, "processParameterSets:videoResults:", a3, v6))
  {
    v8 = (void *)objc_msgSend(a3, "newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:", 1, self->_isCellular16x9Capable, 0);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = (void *)objc_msgSend(a3, "videoPayloadCollections");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v6, "addFeatureString:payload:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "featureString"), objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "payload"));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      }
      while (v11);
    }
    v14 = (void *)objc_msgSend(v8, "rules");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__VCMediaNegotiator_setupScreenWithNegotiatedSettings___block_invoke;
    v17[3] = &unk_1E9E54C08;
    v17[4] = v6;
    objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v17);
    v15 = 1;
    objc_msgSend(v6, "setIsSupported:", 1);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator setupScreenWithNegotiatedSettings:].cold.2();
    }
    v8 = 0;
    v15 = 1;
  }
LABEL_16:

  return v15;
}

uint64_t __55__VCMediaNegotiator_setupScreenWithNegotiatedSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
  v5 = objc_msgSend(a2, "transportType");
  v6 = objc_msgSend(a2, "payload");
  if (objc_msgSend(a2, "encodingType") == 2)
    v7 = 1;
  else
    v7 = 2;
  return objc_msgSend(v3, "addVideoRules:transportType:payload:encodingType:", v4, v5, v6, v7);
}

- (BOOL)selectBestScreenRule:(id)a3 preferredPayloadOrder:(id)a4
{
  VCMediaNegotiator *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v16;
  id obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v22 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._negotiatedU1MediaSettings, "objectForKeyedSubscript:", &unk_1E9EF5BD0);
  v6 = self;
  v19 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](self->super._localSettings, "mediaConfigurationForMediaType:", 3);
  v7 = objc_msgSend(v19, "videoRuleCollections");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a4;
  v20 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
  v8 = 0;
  if (v20)
  {
    v18 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(obj);
        v21 = v9;
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        objc_msgSend(v22, "addFeatureString:payload:", +[VCMediaNegotiator negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:](VCMediaNegotiator, "negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:", objc_msgSend((id)objc_msgSend(v19, "videoFeatureStrings"), "objectForKeyedSubscript:", v10), -[VCMediaNegotiator selectVideoFeatureString:selectedPayload:videoConfiguration:](v6, "selectVideoFeatureString:selectedPayload:videoConfiguration:", a3, objc_msgSend(v10, "unsignedIntValue"), v19)), objc_msgSend(v10, "unsignedIntValue"));
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v11 = objc_msgSend(&unk_1E9EFA2B0, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(&unk_1E9EFA2B0);
              LOBYTE(v16) = 1;
              v8 |= -[VCMediaNegotiator selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoSettings:negotiatedVideoSettings:isScreen:](v6, "selectBestVideoRuleForTransport:payload:encodingType:localVideoRuleCollection:remoteVideoSettings:negotiatedVideoSettings:isScreen:", objc_msgSend(&unk_1E9EF5BA0, "unsignedIntValue"), objc_msgSend(v10, "unsignedIntValue"), objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "unsignedIntValue"), v7, a3, v22, v16);
            }
            v12 = objc_msgSend(&unk_1E9EFA2B0, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
          }
          while (v12);
        }
        v9 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
    }
    while (v20);
  }
  return v8 & 1;
}

- (void)setupFaceTimeSettingsForMediaBlob:(id)a3 isResponse:(BOOL)a4
{
  _BOOL4 v4;
  id *p_negotiatedFaceTimeSettings;
  _BOOL4 v8;
  BOOL v9;
  int v10;
  unsigned int v11;
  char v12;
  char v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  int v22;
  _BOOL4 v23;
  int v24;
  unsigned int v25;
  char v26;
  VCMediaNegotiationFaceTimeSettings *v27;

  v4 = a4;
  v27 = objc_alloc_init(VCMediaNegotiationFaceTimeSettings);
  if (v4)
  {
    p_negotiatedFaceTimeSettings = (id *)&self->super._negotiatedFaceTimeSettings;
    v8 = -[VCMediaNegotiatorResultsFaceTimeSettings SIPDisabled](self->super._negotiatedFaceTimeSettings, "SIPDisabled");
    v9 = v8;
    if (v8)
      v10 = 2;
    else
      v10 = 0;
    v11 = objc_msgSend(*p_negotiatedFaceTimeSettings, "secureMessagingRequired");
    v12 = v11;
    -[VCMediaNegotiationFaceTimeSettings setCapabilities:](v27, "setCapabilities:", v10 | v11);
    v13 = objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches");
    v14 = -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 2 | v13 & 1;
    v15 = -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 4;
    v16 = v14 | v15 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 8;
    v17 = objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x10;
    v18 = v17 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x20;
    v22 = v16 | v18 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x40;
    v19 = -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x80;
    v20 = v19 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x100;
    v21 = v20 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x200;
    -[VCMediaNegotiationFaceTimeSettings setSwitches:](v27, "setSwitches:", v22 | v21 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x400 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x800 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x1000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x2000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x4000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x8000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x10000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x20000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x40000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x80000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x100000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x200000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x400000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x800000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x1000000 | -[VCMediaNegotiatorLocalConfiguration faceTimeSwitches](self->super._localSettings, "faceTimeSwitches") & 0x2000000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x4000000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x8000000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x10000000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x20000000 | objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches") & 0x40000000);
    LOBYTE(v22) = objc_msgSend(*p_negotiatedFaceTimeSettings, "oneToOneModeSupported");
    if ((v22 & 1) == 0)
      goto LABEL_12;
LABEL_11:
    -[VCMediaNegotiationFaceTimeSettings setOneToOneModeSupported:](v27, "setOneToOneModeSupported:", 1);
    goto LABEL_12;
  }
  p_negotiatedFaceTimeSettings = (id *)&self->super._localSettings;
  v23 = -[VCMediaNegotiatorLocalConfiguration SIPDisabled](self->super._localSettings, "SIPDisabled");
  v9 = v23;
  if (v23)
    v24 = 2;
  else
    v24 = 0;
  v25 = objc_msgSend(*p_negotiatedFaceTimeSettings, "secureMessagingRequired");
  v12 = v25;
  -[VCMediaNegotiationFaceTimeSettings setCapabilities:](v27, "setCapabilities:", v24 | v25);
  -[VCMediaNegotiationFaceTimeSettings setSwitches:](v27, "setSwitches:", objc_msgSend(*p_negotiatedFaceTimeSettings, "faceTimeSwitches"));
  v22 = objc_msgSend(*p_negotiatedFaceTimeSettings, "oneToOneModeSupported");
  if (v22)
    goto LABEL_11;
LABEL_12:
  -[VCMediaNegotiationFaceTimeSettings setMediaControlInfoSubVersion:](v27, "setMediaControlInfoSubVersion:", objc_msgSend(*p_negotiatedFaceTimeSettings, "mediaControlInfoFECFeedbackVersion"));
  -[VCMediaNegotiationFaceTimeSettings setLinkProbingCapabilityVersion:](v27, "setLinkProbingCapabilityVersion:", -[VCMediaNegotiatorLocalConfiguration linkProbingCapabilityVersion](self->super._localSettings, "linkProbingCapabilityVersion"));
  if (v9
    || (v12 & 1) != 0
    || (-[VCMediaNegotiationFaceTimeSettings switches](v27, "switches") ? (v26 = 1) : (v26 = v22),
        (v26 & 1) != 0
     || -[VCMediaNegotiatorLocalConfiguration mediaControlInfoFECFeedbackVersion](self->super._localSettings, "mediaControlInfoFECFeedbackVersion")|| -[VCMediaNegotiationFaceTimeSettings linkProbingCapabilityVersion](v27, "linkProbingCapabilityVersion")))
  {
    objc_msgSend(a3, "setFaceTimeSettings:", v27);
  }

}

- (BOOL)negotiateFaceTimeSettings:(id)a3
{
  VCMediaNegotiatorResultsFaceTimeSettings **p_negotiatedFaceTimeSettings;
  int v6;
  uint64_t v7;
  int ErrorLogLevelForModule;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  _BOOL8 v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  p_negotiatedFaceTimeSettings = &self->super._negotiatedFaceTimeSettings;
  if (objc_msgSend(a3, "hasCapabilities"))
  {
    -[VCMediaNegotiatorResultsFaceTimeSettings setSIPDisabled:](self->super._negotiatedFaceTimeSettings, "setSIPDisabled:", -[VCMediaNegotiatorLocalConfiguration SIPDisabled](self->super._localSettings, "SIPDisabled") & ((objc_msgSend(a3, "capabilities") & 2) >> 1));
    v6 = objc_msgSend(a3, "capabilities");
    v7 = -[VCMediaNegotiatorLocalConfiguration secureMessagingRequired](self->super._localSettings, "secureMessagingRequired") & v6;
  }
  else
  {
    -[VCMediaNegotiatorResultsFaceTimeSettings setSIPDisabled:](self->super._negotiatedFaceTimeSettings, "setSIPDisabled:", 0);
    v7 = 0;
  }
  -[VCMediaNegotiatorResultsFaceTimeSettings setSecureMessagingRequired:](*p_negotiatedFaceTimeSettings, "setSecureMessagingRequired:", v7);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v9 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[VCMediaNegotiatorResultsFaceTimeSettings SIPDisabled](self->super._negotiatedFaceTimeSettings, "SIPDisabled");
      v26 = 136315906;
      v27 = v10;
      v28 = 2080;
      v29 = "-[VCMediaNegotiator negotiateFaceTimeSettings:]";
      v30 = 1024;
      v31 = 1571;
      v32 = 1024;
      v33 = v12;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch after negotiation disableSIPEnabled %d", (uint8_t *)&v26, 0x22u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[VCMediaNegotiatorResultsFaceTimeSettings secureMessagingRequired](self->super._negotiatedFaceTimeSettings, "secureMessagingRequired");
      v26 = 136315906;
      v27 = v13;
      v28 = 2080;
      v29 = "-[VCMediaNegotiator negotiateFaceTimeSettings:]";
      v30 = 1024;
      v31 = 1572;
      v32 = 1024;
      v33 = v15;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch after negotiation secureMessagingEnabled %d", (uint8_t *)&v26, 0x22u);
    }
  }
  if (objc_msgSend(a3, "hasSwitches"))
    v16 = objc_msgSend(a3, "switches");
  else
    v16 = 0;
  -[VCMediaNegotiatorResultsFaceTimeSettings setFaceTimeSwitches:](self->super._negotiatedFaceTimeSettings, "setFaceTimeSwitches:", v16);
  -[VCMediaNegotiatorResultsFaceTimeSettings setRemoteFaceTimeSwitchesAvailable:](self->super._negotiatedFaceTimeSettings, "setRemoteFaceTimeSwitchesAvailable:", objc_msgSend(a3, "hasSwitches"));
  v17 = objc_msgSend(a3, "hasOneToOneModeSupported")
     && objc_msgSend(a3, "oneToOneModeSupported")
     && -[VCMediaNegotiatorLocalConfiguration oneToOneModeSupported](self->super._localSettings, "oneToOneModeSupported");
  -[VCMediaNegotiatorResultsFaceTimeSettings setOneToOneModeSupported:](self->super._negotiatedFaceTimeSettings, "setOneToOneModeSupported:", v17);
  if (objc_msgSend(a3, "hasMediaControlInfoSubVersion"))
  {
    v18 = objc_msgSend(a3, "mediaControlInfoFECFeedbackVersion");
    v19 = -[VCMediaNegotiatorLocalConfiguration mediaControlInfoFECFeedbackVersion](self->super._localSettings, "mediaControlInfoFECFeedbackVersion");
    if (v18 >= v19)
      v20 = v19;
    else
      v20 = v18;
  }
  else
  {
    v20 = 0;
  }
  -[VCMediaNegotiatorResultsFaceTimeSettings setMediaControlInfoFECFeedbackVersion:](self->super._negotiatedFaceTimeSettings, "setMediaControlInfoFECFeedbackVersion:", v20);
  v21 = objc_msgSend(a3, "hasLinkProbingCapabilityVersion");
  if (v21)
    LOBYTE(v21) = objc_msgSend(a3, "linkProbingCapabilityVersion");
  -[VCMediaNegotiatorResultsFaceTimeSettings setRemoteLinkProbingCapabilityVersion:](self->super._negotiatedFaceTimeSettings, "setRemoteLinkProbingCapabilityVersion:", v21);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v24 = -[VCMediaNegotiatorResultsFaceTimeSettings mediaControlInfoFECFeedbackVersion](self->super._negotiatedFaceTimeSettings, "mediaControlInfoFECFeedbackVersion");
      v26 = 136315906;
      v27 = v22;
      v28 = 2080;
      v29 = "-[VCMediaNegotiator negotiateFaceTimeSettings:]";
      v30 = 1024;
      v31 = 1592;
      v32 = 1024;
      v33 = v24;
      _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Load switch after negotiation mediaControlInfoFECFeedbackVersion '%d'", (uint8_t *)&v26, 0x22u);
    }
  }
  return 1;
}

- (void)setupMomentsForMediaBlob:(id)a3
{
  VCMediaNegotiationBlobMomentsSettings *v5;
  VCMediaNegotiationBlobMomentsSettings *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[VCDefaults momentsUserPreferenceEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "momentsUserPreferenceEnabled"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315650;
        v10 = v7;
        v11 = 2080;
        v12 = "-[VCMediaNegotiator setupMomentsForMediaBlob:]";
        v13 = 1024;
        v14 = 1602;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Moments user preference Not Enabled.", (uint8_t *)&v9, 0x1Cu);
      }
    }
    goto LABEL_11;
  }
  v5 = -[VCMediaNegotiationBlobMomentsSettings initWithVideoCodecs:imageTypes:capabilities:multiwayCapabilities:]([VCMediaNegotiationBlobMomentsSettings alloc], "initWithVideoCodecs:imageTypes:capabilities:multiwayCapabilities:", -[VCMediaNegotiatorLocalConfiguration mediaRecorderVideoCodecs](self->super._localSettings, "mediaRecorderVideoCodecs"), -[VCMediaNegotiatorLocalConfiguration mediaRecorderImageTypes](self->super._localSettings, "mediaRecorderImageTypes"), -[VCVideoRuleCollectionsMediaRecorder mediaRecorderCapabilities](+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance"), "mediaRecorderCapabilities"), -[VCVideoRuleCollectionsMediaRecorder mediaRecorderCapabilities](+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance"), "mediaRecorderCapabilities"));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator setupMomentsForMediaBlob:].cold.1();
    }
LABEL_11:
    v6 = 0;
    goto LABEL_4;
  }
  v6 = v5;
  objc_msgSend(a3, "setMomentsSettings:", v5);
LABEL_4:

}

- (BOOL)negotiateMomentsWithMomentsSettings:(id)a3
{
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[VCDefaults momentsUserPreferenceEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "momentsUserPreferenceEnabled"))
  {
    if (objc_msgSend(a3, "hasSupportedVideoCodecs")
      && (objc_msgSend(a3, "supportedVideoCodecs") & 2) != 0
      && +[VCHardwareSettings supportsHEVCEncoding](VCHardwareSettings, "supportsHEVCEncoding"))
    {
      v5 = 100;
    }
    else
    {
      v5 = 123;
    }
    -[VCMediaNegotiatorResultsMediaRecorder setVideoCodec:](self->super._negotiatedMediaRecorderSettings, "setVideoCodec:", v5);
    v6 = objc_msgSend(a3, "hasSupportedImageTypes")
      && (objc_msgSend(a3, "supportedImageTypes") & 2) != 0
      && +[VCHardwareSettings supportsHEIFEncoding](VCHardwareSettings, "supportsHEIFEncoding");
    -[VCMediaNegotiatorResultsMediaRecorder setImageType:](self->super._negotiatedMediaRecorderSettings, "setImageType:", v6);
    -[VCMediaNegotiatorResultsMediaRecorder setCapabilities:](self->super._negotiatedMediaRecorderSettings, "setCapabilities:", +[VCMediaNegotiationBlobMomentsSettings avcMomentsCapabilitiesForMultiwayMomentsCapabilities:](VCMediaNegotiationBlobMomentsSettings, "avcMomentsCapabilitiesForMultiwayMomentsCapabilities:", objc_msgSend(a3, "multiwayCapabilities")));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315650;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCMediaNegotiator negotiateMomentsWithMomentsSettings:]";
      v14 = 1024;
      v15 = 1616;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Moments user preference Not Enabled.", (uint8_t *)&v10, 0x1Cu);
    }
  }
  return 1;
}

- (void)setupMultiwayAudioStreamsForMediaBlob:(id)a3
{
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  VCMediaNegotiationBlobMultiwayAudioStream *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[VCMediaNegotiatorLocalConfiguration multiwayAudioStreams](self->super._localSettings, "multiwayAudioStreams");
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = -[VCMediaNegotiationBlobMultiwayAudioStream initWithStreamConfig:]([VCMediaNegotiationBlobMultiwayAudioStream alloc], "initWithStreamConfig:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        objc_msgSend(a3, "addMultiwayAudioStreams:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
}

- (BOOL)negotiateMultiwayAudioStreams:(id)a3
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  VCMediaNegotiatorStreamGroupConfiguration *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  id v23;
  void *v24;
  const __CFString *v25;
  BOOL v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  NSObject *v33;
  VCMediaNegotiatorStreamGroupConfiguration *obj;
  uint64_t v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  id v54;
  __int16 v55;
  VCMediaNegotiator *v56;
  __int16 v57;
  VCMediaNegotiatorStreamGroupConfiguration *v58;
  uint64_t v59;

  obj = (VCMediaNegotiatorStreamGroupConfiguration *)a3;
  v59 = *MEMORY[0x1E0C80C00];
  if ((VCMediaNegotiator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v48 = v5;
        v49 = 2080;
        v50 = "-[VCMediaNegotiator negotiateMultiwayAudioStreams:]";
        v51 = 1024;
        v52 = 1650;
        v53 = 2112;
        v54 = obj;
        v7 = " [%s] %s:%d multiwayAudioStreams=%@";
        v8 = v6;
        v9 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCMediaNegotiator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v48 = v10;
        v49 = 2080;
        v50 = "-[VCMediaNegotiator negotiateMultiwayAudioStreams:]";
        v51 = 1024;
        v52 = 1650;
        v53 = 2112;
        v54 = (id)v4;
        v55 = 2048;
        v56 = self;
        v57 = 2112;
        v58 = obj;
        v7 = " [%s] %s:%d %@(%p) multiwayAudioStreams=%@";
        v8 = v11;
        v9 = 58;
        goto LABEL_11;
      }
    }
  }
  v12 = -[VCMediaNegotiatorStreamGroupConfiguration initWithGroupID:mediaType:subtype:syncGroupID:]([VCMediaNegotiatorStreamGroupConfiguration alloc], "initWithGroupID:mediaType:subtype:syncGroupID:", 1835623282, 1936684398, 0, 0);
  if (v12)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v13 = -[VCMediaNegotiatorStreamGroupConfiguration countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
    if (v13)
    {
      v14 = v13;
      v36 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(obj);
          v16 = -[VCMediaNegotiator newStreamConfigFromMultiwayAudioStream:](self, "newStreamConfigFromMultiwayAudioStream:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i), obj);
          if (!v16)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCMediaNegotiator negotiateMultiwayAudioStreams:].cold.3();
            }
            goto LABEL_38;
          }
          v17 = v16;
          -[VCMediaNegotiatorStreamGroupConfiguration addStreamConfig:](v12, "addStreamConfig:", v16);
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v18 = (void *)objc_msgSend(v17, "payloads");
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v39;
            while (2)
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v39 != v21)
                  objc_enumerationMutation(v18);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "integerValue") != 20)
                {
                  v23 = -[VCMediaNegotiator newStreamGroupCodecConfigForPayload:](self, "newStreamGroupCodecConfigForPayload:");
                  if (!v23)
                  {

                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      VRTraceErrorLogLevelToCSTR();
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                        -[VCMediaNegotiator negotiateMultiwayAudioStreams:].cold.4();
                    }
                    goto LABEL_38;
                  }
                  v24 = v23;
                  -[VCMediaNegotiatorStreamGroupConfiguration addCodecConfig:](v12, "addCodecConfig:", v23);
                  objc_msgSend(v17, "addCodec:", -[VCMediaNegotiatorStreamGroupConfiguration indexOfCodecConfig:](v12, "indexOfCodecConfig:", v24));

                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
              if (v20)
                continue;
              break;
            }
          }

        }
        v14 = -[VCMediaNegotiatorStreamGroupConfiguration countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
        if (v14)
          continue;
        break;
      }
    }
    if (-[NSOrderedSet count](-[VCMediaNegotiatorStreamGroupConfiguration codecConfigs](v12, "codecConfigs", obj), "count"))
    {
      -[NSMutableArray addObject:](self->super._negotiatedStreamGroups, "addObject:", v12);
      if ((VCMediaNegotiator *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_47;
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_47;
        *(_DWORD *)buf = 136315906;
        v48 = v27;
        v49 = 2080;
        v50 = "-[VCMediaNegotiator negotiateMultiwayAudioStreams:]";
        v51 = 1024;
        v52 = 1676;
        v53 = 2112;
        v54 = v12;
        v29 = " [%s] %s:%d negotiated audio streamGroupConfig=%@";
        v30 = v28;
        v31 = 38;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v25 = (const __CFString *)-[VCMediaNegotiator performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v25 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_47;
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_47;
        *(_DWORD *)buf = 136316418;
        v48 = v32;
        v49 = 2080;
        v50 = "-[VCMediaNegotiator negotiateMultiwayAudioStreams:]";
        v51 = 1024;
        v52 = 1676;
        v53 = 2112;
        v54 = (id)v25;
        v55 = 2048;
        v56 = self;
        v57 = 2112;
        v58 = v12;
        v29 = " [%s] %s:%d %@(%p) negotiated audio streamGroupConfig=%@";
        v30 = v33;
        v31 = 58;
      }
      _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
LABEL_47:
      v26 = 1;
      goto LABEL_48;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator negotiateMultiwayAudioStreams:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiator negotiateMultiwayAudioStreams:].cold.1();
  }
LABEL_38:
  v26 = 0;
LABEL_48:

  return v26;
}

- (void)setupMultiwayVideoStreamsForMediaBlob:(id)a3
{
  NSMutableOrderedSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  VCMediaNegotiationBlobMultiwayVideoStream *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[VCMediaNegotiatorLocalConfiguration multiwayVideoStreams](self->super._localSettings, "multiwayVideoStreams");
  v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = -[VCMediaNegotiationBlobMultiwayVideoStream initWithStreamConfig:]([VCMediaNegotiationBlobMultiwayVideoStream alloc], "initWithStreamConfig:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        objc_msgSend(a3, "addMultiwayVideoStream:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
}

- (BOOL)isVideoStreamSupported:(int)a3
{
  uint64_t v4;
  id v5;

  if (a3 == 128)
    return 0;
  v4 = *(_QWORD *)&a3;
  v5 = +[VCHardwareSettings supportedVideoPayloads](VCHardwareSettings, "supportedVideoPayloads");
  return objc_msgSend(v5, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
}

- (BOOL)negotiateMultiwayVideoStreams:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_log_t *v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  VCMediaNegotiatorStreamGroupConfiguration *v21;
  id v22;
  __int128 v23;
  uint64_t j;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const __CFString *v41;
  uint64_t v42;
  NSObject *v43;
  BOOL v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  uint64_t v50;
  NSObject *v51;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  id obj;
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
  _BYTE v67[128];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  id v84;
  __int16 v85;
  VCMediaNegotiator *v86;
  __int16 v87;
  id v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  if ((VCMediaNegotiator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v78 = v6;
        v79 = 2080;
        v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
        v81 = 1024;
        v82 = 1704;
        v83 = 2112;
        v84 = a3;
        v8 = " [%s] %s:%d multiwayVideoStreams=%@";
        v9 = v7;
        v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCMediaNegotiator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v78 = v11;
        v79 = 2080;
        v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
        v81 = 1024;
        v82 = 1704;
        v83 = 2112;
        v84 = (id)v5;
        v85 = 2048;
        v86 = self;
        v87 = 2112;
        v88 = a3;
        v8 = " [%s] %s:%d %@(%p) multiwayVideoStreams=%@";
        v9 = v12;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
  if (objc_msgSend(+[VCHardwareSettings supportedVideoPayloads](VCHardwareSettings, "supportedVideoPayloads"), "count"))
  {
    obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v73, v72, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v74;
      v16 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v74 != v15)
            objc_enumerationMutation(a3);
          v18 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          if (objc_msgSend(v18, "isSubStream"))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              v19 = VRTraceErrorLogLevelToCSTR();
              v20 = *v16;
              if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v78 = v19;
                v79 = 2080;
                v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
                v81 = 1024;
                v82 = 1719;
                _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Error substreams not supported with stream groups", buf, 0x1Cu);
              }
            }
          }
          else
          {
            objc_msgSend(obj, "addObject:", v18);
          }
        }
        v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v73, v72, 16);
      }
      while (v14);
    }
    v21 = -[VCMediaNegotiatorStreamGroupConfiguration initWithGroupID:mediaType:subtype:syncGroupID:]([VCMediaNegotiatorStreamGroupConfiguration alloc], "initWithGroupID:mediaType:subtype:syncGroupID:", 1667329381, 1986618469, 875704438, 1835623282);
    if (v21)
    {
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v71 = 0u;
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v67, 16);
      if (v55)
      {
        v54 = *(_QWORD *)v69;
        *(_QWORD *)&v23 = 136315650;
        v53 = v23;
        while (2)
        {
          for (j = 0; j != v55; ++j)
          {
            if (*(_QWORD *)v69 != v54)
              objc_enumerationMutation(obj);
            v25 = -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:](self, "newStreamConfigFromMultiwayVideoStream:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * j), v53);
            if (!v25)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCMediaNegotiator negotiateMultiwayVideoStreams:].cold.4();
              }
              goto LABEL_58;
            }
            v26 = v25;
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            v27 = (void *)objc_msgSend(v25, "payloads");
            v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
            if (v28)
            {
              v29 = v28;
              v30 = *(_QWORD *)v64;
              while (2)
              {
                for (k = 0; k != v29; ++k)
                {
                  if (*(_QWORD *)v64 != v30)
                    objc_enumerationMutation(v27);
                  v32 = -[VCMediaNegotiator newStreamGroupCodecConfigForPayload:](self, "newStreamGroupCodecConfigForPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * k), "integerValue"));
                  if (!v32)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                    {
                      v39 = VRTraceErrorLogLevelToCSTR();
                      v40 = *MEMORY[0x1E0CF2758];
                      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = v53;
                        v78 = v39;
                        v79 = 2080;
                        v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
                        v81 = 1024;
                        v82 = 1741;
                        _os_log_error_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate media blob stream group codec config", buf, 0x1Cu);
                      }
                    }
                    goto LABEL_52;
                  }
                  v33 = v32;
                  objc_msgSend(v22, "addObject:", v32);

                }
                v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
                if (v29)
                  continue;
                break;
              }
            }
            if (objc_msgSend(v22, "count"))
            {
              v60 = 0u;
              v61 = 0u;
              v58 = 0u;
              v59 = 0u;
              v34 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v59;
                do
                {
                  for (m = 0; m != v35; ++m)
                  {
                    if (*(_QWORD *)v59 != v36)
                      objc_enumerationMutation(v22);
                    v38 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * m);
                    -[VCMediaNegotiatorStreamGroupConfiguration addCodecConfig:](v21, "addCodecConfig:", v38);
                    objc_msgSend(v26, "addCodec:", -[VCMediaNegotiatorStreamGroupConfiguration indexOfCodecConfig:](v21, "indexOfCodecConfig:", v38));
                  }
                  v35 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
                }
                while (v35);
              }
              -[VCMediaNegotiatorStreamGroupConfiguration addStreamConfig:](v21, "addStreamConfig:", v26);
            }
LABEL_52:
            objc_msgSend(v22, "removeAllObjects");

          }
          v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v68, v67, 16);
          if (v55)
            continue;
          break;
        }
      }
LABEL_58:

      if (-[NSOrderedSet count](-[VCMediaNegotiatorStreamGroupConfiguration streamConfigs](v21, "streamConfigs"), "count"))
      {
        if (-[NSOrderedSet count](-[VCMediaNegotiatorStreamGroupConfiguration codecConfigs](v21, "codecConfigs"), "count"))
        {
          -[NSMutableArray addObject:](self->super._negotiatedStreamGroups, "addObject:", v21);
          if ((VCMediaNegotiator *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 7)
              goto LABEL_75;
            v45 = VRTraceErrorLogLevelToCSTR();
            v46 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              goto LABEL_75;
            *(_DWORD *)buf = 136315906;
            v78 = v45;
            v79 = 2080;
            v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
            v81 = 1024;
            v82 = 1762;
            v83 = 2112;
            v84 = v21;
            v47 = " [%s] %s:%d negotiated video streamGroupConfig=%@";
            v48 = v46;
            v49 = 38;
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v41 = (const __CFString *)-[VCMediaNegotiator performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v41 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 7)
              goto LABEL_75;
            v50 = VRTraceErrorLogLevelToCSTR();
            v51 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              goto LABEL_75;
            *(_DWORD *)buf = 136316418;
            v78 = v50;
            v79 = 2080;
            v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
            v81 = 1024;
            v82 = 1762;
            v83 = 2112;
            v84 = (id)v41;
            v85 = 2048;
            v86 = self;
            v87 = 2112;
            v88 = v21;
            v47 = " [%s] %s:%d %@(%p) negotiated video streamGroupConfig=%@";
            v48 = v51;
            v49 = 58;
          }
          _os_log_impl(&dword_1D8A54000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
LABEL_75:
          v44 = 1;
LABEL_76:

          return v44;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiator negotiateMultiwayVideoStreams:].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator negotiateMultiwayVideoStreams:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator negotiateMultiwayVideoStreams:].cold.1();
    }
    v44 = 0;
    goto LABEL_76;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v42 = VRTraceErrorLogLevelToCSTR();
    v43 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v78 = v42;
      v79 = 2080;
      v80 = "-[VCMediaNegotiator negotiateMultiwayVideoStreams:]";
      v81 = 1024;
      v82 = 1711;
      _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping negotiating video streams, as this device is audio only", buf, 0x1Cu);
    }
  }
  return 1;
}

- (id)newStreamGroupCodecConfigForPayload:(int)a3
{
  uint64_t v3;
  VCMediaNegotiatorStreamGroupCodecConfiguration *v4;

  v3 = *(_QWORD *)&a3;
  v4 = objc_alloc_init(VCMediaNegotiatorStreamGroupCodecConfiguration);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator newStreamGroupCodecConfigForPayload:].cold.1();
    }
    goto LABEL_11;
  }
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setCodecType:](v4, "setCodecType:", +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:", v3));
  if (!-[VCMediaNegotiatorStreamGroupCodecConfiguration codecType](v4, "codecType"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator newStreamGroupCodecConfigForPayload:].cold.2();
    }
LABEL_11:

    return 0;
  }
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setRtpPayload:](v4, "setRtpPayload:", v3);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setPTime:](v4, "setPTime:", 20);
  -[VCMediaNegotiatorStreamGroupCodecConfiguration setCipherSuite:](v4, "setCipherSuite:", 3);
  return v4;
}

- (id)newStreamConfigFromMultiwayAudioStream:(id)a3
{
  VCMediaNegotiatorStreamGroupStreamConfiguration *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(VCMediaNegotiatorStreamGroupStreamConfiguration);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "newMultiwayAudioStream");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = (void *)objc_msgSend(v5, "supportedAudioPayloads");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          -[VCMediaNegotiatorStreamGroupStreamConfiguration addPayload:](v4, "addPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "unsignedIntValue"));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
      }
      while (v8);
    }

    -[VCMediaNegotiatorStreamGroupStreamConfiguration setSsrc:](v4, "setSsrc:", objc_msgSend(a3, "ssrc"));
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setStreamID:](v4, "setStreamID:", (unsigned __int16)objc_msgSend(a3, "streamID"));
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setMetadata:](v4, "setMetadata:", 0);
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setQualityIndex:](v4, "setQualityIndex:", objc_msgSend(a3, "qualityIndex"));
    v11 = objc_msgSend(a3, "hasMaxNetworkBitrate");
    v12 = 0;
    if (v11)
      v12 = objc_msgSend(a3, "maxNetworkBitrate", 0);
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setMaxNetworkBitrate:](v4, "setMaxNetworkBitrate:", v12);
    if (objc_msgSend(a3, "hasMaxMediaBitrate"))
      v13 = objc_msgSend(a3, "maxMediaBitrate");
    else
      v13 = 0;
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setMaxMediaBitrate:](v4, "setMaxMediaBitrate:", v13);
    if (objc_msgSend(a3, "hasMaxPacketsPerSecond"))
    {
      objc_msgSend(a3, "maxPacketsPerSecond");
      v15 = v14;
    }
    else
    {
      v15 = 0;
    }
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setMaxPacketsPerSecond:](v4, "setMaxPacketsPerSecond:", v15);
    v16 = objc_msgSend(a3, "hasRepairedStreamID");
    if (v16)
      LOWORD(v16) = objc_msgSend(a3, "repairedStreamID");
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setRepairedStreamID:](v4, "setRepairedStreamID:", (unsigned __int16)v16);
    if (objc_msgSend(a3, "hasRepairedMaxNetworkBitrate"))
      v17 = objc_msgSend(a3, "repairedMaxNetworkBitrate");
    else
      v17 = 0;
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setRepairedMaxNetworkBitrate:](v4, "setRepairedMaxNetworkBitrate:", v17);
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setRtpTimestampRate:](v4, "setRtpTimestampRate:", 24000);
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setAudioChannelCount:](v4, "setAudioChannelCount:", 1);
    -[VCMediaNegotiatorStreamGroupStreamConfiguration setCoordinateSystem:](v4, "setCoordinateSystem:", 0);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiator newStreamConfigFromMultiwayAudioStream:].cold.1();
  }
  return v4;
}

+ (unsigned)mappedRemoteQualityIndexForQualityIndex:(unsigned int)a3
{
  if (a3 == 62)
    return 35;
  else
    return a3;
}

- (id)newStreamConfigFromMultiwayVideoStream:(id)a3
{
  VCMediaNegotiatorStreamGroupStreamConfiguration *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  VCMediaNegotiator *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(VCMediaNegotiatorStreamGroupStreamConfiguration);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:].cold.1();
    }
    goto LABEL_67;
  }
  if ((objc_msgSend(a3, "metadata") & 1) != 0)
  {
    if ((VCMediaNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:].cold.5();
      }
      goto LABEL_67;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCMediaNegotiator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_67;
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_DWORD *)buf = 136316418;
    v27 = v18;
    v28 = 2080;
    v29 = "-[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]";
    v30 = 1024;
    v31 = 1845;
    v32 = 2112;
    v33 = v14;
    v34 = 2048;
    v35 = self;
    v36 = 1024;
    v37 = objc_msgSend(a3, "metadata");
    v20 = " [%s] %s:%d %@(%p) Video stream sub-streams metadata=%d not supported in groups";
    goto LABEL_69;
  }
  if (objc_msgSend(a3, "metadata") >= 2)
  {
    if ((VCMediaNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:].cold.2();
      }
      goto LABEL_67;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCMediaNegotiator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_67;
    v21 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_DWORD *)buf = 136316418;
    v27 = v21;
    v28 = 2080;
    v29 = "-[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]";
    v30 = 1024;
    v31 = 1848;
    v32 = 2112;
    v33 = v15;
    v34 = 2048;
    v35 = self;
    v36 = 1024;
    v37 = objc_msgSend(a3, "metadata");
    v20 = " [%s] %s:%d %@(%p) Unknown metadata flags. metadata=%d not supported in groups";
    goto LABEL_69;
  }
  v6 = +[VCMediaNegotiationBlobMultiwayVideoStream payloadForVideoPayload:](VCMediaNegotiationBlobMultiwayVideoStream, "payloadForVideoPayload:", objc_msgSend(a3, "payload"));
  if (!-[VCMediaNegotiator isVideoStreamSupported:](self, "isVideoStreamSupported:", v6))
  {
    if ((VCMediaNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:].cold.4();
      }
      goto LABEL_67;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)-[VCMediaNegotiator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_67;
    v22 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_67;
    *(_DWORD *)buf = 136316418;
    v27 = v22;
    v28 = 2080;
    v29 = "-[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]";
    v30 = 1024;
    v31 = 1852;
    v32 = 2112;
    v33 = v16;
    v34 = 2048;
    v35 = self;
    v36 = 1024;
    v37 = v6;
    v20 = " [%s] %s:%d %@(%p) Video stream payload=%d is not supported";
    goto LABEL_69;
  }
  -[VCMediaNegotiatorStreamGroupStreamConfiguration addPayload:](v5, "addPayload:", v6);
  v25 = 0;
  if (!+[VCMediaNegotiationBlobMultiwayVideoStream convertVideoFormat:width:height:](VCMediaNegotiationBlobMultiwayVideoStream, "convertVideoFormat:width:height:", objc_msgSend(a3, "supportedVideoFormats"), (char *)&v25 + 4, &v25))
  {
    if ((VCMediaNegotiator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:].cold.3();
      }
      goto LABEL_67;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCMediaNegotiator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (v23 = VRTraceErrorLogLevelToCSTR(),
          v19 = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
    {
LABEL_67:

      return 0;
    }
    v24 = objc_msgSend(a3, "supportedVideoFormats");
    *(_DWORD *)buf = 136316418;
    v27 = v23;
    v28 = 2080;
    v29 = "-[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]";
    v30 = 1024;
    v31 = 1858;
    v32 = 2112;
    v33 = v17;
    v34 = 2048;
    v35 = self;
    v36 = 1024;
    v37 = v24;
    v20 = " [%s] %s:%d %@(%p) Video stream has an invalid video resolution. supportedVideoFormats %d";
LABEL_69:
    _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x36u);
    goto LABEL_67;
  }
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setResolution:](v5, "setResolution:", (double)SHIDWORD(v25), (double)(int)v25);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setSsrc:](v5, "setSsrc:", objc_msgSend(a3, "ssrc"));
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setStreamID:](v5, "setStreamID:", (unsigned __int16)objc_msgSend(a3, "streamID"));
  if (objc_msgSend(a3, "hasMetadata"))
    v7 = objc_msgSend(a3, "metadata");
  else
    v7 = 0;
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setMetadata:](v5, "setMetadata:", v7);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setQualityIndex:](v5, "setQualityIndex:", +[VCMediaNegotiator mappedRemoteQualityIndexForQualityIndex:](VCMediaNegotiator, "mappedRemoteQualityIndexForQualityIndex:", objc_msgSend(a3, "qualityIndex")));
  if (objc_msgSend(a3, "hasMaxNetworkBitrate"))
    v8 = objc_msgSend(a3, "maxNetworkBitrate");
  else
    v8 = 0;
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setMaxNetworkBitrate:](v5, "setMaxNetworkBitrate:", v8);
  if (objc_msgSend(a3, "hasMaxMediaBitrate"))
    v9 = objc_msgSend(a3, "maxMediaBitrate");
  else
    v9 = 0;
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setMaxMediaBitrate:](v5, "setMaxMediaBitrate:", v9);
  if (objc_msgSend(a3, "hasMaxPacketsPerSecond"))
    v10 = objc_msgSend(a3, "maxPacketsPerSecond");
  else
    v10 = 0;
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setMaxPacketsPerSecond:](v5, "setMaxPacketsPerSecond:", v10);
  v11 = objc_msgSend(a3, "hasRepairedStreamID");
  if (v11)
    LOWORD(v11) = objc_msgSend(a3, "repairedStreamID");
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setRepairedStreamID:](v5, "setRepairedStreamID:", (unsigned __int16)v11);
  if (objc_msgSend(a3, "hasRepairedMaxNetworkBitrate"))
    v12 = objc_msgSend(a3, "repairedMaxNetworkBitrate");
  else
    v12 = 0;
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setRepairedMaxNetworkBitrate:](v5, "setRepairedMaxNetworkBitrate:", v12);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setFramerate:](v5, "setFramerate:", objc_msgSend(a3, "frameRate"));
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setKeyFrameInterval:](v5, "setKeyFrameInterval:", objc_msgSend(a3, "keyFrameInterval"));
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setRtpTimestampRate:](v5, "setRtpTimestampRate:", 24000);
  -[VCMediaNegotiatorStreamGroupStreamConfiguration setCoordinateSystem:](v5, "setCoordinateSystem:", 3);
  return v5;
}

- (int)mediaBlobLanguageWithLocale:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)mediaBlobLanguageWithLocale___mapping;
  if (!mediaBlobLanguageWithLocale___mapping)
  {
    v3 = &unk_1E9EFB358;
    mediaBlobLanguageWithLocale___mapping = (uint64_t)&unk_1E9EFB358;
  }
  v4 = (void *)objc_msgSend(v3, "objectForKey:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C997E8]));
  if (v4)
    LODWORD(v4) = objc_msgSend(v4, "intValue");
  return (int)v4;
}

- (id)localeWithMediaBlobLanguage:(int)a3
{
  uint64_t v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v3 = *(_QWORD *)&a3;
  v7[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)localeWithMediaBlobLanguage___mapping;
  if (!localeWithMediaBlobLanguage___mapping)
  {
    v6[0] = &unk_1E9EF5E28;
    v6[1] = &unk_1E9EF5E40;
    v7[0] = objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v7[1] = objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("zh_CN"));
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
    localeWithMediaBlobLanguage___mapping = (uint64_t)v4;
  }
  return (id)objc_msgSend(v4, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3));
}

- (void)setupCaptionsForMediaBlob:(id)a3
{
  void *v5;
  void *v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  int v14;
  BOOL v15;
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
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setCanDisplayCaptions:", 1);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = -[VCMediaNegotiatorLocalConfiguration captionsSenderLanguages](self->super._localSettings, "captionsSenderLanguages");
    v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v8)
    {
      v9 = v8;
      LODWORD(v10) = 0;
      v11 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v14 = -[VCMediaNegotiator mediaBlobLanguageWithLocale:](self, "mediaBlobLanguageWithLocale:", v13);
          if (v13)
            v15 = 0;
          else
            v15 = (_DWORD)v10 == 0;
          if (v15)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
            {
              v16 = VRTraceErrorLogLevelToCSTR();
              v17 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v18 = objc_msgSend((id)objc_msgSend(0, "objectForKey:", *MEMORY[0x1E0C997E8]), "UTF8String");
                v19 = 136315906;
                v20 = v16;
                v21 = 2080;
                v22 = "-[VCMediaNegotiator setupCaptionsForMediaBlob:]";
                v23 = 1024;
                v24 = 1922;
                v25 = 2080;
                v26 = v18;
                _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unsupported captions languages in local langauges: %s.", (uint8_t *)&v19, 0x26u);
              }
            }
            goto LABEL_16;
          }
          v10 = v14 | v10;
        }
        v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
        if (v9)
          continue;
        break;
      }
      if ((_DWORD)v10)
        objc_msgSend(v6, "setSenderLanguages:", v10);
    }
    objc_msgSend(a3, "setCaptionsSettings:", v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiator setupCaptionsForMediaBlob:].cold.1();
  }
LABEL_16:

}

- (BOOL)negotiateCaptionsWithCaptionsSettings:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  BOOL result;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[VCMediaNegotiatorResultsCaptions setRemoteCanDisplayCaptions:](self->_negotiatedCaptionsSettings, "setRemoteCanDisplayCaptions:", objc_msgSend(a3, "canDisplayCaptions"));
  -[VCMediaNegotiatorResultsCaptions setLocalLanguages:](self->_negotiatedCaptionsSettings, "setLocalLanguages:", -[VCMediaNegotiatorLocalConfiguration captionsReceiverLanguages](self->super._localSettings, "captionsReceiverLanguages"));
  if (!objc_msgSend(a3, "hasSenderLanguages"))
    return 1;
  v5 = objc_opt_new();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 1;
    do
    {
      v8 = v7;
      if ((objc_msgSend(a3, "senderLanguages") & v7) != 0)
      {
        v9 = -[VCMediaNegotiator localeWithMediaBlobLanguage:](self, "localeWithMediaBlobLanguage:", v8);
        if (v9)
          objc_msgSend(v6, "addObject:", v9);
      }
      v7 = (2 * v8);
    }
    while ((v8 & 1) != 0);
    if (objc_msgSend(v6, "count"))
      -[VCMediaNegotiatorResultsCaptions setRemoteLanguages:](self->_negotiatedCaptionsSettings, "setRemoteLanguages:", v6);

    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    return 0;
  v11 = VRTraceErrorLogLevelToCSTR();
  v12 = *MEMORY[0x1E0CF2758];
  v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v13)
  {
    v14 = 136315650;
    v15 = v11;
    v16 = 2080;
    v17 = "-[VCMediaNegotiator negotiateCaptionsWithCaptionsSettings:]";
    v18 = 1024;
    v19 = 1949;
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to allcoate remote languages.", (uint8_t *)&v14, 0x1Cu);
    return 0;
  }
  return result;
}

+ (id)streamGroupIDsWithMediaBlob:(id)a3
{
  id v3;
  VCMediaNegotiationBlob *v4;
  uint64_t v5;
  void *v6;

  v3 = +[VCMediaNegotiator newDecompressedBlob:](VCMediaNegotiator, "newDecompressedBlob:");
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiator streamGroupIDsWithMediaBlob:].cold.1();
    }
    goto LABEL_20;
  }
  v4 = -[VCMediaNegotiationBlob initWithData:]([VCMediaNegotiationBlob alloc], "initWithData:", v3);
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiator streamGroupIDsWithMediaBlob:].cold.2();
    }
LABEL_20:
    v4 = 0;
LABEL_21:
    v6 = 0;
    goto LABEL_10;
  }
  v5 = objc_msgSend(MEMORY[0x1E0C99E20], "set");
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCMediaNegotiator streamGroupIDsWithMediaBlob:].cold.3();
    }
    goto LABEL_21;
  }
  v6 = (void *)v5;
  if (-[NSMutableArray count](-[VCMediaNegotiationBlob multiwayAudioStreams](v4, "multiwayAudioStreams"), "count")
    || -[VCMediaNegotiationBlob hasAudioSettings](v4, "hasAudioSettings"))
  {
    objc_msgSend(v6, "addObject:", &unk_1E9EF5E58);
  }
  if (-[NSMutableArray count](-[VCMediaNegotiationBlob multiwayVideoStreams](v4, "multiwayVideoStreams"), "count")
    || -[VCMediaNegotiationBlob hasVideoSettings](v4, "hasVideoSettings"))
  {
    objc_msgSend(v6, "addObject:", &unk_1E9EF5E70);
  }
LABEL_10:

  return v6;
}

- (BOOL)usePreNegotiation
{
  return self->_usePreNegotiation;
}

- (VCMediaNegotiatorResultsCaptions)negotiatedCaptionsSettings
{
  return self->_negotiatedCaptionsSettings;
}

- (int64_t)negotiationMode
{
  return self->_negotiationMode;
}

- (BOOL)isCellular16x9Capable
{
  return self->_isCellular16x9Capable;
}

- (void)initWithLocalSettings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate negotiation captions results", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithLocalSettings:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid local configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isNegotiationModeValid:.cold.1()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCMediaNegotiator isNegotiationModeValid:]";
  OUTLINED_FUNCTION_4();
  v5 = 127;
  v6 = v0;
  v7 = v1;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v2, (uint64_t)v2, " [%s] %s:%d Invalid mediaStreamMode=%d", v3);
  OUTLINED_FUNCTION_3();
}

- (void)isNegotiationModeForScreenShare:.cold.1()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCMediaNegotiator isNegotiationModeForScreenShare:]";
  OUTLINED_FUNCTION_4();
  v5 = 146;
  v6 = v0;
  v7 = v1;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v2, (uint64_t)v2, " [%s] %s:%d Invalid mediaStreamMode=%d", v3);
  OUTLINED_FUNCTION_3();
}

- (void)negotiationData
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid media negotiator state: The callee tried to create the invite blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid media negotiator state: The caller tried to process the invite blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decompress the media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode the media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate multiway video streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate multiway audio streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate moments settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate captions settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate screen settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.9()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate video settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.10()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate audio settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.11()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate FaceTime settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processRemoteNegotiationData:.cold.12()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Exception occurred while parsing remote invite blob: %@");
  OUTLINED_FUNCTION_3();
}

+ (void)negotiationBlobFromData:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Exception occurred while blob from data. exception=%@");
  OUTLINED_FUNCTION_3();
}

+ (void)localConfigurationWithData:deviceRole:preferredAudioPayload:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the local configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)localConfigurationWithData:deviceRole:preferredAudioPayload:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to inialize the local configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)addMediaConfigurationsToLocalConfiguration:withBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to generate microphoneConfiguration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)addMediaConfigurationsToLocalConfiguration:withBlob:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate screenConfiguration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)addMediaConfigurationsToLocalConfiguration:withBlob:.cold.3()
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

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to extract negotiation data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)initializeLocalConfiguration:negotiationData:deviceRole:preferredAudioPayload:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to apply media configurations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newResponseBlob
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create bandwidth settings for media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processResponseBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decompress the media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processResponseBlob:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decode the media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processResponseBlob:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiation FaceTime settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processResponseBlob:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiation moments settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processResponseBlob:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiation captions settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processResponseBlob:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to parse screen rules from response blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processResponseBlob:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to parse video rules from response blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processResponseBlob:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to parse audio rules from response blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processResponseBlob:.cold.9()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Exception occurred while parsing remote response blob: %@");
  OUTLINED_FUNCTION_3();
}

- (void)processResponseBlob:.cold.10()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid media negotiator state: The callee tried to process the response blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to allocate dictionary for local feature string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to allocate dictionary for remote feature string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)validateMultiwayVideoStreamConfigurations:.cold.1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_14_12(v0, *MEMORY[0x1E0C80C00]), "ssrc");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Found substream with ssrc[%x] not associated with a parent stream", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

+ (void)validateMultiwayAudioStreamConfigurations:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unsupported audio substream !!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateAudioDTXPayload:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d DTX payload not available!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateAudioSettings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to extract audio rules from media negotiation blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateAudioSettings:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiation primary audio payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioWithNegotiatedSettings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to extract audio configuration from media response blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)selectVideoFeatureString:selectedPayload:videoConfiguration:.cold.1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_14_12(v0, *MEMORY[0x1E0C80C00]), "intValue");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to find local video feature list %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)processParameterSets:videoResults:.cold.1()
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
  objc_msgSend((id)OUTLINED_FUNCTION_14_12(v0, *MEMORY[0x1E0C80C00]), "payload");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Parameter set is not valid for payload %u", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)negotiateVideoSettings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to extract video rules from media negotiation blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateVideoSettings:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No available payloads", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateVideoSettings:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate HDR modes correctly", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateVideoSettings:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate and set pixel format set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateVideoSettings:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set video parameter set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoWithNegotiatedSettings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to extract the video rule collection from response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoWithNegotiatedSettings:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set video parameter set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoWithNegotiatedSettings:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate HDR modes correctly", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupVideoWithNegotiatedSettings:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve negotiated pixel formats", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateScreenSettings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unable to extract screen rules from media negotiation blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateScreenSettings:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No available payloads", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateScreenSettings:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate HDR modes correctly", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateScreenSettings:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate and set pixel format set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateScreenSettings:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set screen parameter set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupScreenWithNegotiatedSettings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to extract the screen rule collection from response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupScreenWithNegotiatedSettings:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set screen parameter set", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupScreenWithNegotiatedSettings:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to negotiate HDR modes correctly", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupScreenWithNegotiatedSettings:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to retrieve negotiated pixel formats", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupMomentsForMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate moments settings.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateMultiwayAudioStreams:.cold.1()
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

- (void)negotiateMultiwayAudioStreams:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No codec configs in stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateMultiwayAudioStreams:.cold.3()
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

- (void)negotiateMultiwayAudioStreams:.cold.4()
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

- (void)negotiateMultiwayVideoStreams:.cold.1()
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

- (void)negotiateMultiwayVideoStreams:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No streamConfigs in the stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateMultiwayVideoStreams:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d No codec configs in stream group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiateMultiwayVideoStreams:.cold.4()
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

- (void)newStreamGroupCodecConfigForPayload:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate a codec configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamGroupCodecConfigForPayload:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate a codec configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamConfigFromMultiwayAudioStream:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate a StreamGroup Stream configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamConfigFromMultiwayVideoStream:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate a StreamGroup Stream configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamConfigFromMultiwayVideoStream:.cold.2()
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
  OUTLINED_FUNCTION_15_7(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Unknown metadata flags. metadata=%d not supported in groups", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newStreamConfigFromMultiwayVideoStream:.cold.3()
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
  objc_msgSend((id)OUTLINED_FUNCTION_14_12(v0, *MEMORY[0x1E0C80C00]), "supportedVideoFormats");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Video stream has an invalid video resolution. supportedVideoFormats %d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)newStreamConfigFromMultiwayVideoStream:.cold.4()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCMediaNegotiator newStreamConfigFromMultiwayVideoStream:]";
  OUTLINED_FUNCTION_4();
  v5 = 1852;
  v6 = v0;
  v7 = v1;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v2, (uint64_t)v2, " [%s] %s:%d Video stream payload=%d is not supported", v3);
  OUTLINED_FUNCTION_3();
}

- (void)newStreamConfigFromMultiwayVideoStream:.cold.5()
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
  OUTLINED_FUNCTION_15_7(v0, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_12();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v1, v2, " [%s] %s:%d Video stream sub-streams metadata=%d not supported in groups", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

- (void)setupCaptionsForMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate captions settings.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)streamGroupIDsWithMediaBlob:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to decompress the blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)streamGroupIDsWithMediaBlob:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to unserialize the blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)streamGroupIDsWithMediaBlob:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the stream group IDs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)streamGroupIDsWithMediaBlob:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Exception occurred while blob from data: %@");
  OUTLINED_FUNCTION_3();
}

@end
