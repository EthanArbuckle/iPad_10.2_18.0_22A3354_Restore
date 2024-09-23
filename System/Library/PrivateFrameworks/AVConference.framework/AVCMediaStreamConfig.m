@implementation AVCMediaStreamConfig

- (AVCMediaStreamConfig)init
{
  AVCMediaStreamConfig *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)AVCMediaStreamConfig;
  v2 = -[AVCMediaStreamConfig init](&v4, sel_init);
  if (v2)
  {
    v2->_remoteAddress = (AVCNetworkAddress *)objc_opt_new();
    v2->_localAddress = (AVCNetworkAddress *)objc_opt_new();
    v2->_cName = (NSString *)objc_opt_new();
    v2->_direction = 3;
    v2->_sendMediaKey = (NSData *)objc_opt_new();
    v2->_receiveMediaKey = (NSData *)objc_opt_new();
    v2->_audio = (AVCAudioStreamConfig *)objc_opt_new();
    v2->_video = (AVCVideoStreamConfig *)objc_opt_new();
    v2->_text = (AVCTextStreamConfig *)objc_opt_new();
    v2->_networkClockID = *MEMORY[0x1E0DBF0F0];
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)AVCMediaStreamConfig;
  -[AVCMediaStreamConfig dealloc](&v3, sel_dealloc);
}

- (BOOL)isValidAudioConfig
{
  return -[AVCAudioStreamConfig isValid](-[AVCMediaStreamConfig audio](self, "audio"), "isValid")
      && -[AVCMediaStreamConfig isAudioCodecValid](self, "isAudioCodecValid")
      && -[AVCMediaStreamConfig isAudioCodecMaskValid](self, "isAudioCodecMaskValid")
      && -[AVCMediaStreamConfig isStreamInputIDValid](self, "isStreamInputIDValid")
      && -[AVCMediaStreamConfig isJitterBufferModeValid](self, "isJitterBufferModeValid");
}

- (BOOL)isValidVideoConfig
{
  BOOL v3;

  v3 = -[AVCVideoStreamConfig captureSource](-[AVCMediaStreamConfig video](self, "video"), "captureSource") != 3
    || self->_streamInputID != 0;
  if (-[AVCMediaStreamConfig txPayloadType](self, "txPayloadType") > 0x7F
    || -[AVCMediaStreamConfig txPayloadType](self, "txPayloadType") < 0x60
    || -[AVCMediaStreamConfig rxPayloadType](self, "rxPayloadType") > 0x7F
    || -[AVCMediaStreamConfig rxPayloadType](self, "rxPayloadType") < 0x60)
  {
    return 0;
  }
  else
  {
    return -[AVCVideoStreamConfig isValidForDirection:](-[AVCMediaStreamConfig video](self, "video"), "isValidForDirection:", -[AVCMediaStreamConfig direction](self, "direction"))&& v3;
  }
}

- (BOOL)isValidTextConfig
{
  return -[AVCMediaStreamConfig txPayloadType](self, "txPayloadType") <= 0x7F
      && -[AVCMediaStreamConfig txPayloadType](self, "txPayloadType") >= 0x60
      && -[AVCMediaStreamConfig rxPayloadType](self, "rxPayloadType") <= 0x7F
      && -[AVCMediaStreamConfig rxPayloadType](self, "rxPayloadType") >= 0x60
      && -[AVCTextStreamConfig isValid](-[AVCMediaStreamConfig text](self, "text"), "isValid");
}

- (id)description
{
  return (id)objc_msgSend(-[AVCMediaStreamConfig dictionary](self, "dictionary"), "description");
}

+ (int64_t)streamDirectionWithClientDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (int)streamJitterBufferModeWithClientJitterBufferMode:(unsigned int)a3
{
  if (a3 < 3)
    return dword_1D9110CD8[a3];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      +[AVCMediaStreamConfig streamJitterBufferModeWithClientJitterBufferMode:].cold.1();
  }
  return 1;
}

+ (int64_t)clientStreamDirectionWithDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

+ (int64_t)cipherSuiteWithClientCipherSuite:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return 0;
  else
    return qword_1D9110CE8[a3 - 1];
}

+ (int64_t)clientCipherSuiteWithCipherSuite:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return 0;
  else
    return qword_1D9110D10[a3 - 1];
}

