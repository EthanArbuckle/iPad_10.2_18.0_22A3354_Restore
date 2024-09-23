@implementation VCAudioTransmitter

- (void)redundancyController:(id)a3 redundancyIntervalDidChange:(double)a4
{
  int v5;

  self->_redundancyInterval = a4;
  v5 = -[VCDefaults forceRedMaxDelay](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance", a3), "forceRedMaxDelay");
  if (v5)
    self->_redundancyInterval = (double)(20 * v5);
}

- (VCAudioTransmitter)initWithConfig:(id)a3
{
  char *v4;
  __CFString *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  char *v9;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
  os_log_t *v14;
  uint64_t v15;
  NSObject *v16;
  CFTypeRef v17;
  _OWORD *v18;
  __int128 v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  CFTypeRef v24;
  const void *v25;
  const void *v26;
  id v27;
  id v28;
  id v29;
  int v30;
  int v31;
  float v32;
  const char *v33;
  char *v34;
  os_log_t *v35;
  uint64_t v36;
  NSObject *v37;
  char *__lasts;
  char *__str;
  objc_super v41;
  uint8_t buf[56];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)VCAudioTransmitter;
  v4 = -[VCAudioTransmitter init](&v41, sel_init);
  if (!v4)
    return (VCAudioTransmitter *)v4;
  if ((char *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_28;
    __str = 0;
    v6 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "Initializing with config=%s", v6);
    if (!__str)
      goto LABEL_28;
    __lasts = 0;
    v13 = strtok_r(__str, "\n", &__lasts);
    v14 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioTransmitter initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 159;
          *(_WORD *)&buf[28] = 2080;
          *(_QWORD *)&buf[30] = "";
          *(_WORD *)&buf[38] = 2080;
          *(_QWORD *)&buf[40] = v13;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v13 = strtok_r(0, "\n", &__lasts);
    }
    while (v13);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (__CFString *)objc_msgSend(v4, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_28;
    __str = 0;
    v7 = (const char *)-[__CFString UTF8String](v5, "UTF8String");
    v8 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
    asprintf(&__str, "%s(%p) Initializing with config=%s", v7, v4, v8);
    if (!__str)
      goto LABEL_28;
    __lasts = 0;
    v9 = strtok_r(__str, "\n", &__lasts);
    v10 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioTransmitter initWithConfig:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 159;
          *(_WORD *)&buf[28] = 2080;
          *(_QWORD *)&buf[30] = "";
          *(_WORD *)&buf[38] = 2080;
          *(_QWORD *)&buf[40] = v9;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
        }
      }
      v9 = strtok_r(0, "\n", &__lasts);
    }
    while (v9);
  }
  free(__str);
LABEL_28:
  *((_QWORD *)v4 + 36) = objc_msgSend(a3, "rtpHandle");
  v17 = (CFTypeRef)objc_msgSend(a3, "controlInfoGenerator");
  if (v17)
    v17 = CFRetain(v17);
  *((_QWORD *)v4 + 40) = v17;
  *((_QWORD *)v4 + 44) = objc_msgSend((id)objc_msgSend(a3, "audioPayloads"), "mutableCopy");
  *((_QWORD *)v4 + 46) = objc_msgSend(a3, "chosenAudioPayload");
  *((_QWORD *)v4 + 45) = objc_msgSend(a3, "chosenDTXPayload");
  v4[336] = objc_msgSend(a3, "isRedEnabled");
  *((_DWORD *)v4 + 94) = objc_msgSend(a3, "chosenRedPayloadType");
  v4[337] = objc_msgSend(a3, "includeRedSequenceOffset");
  *((_DWORD *)v4 + 85) = objc_msgSend(a3, "redNumPayloads");
  *((_DWORD *)v4 + 86) = objc_msgSend(a3, "redMaxDelay20ms");
  v4[328] = objc_msgSend(a3, "useRateControl");
  v4[329] = objc_msgSend(a3, "isUseCaseWatchContinuity");
  v4[330] = objc_msgSend(a3, "allowAudioSwitching");
  *((_QWORD *)v4 + 37) = objc_msgSend(a3, "afrcHandle");
  *((_DWORD *)v4 + 111) = objc_msgSend(a3, "operatingMode");
  v4[331] = objc_msgSend(a3, "supportsAdaptation");
  v4[332] = objc_msgSend(a3, "needsPacketThread");
  *((_QWORD *)v4 + 56) = objc_msgSend(a3, "transportSession");
  *((_QWORD *)v4 + 38) = objc_msgSend(a3, "mediaQueue");
  *((_QWORD *)v4 + 39) = objc_msgSend(a3, "rtpVideo");
  v18 = v4 + 384;
  if (a3)
    objc_msgSend(a3, "inputFormat");
  else
    memset(buf, 0, 48);
  v19 = *(_OWORD *)&buf[16];
  *v18 = *(_OWORD *)buf;
  *((_OWORD *)v4 + 25) = v19;
  *((_OWORD *)v4 + 26) = *(_OWORD *)&buf[32];
  *((_QWORD *)v4 + 31) = objc_msgSend(a3, "statisticsCollector");
  v4[348] = objc_msgSend(a3, "transmitROC");
  v4[464] = objc_msgSend(a3, "ignoreSilence");
  *((_DWORD *)v4 + 52) = 100000;
  *((_DWORD *)v4 + 117) = objc_msgSend(a3, "tierNetworkBitrate");
  *((_DWORD *)v4 + 172) = objc_msgSend(a3, "maxIDSStreamIdCount");
  *((_QWORD *)v4 + 87) = (id)objc_msgSend(a3, "supportedNumRedundantPayload");
  v4[472] = objc_msgSend(a3, "sendActiveVoiceOnly");
  v4[704] = objc_msgSend(a3, "isCurrentDTXEnabled");
  v4[705] = objc_msgSend(a3, "mediaControlInfoVersion");
  v4[706] = objc_msgSend(a3, "alwaysOnAudioRedundancyEnabled");
  v4[707] = objc_msgSend(a3, "cellularAllowRedLowBitratesEnabled");
  v4[708] = objc_msgSend(a3, "wifiAllowRedLowBitratesEnabled");
  *((_QWORD *)v4 + 90) = objc_msgSend(a3, "remoteIDSParticipantID");
  v4[728] = objc_msgSend(a3, "useChannelDataFormat");
  *((_DWORD *)v4 + 119) = objc_msgSend(a3, "qualityIndex");
  v4[729] = objc_msgSend(a3, "useWifiTiers");
  v4[730] = objc_msgSend(a3, "supportsCodecBandwidthUpdate");
  v4[916] = objc_msgSend(a3, "tierPickerMode");
  v4[972] = objc_msgSend(a3, "targetBitrateIsAudioOnly");
  if (objc_msgSend(a3, "maxAudioPacketSize"))
    v20 = objc_msgSend(a3, "maxAudioPacketSize");
  else
    v20 = 1280;
  *((_DWORD *)v4 + 24) = v20;
  v21 = objc_msgSend(a3, "constantTransportOverhead");
  *((_DWORD *)v4 + 25) = v21;
  if (v4[728])
  {
    if (v21)
      v22 = *((_DWORD *)v4 + 25)
          + VCNetworkUtils_AdditionalOverheadForIDSOptions(*((_DWORD *)v4 + 172), 1, 0);
    else
      v22 = VCNetworkUtils_WorstCaseIDSOverheadForOptions(*((_DWORD *)v4 + 172), 1, 0);
    *((_DWORD *)v4 + 25) = v22;
    v4[687] = 1;
  }
  v23 = *((_QWORD *)v4 + 90);
  if (v23)
  {
    v4[638] = 1;
    *((_QWORD *)v4 + 80) = v23;
  }
  v24 = (CFTypeRef)objc_msgSend(a3, "sframeCryptor");
  if (v24)
    v24 = CFRetain(v24);
  *((_QWORD *)v4 + 105) = v24;
  *((_DWORD *)v4 + 242) = objc_msgSend(a3, "packetExpirationTime");
  *((_DWORD *)v4 + 120) = objc_msgSend(a3, "ratType");
  v25 = (const void *)*((_QWORD *)v4 + 54);
  v26 = (const void *)objc_msgSend(a3, "reportingAgent");
  *((_QWORD *)v4 + 54) = v26;
  if (v26)
    CFRetain(v26);
  if (v25)
    CFRelease(v25);
  *((_DWORD *)v4 + 110) = VCReporting_GetDynamicReportingModuleID();
  objc_msgSend(a3, "reportingParentID");
  reportingInheritModuleSpecificInfoFromParent();
  *((_QWORD *)v4 + 89) = VCMemoryPool_Create(0x640uLL);
  v27 = *((id *)v4 + 45);
  v28 = *((id *)v4 + 56);
  v29 = *((id *)v4 + 31);
  *((_QWORD *)v4 + 1) = -[VCPacketBundler initWithOperatingMode:bundlingScheme:]([VCPacketBundler alloc], "initWithOperatingMode:bundlingScheme:", *((unsigned int *)v4 + 111), objc_msgSend(a3, "bundlingScheme"));
  objc_msgSend(*((id *)v4 + 1), "setPacketsPerBundle:", objc_msgSend(a3, "packetsPerBundle"));
  *((_QWORD *)v4 + 2) = -[VCPacketBundler initWithOperatingMode:bundlingScheme:]([VCPacketBundler alloc], "initWithOperatingMode:bundlingScheme:", *((unsigned int *)v4 + 111), objc_msgSend(a3, "bundlingScheme"));
  objc_msgSend(*((id *)v4 + 2), "setPacketsPerBundle:", objc_msgSend(a3, "packetsPerBundle"));
  v4[908] = 0;
  *((_DWORD *)v4 + 228) = 0;
  *((_DWORD *)v4 + 226) = 128;
  objc_msgSend(v4, "initAudioValues");
  *((_QWORD *)v4 + 3) = -[VCAudioRedBuilder initWithRedPayloadType:sampleRate:samplesPerFrame:numPayloads:maxDelay:includeSequenceOffset:]([VCAudioRedBuilder alloc], "initWithRedPayloadType:sampleRate:samplesPerFrame:numPayloads:maxDelay:includeSequenceOffset:", *((unsigned int *)v4 + 94), *((double *)v4 + 48), *((unsigned int *)v4 + 106), *((unsigned int *)v4 + 85), *((unsigned int *)v4 + 86), v4[337]);
  if (objc_msgSend(a3, "shouldCreateRedundancyController"))
    *((_QWORD *)v4 + 4) = -[VCRedundancyControllerAudio initWithDelegate:statisticsCollector:mode:]([VCRedundancyControllerAudio alloc], "initWithDelegate:statisticsCollector:mode:", v4, *((_QWORD *)v4 + 31), objc_msgSend(v4, "redundancyControllerModeForOperatingMode:isRedEnabled:isHigherAudioREDCutoverU1Enabled:", *((unsigned int *)v4 + 111), v4[336], objc_msgSend(a3, "isHigherAudioREDCutoverU1Enabled")));
  v30 = -[VCDefaults forceRedNumPayloads](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceRedNumPayloads");
  if (v30)
    *((_DWORD *)v4 + 56) = 100 * v30;
  v31 = -[VCDefaults forceRedMaxDelay](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceRedMaxDelay");
  if (v31)
    *((double *)v4 + 29) = (double)(20 * v31);
  v32 = *((double *)v4 + 48);
  *((float *)v4 + 28) = (float)*((unsigned int *)v4 + 106) / v32;
  objc_msgSend(*((id *)v4 + 1), "setMaxPacketSize:", 1600);
  objc_msgSend(*((id *)v4 + 2), "setMaxPacketSize:", 1600);
  *((_DWORD *)v4 + 239) = RTPGetTimestampBase();
  objc_msgSend(v4, "setStreamIDs:", objc_msgSend(a3, "streamIDs"));
  v4[960] = VCDefaults_GetBoolValueForKey(CFSTR("shouldApplyRedAsBoolean"), objc_msgSend(a3, "shouldApplyRedAsBoolean"));
  *((_QWORD *)v4 + 106) = 0;
  if (objc_msgSend(a3, "audioIssueDetectorEnabled"))
    objc_msgSend(v4, "audioIssueDetectorCreateAndConfigure");
  v4[880] = objc_msgSend(a3, "audioDumpEnabled");
  *((_QWORD *)v4 + 112) = v18;
  *((_DWORD *)v4 + 221) = objc_msgSend((id)objc_msgSend(*((id *)v4 + 46), "config"), "payload");
  v4[888] = objc_msgSend((id)objc_msgSend(*((id *)v4 + 46), "config"), "payloadOctetAligned");
  v4[889] = objc_msgSend((id)objc_msgSend(*((id *)v4 + 46), "config"), "evsHeaderFullOnly");
  v4[600] = 0;
  *((_OWORD *)v4 + 54) = 0u;
  v4[917] = objc_msgSend(a3, "ramStadSRCEnabled");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    __str = 0;
    v33 = objc_opt_class()
        ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
        : "<nil>";
    asprintf(&__str, "%s[%p] %s", v33, v4, (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
    if (__str)
    {
      __lasts = 0;
      v34 = strtok_r(__str, "\n", &__lasts);
      v35 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v36 = VRTraceErrorLogLevelToCSTR();
          v37 = *v35;
          if (os_log_type_enabled(*v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCAudioTransmitter initWithConfig:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 280;
            *(_WORD *)&buf[28] = 2080;
            *(_QWORD *)&buf[30] = "-[VCAudioTransmitter initWithConfig:]";
            *(_WORD *)&buf[38] = 2080;
            *(_QWORD *)&buf[40] = v34;
            _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v34 = strtok_r(0, "\n", &__lasts);
      }
      while (v34);
      free(__str);
    }
  }
  return (VCAudioTransmitter *)v4;
}

- (unsigned)redundancyControllerModeForOperatingMode:(int)a3 isRedEnabled:(BOOL)a4 isHigherAudioREDCutoverU1Enabled:(BOOL)a5
{
  int v5;
  int v6;
  int v7;
  unsigned int v8;

  v5 = 1 << a3;
  if (a5)
    v6 = 3;
  else
    v6 = 2;
  if (!a4)
    v6 = 1;
  if ((v5 & 0x86) != 0)
    v7 = v6;
  else
    v7 = 4;
  if ((v5 & 0x3F39) != 0)
    v8 = 0;
  else
    v8 = v7;
  if (a3 <= 0xD)
    return v8;
  else
    return 4;
}

- (void)initAudioValues
{
  unint64_t v2;

  self->_lastIsTalking = 1;
  self->_lastUpdateQualityIndicator = 0.0;
  self->_qualityIndicator = 0;
  self->_audioTierChangeRequestCount = 0;
  self->_lastTierSwitch = 0.0;
  self->_audioTxBitrate = 32000;
  LODWORD(v2) = self->_inputFormat.samplesPerFrame;
  self->_audioInterval = (double)v2 / self->_inputFormat.format.mSampleRate;
  self->_lastSentAudioSampleTime = 0;
  self->_inputMeter = 0;
  self->_audioHeaderSize = -1;
  self->_audioTierChangeCount = 0;
  self->_sendSilenceSamplesEnabled = 0;
  self->_firstSilencePacketTimeStamp = NAN;
}

- (void)dealloc
{
  opaqueRTCReporting *reportingAgent;
  char *lastInputSampleBuffer;
  void *controlInfoGenerator;
  tagVCCryptor *sframeCryptor;
  OSQueueHead *audioBundlePool;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  reportingUnregisterPeriodicTask();
  reportingCacheModuleSpecificInfo();
  reportingAgent = self->_reportingAgent;
  if (reportingAgent)
    CFRelease(reportingAgent);

  objc_storeWeak(&self->_delegate, 0);
  lastInputSampleBuffer = self->_lastInputSampleBuffer;
  if (lastInputSampleBuffer)
    free(lastInputSampleBuffer);

  -[VCRedundancyControllerAudio unregisterStatistics](self->_redundancyController, "unregisterStatistics");
  controlInfoGenerator = self->_controlInfoGenerator;
  if (controlInfoGenerator)
    CFRelease(controlInfoGenerator);
  sframeCryptor = self->_sframeCryptor;
  if (sframeCryptor)
    CFRelease(sframeCryptor);
  VCAudioBufferList_Destroy((uint64_t *)&self->_encodeBuffer);
  audioBundlePool = (OSQueueHead *)self->_audioBundlePool;
  if (audioBundlePool)
  {
    VCMemoryPool_Destroy(audioBundlePool);
    self->_audioBundlePool = 0;
  }
  if (self->_audioIssueDetector)
    -[VCAudioTransmitter audioIssueDetectorStopAndFinalize](self, "audioIssueDetectorStopAndFinalize");
  VCAudioDump_Finalize((void **)&self->_encoderOutAudioDump);
  VCAudioDump_Finalize((void **)&self->_encoderInAudioDump);
  v8.receiver = self;
  v8.super_class = (Class)VCAudioTransmitter;
  -[VCAudioTransmitter dealloc](&v8, sel_dealloc);
}

- (VCAudioTransmitterDelegate)delegate
{
  return (VCAudioTransmitterDelegate *)objc_loadWeak(&self->_delegate);
}

- (VCAudioPayloadConfig)currentAudioPayloadConfig
{
  return -[VCAudioPayload config](self->_currentAudioPayload, "config");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (BOOL)shouldUpdateCodecBitrate:(_VCAudioCodecModeChangeEvent *)a3
{
  int payload;
  NSArray *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  int codecRateMode;
  unsigned int codecBitrate;
  const char *v12;
  uint64_t v13;
  int v14;
  int v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  NSArray *v21;
  unsigned int v22;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  VCAudioTransmitter *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  NSArray *v35;
  __int16 v36;
  unsigned int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a3->codecBitrate)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_18;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    codecRateMode = a3->codecRateMode;
    codecBitrate = a3->codecBitrate;
    v24 = 136316418;
    v25 = v8;
    v26 = 2080;
    v27 = "-[VCAudioTransmitter shouldUpdateCodecBitrate:]";
    v28 = 1024;
    v29 = 379;
    v30 = 2048;
    v31 = self;
    v32 = 1024;
    v33 = codecRateMode;
    v34 = 1024;
    LODWORD(v35) = codecBitrate;
    v12 = " [%s] %s:%d VCAudioTransmitter[%p] Codec rate mode change request had incorrect bitrate: mode=%u, bitrate=%u";
LABEL_13:
    v16 = v9;
    v17 = 50;
LABEL_17:
    _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v24, v17);
    goto LABEL_18;
  }
  if (-[VCAudioPayload bitrate](self->_currentAudioPayload, "bitrate") == a3->codecBitrate)
    goto LABEL_18;
  payload = a3->payload;
  if (payload != -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "payload"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_18;
    v13 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    v14 = a3->payload;
    v15 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "payload");
    v24 = 136316418;
    v25 = v13;
    v26 = 2080;
    v27 = "-[VCAudioTransmitter shouldUpdateCodecBitrate:]";
    v28 = 1024;
    v29 = 382;
    v30 = 2048;
    v31 = self;
    v32 = 1024;
    v33 = v14;
    v34 = 1024;
    LODWORD(v35) = v15;
    v12 = " [%s] %s:%d VCAudioTransmitter[%p] Payload in codec mode change event does not match current payload: payload="
          "%d, currentPayload=%d";
    goto LABEL_13;
  }
  v6 = -[VCAudioPayloadConfig supportedBitrates](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "supportedBitrates");
  if (-[NSArray containsObject:](v6, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->codecBitrate)))
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    v20 = a3->payload;
    v21 = -[VCAudioPayloadConfig supportedBitrates](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "supportedBitrates");
    v22 = a3->codecBitrate;
    v24 = 136316674;
    v25 = v18;
    v26 = 2080;
    v27 = "-[VCAudioTransmitter shouldUpdateCodecBitrate:]";
    v28 = 1024;
    v29 = 385;
    v30 = 2048;
    v31 = self;
    v32 = 1024;
    v33 = v20;
    v34 = 2112;
    v35 = v21;
    v36 = 1024;
    v37 = v22;
    v12 = " [%s] %s:%d VCAudioTransmitter[%p] Attempting to update to an unsupported codec bitrate: payload=%d, supported"
          "Bitrates=%@, bitrate=%d";
    v16 = v19;
    v17 = 60;
    goto LABEL_17;
  }
