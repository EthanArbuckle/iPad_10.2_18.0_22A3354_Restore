@implementation VCRateControlMediaController

- (VCRateControlMediaController)initWithMediaQueue:(tagHANDLE *)a3 delegate:(id)a4
{
  VCRateControlMediaController *v6;
  SenderLargeFrameInfo *v7;
  uint64_t v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCRateControlMediaController;
  v6 = -[VCRateControlMediaController init](&v11, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(SenderLargeFrameInfo);
    v6->_senderLargeFrameInfo = v7;
    -[SenderLargeFrameInfo setIsLargeFrameRequestDisabled:](v7, "setIsLargeFrameRequestDisabled:", 1);
    objc_storeWeak(&v6->_mediaControllerDelegate, a4);
    v6->_hMediaQueue = a3;
    v6->_minProbingSpacingAggressive = 0.099;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCRateControlMediaController initWithMediaQueue:delegate:]";
        v16 = 1024;
        v17 = 196;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d VCRateControlMediaController init", buf, 0x1Cu);
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_mediaControllerDelegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)VCRateControlMediaController;
  -[VCRateControlMediaController dealloc](&v3, sel_dealloc);
}

- (void)enableBasebandLogDump:(void *)a3
{
  self->_logBasebandDump = a3;
}

- (void)setServerBag:(id)a3
{
  VCRateControlServerBag *v3;
  VCRateControlServerBag *serverBag;
  _BOOL4 v6;
  double v7;
  int ErrorLogLevelForModule;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  _BOOL4 enableAggressiveProbingSequence;
  double minProbingSpacingAggressive;
  _BOOL4 v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _BOOL4 disableBasebandFlush;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  VCRateControlMediaController *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v3 = (VCRateControlServerBag *)a3;
  v36 = *MEMORY[0x1E0C80C00];
  serverBag = self->_serverBag;
  if (serverBag != a3)
  {

    v3 = v3;
    self->_serverBag = v3;
  }
  v6 = -[VCRateControlServerBag containsAllSecondaryKeysWithPrimaryKey:](v3, "containsAllSecondaryKeysWithPrimaryKey:", CFSTR("probingSequence"));
  if (v6)
  {
    self->_enableAggressiveProbingSequence = objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", CFSTR("probingSequence"), CFSTR("aggModeEnabled"), 0), "BOOLValue");
    objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", CFSTR("probingSequence"), CFSTR("minAggProbingSpacing"), 1), "doubleValue");
    self->_minProbingSpacingAggressive = v7;
  }
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v9 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(CFSTR("probingSequence"), "UTF8String");
      enableAggressiveProbingSequence = self->_enableAggressiveProbingSequence;
      minProbingSpacingAggressive = self->_minProbingSpacingAggressive;
      v20 = 136316930;
      v21 = v10;
      v22 = 2080;
      v23 = "-[VCRateControlMediaController setServerBag:]";
      v24 = 1024;
      v25 = 331;
      v26 = 2048;
      v27 = self;
      v28 = 2080;
      v29 = v12;
      v30 = 1024;
      v31 = v6;
      v32 = 1024;
      v33 = enableAggressiveProbingSequence;
      v34 = 2048;
      v35 = minProbingSpacingAggressive;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d [%p] config for key=%s serverBagContainsGroup=%d _enableAggressiveProbingSequence=%d _minProbingSpacingAggressive=%f", (uint8_t *)&v20, 0x46u);
    }
  }
  v15 = -[VCRateControlServerBag containsAllSecondaryKeysWithPrimaryKey:](self->_serverBag, "containsAllSecondaryKeysWithPrimaryKey:", CFSTR("baseband"));
  if (v15)
    self->_disableBasebandFlush = objc_msgSend(-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](self->_serverBag, "valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:", CFSTR("baseband"), CFSTR("disableBBFlush"), 0), "BOOLValue");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(CFSTR("baseband"), "UTF8String");
      disableBasebandFlush = self->_disableBasebandFlush;
      v20 = 136316674;
      v21 = v16;
      v22 = 2080;
      v23 = "-[VCRateControlMediaController setServerBag:]";
      v24 = 1024;
      v25 = 337;
      v26 = 2048;
      v27 = self;
      v28 = 2080;
      v29 = v18;
      v30 = 1024;
      v31 = v15;
      v32 = 1024;
      v33 = disableBasebandFlush;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d [%p] config for key=%s serverBagContainsGroup=%d _disableBasebandFlush=%d", (uint8_t *)&v20, 0x3Cu);
    }
  }
}