- (void)setUpWithDictionary:(id)a3
{
  double v5;
  double v6;
  double v7;

  -[AVCNetworkAddress setIp:](self->_remoteAddress, "setIp:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDestIp")));
  -[AVCNetworkAddress setPort:](self->_remoteAddress, "setPort:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDestPort")), "shortValue"));
  -[AVCNetworkAddress setIsIPv6:](self->_remoteAddress, "setIsIPv6:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDestIsIPv6")), "BOOLValue"));
  -[AVCNetworkAddress setIp:](self->_localAddress, "setIp:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSourceIP")));
  -[AVCNetworkAddress setPort:](self->_localAddress, "setPort:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSourcePort")), "shortValue"));
  -[AVCNetworkAddress setIsIPv6:](self->_localAddress, "setIsIPv6:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSourceIsIPv6")), "BOOLValue"));
  -[AVCNetworkAddress setInterfaceName:](self->_localAddress, "setInterfaceName:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSourceInterfaceName")));
  self->_cName = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCName"));
  self->_direction = +[AVCMediaStreamConfig clientStreamDirectionWithDirection:](AVCMediaStreamConfig, "clientStreamDirectionWithDirection:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDirection")), "integerValue"));
  self->_txPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamTxPayloadType")), "integerValue");
  self->_rxPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRxPayloadType")), "integerValue");
  self->_remoteSSRC = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRemoteSSRC")), "integerValue");
  self->_localSSRC = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamLocalSSRC")), "integerValue");
  self->_rateAdaptationEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRateAdaptationEnabled")), "BOOLValue");
  self->_rtcpEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPEnabled")), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPSendInterval")), "doubleValue");
  self->_rtcpSendInterval = v5;
  self->_rtcpRemotePort = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPRemotePort")), "integerValue");
  self->_rtcpTimeOutEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPTimeoutEnabled")), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPTimeoutInterval")), "doubleValue");
  self->_rtcpTimeOutInterval = v6;
  self->_rtcpXREnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPXREnabled")), "BOOLValue");
  self->_rtpTimeOutEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTPTimeoutEnabled")), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTPTimeoutInterval")), "doubleValue");
  self->_rtpTimeOutInterval = v7;
  self->_sendMediaKey = (NSData *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSRTPSendMediaKey"));
  self->_recommendedMTU = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRecommendedMTU")), "integerValue");
  self->_receiveMediaKey = (NSData *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSRTPReceiveMediaKey"));
  self->_SRTPCipherSuite = +[AVCMediaStreamConfig clientCipherSuiteWithCipherSuite:](AVCMediaStreamConfig, "clientCipherSuiteWithCipherSuite:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSRTPCipherSuite")), "integerValue"));
  self->_SRTCPCipherSuite = +[AVCMediaStreamConfig clientCipherSuiteWithCipherSuite:](AVCMediaStreamConfig, "clientCipherSuiteWithCipherSuite:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSRTCPCipherSuite")), "integerValue"));
  self->_streamInputID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamStreamInputID")), "integerValue");
  self->_jitterBufferMode = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamJitterBufferMode")), "unsignedIntValue");
  self->_fixedJitterBufferSize = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamFixedJitterBufferSize")), "unsignedLongValue");
  self->_accessNetworkType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamAccessNetworkType")), "integerValue");
  self->_outOfProcessCodecsEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamOutOfProcessCodecsEnabled")), "BOOLValue");
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamNetworkClockID")))
    self->_networkClockID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamNetworkClockID")), "unsignedLongLongValue");
}

- (id)dictionary
{
  void *v3;

  v3 = (void *)objc_msgSend(+[AVCMediaStreamConfig dictionaryForCommonStreamConfig:](AVCMediaStreamConfig, "dictionaryForCommonStreamConfig:", self), "mutableCopy");
  objc_msgSend(v3, "addEntriesFromDictionary:", -[AVCAudioStreamConfig dictionary](self->_audio, "dictionary"));
  objc_msgSend(v3, "addEntriesFromDictionary:", -[AVCVideoStreamConfig dictionary](self->_video, "dictionary"));
  objc_msgSend(v3, "addEntriesFromDictionary:", -[AVCTextStreamConfig dictionary](self->_text, "dictionary"));
  return v3;
}