LABEL_18:
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)shouldUpdateCodecBandwidth:(_VCAudioCodecModeChangeEvent *)a3
{
  int payload;
  int codecBandwidth;
  NSArray *v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  NSArray *v19;
  int v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  VCAudioTransmitter *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  NSArray *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  payload = a3->payload;
  if (payload == -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "payload"))
  {
    codecBandwidth = a3->codecBandwidth;
    if (codecBandwidth != -[VCAudioPayload bandwidth](self->_currentAudioPayload, "bandwidth"))
    {
      v7 = -[VCAudioPayloadConfig supportedBandwidths](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "supportedBandwidths");
      if (-[NSArray containsObject:](v7, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->codecBandwidth)))
      {
        LOBYTE(v8) = 1;
        return v8;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v8)
          return v8;
        v18 = a3->payload;
        v19 = -[VCAudioPayloadConfig supportedBandwidths](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "supportedBandwidths");
        v20 = a3->codecBandwidth;
        v22 = 136316674;
        v23 = v16;
        v24 = 2080;
        v25 = "-[VCAudioTransmitter shouldUpdateCodecBandwidth:]";
        v26 = 1024;
        v27 = 400;
        v28 = 2048;
        v29 = self;
        v30 = 1024;
        v31 = v18;
        v32 = 2112;
        v33 = v19;
        v34 = 1024;
        v35 = v20;
        v13 = " [%s] %s:%d VCAudioTransmitter[%p] Attempting to update to an unsupported codec bandwidth: payload=%d, sup"
              "portedBandwidths=%@, bitrate=%d";
        v14 = v17;
        v15 = 60;
LABEL_12:
        _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v22, v15);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v8)
      return v8;
    v11 = a3->payload;
    v12 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "payload");
    v22 = 136316418;
    v23 = v9;
    v24 = 2080;
    v25 = "-[VCAudioTransmitter shouldUpdateCodecBandwidth:]";
    v26 = 1024;
    v27 = 396;
    v28 = 2048;
    v29 = self;
    v30 = 1024;
    v31 = v11;
    v32 = 1024;
    LODWORD(v33) = v12;
    v13 = " [%s] %s:%d VCAudioTransmitter[%p] Payload in codec mode change event does not match current payload: payload="
          "%d currentPayload=%d";
    v14 = v10;
    v15 = 50;
    goto LABEL_12;
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (BOOL)isCodecModeChangeRequestValid:(_VCAudioCodecModeChangeEvent *)a3
{
  _BOOL4 v5;
  BOOL v6;
  BOOL result;
  NSArray *v8;

  v5 = +[VCPayloadUtils isCodecModeSupported:forBandwidth:withPayload:](VCPayloadUtils, "isCodecModeSupported:forBandwidth:withPayload:", a3->codecRateMode, a3->codecBandwidth, a3->payload);
  v6 = +[VCPayloadUtils skipBandWidthCheckForCodecRateModes:supportedBitrates:](VCPayloadUtils, "skipBandWidthCheckForCodecRateModes:supportedBitrates:", a3->payload, -[VCAudioPayloadConfig supportedBitrates](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "supportedBitrates"));
  result = v6 && v5;
  if (!v6 && v5)
  {
    if (-[VCAudioPayload bandwidth](self->_currentAudioPayload, "bandwidth") == a3->codecBandwidth)
    {
      return 1;
    }
    else
    {
      v8 = -[VCAudioPayloadConfig supportedBandwidths](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "supportedBandwidths");
      return -[NSArray containsObject:](v8, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3->codecBandwidth));
    }
  }
  return result;
}

- (void)handleCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3 didUpdateBandwidth:(BOOL *)a4 didUpdateBitrate:(BOOL *)a5
{
  _BOOL4 v9;
  unsigned int offset;
  BOOL v11;
  int v12;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  unsigned int indicator;
  _BOOL4 v19;
  uint64_t v20;
  NSObject *v21;
  int payload;
  int codecRateMode;
  int codecBandwidth;
  _BOOL4 v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  int v29;
  unsigned int codecBitrate;
  uint64_t v31;
  NSObject *v32;
  _VCAudioCodecModeChangeEvent v33;
  int v34;
  __int16 v35;
  VCAudioTransmitter *v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  unsigned int v40;
  __int16 v41;
  unsigned int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v33 = *a3;
  if (-[VCAudioTransmitter isCodecModeChangeRequestValid:](self, "isCodecModeChangeRequestValid:", &v33))
  {
    v9 = +[VCPayloadUtils isEVSPayload:](VCPayloadUtils, "isEVSPayload:", a3->payload);
    offset = a3->RFParams.offset;
    v11 = offset > 7;
    v12 = (1 << offset) & 0xAC;
    if (!v11 && v12 != 0 && a3->RFParams.indicator < 2 && v9)
    {
      if (-[VCAudioPayload setEVSRFParams:](self->_currentAudioPayload, "setEVSRFParams:", &a3->RFParams))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v17 = a3->RFParams.offset;
            indicator = a3->RFParams.indicator;
            v33.payload = 136316418;
            *(_QWORD *)&v33.codecRateMode = v15;
            LOWORD(v33.codecBitrate) = 2080;
            *(_QWORD *)((char *)&v33.codecBitrate + 2) = "-[VCAudioTransmitter handleCodecModeChangeEvent:didUpdateBandwi"
                                                         "dth:didUpdateBitrate:]";
            HIWORD(v33.RFParams.indicator) = 1024;
            v34 = 439;
            v35 = 2048;
            v36 = self;
            v37 = 1024;
            v38 = v17;
            v39 = 1024;
            v40 = indicator;
            _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioTransmitter[%p] EVSCodec rfparams change requested offset=%u indicator=%u ", (uint8_t *)&v33, 0x32u);
          }
        }
      }
    }
    if (self->_supportsCodecBandwidthUpdate)
    {
      v33 = *a3;
      if (-[VCAudioTransmitter shouldUpdateCodecBandwidth:](self, "shouldUpdateCodecBandwidth:", &v33))
      {
        v19 = -[VCAudioPayload setBandwidth:](self->_currentAudioPayload, "setBandwidth:", a3->codecBandwidth);
        if (a4)
        {
          if (v19)
          {
            *a4 = 1;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v20 = VRTraceErrorLogLevelToCSTR();
              v21 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                payload = a3->payload;
                codecRateMode = a3->codecRateMode;
                codecBandwidth = a3->codecBandwidth;
                v33.payload = 136316674;
                *(_QWORD *)&v33.codecRateMode = v20;
                LOWORD(v33.codecBitrate) = 2080;
                *(_QWORD *)((char *)&v33.codecBitrate + 2) = "-[VCAudioTransmitter handleCodecModeChangeEvent:didUpdateBa"
                                                             "ndwidth:didUpdateBitrate:]";
                HIWORD(v33.RFParams.indicator) = 1024;
                v34 = 446;
                v35 = 2048;
                v36 = self;
                v37 = 1024;
                v38 = payload;
                v39 = 1024;
                v40 = codecRateMode;
                v41 = 1024;
                v42 = codecBandwidth;
                _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioTransmitter[%p] Codec bandwidth change requested for payload=%u: mode=%u bandwidth=%u", (uint8_t *)&v33, 0x38u);
              }
            }
          }
        }
      }
    }
    v33 = *a3;
    if (-[VCAudioTransmitter shouldUpdateCodecBitrate:](self, "shouldUpdateCodecBitrate:", &v33))
    {
      v25 = -[VCAudioPayload setBitrate:](self->_currentAudioPayload, "setBitrate:", a3->codecBitrate);
      if (a5)
      {
        if (v25)
        {
          *a5 = 1;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v26 = VRTraceErrorLogLevelToCSTR();
            v27 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v28 = a3->payload;
              v29 = a3->codecRateMode;
              codecBitrate = a3->codecBitrate;
              v33.payload = 136316674;
              *(_QWORD *)&v33.codecRateMode = v26;
              LOWORD(v33.codecBitrate) = 2080;
              *(_QWORD *)((char *)&v33.codecBitrate + 2) = "-[VCAudioTransmitter handleCodecModeChangeEvent:didUpdateBand"
                                                           "width:didUpdateBitrate:]";
              HIWORD(v33.RFParams.indicator) = 1024;
              v34 = 453;
              v35 = 2048;
              v36 = self;
              v37 = 1024;
              v38 = v28;
              v39 = 1024;
              v40 = v29;
              v41 = 1024;
              v42 = codecBitrate;
              _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioTransmitter[%p] Codec rate mode change requested for payload=%u: mode=%u bitrate=%u", (uint8_t *)&v33, 0x38u);
            }
          }
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v31 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioTransmitter handleCodecModeChangeEvent:didUpdateBandwidth:didUpdateBitrate:].cold.1(v31, &a3->payload, v32);
  }
}

- (BOOL)sendCodecModeChangeEvent:(_VCAudioCodecModeChangeEvent *)a3
{
  VCAudioPayload *currentAudioPayload;
  _BOOL4 v6;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  int codecRateMode;
  int codecBandwidth;
  uint64_t v12;
  NSObject *v13;
  int v15;
  int v16;
  _VCAudioCodecModeChangeEvent v17;
  int v18;
  __int16 v19;
  VCAudioTransmitter *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  currentAudioPayload = self->_currentAudioPayload;
  v17 = *a3;
  v6 = -[VCAudioPayload setCodecModeRequest:](currentAudioPayload, "setCodecModeRequest:", &v17);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        codecRateMode = a3->codecRateMode;
        codecBandwidth = a3->codecBandwidth;
        v17.payload = 136316418;
        *(_QWORD *)&v17.codecRateMode = v8;
        LOWORD(v17.codecBitrate) = 2080;
        *(_QWORD *)((char *)&v17.codecBitrate + 2) = "-[VCAudioTransmitter sendCodecModeChangeEvent:]";
        HIWORD(v17.RFParams.indicator) = 1024;
        v18 = 463;
        v19 = 2048;
        v20 = self;
        v21 = 1024;
        v22 = codecRateMode;
        v23 = 1024;
        v24 = codecBandwidth;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioTransmitter[%p] Requested codec rate mode change: mode=%u bandwidth=%u", (uint8_t *)&v17, 0x32u);
      }
    }
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v15 = a3->codecRateMode;
      v16 = a3->codecBandwidth;
      v17.payload = 136316418;
      *(_QWORD *)&v17.codecRateMode = v12;
      LOWORD(v17.codecBitrate) = 2080;
      *(_QWORD *)((char *)&v17.codecBitrate + 2) = "-[VCAudioTransmitter sendCodecModeChangeEvent:]";
      HIWORD(v17.RFParams.indicator) = 1024;
      v18 = 465;
      v19 = 2048;
      v20 = self;
      v21 = 1024;
      v22 = v15;
      v23 = 1024;
      v24 = v16;
      _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCAudioTransmitter[%p] Failed requesting codec rate mode change: mode=%u bandwidth=%u", (uint8_t *)&v17, 0x32u);
    }
  }
  return v6;
}

- (void)setCellTech:(int)a3 remoteCellular:(int)a4 isIPV6:(int)a5 audioCap:(unsigned int)a6
{
  _BOOL4 v6;
  int *p_audioTierChangeRequestCount;
  unsigned int v8;

  v6 = self->_isLocalCellular_LowestConnectionQuality != a3
    || self->_isRemoteCellular_LowestConnectionQuality != a4
    || self->_isConnectedOnIPv6_LowestConnectionQuality != a5
    || self->_currentAudioCap != a6;
  self->_isConnectedOnIPv6_LowestConnectionQuality = a5 != 0;
  self->_isLocalCellular_LowestConnectionQuality = a3 != 0;
  self->_isRemoteCellular_LowestConnectionQuality = a4 != 0;
  self->_currentAudioCap = a6;
  if (v6)
  {
    p_audioTierChangeRequestCount = &self->_audioTierChangeRequestCount;
    do
      v8 = __ldaxr((unsigned int *)p_audioTierChangeRequestCount);
    while (__stlxr(v8 + 1, (unsigned int *)p_audioTierChangeRequestCount));
  }
}

- (BOOL)setupEncoderBuffer
{
  NSMutableArray *audioPayloads;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  unsigned int v9;
  unsigned int j;
  __int128 v11;
  __int128 v13[2];
  uint64_t v14;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  audioPayloads = self->_audioPayloads;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (!v4)
    goto LABEL_14;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(audioPayloads);
      v9 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "config"), "samplesPerFrame");
      if (v9 > v6)
        v6 = v9;
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  }
  while (v5);
  if (v6)
  {
    for (j = 0; j < v6; j += self->_inputFormat.samplesPerFrame)
      ;
  }
  else
  {
LABEL_14:
    j = 0;
  }
  VCAudioBufferList_Destroy((uint64_t *)&self->_encodeBuffer);
  v11 = *(_OWORD *)&self->_inputFormat.format.mBytesPerPacket;
  v13[0] = *(_OWORD *)&self->_inputFormat.format.mSampleRate;
  v13[1] = v11;
  v14 = *(_QWORD *)&self->_inputFormat.format.mBitsPerChannel;
  return VCAudioBufferList_Allocate(v13, j, &self->_encodeBuffer);
}

