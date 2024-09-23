@implementation AVCAudioStreamConfig

- (AVCAudioStreamConfig)init
{
  AVCAudioStreamConfig *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  AVCAudioStreamConfig *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)AVCAudioStreamConfig;
  v2 = -[AVCAudioStreamConfig init](&v12, sel_init);
  if (v2)
  {
    if ((AVCAudioStreamConfig *)objc_opt_class() == v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136315650;
      v14 = v4;
      v15 = 2080;
      v16 = "-[AVCAudioStreamConfig init]";
      v17 = 1024;
      v18 = 515;
      v6 = " [%s] %s:%d ";
      v7 = v5;
      v8 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[AVCAudioStreamConfig performSelector:](v2, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136316162;
      v14 = v9;
      v15 = 2080;
      v16 = "-[AVCAudioStreamConfig init]";
      v17 = 1024;
      v18 = 515;
      v19 = 2112;
      v20 = v3;
      v21 = 2048;
      v22 = v2;
      v6 = " [%s] %s:%d %@(%p) ";
      v7 = v10;
      v8 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
LABEL_13:
    *(int64x2_t *)&v2->_ptime = vdupq_n_s64(0x14uLL);
    v2->_volume = 1.0;
    v2->_channelCount = 1;
    v2->_remoteDeviceInfo = objc_alloc_init(AVCMediaStreamConfigRemoteDeviceInfo);
  }
  return v2;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  AVCAudioStreamConfig *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((AVCAudioStreamConfig *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v4;
        v14 = 2080;
        v15 = "-[AVCAudioStreamConfig dealloc]";
        v16 = 1024;
        v17 = 526;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[AVCAudioStreamConfig performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v9;
        v14 = 2080;
        v15 = "-[AVCAudioStreamConfig dealloc]";
        v16 = 1024;
        v17 = 526;
        v18 = 2112;
        v19 = v3;
        v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)AVCAudioStreamConfig;
  -[AVCAudioStreamConfig dealloc](&v11, sel_dealloc);
}

- (BOOL)isValid
{
  return -[AVCAudioStreamConfig isDTMFValid](self, "isDTMFValid")
      && -[AVCAudioStreamConfig isCNValid](self, "isCNValid")
      && -[AVCAudioStreamConfig isRedValid](self, "isRedValid")
      && -[AVCAudioStreamConfig isChannelCountValid](self, "isChannelCountValid");
}

+ (int64_t)codecTypeWithClientCodecType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x11)
    return 0;
  else
    return qword_1D9110D48[a3];
}

+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 0x12)
    return 0;
  else
    return qword_1D9110DD8[a3 - 2];
}

+ (int64_t)streamModeWithClientStreamMode:(int64_t)a3
{
  if ((unint64_t)a3 < 0xB)
    return a3 + 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[AVCAudioStreamConfig streamModeWithClientStreamMode:].cold.1();
  }
  return 0;
}

+ (int64_t)clientStreamModeWithStreamMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) > 9)
    return 0;
  else
    return qword_1D9110E70[a3 - 2];
}

+ (int)clientCodecCMRModeModeWithEVSCMRMode:(int)a3
{
  int v3;

  if (a3 == -1)
    v3 = -1;
  else
    v3 = 0;
  if (a3 == 1)
    return 1;
  else
    return v3;
}

+ (int)evsCMRModeForClientCodecCMRMode:(int)a3
{
  int v3;

  if (a3 == -1)
    v3 = -1;
  else
    v3 = 0;
  if (a3 == 1)
    return 1;
  else
    return v3;
}

+ (unsigned)codecRateMaskForClientCodecRateMode:(unsigned int)a3
{
  return a3 & 0x3FFFFF;
}

+ (unsigned)clientCodecRateMaskForCodecRateMode:(unsigned int)a3
{
  return a3 & 0x3FFFFF;
}

+ (unsigned)codecBandwidthMaskForClientCodecBandwidth:(unsigned int)a3
{
  return a3 & 7;
}

+ (unsigned)clientCodecBandwidthMaskForCodecBandwidth:(unsigned int)a3
{
  return a3 & 7;
}

