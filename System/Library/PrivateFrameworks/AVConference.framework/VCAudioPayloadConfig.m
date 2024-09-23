@implementation VCAudioPayloadConfig

- (BOOL)configure:(id)a3
{
  void *v5;
  unsigned int *p_payload;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  unsigned int v13;
  unsigned int codecSampleRate;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  unint64_t v19;
  unint64_t v20;
  unsigned int v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  int payload;
  _BOOL4 isOpusInBandFecEnabled;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  int v41;
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  _BYTE v48[10];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPayloadConfigKeyPayloadType"));
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v11)
        return v11;
      -[VCAudioPayloadConfig configure:].cold.1(v9, v10);
    }
    goto LABEL_54;
  }
  self->_payload = objc_msgSend(v5, "intValue");
  p_payload = (unsigned int *)&self->_payload;
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeySampleRate"));
  if (v7)
    v8 = objc_msgSend(v7, "intValue");
  else
    v8 = +[VCPayloadUtils sampleRateForPayload:](VCPayloadUtils, "sampleRateForPayload:", *p_payload);
  self->_codecSampleRate = v8;
  if (!v8 && *p_payload != 117)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_54;
    VRTraceErrorLogLevelToCSTR();
    v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (v11)
    {
      -[VCAudioPayloadConfig configure:].cold.4();
      goto LABEL_54;
    }
    return v11;
  }
  v12 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPayloadConfigKeyInputSampleRate"));
  if (v12)
  {
    v13 = objc_msgSend(v12, "intValue");
    self->_inputSampleRate = v13;
    if (v13)
      goto LABEL_15;
  }
  else if (self->_inputSampleRate)
  {
    goto LABEL_15;
  }
  codecSampleRate = self->_codecSampleRate;
  if (codecSampleRate >= 0x5DC0)
    codecSampleRate = 24000;
  self->_inputSampleRate = codecSampleRate;
LABEL_15:
  v15 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyInternalBundleFactor"));
  if (v15)
    v16 = objc_msgSend(v15, "intValue");
  else
    v16 = +[VCPayloadUtils internalBundleFactorForPayload:](VCPayloadUtils, "internalBundleFactorForPayload:", *p_payload);
  self->_internalBundleFactor = v16;
  if (v16 - 4 <= 0xFFFFFFFC)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v11)
      {
        -[VCAudioPayloadConfig configure:].cold.2();
        goto LABEL_54;
      }
      return v11;
    }
