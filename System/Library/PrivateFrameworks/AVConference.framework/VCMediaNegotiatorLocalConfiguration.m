@implementation VCMediaNegotiatorLocalConfiguration

- (VCMediaNegotiatorLocalConfiguration)init
{
  VCMediaNegotiatorLocalConfiguration *v2;
  double v3;
  NSMutableOrderedSet *v4;
  NSMutableOrderedSet *v5;
  NSMutableSet *v6;
  NSSet *v7;
  NSSet *v8;
  NSMutableSet *v9;
  NSMutableDictionary *v10;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)VCMediaNegotiatorLocalConfiguration;
  v2 = -[VCMediaNegotiatorLocalConfiguration init](&v12, sel_init);
  if (v2)
  {
    v3 = micro();
    v2->_creationTime.wide = MicroToNTP(v3);
    v2->_tilesPerVideoFrame = 1;
    v2->_ltrpEnabled = 1;
    v2->_accessNetworkType = 0;
    v4 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v2->_multiwayAudioStreams = v4;
    if (v4)
    {
      v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      v2->_multiwayVideoStreams = v5;
      if (v5)
      {
        v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v2->_bandwidthConfigurations = v6;
        if (v6)
        {
          v7 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
          v2->_pixelFormats = v7;
          if (v7)
          {
            v8 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
            v2->_hdrModesSupported = v8;
            if (v8)
            {
              v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
              v2->_streamGroupConfigs = v9;
              if (v9)
              {
                v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
                v2->_u1StreamConfigurations = v10;
                if (v10)
                {
                  v2->_mediaControlInfoFECFeedbackVersion = 0;
                  v2->_screenSize.width = (double)+[VCHardwareSettings screenWidth](VCHardwareSettings, "screenWidth");
                  v2->_screenSize.height = (double)+[VCHardwareSettings screenHeight](VCHardwareSettings, "screenHeight");
                  +[VCVideoFeatureListStringHelper aspectRatioPortrait:landscape:isMismatchedOrientation:](VCVideoFeatureListStringHelper, "aspectRatioPortrait:landscape:isMismatchedOrientation:", &v2->_aspectRatioPortrait, &v2->_aspectRatioLandscape, 0);
                  +[VCVideoFeatureListStringHelper aspectRatioPortrait:landscape:isMismatchedOrientation:](VCVideoFeatureListStringHelper, "aspectRatioPortrait:landscape:isMismatchedOrientation:", 0, &v2->_orientationMismatchAspectRatioLandscape, 1);
                  return v2;
                }
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCMediaNegotiatorLocalConfiguration init].cold.7();
                }
              }
              else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCMediaNegotiatorLocalConfiguration init].cold.6();
              }
            }
            else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCMediaNegotiatorLocalConfiguration init].cold.5();
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaNegotiatorLocalConfiguration init].cold.4();
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCMediaNegotiatorLocalConfiguration init].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaNegotiatorLocalConfiguration init].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaNegotiatorLocalConfiguration init].cold.1();
    }

    return 0;
  }
  return v2;
}

- (VCMediaNegotiatorLocalConfiguration)initWithBitrateArbiter:(id)a3
{
  VCMediaNegotiatorLocalConfiguration *v4;
  VCMediaNegotiatorLocalConfiguration *v5;

  v4 = -[VCMediaNegotiatorLocalConfiguration init](self, "init");
  v5 = v4;
  if (v4
    && !-[VCMediaNegotiatorLocalConfiguration setupBandwidthConfigurationsWithArbiter:](v4, "setupBandwidthConfigurationsWithArbiter:", a3))
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorLocalConfiguration;
  -[VCMediaNegotiatorLocalConfiguration dealloc](&v3, sel_dealloc);
}

- (void)setMediaConfiguration:(id)a3 forMediaType:(unsigned __int8)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_u1StreamConfigurations, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a4));
}

- (id)mediaConfigurationForMediaType:(unsigned __int8)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_u1StreamConfigurations, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3));
}