+ (int)codecRateModeForClientCodecRateMode:(int64_t)a3
{
  if ((unint64_t)a3 > 0x15)
    return -1;
  else
    return dword_1D9110EC0[a3];
}

+ (int64_t)clientCodecRateModeForCodecRateMode:(int)a3
{
  if ((a3 - 1) > 0x14)
    return 0;
  else
    return qword_1D9110F18[a3 - 1];
}

- (BOOL)isDTMFValid
{
  if (!-[AVCAudioStreamConfig dtmfPayloadType](self, "dtmfPayloadType"))
    return 1;
  if (-[AVCAudioStreamConfig dtmfPayloadType](self, "dtmfPayloadType") > 0x7F)
    return 0;
  return -[AVCAudioStreamConfig dtmfPayloadType](self, "dtmfPayloadType") > 0x5F;
}

- (BOOL)isCNValid
{
  return !-[AVCAudioStreamConfig isCNEnabled](self, "isCNEnabled")
      || -[AVCAudioStreamConfig cnPayloadType](self, "cnPayloadType") == 13;
}

- (BOOL)isRedValid
{
  if (!-[AVCAudioStreamConfig numRedundantPayloads](self, "numRedundantPayloads"))
    return 1;
  if (-[AVCAudioStreamConfig txRedPayloadType](self, "txRedPayloadType") > 0x7F
    || -[AVCAudioStreamConfig txRedPayloadType](self, "txRedPayloadType") < 0x60
    || -[AVCAudioStreamConfig rxRedPayloadType](self, "rxRedPayloadType") > 0x7F)
  {
    return 0;
  }
  return -[AVCAudioStreamConfig rxRedPayloadType](self, "rxRedPayloadType") > 0x5F;
}

- (BOOL)isChannelCountValid
{
  int64_t v3;
  unsigned int v4;
  BOOL v5;
  unint64_t channelCount;
  BOOL v8;

  v3 = -[AVCAudioStreamConfig audioStreamMode](self, "audioStreamMode");
  LOBYTE(v4) = v3 + 1;
  if ((unint64_t)(v3 + 1) <= 0xB)
  {
    if (((1 << v4) & 0x4FF) != 0)
    {
      v5 = self->_channelCount == 1;
      goto LABEL_4;
    }
    if (((1 << v4) & 0xA00) != 0)
    {
      v5 = self->_channelCount == 2;
LABEL_4:
      LOBYTE(v4) = v5;
      return v4 & 1;
    }
    channelCount = self->_channelCount;
    v8 = channelCount > 4;
    v4 = (0x16u >> channelCount) & 1;
    if (v8)
      LOBYTE(v4) = 0;
  }
  return v4 & 1;
}

