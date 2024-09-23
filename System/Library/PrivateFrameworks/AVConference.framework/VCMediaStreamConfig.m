@implementation VCMediaStreamConfig

- (NSDictionary)allTxPayloadMap
{
  void *v3;
  VCMediaStreamMultiwayConfig *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", -[VCMediaStreamConfig txPayloadMap](self, "txPayloadMap"));
  v4 = -[VCMediaStreamConfig multiwayConfig](self, "multiwayConfig");
  if (v4)
    objc_msgSend(v3, "addEntriesFromDictionary:", -[VCMediaStreamMultiwayConfig txPayloadMap](v4, "txPayloadMap"));
  return (NSDictionary *)v3;
}

- (NSDictionary)allRxPayloadMap
{
  void *v3;
  VCMediaStreamMultiwayConfig *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", -[VCMediaStreamConfig rxPayloadMap](self, "rxPayloadMap"));
  v4 = -[VCMediaStreamConfig multiwayConfig](self, "multiwayConfig");
  if (v4)
    objc_msgSend(v3, "addEntriesFromDictionary:", -[VCMediaStreamMultiwayConfig rxPayloadMap](v4, "rxPayloadMap"));
  return (NSDictionary *)v3;
}

- (VCMediaStreamConfig)init
{
  VCMediaStreamConfig *v2;
  VCMediaStreamConfig *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamConfig;
  v2 = -[VCMediaStreamConfig init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[VCMediaStreamConfig setupMediaStreamConfig](v2, "setupMediaStreamConfig");
  return v3;
}

- (VCMediaStreamConfig)initWithClientDictionary:(id)a3
{
  VCMediaStreamConfig *v4;
  VCMediaStreamConfig *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaStreamConfig;
  v4 = -[VCMediaStreamConfig init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[VCMediaStreamConfig setupMediaStreamConfig](v4, "setupMediaStreamConfig");
    if (a3)
      -[VCMediaStreamConfig applyMediaStreamClientDictionary:](v5, "applyMediaStreamClientDictionary:", a3);
  }
  return v5;
}

- (void)setSecurityKeyHolder:(tagVCSecurityKeyHolder *)a3
{
  tagVCSecurityKeyHolder *securityKeyHolder;

  securityKeyHolder = self->_securityKeyHolder;
  self->_securityKeyHolder = a3;
  if (a3)
    CFRetain(a3);
  if (securityKeyHolder)
    CFRelease(securityKeyHolder);
}

- (void)dealloc
{
  tagVCSecurityKeyHolder *securityKeyHolder;
  tagVCJBTargetEstimatorSynchronizer *jbTargetEstimatorSynchronizer;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];

  securityKeyHolder = self->_securityKeyHolder;
  if (securityKeyHolder)
    CFRelease(securityKeyHolder);
  jbTargetEstimatorSynchronizer = self->_jbTargetEstimatorSynchronizer;
  if (jbTargetEstimatorSynchronizer)
  {
    CFRelease(jbTargetEstimatorSynchronizer);
    self->_jbTargetEstimatorSynchronizer = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)VCMediaStreamConfig;
  -[VCMediaStreamConfig dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%p)"), NSStringFromClass(v4), self);
}

- (void)addRxPayloadType:(int)a3
{
  -[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", *(_QWORD *)&a3, 0xFFFFLL);
}

- (void)addRxPayloadType:(int)a3 networkPayload:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;

  v4 = *(_QWORD *)&a3;
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rxPayloadMap, "setObject:forKeyedSubscript:", v6, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
}

- (void)addTxPayloadType:(int)a3
{
  -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", *(_QWORD *)&a3, 0xFFFFLL);
}

- (void)addTxPayloadType:(int)a3 networkPayload:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;

  v4 = *(_QWORD *)&a3;
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_txPayloadMap, "setObject:forKeyedSubscript:", v6, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
}