- (void)setStatisticsCollector:(id)a3
{
  uint64_t v5;
  AVCStatisticsCollector *statisticsCollector;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];

  self->_statisticsCollector = (AVCStatisticsCollector *)a3;
  v5 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  statisticsCollector = self->_statisticsCollector;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__VCRateControlMediaController_setStatisticsCollector___block_invoke;
  v7[3] = &unk_1E9E523A0;
  v7[4] = v5;
  -[AVCStatisticsCollector registerStatisticsChangeHandlerWithType:handler:](statisticsCollector, "registerStatisticsChangeHandlerWithType:handler:", 10, v7);
}

void __55__VCRateControlMediaController_setStatisticsCollector___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  if (*(_DWORD *)a2 == 10)
  {
    v3 = (void *)MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"));
    if (v3)
    {
      v4 = v3;
      switch(*(_DWORD *)(a2 + 24))
      {
        case 0:
          if (objc_msgSend(v3, "isRTPFlushBasebandFromVCRateControl"))
            objc_msgSend(v4, "decreaseFlushCount:", 1);
          break;
        case 1:
          if (objc_msgSend(v3, "isRTPFlushBasebandFromVCRateControl"))
            objc_msgSend(v4, "setBasebandFlushCount:", *(_DWORD *)(a2 + 28) + objc_msgSend(v4, "basebandFlushCount"));
          break;
        case 2:
          if (objc_msgSend(v3, "isRTPFlushBasebandFromVCRateControl"))
            objc_msgSend(v4, "increaseFlushCountForVideoRefresh:transactionID:", 1, *(unsigned __int16 *)(a2 + 32));
          break;
        case 3:
          if (objc_msgSend(v3, "isRTPFlushBasebandFromVCRateControl"))
            objc_msgSend(v4, "increaseFlushCountForAudioStall:audioStallBitrate:", 1, *(unsigned int *)(a2 + 36));
          break;
        case 4:
          objc_msgSend(v3, "recordVideoRefreshFrameWithTimestamp:payloadType:packetCount:isKeyFrame:", *(unsigned int *)(a2 + 64), *(unsigned __int8 *)(a2 + 68), *(unsigned int *)(a2 + 72), *(unsigned __int8 *)(a2 + 44));
          break;
        default:
          break;
      }
      CFRelease(v4);
    }
  }
}

- (void)pauseVideoByUser:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  unsigned int targetBitrate;
  void *logBasebandDump;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  _BOOL4 IsVideoStopped;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_isAudioOnly)
  {
    v3 = a3;
    if (self->_isVideoPausedByUser && !a3)
      VCRateControlMediaController_SetAudioFractionTier((uint64_t)self, 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (v3)
          v7 = "pause";
        else
          v7 = "resume";
        targetBitrate = self->_targetBitrate;
        *(_DWORD *)buf = 136316418;
        v18 = v5;
        v19 = 2080;
        v20 = "-[VCRateControlMediaController pauseVideoByUser:]";
        v21 = 1024;
        v22 = 662;
        v23 = 2080;
        v24 = v7;
        v25 = 1024;
        v26 = targetBitrate;
        v27 = 1024;
        IsVideoStopped = VCRateControlMediaController_IsVideoStopped(self);
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Video %s by user [rate:%u, videoStopped:%d]", buf, 0x32u);
      }
    }
    logBasebandDump = self->_logBasebandDump;
    if (logBasebandDump)
    {
      if (v3)
        v10 = "pause";
      else
        v10 = "resume";
      VCRateControlMediaController_IsVideoStopped(self);
      VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "Video %s by user, [rate:%u, BBRate:%u, audioFraction:%d, videoStopped:%d]\n", v11, v12, v13, v14, v15, v16, (char)v10);
    }
    self->_isVideoPausedByUser = v3;
  }
}

- (void)setIsRemoteAudioPaused:(BOOL)a3
{
  AVCStatisticsCollector *statisticsCollector;
  _BYTE v6[17];
  __int16 v7;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[28];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_isRemoteAudioPaused && !a3)
  {
    memset(&v6[4], 0, 13);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    memset(v19, 0, sizeof(v19));
    statisticsCollector = self->_statisticsCollector;
    *(_DWORD *)v6 = 7;
    v7 = 1;
    v8 = 1;
    v9 = 0x600000000;
    VCRateControlSetStatistics(statisticsCollector, v6);
  }
  self->_isRemoteAudioPaused = a3;
}