- (void)setUpWithDictionary:(id)a3
{
  unint64_t v5;

  self->_audioStreamMode = +[AVCAudioStreamConfig clientStreamModeWithStreamMode:](AVCAudioStreamConfig, "clientStreamModeWithStreamMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamAudioStreamMode")), "integerValue"));
  self->_codecType = +[AVCAudioStreamConfig clientCodecTypeWithCodecType:](AVCAudioStreamConfig, "clientCodecTypeWithCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCodecType")), "integerValue"));
  self->_cnEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCNEnabled")), "BOOLValue");
  self->_cnPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCNPayloadType")), "integerValue");
  self->_dtmfPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDTMFPayloadType")), "integerValue");
  self->_dtmfTimestampRate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDTMFTsRate")), "integerValue");
  self->_dtmfTonePlaybackEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamdtmfTonePlaybackEnabled")), "BOOLValue");
  self->_dtmfEventCallbacksEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDTMFEventCallbacksEnabled")), "BOOLValue");
  self->_ptime = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamPtime")), "integerValue");
  self->_maxPtime = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamMaxPtime")), "integerValue");
  self->_channelAwareOffset = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamEVSChannelAwareOffset")), "integerValue");
  self->_headerFullOnly = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamEVSHeaderFullOnly")), "BOOLValue");
  self->_dtxEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamAMRDTXEnabled")), "BOOLValue");
  self->_octetAligned = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamAMRIsOctetAligned")), "BOOLValue");
  self->_codecRateModeMask = +[AVCAudioStreamConfig clientCodecRateMaskForCodecRateMode:](AVCAudioStreamConfig, "clientCodecRateMaskForCodecRateMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCodecRateModeMask")), "integerValue"));
  self->_codecBandwidthMask = +[AVCAudioStreamConfig clientCodecBandwidthMaskForCodecBandwidth:](AVCAudioStreamConfig, "clientCodecBandwidthMaskForCodecBandwidth:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCodecBandwidthMask")), "integerValue"));
  self->_preferredCodecRateMode = +[AVCAudioStreamConfig clientCodecRateModeForCodecRateMode:](AVCAudioStreamConfig, "clientCodecRateModeForCodecRateMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCodecRateModePreferred")), "integerValue"));
  self->_latencySensitiveMode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamLatencySensitiveMode")), "BOOLValue");
  self->_numRedundantPayloads = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamNumRedundantPayloads")), "integerValue");
  self->_txRedPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTxRedPayloadType")), "integerValue");
  self->_rxRedPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRxRedPayloadType")), "integerValue");
  self->_enableMaxBitrateOnNoChangeCMR = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamEnableMaxBitrateOnNoChangeCMR")), "BOOLValue");
  self->_anbrEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamAnbrEnabled")), "BOOLValue");
  self->_subscriptionSlot = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTelephonyServiceSubscriptionSlot")), "integerValue");
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamChannelCount")), "unsignedIntegerValue"))
  {
    v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamChannelCount")), "unsignedIntegerValue");
  }
  else
  {
    v5 = 1;
  }
  self->_channelCount = v5;
  self->_preferredMediaBitRate = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamPreferredMediaBitRate")), "unsignedIntegerValue");
  self->_codecCMRMode = +[AVCAudioStreamConfig clientCodecCMRModeModeWithEVSCMRMode:](AVCAudioStreamConfig, "clientCodecCMRModeModeWithEVSCMRMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamEVSCMRMode")), "integerValue"));
}