- (BOOL)setupBandwidthConfigurationsWithArbiter:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unsigned __int8 v11;
  VCMediaNegotiatorBandwidthConfiguration *v12;
  VCMediaNegotiatorBandwidthConfiguration *v13;
  VCMediaNegotiatorBandwidthConfiguration *v14;
  VCMediaNegotiatorBandwidthConfiguration *v15;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v19 = objc_msgSend(&unk_1E9EF9FC8, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v39;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(&unk_1E9EF9FC8);
        v21 = v5;
        v6 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v5), "intValue");
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v7 = objc_msgSend(&unk_1E9EF9FE0, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v34 != v9)
                objc_enumerationMutation(&unk_1E9EF9FE0);
              v11 = objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "intValue");
              v12 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", v11, v6, objc_msgSend(a3, "maxAllowedBitrateForConnectionType:arbiterMode:", v6, v11));
              if (!v12)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  v17 = VRTraceErrorLogLevelToCSTR();
                  v18 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316162;
                    v23 = v17;
                    v24 = 2080;
                    v25 = "-[VCMediaNegotiatorLocalConfiguration setupBandwidthConfigurationsWithArbiter:]";
                    v26 = 1024;
                    v27 = 185;
                    v28 = 1024;
                    v29 = v11;
                    v30 = 1024;
                    v31 = v6;
                    _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate bandwidth configuration for mode=%hhu connectionType:%d", buf, 0x28u);
                  }
                }
                goto LABEL_22;
              }
              v13 = v12;
              -[NSMutableSet addObject:](self->_bandwidthConfigurations, "addObject:", v12);

            }
            v8 = objc_msgSend(&unk_1E9EF9FE0, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
            if (v8)
              continue;
            break;
          }
        }
        v14 = -[VCMediaNegotiatorBandwidthConfiguration initWithConnectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithConnectionType:maxBandwidth:", v6, objc_msgSend(a3, "maxAllowedBitrateForConnectionType:arbiterMode:", v6, 2));
        if (!v14)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCMediaNegotiatorLocalConfiguration setupBandwidthConfigurationsWithArbiter:].cold.2();
          }
          goto LABEL_22;
        }
        v15 = v14;
        -[NSMutableSet addObject:](self->_bandwidthConfigurations, "addObject:", v14);

        v5 = v21 + 1;
      }
      while (v21 + 1 != v19);
      v19 = objc_msgSend(&unk_1E9EF9FC8, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
      if (v19)
        continue;
      break;
    }
  }
  if (-[VCMediaNegotiatorLocalConfiguration setupBandwidthExtensionConfiguration:](self, "setupBandwidthExtensionConfiguration:", a3))
  {
    return 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCMediaNegotiatorLocalConfiguration setupBandwidthConfigurationsWithArbiter:].cold.1();
  }
LABEL_22:
  -[NSMutableSet removeAllObjects](self->_bandwidthConfigurations, "removeAllObjects");
  return 0;
}

- (BOOL)setupBandwidthExtensionConfiguration:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 v11;
  VCMediaNegotiatorBandwidthConfiguration *v12;
  VCMediaNegotiatorBandwidthConfiguration *v13;
  VCMediaNegotiatorBandwidthConfiguration *v14;
  VCMediaNegotiatorBandwidthConfiguration *v15;
  VCMediaNegotiatorBandwidthConfiguration *v16;
  VCMediaNegotiatorBandwidthConfiguration *v17;
  VCMediaNegotiatorBandwidthConfiguration *v18;
  VCMediaNegotiatorBandwidthConfiguration *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
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
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v24 = objc_msgSend(&unk_1E9EF9FF8, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v44;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v44 != v25)
          objc_enumerationMutation(&unk_1E9EF9FF8);
        v26 = v5;
        v6 = objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v5), "intValue");
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v7 = objc_msgSend(&unk_1E9EFA010, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v39;
LABEL_8:
          v10 = 0;
          while (1)
          {
            if (*(_QWORD *)v39 != v9)
              objc_enumerationMutation(&unk_1E9EFA010);
            v11 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v10), "intValue");
            v12 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", v11, v6, objc_msgSend(a3, "maxAllowedBitrateForConnectionType:arbiterMode:", v6, v11));
            if (!v12)
              break;
            v13 = v12;
            -[NSMutableSet addObject:](self->_bandwidthConfigurations, "addObject:", v12);

            if (v8 == ++v10)
            {
              v8 = objc_msgSend(&unk_1E9EFA010, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
              if (v8)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_23;
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x1E0CF2758];
          v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (v20)
          {
            *(_DWORD *)buf = 136316162;
            v28 = v21;
            v29 = 2080;
            v30 = "-[VCMediaNegotiatorLocalConfiguration setupBandwidthExtensionConfiguration:]";
            v31 = 1024;
            v32 = 219;
            v33 = 1024;
            v34 = v11;
            v35 = 1024;
            v36 = v6;
            _os_log_error_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate bandwidth configuration for mode=%hhu connectionType:%d", buf, 0x28u);
            goto LABEL_23;
          }
          return v20;
        }