- (void)decreaseFlushCount:(int)a3
{
  int basebandFlushCount;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  int v13;
  void *logBasebandDump;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  basebandFlushCount = self->_basebandFlushCount;
  v12 = micro();
  v13 = self->_basebandFlushCount - a3;
  self->_basebandFlushCount = v13;
  self->_lastBasebandFlushCountChangeTime = v12;
  if (v13 >= 1)
    self->_lastBasebandHighNBDCDTime = v12;
  logBasebandDump = self->_logBasebandDump;
  if (logBasebandDump)
  {
    VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "Decrease basebandFlushCount %d -> %d.\n", v6, v7, v8, v9, v10, v11, basebandFlushCount);
    v13 = self->_basebandFlushCount;
  }
  if (v13 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_basebandFlushCount;
      *(_DWORD *)buf = 136315906;
      v19 = v15;
      v20 = 2080;
      v21 = "-[VCRateControlMediaController decreaseFlushCount:]";
      v22 = 1024;
      v23 = 771;
      v24 = 1024;
      v25 = v17;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d Negative flush count: %d. Bad flush count maintainance!", buf, 0x22u);
    }
  }
}

- (BOOL)didMediaGetFlushedWithPayloadType:(unsigned __int8)a3 transactionID:(unsigned __int16)a4 packetDropped:(unsigned __int16)a5 sequenceNumberArray:(unsigned __int16 *)a6
{
  int v6;
  void *v8;
  tagVCMediaQueue *vcMediaQueue;
  tagHANDLE *hMediaQueue;

  if (!self->_isRTPFlushBasebandFromVCRateControl)
    return 1;
  v6 = a5;
  if (self->_videoPayloadType == a3)
  {
    self->_basebandFlushedVideoCount += a5;
    if (a5 && self->_videoFlushTransactionID < a4)
    {
      v8 = (void *)MEMORY[0x1DF086F1C](&self->_mediaControllerDelegate, a2);
      objc_msgSend(v8, "mediaController:mediaSuggestionDidChange:", self, 0x10000);
      if (v8)
        CFRelease(v8);
      return 1;
    }
  }
  else
  {
    self->_basebandFlushedAudioCount += a5;
  }
  if (self->_isAudioStall)
  {
    vcMediaQueue = self->_vcMediaQueue;
    if (vcMediaQueue)
    {
      VCMediaQueue_BasebandFlushAcked((uint64_t)vcMediaQueue, a5, a6, a4);
    }
    else
    {
      hMediaQueue = self->_hMediaQueue;
      if (hMediaQueue != (tagHANDLE *)0xFFFFFFFFLL)
        MediaQueue_BBFlushAcked((uint64_t)hMediaQueue, a5, (uint64_t)a6, a4);
    }
    if (v6)
      return 1;
  }
  return 0;
}

- (int)basebandFlushCount
{
  if (self->_isRTPFlushBasebandFromVCRateControl)
    return self->_basebandFlushCount;
  else
    return 0;
}

- (void)setTargetBitrate:(unsigned int)a3
{
  self->_targetBitrate = a3;
  self->_isInThrottlingMode = a3 >> 5 < 0xC35;
}

- (BOOL)rampUpAudioFraction
{
  _BOOL4 IsVideoStopped;
  double v4;
  int audioFractionTier;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *logBasebandDump;

  if (self->_isAudioOnly)
    goto LABEL_2;
  IsVideoStopped = VCRateControlMediaController_IsVideoStopped(self);
  if (!IsVideoStopped)
    return IsVideoStopped;
  v4 = micro();
  if (v4 - self->_lastAudioFractionChangeTime <= 2.0)
  {
LABEL_2:
    LOBYTE(IsVideoStopped) = 0;
  }
  else
  {
    audioFractionTier = self->_audioFractionTier;
    if (audioFractionTier == 1)
    {
      v6 = 0;
    }
    else
    {
      LOBYTE(IsVideoStopped) = 0;
      if (audioFractionTier != 2)
        return IsVideoStopped;
      v6 = 1;
    }
    VCRateControlMediaController_SetAudioFractionTier((uint64_t)self, v6);
    self->_lastAudioFractionChangeTime = v4;
    logBasebandDump = self->_logBasebandDump;
    if (logBasebandDump)
      VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "Change audio fraction tier from %d -> %d.\n", v7, v8, v9, v10, v11, v12, audioFractionTier);
    LOBYTE(IsVideoStopped) = 1;
  }
  return IsVideoStopped;
}