- (id)dictionary
{
  _QWORD v4[29];
  _QWORD v5[30];

  v5[29] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("vcMediaStreamAudioStreamMode");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AVCAudioStreamConfig streamModeWithClientStreamMode:](AVCAudioStreamConfig, "streamModeWithClientStreamMode:", self->_audioStreamMode));
  v4[1] = CFSTR("vcMediaStreamAMRDTXEnabled");
  v5[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dtxEnabled);
  v4[2] = CFSTR("vcMediaStreamAMRIsOctetAligned");
  v5[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_octetAligned);
  v4[3] = CFSTR("vcMediaStreamCodecRateModeMask");
  v5[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", +[AVCAudioStreamConfig codecRateMaskForClientCodecRateMode:](AVCAudioStreamConfig, "codecRateMaskForClientCodecRateMode:", self->_codecRateModeMask));
  v4[4] = CFSTR("vcMediaStreamCodecRateModePreferred");
  v5[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[AVCAudioStreamConfig codecRateModeForClientCodecRateMode:](AVCAudioStreamConfig, "codecRateModeForClientCodecRateMode:", self->_preferredCodecRateMode));
  v4[5] = CFSTR("vcMediaStreamCodecBandwidthMask");
  v5[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", +[AVCAudioStreamConfig codecBandwidthMaskForClientCodecBandwidth:](AVCAudioStreamConfig, "codecBandwidthMaskForClientCodecBandwidth:", self->_codecBandwidthMask));
  v4[6] = CFSTR("vcMediaStreamCNEnabled");
  v5[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cnEnabled);
  v4[7] = CFSTR("vcMediaStreamCNPayloadType");
  v5[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_cnPayloadType);
  v4[8] = CFSTR("vcMediaStreamDTMFPayloadType");
  v5[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_dtmfPayloadType);
  v4[9] = CFSTR("vcMediaStreamDTMFTsRate");
  v5[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_dtmfTimestampRate);
  v4[10] = CFSTR("vcMediaStreamdtmfTonePlaybackEnabled");
  v5[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dtmfTonePlaybackEnabled);
  v4[11] = CFSTR("vcMediaStreamDTMFEventCallbacksEnabled");
  v5[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dtmfEventCallbacksEnabled);
  v4[12] = CFSTR("vcMediaStreamPtime");
  v5[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_ptime);
  v4[13] = CFSTR("vcMediaStreamEVSChannelAwareOffset");
  v5[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_channelAwareOffset);
  v4[14] = CFSTR("vcMediaStreamEVSHeaderFullOnly");
  v5[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_headerFullOnly);
  v4[15] = CFSTR("vcMediaStreamMaxPtime");
  v5[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxPtime);
  v4[16] = CFSTR("vcMediaStreamCodecType");
  v5[16] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AVCAudioStreamConfig codecTypeWithClientCodecType:](AVCAudioStreamConfig, "codecTypeWithClientCodecType:", self->_codecType));
  v4[17] = CFSTR("vcMediaStreamNumRedundantPayloads");
  v5[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numRedundantPayloads);
  v4[18] = CFSTR("vcMediaStreamTxRedPayloadType");
  v5[18] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_txRedPayloadType);
  v4[19] = CFSTR("vcMediaStreamRxRedPayloadType");
  v5[19] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_rxRedPayloadType);
  v4[20] = CFSTR("vcMediaStreamEnableMaxBitrateOnNoChangeCMR");
  v5[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableMaxBitrateOnNoChangeCMR);
  v4[21] = CFSTR("vcMediaStreamAnbrEnabled");
  v5[21] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_anbrEnabled);
  v4[22] = CFSTR("vcMediaStreamTelephonyServiceSubscriptionSlot");
  v5[22] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_subscriptionSlot);
  v4[23] = CFSTR("vcMediaStreamChannelCount");
  v5[23] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_channelCount);
  v4[24] = CFSTR("vcMediaStreamPreferredMediaBitRate");
  v5[24] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_preferredMediaBitRate);
  v4[25] = CFSTR("vcMediaStreamRemoteDeviceInfoDeviceName");
  v5[25] = -[AVCMediaStreamConfigRemoteDeviceInfo deviceName](self->_remoteDeviceInfo, "deviceName");
  v4[26] = CFSTR("vcMediaStreamRemoteDeviceInfoDeviceUID");
  v5[26] = -[AVCMediaStreamConfigRemoteDeviceInfo deviceUID](self->_remoteDeviceInfo, "deviceUID");
  v4[27] = CFSTR("vcMediaStreamRemoteDeviceInfoModelUID");
  v5[27] = -[AVCMediaStreamConfigRemoteDeviceInfo modelUID](self->_remoteDeviceInfo, "modelUID");
  v4[28] = CFSTR("vcMediaStreamEVSCMRMode");
  v5[28] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[AVCAudioStreamConfig evsCMRModeForClientCodecCMRMode:](AVCAudioStreamConfig, "evsCMRModeForClientCodecCMRMode:", self->_codecCMRMode));
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 29);
}

- (int64_t)audioStreamMode
{
  return self->_audioStreamMode;
}

- (void)setAudioStreamMode:(int64_t)a3
{
  self->_audioStreamMode = a3;
}

- (int64_t)codecType
{
  return self->_codecType;
}

- (void)setCodecType:(int64_t)a3
{
  self->_codecType = a3;
}

- (BOOL)isCNEnabled
{
  return self->_cnEnabled;
}

- (void)setCnEnabled:(BOOL)a3
{
  self->_cnEnabled = a3;
}

- (unint64_t)cnPayloadType
{
  return self->_cnPayloadType;
}

- (void)setCnPayloadType:(unint64_t)a3
{
  self->_cnPayloadType = a3;
}

- (unint64_t)dtmfPayloadType
{
  return self->_dtmfPayloadType;
}

- (void)setDtmfPayloadType:(unint64_t)a3
{
  self->_dtmfPayloadType = a3;
}

- (unint64_t)dtmfTimestampRate
{
  return self->_dtmfTimestampRate;
}

- (void)setDtmfTimestampRate:(unint64_t)a3
{
  self->_dtmfTimestampRate = a3;
}

- (unint64_t)ptime
{
  return self->_ptime;
}

- (void)setPtime:(unint64_t)a3
{
  self->_ptime = a3;
}

- (unint64_t)maxPtime
{
  return self->_maxPtime;
}