- (int64_t)primaryTxCodecType
{
  void *v2;
  int64_t result;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)-[NSMutableDictionary allKeys](self->_txPayloadMap, "allKeys");
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v9 != v5)
        objc_enumerationMutation(v2);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "integerValue") != 20)
      {
        result = +[VCPayloadUtils codecTypeForPayload:](VCPayloadUtils, "codecTypeForPayload:");
        if ((unint64_t)(result - 11) < 0xFFFFFFFFFFFFFFFELL)
          break;
      }
      if (v4 == ++v6)
      {
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
        v4 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (void)setupMediaStreamConfig
{
  self->_txPayloadMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_rxPayloadMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  self->_remoteAddress = objc_alloc_init(VCNetworkAddress);
  self->_localAddress = objc_alloc_init(VCNetworkAddress);
  self->_cName = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", &stru_1E9E58EE0);
  self->_rtcpReceiveCallbackEnabled = 1;
  self->_networkClockID = *MEMORY[0x1E0DBF0F0];
}

- (void)applyMediaStreamClientDictionary:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[VCNetworkAddress setIp:](self->_remoteAddress, "setIp:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDestIp")));
  -[VCNetworkAddress setPort:](self->_remoteAddress, "setPort:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDestPort")), "shortValue"));
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDestIsIPv6")), "BOOLValue"))v5 = 6;
  else
    v5 = 4;
  -[VCNetworkAddress setIpVersion:](self->_remoteAddress, "setIpVersion:", v5);
  self->_remoteSSRC = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRemoteSSRC")), "integerValue");
  -[VCNetworkAddress setIp:](self->_localAddress, "setIp:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSourceIP")));
  -[VCNetworkAddress setPort:](self->_localAddress, "setPort:", (unsigned __int16)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSourcePort")), "shortValue"));
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSourceIsIPv6")), "BOOLValue"))v6 = 6;
  else
    v6 = 4;
  -[VCNetworkAddress setIpVersion:](self->_localAddress, "setIpVersion:", v6);
  -[VCNetworkAddress setInterfaceName:](self->_localAddress, "setInterfaceName:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSourceInterfaceName")));
  self->_localSSRC = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamLocalSSRC")), "integerValue");
  self->_cName = (NSString *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCName"));
  self->_recommendedMTU = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRecommendedMTU")), "integerValue");
  self->_direction = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDirection")), "integerValue");
  self->_rateAdaptationEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRateAdaptationEnabled")), "BOOLValue");
  self->_rtpTimeOutEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTPTimeoutEnabled")), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTPTimeoutInterval")), "doubleValue");
  self->_rtpTimeOutInterval = v7;
  self->_decryptionTimeOutEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDecryptionTimeoutEnabled")), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamDecryptionTimeoutInterval")), "doubleValue");
  self->_decryptionTimeOutInterval = v8;
  self->_SRTPCipherSuite = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSRTPCipherSuite")), "integerValue");
  self->_rtcpEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPEnabled")), "BOOLValue");
  self->_rtcpXREnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPXREnabled")), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPSendInterval")), "doubleValue");
  self->_rtcpSendInterval = v9;
  self->_rtcpRemotePort = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPRemotePort")), "integerValue");
  self->_rtcpTimeOutEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPTimeoutEnabled")), "BOOLValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamRTCPTimeoutInterval")), "doubleValue");
  self->_rtcpTimeOutInterval = v10;
  self->_SRTCPCipherSuite = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSRTCPCipherSuite")), "integerValue");
  self->_sendMediaKey = (NSData *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSRTPSendMediaKey"));
  self->_receiveMediaKey = (NSData *)(id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamSRTPReceiveMediaKey"));
  self->_captureSource = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamCaptureSource")), "integerValue");
  self->_streamInputID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamStreamInputID")), "integerValue");
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamNetworkClockID")))
    self->_networkClockID = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamNetworkClockID")), "unsignedLongLongValue");
  self->_jitterBufferMode = -[VCMediaStreamConfig jitterBufferModeFromAVCJitterBufferMode:](self, "jitterBufferModeFromAVCJitterBufferMode:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamJitterBufferMode")), "unsignedIntValue"));
  self->_fixedJitterBufferSize = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamFixedJitterBufferSize")), "unsignedLongValue");
  self->_outOfProcessCodecsEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamOutOfProcessCodecsEnabled")), "BOOLValue");
  self->_accessNetworkType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMediaStreamAccessNetworkType")), "integerValue");
}

- (int)jitterBufferModeFromAVCJitterBufferMode:(unsigned int)a3
{
  if (a3 == 2)
    return 3;
  else
    return a3 == 0;
}