- (unsigned)probingLargeFrameSize
{
  AVCStatisticsCollector *statisticsCollector;
  double v4;
  double v5;
  BOOL v6;
  AVCStatisticsCollector *v7;
  uint64_t afrcRemoteEstimatedBandwidth;
  uint64_t probingLargeFrameSize;

  statisticsCollector = self->_statisticsCollector;
  if (statisticsCollector
    && -[AVCStatisticsCollector mode](statisticsCollector, "mode") != 1
    && -[AVCStatisticsCollector mode](self->_statisticsCollector, "mode") != 3
    && -[AVCStatisticsCollector mode](self->_statisticsCollector, "mode") != 7
    || !self->_isSenderProbingEnabled)
  {
    return 0;
  }
  v4 = micro();
  self->_probingLargeFrameSize = 0;
  -[SenderLargeFrameInfo lastProbingSequenceTimeExpect](self->_senderLargeFrameInfo, "lastProbingSequenceTimeExpect");
  if (v5 == 0.0)
  {
    -[SenderLargeFrameInfo setLastProbingSequenceTimeExpect:](self->_senderLargeFrameInfo, "setLastProbingSequenceTimeExpect:", v4);
    -[SenderLargeFrameInfo setLastProbingSequenceTimeActual:](self->_senderLargeFrameInfo, "setLastProbingSequenceTimeActual:", v4);
    -[SenderLargeFrameInfo setStartTime:](self->_senderLargeFrameInfo, "setStartTime:", v4);
  }
  v6 = -[VCRateControlMediaController isProbingLargeFrameRequiredAtTime:](self, "isProbingLargeFrameRequiredAtTime:", v4);
  v7 = self->_statisticsCollector;
  if (v7)
    afrcRemoteEstimatedBandwidth = -[AVCStatisticsCollector sharedRemoteEstimatedBandwidth](v7, "sharedRemoteEstimatedBandwidth");
  else
    afrcRemoteEstimatedBandwidth = self->_afrcRemoteEstimatedBandwidth;
  -[VCRateControlMediaController updateLargeFrameSizeWithBandwidth:](self, "updateLargeFrameSizeWithBandwidth:", afrcRemoteEstimatedBandwidth);
  if (v6)
  {
    probingLargeFrameSize = -[SenderLargeFrameInfo largeFrameSizeAtCurrentBandwidth](self->_senderLargeFrameInfo, "largeFrameSizeAtCurrentBandwidth");
    self->_probingLargeFrameSize = probingLargeFrameSize;
  }
  else
  {
    probingLargeFrameSize = self->_probingLargeFrameSize;
  }
  -[SenderLargeFrameInfo setLargeFrameSizeRequested:](self->_senderLargeFrameInfo, "setLargeFrameSizeRequested:", probingLargeFrameSize);
  return self->_probingLargeFrameSize;
}

- (unsigned)probingSequencePacketCount
{
  unsigned int result;

  if (self->_isSenderProbingEnabled)
  {
    result = -[SenderLargeFrameInfo isLastFrameProbingSequence](self->_senderLargeFrameInfo, "isLastFrameProbingSequence");
    if (result)
      result = -[SenderLargeFrameInfo probingSequencePacketCount](self->_senderLargeFrameInfo, "probingSequencePacketCount");
  }
  else
  {
    result = 0;
  }
  self->_probingSequencePacketCount = result;
  return result;
}

- (unsigned)probingSequencePacketSize
{
  unsigned int result;

  if (self->_isSenderProbingEnabled)
  {
    result = -[SenderLargeFrameInfo isLastFrameProbingSequence](self->_senderLargeFrameInfo, "isLastFrameProbingSequence");
    if (result)
      result = -[SenderLargeFrameInfo probingSequencePacketSize](self->_senderLargeFrameInfo, "probingSequencePacketSize");
  }
  else
  {
    result = 0;
  }
  self->_probingSequencePacketSize = result;
  return result;
}