- (BOOL)setupAudio:(id *)a3
{
  tagVCAudioDumpPayloadInfo *p_payloadInfo;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  id *v10;
  uint64_t v11;

  p_payloadInfo = &self->_payloadInfo;
  self->_encoderOutAudioDump = (tagVCAudioDump *)VCAudioDump_Create(1u, (uint64_t)&self->_payloadInfo);
  self->_encoderInAudioDump = (tagVCAudioDump *)VCAudioDump_Create(0, (uint64_t)p_payloadInfo);
  -[VCAudioTransmitter setupAudioHeaderSize](self, "setupAudioHeaderSize");
  if (!-[VCAudioTransmitter setupAudioTierPicker](self, "setupAudioTierPicker"))
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioTransmitter.m", 512);
    v8 = CFSTR("Couldn't setup audio selector");
    v9 = CFSTR("Bad audio payload?");
LABEL_12:
    v10 = a3;
    v11 = 227;
    goto LABEL_13;
  }
  -[VCAudioTransmitter logTierInfo:](self, "logTierInfo:", 0);
  if (-[VCAudioTransmitter setupAudioEncoders](self, "setupAudioEncoders"))
  {
    if (-[VCPacketBundler allocateBundleBuffer:](self->_audioBundler, "allocateBundleBuffer:", 1600)
      && -[VCPacketBundler allocateBundleBuffer:](self->_audioBundlerShortRED, "allocateBundleBuffer:", 1600)
      && -[VCAudioTransmitter allocateLastInputSampleBuffer:](self, "allocateLastInputSampleBuffer:", -[VCAudioTransmitter maximumSamplesPerFrame](self, "maximumSamplesPerFrame")))
    {
      if (-[VCAudioTransmitter setupEncoderBuffer](self, "setupEncoderBuffer"))
        return 1;
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioTransmitter.m", 545);
      v8 = CFSTR("Couldn't allocate encode buffer for audio");
    }
    else
    {
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioTransmitter.m", 535);
      v8 = CFSTR("Couldn't allocate memory for audio");
    }
    v9 = CFSTR("Malloc?");
    goto LABEL_12;
  }
  v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioTransmitter.m", 524);
  v8 = CFSTR("Couldn't setup encoder.");
  v9 = CFSTR("Bad remote payload?");
  v10 = a3;
  v11 = 226;
LABEL_13:
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v10, 32016, v11, v7, v8, v9);
  return 0;
}

- (void)updateAudioTxRate
{
  double v3;
  double lastReportingCallbackTimeShort;
  double v5;
  unsigned int *networkBitrate;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  double v10;

  v3 = micro();
  lastReportingCallbackTimeShort = self->_lastReportingCallbackTimeShort;
  v5 = v3 - lastReportingCallbackTimeShort;
  self->_lastReportingCallbackTimeShort = v3;
  networkBitrate = self->_currentChannelMetrics.networkBitrate;
  *(_OWORD *)&self->_currentChannelMetrics.networkBitrate[1] = *(_OWORD *)self->_currentChannelMetrics.networkBitrate;
  if (v3 - lastReportingCallbackTimeShort >= 0.5)
  {
    v8 = -[VCAudioTransmitter sentAudioBytesShort](self, "sentAudioBytesShort");
    HIDWORD(lastReportingCallbackTimeShort) = 1083129856;
    v7 = ((double)(8 * v8) / v5 / 1000.0 + 0.5);
  }
  else
  {
    v7 = 0;
  }
  v9 = 0;
  *networkBitrate = v7;
  v10 = 0.0;
  do
  {
    LODWORD(lastReportingCallbackTimeShort) = networkBitrate[v9];
    lastReportingCallbackTimeShort = (double)*(unint64_t *)&lastReportingCallbackTimeShort;
    v10 = v10 + lastReportingCallbackTimeShort;
    ++v9;
  }
  while (v9 != 5);
  self->_currentChannelMetrics.averageNetworkBitrate = (v10 / 5.0);
}

- (BOOL)isStandaloneStreamMode
{
  return (self->_operatingMode < 0xDu) & (0x1820u >> self->_operatingMode);
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  double v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t lastReportedRTPIngresspackets;
  unint64_t v12;
  __CFDictionary *v13;
  unint64_t v14;
  void *v15;
  unsigned int *p_audioTierChangeCount;
  uint64_t v17;
  unint64_t v18;
  int *audioIssueDetector;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  NSObject *v23;
  unint64_t v24;
  unsigned int redNumPayloads;
  unsigned int qualityIndex;
  double v27;
  int v28;
  unsigned int targetBitrate;
  unsigned int currentTargetBitrate;
  _BOOL4 supportsAdaptation;
  double v32;
  double v33;
  unsigned int v34;
  unint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  VCAudioTransmitter *v43;
  __int16 v44;
  _BYTE v45[20];
  __int16 v46;
  unsigned int v47;
  __int16 v48;
  unsigned int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  unsigned int v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  unsigned int v57;
  __int16 v58;
  unsigned int v59;
  __int16 v60;
  _BOOL4 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[VCAudioTransmitter updateAudioTxRate](self, "updateAudioTxRate");
  if (a3)
  {
    v5 = micro();
    v6 = v5 - self->_lastReportingCallbackTime;
    self->_lastReportingCallbackTime = v5;
    if (v6 >= 0.5)
    {
      v10 = ((double)(8 * -[VCAudioTransmitter encodedBytes](self, "encodedBytes")) / v6 / 1000.0 + 0.5);
      v9 = ((double)(8 * -[VCAudioTransmitter sentAudioBytes](self, "sentAudioBytes")) / v6 / 1000.0 + 0.5);
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v37 = v7;
          v38 = 2080;
          v39 = "-[VCAudioTransmitter gatherRealtimeStats:]";
          v40 = 1024;
          v41 = 592;
          v42 = 2048;
          v43 = self;
          v44 = 2048;
          *(double *)v45 = v6;
          *(_WORD *)&v45[8] = 2048;
          *(_QWORD *)&v45[10] = 0x3FE0000000000000;
          _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d [%p] Failed to compute audio Tx bit rate because timePeriod=%fs < (AUDIO_TRANSMITTER_MIN_BITRATE_REPORT_PERIOD=%fs)", buf, 0x3Au);
        }
      }
      v9 = 0;
      v10 = 0;
    }
    self->_currentChannelMetrics.averageMediaBitrate = 0;
    v35 = 0;
    RTPGetUplinkReportingStats((uint64_t)self->_rtpHandle, &v35);
    lastReportedRTPIngresspackets = self->_lastReportedRTPIngresspackets;
    if (v35 <= lastReportedRTPIngresspackets)
      lastReportedRTPIngresspackets = 0;
    v12 = v35 - lastReportedRTPIngresspackets;
    v13 = (__CFDictionary *)selectDestinationForRTMetrics();
    CFDictionaryAddValue(v13, CFSTR("RTPUplinkIngressAudioPkts"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12));
    CFDictionaryAddValue(v13, CFSTR("ATxR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9));
    LODWORD(v14) = self->_currentDuplication;
    CFDictionaryAddValue(v13, CFSTR("AFEC"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v14 / 100.0));
    CFDictionaryAddValue(v13, CFSTR("ATxRPrimary"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10));
    CFDictionaryAddValue(v13, CFSTR("ATxEncodedBitrate"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_actualAudioSendingBitrateNoRED));
    CFDictionaryAddValue(v13, CFSTR("VCASRedundancyLevel"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_redNumPayloads));
    CFDictionaryAddValue(v13, CFSTR("QID"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_qualityIndex));
    CFDictionaryAddValue(v13, CFSTR("ATCC"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_inputFormat.format.mChannelsPerFrame));
    CFDictionaryAddValue(v13, CFSTR("RedPayloadsAlt"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tierInfo.redPayloads));
    CFDictionaryAddValue(v13, CFSTR("RedMaxDelayAlt"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tierInfo.redMaxDelay));
    CFDictionaryAddValue(v13, CFSTR("REDPayloadBitrate"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tierInfo.redPayloadBitrate));
    CFDictionaryAddValue(v13, CFSTR("PayloadAlt"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tierInfo.codecPayload));
    CFDictionaryAddValue(v13, CFSTR("BitRateAlt"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tierInfo.codecBitrate));
    CFDictionaryAddValue(v13, CFSTR("BundleAlt"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_tierInfo.bundling));
    v15 = (void *)MEMORY[0x1E0CB37E8];
    p_audioTierChangeCount = &self->_audioTierChangeCount;
    do
      v17 = __ldaxr(p_audioTierChangeCount);
    while (__stlxr(0, p_audioTierChangeCount));
    CFDictionaryAddValue(v13, CFSTR("ATierChangeCount"), (const void *)objc_msgSend(v15, "numberWithUnsignedInt:", v17));
    if (-[VCAudioTransmitter isStandaloneStreamMode](self, "isStandaloneStreamMode"))
    {
      LODWORD(v18) = self->_targetBitrate;
      CFDictionaryAddValue(v13, CFSTR("TTxR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v18 / 1000.0));
    }
    v34 = 0;
    RTPGetPacketSent((uint64_t)self->_rtpHandle, &v34);
    v33 = 0.0;
    AFRCGetAudioPauseTime((uint64_t)self->_afrc, &v33);
    v32 = NAN;
    AFRCGetAudioMaxPauseTimes((uint64_t)self->_afrc, &v32);
    CFDictionaryAddValue(v13, CFSTR("APT"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v33));
    CFDictionaryAddValue(v13, CFSTR("APSM"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32));
    CFDictionaryAddValue(v13, CFSTR("APS"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v34));
    audioIssueDetector = (int *)self->_audioIssueDetector;
    if (audioIssueDetector)
    {
      *(_WORD *)buf = 0;
      VCAudioIssueDetector_GetReportingStats(audioIssueDetector, buf);
    }
    self->_lastReportedRTPIngresspackets = v35;
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("streamIDsCount=%d "), self->_idsChannelDataFormat.numOfStreamIDs);
    if (self->_idsChannelDataFormat.numOfStreamIDs)
    {
      v21 = 0;
      do
      {
        objc_msgSend(v20, "appendFormat:", CFSTR("StreamID%d=%d "), v21, self->_idsChannelDataFormat.streamIDs[v21]);
        ++v21;
      }
      while (v21 < self->_idsChannelDataFormat.numOfStreamIDs);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() > 5)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v24) = self->_currentDuplication;
        redNumPayloads = self->_redNumPayloads;
        qualityIndex = self->_qualityIndex;
        v27 = (double)v24 / 100.0;
        v28 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "payload");
        targetBitrate = self->_targetBitrate;
        currentTargetBitrate = self->_currentTargetBitrate;
        supportsAdaptation = self->_supportsAdaptation;
        *(_DWORD *)buf = 136318722;
        v37 = v22;
        v38 = 2080;
        v39 = "-[VCAudioTransmitter gatherRealtimeStats:]";
        v40 = 1024;
        v41 = 651;
        v42 = 2048;
        v43 = self;
        v44 = 1024;
        *(_DWORD *)v45 = v9;
        *(_WORD *)&v45[4] = 2048;
        *(double *)&v45[6] = v27;
        *(_WORD *)&v45[14] = 1024;
        *(_DWORD *)&v45[16] = v10;
        v46 = 1024;
        v47 = redNumPayloads;
        v48 = 1024;
        v49 = qualityIndex;
        v50 = 1024;
        v51 = v28;
        v52 = 1024;
        v53 = v34;
        v54 = 2112;
        v55 = v20;
        v56 = 1024;
        v57 = targetBitrate;
        v58 = 1024;
        v59 = currentTargetBitrate;
        v60 = 1024;
        v61 = supportsAdaptation;
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VCAudioTransmitter [%p] audioTxBitrate=%ukbps, audioFecTx=%f, primaryAudioTxRate=%ukbps, audioStreamRedundancyLevel=%u, _qualityIndex=%u, payload=%u, totalPacketsSent=%d %@ _targetBitrate=%u _currentTargetBitrate=%u _supportsAdaptation=%d", buf, 0x70u);
      }
    }
  }
}

- (void)registerReportingTask
{
  reportingRegisterPeriodicTaskWeak();
}

uint64_t __43__VCAudioTransmitter_registerReportingTask__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "periodicReportingEnabled");
  if ((_DWORD)result)
    return objc_msgSend(a2, "gatherRealtimeStats:", a3);
  return result;
}

- (void)reportRedundancyConfigChange
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate redundancy delay value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (NSDictionary)dtxMetrics
{
  unsigned int audioFrameCounter;
  float v4;
  double v6;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  if (!self->_currentDTXPayload)
    return 0;
  audioFrameCounter = self->_audioFrameCounter;
  if (audioFrameCounter)
    v4 = (float)self->_silenceFrameCounter / (float)audioFrameCounter;
  else
    v4 = 0.0;
  v7[0] = CFSTR("DtxFramesTotal");
  v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v7[1] = CFSTR("DtxFrameSilent");
  v8[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_silenceFrameCounter);
  v7[2] = CFSTR("DtxCompRatio");
  *(float *)&v6 = v4;
  v8[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7[3] = CFSTR("TxBytesActual");
  v8[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalTxAudioBytes);
  v7[4] = CFSTR("TxBytesEstimate");
  v8[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_estimateTxAudioBytes);
  return (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
}

- (float)nextAudioInterval:(int)a3
{
  unsigned int v5;
  signed int v6;

  v5 = -[VCAudioPayloadConfig samplesPerFrame](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "samplesPerFrame");
  v6 = -[VCPacketBundler packetsPerBundle](self->_audioBundler, "packetsPerBundle") * v5 - a3;
  if (v6 < 1)
    return 0.0;
  else
    return self->_blockSeconds * (float)(int)ceilf((float)v6 / (float)self->_inputFormat.samplesPerFrame);
}

- (void)removeUnusedAudioPayloads
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  VCAudioTierPicker *v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  VCAudioTierPicker *audioTierPicker;
  uint64_t v25;
  NSMutableArray *audioPayloads;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  id v30;
  id v31;
  int v32;
  int v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  _BYTE v41[24];
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  NSMutableArray *v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v4 = -[VCAudioTierPicker allPayloadsFromAllTierTables](self->_audioTierPicker, "allPayloadsFromAllTierTables");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v52;
    *(_QWORD *)&v6 = 136316930;
    v29 = v6;
    v30 = v3;
    v31 = v4;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v9);
        v11 = _VCAudioTransmitter_UsedAudioPayloadForType((uint64_t)self, objc_msgSend(v10, "unsignedIntValue", v29));
        if (v11)
        {
          objc_msgSend(v3, "addObject:", v11);
          goto LABEL_8;
        }
        if ((VCAudioTransmitter *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v22 = VRTraceErrorLogLevelToCSTR();
            v23 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v33 = objc_msgSend(v10, "unsignedIntValue");
              audioTierPicker = self->_audioTierPicker;
              v25 = objc_msgSend(-[VCAudioTierPicker allPayloadsFromAllTierTables](audioTierPicker, "allPayloadsFromAllTierTables"), "count");
              audioPayloads = self->_audioPayloads;
              v27 = -[NSMutableArray count](audioPayloads, "count");
              *(_DWORD *)buf = v29;
              v35 = v22;
              v36 = 2080;
              v37 = "-[VCAudioTransmitter removeUnusedAudioPayloads]";
              v38 = 1024;
              v39 = 765;
              v40 = 1024;
              *(_DWORD *)v41 = v33;
              *(_WORD *)&v41[4] = 2048;
              *(_QWORD *)&v41[6] = audioTierPicker;
              *(_WORD *)&v41[14] = 2048;
              *(_QWORD *)&v41[16] = v25;
              v4 = v31;
              v42 = 2048;
              v43 = audioPayloads;
              v44 = 2048;
              v45 = v27;
              v19 = v23;
              v20 = " [%s] %s:%d payload=%u from _audioTierPicker=%p (count=%lu) was not found in the audio transmitter's"
                    " _audioPayloads=%p (count=%lu)";
              v21 = 74;
              goto LABEL_19;
            }
          }
        }
        else
        {
          v12 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v12 = (const __CFString *)-[VCAudioTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v32 = objc_msgSend(v10, "unsignedIntValue");
              v15 = self->_audioTierPicker;
              v16 = objc_msgSend(-[VCAudioTierPicker allPayloadsFromAllTierTables](v15, "allPayloadsFromAllTierTables"), "count");
              v17 = self->_audioPayloads;
              v18 = -[NSMutableArray count](v17, "count");
              *(_DWORD *)buf = 136317442;
              v35 = v13;
              v36 = 2080;
              v37 = "-[VCAudioTransmitter removeUnusedAudioPayloads]";
              v38 = 1024;
              v39 = 765;
              v40 = 2112;
              *(_QWORD *)v41 = v12;
              *(_WORD *)&v41[8] = 2048;
              *(_QWORD *)&v41[10] = self;
              *(_WORD *)&v41[18] = 1024;
              *(_DWORD *)&v41[20] = v32;
              v42 = 2048;
              v43 = v15;
              v44 = 2048;
              v45 = v16;
              v46 = 2048;
              v47 = v17;
              v3 = v30;
              v4 = v31;
              v48 = 2048;
              v49 = v18;
              v19 = v14;
              v20 = " [%s] %s:%d %@(%p) payload=%u from _audioTierPicker=%p (count=%lu) was not found in the audio transm"
                    "itter's _audioPayloads=%p (count=%lu)";
              v21 = 94;
LABEL_19:
              _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
            }
          }
        }
