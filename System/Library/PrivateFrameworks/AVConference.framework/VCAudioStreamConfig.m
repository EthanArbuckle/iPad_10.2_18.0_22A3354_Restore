@implementation VCAudioStreamConfig

- (NSDictionary)allCodecConfigurations
{
  void *v3;
  VCMediaStreamMultiwayConfig *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", -[VCAudioStreamConfig codecConfigurations](self, "codecConfigurations"));
  v4 = -[VCMediaStreamConfig multiwayConfig](self, "multiwayConfig");
  if (v4)
    objc_msgSend(v3, "addEntriesFromDictionary:", -[VCMediaStreamMultiwayConfig v2CodecConfigurations](v4, "v2CodecConfigurations"));
  return (NSDictionary *)v3;
}

- (VCAudioStreamConfig)init
{
  VCAudioStreamConfig *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCAudioStreamConfig;
  v2 = -[VCMediaStreamConfig init](&v4, sel_init);
  if (v2)
  {
    v2->_codecConfigurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_supportedNumRedundantPayload = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
  }
  return v2;
}

- (VCAudioStreamConfig)initWithClientDictionary:(id)a3
{
  const char *v5;
  char *v6;
  os_log_t *v7;
  uint64_t v8;
  NSObject *v9;
  VCAudioStreamConfig *v10;
  BOOL v11;
  unsigned int v12;
  objc_super v14;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v5 = objc_opt_class()
       ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
       : "<nil>";
    asprintf(&__str, "%s[%p] %s", v5, self, (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
    if (__str)
    {
      __lasts = 0;
      v6 = strtok_r(__str, "\n", &__lasts);
      v7 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v18 = v8;
            v19 = 2080;
            v20 = "-[VCAudioStreamConfig initWithClientDictionary:]";
            v21 = 1024;
            v22 = 71;
            v23 = 2080;
            v24 = "-[VCAudioStreamConfig initWithClientDictionary:]";
            v25 = 2080;
            v26 = v6;
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v6 = strtok_r(0, "\n", &__lasts);
      }
      while (v6);
      free(__str);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)VCAudioStreamConfig;
  v10 = -[VCMediaStreamConfig initWithClientDictionary:](&v14, sel_initWithClientDictionary_, a3);
  if (v10)
  {
    v10->_codecConfigurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10->_audioStreamMode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamAudioStreamMode")), "integerValue");
    v10->_supportedNumRedundantPayload = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v10->_enableMaxBitrateOnNoChangeCMR = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamEnableMaxBitrateOnNoChangeCMR")), "BOOLValue");
    v10->_dtmfTonePlaybackEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamdtmfTonePlaybackEnabled")), "BOOLValue");
    v10->_dtmfEventCallbacksEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDTMFEventCallbacksEnabled")), "BOOLValue");
    v10->_dtmfSampleRate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDTMFTsRate")), "integerValue");
    v10->_subscriptionSlot = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTelephonyServiceSubscriptionSlot")), "integerValue");
    v10->_anbrEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamAnbrEnabled")), "BOOLValue");
    if (!-[VCAudioStreamConfig setupCodecWithClientDictionary:](v10, "setupCodecWithClientDictionary:", a3)
      || !-[VCAudioStreamConfig setupCNCodecWithClientDictionary:](v10, "setupCNCodecWithClientDictionary:", a3))
    {
      goto LABEL_19;
    }
    v11 = -[VCAudioStreamConfig setupDTMFCodecWithClientDictionary:](v10, "setupDTMFCodecWithClientDictionary:", a3);
    v10->_bundlingScheme = +[VCAudioStreamConfig bundlingSchemeForAudioStreamMode:payloadType:](VCAudioStreamConfig, "bundlingSchemeForAudioStreamMode:payloadType:", v10->_audioStreamMode, +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", -[VCMediaStreamConfig primaryTxCodecType](v10, "primaryTxCodecType")));
    v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamChannelCount")), "integerValue")? objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamChannelCount")), "integerValue"): 1;
    v10->_channelCount = v12;
    v10->_preferredMediaBitRate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamPreferredMediaBitRate")), "integerValue");
    v10->_remoteDeviceInfo = objc_alloc_init(VCMediaStreamConfigRemoteDeviceInfo);
    -[VCMediaStreamConfigRemoteDeviceInfo setDeviceName:](v10->_remoteDeviceInfo, "setDeviceName:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRemoteDeviceInfoDeviceName")));
    -[VCMediaStreamConfigRemoteDeviceInfo setDeviceUID:](v10->_remoteDeviceInfo, "setDeviceUID:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRemoteDeviceInfoDeviceUID")));
    -[VCMediaStreamConfigRemoteDeviceInfo setModelUID:](v10->_remoteDeviceInfo, "setModelUID:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRemoteDeviceInfoModelUID")));
    if (!v11)
    {
LABEL_19:

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCAudioStreamConfig;
  -[VCMediaStreamConfig dealloc](&v3, sel_dealloc);
}