- (tagVCJBTargetEstimatorSynchronizer)jbTargetEstimatorSynchronizer
{
  return self->_jbTargetEstimatorSynchronizer;
}

- (void)setJbTargetEstimatorSynchronizer:(tagVCJBTargetEstimatorSynchronizer *)a3
{
  tagVCJBTargetEstimatorSynchronizer *jbTargetEstimatorSynchronizer;

  jbTargetEstimatorSynchronizer = self->_jbTargetEstimatorSynchronizer;
  if (jbTargetEstimatorSynchronizer)
    CFRelease(jbTargetEstimatorSynchronizer);
  self->_jbTargetEstimatorSynchronizer = a3;
  if (a3)
    CFRetain(a3);
}

- (VCNetworkAddress)localAddress
{
  return self->_localAddress;
}

- (void)setLocalAddress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (VCNetworkAddress)remoteAddress
{
  return self->_remoteAddress;
}

- (void)setRemoteAddress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSString)cName
{
  return self->_cName;
}

- (void)setCName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (unsigned)localSSRC
{
  return self->_localSSRC;
}

- (void)setLocalSSRC:(unsigned int)a3
{
  self->_localSSRC = a3;
}

- (unsigned)remoteSSRC
{
  return self->_remoteSSRC;
}

- (void)setRemoteSSRC:(unsigned int)a3
{
  self->_remoteSSRC = a3;
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

- (unsigned)rtpTimestampRate
{
  return self->_rtpTimestampRate;
}

- (void)setRtpTimestampRate:(unsigned int)a3
{
  self->_rtpTimestampRate = a3;
}

- (BOOL)isDecryptionTimeOutEnabled
{
  return self->_decryptionTimeOutEnabled;
}

- (void)setDecryptionTimeOutEnabled:(BOOL)a3
{
  self->_decryptionTimeOutEnabled = a3;
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

- (double)decryptionTimeOutInterval
{
  return self->_decryptionTimeOutInterval;
}

- (void)setDecryptionTimeOutInterval:(double)a3
{
  self->_decryptionTimeOutInterval = a3;
}

- (double)decryptionMKMRecoveryInterval
{
  return self->_decryptionMKMRecoveryInterval;
}

- (void)setDecryptionMKMRecoveryInterval:(double)a3
{
  self->_decryptionMKMRecoveryInterval = a3;
}

- (unsigned)cellularUniqueTag
{
  return self->_cellularUniqueTag;
}

- (void)setCellularUniqueTag:(unsigned int)a3
{
  self->_cellularUniqueTag = a3;
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
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSData)receiveMediaKey
{
  return self->_receiveMediaKey;
}

- (void)setReceiveMediaKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
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

- (tagVCSecurityKeyHolder)securityKeyHolder
{
  return self->_securityKeyHolder;
}

- (int)sframeCipherSuite
{
  return self->_sframeCipherSuite;
}

- (void)setSframeCipherSuite:(int)a3
{
  self->_sframeCipherSuite = a3;
}

- (NSDictionary)rxPayloadMap
{
  return &self->_rxPayloadMap->super;
}

- (NSDictionary)txPayloadMap
{
  return &self->_txPayloadMap->super;
}

- (BOOL)isRateAdaptationEnabled
{
  return self->_rateAdaptationEnabled;
}

- (void)setRateAdaptationEnabled:(BOOL)a3
{
  self->_rateAdaptationEnabled = a3;
}

- (VCMediaStreamMultiwayConfig)multiwayConfig
{
  return self->_multiwayConfig;
}

- (void)setMultiwayConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 224);
}

- (BOOL)isRTCPReceiveCallbackEnabled
{
  return self->_rtcpReceiveCallbackEnabled;
}

- (void)setRtcpReceiveCallbackEnabled:(BOOL)a3
{
  self->_rtcpReceiveCallbackEnabled = a3;
}

- (VCMediaStreamRateControlConfig)rateControlConfig
{
  return self->_rateControlConfig;
}

- (void)setRateControlConfig:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (int)captureSource
{
  return self->_captureSource;
}

- (void)setCaptureSource:(int)a3
{
  self->_captureSource = a3;
}