LABEL_8:
        ++v9;
      }
      while (v7 != v9);
      v28 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
      v7 = v28;
    }
    while (v28);
  }
  if (self->_currentDTXPayload)
    objc_msgSend(v3, "addObject:");
  -[NSMutableArray removeAllObjects](self->_audioPayloads, "removeAllObjects");
  -[NSMutableArray addObjectsFromArray:](self->_audioPayloads, "addObjectsFromArray:", objc_msgSend(v3, "allObjects"));

}

- (BOOL)setupAudioEncoders
{
  int v3;
  size_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t i;
  NSMutableArray *audioPayloads;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_supportsAdaptation)
    -[VCAudioTransmitter removeUnusedAudioPayloads](self, "removeUnusedAudioPayloads");
  v3 = -[NSMutableArray count](self->_audioPayloads, "count");
  v4 = 4 * v3;
  v5 = (v4 + 15) & 0x7FFFFFFF0;
  v6 = &v15[-v5];
  if (v3)
    memset(&v15[-v5], 170, v4);
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
      *(_DWORD *)&v6[4 * i] = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_audioPayloads, "objectAtIndex:", i), "config"), "payload");
  }
  RTPSetTxPayloadList((uint64_t)self->_rtpHandle, v3, v6);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  audioPayloads = self->_audioPayloads;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(audioPayloads);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * j);
        objc_msgSend(v13, "setRamStadSRCEnabled:", self->_ramStadSRCEnabled);
        objc_msgSend(v13, "createEncoderWithInputFormat:", &self->_inputFormat);
        objc_msgSend(v13, "setCurrentDTXEnable:", self->_currentDTXEnable);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v10);
  }
  return 1;
}

- (BOOL)allocateLastInputSampleBuffer:(unsigned int)a3
{
  size_t v3;
  char *v5;
  char *v6;
  char *lastInputSampleBuffer;
  char *v8;

  v3 = self->_inputFormat.format.mBytesPerFrame * a3;
  if (!(_DWORD)v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      LODWORD(v5) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!(_DWORD)v5)
        return (char)v5;
      -[VCAudioTransmitter allocateLastInputSampleBuffer:].cold.1();
    }
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  if (self->_lastInputSampleBuffer && v3 <= self->_lastInputSampleBufferSize)
  {
LABEL_13:
    LOBYTE(v5) = 1;
    return (char)v5;
  }
  v5 = (char *)malloc_type_calloc(1uLL, v3, 0x21A16158uLL);
  if (v5)
  {
    v6 = v5;
    lastInputSampleBuffer = self->_lastInputSampleBuffer;
    if (lastInputSampleBuffer)
    {
      memcpy(&v5[(v3 - self->_lastInputSampleBufferSize)], lastInputSampleBuffer, self->_lastInputSampleBufferSize);
      v8 = self->_lastInputSampleBuffer;
    }
    else
    {
      v8 = 0;
    }
    free(v8);
    self->_lastInputSampleBuffer = v6;
    self->_lastInputSampleBufferSize = v3;
    goto LABEL_13;
  }
  return (char)v5;
}

- (unsigned)maximumSamplesPerFrame
{
  NSMutableArray *audioPayloads;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
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
  audioPayloads = self->_audioPayloads;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(audioPayloads);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (v5 < objc_msgSend((id)objc_msgSend(v8, "config"), "samplesPerFrame"))
          v5 = objc_msgSend((id)objc_msgSend(v8, "config"), "samplesPerFrame");
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v4);
  }
  else
  {
    LODWORD(v5) = 0;
  }
  return v5;
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  VCAudioTransmitter_PushAudioSamples((unint64_t)self, (uint64_t)a3);
}

- (void)setCurrentDTXEnable:(BOOL)a3
{
  NSMutableArray *audioPayloads;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_currentDTXEnable = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  audioPayloads = self->_audioPayloads;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(audioPayloads);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setCurrentDTXEnable:", self->_currentDTXEnable);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (void)currentPayloadUsed:(int)a3 payloadUsed:(id *)a4
{
  NSMutableArray *audioPayloads;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    audioPayloads = self->_audioPayloads;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(audioPayloads);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v11, "config"), "samplesPerFrame") == a3)
          {
            *a4 = v11;
            return;
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        if (v8)
          continue;
        break;
      }
    }
  }
}

- (BOOL)chooseAudioNetworkBitrate
{
  unsigned int rateChangeCounter;
  VCRedundancyControllerAudio *redundancyController;
  unsigned int redundancyPercentage;
  unsigned int v6;
  unsigned int v7;
  _BOOL4 v8;
  int operatingMode;
  double v11;
  NSObject *global_queue;
  uint64_t v13;
  NSObject *v14;
  int *p_audioTierChangeRequestCount;
  unsigned int v16;
  unsigned int v17;
  char v18;
  VCAudioTierPicker *audioTierPicker;
  uint64_t v20;
  VCAudioTier *v21;
  _BOOL4 v22;
  unsigned int v23;
  char v24;
  unsigned int v25;
  float v26;
  uint64_t v27;
  NSObject *v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  int v35;
  double lastTierSwitch;
  unsigned int v37;
  char v38;
  unsigned int v39;
  int v40;
  int v41;
  unsigned int *p_redNumPayloads;
  unsigned int redNumPayloads;
  unsigned int v44;
  unsigned int v45;
  int v46;
  uint64_t v47;
  NSObject *v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int redundancyControllerMaxDelay20ms;
  unsigned int *p_redMaxDelay20ms;
  unsigned int redMaxDelay20ms;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int *v57;
  unsigned int v58;
  unsigned int v59;
  uint64_t v60;
  NSObject *v61;
  int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  uint64_t v67;
  NSObject *v68;
  unsigned int v69;
  unsigned int v70;
  _BOOL8 v71;
  _BOOL4 lastAudioStalled;
  _BOOL4 isConnectedOnIPv6_LowestConnectionQuality;
  unsigned int v74;
  int v75;
  _QWORD block[5];
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  int v90;
  unsigned int v91;
  unsigned int targetBitrate;
  _BOOL4 isAudioStalled;
  _BYTE buf[64];
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  if (!self->_supportsAdaptation)
    return 1;
  rateChangeCounter = self->_rateChangeCounter;
  targetBitrate = self->_targetBitrate;
  v91 = rateChangeCounter;
  isAudioStalled = self->_isAudioStalled;
  v90 = 0;
  v89 = 0;
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  if (!self->_statisticsCollector)
  {
    if ((AFRCGetAudioTxInfo((uint64_t)self->_afrc, &targetBitrate, 0, 0, 0, 0, &isAudioStalled, &v91, &v90, (uint64_t)&v77) & 0x80000000) != 0)return 0;
    redundancyController = self->_redundancyController;
    v101 = v87;
    v102 = v88;
    v103 = v89;
    v97 = v83;
    v98 = v84;
    v99 = v85;
    v100 = v86;
    *(_OWORD *)&buf[32] = v79;
    *(_OWORD *)&buf[48] = v80;
    v95 = v81;
    v96 = v82;
    *(_OWORD *)buf = v77;
    *(_OWORD *)&buf[16] = v78;
    -[VCRedundancyControllerAudio updateRedundancyStrategyWithNetworkStatistics:](redundancyController, "updateRedundancyStrategyWithNetworkStatistics:", buf);
  }
  redundancyPercentage = self->_redundancyPercentage;
  v6 = redundancyPercentage / 0x64;
  v7 = (self->_redundancyInterval / 20.0);
  v8 = redundancyPercentage / 0x64 != self->_redundancyControllerNumPayloads
    || self->_redundancyControllerMaxDelay20ms != v7;
  if (v90)
    RTPResetConnectionStats();
  operatingMode = self->_operatingMode;
  if (operatingMode == 7 || operatingMode == 2)
    RTPUpdateAudioOnlyRateChange((uint64_t)self->_rtpHandle, v91);
  v11 = micro();
  if (self->_isLocalCellular_LowestConnectionQuality && v11 - self->_lastUpdateQualityIndicator > 5.0)
  {
    self->_lastUpdateQualityIndicator = v11;
    global_queue = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__VCAudioTransmitter_chooseAudioNetworkBitrate__block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  if (isAudioStalled != self->_lastAudioStalled)
  {
    if (self->_isLocalCellular_LowestConnectionQuality)
    {
      RTPSetCellularAudioStallState((uint64_t)self->_rtpVideo, isAudioStalled);
      RTPSetCellularAudioStallState((uint64_t)self->_rtpHandle, isAudioStalled);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        lastAudioStalled = self->_lastAudioStalled;
        isConnectedOnIPv6_LowestConnectionQuality = self->_isConnectedOnIPv6_LowestConnectionQuality;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 1133;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = lastAudioStalled;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = isAudioStalled;
        *(_WORD *)&buf[40] = 1024;
        *(_DWORD *)&buf[42] = isConnectedOnIPv6_LowestConnectionQuality;
        _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d UNEXPECTED: audio stall change (%d -> %d) while not in cellular(IPv6 :%d)", buf, 0x2Eu);
      }
    }
    self->_lastAudioStalled = isAudioStalled;
  }
  isAudioStalled = 0;
  p_audioTierChangeRequestCount = &self->_audioTierChangeRequestCount;
  if (self->_audioTierChangeRequestCount >= 1)
  {
    -[VCAudioTransmitter setupAudioHeaderSize](self, "setupAudioHeaderSize");
    -[VCAudioTransmitter setupAudioTierPicker](self, "setupAudioTierPicker");
    do
      v16 = __ldaxr((unsigned int *)p_audioTierChangeRequestCount);
    while (__stlxr(v16 - 1, (unsigned int *)p_audioTierChangeRequestCount));
  }
  v17 = redundancyPercentage + 100;
  if (targetBitrate != self->_currentTargetBitrate
    || (v17 != self->_currentDuplication ? (v18 = 1) : (v18 = v8), (v18 & 1) != 0 || self->_audioTierHysteresis))
  {
    self->_currentTargetBitrate = targetBitrate;
    if (self->_isRedEnabled)
    {
      audioTierPicker = self->_audioTierPicker;
      if (self->_targetBitrateIsAudioOnly)
        v20 = -[VCAudioTierPicker tierForAudioBitrate:withRedNumPayloads:](audioTierPicker, "tierForAudioBitrate:withRedNumPayloads:");
      else
        v20 = -[VCAudioTierPicker tierForNetworkBitrate:withRedNumPayloads:](audioTierPicker, "tierForNetworkBitrate:withRedNumPayloads:");
      v21 = (VCAudioTier *)v20;
      v23 = -[VCAudioTier redNumPayloads](self->_currentAudioTier, "redNumPayloads");
      v22 = v23 != -[VCAudioTier redNumPayloads](v21, "redNumPayloads");
    }
    else
    {
      v21 = -[VCAudioTierPicker tierForNetworkBitrate:withLegacyDuplication:](self->_audioTierPicker, "tierForNetworkBitrate:withLegacyDuplication:");
      v22 = 0;
    }
    if ((-[VCAudioPayloadConfig isEqual:](-[VCAudioTier payloadConfig](v21, "payloadConfig"), "isEqual:", -[VCAudioPayload config](self->_currentAudioPayload, "config")) & 1) != 0|| (v17 != self->_currentDuplication ? (v24 = 1) : (v24 = v8), (v24 & 1) != 0|| (v25 = -[VCAudioTier audioCodecBitrate](v21, "audioCodecBitrate"), v25 == -[VCAudioPayload bitrate](self->_currentAudioPayload, "bitrate"))|| (-[VCAudioPayloadConfig qualityForBitRate:](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "qualityForBitRate:", -[VCAudioTier audioCodecBitrate](v21, "audioCodecBitrate")), v26 <= 0.5)))
    {
      if ((-[VCAudioPayloadConfig isEqual:](-[VCAudioTier payloadConfig](v21, "payloadConfig"), "isEqual:", -[VCAudioPayload config](self->_currentAudioPayload, "config")) & 1) == 0)
      {
        v31 = -[VCAudioTier audioCodecBitrate](v21, "audioCodecBitrate");
        if (v31 > -[VCAudioPayload bitrate](self->_currentAudioPayload, "bitrate")
          && v17 <= self->_currentDuplication
          && v6 <= self->_redNumPayloads
          && self->_lastTierSwitch != 0.0
          && micro() - self->_lastTierSwitch < 2.0)
        {
          if (!self->_audioTierHysteresis)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v32 = VRTraceErrorLogLevelToCSTR();
              v33 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v34 = -[VCAudioPayloadConfig payload](-[VCAudioTier payloadConfig](self->_currentAudioTier, "payloadConfig"), "payload");
                v35 = -[VCAudioPayloadConfig payload](-[VCAudioTier payloadConfig](v21, "payloadConfig"), "payload");
                lastTierSwitch = self->_lastTierSwitch;
                *(_DWORD *)buf = 136316418;
                *(_QWORD *)&buf[4] = v32;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 1192;
                *(_WORD *)&buf[28] = 1024;
                *(_DWORD *)&buf[30] = v34;
                *(_WORD *)&buf[34] = 1024;
                *(_DWORD *)&buf[36] = v35;
                *(_WORD *)&buf[40] = 2048;
                *(double *)&buf[42] = lastTierSwitch;
                _os_log_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Time Hysteresis preventing tier upgrade from %d to %d, last upgrade at %6.3f", buf, 0x32u);
              }
            }
            self->_audioTierHysteresis = 1;
          }
          return !isAudioStalled;
        }
      }
      if (v21 == self->_currentAudioTier
        || (v37 = -[VCAudioTier audioCodecBitrate](v21, "audioCodecBitrate"),
            v37 == -[VCAudioPayload bitrate](self->_currentAudioPayload, "bitrate"))
        && (v17 != self->_currentDuplication ? (v38 = 1) : (v38 = v8),
            (v38 & 1) == 0
         && ((v39 = -[VCAudioTier packetsPerBundle](self->_currentAudioTier, "packetsPerBundle"),
              v39 != -[VCAudioTier packetsPerBundle](v21, "packetsPerBundle"))
           ? (v40 = 1)
           : (v40 = v22),
             v40 != 1)))
      {
        v46 = v17 != self->_currentDuplication || v8;
        if (v46 == 1)
        {
          self->_currentDuplication = v17;
          self->_redundancyControllerNumPayloads = v6;
          self->_redundancyControllerMaxDelay20ms = v7;
          if (self->_isRedEnabled
            && -[VCAudioTier redNumPayloads](v21, "redNumPayloads") != v6
            && (int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v47 = VRTraceErrorLogLevelToCSTR();
            v48 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v49 = -[VCAudioTier redNumPayloads](v21, "redNumPayloads");
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = v47;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 1237;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v6;
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = v49;
              _os_log_impl(&dword_1D8A54000, v48, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Overriding suggested red value %d with red value %u", buf, 0x28u);
            }
          }
          v50 = -[VCAudioTier redMaxDelay20ms](v21, "redMaxDelay20ms");
          redundancyControllerMaxDelay20ms = self->_redundancyControllerMaxDelay20ms;
          if (v50 > redundancyControllerMaxDelay20ms)
            redundancyControllerMaxDelay20ms = v50;
          p_redMaxDelay20ms = &self->_redMaxDelay20ms;
          redMaxDelay20ms = self->_redMaxDelay20ms;
          while (1)
          {
            v54 = __ldxr(p_redMaxDelay20ms);
            if (v54 != redMaxDelay20ms)
              break;
            if (!__stxr(redundancyControllerMaxDelay20ms, p_redMaxDelay20ms))
              goto LABEL_117;
          }
          __clrex();
LABEL_117:
          -[VCAudioTransmitter setRedNumPayloads:withMaxDelay:shouldResetHistory:shouldEnableShortRED:](self, "setRedNumPayloads:withMaxDelay:shouldResetHistory:shouldEnableShortRED:", -[VCAudioTier redNumPayloads](self->_currentAudioTier, "redNumPayloads"), self->_redMaxDelay20ms, 0, -[VCAudioTier shortREDEnabled](self->_currentAudioTier, "shortREDEnabled"));
        }
        else
        {
          self->_audioTierHysteresis = 0;
        }
        return !isAudioStalled;
      }
      if (v21 != self->_requestedAudioTier
        || (self->_currentDuplication != v17 ? (v41 = 1) : (v41 = v8), (v41 | v22) == 1))
      {
        self->_requestedAudioTier = v21;
        self->_currentDuplication = v17;
        self->_redundancyControllerNumPayloads = v6;
        self->_redundancyControllerMaxDelay20ms = v7;
        p_redNumPayloads = &self->_redNumPayloads;
        redNumPayloads = self->_redNumPayloads;
        v44 = -[VCAudioTier redNumPayloads](v21, "redNumPayloads");
        while (1)
        {
          v45 = __ldxr(p_redNumPayloads);
          if (v45 != redNumPayloads)
            break;
          if (!__stxr(v44, p_redNumPayloads))
            goto LABEL_98;
        }
        __clrex();
LABEL_98:
        v55 = -[VCAudioTier redMaxDelay20ms](v21, "redMaxDelay20ms");
        v56 = self->_redundancyControllerMaxDelay20ms;
        if (v55 > v56)
          v56 = v55;
        v57 = &self->_redMaxDelay20ms;
        v58 = self->_redMaxDelay20ms;
        while (1)
        {
          v59 = __ldxr(v57);
          if (v59 != v58)
            break;
          if (!__stxr(v56, v57))
            goto LABEL_105;
        }
        __clrex();
LABEL_105:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v60 = VRTraceErrorLogLevelToCSTR();
          v61 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v75 = -[VCAudioPayloadConfig payload](-[VCAudioTier payloadConfig](self->_currentAudioTier, "payloadConfig"), "payload");
            v62 = -[VCAudioPayloadConfig payload](-[VCAudioTier payloadConfig](v21, "payloadConfig"), "payload");
            v74 = targetBitrate;
            v63 = -[VCAudioTier networkBitrate](self->_currentAudioTier, "networkBitrate");
            v64 = -[VCAudioTier networkBitrate](v21, "networkBitrate");
            v65 = -[VCAudioTier packetsPerBundle](self->_currentAudioTier, "packetsPerBundle");
            v66 = -[VCAudioTier packetsPerBundle](v21, "packetsPerBundle");
            *(_DWORD *)buf = 136317442;
            *(_QWORD *)&buf[4] = v60;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 1215;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v75;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = v62;
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = v74;
            *(_WORD *)&buf[46] = 1024;
            *(_DWORD *)&buf[48] = v63;
            *(_WORD *)&buf[52] = 1024;
            *(_DWORD *)&buf[54] = v64;
            *(_WORD *)&buf[58] = 1024;
            *(_DWORD *)&buf[60] = v65;
            LOWORD(v95) = 1024;
            *(_DWORD *)((char *)&v95 + 2) = v66;
            _os_log_impl(&dword_1D8A54000, v61, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Switching audio bitrate tier payload %d -> %d for total tx %d: netBitrate %d -> %d, bundle %d -> %d", buf, 0x46u);
          }
        }
        if (self->_isRedEnabled
          && -[VCAudioTier redNumPayloads](v21, "redNumPayloads") != v6
          && (int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v67 = VRTraceErrorLogLevelToCSTR();
          v68 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v69 = -[VCAudioTier redNumPayloads](v21, "redNumPayloads");
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v67;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 1217;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v6;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = v69;
            _os_log_impl(&dword_1D8A54000, v68, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Overriding suggested red value %d with red value %u", buf, 0x28u);
          }
        }
        v70 = -[VCAudioTier redPayloadSize](v21, "redPayloadSize");
        v71 = v70 < -[VCAudioTier redPayloadSize](self->_currentAudioTier, "redPayloadSize");
        -[VCAudioTransmitter useAudioTier:](self, "useAudioTier:", v21);
        -[VCAudioTransmitter setRedNumPayloads:withMaxDelay:shouldResetHistory:shouldEnableShortRED:](self, "setRedNumPayloads:withMaxDelay:shouldResetHistory:shouldEnableShortRED:", self->_redNumPayloads, self->_redMaxDelay20ms, v71, -[VCAudioTier shortREDEnabled](v21, "shortREDEnabled"));
        -[VCAudioTransmitter reportRedundancyConfigChange](self, "reportRedundancyConfigChange");
        goto LABEL_114;
      }
    }
    else if (v21 != self->_requestedAudioTier)
    {
      self->_requestedAudioTier = v21;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v29 = -[VCAudioPayload bitrate](self->_currentAudioPayload, "bitrate");
          v30 = -[VCAudioTier audioCodecBitrate](v21, "audioCodecBitrate");
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioTransmitter chooseAudioNetworkBitrate]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 1177;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v29;
          *(_WORD *)&buf[34] = 1024;
          *(_DWORD *)&buf[36] = v30;
          _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Switching audio bitrates without changing tier %d -> %d", buf, 0x28u);
        }
      }
      -[VCAudioTransmitter useAudioPayload:withBitrate:redNumPayloads:](self, "useAudioPayload:withBitrate:redNumPayloads:", self->_currentAudioPayload, -[VCAudioTier audioCodecBitrate](v21, "audioCodecBitrate"), -[VCAudioTier redNumPayloads](v21, "redNumPayloads"));
      -[VCAudioTransmitter updateAudioTxBitrate](self, "updateAudioTxBitrate");