+ (int)bundlingSchemeForAudioStreamMode:(int64_t)a3 payloadType:(int)a4
{
  int result;

  result = 3;
  switch(a3)
  {
    case 4:
    case 8:
      if (+[VCPayloadUtils canBundleExternallyForPayload:forBundlingScheme:operatingMode:](VCPayloadUtils, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", *(_QWORD *)&a4, 2, +[VCAudioStream operatingModeForAudioStreamMode:](VCAudioStream, "operatingModeForAudioStreamMode:")))
      {
        result = 2;
      }
      else
      {
        result = 0;
      }
      break;
    case 5:
      result = +[VCPayloadUtils canBundleExternallyForPayload:forBundlingScheme:operatingMode:](VCPayloadUtils, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", *(_QWORD *)&a4, 1, +[VCAudioStream operatingModeForAudioStreamMode:](VCAudioStream, "operatingModeForAudioStreamMode:", 5));
      break;
    case 7:
    case 10:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)setupCodecWithClientDictionary:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  VCAudioStreamCodecConfig *v7;
  uint64_t v8;
  unsigned __int8 v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCAudioStreamConfig *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCodecType")), "integerValue");
  v6 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", v5);
  v7 = -[VCAudioStreamCodecConfig initWithCodecType:]([VCAudioStreamCodecConfig alloc], "initWithCodecType:", v5);
  if (v7)
  {
    v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRxPayloadType")), "integerValue");
    -[VCAudioStreamCodecConfig setNetworkPayload:](v7, "setNetworkPayload:", v8);
    -[VCAudioStreamCodecConfig setEvsChannelAwareOffset:](v7, "setEvsChannelAwareOffset:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamEVSChannelAwareOffset")), "integerValue"));
    -[VCAudioStreamCodecConfig setEvsHeaderFullOnly:](v7, "setEvsHeaderFullOnly:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamEVSHeaderFullOnly")), "BOOLValue"));
    -[VCAudioStreamCodecConfig setEvsCMRMode:](v7, "setEvsCMRMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamEVSCMRMode")), "integerValue"));
    -[VCAudioStreamCodecConfig setOctetAligned:](v7, "setOctetAligned:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamAMRIsOctetAligned")), "BOOLValue"));
    -[VCAudioStreamCodecConfig setDtxEnabled:](v7, "setDtxEnabled:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamAMRDTXEnabled")), "BOOLValue"));
    -[VCAudioStreamCodecConfig setPTime:](v7, "setPTime:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamPtime")), "integerValue"));
    -[VCAudioStreamCodecConfig setPreferredModeWithClientMode:](v7, "setPreferredModeWithClientMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCodecRateModePreferred")), "integerValue"));
    -[VCAudioStreamCodecConfig setupModesWithClientModeMask:](v7, "setupModesWithClientModeMask:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCodecRateModeMask")), "integerValue"));
    -[VCAudioStreamCodecConfig setupCodecBandwidthsWithClientBandwidthMask:](v7, "setupCodecBandwidthsWithClientBandwidthMask:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCodecBandwidthMask")), "integerValue"));
    -[VCAudioStreamConfig addCodecConfiguration:](self, "addCodecConfiguration:", v7);
    -[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", v6, v8);
    -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", v6, objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTxPayloadType")), "integerValue"));

    v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamNumRedundantPayloads")), "integerValue");
    self->_numRedundantPayloads = v9;
    if (v9)
    {
      self->_redEnabled = 1;
      -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", 20, objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTxRedPayloadType")), "integerValue"));
    }
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRxRedPayloadType")), "integerValue"))-[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", 20);
  }
  else if ((VCAudioStreamConfig *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamConfig setupCodecWithClientDictionary:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCAudioStreamConfig performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCAudioStreamConfig setupCodecWithClientDictionary:]";
        v18 = 1024;
        v19 = 138;
        v20 = 2112;
        v21 = v10;
        v22 = 2048;
        v23 = self;
        v24 = 1024;
        v25 = v5;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate config for type: %d", (uint8_t *)&v14, 0x36u);
      }
    }
  }
  return v7 != 0;
}

- (void)setupRedWithRxPayload:(unsigned int)a3 txPayload:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  self->_redEnabled = 1;
  -[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", 20, *(_QWORD *)&a3);
  -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", 20, v4);
}