- (void)scheduleProbingSequenceWithFrameSize:(unsigned int)a3 paddingBytes:(unsigned int)a4 timestamp:(unsigned int)a5 fecRatio:(double)a6 isProbingSequenceScheduled:(BOOL *)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v13;
  double v14;
  double v15;
  VCRateControlMediaController *v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  double minProbingSpacingAggressive;

  if (self->_isSenderProbingEnabled)
  {
    v9 = *(_QWORD *)&a5;
    LODWORD(v10) = a4;
    v11 = *(_QWORD *)&a3;
    if (-[SenderLargeFrameInfo largeFrameSizeAtCurrentBandwidth](self->_senderLargeFrameInfo, "largeFrameSizeAtCurrentBandwidth"))
    {
      if (v10 >= 9)
        v10 = v10;
      else
        v10 = 0;
      if (-[SenderLargeFrameInfo largeFrameSizeAtCurrentBandwidth](self->_senderLargeFrameInfo, "largeFrameSizeAtCurrentBandwidth") > ((double)v11 * a6))goto LABEL_7;
      v13 = micro();
      -[SenderLargeFrameInfo lastProbingSequenceTimeActual](self->_senderLargeFrameInfo, "lastProbingSequenceTimeActual");
      v15 = v13 - v14;
      if (-[SenderLargeFrameInfo largeFrameSizeRequested](self->_senderLargeFrameInfo, "largeFrameSizeRequested"))
      {
        -[VCRateControlMediaController scheduleProbingSequenceAtTime:](self, "scheduleProbingSequenceAtTime:", v13);
        v16 = self;
        v17 = v13;
        v18 = v9;
        v19 = v15;
        v20 = v11;
        v21 = v10;
        v22 = a6;
        v23 = 1;
      }
      else
      {
        minProbingSpacingAggressive = 1.0;
        if (!self->_isInThrottlingMode)
        {
          if (self->_enableAggressiveProbingSequence)
            minProbingSpacingAggressive = self->_minProbingSpacingAggressive;
          else
            minProbingSpacingAggressive = 0.333;
        }
        if (v15 <= minProbingSpacingAggressive)
        {
LABEL_7:
          -[SenderLargeFrameInfo setIsLastFrameProbingSequence:](self->_senderLargeFrameInfo, "setIsLastFrameProbingSequence:", 0);
          if (!a7)
            return;
          goto LABEL_8;
        }
        -[VCRateControlMediaController scheduleProbingSequenceAtTime:](self, "scheduleProbingSequenceAtTime:", v13);
        v16 = self;
        v17 = v13;
        v18 = v9;
        v19 = v15;
        v20 = v11;
        v21 = v10;
        v22 = a6;
        v23 = 0;
      }
      -[VCRateControlMediaController printLargeFrameStatsAtTime:timestamp:timeSinceLastProbingSequence:frameSize:wastedBytes:fecRatio:isFrameRequested:](v16, "printLargeFrameStatsAtTime:timestamp:timeSinceLastProbingSequence:frameSize:wastedBytes:fecRatio:isFrameRequested:", v18, v20, v21, v23, v17, v19, v22);
      if (!a7)
        return;
LABEL_8:
      *a7 = -[SenderLargeFrameInfo isLastFrameProbingSequence](self->_senderLargeFrameInfo, "isLastFrameProbingSequence");
    }
  }
}

- (void)recordVideoRefreshFrameWithTimestamp:(unsigned int)a3 payloadType:(unsigned __int8)a4 packetCount:(unsigned int)a5 isKeyFrame:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  void *logBasebandDump;
  const char *v19;

  v6 = a6;
  v17 = micro();
  self->_lastVideoRefreshFrameTime = v17;
  self->_videoRefreshFrameTimestamp = a3;
  self->_videoRefreshFramePacketCount = a5;
  if (v6)
  {
    self->_lastVideoKeyFrameTime = v17;
    self->_videoPayloadType = a4;
  }
  logBasebandDump = self->_logBasebandDump;
  if (logBasebandDump)
  {
    v19 = "RefreshFrame";
    if (v6)
      v19 = "KeyFrame";
    VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "%s frame (%08X) is generated PT (%u), %d packets.\n", v11, v12, v13, v14, v15, v16, (char)v19);
  }
}

- (BOOL)increaseFlushCountForVideoRefresh:(int)a3 transactionID:(unsigned __int16)a4
{
  int basebandFlushCount;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *logBasebandDump;

  basebandFlushCount = self->_basebandFlushCount;
  self->_basebandFlushCount = basebandFlushCount + a3;
  self->_lastBasebandFlushCountChangeTime = micro();
  self->_videoFlushTransactionID = a4;
  logBasebandDump = self->_logBasebandDump;
  if (logBasebandDump)
    VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "Increase basebandFlushCount %d -> %d due to video refresh [TID:%0X].\n", v7, v8, v9, v10, v11, v12, basebandFlushCount);
  return self->_basebandFlushableQueueDepth != 0;
}

- (BOOL)increaseFlushCountForAudioStall:(int)a3 audioStallBitrate:(unsigned int)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  int basebandFlushCount;
  void *logBasebandDump;

  if (a4)
  {
    v13 = micro();
    basebandFlushCount = self->_basebandFlushCount;
    self->_basebandFlushCount = basebandFlushCount + a3;
    self->_lastBasebandFlushCountChangeTime = v13;
    self->_lastAudioStallFlushTime = v13;
    logBasebandDump = self->_logBasebandDump;
    if (logBasebandDump)
      VRLogfilePrintWithTimestamp((uint64_t)logBasebandDump, "Increase basebandFlushCount %d -> %d due to audio stall.\n", v7, v8, v9, v10, v11, v12, basebandFlushCount);
  }
  self->_audioStallBitrate = a4;
  return self->_basebandFlushableQueueDepth != 0;
}