LABEL_114:
      self->_lastTierSwitch = micro();
      self->_audioTierHysteresis = 0;
      -[VCAudioTransmitter logTierInfo:](self, "logTierInfo:", 1);
    }
  }
  return !isAudioStalled;
}

uint64_t __47__VCAudioTransmitter_chooseAudioNetworkBitrate__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 248))
  {
    AFRCGetQualityIndication(*(_QWORD *)(v1 + 296), (_DWORD *)(v1 + 128));
    v1 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v1 + 448), "updateQualityIndicator:isIPv6:", *(unsigned int *)(v1 + 128), *(unsigned __int8 *)(v1 + 335));
}

- (void)setupAudioHeaderSize
{
  BOOL BoolValueForKey;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int audioHeaderSize;
  unsigned int constantTransportOverhead;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  tagHANDLE *rtpHandle;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  self->_audioHeaderSize = 0;
  if (self->_useChannelDataFormat)
  {
    v17 = 0;
    BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("disableDynamicMediaPacketHeaderCalculations"), 0);
    v16 = 0xAAAAAAAAAAAAAAAALL;
    LODWORD(v16) = VCMediaControlInfoGeneratorGetType(self->_controlInfoGenerator);
    BYTE4(v16) = VCMediaControlInfoGeneratorGetVersion(self->_controlInfoGenerator);
    v4 = VCFramingOverheadCalculationUtils_PerPacketMediaFramingOverheadWithRTPHandle((uint64_t)self->_rtpHandle, (unsigned int *)&v16, &v17);
    if (v4 < 0)
    {
      v11 = v4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          rtpHandle = self->_rtpHandle;
          *(_DWORD *)buf = 136316674;
          v19 = v12;
          v20 = 2080;
          v21 = "-[VCAudioTransmitter setupAudioHeaderSize]";
          v22 = 1024;
          v23 = 1384;
          v24 = 1024;
          v25 = v11;
          v26 = 2048;
          v27 = (uint64_t)rtpHandle;
          v28 = 1024;
          v29 = v16;
          v30 = 1024;
          v31 = BYTE4(v16);
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to get media framing overhead. result=0x%08x rtpHandle=%p mediaControlInfoGeneratorType=%u version=%u", buf, 0x38u);
        }
      }
    }
    else
    {
      self->_audioHeaderSize = self->_constantTransportOverhead + v17;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          audioHeaderSize = self->_audioHeaderSize;
          constantTransportOverhead = self->_constantTransportOverhead;
          *(_DWORD *)buf = 136316418;
          v19 = v5;
          v20 = 2080;
          v21 = "-[VCAudioTransmitter setupAudioHeaderSize]";
          v22 = 1024;
          v23 = 1387;
          v24 = 1024;
          v25 = audioHeaderSize;
          v26 = 2048;
          v27 = v17;
          v28 = 1024;
          v29 = constantTransportOverhead;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Audio header size=%d, framingOverhead=%lu, _constantTransportOverhead=%u", buf, 0x32u);
        }
      }
      if (!BoolValueForKey)
      {
        v9 = self->_audioHeaderSize;
LABEL_14:
        v15 = self->_constantTransportOverhead;
        goto LABEL_20;
      }
    }
    v9 = +[VCConnectionIDS worstCaseNetworkOverheadInBytesWithNumOfStreamId:isPriorityIncluded:](VCConnectionIDS, "worstCaseNetworkOverheadInBytesWithNumOfStreamId:isPriorityIncluded:", self->_maxIDSStreamIdCount, 1, v16)+ 12;
    self->_audioHeaderSize = v9;
    goto LABEL_14;
  }
  if (self->_isUseCaseWatchContinuity)
  {
    v10 = 0;
  }
  else if (self->_isConnectedOnIPv6_LowestConnectionQuality)
  {
    v10 = 40;
  }
  else
  {
    v10 = 20;
  }
  v15 = v10 + 8;
  v9 = v10 + 20;
  self->_audioHeaderSize = v9;
  if (self->_useRateControl)
  {
    v9 = VCMediaControlInfoGeneratorGetFeedbackSize(self->_controlInfoGenerator, a2) + self->_audioHeaderSize + 10;
    self->_audioHeaderSize = v9;
  }
LABEL_20:
  -[VCAudioRedBuilder setMaxREDPayloadSize:](self->_redBuilder, "setMaxREDPayloadSize:", self->_maxAudioPacketSize + v15 - v9, v16);
}

- (id)packetsPerBundle
{
  uint64_t v3;
  void *v4;
  NSMutableArray *audioPayloads;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = -[VCDefaults forceAudioPacketsPerBundle](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPacketsPerBundle");
  if ((_DWORD)v3)
  {
    v16[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  }
  else if (self->_isUseCaseWatchContinuity)
  {
    return &unk_1E9EFAF40;
  }
  else if (self->_operatingMode == 6)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    audioPayloads = self->_audioPayloads;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      v4 = &unk_1E9EFAF58;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(audioPayloads);
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "config"), "payload") == 101)
            return &unk_1E9EFAF70;
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      return &unk_1E9EFAF58;
    }
  }
  else
  {
    return &unk_1E9EFAF88;
  }
  return v4;
}

- (BOOL)setupAudioTierPicker
{
  void *v3;
  NSMutableArray *audioPayloads;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSObject *v10;
  int operatingMode;
  unsigned int currentAudioCap;
  unsigned __int8 tierPickerMode;
  int audioHeaderSize;
  BOOL v15;
  BOOL isUseCaseWatchContinuity;
  __int16 v17;
  BOOL wifiAllowRedLowBitratesEnabled;
  BOOL v19;
  VCAudioTierPicker *v20;
  VCAudioTierPicker *v21;
  NSArray *supportedNumRedundantPayload;
  id v24;
  _BYTE buf[24];
  _BYTE v26[12];
  BOOL v27;
  BOOL v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  BOOL v32;
  BOOL v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!self->_supportsAdaptation)
    return 1;
  v24 = -[VCAudioTransmitter packetsPerBundle](self, "packetsPerBundle");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_audioPayloads, "count"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  audioPayloads = self->_audioPayloads;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(audioPayloads);
        objc_msgSend(v3, "setObject:atIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "config"), objc_msgSend(v3, "count"));
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](audioPayloads, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v6);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      operatingMode = self->_operatingMode;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioTransmitter setupAudioTierPicker]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)v26 = 1450;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = operatingMode;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Tier Table for Operating Mode %d", buf, 0x22u);
    }
  }
  currentAudioCap = self->_currentAudioCap;
  self->_currentAudioTier = 0;
  tierPickerMode = self->_tierPickerMode;
  supportedNumRedundantPayload = self->_supportedNumRedundantPayload;
  audioHeaderSize = self->_audioHeaderSize;
  v15 = !self->_useWiFiTiers;
  isUseCaseWatchContinuity = self->_isUseCaseWatchContinuity;
  if (self->_operatingMode == 6)
    currentAudioCap = self->_tierNetworkBitrate;
  v17 = *(_WORD *)&self->_alwaysOnAudioRedundancyEnabled;
  wifiAllowRedLowBitratesEnabled = self->_wifiAllowRedLowBitratesEnabled;
  v19 = !self->_isConnectedOnIPv6_LowestConnectionQuality;

  v20 = [VCAudioTierPicker alloc];
  buf[0] = tierPickerMode;
  *(_DWORD *)&buf[1] = 0;
  *(_DWORD *)&buf[4] = 0;
  *(_QWORD *)&buf[8] = v3;
  *(_QWORD *)&buf[16] = v24;
  *(_QWORD *)v26 = supportedNumRedundantPayload;
  *(_DWORD *)&v26[8] = audioHeaderSize;
  v27 = v15;
  v28 = isUseCaseWatchContinuity;
  v29 = 0;
  v30 = currentAudioCap;
  v31 = v17;
  v32 = wifiAllowRedLowBitratesEnabled;
  v33 = v19;
  v21 = -[VCAudioTierPicker initWithConfig:](v20, "initWithConfig:", buf);
  self->_audioTierPicker = v21;
  -[VCAudioTransmitter useAudioTier:](self, "useAudioTier:", -[VCAudioTierPicker defaultTier](v21, "defaultTier"));
  if (self->_statisticsCollector)
    self->_currentDuplication = self->_redundancyPercentage + 100;
  else
    AFRCGetAudioTxInfo((uint64_t)self->_afrc, 0, (int *)&self->_currentDuplication, 0, 0, 0, 0, 0, 0, 0);
  -[VCAudioTransmitter updateAudioTxBitrate](self, "updateAudioTxBitrate");
  return self->_audioTierPicker != 0;
}