LABEL_14:
        v5 = v26 + 1;
      }
      while (v26 + 1 != v24);
      v24 = objc_msgSend(&unk_1E9EF9FF8, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
      if (v24)
        continue;
      break;
    }
  }
  v14 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 1, 6, objc_msgSend(a3, "maxAllowedBitrateForConnectionType:arbiterMode:", 6, 1));
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v20)
        return v20;
      -[VCMediaNegotiatorLocalConfiguration setupBandwidthExtensionConfiguration:].cold.1();
    }
    goto LABEL_23;
  }
  v15 = v14;
  -[NSMutableSet addObject:](self->_bandwidthConfigurations, "addObject:", v14);

  v16 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 7, 3, objc_msgSend(a3, "maxAllowedBitrateForConnectionType:arbiterMode:", 3, 7));
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v20)
        return v20;
      -[VCMediaNegotiatorLocalConfiguration setupBandwidthExtensionConfiguration:].cold.2();
    }
    goto LABEL_23;
  }
  v17 = v16;
  -[NSMutableSet addObject:](self->_bandwidthConfigurations, "addObject:", v16);

  v18 = -[VCMediaNegotiatorBandwidthConfiguration initWithArbiterMode:connectionType:maxBandwidth:]([VCMediaNegotiatorBandwidthConfiguration alloc], "initWithArbiterMode:connectionType:maxBandwidth:", 5, 7, objc_msgSend(a3, "maxAllowedBitrateForConnectionType:arbiterMode:", 7, 5));
  if (!v18)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v20)
        return v20;
      -[VCMediaNegotiatorLocalConfiguration setupBandwidthExtensionConfiguration:].cold.3();
    }
LABEL_23:
    LOBYTE(v20) = 0;
    return v20;
  }
  v19 = v18;
  -[NSMutableSet addObject:](self->_bandwidthConfigurations, "addObject:", v18);

  LOBYTE(v20) = 1;
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  NSMutableSet *streamGroupConfigs;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = (void *)-[NSMutableDictionary mutableCopyWithZone:](self->_u1StreamConfigurations, "mutableCopyWithZone:", a3);
    objc_msgSend(v5, "setU1StreamConfigurations:", v6);

    objc_msgSend(v5, "setPreferredAudioCodec:", self->_preferredAudioCodec);
    objc_msgSend(v5, "setDeviceRole:", self->_deviceRole);
    objc_msgSend(v5, "setAllowRTCPFB:", self->_allowRTCPFB);
    objc_msgSend(v5, "setIsCaller:", self->_isCaller);
    objc_msgSend(v5, "setBasebandCodec:", self->_basebandCodec);
    objc_msgSend(v5, "setBasebandCodecSampleRate:", self->_basebandCodecSampleRate);
    objc_msgSend(v5, "setBandwidthConfigurations:", self->_bandwidthConfigurations);
    objc_msgSend(v5, "setCaptionsSenderLanguages:", self->_captionsSenderLanguages);
    objc_msgSend(v5, "setCaptionsReceiverLanguages:", self->_captionsReceiverLanguages);
    objc_msgSend(v5, "setCallLogFile:", self->_callLogFile);
    objc_msgSend(v5, "setCreationTime:", self->_creationTime.wide);
    objc_msgSend(v5, "setMediaControlInfoVersion:", self->_mediaControlInfoVersion);
    objc_msgSend(v5, "setMultiwayAudioStreams:", self->_multiwayAudioStreams);
    objc_msgSend(v5, "setMultiwayVideoStreams:", self->_multiwayVideoStreams);
    objc_msgSend(v5, "setMediaRecorderVideoCodecs:", self->_mediaRecorderVideoCodecs);
    objc_msgSend(v5, "setMediaRecorderImageTypes:", self->_mediaRecorderImageTypes);
    objc_msgSend(v5, "setSIPDisabled:", self->_SIPDisabled);
    objc_msgSend(v5, "setSecureMessagingRequired:", self->_secureMessagingRequired);
    objc_msgSend(v5, "setFaceTimeSwitches:", self->_faceTimeSwitches);
    objc_msgSend(v5, "setOneToOneModeSupported:", self->_oneToOneModeSupported);
    objc_msgSend(v5, "setPixelFormats:", self->_pixelFormats);
    objc_msgSend(v5, "setHdrModesSupported:", self->_hdrModesSupported);
    objc_msgSend(v5, "setMediaControlInfoFECFeedbackVersion:", self->_mediaControlInfoFECFeedbackVersion);
    objc_msgSend(v5, "setLinkProbingCapabilityVersion:", self->_linkProbingCapabilityVersion);
    objc_msgSend(v5, "setAccessNetworkType:", self->_accessNetworkType);
    objc_msgSend(v5, "setFecEnabled:", self->_fecEnabled);
    objc_msgSend(v5, "setRtxEnabled:", self->_rtxEnabled);
    objc_msgSend(v5, "setOneToOneAuthTagEnabled:", self->_oneToOneAuthTagEnabled);
    objc_msgSend(v5, "setBlackFrameOnClearScreenEnabled:", self->_blackFrameOnClearScreenEnabled);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    streamGroupConfigs = self->_streamGroupConfigs;
    v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](streamGroupConfigs, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(streamGroupConfigs);
          objc_msgSend(v5, "addStreamGroupConfig:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](streamGroupConfigs, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v9);
    }
  }
  return v5;
}