- (void)scheduleProbingSequenceAtTime:(double)a3
{
  SenderLargeFrameInfo *senderLargeFrameInfo;
  double v6;
  SenderLargeFrameInfo *v7;
  double v8;
  double v9;

  senderLargeFrameInfo = self->_senderLargeFrameInfo;
  -[SenderLargeFrameInfo lastProbingSequenceTimeExpect](senderLargeFrameInfo, "lastProbingSequenceTimeExpect");
  -[SenderLargeFrameInfo setLastProbingSequenceTimeExpect:](senderLargeFrameInfo, "setLastProbingSequenceTimeExpect:", v6 + 0.666);
  -[SenderLargeFrameInfo setLastProbingSequenceTimeActual:](self->_senderLargeFrameInfo, "setLastProbingSequenceTimeActual:", a3);
  -[SenderLargeFrameInfo lastProbingSequenceTimeExpect](self->_senderLargeFrameInfo, "lastProbingSequenceTimeExpect");
  v7 = self->_senderLargeFrameInfo;
  if (v8 < a3 + -0.666)
    goto LABEL_4;
  -[SenderLargeFrameInfo lastProbingSequenceTimeExpect](v7, "lastProbingSequenceTimeExpect");
  if (v9 > a3 + 0.666)
  {
    v7 = self->_senderLargeFrameInfo;
LABEL_4:
    -[SenderLargeFrameInfo setLastProbingSequenceTimeExpect:](v7, "setLastProbingSequenceTimeExpect:");
  }
  -[SenderLargeFrameInfo setProbingSequenceCount:](self->_senderLargeFrameInfo, "setProbingSequenceCount:", -[SenderLargeFrameInfo probingSequenceCount](self->_senderLargeFrameInfo, "probingSequenceCount") + 1);
  -[SenderLargeFrameInfo setIsLastFrameProbingSequence:](self->_senderLargeFrameInfo, "setIsLastFrameProbingSequence:", 1);
}

- (void)printLargeFrameStatsAtTime:(double)a3 timestamp:(unsigned int)a4 timeSinceLastProbingSequence:(double)a5 frameSize:(unsigned int)a6 wastedBytes:(unsigned int)a7 fecRatio:(double)a8 isFrameRequested:(BOOL)a9
{
  char v10;
  AVCStatisticsCollector *statisticsCollector;
  void *logBWEDump;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v10 = a6;
  -[SenderLargeFrameInfo startTime](self->_senderLargeFrameInfo, "startTime");
  -[SenderLargeFrameInfo probingSequenceCount](self->_senderLargeFrameInfo, "probingSequenceCount");
  -[SenderLargeFrameInfo setTotalLargeFrameWaste:](self->_senderLargeFrameInfo, "setTotalLargeFrameWaste:", -[SenderLargeFrameInfo totalLargeFrameWaste](self->_senderLargeFrameInfo, "totalLargeFrameWaste") + a7);
  -[SenderLargeFrameInfo totalLargeFrameWaste](self->_senderLargeFrameInfo, "totalLargeFrameWaste");
  statisticsCollector = self->_statisticsCollector;
  if (statisticsCollector)
    -[AVCStatisticsCollector sharedRemoteEstimatedBandwidth](statisticsCollector, "sharedRemoteEstimatedBandwidth");
  logBWEDump = self->_logBWEDump;
  -[SenderLargeFrameInfo largeFrameSizeAtCurrentBandwidth](self->_senderLargeFrameInfo, "largeFrameSizeAtCurrentBandwidth");
  VRLogfilePrintWithTimestamp((uint64_t)logBWEDump, "A LARGE FRAME of %d size %s (actual:%d, req:%d), rate:%f, [waste:%d wastBitrate:%d, avgWastBitrate:%d], txRate:%d, remoteBW:%d, throttling:%d, timestamp:%u\n", v14, v15, v16, v17, v18, v19, v10);
}