- (void)updateAudioTxBitrate
{
  int audioTxBitrate;
  VCAudioPayloadConfig *v4;
  double v5;
  double mSampleRate;
  int v7;
  __objc2_class **p_superclass;
  int v9;
  double v10;
  double v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int operatingMode;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  int v30;
  double v31;
  int v32;
  tagHANDLE *afrc;
  _BOOL4 v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  int audioHeaderSize;
  int v40;
  int v41;
  int v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  _BYTE v50[10];
  VCAudioTransmitter *v51;
  _BYTE v52[6];
  _BYTE v53[6];
  _BYTE v54[6];
  _BYTE v55[6];
  _BYTE v56[6];
  _BYTE v57[6];
  __int16 v58;
  int v59;
  __int16 v60;
  unsigned int v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  audioTxBitrate = self->_audioTxBitrate;
  v4 = -[VCAudioPayload config](self->_currentAudioPayload, "config");
  v5 = (double)(8 * self->_audioHeaderSize);
  mSampleRate = self->_inputFormat.format.mSampleRate;
  v7 = (int)(mSampleRate / (double)-[VCAudioPayloadConfig samplesPerFrame](v4, "samplesPerFrame") * v5);
  p_superclass = VCMediaNegotiatorResultsCaptions.superclass;
  if (+[VCPayloadUtils canBundleExternallyForPayload:forBundlingScheme:operatingMode:](VCPayloadUtils, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", -[VCAudioPayloadConfig payload](v4, "payload"), -[VCPacketBundler bundlingScheme](self->_audioBundler, "bundlingScheme"), self->_operatingMode))
  {
    v9 = (int)((double)v7 / (double)-[VCPacketBundler packetsPerBundle](self->_audioBundler, "packetsPerBundle"));
    v10 = (double)(8 * -[VCAudioPayloadConfig bundleHeaderBytes](v4, "bundleHeaderBytes"));
    v11 = self->_inputFormat.format.mSampleRate;
    v7 = (int)((double)v9 + v10 * (v11 / (double)-[VCAudioPayloadConfig samplesPerFrame](v4, "samplesPerFrame")));
  }
  self->_audioTxBitrate = -[VCAudioPayload bitrate](self->_currentAudioPayload, "bitrate") + v7;
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v41 = self->_audioTxBitrate;
        v15 = -[VCAudioPayload bitrate](self->_currentAudioPayload, "bitrate");
        audioHeaderSize = self->_audioHeaderSize;
        v16 = -[VCPacketBundler packetsPerBundle](self->_audioBundler, "packetsPerBundle");
        v17 = -[VCAudioPayloadConfig bundleHeaderBytes](v4, "bundleHeaderBytes");
        v18 = (int)self->_inputFormat.format.mSampleRate;
        v19 = -[VCAudioPayloadConfig samplesPerFrame](v4, "samplesPerFrame");
        operatingMode = self->_operatingMode;
        *(_DWORD *)buf = 136317954;
        v44 = v13;
        v45 = 2080;
        v46 = "-[VCAudioTransmitter updateAudioTxBitrate]";
        v47 = 1024;
        v48 = 1505;
        v49 = 1024;
        *(_DWORD *)v50 = v41;
        *(_WORD *)&v50[4] = 1024;
        *(_DWORD *)&v50[6] = v15;
        LOWORD(v51) = 1024;
        *(_DWORD *)((char *)&v51 + 2) = v7;
        HIWORD(v51) = 1024;
        *(_DWORD *)v52 = audioHeaderSize;
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)v53 = v16;
        p_superclass = (__objc2_class **)(VCMediaNegotiatorResultsCaptions + 8);
        *(_WORD *)&v53[4] = 1024;
        *(_DWORD *)v54 = v17;
        *(_WORD *)&v54[4] = 1024;
        *(_DWORD *)v55 = v18;
        *(_WORD *)&v55[4] = 1024;
        *(_DWORD *)v56 = v19;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)v57 = operatingMode;
        v21 = " [%s] %s:%d Setting audioTxBitrate to %d, %d audio + %d ((%d/%d+%d)*%d/%d) header for mode=%d";
        v22 = v14;
        v23 = 82;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)-[VCAudioTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v42 = self->_audioTxBitrate;
        v38 = -[VCAudioPayload bitrate](self->_currentAudioPayload, "bitrate");
        v40 = self->_audioHeaderSize;
        v26 = -[VCPacketBundler packetsPerBundle](self->_audioBundler, "packetsPerBundle");
        v27 = -[VCAudioPayloadConfig bundleHeaderBytes](v4, "bundleHeaderBytes");
        v28 = (int)self->_inputFormat.format.mSampleRate;
        v29 = -[VCAudioPayloadConfig samplesPerFrame](v4, "samplesPerFrame");
        v30 = self->_operatingMode;
        *(_DWORD *)buf = 136318466;
        v44 = v24;
        v45 = 2080;
        v46 = "-[VCAudioTransmitter updateAudioTxBitrate]";
        v47 = 1024;
        v48 = 1505;
        v49 = 2112;
        *(_QWORD *)v50 = v12;
        *(_WORD *)&v50[8] = 2048;
        v51 = self;
        *(_WORD *)v52 = 1024;
        *(_DWORD *)&v52[2] = v42;
        *(_WORD *)v53 = 1024;
        *(_DWORD *)&v53[2] = v38;
        *(_WORD *)v54 = 1024;
        *(_DWORD *)&v54[2] = v7;
        *(_WORD *)v55 = 1024;
        *(_DWORD *)&v55[2] = v40;
        *(_WORD *)v56 = 1024;
        *(_DWORD *)&v56[2] = v26;
        *(_WORD *)v57 = 1024;
        *(_DWORD *)&v57[2] = v27;
        v58 = 1024;
        v59 = v28;
        p_superclass = VCMediaNegotiatorResultsCaptions.superclass;
        v60 = 1024;
        v61 = v29;
        v62 = 1024;
        v63 = v30;
        v21 = " [%s] %s:%d %@(%p) Setting audioTxBitrate to %d, %d audio + %d ((%d/%d+%d)*%d/%d) header for mode=%d";
        v22 = v25;
        v23 = 102;
        goto LABEL_13;
      }
    }
  }
  if (self->_mediaQueue != (tagHANDLE *)0xFFFFFFFFLL)
  {
    v31 = (double)-[VCAudioPayloadConfig samplesPerFrame](v4, "samplesPerFrame") / self->_inputFormat.format.mSampleRate;
    if (objc_msgSend(p_superclass + 214, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", -[VCAudioPayloadConfig payload](v4, "payload"), -[VCPacketBundler bundlingScheme](self->_audioBundler, "bundlingScheme"), self->_operatingMode))v31 = v31 * (double)-[VCPacketBundler packetsPerBundle](self->_audioBundler, "packetsPerBundle");
    if (v31 != self->_audioInterval)
    {
      MediaQueue_SetThrottlingAudioInterval(v31);
      self->_audioInterval = v31;
    }
  }
  v32 = self->_audioTxBitrate;
  if (v32 != audioTxBitrate)
  {
    afrc = self->_afrc;
    if (afrc != (tagHANDLE *)0xFFFFFFFFLL)
      AFRCSetAudioBitRate((uint64_t)afrc, v32);
  }
  if (self->_isRedEnabled)
  {
    v34 = -[VCAudioPayload shortREDEnabled](self->_currentAudioPayload, "shortREDEnabled");
    v35 = -[VCAudioPayload bitrate](self->_currentAudioPayload, "bitrate");
    if (v34)
      v36 = v35
          + self->_redNumPayloads * -[VCAudioPayload shortREDBitrate](self->_currentAudioPayload, "shortREDBitrate");
    else
      v36 = v35 + v35 * self->_redNumPayloads;
    self->_actualAudioSendingBitrate = v36 + v7;
    v37 = -[VCAudioPayload bitrate](self->_currentAudioPayload, "bitrate");
  }
  else
  {
    v37 = self->_audioTxBitrate;
    self->_actualAudioSendingBitrate = (self->_redundancyPercentage + 100) * v37 / 0x64;
  }
  self->_actualAudioSendingBitrateNoRED = v37;
}

- (void)useAudioPayload:(id)a3 withBitrate:(unsigned int)a4 redNumPayloads:(unsigned int)a5
{
  uint64_t v6;
  VCAudioPayload *currentAudioPayload;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  unsigned int v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  unsigned int v22;
  _BYTE v23[24];
  __int128 v24;
  VCAudioTransmitter *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  v6 = *(_QWORD *)&a4;
  v28 = *MEMORY[0x1E0C80C00];
  if (self->_allowAudioSwitching)
  {
    currentAudioPayload = self->_currentAudioPayload;
    if (currentAudioPayload != a3)
    {
      v10 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](currentAudioPayload, "config"), "payload");
      if (VCPayloadUtils_SupportsShortREDForPayload())
      {
        objc_msgSend((id)objc_msgSend(a3, "config"), "payload");
        if ((VCPayloadUtils_SupportsShortREDForPayload() & 1) == 0)
          -[VCAudioRedBuilder resetShortREDHistoryAndPrimaryPayloadHistory:](self->_redBuilder, "resetShortREDHistoryAndPrimaryPayloadHistory:", 0);
      }
      self->_currentAudioPayload = (VCAudioPayload *)a3;
      objc_msgSend(a3, "resetEncoder");
      if ((VCAudioTransmitter *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_17;
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        v14 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "payload");
        v15 = -[VCAudioPayloadConfig samplesPerFrame](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "samplesPerFrame");
        *(_DWORD *)v23 = 136316418;
        *(_QWORD *)&v23[4] = v12;
        *(_WORD *)&v23[12] = 2080;
        *(_QWORD *)&v23[14] = "-[VCAudioTransmitter useAudioPayload:withBitrate:redNumPayloads:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 1545;
        WORD2(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 6) = v10;
        WORD5(v24) = 1024;
        HIDWORD(v24) = v14;
        LOWORD(v25) = 1024;
        *(_DWORD *)((char *)&v25 + 2) = v15;
        v16 = " [%s] %s:%d Switching payloads from payload=%d -> %d %d samplesPerFrame";
        v17 = v13;
        v18 = 46;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[VCAudioTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v11 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_17;
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        v21 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "payload");
        v22 = -[VCAudioPayloadConfig samplesPerFrame](-[VCAudioPayload config](self->_currentAudioPayload, "config"), "samplesPerFrame");
        *(_DWORD *)v23 = 136316930;
        *(_QWORD *)&v23[4] = v19;
        *(_WORD *)&v23[12] = 2080;
        *(_QWORD *)&v23[14] = "-[VCAudioTransmitter useAudioPayload:withBitrate:redNumPayloads:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 1545;
        WORD2(v24) = 2112;
        *(_QWORD *)((char *)&v24 + 6) = v11;
        HIWORD(v24) = 2048;
        v25 = self;
        LOWORD(v26) = 1024;
        *(_DWORD *)((char *)&v26 + 2) = v10;
        HIWORD(v26) = 1024;
        LODWORD(v27) = v21;
        WORD2(v27) = 1024;
        *(_DWORD *)((char *)&v27 + 6) = v22;
        v16 = " [%s] %s:%d %@(%p) Switching payloads from payload=%d -> %d %d samplesPerFrame";
        v17 = v20;
        v18 = 66;
      }
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, v23, v18);
LABEL_17:
      AFRCSetAudioPayload((uint64_t)self->_afrc, -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->_currentAudioPayload, "config", *(_OWORD *)v23, *(_QWORD *)&v23[16], v24, v25, v26, v27, v28), "payload"), -[VCAudioPayload bitrate](self->_currentAudioPayload, "bitrate"));
    }
  }
  -[VCAudioPayload setShortREDEnabled:](self->_currentAudioPayload, "setShortREDEnabled:", a5 != 0);
  if (!a5)
    -[VCPacketBundler resetBuffer](self->_audioBundlerShortRED, "resetBuffer");
  -[VCAudioPayload setBitrate:](self->_currentAudioPayload, "setBitrate:", v6);
}

- (void)useAudioTier:(id)a3
{
  unsigned int *p_audioTierChangeCount;
  unsigned int v6;

  self->_currentAudioTier = (VCAudioTier *)a3;
  -[VCAudioTransmitter useAudioPayload:withBitrate:redNumPayloads:](self, "useAudioPayload:withBitrate:redNumPayloads:", _VCAudioTransmitter_UsedAudioPayloadForType((uint64_t)self, objc_msgSend((id)objc_msgSend(a3, "payloadConfig"), "payload")), objc_msgSend(a3, "audioCodecBitrate"), objc_msgSend(a3, "redNumPayloads"));
  -[VCPacketBundler setPacketsPerBundle:](self->_audioBundler, "setPacketsPerBundle:", objc_msgSend(a3, "packetsPerBundle"));
  -[VCPacketBundler setPacketsPerBundle:](self->_audioBundlerShortRED, "setPacketsPerBundle:", objc_msgSend(a3, "packetsPerBundle"));
  -[VCAudioTransmitter updateAudioTxBitrate](self, "updateAudioTxBitrate");
  p_audioTierChangeCount = &self->_audioTierChangeCount;
  do
    v6 = __ldaxr(p_audioTierChangeCount);
  while (__stlxr(v6 + 1, p_audioTierChangeCount));
}

- (void)start
{
  uint64_t v3;
  void *v4;
  tagVCAudioIssueDetector *audioIssueDetector;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  tagVCAudioIssueDetector *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  tagVCAudioIssueDetector *v15;
  _QWORD v16[6];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  VCAudioTransmitter *v26;
  __int16 v27;
  tagVCAudioIssueDetector *v28;
  __int16 v29;
  VCAudioTransmitter *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[VCAudioTransmitter setPeriodicReportingEnabled:](self, "setPeriodicReportingEnabled:", 1);
  -[VCAudioTransmitter registerReportingTask](self, "registerReportingTask");
  if (self->_needsPacketThread)
  {
    v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __27__VCAudioTransmitter_start__block_invoke;
    v16[3] = &unk_1E9E588E0;
    v16[4] = self;
    v16[5] = v3;
    v4 = (void *)PacketThread_Create(48, 2048, 0x10u, 19, (uint64_t)"rtpsend", v16);
    self->_packetThread = v4;
    PacketThread_ReceiverIsReady((uint64_t)v4);
  }
  audioIssueDetector = self->_audioIssueDetector;
  if (audioIssueDetector)
  {
    VCAudioIssueDetector_Start((uint64_t)audioIssueDetector);
    if ((VCAudioTransmitter *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = self->_audioIssueDetector;
          *(_DWORD *)buf = 136316162;
          v18 = v7;
          v19 = 2080;
          v20 = "-[VCAudioTransmitter start]";
          v21 = 1024;
          v22 = 1598;
          v23 = 2048;
          v24 = v9;
          v25 = 2048;
          v26 = self;
          v10 = " [%s] %s:%d Audio issue detector=%p is started in audio transmitter=%p";
          v11 = v8;
          v12 = 48;
LABEL_14:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCAudioTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_audioIssueDetector;
          *(_DWORD *)buf = 136316674;
          v18 = v13;
          v19 = 2080;
          v20 = "-[VCAudioTransmitter start]";
          v21 = 1024;
          v22 = 1598;
          v23 = 2112;
          v24 = (void *)v6;
          v25 = 2048;
          v26 = self;
          v27 = 2048;
          v28 = v15;
          v29 = 2048;
          v30 = self;
          v10 = " [%s] %s:%d %@(%p) Audio issue detector=%p is started in audio transmitter=%p";
          v11 = v14;
          v12 = 68;
          goto LABEL_14;
        }
      }
    }
  }
}

unint64_t __27__VCAudioTransmitter_start__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  __int128 v4;
  int v6;
  _OWORD v7[3];
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  *(_DWORD *)(a2 + 32) = 0;
  *(_DWORD *)(a2 + 36) = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 328);
  v4 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v4;
  v7[2] = *(_OWORD *)(a2 + 32);
  v8 = a3;
  v9 = a4;
  return _VCAudioTransmitter_SendAudioPacketImpl(objc_msgSend(*(id *)(a1 + 40), "strong"), (int *)v7, &v6);
}

- (void)stop
{
  tagVCAudioIssueDetector *audioIssueDetector;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  tagVCAudioIssueDetector *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  tagVCAudioIssueDetector *v13;
  int *packetThread;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  VCAudioTransmitter *v24;
  __int16 v25;
  tagVCAudioIssueDetector *v26;
  __int16 v27;
  VCAudioTransmitter *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[VCAudioTransmitter setPeriodicReportingEnabled:](self, "setPeriodicReportingEnabled:", 0);
  reportingUnregisterPeriodicTask();
  audioIssueDetector = self->_audioIssueDetector;
  if (!audioIssueDetector)
    goto LABEL_13;
  VCAudioIssueDetector_Stop((uint64_t)audioIssueDetector);
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_13;
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v7 = self->_audioIssueDetector;
    v15 = 136316162;
    v16 = v5;
    v17 = 2080;
    v18 = "-[VCAudioTransmitter stop]";
    v19 = 1024;
    v20 = 1607;
    v21 = 2048;
    v22 = v7;
    v23 = 2048;
    v24 = self;
    v8 = " [%s] %s:%d Audio issue detector=%p is stopped in audio transmitter=%p";
    v9 = v6;
    v10 = 48;
    goto LABEL_12;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (const __CFString *)-[VCAudioTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v4 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_audioIssueDetector;
      v15 = 136316674;
      v16 = v11;
      v17 = 2080;
      v18 = "-[VCAudioTransmitter stop]";
      v19 = 1024;
      v20 = 1607;
      v21 = 2112;
      v22 = (void *)v4;
      v23 = 2048;
      v24 = self;
      v25 = 2048;
      v26 = v13;
      v27 = 2048;
      v28 = self;
      v8 = " [%s] %s:%d %@(%p) Audio issue detector=%p is stopped in audio transmitter=%p";
      v9 = v12;
      v10 = 68;
LABEL_12:
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v15, v10);
    }
  }