- (void)addBandwidthConfiguration:(id)a3
{
  -[NSMutableSet addObject:](self->_bandwidthConfigurations, "addObject:", a3);
}

- (void)addMultiwayAudioStream:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->_multiwayAudioStreams, "addObject:", a3);
}

- (void)addMultiwayVideoStream:(id)a3
{
  -[NSMutableOrderedSet addObject:](self->_multiwayVideoStreams, "addObject:", a3);
}

- (void)addStreamGroupConfig:(id)a3
{
  -[NSMutableSet addObject:](self->_streamGroupConfigs, "addObject:", a3);
}

- (void)resetStreamGroups
{
  -[NSMutableSet removeAllObjects](self->_streamGroupConfigs, "removeAllObjects");
}

- (BOOL)isEqualBandwidthConfigurations:(id)a3
{
  NSMutableSet *bandwidthConfigurations;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  bandwidthConfigurations = self->_bandwidthConfigurations;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](bandwidthConfigurations, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      v8 = 0;
LABEL_4:
      if (*(_QWORD *)v22 != v7)
        objc_enumerationMutation(bandwidthConfigurations);
      v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v8);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      if (!v10)
        break;
      v11 = v10;
      v12 = *(_QWORD *)v17;
LABEL_8:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(a3);
        if ((objc_msgSend(v9, "isEqual:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13)) & 1) != 0)
          break;
        if (v11 == ++v13)
        {
          v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
          v11 = v10;
          if (v10)
            goto LABEL_8;
          return v10;
        }
      }
      if (++v8 != v6)
        goto LABEL_4;
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](bandwidthConfigurations, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      LOBYTE(v10) = 1;
    }
    while (v6);
  }
  else
  {
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)isEqualMultiwayAudioStreamSet:(id)a3
{
  uint64_t v5;
  NSMutableOrderedSet *multiwayAudioStreams;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = -[NSMutableOrderedSet count](self->_multiwayAudioStreams, "count");
  if (v5 == objc_msgSend(a3, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    multiwayAudioStreams = self->_multiwayAudioStreams;
    v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](multiwayAudioStreams, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
LABEL_5:
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(multiwayAudioStreams);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        if (!v12)
          break;
        v13 = v12;
        v14 = *(_QWORD *)v19;
LABEL_9:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(a3);
          if ((objc_msgSend(v11, "isEqual:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15)) & 1) != 0)
            break;
          if (v13 == ++v15)
          {
            v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
            v13 = v12;
            if (v12)
              goto LABEL_9;
            return v12;
          }
        }
        if (++v10 != v8)
          goto LABEL_5;
        v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](multiwayAudioStreams, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        LOBYTE(v12) = 1;
      }
      while (v8);
    }
    else
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)isEqualMultiwayVideoStreamSet:(id)a3
{
  uint64_t v5;
  NSMutableOrderedSet *multiwayVideoStreams;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = -[NSMutableOrderedSet count](self->_multiwayVideoStreams, "count");
  if (v5 == objc_msgSend(a3, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    multiwayVideoStreams = self->_multiwayVideoStreams;
    v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](multiwayVideoStreams, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
LABEL_5:
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(multiwayVideoStreams);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        if (!v12)
          break;
        v13 = v12;
        v14 = *(_QWORD *)v19;
LABEL_9:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(a3);
          if ((objc_msgSend(v11, "isEqual:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15)) & 1) != 0)
            break;
          if (v13 == ++v15)
          {
            v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
            v13 = v12;
            if (v12)
              goto LABEL_9;
            return v12;
          }
        }
        if (++v10 != v8)
          goto LABEL_5;
        v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](multiwayVideoStreams, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        LOBYTE(v12) = 1;
      }
      while (v8);
    }
    else
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)isEqualStreamGroupConfigs:(id)a3
{
  uint64_t v5;
  NSMutableSet *streamGroupConfigs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = -[NSMutableSet count](self->_streamGroupConfigs, "count");
  if (v5 == objc_msgSend(a3, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    streamGroupConfigs = self->_streamGroupConfigs;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](streamGroupConfigs, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        v10 = 0;
LABEL_5:
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(streamGroupConfigs);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v10);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        if (!v12)
          break;
        v13 = v12;
        v14 = *(_QWORD *)v19;
LABEL_9:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(a3);
          if ((objc_msgSend(v11, "isEqual:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15)) & 1) != 0)
            break;
          if (v13 == ++v15)
          {
            v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
            v13 = v12;
            if (v12)
              goto LABEL_9;
            return v12;
          }
        }
        if (++v10 != v8)
          goto LABEL_5;
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](streamGroupConfigs, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
        LOBYTE(v12) = 1;
      }
      while (v8);
    }
    else
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  return v12;
}

- (BOOL)isEqualMediaRecorderImageTypes:(id)a3
{
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NSSet count](self->_mediaRecorderImageTypes, "count"),
        v5 == objc_msgSend((id)objc_msgSend(a3, "mediaRecorderImageTypes"), "count")))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_msgSend(a3, "mediaRecorderImageTypes");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = -[NSSet containsObject:](self->_mediaRecorderImageTypes, "containsObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        if (!v11)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
          LOBYTE(v11) = 1;
          if (v8)
            goto LABEL_5;
          return v11;
        }
      }
    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (BOOL)isEqualMediaRecorderVideoCodecs:(id)a3
{
  NSUInteger v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NSSet count](self->_mediaRecorderVideoCodecs, "count"),
        v5 == objc_msgSend((id)objc_msgSend(a3, "mediaRecorderVideoCodecs"), "count")))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)objc_msgSend(a3, "mediaRecorderVideoCodecs");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = -[NSSet containsObject:](self->_mediaRecorderVideoCodecs, "containsObject:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        if (!v11)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
          LOBYTE(v11) = 1;
          if (v8)
            goto LABEL_5;
          return v11;
        }
      }
    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (BOOL)isEqualFaceTimeSettings:(id)a3
{
  int SIPDisabled;
  int secureMessagingRequired;
  unsigned int faceTimeSwitches;
  int oneToOneModeSupported;
  int mediaControlInfoFECFeedbackVersion;
  int linkProbingCapabilityVersion;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  SIPDisabled = self->_SIPDisabled;
  if (SIPDisabled != objc_msgSend(a3, "SIPDisabled"))
    return 0;
  secureMessagingRequired = self->_secureMessagingRequired;
  if (secureMessagingRequired != objc_msgSend(a3, "secureMessagingRequired"))
    return 0;
  faceTimeSwitches = self->_faceTimeSwitches;
  if (faceTimeSwitches != objc_msgSend(a3, "faceTimeSwitches"))
    return 0;
  oneToOneModeSupported = self->_oneToOneModeSupported;
  if (oneToOneModeSupported != objc_msgSend(a3, "oneToOneModeSupported"))
    return 0;
  mediaControlInfoFECFeedbackVersion = self->_mediaControlInfoFECFeedbackVersion;
  if (mediaControlInfoFECFeedbackVersion != objc_msgSend(a3, "mediaControlInfoFECFeedbackVersion"))
    return 0;
  linkProbingCapabilityVersion = self->_linkProbingCapabilityVersion;
  return linkProbingCapabilityVersion == objc_msgSend(a3, "linkProbingCapabilityVersion");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a3, "u1StreamConfigurations"), "isEqual:", self->_u1StreamConfigurations)&& objc_msgSend(a3, "preferredAudioCodec") == self->_preferredAudioCodec&& objc_msgSend(a3, "deviceRole") == self->_deviceRole&& objc_msgSend(a3, "creationTime") == self->_creationTime.wide&& objc_msgSend(a3, "mediaControlInfoVersion") == self->_mediaControlInfoVersion&& (NSString *)objc_msgSend(a3, "basebandCodec") == self->_basebandCodec&& objc_msgSend(a3, "basebandCodecSampleRate") == self->_basebandCodecSampleRate&& (v5 = objc_msgSend((id)objc_msgSend(a3, "bandwidthConfigurations"), "count"), v5 == -[NSMutableSet count](self->_bandwidthConfigurations, "count"))&& self->_allowRTCPFB == objc_msgSend(a3, "allowRTCPFB")&& self->_isCaller == objc_msgSend(a3, "isCaller")&& objc_msgSend(a3, "accessNetworkType") == self->_accessNetworkType&& self->_fecEnabled == objc_msgSend(a3, "fecEnabled")&& self->_rtxEnabled == objc_msgSend(a3, "rtxEnabled")&& self->_oneToOneAuthTagEnabled == objc_msgSend(a3, "isOneToOneAuthTagEnabled")&& self->_blackFrameOnClearScreenEnabled == objc_msgSend(a3, "blackFrameOnClearScreenEnabled")&& -[VCMediaNegotiatorLocalConfiguration isEqualBandwidthConfigurations:](
         self,
         "isEqualBandwidthConfigurations:",
         objc_msgSend(a3, "bandwidthConfigurations"))
    && -[VCMediaNegotiatorLocalConfiguration isEqualMultiwayAudioStreamSet:](self, "isEqualMultiwayAudioStreamSet:", objc_msgSend(a3, "multiwayAudioStreams"))&& -[VCMediaNegotiatorLocalConfiguration isEqualMultiwayVideoStreamSet:](self, "isEqualMultiwayVideoStreamSet:", objc_msgSend(a3, "multiwayVideoStreams"))&& -[VCMediaNegotiatorLocalConfiguration isEqualMediaRecorderImageTypes:](self, "isEqualMediaRecorderImageTypes:", a3)&& -[VCMediaNegotiatorLocalConfiguration isEqualMediaRecorderVideoCodecs:](self, "isEqualMediaRecorderVideoCodecs:", a3)&& -[VCMediaNegotiatorLocalConfiguration isEqualFaceTimeSettings:](self, "isEqualFaceTimeSettings:", a3))
  {
    return -[VCMediaNegotiatorLocalConfiguration isEqualStreamGroupConfigs:](self, "isEqualStreamGroupConfigs:", objc_msgSend(a3, "streamGroupConfigs"));
  }
  else
  {
    return 0;
  }
}