- (BOOL)setupCNCodecWithClientDictionary:(id)a3
{
  VCAudioStreamCodecConfig *v5;
  VCAudioStreamCodecConfig *v6;
  uint64_t v7;
  _BOOL4 v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCAudioStreamConfig *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCNEnabled")), "BOOLValue"))goto LABEL_4;
  v5 = -[VCAudioStreamCodecConfig initWithCodecType:]([VCAudioStreamCodecConfig alloc], "initWithCodecType:", 9);
  if (v5)
  {
    v6 = v5;
    -[VCAudioStreamConfig addCodecConfiguration:](self, "addCodecConfiguration:", v5);
    v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCNPayloadType")), "unsignedIntValue");
    -[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", 13, v7);
    -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", 13, v7);

LABEL_4:
    LOBYTE(v8) = 1;
    return v8;
  }
  if ((VCAudioStreamConfig *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      -[VCAudioStreamConfig setupCNCodecWithClientDictionary:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCAudioStreamConfig performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v8)
        return v8;
      v13 = 136316418;
      v14 = v10;
      v15 = 2080;
      v16 = "-[VCAudioStreamConfig setupCNCodecWithClientDictionary:]";
      v17 = 1024;
      v18 = 188;
      v19 = 2112;
      v20 = v9;
      v21 = 2048;
      v22 = self;
      v23 = 1024;
      v24 = 9;
      _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate config for type: %d", (uint8_t *)&v13, 0x36u);
    }
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (BOOL)setupDTMFCodecWithClientDictionary:(id)a3
{
  VCAudioStreamCodecConfig *v5;
  VCAudioStreamCodecConfig *v6;
  uint64_t v7;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCAudioStreamConfig *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = -[VCAudioStreamCodecConfig initWithCodecType:]([VCAudioStreamCodecConfig alloc], "initWithCodecType:", 10);
  v6 = v5;
  if (v5)
  {
    -[VCAudioStreamCodecConfig setDtmf:](v5, "setDtmf:", 1);
    -[VCAudioStreamConfig addCodecConfiguration:](self, "addCodecConfiguration:", v6);
    v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDTMFPayloadType")), "unsignedIntValue");
    -[VCAudioStreamCodecConfig setNetworkPayload:](v6, "setNetworkPayload:", v7);
    -[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", 117, v7);
    -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", 117, v7);

  }
  else if ((VCAudioStreamConfig *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamConfig setupDTMFCodecWithClientDictionary:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCAudioStreamConfig performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v12 = 136316418;
        v13 = v10;
        v14 = 2080;
        v15 = "-[VCAudioStreamConfig setupDTMFCodecWithClientDictionary:]";
        v16 = 1024;
        v17 = 203;
        v18 = 2112;
        v19 = v9;
        v20 = 2048;
        v21 = self;
        v22 = 1024;
        v23 = 10;
        _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate config for type: %d", (uint8_t *)&v12, 0x36u);
      }
    }
  }
  return v6 != 0;
}

- (void)setExternalIOFormat:(const tagVCAudioFrameFormat *)a3
{
  __int128 v3;
  __int128 v4;

  if (a3)
  {
    v4 = *(_OWORD *)&a3->format.mBytesPerPacket;
    v3 = *(_OWORD *)&a3->format.mBitsPerChannel;
    *(_OWORD *)&self->_externalIOFormat.format.mSampleRate = *(_OWORD *)&a3->format.mSampleRate;
    *(_OWORD *)&self->_externalIOFormat.format.mBytesPerPacket = v4;
    *(_OWORD *)&self->_externalIOFormat.format.mBitsPerChannel = v3;
    self->_useExternalIO = 1;
  }
}

- (const)externalIOFormat
{
  return &self->_externalIOFormat;
}

- (void)addCodecConfiguration:(id)a3
{
  uint64_t v5;

  if (a3)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_codecConfigurations, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "codecType")));
    v5 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend(a3, "codecType"));
    -[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", v5, objc_msgSend(a3, "networkPayload"));
    -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", v5, objc_msgSend(a3, "networkPayload"));
  }
}