+ (id)dictionaryForCommonStreamConfig:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[33];
  _QWORD v9[34];

  v9[33] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("vcMediaStreamDestIp");
  v9[0] = objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "ip");
  v8[1] = CFSTR("vcMediaStreamDestPort");
  v9[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "port"));
  v8[2] = CFSTR("vcMediaStreamDestIsIPv6");
  v9[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_msgSend(a3, "remoteAddress"), "isIPv6"));
  v8[3] = CFSTR("vcMediaStreamSourceIP");
  v9[3] = objc_msgSend((id)objc_msgSend(a3, "localAddress"), "ip");
  v8[4] = CFSTR("vcMediaStreamSourcePort");
  v9[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend(a3, "localAddress"), "port"));
  v8[5] = CFSTR("vcMediaStreamSourceIsIPv6");
  v9[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_msgSend(a3, "localAddress"), "isIPv6"));
  v8[6] = CFSTR("vcMediaStreamSourceInterfaceName");
  v9[6] = objc_msgSend((id)objc_msgSend(a3, "localAddress"), "interfaceName");
  v8[7] = CFSTR("vcMediaStreamCName");
  v9[7] = objc_msgSend(a3, "cName");
  v8[8] = CFSTR("vcMediaStreamDirection");
  v9[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AVCMediaStreamConfig streamDirectionWithClientDirection:](AVCMediaStreamConfig, "streamDirectionWithClientDirection:", objc_msgSend(a3, "direction")));
  v8[9] = CFSTR("vcMediaStreamTxPayloadType");
  v9[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "txPayloadType"));
  v8[10] = CFSTR("vcMediaStreamRxPayloadType");
  v9[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "rxPayloadType"));
  v8[11] = CFSTR("vcMediaStreamRemoteSSRC");
  v9[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "remoteSSRC"));
  v8[12] = CFSTR("vcMediaStreamLocalSSRC");
  v9[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "localSSRC"));
  v8[13] = CFSTR("vcMediaStreamRateAdaptationEnabled");
  v9[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isRateAdaptationEnabled"));
  v8[14] = CFSTR("vcMediaStreamRTCPEnabled");
  v9[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isRTCPEnabled"));
  v8[15] = CFSTR("vcMediaStreamRTCPSendInterval");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "rtcpSendInterval");
  v9[15] = objc_msgSend(v4, "numberWithDouble:");
  v8[16] = CFSTR("vcMediaStreamRTCPRemotePort");
  v9[16] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(a3, "rtcpRemotePort"));
  v8[17] = CFSTR("vcMediaStreamRTCPTimeoutEnabled");
  v9[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isRTCPTimeOutEnabled"));
  v8[18] = CFSTR("vcMediaStreamRTCPTimeoutInterval");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "rtcpTimeOutInterval");
  v9[18] = objc_msgSend(v5, "numberWithDouble:");
  v8[19] = CFSTR("vcMediaStreamRTCPXREnabled");
  v9[19] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isRTCPXREnabled"));
  v8[20] = CFSTR("vcMediaStreamRTPTimeoutEnabled");
  v9[20] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "isRTPTimeOutEnabled"));
  v8[21] = CFSTR("vcMediaStreamRTPTimeoutInterval");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "rtpTimeOutInterval");
  v9[21] = objc_msgSend(v6, "numberWithDouble:");
  v8[22] = CFSTR("vcMediaStreamRecommendedMTU");
  v9[22] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "recommendedMTU"));
  v8[23] = CFSTR("vcMediaStreamSRTPSendMediaKey");
  v9[23] = objc_msgSend(a3, "sendMediaKey");
  v8[24] = CFSTR("vcMediaStreamSRTPReceiveMediaKey");
  v9[24] = objc_msgSend(a3, "receiveMediaKey");
  v8[25] = CFSTR("vcMediaStreamSRTPCipherSuite");
  v9[25] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AVCMediaStreamConfig cipherSuiteWithClientCipherSuite:](AVCMediaStreamConfig, "cipherSuiteWithClientCipherSuite:", objc_msgSend(a3, "SRTPCipherSuite")));
  v8[26] = CFSTR("vcMediaStreamSRTCPCipherSuite");
  v9[26] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[AVCMediaStreamConfig cipherSuiteWithClientCipherSuite:](AVCMediaStreamConfig, "cipherSuiteWithClientCipherSuite:", objc_msgSend(a3, "SRTCPCipherSuite")));
  v8[27] = CFSTR("vcMediaStreamStreamInputID");
  v9[27] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "streamInputID"));
  v8[28] = CFSTR("vcMediaStreamNetworkClockID");
  v9[28] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "networkClockID"));
  v8[29] = CFSTR("vcMediaStreamJitterBufferMode");
  v9[29] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "jitterBufferMode"));
  v8[30] = CFSTR("vcMediaStreamFixedJitterBufferSize");
  v9[30] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a3, "fixedJitterBufferSize"));
  v8[31] = CFSTR("vcMediaStreamAccessNetworkType");
  v9[31] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "accessNetworkType"));
  v8[32] = CFSTR("vcMediaStreamOutOfProcessCodecsEnabled");
  v9[32] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a3, "outOfProcessCodecsEnabled"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 33);
}