- (NSDictionary)u1StreamConfigurations
{
  return &self->_u1StreamConfigurations->super;
}

- (void)setU1StreamConfigurations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (BOOL)allowRTCPFB
{
  return self->_allowRTCPFB;
}

- (void)setAllowRTCPFB:(BOOL)a3
{
  self->_allowRTCPFB = a3;
}

- (BOOL)isCaller
{
  return self->_isCaller;
}

- (void)setIsCaller:(BOOL)a3
{
  self->_isCaller = a3;
}

- (NSString)basebandCodec
{
  return self->_basebandCodec;
}

- (void)setBasebandCodec:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)basebandCodecSampleRate
{
  return self->_basebandCodecSampleRate;
}

- (void)setBasebandCodecSampleRate:(unsigned int)a3
{
  self->_basebandCodecSampleRate = a3;
}

- (NSSet)bandwidthConfigurations
{
  return &self->_bandwidthConfigurations->super;
}

- (void)setBandwidthConfigurations:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSSet)captionsSenderLanguages
{
  return self->_captionsSenderLanguages;
}

- (void)setCaptionsSenderLanguages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSSet)captionsReceiverLanguages
{
  return self->_captionsReceiverLanguages;
}

- (void)setCaptionsReceiverLanguages:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void)callLogFile
{
  return self->_callLogFile;
}