- (void)setMaxPtime:(unint64_t)a3
{
  self->_maxPtime = a3;
}

- (unint64_t)channelAwareOffset
{
  return self->_channelAwareOffset;
}

- (void)setChannelAwareOffset:(unint64_t)a3
{
  self->_channelAwareOffset = a3;
}

- (BOOL)isOctectAligned
{
  return self->_octetAligned;
}

- (void)setOctetAligned:(BOOL)a3
{
  self->_octetAligned = a3;
}

- (BOOL)isHeaderFullOnly
{
  return self->_headerFullOnly;
}

- (void)setHeaderFullOnly:(BOOL)a3
{
  self->_headerFullOnly = a3;
}

- (BOOL)isDTXEnabled
{
  return self->_dtxEnabled;
}

- (void)setDtxEnabled:(BOOL)a3
{
  self->_dtxEnabled = a3;
}

- (unsigned)codecRateModeMask
{
  return self->_codecRateModeMask;
}

- (void)setCodecRateModeMask:(unsigned int)a3
{
  self->_codecRateModeMask = a3;
}

- (unsigned)codecBandwidthMask
{
  return self->_codecBandwidthMask;
}

- (void)setCodecBandwidthMask:(unsigned int)a3
{
  self->_codecBandwidthMask = a3;
}

- (int64_t)preferredCodecRateMode
{
  return self->_preferredCodecRateMode;
}

- (void)setPreferredCodecRateMode:(int64_t)a3
{
  self->_preferredCodecRateMode = a3;
}

- (BOOL)isLatencySensitiveMode
{
  return self->_latencySensitiveMode;
}

- (void)setLatencySensitiveMode:(BOOL)a3
{
  self->_latencySensitiveMode = a3;
}

- (unint64_t)numRedundantPayloads
{
  return self->_numRedundantPayloads;
}

- (void)setNumRedundantPayloads:(unint64_t)a3
{
  self->_numRedundantPayloads = a3;
}

- (unint64_t)txRedPayloadType
{
  return self->_txRedPayloadType;
}

- (void)setTxRedPayloadType:(unint64_t)a3
{
  self->_txRedPayloadType = a3;
}

- (unint64_t)rxRedPayloadType
{
  return self->_rxRedPayloadType;
}

- (void)setRxRedPayloadType:(unint64_t)a3
{
  self->_rxRedPayloadType = a3;
}

- (BOOL)enableMaxBitrateOnNoChangeCMR
{
  return self->_enableMaxBitrateOnNoChangeCMR;
}

- (void)setEnableMaxBitrateOnNoChangeCMR:(BOOL)a3
{
  self->_enableMaxBitrateOnNoChangeCMR = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (BOOL)dtmfTonePlaybackEnabled
{
  return self->_dtmfTonePlaybackEnabled;
}

- (void)setDtmfTonePlaybackEnabled:(BOOL)a3
{
  self->_dtmfTonePlaybackEnabled = a3;
}

- (int64_t)subscriptionSlot
{
  return self->_subscriptionSlot;
}

- (void)setSubscriptionSlot:(int64_t)a3
{
  self->_subscriptionSlot = a3;
}

- (BOOL)anbrEnabled
{
  return self->_anbrEnabled;
}

- (void)setAnbrEnabled:(BOOL)a3
{
  self->_anbrEnabled = a3;
}

- (unint64_t)channelCount
{
  return self->_channelCount;
}

- (void)setChannelCount:(unint64_t)a3
{
  self->_channelCount = a3;
}

- (unint64_t)preferredMediaBitRate
{
  return self->_preferredMediaBitRate;
}

- (void)setPreferredMediaBitRate:(unint64_t)a3
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

- (int)codecCMRMode
{
  return self->_codecCMRMode;
}

- (void)setCodecCMRMode:(int)a3
{
  self->_codecCMRMode = a3;
}

- (AVCMediaStreamConfigRemoteDeviceInfo)remoteDeviceInfo
{
  return self->_remoteDeviceInfo;
}

+ (void)streamModeWithClientStreamMode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid clientStreamMode=%d", v2, v3, v4, 649);
  OUTLINED_FUNCTION_3();
}

@end