- (unsigned)jitterBufferMode
{
  if (self->_jitterBufferModeSet)
    return self->_jitterBufferMode;
  if (-[AVCAudioStreamConfig isLatencySensitiveMode](self->_audio, "isLatencySensitiveMode"))
    return 0;
  return !-[AVCVideoStreamConfig isLatencySensitiveModeEnabled](self->_video, "isLatencySensitiveModeEnabled");
}

- (void)setJitterBufferMode:(unsigned int)a3
{
  self->_jitterBufferMode = a3;
  self->_jitterBufferModeSet = 1;
}

- (BOOL)isAudioCodecValid
{
  unint64_t v3;
  BOOL result;

  v3 = -[AVCAudioStreamConfig codecType](-[AVCMediaStreamConfig audio](self, "audio"), "codecType");
  result = 0;
  if (v3 <= 0x11)
  {
    if (((1 << v3) & 0x3FE73) != 0)
    {
      if (-[AVCMediaStreamConfig txPayloadType](self, "txPayloadType") <= 0x7F
        && -[AVCMediaStreamConfig txPayloadType](self, "txPayloadType") >= 0x60
        && -[AVCMediaStreamConfig rxPayloadType](self, "rxPayloadType") <= 0x7F)
      {
        return -[AVCMediaStreamConfig rxPayloadType](self, "rxPayloadType") > 0x5F;
      }
      return 0;
    }
    if (v3 == 2)
    {
      if (-[AVCMediaStreamConfig rxPayloadType](self, "rxPayloadType"))
        return 0;
      return -[AVCMediaStreamConfig txPayloadType](self, "txPayloadType") == 0;
    }
    else
    {
      if (v3 != 3)
        return result;
      if (-[AVCMediaStreamConfig rxPayloadType](self, "rxPayloadType") != 8)
        return 0;
      return -[AVCMediaStreamConfig txPayloadType](self, "txPayloadType") == 8;
    }
  }
  return result;
}

- (BOOL)isAudioCodecMaskValid
{
  unsigned int v3;
  int64_t v4;
  BOOL v6;
  unsigned int v7;

  v3 = -[AVCAudioStreamConfig codecBandwidthMask](-[AVCMediaStreamConfig audio](self, "audio"), "codecBandwidthMask");
  v4 = -[AVCAudioStreamConfig codecType](-[AVCMediaStreamConfig audio](self, "audio"), "codecType");
  v6 = v3 < 5 || v3 == 7;
  v7 = (0xDu >> (v3 & 0xF)) & 1;
  if (v3 >= 4)
    LOBYTE(v7) = 0;
  if (v4 != 12)
    LOBYTE(v7) = v3 == 0;
  if (v4 != 13)
    v6 = v7;
  if (v4 == 14)
    return v3 < 2;
  else
    return v6;
}

- (BOOL)isStreamInputIDValid
{
  return -[AVCAudioStreamConfig audioStreamMode](-[AVCMediaStreamConfig audio](self, "audio"), "audioStreamMode") != 7
      || (self->_direction | 2) != 3
      || self->_streamInputID != 0;
}

- (BOOL)isJitterBufferModeValid
{
  return -[AVCMediaStreamConfig jitterBufferMode](self, "jitterBufferMode") != 2 || self->_fixedJitterBufferSize != 0;
}

- (AVCNetworkAddress)localAddress
{
  return self->_localAddress;
}

- (void)setLocalAddress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (AVCNetworkAddress)remoteAddress
{
  return self->_remoteAddress;
}

- (void)setRemoteAddress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)cName
{
  return self->_cName;
}

- (void)setCName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (unint64_t)txPayloadType
{
  return self->_txPayloadType;
}

- (void)setTxPayloadType:(unint64_t)a3
{
  self->_txPayloadType = a3;
}

- (unint64_t)rxPayloadType
{
  return self->_rxPayloadType;
}

- (void)setRxPayloadType:(unint64_t)a3
{
  self->_rxPayloadType = a3;
}

- (unsigned)remoteSSRC
{
  return self->_remoteSSRC;
}

- (void)setRemoteSSRC:(unsigned int)a3
{
  self->_remoteSSRC = a3;
}