- (BOOL)isProbingLargeFrameRequiredAtTime:(double)a3
{
  double v5;
  double v6;
  BOOL v7;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  double v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (-[SenderLargeFrameInfo isLargeFrameRequestDisabled](self->_senderLargeFrameInfo, "isLargeFrameRequestDisabled"))
  {
    -[SenderLargeFrameInfo startTime](self->_senderLargeFrameInfo, "startTime");
    v6 = a3 - v5;
    v7 = v6 >= 3.0 && !self->_shouldDisableLargeFrameRequestsWhenInitialRampUp;
    if (v7 || v6 >= 10.0)
      -[SenderLargeFrameInfo setIsLargeFrameRequestDisabled:](self->_senderLargeFrameInfo, "setIsLargeFrameRequestDisabled:", 0);
  }
  -[VCRateControlMediaController updateProbingLargeFrameSizeCap](self, "updateProbingLargeFrameSizeCap");
  if (-[SenderLargeFrameInfo isLargeFrameRequestDisabled](self->_senderLargeFrameInfo, "isLargeFrameRequestDisabled"))
    return 0;
  -[SenderLargeFrameInfo lastProbingSequenceTimeExpect](self->_senderLargeFrameInfo, "lastProbingSequenceTimeExpect");
  v10 = a3 - v9;
  -[SenderLargeFrameInfo lastProbingSequenceTimeActual](self->_senderLargeFrameInfo, "lastProbingSequenceTimeActual");
  v12 = a3 - v11;
  v13 = a3 - v11 >= 0.333 && v10 >= 0.666;
  if ((int)VRTraceGetErrorLogLevelForModule() < 8)
    goto LABEL_23;
  v14 = VRTraceErrorLogLevelToCSTR();
  v15 = *MEMORY[0x1E0CF2758];
  v16 = *MEMORY[0x1E0CF2758];
  if (*MEMORY[0x1E0CF2748])
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (v13)
        v17 = "";
      else
        v17 = "not";
      -[SenderLargeFrameInfo lastProbingSequenceTimeExpect](self->_senderLargeFrameInfo, "lastProbingSequenceTimeExpect");
      v19 = v18;
      -[SenderLargeFrameInfo lastProbingSequenceTimeActual](self->_senderLargeFrameInfo, "lastProbingSequenceTimeActual");
      v26 = 136317186;
      v27 = v14;
      v28 = 2080;
      v29 = "-[VCRateControlMediaController isProbingLargeFrameRequiredAtTime:]";
      v30 = 1024;
      v31 = 1205;
      v32 = 2080;
      v33 = v17;
      v34 = 2048;
      v35 = a3;
      v36 = 2048;
      v37 = v19;
      v38 = 2048;
      v39 = v20;
      v40 = 2048;
      v41 = v10;
      v42 = 2048;
      v43 = v12;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCRC [%s] %s:%d A fake large frame is %s required [time:%.2f, expected:%.2f, actual:%.2f, timeDiffExpect:%.2f, timeDiffActual:%.2f]", (uint8_t *)&v26, 0x58u);
      if (!v13)
        return 0;
      goto LABEL_24;
    }
LABEL_23:
    if (!v13)
      return 0;
    goto LABEL_24;
  }
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    goto LABEL_23;
  if (v13)
    v22 = "";
  else
    v22 = "not";
  -[SenderLargeFrameInfo lastProbingSequenceTimeExpect](self->_senderLargeFrameInfo, "lastProbingSequenceTimeExpect");
  v24 = v23;
  -[SenderLargeFrameInfo lastProbingSequenceTimeActual](self->_senderLargeFrameInfo, "lastProbingSequenceTimeActual");
  v26 = 136317186;
  v27 = v14;
  v28 = 2080;
  v29 = "-[VCRateControlMediaController isProbingLargeFrameRequiredAtTime:]";
  v30 = 1024;
  v31 = 1205;
  v32 = 2080;
  v33 = v22;
  v34 = 2048;
  v35 = a3;
  v36 = 2048;
  v37 = v24;
  v38 = 2048;
  v39 = v25;
  v40 = 2048;
  v41 = v10;
  v42 = 2048;
  v43 = v12;
  _os_log_debug_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEBUG, "VCRC [%s] %s:%d A fake large frame is %s required [time:%.2f, expected:%.2f, actual:%.2f, timeDiffExpect:%.2f, timeDiffActual:%.2f]", (uint8_t *)&v26, 0x58u);
  if (!v13)
    return 0;
LABEL_24:
  if (self->_isRateLimitedMaxTimeExceeded)
    return 1;
  if (v12 > 2.0)
  {
    self->_probingLargeFrameSizeCap >>= 1;
    return 1;
  }
  return 0;
}