LABEL_13:
  VCAudioDump_Finalize((void **)&self->_encoderOutAudioDump);
  VCAudioDump_Finalize((void **)&self->_encoderInAudioDump);
  packetThread = (int *)self->_packetThread;
  if (packetThread)
  {
    PacketThread_Destroy(packetThread);
    self->_packetThread = 0;
  }
}

- (unsigned)sentAudioBytes
{
  unsigned int *p_sentAudioBytes;
  unsigned int result;

  p_sentAudioBytes = &self->_sentAudioBytes;
  do
    result = __ldxr(p_sentAudioBytes);
  while (__stxr(0, p_sentAudioBytes));
  return result;
}

- (unsigned)sentAudioBytesShort
{
  unsigned int *p_sentAudioBytesShort;
  unsigned int result;

  p_sentAudioBytesShort = &self->_sentAudioBytesShort;
  do
    result = __ldxr(p_sentAudioBytesShort);
  while (__stxr(0, p_sentAudioBytesShort));
  return result;
}

- (unsigned)encodedBytes
{
  unsigned int *p_encodedBytes;
  unsigned int result;

  p_encodedBytes = &self->_encodedBytes;
  do
    result = __ldxr(p_encodedBytes);
  while (__stxr(0, p_encodedBytes));
  return result;
}

- (unsigned)redNumPayloads
{
  unsigned int *p_redNumPayloads;
  unsigned int result;

  p_redNumPayloads = &self->_redNumPayloads;
  do
    result = __ldxr(p_redNumPayloads);
  while (__stxr(result, p_redNumPayloads));
  return result;
}

- (unsigned)redMaxDelay20ms
{
  unsigned int *p_redMaxDelay20ms;
  unsigned int result;

  p_redMaxDelay20ms = &self->_redMaxDelay20ms;
  do
    result = __ldxr(p_redMaxDelay20ms);
  while (__stxr(result, p_redMaxDelay20ms));
  return result;
}

- (void)logTierInfo:(int)a3
{
  unsigned int targetBitrate;
  unsigned int v5;
  __int128 v6;
  __int128 v7;
  unsigned int v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8 = -1431655766;
  v9 = -1431655766;
  if (self->_statisticsCollector)
  {
    targetBitrate = self->_targetBitrate;
    v5 = self->_redundancyPercentage + 100;
    v8 = v5;
    v9 = targetBitrate;
  }
  else
  {
    AFRCGetAudioTxInfo((uint64_t)self->_afrc, &v9, (int *)&v8, 0, 0, 0, 0, 0, 0, 0);
    v5 = v8;
    targetBitrate = v9;
  }
  *(_QWORD *)&v6 = __PAIR64__(v5, targetBitrate);
  DWORD2(v6) = -[VCAudioTransmitter redNumPayloads](self, "redNumPayloads", *(_QWORD *)&a3);
  HIDWORD(v6) = 20 * -[VCAudioTransmitter redMaxDelay20ms](self, "redMaxDelay20ms");
  LODWORD(v7) = -[VCAudioTier packetsPerBundle](self->_currentAudioTier, "packetsPerBundle");
  DWORD1(v7) = -[VCAudioPayloadConfig payload](-[VCAudioTier payloadConfig](self->_currentAudioTier, "payloadConfig"), "payload");
  DWORD2(v7) = -[VCAudioTier audioCodecBitrate](self->_currentAudioTier, "audioCodecBitrate");
  HIDWORD(v7) = -[VCAudioTier redPayloadBitrate](self->_currentAudioTier, "redPayloadBitrate");
  *(_OWORD *)&self->_tierInfo.tier = v6;
  *(_OWORD *)&self->_tierInfo.bundling = v7;
  reportingTierLog();
}

- (void)setRedNumPayloads:(int)a3 withMaxDelay:(int)a4 shouldResetHistory:(BOOL)a5 shouldEnableShortRED:(BOOL)a6
{
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  NSObject *v12;
  int v13;
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
  _BOOL4 v24;
  uint64_t v25;

  LODWORD(v6) = a6;
  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136316418;
      v14 = v11;
      v15 = 2080;
      v16 = "-[VCAudioTransmitter setRedNumPayloads:withMaxDelay:shouldResetHistory:shouldEnableShortRED:]";
      v17 = 1024;
      v18 = 1839;
      v19 = 1024;
      v20 = v9;
      v21 = 1024;
      v22 = v8;
      v23 = 1024;
      v24 = v7;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d numPayloads:%d maxDelay(in20ms):%d shouldResetHistory=%d", (uint8_t *)&v13, 0x2Eu);
    }
  }
  if ((int)v9 > 0)
    v6 = v6;
  else
    v6 = 0;
  -[VCAudioPayload setShortREDEnabled:](self->_currentAudioPayload, "setShortREDEnabled:", v6);
  if ((v6 & 1) == 0)
    -[VCPacketBundler resetBuffer](self->_audioBundlerShortRED, "resetBuffer");
  -[VCAudioRedBuilder setNumPayloads:](self->_redBuilder, "setNumPayloads:", v9);
  -[VCAudioRedBuilder setMaxDelay:](self->_redBuilder, "setMaxDelay:", v8);
  if (v7)
    -[VCAudioRedBuilder resetShortREDHistoryAndPrimaryPayloadHistory:](self->_redBuilder, "resetShortREDHistoryAndPrimaryPayloadHistory:", 1);
}

- (void)setStreamIDs:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int16 v9;
  uint64_t numOfStreamIDs;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  self->_idsChannelDataFormat.numOfStreamIDs = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(a3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "unsignedShortValue");
        numOfStreamIDs = self->_idsChannelDataFormat.numOfStreamIDs;
        self->_idsChannelDataFormat.numOfStreamIDs = numOfStreamIDs + 1;
        self->_idsChannelDataFormat.streamIDs[numOfStreamIDs] = v9;
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v6);
  }
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  int v6;
  int v7;
  int v8;
  NSArray *supportedNumRedundantPayload;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  unsigned int redundancyPercentage;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[10];
  VCAudioTransmitter *v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = -[VCDefaults forceRedNumPayloads](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance", a3), "forceRedNumPayloads");
  if (v6)
  {
    v7 = 100 * v6;
  }
  else
  {
    v7 = a4;
    if (self->_shouldApplyRedAsBoolean)
    {
      v8 = objc_msgSend(-[NSArray lastObject](self->_supportedNumRedundantPayload, "lastObject"), "unsignedIntegerValue");
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      supportedNumRedundantPayload = self->_supportedNumRedundantPayload;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](supportedNumRedundantPayload, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v40;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v40 != v12)
              objc_enumerationMutation(supportedNumRedundantPayload);
            v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            if (objc_msgSend(v14, "unsignedIntegerValue") >= a4 / 0x64uLL)
            {
              v8 = objc_msgSend(v14, "unsignedIntValue");
              goto LABEL_14;
            }
          }
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](supportedNumRedundantPayload, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_14:
      v7 = 100 * v8;
    }
  }
  self->_redundancyPercentage = v7;
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        redundancyPercentage = self->_redundancyPercentage;
        v25 = 136316162;
        v26 = v16;
        v27 = 2080;
        v28 = "-[VCAudioTransmitter redundancyController:redundancyPercentageDidChange:]";
        v29 = 1024;
        v30 = 1881;
        v31 = 1024;
        *(_DWORD *)v32 = a4;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = redundancyPercentage;
        v19 = " [%s] %s:%d Changed redundancyPercentage=%d applying _redundancyPercentage=%d";
        v20 = v17;
        v21 = 40;
LABEL_25:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v25, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCAudioTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = self->_redundancyPercentage;
        v25 = 136316674;
        v26 = v22;
        v27 = 2080;
        v28 = "-[VCAudioTransmitter redundancyController:redundancyPercentageDidChange:]";
        v29 = 1024;
        v30 = 1881;
        v31 = 2112;
        *(_QWORD *)v32 = v15;
        *(_WORD *)&v32[8] = 2048;
        v33 = self;
        v34 = 1024;
        v35 = a4;
        v36 = 1024;
        v37 = v24;
        v19 = " [%s] %s:%d %@(%p) Changed redundancyPercentage=%d applying _redundancyPercentage=%d";
        v20 = v23;
        v21 = 60;
        goto LABEL_25;
      }
    }
  }
}

- (void)processCDRXInNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  unsigned __int8 v6;
  unsigned __int16 v7;
  unsigned __int8 v8;
  unsigned __int16 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v8 = 0;
  v7 = 0;
  v6 = 0;
  VCNWConnectionMonitorUtils_GetCDRXCycleFromNWNotification((uint64_t)&self->_lastNWConnectionNotification, &v9, &v8);
  VCNWConnectionMonitorUtils_GetCDRXCycleFromNWNotification((uint64_t)a3, &v7, &v6);
  if (v9 != v7 || v8 != v6)
    VCPacketBundler_StoreAndEnqueueCdrxInfo((uint64_t)self->_audioBundler, v6, v7);
}

- (void)process5GRATInNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  int RATFromNWNotification;
  int v6;

  RATFromNWNotification = VCNWConnectionMonitorUtils_GetRATFromNWNotification((uint64_t)&self->_lastNWConnectionNotification);
  v6 = VCNWConnectionMonitorUtils_GetRATFromNWNotification((uint64_t)a3);
  if (!RATFromNWNotification && (v6 - 7) <= 1)
  {
    self->_ratType = 6;
    VCAudioIssueDetector_UpdateConnectionType((uint64_t)self->_audioIssueDetector, 6);
  }
}

- (void)logNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  tagVCNWConnectionNotification *p_lastNWConnectionNotification;
  int RATFromNWNotification;
  int v7;
  BOOL v8;
  int basebandAdvisoryType;
  uint64_t v11;
  NSObject *v12;
  int version;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  int frequency_band;
  int reference_signal_level;
  int signal_level;
  int signal_quality;
  int bt_coex;
  int quality_score_loss;
  int cdrx_cycle;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  int radioAccessTechnology;
  int referenceSignalLevel;
  int signalLevel;
  int signalQuality;
  int uplinkBler;
  uint64_t v33;
  int reserved;
  int v35;
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  VCAudioTransmitter *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  p_lastNWConnectionNotification = &self->_lastNWConnectionNotification;
  RATFromNWNotification = VCNWConnectionMonitorUtils_GetRATFromNWNotification((uint64_t)&self->_lastNWConnectionNotification);
  v7 = VCNWConnectionMonitorUtils_GetRATFromNWNotification((uint64_t)a3);
  LODWORD(p_lastNWConnectionNotification) = VCNWConnectionMonitorUtils_GetSignalLevelFromNWNotification((uint64_t)p_lastNWConnectionNotification);
  v8 = (_DWORD)p_lastNWConnectionNotification == VCNWConnectionMonitorUtils_GetSignalLevelFromNWNotification((uint64_t)a3)
    && RATFromNWNotification == v7;
  basebandAdvisoryType = a3->var0.basebandAdvisoryType;
  if (!v8 && basebandAdvisoryType == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    frequency_band = a3->var1.advisory.frequency_band;
    reference_signal_level = a3->var1.advisory.cell_context.reference_signal_level;
    signal_level = a3->var1.advisory.cell_context.signal_level;
    signal_quality = a3->var1.advisory.cell_context.signal_quality;
    bt_coex = a3->var1.advisory.bt_coex;
    quality_score_loss = a3->var1.advisory.quality_score_loss;
    cdrx_cycle = a3->var1.advisory.cell_context.cdrx_cycle;
    v35 = 136317698;
    v36 = v15;
    v37 = 2080;
    v38 = "-[VCAudioTransmitter logNWConnectionNotification:]";
    v39 = 1024;
    v40 = 1919;
    v41 = 2048;
    v42 = self;
    v43 = 1024;
    v44 = frequency_band;
    v45 = 1024;
    v46 = reference_signal_level;
    v47 = 1024;
    v48 = signal_level;
    v49 = 1024;
    v50 = signal_quality;
    v51 = 1024;
    v52 = bt_coex;
    v53 = 1024;
    v54 = quality_score_loss;
    v55 = 1024;
    v56 = cdrx_cycle;
    v14 = " [%s] %s:%d VCAudioTransmitter[%p] Cellular Network Notification: radioAccessTechnology=%u referenceSignalLeve"
          "l=%d signalLevel=%d signalQuality=%d uplinkBler=%u bandwidthLimitationIndication=%u cdrxCycleLength=%u";
    v24 = v16;
    v25 = 80;
LABEL_24:
    _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v35, v25);
    return;
  }
  if (basebandAdvisoryType == 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    radioAccessTechnology = a3->var1.codecRateAdaptation.radioAccessTechnology;
    referenceSignalLevel = a3->var1.linkMeasurement.referenceSignalLevel;
    signalLevel = a3->var1.linkMeasurement.signalLevel;
    signalQuality = a3->var1.linkMeasurement.signalQuality;
    uplinkBler = a3->var1.linkMeasurement.uplinkBler;
    v35 = 136317186;
    v36 = v26;
    v37 = 2080;
    v38 = "-[VCAudioTransmitter logNWConnectionNotification:]";
    v39 = 1024;
    v40 = 1923;
    v41 = 2048;
    v42 = self;
    v43 = 1024;
    v44 = radioAccessTechnology;
    v45 = 1024;
    v46 = referenceSignalLevel;
    v47 = 1024;
    v48 = signalLevel;
    v49 = 1024;
    v50 = signalQuality;
    v51 = 1024;
    v52 = uplinkBler;
    v14 = " [%s] %s:%d VCAudioTransmitter[%p] Cellular Link Measurement Notification: radioAccessTechnology=%u referenceS"
          "ignalLevel=%d signalLevel=%d signalQuality=%d uplinkBler=%u";
    v24 = v27;
    v25 = 68;
    goto LABEL_24;
  }
  if (basebandAdvisoryType == 4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        reserved = a3->var1.advisory._reserved;
        v35 = 136316162;
        v36 = v33;
        v37 = 2080;
        v38 = "-[VCAudioTransmitter logNWConnectionNotification:]";
        v39 = 1024;
        v40 = 1925;
        v41 = 2048;
        v42 = self;
        v43 = 1024;
        v44 = reserved;
        v14 = " [%s] %s:%d VCAudioTransmitter[%p] Cellular CDRX Notification: cdrxCycleLength=%u";
        goto LABEL_23;
      }
    }
  }
  else if (basebandAdvisoryType == 3 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      version = a3->var1.advisory.version;
      v35 = 136316162;
      v36 = v11;
      v37 = 2080;
      v38 = "-[VCAudioTransmitter logNWConnectionNotification:]";
      v39 = 1024;
      v40 = 1921;
      v41 = 2048;
      v42 = self;
      v43 = 1024;
      v44 = version;
      v14 = " [%s] %s:%d VCAudioTransmitter[%p] Cellular BW Limitation: bandwidthLimitationIndication=%u";
LABEL_23:
      v24 = v12;
      v25 = 44;
      goto LABEL_24;
    }
  }
}

- (void)processNWConnectionNotification:(tagVCNWConnectionNotification *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  tagVCAudioIssueDetector *audioIssueDetector;

  if (a3)
  {
    -[VCAudioTransmitter process5GRATInNWConnectionNotification:](self, "process5GRATInNWConnectionNotification:");
    -[VCAudioTransmitter processCDRXInNWConnectionNotification:](self, "processCDRXInNWConnectionNotification:", a3);
    -[VCAudioTransmitter logNWConnectionNotification:](self, "logNWConnectionNotification:", a3);
    v5 = *(_OWORD *)&a3->version;
    v6 = *(_OWORD *)(&a3->var1.thermalUpdate + 6);
    *(_OWORD *)(&self->_lastNWConnectionNotification.var1.thermalUpdate + 2) = *(_OWORD *)(&a3->var1.thermalUpdate + 2);
    *(_OWORD *)(&self->_lastNWConnectionNotification.var1.thermalUpdate + 6) = v6;
    *(_OWORD *)&self->_lastNWConnectionNotification.version = v5;
    v7 = *(_OWORD *)(&a3->var1.thermalUpdate + 10);
    v8 = *(_OWORD *)(&a3->var1.thermalUpdate + 14);
    v9 = *(_OWORD *)(&a3->var1.thermalUpdate + 18);
    *((_QWORD *)&self->_lastNWConnectionNotification.var1.thermalUpdate + 11) = *((_QWORD *)&a3->var1.thermalUpdate + 11);
    *(_OWORD *)(&self->_lastNWConnectionNotification.var1.thermalUpdate + 14) = v8;
    *(_OWORD *)(&self->_lastNWConnectionNotification.var1.thermalUpdate + 18) = v9;
    *(_OWORD *)(&self->_lastNWConnectionNotification.var1.thermalUpdate + 10) = v7;
    audioIssueDetector = self->_audioIssueDetector;
    if (audioIssueDetector)
      VCAudioIssueDetector_ProcessCellularNetworkNotification((uint64_t)audioIssueDetector, (uint64_t)a3);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioTransmitter processNWConnectionNotification:].cold.1();
  }
}