LABEL_54:
    LOBYTE(v11) = 0;
    return v11;
  }
  v17 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPayloadConfigKeyBlockSize"));
  if (v17)
    v18 = objc_msgSend(v17, "intValue");
  else
    v18 = +[VCPayloadUtils codecSamplesPerFrameForPayload:blockSize:](VCPayloadUtils, "codecSamplesPerFrameForPayload:blockSize:", *p_payload, 0.0199999996);
  self->_blockSize = v18;
  if (v18)
  {
    v21 = self->_internalBundleFactor * v18;
    LODWORD(v20) = self->_codecSampleRate;
    LODWORD(v19) = self->_inputSampleRate;
    self->_codecSamplesPerFrame = v21;
    self->_inputSamplesPerFrame = vcvtpd_u64_f64((double)v19 / (double)v20 * (double)v21);
    v22 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyOctetAligned"));
    if (v22)
      v23 = objc_msgSend(v22, "BOOLValue");
    else
      v23 = 1;
    self->_payloadOctetAligned = v23;
    v24 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyDTXEnabled"));
    if (v24)
      LOBYTE(v24) = objc_msgSend(v24, "BOOLValue");
    self->_isDTXEnabled = (char)v24;
    v25 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyEVSSIDPeriod"));
    if (v25)
      v26 = objc_msgSend(v25, "intValue");
    else
      v26 = 8;
    self->_evsSIDPeriod = v26;
    v27 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyEVSChannelAwareOffset"));
    if (v27)
      LOWORD(v27) = objc_msgSend(v27, "intValue");
    self->_evsChannelAwareOffset = (unsigned __int16)v27;
    self->_evsChannelAwareIndicator = 1;
    v28 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyEVSHeaderFullOnly"));
    if (v28)
      LOBYTE(v28) = objc_msgSend(v28, "BOOLValue");
    self->_evsHeaderFullOnly = (char)v28;
    v29 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyEVSCMRMode"));
    if (v29)
      LODWORD(v29) = objc_msgSend(v29, "integerValue");
    self->_evsCMRMode = (int)v29;
    v30 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPayloadConfigKeyOPUSInBandFecEnabled"));
    if (v30)
    {
      v31 = objc_msgSend(v30, "BOOLValue");
      self->_isOpusInBandFecEnabled = v31;
      if (v31 && *p_payload != 119)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_54;
        v32 = VRTraceErrorLogLevelToCSTR();
        v33 = *MEMORY[0x1E0CF2758];
        v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (v11)
        {
          payload = self->_payload;
          isOpusInBandFecEnabled = self->_isOpusInBandFecEnabled;
          v41 = 136316162;
          v42 = v32;
          v43 = 2080;
          v44 = "-[VCAudioPayloadConfig configure:]";
          v45 = 1024;
          v46 = 167;
          v47 = 1024;
          *(_DWORD *)v48 = payload;
          *(_WORD *)&v48[4] = 1024;
          *(_DWORD *)&v48[6] = isOpusInBandFecEnabled;
          _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d payload:%d Invalid payload configuration, isOpusInBandFecEnabled:%d", (uint8_t *)&v41, 0x28u);
          goto LABEL_54;
        }
        return v11;
      }
    }
    else
    {
      self->_isOpusInBandFecEnabled = 0;
    }
    -[VCAudioPayloadConfig setupEncodeProperties:](self, "setupEncodeProperties:", a3);
    if (HIWORD(self->_format) << 16 == 0x100000)
    {
      v36 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyUseSBR"));
      if (v36)
        -[VCAudioPayloadConfig setUseSBR:](self, "setUseSBR:", objc_msgSend(v36, "BOOLValue"));
      else
        self->_useSBR = 0;
    }
    v37 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPayloadConfigKeyPayloadTypeOverride"));
    if (v37)
      *p_payload = objc_msgSend(v37, "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v41 = 136316162;
        v42 = v38;
        v43 = 2080;
        v44 = "-[VCAudioPayloadConfig configure:]";
        v45 = 1024;
        v46 = 189;
        v47 = 2080;
        *(_QWORD *)v48 = "-[VCAudioPayloadConfig configure:]";
        *(_WORD *)&v48[8] = 2080;
        v49 = objc_msgSend(-[VCAudioPayloadConfig description](self, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", (uint8_t *)&v41, 0x30u);
      }
    }
    LOBYTE(v11) = 1;
    return v11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    goto LABEL_54;
  VRTraceErrorLogLevelToCSTR();
  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v11)
  {
    -[VCAudioPayloadConfig configure:].cold.3();
    goto LABEL_54;
  }
  return v11;
}

- (void)setUseSBR:(BOOL)a3
{
  NSArray *v4;

  if (a3)
  {
    v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_supportedBitrates);
    -[NSArray addObject:](v4, "addObject:", &unk_1E9EF70B8);
    -[NSArray addObject:](v4, "addObject:", &unk_1E9EF70D0);

    self->_supportedBitrates = v4;
    self->_useSBR = 1;
  }
}

- (unsigned)aacBitrate
{
  unsigned int v3;
  const __CFNumber *v4;
  const __CFNumber *v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int valuePtr;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = 32000;
  valuePtr = 32000;
  v4 = (const __CFNumber *)CFPreferencesCopyAppValue(CFSTR("forceAACELDBitrate"), CFSTR("com.apple.VideoConference"));
  if (v4)
  {
    v5 = v4;
    if (CFNumberGetValue(v4, kCFNumberIntType, &valuePtr))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v11 = v6;
          v12 = 2080;
          v13 = "-[VCAudioPayloadConfig aacBitrate]";
          v14 = 1024;
          v15 = 212;
          v16 = 1024;
          v17 = valuePtr;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forceAACELDBitRate to %d", buf, 0x22u);
        }
      }
      self->_forcingBitrate = 1;
    }
    CFRelease(v5);
    return valuePtr;
  }
  return v3;
}

- (void)createSupportedBitrates
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_bitrate);
  self->_supportedBitrates = (NSArray *)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (void)createSupportedBitratesForAACELD
{
  self->_supportedBitrates = (NSArray *)&unk_1E9EFAFA0;
}

- (void)createSupportedBitratesForAACELD48
{
  self->_supportedBitrates = (NSArray *)&unk_1E9EFAFB8;
}

- (void)createSupportedBitratesForOpus
{
  self->_supportedBitrates = (NSArray *)&unk_1E9EFAFD0;
}

- (void)createSupportedBitratesForAMR8k
{
  self->_supportedBitrates = (NSArray *)&unk_1E9EFAFE8;
}

- (void)createSupportedBitratesForAMR16k
{
  self->_supportedBitrates = (NSArray *)&unk_1E9EFB000;
}

- (void)createSupportedBitratesForEVS
{
  self->_supportedBitrates = (NSArray *)&unk_1E9EFB018;
}