- (void)setCallLogFile:(void *)a3
{
  self->_callLogFile = a3;
}

- (tagNTP)creationTime
{
  return (tagNTP)self->_creationTime.wide;
}

- (void)setCreationTime:(tagNTP)a3
{
  self->_creationTime = a3;
}

- (unsigned)mediaControlInfoVersion
{
  return self->_mediaControlInfoVersion;
}

- (void)setMediaControlInfoVersion:(unsigned __int8)a3
{
  self->_mediaControlInfoVersion = a3;
}

- (NSMutableOrderedSet)multiwayAudioStreams
{
  return self->_multiwayAudioStreams;
}

- (void)setMultiwayAudioStreams:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSMutableOrderedSet)multiwayVideoStreams
{
  return self->_multiwayVideoStreams;
}

- (void)setMultiwayVideoStreams:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSSet)mediaRecorderImageTypes
{
  return self->_mediaRecorderImageTypes;
}

- (void)setMediaRecorderImageTypes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSSet)mediaRecorderVideoCodecs
{
  return self->_mediaRecorderVideoCodecs;
}

- (void)setMediaRecorderVideoCodecs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (BOOL)SIPDisabled
{
  return self->_SIPDisabled;
}

- (void)setSIPDisabled:(BOOL)a3
{
  self->_SIPDisabled = a3;
}