- (void)reportRTCPPacket
{
  tagVCAudioIssueDetector *audioIssueDetector;

  audioIssueDetector = self->_audioIssueDetector;
  if (audioIssueDetector)
    VCAudioIssueDetector_ReportRTCPTraffic((uint64_t)audioIssueDetector);
}

- (void)audioIssueDetectorCreateAndConfigure
{
  double mSampleRate;
  opaqueRTCReporting *reportingAgent;
  int ratType;
  int32x2_t **v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  tagVCAudioIssueDetector *audioIssueDetector;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  tagVCAudioIssueDetector *v16;
  _QWORD v17[2];
  int reportingModuleID;
  int v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  VCAudioTransmitter *v29;
  __int16 v30;
  _BYTE v31[10];
  VCAudioTransmitter *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  mSampleRate = self->_inputFormat.format.mSampleRate;
  reportingAgent = self->_reportingAgent;
  v17[0] = 0xAAAAAAAAAAAAAAAALL;
  v17[1] = reportingAgent;
  WORD1(v17[0]) = (int)mSampleRate;
  LOWORD(v17[0]) = self->_inputFormat.samplesPerFrame;
  ratType = self->_ratType;
  reportingModuleID = self->_reportingModuleID;
  v19 = ratType;
  v6 = VCAudioIssueDetector_Create(0);
  self->_audioIssueDetector = (tagVCAudioIssueDetector *)v6;
  VCAudioIssueDetector_Configure((uint64_t)v6, (unsigned __int16 *)v17);
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        audioIssueDetector = self->_audioIssueDetector;
        *(_DWORD *)buf = 136316674;
        v21 = v8;
        v22 = 2080;
        v23 = "-[VCAudioTransmitter audioIssueDetectorCreateAndConfigure]";
        v24 = 1024;
        v25 = 1962;
        v26 = 2048;
        v27 = audioIssueDetector;
        v28 = 2048;
        v29 = self;
        v30 = 1024;
        *(_DWORD *)v31 = WORD1(v17[0]);
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = LOWORD(v17[0]);
        v11 = " [%s] %s:%d Audio issue detector=%p is configured in audioTransmitter=%p with audioIOSampleRate=%d, audioIOSampleCount=%d";
        v12 = v9;
        v13 = 60;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCAudioTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_audioIssueDetector;
        *(_DWORD *)buf = 136317186;
        v21 = v14;
        v22 = 2080;
        v23 = "-[VCAudioTransmitter audioIssueDetectorCreateAndConfigure]";
        v24 = 1024;
        v25 = 1962;
        v26 = 2112;
        v27 = (void *)v7;
        v28 = 2048;
        v29 = self;
        v30 = 2048;
        *(_QWORD *)v31 = v16;
        *(_WORD *)&v31[8] = 2048;
        v32 = self;
        v33 = 1024;
        v34 = WORD1(v17[0]);
        v35 = 1024;
        v36 = LOWORD(v17[0]);
        v11 = " [%s] %s:%d %@(%p) Audio issue detector=%p is configured in audioTransmitter=%p with audioIOSampleRate=%d,"
              " audioIOSampleCount=%d";
        v12 = v15;
        v13 = 80;
        goto LABEL_11;
      }
    }
  }
}

- (void)audioIssueDetectorStopAndFinalize
{
  int32x2_t ***p_audioIssueDetector;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  tagVCAudioIssueDetector *audioIssueDetector;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  tagVCAudioIssueDetector *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  VCAudioTransmitter *v23;
  __int16 v24;
  tagVCAudioIssueDetector *v25;
  __int16 v26;
  VCAudioTransmitter *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_audioIssueDetector = (int32x2_t ***)&self->_audioIssueDetector;
  VCAudioIssueDetector_Stop((uint64_t)self->_audioIssueDetector);
  VCAudioIssueDetector_Finalize(p_audioIssueDetector);
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        audioIssueDetector = self->_audioIssueDetector;
        v14 = 136316162;
        v15 = v5;
        v16 = 2080;
        v17 = "-[VCAudioTransmitter audioIssueDetectorStopAndFinalize]";
        v18 = 1024;
        v19 = 1982;
        v20 = 2048;
        v21 = audioIssueDetector;
        v22 = 2048;
        v23 = self;
        v8 = " [%s] %s:%d Audio issue detector=%p is stopped and destroyed in audio transmitter=%p";
        v9 = v6;
        v10 = 48;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCAudioTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_audioIssueDetector;
        v14 = 136316674;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCAudioTransmitter audioIssueDetectorStopAndFinalize]";
        v18 = 1024;
        v19 = 1982;
        v20 = 2112;
        v21 = (void *)v4;
        v22 = 2048;
        v23 = self;
        v24 = 2048;
        v25 = v13;
        v26 = 2048;
        v27 = self;
        v8 = " [%s] %s:%d %@(%p) Audio issue detector=%p is stopped and destroyed in audio transmitter=%p";
        v9 = v12;
        v10 = 68;
        goto LABEL_11;
      }
    }
  }
}

- (void)handleActiveConnectionChangeMultiway:(id)a3
{
  int v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int maxAudioPacketSize;
  int *p_audioTierChangeRequestCount;
  unsigned int v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCAudioTransmitter *v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  self->_maxAudioPacketSize = objc_msgSend(a3, "maxConnectionMTU");
  v5 = VCNetworkUtils_AdditionalOverheadForIDSOptions(LOBYTE(self->_maxIDSStreamIdCount), 1, 0);
  self->_maxAudioPacketSize -= v5;
  if ((VCAudioTransmitter *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAudioTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    maxAudioPacketSize = self->_maxAudioPacketSize;
    v18 = 136316418;
    v19 = v13;
    v20 = 2080;
    v21 = "-[VCAudioTransmitter handleActiveConnectionChangeMultiway:]";
    v22 = 1024;
    v23 = 2025;
    v24 = 2112;
    v25 = v6;
    v26 = 2048;
    v27 = self;
    v28 = 1024;
    v29 = maxAudioPacketSize;
    v10 = " [%s] %s:%d %@(%p) Setting _maxAudioPacketSize=%u for multiway connection";
    v11 = v14;
    v12 = 54;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->_maxAudioPacketSize;
      v18 = 136315906;
      v19 = v7;
      v20 = 2080;
      v21 = "-[VCAudioTransmitter handleActiveConnectionChangeMultiway:]";
      v22 = 1024;
      v23 = 2025;
      v24 = 1024;
      LODWORD(v25) = v9;
      v10 = " [%s] %s:%d Setting _maxAudioPacketSize=%u for multiway connection";
      v11 = v8;
      v12 = 34;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v18, v12);
    }
  }
LABEL_12:
  self->_constantTransportOverhead = VCConnection_PerPacketConnectionOverhead((uint64_t)a3);
  if (!VCDefaults_GetBoolValueForKey(CFSTR("disableDynamicMediaPacketHeaderCalculations"), 0))
    RTPUpdateConstantTransportOverhead((uint64_t)self->_rtpHandle, self->_constantTransportOverhead);
  self->_constantTransportOverhead += v5;
  p_audioTierChangeRequestCount = &self->_audioTierChangeRequestCount;
  do
    v17 = __ldaxr((unsigned int *)p_audioTierChangeRequestCount);
  while (__stlxr(v17 + 1, (unsigned int *)p_audioTierChangeRequestCount));
}

- (void)handleActiveConnectionChangeDefault:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  unsigned int maxAudioPacketSize;
  _BOOL4 useWiFiTiers;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  unsigned int v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t IsLocalOnCellular;
  uint64_t IsRemoteOnCellular;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BYTE v28[10];
  VCAudioTransmitter *v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  self->_useWiFiTiers = objc_msgSend(a3, "isWifiToWifi");
  self->_maxAudioPacketSize = objc_msgSend(a3, "connectionMTU");
  if ((VCAudioTransmitter *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    maxAudioPacketSize = self->_maxAudioPacketSize;
    useWiFiTiers = self->_useWiFiTiers;
    v21 = 136316162;
    v22 = v6;
    v23 = 2080;
    v24 = "-[VCAudioTransmitter handleActiveConnectionChangeDefault:]";
    v25 = 1024;
    v26 = 2042;
    v27 = 1024;
    *(_DWORD *)v28 = maxAudioPacketSize;
    *(_WORD *)&v28[4] = 1024;
    *(_DWORD *)&v28[6] = useWiFiTiers;
    v10 = " [%s] %s:%d Setting _maxAudioPacketSize=%u for default mode, useWiFiTiers=%{BOOL}d";
    v11 = v7;
    v12 = 40;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (const __CFString *)-[VCAudioTransmitter performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v5 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_maxAudioPacketSize;
      v16 = self->_useWiFiTiers;
      v21 = 136316674;
      v22 = v13;
      v23 = 2080;
      v24 = "-[VCAudioTransmitter handleActiveConnectionChangeDefault:]";
      v25 = 1024;
      v26 = 2042;
      v27 = 2112;
      *(_QWORD *)v28 = v5;
      *(_WORD *)&v28[8] = 2048;
      v29 = self;
      v30 = 1024;
      v31 = v15;
      v32 = 1024;
      v33 = v16;
      v10 = " [%s] %s:%d %@(%p) Setting _maxAudioPacketSize=%u for default mode, useWiFiTiers=%{BOOL}d";
      v11 = v14;
      v12 = 60;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v21, v12);
    }
  }
LABEL_12:
  if (self->_useRateControl)
    v17 = objc_msgSend(a3, "uplinkAudioBitrateCapOneToOne");
  else
    v17 = objc_msgSend(a3, "uplinkBitrateCap");
  v18 = v17;
  IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
  IsRemoteOnCellular = VCConnection_IsRemoteOnCellular((uint64_t)a3);
  -[VCAudioTransmitter setCellTech:remoteCellular:isIPV6:audioCap:](self, "setCellTech:remoteCellular:isIPV6:audioCap:", IsLocalOnCellular, IsRemoteOnCellular, VCConnection_IsIPv6((uint64_t)a3), v18);
}

- (void)handleActiveConnectionChange:(id)a3
{
  if (self->_operatingMode == 6)
    -[VCAudioTransmitter handleActiveConnectionChangeMultiway:](self, "handleActiveConnectionChangeMultiway:", a3);
  else
    -[VCAudioTransmitter handleActiveConnectionChangeDefault:](self, "handleActiveConnectionChangeDefault:", a3);
}

- (VCPacketBundler)audioBundler
{
  return self->_audioBundler;
}

- (VCAudioTier)currentAudioTier
{
  return self->_currentAudioTier;
}

- (int)audioTxBitrate
{
  return self->_audioTxBitrate;
}

- (int)actualAudioSendingBitrate
{
  return self->_actualAudioSendingBitrate;
}

- (unsigned)inputMeter
{
  return self->_inputMeter;
}

- (void)setInputMeter:(unsigned __int8)a3
{
  self->_inputMeter = a3;
}

- (unsigned)lastSentAudioSampleTime
{
  return self->_lastSentAudioSampleTime;
}

- (int)operatingMode
{
  return self->_operatingMode;
}

- (void)setOperatingMode:(int)a3
{
  self->_operatingMode = a3;
}

- (BOOL)isRedEnabled
{
  return self->_isRedEnabled;
}

- (BOOL)ignoreSilence
{
  return self->_ignoreSilence;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (void)setTargetBitrate:(unsigned int)a3
{
  self->_targetBitrate = a3;
}

- (unsigned)rateChangeCounter
{
  return self->_rateChangeCounter;
}

- (void)setRateChangeCounter:(unsigned int)a3
{
  self->_rateChangeCounter = a3;
}

- (BOOL)isAudioStalled
{
  return self->_isAudioStalled;
}

- (void)setIsAudioStalled:(BOOL)a3
{
  self->_isAudioStalled = a3;
}

- (int)qualityIndicator
{
  return self->_qualityIndicator;
}

- (void)setQualityIndicator:(int)a3
{
  self->_qualityIndicator = a3;
}

- (unsigned)maxIDSStreamIdCount
{
  return self->_maxIDSStreamIdCount;
}

- (void)setMaxIDSStreamIdCount:(unsigned int)a3
{
  self->_maxIDSStreamIdCount = a3;
}

- (NSArray)supportedNumRedundantPayload
{
  return self->_supportedNumRedundantPayload;
}

- (void)setSupportedNumRedundantPayload:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 696);
}

- ($630EEFBF570FF8F3C5E9582E2A557BD5)currentChannelMetrics
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[6].var3;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&self[6].var1[3];
  *(_OWORD *)&retstr->var4.height = v3;
  *(_OWORD *)&retstr->var6 = *(_OWORD *)&self[6].var4.height;
  *(_QWORD *)&retstr->var8 = *(_QWORD *)&self[6].var6;
  v4 = *(_OWORD *)&self[6].var0;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[5].var7;
  *(_OWORD *)&retstr->var1[3] = v4;
  return self;
}

- (void)setCurrentChannelMetrics:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&a3->var1[3];
  *(_OWORD *)&self->_currentChannelMetrics.averageNetworkBitrate = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_currentChannelMetrics.networkBitrate[3] = v3;
  v4 = *(_OWORD *)&a3->var3;
  v5 = *(_OWORD *)&a3->var4.height;
  v6 = *(_OWORD *)&a3->var6;
  *(_QWORD *)&self->_currentChannelMetrics.lastVideoSampleTime = *(_QWORD *)&a3->var8;
  *(_OWORD *)&self->_currentChannelMetrics.frameResolution.height = v5;
  *(_OWORD *)&self->_currentChannelMetrics.lastAudioSampleTime = v6;
  *(_OWORD *)&self->_currentChannelMetrics.averageFramerate = v4;
}

- (BOOL)sendActiveVoiceOnly
{
  return self->_sendActiveVoiceOnly;
}

- (void)setSendActiveVoiceOnly:(BOOL)a3
{
  self->_sendActiveVoiceOnly = a3;
}

- (BOOL)isCurrentDTXEnabled
{
  return self->_currentDTXEnable;
}

- (BOOL)useWiFiTiers
{
  return self->_useWiFiTiers;
}

- (void)setUseWiFiTiers:(BOOL)a3
{
  self->_useWiFiTiers = a3;
}

- (VCAudioTierPicker)audioTierPicker
{
  return self->_audioTierPicker;
}

- (void)setAudioTierPicker:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (BOOL)periodicReportingEnabled
{
  return self->_periodicReportingEnabled;
}

- (void)setPeriodicReportingEnabled:(BOOL)a3
{
  self->_periodicReportingEnabled = a3;
}

- (NSArray)audioPayloads
{
  return &self->_audioPayloads->super;
}

- (VCPacketBundler)audioBundlerShortRED
{
  return self->_audioBundlerShortRED;
}

- (int)actualAudioSendingBitrateNoRED
{
  return self->_actualAudioSendingBitrateNoRED;
}

- (unsigned)mediaControlInfoVersion
{
  return self->_mediaControlInfoVersion;
}

- (void)setMediaControlInfoVersion:(unsigned __int8)a3
{
  self->_mediaControlInfoVersion = a3;
}

- (void)handleCodecModeChangeEvent:(uint64_t)a1 didUpdateBandwidth:(int *)a2 didUpdateBitrate:(os_log_t)log .cold.1(uint64_t a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = 136316418;
  v7 = a1;
  v8 = 2080;
  v9 = "-[VCAudioTransmitter handleCodecModeChangeEvent:didUpdateBandwidth:didUpdateBitrate:]";
  v10 = 1024;
  v11 = 434;
  v12 = 1024;
  v13 = v3;
  v14 = 1024;
  v15 = v4;
  v16 = 1024;
  v17 = v5;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Coded rate mode and bandwidth combination is not supported for payload=%u. mode=%u bandwidth=%u", (uint8_t *)&v6, 0x2Eu);
}

- (void)allocateLastInputSampleBuffer:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d error zero sampleBufferSize requested", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)processNWConnectionNotification:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Notification is null", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