- (void)setupEncodeProperties:(id)a3
{
  int payload;
  int v5;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;
  unsigned __int16 v13;
  unsigned int v14;
  int v15;
  unsigned int codecSampleRate;
  int v17;
  int v18;
  NSArray *v19;
  NSArray *v20;

  payload = self->_payload;
  if (payload <= 12)
  {
    if (payload)
    {
      if (payload != 8)
      {
        if (payload != 9)
          return;
        self->_format = 999040;
        v9 = 480 * (self->_codecSampleRate / self->_codecSamplesPerFrame);
LABEL_40:
        self->_bitrate = v9;
        -[VCAudioPayloadConfig createSupportedBitrates](self, "createSupportedBitrates", a3);
        return;
      }
      v10 = 335680;
    }
    else
    {
      v10 = 270144;
    }
    self->_format = v10;
    v9 = 8 * self->_codecSampleRate;
    goto LABEL_40;
  }
  v5 = payload - 97;
  v7 = 5274880;
  switch(v5)
  {
    case 0:
      self->_format = 4202304;
      if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyPreferredBitrate")))
        v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyPreferredBitrate")), "unsignedIntValue");
      else
        v8 = 12200;
      self->_bitrate = v8;
      v19 = (NSArray *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyCodecBitrates"));
      self->_supportedBitrates = v19;
      if (!v19)
        -[VCAudioPayloadConfig createSupportedBitratesForAMR8k](self, "createSupportedBitratesForAMR8k");
      return;
    case 1:
      self->_format = 4210304;
      if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyPreferredBitrate")))
        v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyPreferredBitrate")), "unsignedIntValue");
      else
        v11 = 12650;
      self->_bitrate = v11;
      v20 = (NSArray *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyCodecBitrates"));
      self->_supportedBitrates = v20;
      if (!v20)
        -[VCAudioPayloadConfig createSupportedBitratesForAMR16k](self, "createSupportedBitratesForAMR16k");
      return;
    case 2:
      self->_format = 16785216;
      return;
    case 4:
      self->_format = 1096576;
      self->_bundleHeaderBytes = 1;
      self->_bitrate = -[VCAudioPayloadConfig aacBitrate](self, "aacBitrate");
      -[VCAudioPayloadConfig createSupportedBitratesForAACELD48](self, "createSupportedBitratesForAACELD48");
      return;
    case 7:
      v12 = 1072576;
      goto LABEL_19;
    case 8:
      v12 = 1070626;
      goto LABEL_19;
    case 9:
      v12 = 1064576;
LABEL_19:
      self->_format = v12;
      self->_bundleHeaderBytes = 1;
      self->_bitrate = -[VCAudioPayloadConfig aacBitrate](self, "aacBitrate");
      -[VCAudioPayloadConfig createSupportedBitratesForAACELD](self, "createSupportedBitratesForAACELD");
      return;
    case 10:
      v13 = 16000;
      goto LABEL_22;
    case 11:
      goto LABEL_23;
    case 14:
      v13 = 8000;
LABEL_22:
      v7 = v13 | 0x500000;
LABEL_23:
      self->_format = v7;
      self->_bundleHeaderBytes = 1;
      if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyPreferredBitrate")))
        v14 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyPreferredBitrate")), "unsignedIntValue");
      else
        v14 = 13200;
      self->_bitrate = v14;
      self->_supportedBitrates = (NSArray *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcPayloadConfigKeyCodecBitrates"));
      self->_supportedBandwidths = (NSArray *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcAudioPayloadConfigKeySupportedBandwidths"));
      if (!self->_supportedBitrates)
        -[VCAudioPayloadConfig createSupportedBitratesForEVS](self, "createSupportedBitratesForEVS");
      return;
    case 15:
      v15 = 1138112;
      goto LABEL_30;
    case 16:
      v15 = 1203648;
LABEL_30:
      self->_format = v15;
      self->_bundleHeaderBytes = 1;
      break;
    case 22:
      codecSampleRate = self->_codecSampleRate;
      if (codecSampleRate == 48000)
        v17 = 2145152;
      else
        v17 = 2121152;
      if (codecSampleRate == 16000)
        v18 = 2113152;
      else
        v18 = v17;
      self->_format = v18;
      self->_bundleHeaderBytes = 1;
      self->_bitrate = 24000;
      -[VCAudioPayloadConfig createSupportedBitratesForOpus](self, "createSupportedBitratesForOpus");
      break;
    case 24:
      self->_format = 671360;
      v9 = 7750;
      goto LABEL_40;
    case 25:
      self->_format = 663360;
      v9 = 3950;
      goto LABEL_40;
    default:
      return;
  }
}

- (VCAudioPayloadConfig)initWithConfigDict:(id)a3
{
  VCAudioPayloadConfig *v4;
  VCAudioPayloadConfig *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioPayloadConfig;
  v4 = -[VCAudioPayloadConfig init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    if (-[VCAudioPayloadConfig configure:](v4, "configure:", a3))
    {
      -[VCAudioPayloadConfig updateDescription](v5, "updateDescription");
    }
    else
    {

      return 0;
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
  v3.super_class = (Class)VCAudioPayloadConfig;
  -[VCAudioPayloadConfig dealloc](&v3, sel_dealloc);
}

- (float)qualityForBitRate:(unsigned int)a3
{
  uint64_t v3;
  float result;

  v3 = *(_QWORD *)&a3;
  if (+[VCPayloadUtils canSetBitrateForPayload:](VCPayloadUtils, "canSetBitrateForPayload:", self->_payload))
  {
    if (!-[NSArray containsObject:](self->_supportedBitrates, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)))return 0.0;
  }
  else if (self->_bitrate != (_DWORD)v3)
  {
    return 0.0;
  }
  +[VCPayloadUtils qualityForPayload:forBitrate:](VCPayloadUtils, "qualityForPayload:forBitrate:", self->_payload, v3);
  return result;
}

- (unsigned)flags
{
  int v2;

  v2 = HIWORD(self->_format) << 16;
  if (v2 >= 1179648)
  {
    if (v2 >= 0x400000)
    {
      if (v2 != 5242880 && v2 != 0x400000)
        return 0;
    }
    else if (v2 != 1179648 && v2 != 0x200000)
    {
      return 0;
    }
    return self->_internalBundleFactor;
  }
  if (v2 == 655360)
    return 3;
  if (v2 != 0x100000)
  {
    if (v2 != 1114112)
      return 0;
    return self->_internalBundleFactor;
  }
  return self->_useSBR;
}

- (void)updateDescription
{

  self->_description = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ payload=%d blockSize=%d codecSampleRate=%d codecSamplesPerFrame=%d inputSampleRate=%d inputSamplesPerFrame=%d isDTXEnabled=%d octedAligned=%d useSBR=%d, internalBundleFactor=%d initialBitrate=%d"), -[VCAudioPayloadConfig className](self, "className"), self->_payload, self->_blockSize, self->_codecSampleRate, self->_codecSamplesPerFrame, self->_inputSampleRate, self->_inputSamplesPerFrame, self->_isDTXEnabled, self->_payloadOctetAligned, self->_useSBR, self->_internalBundleFactor, self->_bitrate);
}

- (id)className
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)description
{
  return self->_description;
}

- (int)payload
{
  return self->_payload;
}

- (unsigned)blockSize
{
  return self->_blockSize;
}

- (unsigned)codecSampleRate
{
  return self->_codecSampleRate;
}

- (unsigned)inputSampleRate
{
  return self->_inputSampleRate;
}

- (unsigned)samplesPerFrame
{
  return self->_inputSamplesPerFrame;
}

- (unsigned)bundleHeaderBytes
{
  return self->_bundleHeaderBytes;
}

- (NSArray)supportedBitrates
{
  return self->_supportedBitrates;
}

- (unsigned)bitrate
{
  return self->_bitrate;
}

- (NSArray)supportedBandwidths
{
  return self->_supportedBandwidths;
}

- (int)format
{
  return self->_format;
}

- (unsigned)internalBundleFactor
{
  return self->_internalBundleFactor;
}

- (BOOL)payloadOctetAligned
{
  return self->_payloadOctetAligned;
}

- (BOOL)forcingBitrate
{
  return self->_forcingBitrate;
}

- (BOOL)isDTXEnabled
{
  return self->_isDTXEnabled;
}

- (unsigned)evsSIDPeriod
{
  return self->_evsSIDPeriod;
}

- (unsigned)evsChannelAwareOffset
{
  return self->_evsChannelAwareOffset;
}

- (BOOL)evsHeaderFullOnly
{
  return self->_evsHeaderFullOnly;
}

- (BOOL)isOpusInBandFecEnabled
{
  return self->_isOpusInBandFecEnabled;
}

- (unsigned)evsChannelAwareIndicator
{
  return self->_evsChannelAwareIndicator;
}

- (int)evsCMRMode
{
  return self->_evsCMRMode;
}

- (void)setEvsCMRMode:(int)a3
{
  self->_evsCMRMode = a3;
}

- (void)configure:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
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
  v5 = "-[VCAudioPayloadConfig configure:]";
  v6 = 1024;
  v7 = 61;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Missing payloadType", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)configure:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d payload:%d Invalid internal bundle factor", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)configure:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d payload:%d Invalid block size", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)configure:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d payload:%d Invalid Codec SampleRate", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