- (unsigned)localSSRC
{
  return self->_localSSRC;
}

- (void)setLocalSSRC:(unsigned int)a3
{
  self->_localSSRC = a3;
}

- (BOOL)isRateAdaptationEnabled
{
  return self->_rateAdaptationEnabled;
}

- (void)setRateAdaptationEnabled:(BOOL)a3
{
  self->_rateAdaptationEnabled = a3;
}

- (BOOL)isRTCPEnabled
{
  return self->_rtcpEnabled;
}

- (void)setRtcpEnabled:(BOOL)a3
{
  self->_rtcpEnabled = a3;
}

- (BOOL)isRTCPXREnabled
{
  return self->_rtcpXREnabled;
}

- (void)setRtcpXREnabled:(BOOL)a3
{
  self->_rtcpXREnabled = a3;
}

- (unsigned)rtcpRemotePort
{
  return self->_rtcpRemotePort;
}

- (void)setRtcpRemotePort:(unsigned __int16)a3
{
  self->_rtcpRemotePort = a3;
}

- (double)rtcpSendInterval
{
  return self->_rtcpSendInterval;
}

- (void)setRtcpSendInterval:(double)a3
{
  self->_rtcpSendInterval = a3;
}

- (BOOL)isRTPTimeOutEnabled
{
  return self->_rtpTimeOutEnabled;
}

- (void)setRtpTimeOutEnabled:(BOOL)a3
{
  self->_rtpTimeOutEnabled = a3;
}

- (BOOL)isRTCPTimeOutEnabled
{
  return self->_rtcpTimeOutEnabled;
}

- (void)setRtcpTimeOutEnabled:(BOOL)a3
{
  self->_rtcpTimeOutEnabled = a3;
}

- (double)rtpTimeOutInterval
{
  return self->_rtpTimeOutInterval;
}

- (void)setRtpTimeOutInterval:(double)a3
{
  self->_rtpTimeOutInterval = a3;
}

- (double)rtcpTimeOutInterval
{
  return self->_rtcpTimeOutInterval;
}

- (void)setRtcpTimeOutInterval:(double)a3
{
  self->_rtcpTimeOutInterval = a3;
}

- (unint64_t)recommendedMTU
{
  return self->_recommendedMTU;
}

- (void)setRecommendedMTU:(unint64_t)a3
{
  self->_recommendedMTU = a3;
}

- (NSData)sendMediaKey
{
  return self->_sendMediaKey;
}

- (void)setSendMediaKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (NSData)receiveMediaKey
{
  return self->_receiveMediaKey;
}

- (void)setReceiveMediaKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (int64_t)SRTPCipherSuite
{
  return self->_SRTPCipherSuite;
}

- (void)setSRTPCipherSuite:(int64_t)a3
{
  self->_SRTPCipherSuite = a3;
}

- (int64_t)SRTCPCipherSuite
{
  return self->_SRTCPCipherSuite;
}

- (void)setSRTCPCipherSuite:(int64_t)a3
{
  self->_SRTCPCipherSuite = a3;
}

- (AVCAudioStreamConfig)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (AVCVideoStreamConfig)video
{
  return self->_video;
}

- (void)setVideo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 152);
}

- (AVCTextStreamConfig)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (int64_t)streamInputID
{
  return self->_streamInputID;
}

- (void)setStreamInputID:(int64_t)a3
{
  self->_streamInputID = a3;
}

- (unint64_t)networkClockID
{
  return self->_networkClockID;
}

- (void)setNetworkClockID:(unint64_t)a3
{
  self->_networkClockID = a3;
}

- (unint64_t)fixedJitterBufferSize
{
  return self->_fixedJitterBufferSize;
}

- (void)setFixedJitterBufferSize:(unint64_t)a3
{
  self->_fixedJitterBufferSize = a3;
}

- (int64_t)accessNetworkType
{
  return self->_accessNetworkType;
}

- (void)setAccessNetworkType:(int64_t)a3
{
  self->_accessNetworkType = a3;
}

- (BOOL)outOfProcessCodecsEnabled
{
  return self->_outOfProcessCodecsEnabled;
}

- (void)setOutOfProcessCodecsEnabled:(BOOL)a3
{
  self->_outOfProcessCodecsEnabled = a3;
}

+ (void)streamJitterBufferModeWithClientJitterBufferMode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unknown AVCJitterBufferMode=%d", v2, v3, v4, 252);
  OUTLINED_FUNCTION_3();
}

@end