- (BOOL)secureMessagingRequired
{
  return self->_secureMessagingRequired;
}

- (void)setSecureMessagingRequired:(BOOL)a3
{
  self->_secureMessagingRequired = a3;
}

- (unsigned)faceTimeSwitches
{
  return self->_faceTimeSwitches;
}

- (void)setFaceTimeSwitches:(unsigned int)a3
{
  self->_faceTimeSwitches = a3;
}

- (unsigned)customVideoWidth
{
  return self->_customVideoWidth;
}

- (void)setCustomVideoWidth:(unsigned int)a3
{
  self->_customVideoWidth = a3;
}

- (unsigned)customVideoHeight
{
  return self->_customVideoHeight;
}

- (void)setCustomVideoHeight:(unsigned int)a3
{
  self->_customVideoHeight = a3;
}

- (unsigned)tilesPerVideoFrame
{
  return self->_tilesPerVideoFrame;
}

- (void)setTilesPerVideoFrame:(unsigned int)a3
{
  self->_tilesPerVideoFrame = a3;
}

- (BOOL)oneToOneModeSupported
{
  return self->_oneToOneModeSupported;
}

- (void)setOneToOneModeSupported:(BOOL)a3
{
  self->_oneToOneModeSupported = a3;
}

- (BOOL)ltrpEnabled
{
  return self->_ltrpEnabled;
}

- (void)setLtrpEnabled:(BOOL)a3
{
  self->_ltrpEnabled = a3;
}

- (NSSet)pixelFormats
{
  return self->_pixelFormats;
}

- (void)setPixelFormats:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (NSSet)hdrModesSupported
{
  return self->_hdrModesSupported;
}

- (void)setHdrModesSupported:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (unsigned)mediaControlInfoFECFeedbackVersion
{
  return self->_mediaControlInfoFECFeedbackVersion;
}

- (void)setMediaControlInfoFECFeedbackVersion:(unsigned __int8)a3
{
  self->_mediaControlInfoFECFeedbackVersion = a3;
}

- (unsigned)linkProbingCapabilityVersion
{
  return self->_linkProbingCapabilityVersion;
}

- (void)setLinkProbingCapabilityVersion:(unsigned __int8)a3
{
  self->_linkProbingCapabilityVersion = a3;
}

- (NSSet)streamGroupConfigs
{
  return &self->_streamGroupConfigs->super;
}

- (CGSize)screenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_screenSize.width;
  height = self->_screenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)aspectRatioLandscape
{
  double width;
  double height;
  CGSize result;

  width = self->_aspectRatioLandscape.width;
  height = self->_aspectRatioLandscape.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)aspectRatioPortrait
{
  double width;
  double height;
  CGSize result;

  width = self->_aspectRatioPortrait.width;
  height = self->_aspectRatioPortrait.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)orientationMismatchAspectRatioLandscape
{
  double width;
  double height;
  CGSize result;

  width = self->_orientationMismatchAspectRatioLandscape.width;
  height = self->_orientationMismatchAspectRatioLandscape.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)accessNetworkType
{
  return self->_accessNetworkType;
}