- (void)addSupportedNumRedundantPayload:(unsigned int)a3
{
  -[NSMutableOrderedSet addObject:](self->_supportedNumRedundantPayload, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
}

- (NSArray)supportedNumRedundantPayload
{
  NSArray *v2;

  v2 = (NSArray *)-[NSMutableOrderedSet array](self->_supportedNumRedundantPayload, "array");
  if (-[NSArray count](v2, "count"))
    return v2;
  else
    return (NSArray *)&unk_1E9EFAF28;
}

- (int64_t)audioStreamMode
{
  return self->_audioStreamMode;
}

- (void)setAudioStreamMode:(int64_t)a3
{
  self->_audioStreamMode = a3;
}

- (NSDictionary)codecConfigurations
{
  return &self->_codecConfigurations->super;
}

- (BOOL)isRedEnabled
{
  return self->_redEnabled;
}

- (unsigned)numRedundantPayloads
{
  return self->_numRedundantPayloads;
}

- (void)setNumRedundantPayloads:(unsigned __int8)a3
{
  self->_numRedundantPayloads = a3;
}

- (BOOL)enableMaxBitrateOnNoChangeCMR
{
  return self->_enableMaxBitrateOnNoChangeCMR;
}

- (void)setEnableMaxBitrateOnNoChangeCMR:(BOOL)a3
{
  self->_enableMaxBitrateOnNoChangeCMR = a3;
}

- (BOOL)forceEVSWideBand
{
  return self->_forceEVSWideBand;
}

- (void)setForceEVSWideBand:(BOOL)a3
{
  self->_forceEVSWideBand = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (BOOL)shouldApplyRedAsBoolean
{
  return self->_shouldApplyRedAsBoolean;
}

- (void)setShouldApplyRedAsBoolean:(BOOL)a3
{
  self->_shouldApplyRedAsBoolean = a3;
}

- (BOOL)supportsAdaptation
{
  return self->_supportsAdaptation;
}

- (void)setSupportsAdaptation:(BOOL)a3
{
  self->_supportsAdaptation = a3;
}

- (int)bundlingScheme
{
  return self->_bundlingScheme;
}

- (void)setBundlingScheme:(int)a3
{
  self->_bundlingScheme = a3;
}

- (int)oneToOneOperatingMode
{
  return self->_oneToOneOperatingMode;
}

- (void)setOneToOneOperatingMode:(int)a3
{
  self->_oneToOneOperatingMode = a3;
}

- (unsigned)channelCount
{
  return self->_channelCount;
}

- (void)setChannelCount:(unsigned int)a3
{
  self->_channelCount = a3;
}

- (BOOL)dtmfTonePlaybackEnabled
{
  return self->_dtmfTonePlaybackEnabled;
}

- (void)setDtmfTonePlaybackEnabled:(BOOL)a3
{
  self->_dtmfTonePlaybackEnabled = a3;
}

- (unsigned)dtmfSampleRate
{
  return self->_dtmfSampleRate;
}

- (void)setDtmfSampleRate:(unsigned int)a3
{
  self->_dtmfSampleRate = a3;
}

- (BOOL)anbrEnabled
{
  return self->_anbrEnabled;
}

- (void)setAnbrEnabled:(BOOL)a3
{
  self->_anbrEnabled = a3;
}

- (int64_t)subscriptionSlot
{
  return self->_subscriptionSlot;
}

- (void)setSubscriptionSlot:(int64_t)a3
{
  self->_subscriptionSlot = a3;
}

- (BOOL)isLowLatency
{
  return self->_isLowLatency;
}

- (void)setIsLowLatency:(BOOL)a3
{
  self->_isLowLatency = a3;
}

- (BOOL)useExternalIO
{
  return self->_useExternalIO;
}

- (unsigned)preferredMediaBitRate
{
  return self->_preferredMediaBitRate;
}

- (void)setPreferredMediaBitRate:(unsigned int)a3
{
  self->_preferredMediaBitRate = a3;
}

- (BOOL)dtmfEventCallbacksEnabled
{
  return self->_dtmfEventCallbacksEnabled;
}

- (void)setDtmfEventCallbacksEnabled:(BOOL)a3
{
  self->_dtmfEventCallbacksEnabled = a3;
}

- (BOOL)isHigherAudioREDCutoverU1Enabled
{
  return self->_isHigherAudioREDCutoverU1Enabled;
}

- (void)setIsHigherAudioREDCutoverU1Enabled:(BOOL)a3
{
  self->_isHigherAudioREDCutoverU1Enabled = a3;
}

- (BOOL)useWifiTiers
{
  return self->_useWifiTiers;
}

- (void)setUseWifiTiers:(BOOL)a3
{
  self->_useWifiTiers = a3;
}

- (VCMediaStreamConfigRemoteDeviceInfo)remoteDeviceInfo
{
  return self->_remoteDeviceInfo;
}

- (void)setupCodecWithClientDictionary:.cold.1()
{
  __int16 v0;
  int v1;
  NSObject *v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v4 = 138;
  v5 = v0;
  v6 = v1;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v2, (uint64_t)v2, " [%s] %s:%d Failed to allocate config for type: %d", v3);
  OUTLINED_FUNCTION_3();
}

- (void)setupCNCodecWithClientDictionary:.cold.1()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v4 = 188;
  v5 = v0;
  v6 = 9;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to allocate config for type: %d", v3);
  OUTLINED_FUNCTION_3();
}

- (void)setupDTMFCodecWithClientDictionary:.cold.1()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  v4 = 203;
  v5 = v0;
  v6 = 10;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d Failed to allocate config for type: %d", v3);
  OUTLINED_FUNCTION_3();
}

@end