- (VCNetworkFeedbackController)networkFeedbackController
{
  return self->_networkFeedbackController;
}

- (void)setNetworkFeedbackController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
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

- (int)jitterBufferMode
{
  return self->_jitterBufferMode;
}

- (void)setJitterBufferMode:(int)a3
{
  self->_jitterBufferMode = a3;
}

- (unint64_t)fixedJitterBufferSize
{
  return self->_fixedJitterBufferSize;
}

- (void)setFixedJitterBufferSize:(unint64_t)a3
{
  self->_fixedJitterBufferSize = a3;
}

- (BOOL)isServerPacketRetransmissionEnabled
{
  return self->_isServerPacketRetransmissionEnabled;
}

- (void)setIsServerPacketRetransmissionEnabled:(BOOL)a3
{
  self->_isServerPacketRetransmissionEnabled = a3;
}

- (BOOL)isUplinkRetransmissionEnabled
{
  return self->_isUplinkRetransmissionEnabled;
}

- (void)setIsUplinkRetransmissionEnabled:(BOOL)a3
{
  self->_isUplinkRetransmissionEnabled = a3;
}

- (BOOL)outOfProcessCodecsEnabled
{
  return self->_outOfProcessCodecsEnabled;
}

- (void)setOutOfProcessCodecsEnabled:(BOOL)a3
{
  self->_outOfProcessCodecsEnabled = a3;
}

- (int64_t)overlayToken
{
  return self->_overlayToken;
}

- (void)setOverlayToken:(int64_t)a3
{
  self->_overlayToken = a3;
}

- (BOOL)isEnhancedJBAdaptationsEnabled
{
  return self->_isEnhancedJBAdaptationsEnabled;
}

- (void)setIsEnhancedJBAdaptationsEnabled:(BOOL)a3
{
  self->_isEnhancedJBAdaptationsEnabled = a3;
}

- (BOOL)isRTCPForLossFeedbackEnabled
{
  return self->_isRTCPForLossFeedbackEnabled;
}

- (void)setIsRTCPForLossFeedbackEnabled:(BOOL)a3
{
  self->_isRTCPForLossFeedbackEnabled = a3;
}

- (BOOL)rtcpPSFB_LTRAckEnabled
{
  return self->_rtcpPSFB_LTRAckEnabled;
}

- (void)setRtcpPSFB_LTRAckEnabled:(BOOL)a3
{
  self->_rtcpPSFB_LTRAckEnabled = a3;
}

- (unsigned)nackGeneratorStorebagConfigVersion
{
  return self->_nackGeneratorStorebagConfigVersion;
}

- (void)setNackGeneratorStorebagConfigVersion:(unsigned int)a3
{
  self->_nackGeneratorStorebagConfigVersion = a3;
}

- (BOOL)isExtraDelayForPacketRetransmissionsEnabled
{
  return self->_isExtraDelayForPacketRetransmissionsEnabled;
}

- (void)setIsExtraDelayForPacketRetransmissionsEnabled:(BOOL)a3
{
  self->_isExtraDelayForPacketRetransmissionsEnabled = a3;
}

- (BOOL)isRedundancyControlEnabled
{
  return self->_isRedundancyControlEnabled;
}

- (void)setIsRedundancyControlEnabled:(BOOL)a3
{
  self->_isRedundancyControlEnabled = a3;
}

- (unsigned)maxRedundancyPercentage
{
  return self->_maxRedundancyPercentage;
}

- (void)setMaxRedundancyPercentage:(unsigned int)a3
{
  self->_maxRedundancyPercentage = a3;
}

- (unsigned)redundancyControllerMode
{
  return self->_redundancyControllerMode;
}

- (void)setRedundancyControllerMode:(unsigned int)a3
{
  self->_redundancyControllerMode = a3;
}

- (unsigned)redundancyControllerFECVersion
{
  return self->_redundancyControllerFECVersion;
}

- (void)setRedundancyControllerFECVersion:(unsigned __int8)a3
{
  self->_redundancyControllerFECVersion = a3;
}

- (int)accessNetworkType
{
  return self->_accessNetworkType;
}

- (void)setAccessNetworkType:(int)a3
{
  self->_accessNetworkType = a3;
}

@end