- (void)setAccessNetworkType:(int)a3
{
  self->_accessNetworkType = a3;
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

- (BOOL)isOneToOneAuthTagEnabled
{
  return self->_oneToOneAuthTagEnabled;
}

- (void)setOneToOneAuthTagEnabled:(BOOL)a3
{
  self->_oneToOneAuthTagEnabled = a3;
}

- (BOOL)blackFrameOnClearScreenEnabled
{
  return self->_blackFrameOnClearScreenEnabled;
}

- (void)setBlackFrameOnClearScreenEnabled:(BOOL)a3
{
  self->_blackFrameOnClearScreenEnabled = a3;
}

- (int)preferredAudioCodec
{
  return self->_preferredAudioCodec;
}

- (void)setPreferredAudioCodec:(int)a3
{
  self->_preferredAudioCodec = a3;
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->_deviceRole = a3;
}

- (BOOL)alwaysOnAudRedEnabled
{
  return self->_alwaysOnAudRedEnabled;
}

- (void)setAlwaysOnAudRedEnabled:(BOOL)a3
{
  self->_alwaysOnAudRedEnabled = a3;
}

- (BOOL)alwaysOnAudioRedundancyEnabled
{
  return self->_alwaysOnAudioRedundancyEnabled;
}

- (void)setAlwaysOnAudioRedundancyEnabled:(BOOL)a3
{
  self->_alwaysOnAudioRedundancyEnabled = a3;
}

- (BOOL)highFecEnabled
{
  return self->_highFecEnabled;
}

- (void)setHighFecEnabled:(BOOL)a3
{
  self->_highFecEnabled = a3;
}

- (BOOL)lowFpsVideoEnabled
{
  return self->_lowFpsVideoEnabled;
}

- (void)setLowFpsVideoEnabled:(BOOL)a3
{
  self->_lowFpsVideoEnabled = a3;
}

- (BOOL)vplrFecEnabled
{
  return self->_vplrFecEnabled;
}

- (void)setVplrFecEnabled:(BOOL)a3
{
  self->_vplrFecEnabled = a3;
}

- (BOOL)rampDownBWDropEnabled
{
  return self->_rampDownBWDropEnabled;
}

- (void)setRampDownBWDropEnabled:(BOOL)a3
{
  self->_rampDownBWDropEnabled = a3;
}

- (BOOL)fastMediaDuplicationEnabled
{
  return self->_fastMediaDuplicationEnabled;
}

- (void)setFastMediaDuplicationEnabled:(BOOL)a3
{
  self->_fastMediaDuplicationEnabled = a3;
}

- (BOOL)iRATRtpEnabled
{
  return self->_iRATRtpEnabled;
}

- (void)setIRATRtpEnabled:(BOOL)a3
{
  self->_iRATRtpEnabled = a3;
}

- (BOOL)preWarmCellEnabled
{
  return self->_preWarmCellEnabled;
}

- (void)setPreWarmCellEnabled:(BOOL)a3
{
  self->_preWarmCellEnabled = a3;
}

- (BOOL)duplicateImportantPktsEnabled
{
  return self->_duplicateImportantPktsEnabled;
}

- (void)setDuplicateImportantPktsEnabled:(BOOL)a3
{
  self->_duplicateImportantPktsEnabled = a3;
}

- (BOOL)blackFrameOnClearScreenEnabledDefault
{
  return self->_blackFrameOnClearScreenEnabledDefault;
}

- (void)setBlackFrameOnClearScreenEnabledDefault:(BOOL)a3
{
  self->_blackFrameOnClearScreenEnabledDefault = a3;
}

- (void)init
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the u1StreamConfigurations dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupBandwidthConfigurationsWithArbiter:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate bandwidth extension configuration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupBandwidthConfigurationsWithArbiter:.cold.2()
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
  v5 = "-[VCMediaNegotiatorLocalConfiguration setupBandwidthConfigurationsWithArbiter:]";
  v6 = 1024;
  v7 = 193;
  v8 = 1024;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate default bandwidth configuration for connectionType:%d", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)setupBandwidthExtensionConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_7_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate bandwidth configuration for mode:%d connectionType:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupBandwidthExtensionConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_7_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate bandwidth configuration for mode:%d connectionType:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupBandwidthExtensionConfiguration:.cold.3()
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
  OUTLINED_FUNCTION_7_2(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate bandwidth configuration for mode:%d connectionType:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