- (void)updateProbingLargeFrameSizeCap
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCRC [%s] %s:%d Audio sending bitrate used up all available uplink bandwidth, do minimum probing by setting large frame size cap to 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateLargeFrameSizeWithBandwidth:(unsigned int)a3
{
  unsigned int probingLargeFrameSizeCap;
  uint64_t v5;
  signed int v6;
  int v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;

  probingLargeFrameSizeCap = a3 / 0x190;
  if (a3 / 0x190 >= self->_probingLargeFrameSizeCap)
    probingLargeFrameSizeCap = self->_probingLargeFrameSizeCap;
  if (probingLargeFrameSizeCap < 0xABE)
  {
    if (probingLargeFrameSizeCap <= 0x112)
      v7 = 257;
    else
      v7 = probingLargeFrameSizeCap;
    if (probingLargeFrameSizeCap < 0x1F4)
    {
      v8 = 1;
    }
    else
    {
      v7 = (probingLargeFrameSizeCap >> 1) + 1;
      v8 = 2;
    }
    v9 = probingLargeFrameSizeCap >= 0x6D6;
    if (probingLargeFrameSizeCap >= 0x6D6)
      v6 = (unsigned __int16)probingLargeFrameSizeCap / 3u + 1;
    else
      v6 = v7;
    if (v9)
      v5 = 3;
    else
      v5 = v8;
  }
  else
  {
    LODWORD(v5) = 2;
    do
      v5 = (v5 + 1);
    while (probingLargeFrameSizeCap / v5 > 0x564);
    v6 = probingLargeFrameSizeCap / v5 + 1;
  }
  if (v6 <= 257)
    v10 = 257;
  else
    v10 = v6;
  -[SenderLargeFrameInfo setProbingSequencePacketCount:](self->_senderLargeFrameInfo, "setProbingSequencePacketCount:", v5);
  -[SenderLargeFrameInfo setProbingSequencePacketSize:](self->_senderLargeFrameInfo, "setProbingSequencePacketSize:", v10);
  -[SenderLargeFrameInfo setLargeFrameSizeAtCurrentBandwidth:](self->_senderLargeFrameInfo, "setLargeFrameSizeAtCurrentBandwidth:", (v5 * v10));
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (unsigned)videoSendingBitrate
{
  return self->_videoSendingBitrate;
}

- (void)setVideoSendingBitrate:(unsigned int)a3
{
  self->_videoSendingBitrate = a3;
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (void)setBasebandFlushCount:(int)a3
{
  self->_basebandFlushCount = a3;
}

- (int)basebandFlushedVideoCount
{
  return self->_basebandFlushedVideoCount;
}

- (int)basebandFlushedAudioCount
{
  return self->_basebandFlushedAudioCount;
}

- (BOOL)isVideoStoppedByVCRateControl
{
  return self->_isVideoStoppedByVCRateControl;
}

- (BOOL)isSenderProbingEnabled
{
  return self->_isSenderProbingEnabled;
}

- (void)setIsSenderProbingEnabled:(BOOL)a3
{
  self->_isSenderProbingEnabled = a3;
}

- (BOOL)isAudioOnly
{
  return self->_isAudioOnly;
}

- (void)setIsAudioOnly:(BOOL)a3
{
  self->_isAudioOnly = a3;
}

- (BOOL)isInThrottlingMode
{
  return self->_isInThrottlingMode;
}

- (BOOL)isRemoteAudioPaused
{
  return self->_isRemoteAudioPaused;
}

- (BOOL)allowVideoStop
{
  return self->_allowVideoStop;
}

- (void)setAllowVideoStop:(BOOL)a3
{
  self->_allowVideoStop = a3;
}

- (unsigned)afrcRemoteEstimatedBandwidth
{
  return self->_afrcRemoteEstimatedBandwidth;
}

- (void)setAfrcRemoteEstimatedBandwidth:(unsigned int)a3
{
  self->_afrcRemoteEstimatedBandwidth = a3;
}

- (BOOL)isRTPFlushBasebandFromVCRateControl
{
  return self->_isRTPFlushBasebandFromVCRateControl;
}

- (void)setIsRTPFlushBasebandFromVCRateControl:(BOOL)a3
{
  self->_isRTPFlushBasebandFromVCRateControl = a3;
}

- (int)audioFractionTier
{
  return self->_audioFractionTier;
}

- (double)lastVideoRefreshFrameTime
{
  return self->_lastVideoRefreshFrameTime;
}

- (BOOL)enableAggressiveProbingSequence
{
  return self->_enableAggressiveProbingSequence;
}

- (void)setEnableAggressiveProbingSequence:(BOOL)a3
{
  self->_enableAggressiveProbingSequence = a3;
}

- (VCRateControlServerBag)serverBag
{
  return self->_serverBag;
}

- (tagHANDLE)mediaQueue
{
  return self->_hMediaQueue;
}

- (void)setMediaQueue:(tagHANDLE *)a3
{
  self->_hMediaQueue = a3;
}

- (tagVCMediaQueue)vcMediaQueue
{
  return self->_vcMediaQueue;
}

- (void)setVcMediaQueue:(tagVCMediaQueue *)a3
{
  self->_vcMediaQueue = a3;
}

- (BOOL)disableBasebandFlush
{
  return self->_disableBasebandFlush;
}

- (double)lastBasebandFlushCountChangeTime
{
  return self->_lastBasebandFlushCountChangeTime;
}

- (void)setLastBasebandFlushCountChangeTime:(double)a3
{
  self->_lastBasebandFlushCountChangeTime = a3;
}

@end
