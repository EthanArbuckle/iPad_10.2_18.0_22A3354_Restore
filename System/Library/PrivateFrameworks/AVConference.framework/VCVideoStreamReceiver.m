@implementation VCVideoStreamReceiver

- (VCVideoStreamReceiver)initWithConfig:(tagVCVideoStreamReceiverConfig *)a3
{
  id var1;
  VCVideoStreamReceiver *v6;
  VCVideoStreamReceiver *v7;
  opaqueRTCReporting *var3;
  VCVideoStreamRateAdaptation *v9;
  const __CFAllocator *v10;
  const CMBufferCallbacks *CallbacksForUnsortedSampleBuffers;
  OpaqueCMMemoryPool *v12;
  CFAllocatorRef Allocator;
  NSObject *CustomRootQueue;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamReceiver initWithConfig:].cold.1();
    }
    goto LABEL_17;
  }
  var1 = a3->var1;
  if (!var1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamReceiver initWithConfig:].cold.2();
    }
LABEL_17:

    return 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)VCVideoStreamReceiver;
  v6 = -[VCVideoReceiverBase initWithDelegate:delegateFunctions:](&v16, sel_initWithDelegate_delegateFunctions_, var1, &a3->var2);
  v7 = v6;
  if (v6)
  {
    v6->_hRTP = a3->var0;
    v6->_receivedFirstPacket = 0;
    v6->_stats = objc_alloc_init(VCMediaStreamStats);
    var3 = a3->var3;
    if (var3)
      var3 = (opaqueRTCReporting *)CFRetain(var3);
    v7->_reportingAgent = var3;
    v7->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    reportingInheritModuleSpecificInfoFromParent();
    v9 = (VCVideoStreamRateAdaptation *)a3->var10;
    v7->_rateAdaptation = v9;
    -[VCVideoStreamRateAdaptation setStats:](v9, "setStats:", v7->_stats);
    v7->_rtcpContext = a3->var8;
    v7->_rtcpPacketsCallback = a3->var9;
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CallbacksForUnsortedSampleBuffers = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
    CMBufferQueueCreate(v10, 0, CallbacksForUnsortedSampleBuffers, &v7->_videoQueue);
    v12 = CMMemoryPoolCreate(0);
    v7->_blockBufferMemoryPool = v12;
    Allocator = CMMemoryPoolGetAllocator(v12);
    v7->_blockBufferMemoryPoolAllocator = Allocator;
    CFRetain(Allocator);
    pthread_mutex_init(&v7->_decompressionSessionMutex, 0);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v7->_videoStreamReceiverQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVideoReceiver.videoStreamReceiverQueue", 0, CustomRootQueue);
    v7->_enableReceiveBitstreamDump = -[VCDefaults enableRxDecodeYUVDump](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableRxDecodeYUVDump") != 0;
    v7->super._rtpTimestampRate = 90000;
    if (a3->var7 && (VCTransportStreamRunLoopVTPCreate(v10, &v7->_runLoop) & 0x80000000) != 0)
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStreamReceiver initWithConfig:].cold.3();
      }
      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  VideoPacketBuffer_t *videoPacketBuffer;
  opaqueCMFormatDescription *formatDescription;
  __CFAllocator *blockBufferMemoryPoolAllocator;
  OpaqueCMMemoryPool *blockBufferMemoryPool;
  OpaqueCMMemoryPool *v7;
  opaqueCMBufferQueue *videoQueue;
  opaqueRTCReporting *reportingAgent;
  OpaqueVCTransportStreamRunLoop *runLoop;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[VCVideoStreamReceiver stopNetworkReceiveThread](self, "stopNetworkReceiveThread");
  -[VCVideoStreamReceiver stopSynchronization](self, "stopSynchronization");
  -[VCVideoStreamReceiver teardownDecodeSession:](self, "teardownDecodeSession:", 0);
  pthread_mutex_destroy(&self->_decompressionSessionMutex);
  videoPacketBuffer = self->_videoPacketBuffer;
  if (videoPacketBuffer)
  {
    VideoPacketBuffer_Destroy((uint64_t)videoPacketBuffer);
    self->_videoPacketBuffer = 0;
  }

  formatDescription = self->_formatDescription;
  if (formatDescription)
    CFRelease(formatDescription);
  blockBufferMemoryPoolAllocator = self->_blockBufferMemoryPoolAllocator;
  if (blockBufferMemoryPoolAllocator)
  {
    CFRelease(blockBufferMemoryPoolAllocator);
    self->_blockBufferMemoryPoolAllocator = 0;
  }
  blockBufferMemoryPool = self->_blockBufferMemoryPool;
  if (blockBufferMemoryPool)
  {
    CMMemoryPoolInvalidate(blockBufferMemoryPool);
    v7 = self->_blockBufferMemoryPool;
    if (v7)
    {
      CFRelease(v7);
      self->_blockBufferMemoryPool = 0;
    }
  }
  videoQueue = self->_videoQueue;
  if (videoQueue)
    CFRelease(videoQueue);
  dispatch_release((dispatch_object_t)self->_videoStreamReceiverQueue);
  reportingCacheModuleSpecificInfo();
  reportingAgent = self->_reportingAgent;
  if (reportingAgent)
    CFRelease(reportingAgent);
  runLoop = self->_runLoop;
  if (runLoop)
    CFRelease(runLoop);

  v11.receiver = self;
  v11.super_class = (Class)VCVideoStreamReceiver;
  -[VCVideoReceiverBase dealloc](&v11, sel_dealloc);
}

- (void)setEnableCVO:(BOOL)a3 cvoExtensionID:(unint64_t)a4
{
  self->_enableCVO = a3;
  self->_cvoExtensionID = a4;
}

- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6
{
  -[VCVideoStreamRateAdaptation setEnableRateAdaptation:maxBitrate:minBitrate:adaptationInterval:](self->_rateAdaptation, "setEnableRateAdaptation:maxBitrate:minBitrate:adaptationInterval:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

- (void)startVideo
{
  -[VCVideoStreamReceiver startNetworkReceiveThread](self, "startNetworkReceiveThread");
  reportingRegisterPeriodicTaskWeak();
}

uint64_t __35__VCVideoStreamReceiver_startVideo__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gatherRealtimeStats:");
}

- (void)stopVideo
{
  VideoPacketBuffer_t *videoPacketBuffer;

  if (self->_reportingAgent)
    reportingUnregisterPeriodicTask();
  -[VCVideoStreamReceiver stopNetworkReceiveThread](self, "stopNetworkReceiveThread");
  -[VCVideoStreamReceiver stopSynchronization](self, "stopSynchronization");
  -[VCVideoStreamReceiver teardownDecodeSession:](self, "teardownDecodeSession:", 1);
  videoPacketBuffer = self->_videoPacketBuffer;
  if (videoPacketBuffer)
  {
    VideoPacketBuffer_Destroy((uint64_t)videoPacketBuffer);
    self->_videoPacketBuffer = 0;
  }
}

- (BOOL)startSynchronization:(id)a3
{
  _BOOL4 v4;
  uint64_t v5;
  _QWORD v7[5];
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCVideoStreamReceiver;
  v4 = -[VCVideoReceiverBase startSynchronization:](&v8, sel_startSynchronization_, a3);
  if (v4)
  {
    v5 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__VCVideoStreamReceiver_startSynchronization___block_invoke;
    v7[3] = &unk_1E9E550F0;
    v7[4] = v5;
    VCMediaStreamSynchronizer_setDestinationAlarmHandler((uint64_t)self->super._mediaStreamSynchronizer, v7);
  }
  return v4;
}

void __46__VCVideoStreamReceiver_startSynchronization___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id v4;

  if ((a3 & 1) == 0)
  {
    v4 = (id)MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"));
    objc_msgSend(v4, "handleAlarmForTimeStamp:", a2);

  }
}

- (void)stopSynchronization
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  VCMediaStreamSynchronizer_setDestinationAlarmHandler((uint64_t)self->super._mediaStreamSynchronizer, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamReceiver;
  -[VCVideoReceiverBase stopSynchronization](&v3, sel_stopSynchronization);
}

- (id)syncSource
{
  return objc_loadWeak((id *)&self->super._syncSource);
}

- (void)setSyncSource:(id)a3
{
  objc_storeWeak((id *)&self->super._syncSource, a3);
}

- (int)startNetworkReceiveThread
{
  NSObject *videoStreamReceiverQueue;
  int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  videoStreamReceiverQueue = self->_videoStreamReceiverQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VCVideoStreamReceiver_startNetworkReceiveThread__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(videoStreamReceiverQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __50__VCVideoStreamReceiver_startNetworkReceiveThread__block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  CFDictionaryRef v4;
  int v5;
  const void *v6[2];

  v6[1] = *(const void **)MEMORY[0x1E0C80C00];
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 210) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 212) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 216) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0;
  v2 = micro();
  *(double *)(*(_QWORD *)(a1 + 32) + 64) = v2;
  *(double *)(*(_QWORD *)(a1 + 32) + 72) = v2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 208) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 209) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v3 + 440))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 292) = VTP_Socket(2, 1, 6);
    v3 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(v3 + 292) == -1)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *__error() | 0xC01F0000;
      v3 = *(_QWORD *)(a1 + 32);
    }
  }
  if (!*(_QWORD *)(v3 + 280))
  {
    v6[0] = CFSTR("com.apple.AVConference.VCVideoReceiver.NetworkReceiveProc");
    v4 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MEMORY[0x1E0CA52C8], v6, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 288) = 1;
    v5 = FigThreadCreate();
    if (v4)
      CFRelease(v4);
    if (v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __50__VCVideoStreamReceiver_startNetworkReceiveThread__block_invoke_cold_1();
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5 | 0xA01F0000;
    }
  }
}

- (int)stopNetworkReceiveThread
{
  NSObject *videoStreamReceiverQueue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  videoStreamReceiverQueue = self->_videoStreamReceiverQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__VCVideoStreamReceiver_stopNetworkReceiveThread__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_sync(videoStreamReceiverQueue, v4);
  return 0;
}

void __49__VCVideoStreamReceiver_stopNetworkReceiveThread__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  int v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 288) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 440);
  if (v3)
  {
    v4 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v4)
      v4(v3);
  }
  else
  {
    v5 = *(_DWORD *)(v2 + 292);
    if (v5 != -1)
    {
      VTP_Close(v5);
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 292) = -1;
    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v6 + 280))
  {
    FigThreadJoin();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = 0;
    v6 = *(_QWORD *)(a1 + 32);
  }
  v7 = *(_QWORD *)(v6 + 296);
  if (v7)
  {
    VideoPacketBuffer_Destroy(v7);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) = 0;
  }
}

- (void)networkReceivePackets
{
  OpaqueVCTransportStreamRunLoop *runLoop;
  char v4;
  tagHANDLE *hRTP;
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  while (self->_runNetworkReceiveThread)
  {
    v7 = 48;
    hRTP = self->_hRTP;
    runLoop = self->_runLoop;
    if (runLoop)
    {
      if ((RTPGetReceiveStatusWithRunLoop((uint64_t)&hRTP, &v7, 1, (uint64_t)runLoop) & 0x80000000) == 0)
        goto LABEL_4;
    }
    else if ((RTPGetReceiveStatus((uint64_t)&hRTP, &v7, 1, self->_sRecvReset) & 0x80000000) == 0)
    {
LABEL_4:
      v4 = v7;
      if ((v7 & 0x10) != 0)
      {
        -[VCVideoStreamReceiver processVideoRTP](self, "processVideoRTP");
        v4 = v7;
      }
      if ((v4 & 0x20) != 0)
        -[VCVideoStreamReceiver processVideoRTCP](self, "processVideoRTCP");
      continue;
    }
    usleep(0x2710u);
  }
  return 0;
}

- (void)updateSequenceNumber:(unsigned __int16)a3
{
  int sequenceNumberOutOfOrder;
  uint64_t v6;
  NSObject *v7;
  int lastSequenceNumber;
  unsigned __int16 v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  sequenceNumberOutOfOrder = self->_sequenceNumberOutOfOrder;
  if (sequenceNumberOutOfOrder != -1)
  {
    if (sequenceNumberOutOfOrder == a3 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        lastSequenceNumber = self->_lastSequenceNumber;
        v10 = 136316162;
        v11 = v6;
        v12 = 2080;
        v13 = "-[VCVideoStreamReceiver updateSequenceNumber:]";
        v14 = 1024;
        v15 = 381;
        v16 = 1024;
        v17 = sequenceNumberOutOfOrder;
        v18 = 1024;
        v19 = lastSequenceNumber;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Out of order packets[%d,%d]", (uint8_t *)&v10, 0x28u);
      }
    }
    self->_sequenceNumberOutOfOrder = -1;
  }
  v9 = self->_lastSequenceNumber;
  if ((unsigned __int16)(a3 - v9) == 2)
  {
    self->_sequenceNumberOutOfOrder = (unsigned __int16)(v9 + 1);
  }
  else if ((__int16)(a3 - v9) < 0)
  {
    return;
  }
  self->_lastSequenceNumber = a3;
}

- (void)scheduleDecodeForTimestamp:(unsigned int)a3
{
  double v5;
  int NextFrame;
  unsigned int v7;
  int v8;
  unsigned int *p_receivedBytes;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  int firSequenceNumber;
  int v14;
  const __CFAllocator **v15;
  int v16;
  int v17;
  int v18;
  uint8_t buf[48];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    v16 = -1;
    v17 = 0;
    v18 = -1431655936;
    v5 = micro();
    v15 = 0;
    v14 = 1;
    NextFrame = VideoPacketBuffer_GetNextFrame((uint64_t)self->_videoPacketBuffer, a3, 0, &v16, &v14, &v17, 0, 0, &v18, &v15, 0, 0);
    v7 = v18;
    if ((v18 & 0x80) != 0)
    {
      self->super._remoteVideoOrientation = v18 & 3;
      self->_remoteVideoCamera = (v7 >> 3) & 1;
      self->_remoteVideoMirrored = (v7 & 4) != 0;
    }
    v8 = v16;
    if (v16 != -1)
      break;
LABEL_7:
    if (!NextFrame)
      goto LABEL_20;
LABEL_8:
    if (v15[14])
    {
      -[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:](self, "scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:", 0.0);
      if (v8 == -1)
      {
        p_receivedBytes = &self->_receivedBytes;
        do
          v10 = __ldxr(p_receivedBytes);
        while (__stxr(0, p_receivedBytes));
        -[VCMediaStreamStats recordDataWithSize:atTime:](self->_stats, "recordDataWithSize:atTime:", (double)v10, v5);
      }
    }
    VCVideoReceiverSampleBuffer_Destroy(&v15);
  }
  if (v16)
  {
    RTCPSetSendPLI();
    -[VCVideoStreamReceiver updateVideoStallStatus:](self, "updateVideoStallStatus:", 1);
    goto LABEL_7;
  }
  ++self->_firSequenceNumber;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      firSequenceNumber = self->_firSequenceNumber;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver scheduleDecodeForTimestamp:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 428;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = firSequenceNumber;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sending RTCP PSFB FIR(%d)", buf, 0x22u);
    }
  }
  memset(buf, 0, sizeof(buf));
  v27 = 0;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  buf[24] = self->_firSequenceNumber;
  *(_DWORD *)buf = 64;
  if ((RTPSendControlPacket((uint64_t)self->_hRTP, (int *)buf) & 0x80000000) == 0)
    -[VCVideoStreamReceiver reportingVideoStreamEvent:](self, "reportingVideoStreamEvent:", 221);
  if (NextFrame)
    goto LABEL_8;
LABEL_20:
  VCVideoReceiverSampleBuffer_Destroy(&v15);
}

- (void)scheduleVideoDecode:(unsigned int)a3
{
  unsigned int mostRecentTimestamp;
  BOOL v4;
  unsigned int lastVideoTimestamp;
  BOOL v6;
  unsigned int v7;

  mostRecentTimestamp = self->_mostRecentTimestamp;
  if (!mostRecentTimestamp
    || (a3 != mostRecentTimestamp ? (v4 = a3 - mostRecentTimestamp > 0x7FFFFFFE) : (v4 = 1), !v4))
  {
    self->_mostRecentTimestamp = a3;
    mostRecentTimestamp = a3;
  }
  lastVideoTimestamp = self->_lastVideoTimestamp;
  v6 = mostRecentTimestamp >= lastVideoTimestamp;
  v7 = mostRecentTimestamp - lastVideoTimestamp;
  if (!v6 && v7 <= 0x7FFFFFFE)
  {
    ++self->_videoTimestampWrapCount;
    mostRecentTimestamp = self->_mostRecentTimestamp;
  }
  self->_lastVideoTimestamp = mostRecentTimestamp;
  -[VCVideoStreamReceiver scheduleDecodeForTimestamp:](self, "scheduleDecodeForTimestamp:");
}

- (tagVCVideoPacketBufferConfig)newVideoPacketBufferConfig:(SEL)a3
{
  tagVCVideoPacketBufferConfig *result;

  *(_OWORD *)&retstr->var16.nackThrottlingFactorBuckets[2] = 0u;
  *(_OWORD *)&retstr->var16.nackThrottlingPlrBuckets[2] = 0u;
  *(_OWORD *)&retstr->var15 = 0u;
  *(_OWORD *)&retstr->var16.nackThrottlingBitRateLimitingMaxRatio = 0u;
  *(_OWORD *)&retstr->var12.var1 = 0u;
  *(_OWORD *)&retstr->var13.var1 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var4[168] = 0u;
  *(_OWORD *)&retstr->var4[184] = 0u;
  *(_OWORD *)&retstr->var4[136] = 0u;
  *(_OWORD *)&retstr->var4[152] = 0u;
  *(_OWORD *)&retstr->var4[104] = 0u;
  *(_OWORD *)&retstr->var4[120] = 0u;
  *(_OWORD *)&retstr->var4[72] = 0u;
  *(_OWORD *)&retstr->var4[88] = 0u;
  *(_OWORD *)&retstr->var4[40] = 0u;
  *(_OWORD *)&retstr->var4[56] = 0u;
  *(_OWORD *)&retstr->var4[8] = 0u;
  *(_OWORD *)&retstr->var4[24] = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  retstr->var0 = a4->var3;
  retstr->var1 = a4->var4;
  retstr->var2 = 90000;
  strcpy(retstr->var4, "video-stream-receiver");
  *(_WORD *)&retstr->var6 = 256;
  retstr->var9 = 0;
  result = (tagVCVideoPacketBufferConfig *)objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-video-enable-late-frame-recovery"), CFSTR("enableLateVideoFrameRecovery"), MEMORY[0x1E0C9AAA0], 0), "BOOLValue");
  retstr->var10 = (char)result;
  return result;
}

- (int)processVideoRTP
{
  uint64_t v2;
  int v3;
  unsigned __int16 **v4;
  int v5;
  int ErrorLogLevelForModule;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  unsigned __int16 *v18;
  int v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned __int16 *v22;
  char v23;
  unsigned int v24;
  unsigned int v25;
  char v26;
  int v27;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  int v35;
  int v36;
  __int128 v37;
  unsigned __int16 **v38;
  __int128 v39;
  int v40;
  __int16 v41;
  _BYTE v42[10];
  _OWORD *v43;
  unsigned __int16 **v44;
  unint64_t v45;
  unsigned __int16 **v46;
  unsigned __int8 v47;
  unsigned int v48;
  uint8_t buf[352];
  _OWORD v50[3];
  uint64_t v51;
  _BYTE __b[14720];
  uint64_t v53;

  v2 = MEMORY[0x1E0C80A78](self);
  v53 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  v48 = 0;
  v47 = 0;
  v51 = 0;
  memset(v50, 0, sizeof(v50));
  v46 = 0;
  v3 = RTPRecvRTP(*(_QWORD *)(v2 + 112), &v46);
  if ((v3 & 0x80000000) == 0)
  {
    v4 = v46;
    if (*(_BYTE *)(v2 + 317))
    {
      v5 = VCCVOExtensionUtils_CameraStatusBitsFromCVOExtension(*(unsigned __int8 *)(v2 + 320), v46[18], *((_DWORD *)v46 + 34), &v47);
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (!v5)
      {
        if (ErrorLogLevelForModule < 7)
          goto LABEL_14;
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_14;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTP]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 518;
        v10 = " [%s] %s:%d Invalid header extension profile or CVO Extension ID";
        v11 = v14;
        v12 = 28;
        goto LABEL_11;
      }
      if (ErrorLogLevelForModule >= 8)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        v9 = *MEMORY[0x1E0CF2758];
        if (!*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            -[VCVideoStreamReceiver processVideoRTP].cold.5();
          goto LABEL_14;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v7;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTP]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 516;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v47;
          v10 = " [%s] %s:%d bCameraStatusBits = %x";
          v11 = v8;
          v12 = 34;
LABEL_11:
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        }
      }
    }
LABEL_14:
    if ((int)VRTraceGetErrorLogLevelForModule() > 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      v17 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v4[20];
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTP]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 522;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = (_DWORD)v18;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d processVideoRTP called RTPRecvRTP packet (%d bytes)", buf, 0x22u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoStreamReceiver processVideoRTP].cold.4();
      }
    }
    if (*((_DWORD *)v4 + 3) == 123)
    {
      if (v4[20])
      {
        v19 = *((_DWORD *)v4 + 30);
        v20 = (unsigned int *)(v2 + 408);
        do
          v21 = __ldxr(v20);
        while (__stxr(v21 + v19, v20));
        *(double *)(v2 + 64) = micro();
        __memcpy_chk();
        if (*(_BYTE *)(v2 + 208))
        {
          v22 = *(unsigned __int16 **)(v2 + 296);
        }
        else
        {
          *(_BYTE *)(v2 + 208) = 1;
          v22 = *(unsigned __int16 **)(v2 + 296);
          if (!v22)
          {
            memcpy(buf, &unk_1D910C9A0, sizeof(buf));
            objc_msgSend((id)v2, "newVideoPacketBufferConfig:", v4 + 1);
            v22 = VideoPacketBuffer_Create(buf);
            *(_QWORD *)(v2 + 296) = v22;
          }
          *(_WORD *)(v2 + 210) = *((_WORD *)v4 + 10) - 1;
          *(_DWORD *)(v2 + 212) = -1;
        }
        *(_QWORD *)&v42[2] = 0xAAAAAAAAAAAAAAAALL;
        v44 = v4 + 1;
        v45 = 0xAAAAAAAAAAAAAA00;
        v37 = xmmword_1D91092B0;
        v38 = v4 + 19;
        v39 = 0xAAAAAAAA00000000;
        v40 = 0;
        v41 = v47;
        *(_DWORD *)v42 = 0;
        v43 = v50;
        VideoPacketBuffer_AddPacket((uint64_t)v22, (int *)&v37, 0, 0, 0, 0.25);
        if (VideoPacketBuffer_SchedulePastIncompleteFrame(*(_QWORD *)(v2 + 296), *((_DWORD *)v4 + 6), &v48, 0, 0, 0))
        {
          v23 = 0;
          v24 = 0;
          do
          {
            v25 = v48;
            if ((v23 & 1) != 0 && v24 == v48)
              break;
            objc_msgSend((id)v2, "scheduleVideoDecode:", v48);
            v26 = VideoPacketBuffer_SchedulePastIncompleteFrame(*(_QWORD *)(v2 + 296), *((_DWORD *)v4 + 6), &v48, 0, 0, 0);
            v23 = 1;
            v24 = v25;
          }
          while ((v26 & 1) != 0);
        }
        while (VideoPacketBuffer_ScheduleFutureFrame(*(_QWORD *)(v2 + 296), *((_DWORD *)v4 + 7), *((_DWORD *)v4 + 6), &v48, 0, 0, 0, *(double *)(v2 + 64)))objc_msgSend((id)v2, "scheduleVideoDecode:", v48);
        objc_msgSend((id)v2, "updateSequenceNumber:", *((unsigned __int16 *)v4 + 10));
        objc_msgSend(*(id *)(v2 + 232), "updateRTPReceiveWithTimestamp:sampleRate:time:size:endOfFrame:", *((unsigned int *)v4 + 6), 90000, *((unsigned int *)v4 + 40), *((_DWORD *)v4 + 2) > 0, micro());
        kdebug_trace();
        v27 = 0;
      }
      else
      {
        v27 = -2145452031;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v32 = VRTraceErrorLogLevelToCSTR();
          v33 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v34 = *((unsigned __int16 *)v4 + 10);
            v35 = *((_DWORD *)v4 + 6);
            v36 = *((_DWORD *)v4 + 3);
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = v32;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 528;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v34;
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = v35;
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = v36;
            _os_log_error_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_ERROR, " [%s] %s:%d Received zero length packet (seq:%d, ts:%d, payload:%d)", buf, 0x2Eu);
          }
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCVideoStreamReceiver processVideoRTP].cold.2();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[VCVideoStreamReceiver processVideoRTP].cold.3();
        }
      }
      v27 = 15;
    }
    goto LABEL_37;
  }
  v27 = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    v31 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTP]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 510;
        _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to read RTP packet", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      -[VCVideoStreamReceiver processVideoRTP].cold.1();
    }
  }
LABEL_37:
  RTPReleaseRTPPacket(*(_QWORD *)(v2 + 112), (_DWORD **)&v46);
  return v27;
}

- (void)rtcpSendIntervalElapsed
{
  _BOOL4 v3;
  int v4;
  _QWORD v5[4];
  _QWORD v6[4];
  _OWORD v7[10];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[VCVideoStreamRateAdaptation runVideoStreamRateAdaptation](self->_rateAdaptation, "runVideoStreamRateAdaptation");
  v4 = 0;
  RTPGetRTCPHasPendingPLI((uint64_t)self->_hRTP, &v4);
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  if ((RTPSendControlPacket((uint64_t)self->_hRTP, (int *)v7) & 0x80000000) == 0 && v4)
    -[VCVideoStreamReceiver reportingVideoStreamEvent:](self, "reportingVideoStreamEvent:", 223);
  if (v3)
  {
    v5[0] = 0x1E9E623E0;
    v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCVideoStreamRateAdaptation operatingBitrate](self->_rateAdaptation, "operatingBitrate"));
    v5[1] = 0x1E9E623C0;
    v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCVideoStreamRateAdaptation sendTmmbrBitrate](self->_rateAdaptation, "sendTmmbrBitrate"));
    v5[2] = 0x1E9E62400;
    v6[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCVideoStreamRateAdaptation isOperatingAtMaxBitrate](self->_rateAdaptation, "isOperatingAtMaxBitrate"));
    v5[3] = 0x1E9E62420;
    v6[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VCVideoStreamRateAdaptation isOperatingAtMinBitrate](self->_rateAdaptation, "isOperatingAtMinBitrate"));
    -[VCVideoReceiverDelegate vcVideoReceiver:downlinkQualityDidChange:](-[VCVideoReceiverBase delegate](self, "delegate"), "vcVideoReceiver:downlinkQualityDidChange:", self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4));
  }
}

- (void)processReceptionReportBlock:(tagRTCP_RRB *)a3 blockCount:(unsigned int)a4 arrivalNTPTime:(tagNTP)a5
{
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
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
  const __CFString *v25;
  __int16 v26;
  VCVideoStreamReceiver *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  if ((RTPGetLocalSSRC((uint64_t)self->_hRTP, &v17) & 0x80000000) != 0)
  {
    if ((VCVideoStreamReceiver *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315650;
      v19 = v10;
      v20 = 2080;
      v21 = "-[VCVideoStreamReceiver processReceptionReportBlock:blockCount:arrivalNTPTime:]";
      v22 = 1024;
      v23 = 617;
      v12 = " [%s] %s:%d Could not get the local SSRC";
      v13 = v11;
      v14 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCVideoStreamReceiver performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136316162;
      v19 = v15;
      v20 = 2080;
      v21 = "-[VCVideoStreamReceiver processReceptionReportBlock:blockCount:arrivalNTPTime:]";
      v22 = 1024;
      v23 = 617;
      v24 = 2112;
      v25 = v9;
      v26 = 2048;
      v27 = self;
      v12 = " [%s] %s:%d %@(%p) Could not get the local SSRC";
      v13 = v16;
      v14 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    return;
  }
  if (a4)
  {
    while (a3->var0 != v17)
    {
      ++a3;
      if (!--a4)
        return;
    }
    -[VCVideoReceiverBase setRoundTripTime:](self, "setRoundTripTime:", (double)RTCPComputeRoundTripTimeMiddle32((uint64_t)a3, a5.wide) * 0.0000152587891);
  }
}

- (int)processVideoRTCP
{
  int v3;
  __int128 v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  VCMediaStreamSynchronizer *mediaStreamSynchronizer;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  __int128 v33;
  int v34;
  double v35;
  VCVideoStreamRateAdaptation *rateAdaptation;
  int v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  int v45;
  int v46;
  uint64_t v47;
  NSObject *v48;
  double lastFIRArrivalTime;
  uint64_t v50;
  unsigned int v51;
  int v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  int v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  NSObject *v62;
  unint64_t v63;
  void *v64;
  __int128 v66;
  int v67;
  unsigned int v68;
  unsigned int v69;
  char v70;
  int v71;
  __int16 v72;
  uint8_t buf[64];
  __int128 v74;
  _OWORD v75[8];
  __int128 v76;
  int v77;
  uint8_t v78[40];
  __int16 v79;
  unsigned int v80;
  __int16 v81;
  int v82;
  __int16 v83;
  int v84;
  uint64_t v85;
  unsigned __int8 v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  bzero(&v85, 0x668uLL);
  v3 = RTPRecvRTCP((uint64_t)self->_hRTP, &v85);
  if (v3 < 0)
    return v3;
  *(double *)&v4 = micro();
  *(_QWORD *)&self->super._lastReceivedVideoRTCPPacketTime = v4;
  if (!v86)
  {
    kdebug_trace();
    goto LABEL_73;
  }
  v5 = *(double *)&v4;
  v67 = v3;
  v70 = 0;
  v69 = 0;
  v6 = 0;
  v7 = 2;
  *(_QWORD *)&v4 = 136316930;
  v66 = v4;
  while (2)
  {
    v8 = (unsigned __int16 *)*(&v85 + v7);
    v9 = *v8;
    switch(v9 >> 8)
    {
      case 0xC0u:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v10;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 728;
            v12 = v11;
            v13 = " [%s] %s:%d Received RTCP FIR RFC 2032";
            goto LABEL_28;
          }
        }
        goto LABEL_66;
      case 0xC1u:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v14;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 732;
            v12 = v15;
            v13 = " [%s] %s:%d Received RTCP NACK RFC 2032";
            goto LABEL_28;
          }
        }
        goto LABEL_66;
      case 0xC8u:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v19;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 651;
            _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received RTCP SR", buf, 0x1Cu);
          }
        }
        v21 = *((_DWORD *)v8 + 4);
        v22 = NTPToMicro(*((unsigned int *)v8 + 3) | ((unint64_t)*((unsigned int *)v8 + 2) << 32));
        -[VCVideoStreamReceiver processReceptionReportBlock:blockCount:arrivalNTPTime:](self, "processReceptionReportBlock:blockCount:arrivalNTPTime:", v8 + 14, *v8 & 0x1F, v85);
        if (self->super._mediaStreamSynchronizer)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v23 = VRTraceErrorLogLevelToCSTR();
            v24 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              mediaStreamSynchronizer = self->super._mediaStreamSynchronizer;
              *(_DWORD *)buf = 136316674;
              *(_QWORD *)&buf[4] = v23;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 662;
              *(_WORD *)&buf[28] = 2048;
              *(_QWORD *)&buf[30] = self;
              *(_WORD *)&buf[38] = 2048;
              *(_QWORD *)&buf[40] = mediaStreamSynchronizer;
              *(_WORD *)&buf[48] = 2048;
              *(double *)&buf[50] = v22;
              *(_WORD *)&buf[58] = 1024;
              *(_DWORD *)&buf[60] = v21;
              _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoStreamReceiver (%p) updating MediaStreamSynchronizer (%p) with ntpTime=%.6f and rtpTimeStamp=%u", buf, 0x40u);
            }
          }
          VCMediaStreamSynchronizer_updateDestinationNTPTime((uint64_t)self->super._mediaStreamSynchronizer, v21, v22);
        }
        goto LABEL_66;
      case 0xC9u:
        -[VCVideoStreamReceiver processReceptionReportBlock:blockCount:arrivalNTPTime:](self, "processReceptionReportBlock:blockCount:arrivalNTPTime:", v8 + 4, v9 & 0x1F, v85);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v26 = VRTraceErrorLogLevelToCSTR();
          v27 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 669;
            v12 = v27;
            v13 = " [%s] %s:%d Received RTCP RR";
            goto LABEL_28;
          }
        }
        goto LABEL_66;
      case 0xCAu:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v28 = VRTraceErrorLogLevelToCSTR();
          v29 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v28;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 673;
            v12 = v29;
            v13 = " [%s] %s:%d Received RTCP SDES";
LABEL_28:
            v30 = 28;
            goto LABEL_57;
          }
        }
        goto LABEL_66;
      case 0xCCu:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v31 = VRTraceErrorLogLevelToCSTR();
          v32 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 736;
            _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received RTCP APP", buf, 0x1Cu);
          }
        }
        if (*((_DWORD *)v8 + 2) == 1380144204)
        {
          v77 = -1431655766;
          *(_QWORD *)&v76 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v76 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v33 = *(_OWORD *)(v8 + 6);
          v77 = *((_DWORD *)v8 + 7);
          v76 = v33;
          memset(v78, 0, sizeof(v78));
          v72 = 0;
          v71 = 16843010;
          VCMediaControlInfoUnserializeWithData((uint64_t)v78, (unsigned __int16 *)&v76, 0x14uLL, (unsigned __int8 *)&v71);
          v34 = *(unsigned __int16 *)&v78[24];
          v35 = RTPUnpackDouble(*(unsigned int *)&v78[28]);
          rateAdaptation = self->_rateAdaptation;
          *(_QWORD *)buf = 2;
          *(double *)&buf[8] = v5;
          *(_QWORD *)&buf[16] = 0;
          *(_DWORD *)&buf[24] = v34;
          *(_DWORD *)&buf[28] = *(_DWORD *)&v78[20];
          *(_DWORD *)&buf[32] = *(unsigned __int16 *)&v78[2];
          *(_DWORD *)&buf[36] = 0;
          *(_DWORD *)&buf[40] = *(unsigned __int16 *)&v78[4];
          *(_QWORD *)&buf[44] = 0;
          *(_DWORD *)&buf[60] = 0;
          LODWORD(v74) = 0;
          *(_QWORD *)&buf[52] = *(unsigned __int16 *)&v78[10] + *(unsigned __int16 *)&v78[6];
          DWORD1(v74) = *(unsigned __int16 *)v78;
          *((_QWORD *)&v74 + 1) = 0;
          *(double *)v75 = v35;
          memset((char *)v75 + 8, 0, 80);
          *(_OWORD *)((char *)&v75[5] + 8) = 0u;
          *(_OWORD *)((char *)&v75[6] + 8) = 0u;
          -[VCVideoStreamRateAdaptation updateRateControlInfoWithStatisticsMessage:](rateAdaptation, "updateRateControlInfoWithStatisticsMessage:", buf);
        }
        goto LABEL_66;
      case 0xCDu:
        v37 = v9 & 0x1F;
        if (v37 == 4)
        {
          v51 = *((_DWORD *)v8 + 4);
          v52 = (v51 >> 9) & 0x1FFFF;
          v38 = (v52 << (v51 >> 26));
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v53 = VRTraceErrorLogLevelToCSTR();
            v54 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316674;
              *(_QWORD *)&buf[4] = v53;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 719;
              *(_WORD *)&buf[28] = 1024;
              *(_DWORD *)&buf[30] = v52 << (v51 >> 26);
              *(_WORD *)&buf[34] = 1024;
              *(_DWORD *)&buf[36] = (v51 >> 9) & 0x1FFFF;
              *(_WORD *)&buf[40] = 1024;
              *(_DWORD *)&buf[42] = v51 >> 26;
              *(_WORD *)&buf[46] = 1024;
              *(_DWORD *)&buf[48] = v51 & 0x1FF;
              _os_log_impl(&dword_1D8A54000, v54, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received TMMBN:%d, mantissa:%d, exponent:%d, overhead:%d", buf, 0x34u);
            }
          }
          -[VCVideoStreamRateAdaptation receivedTMMBN:](self->_rateAdaptation, "receivedTMMBN:", (v52 << (v51 >> 26)), v66);
          goto LABEL_52;
        }
        if (v37 == 3)
        {
          v38 = v6;
          v74 = 0u;
          memset(v75, 0, 88);
          memset(buf, 0, sizeof(buf));
          v39 = *((_DWORD *)v8 + 4);
          v40 = (v39 >> 9) & 0x1FFFF;
          *(_DWORD *)buf = 16;
          v68 = v40 << (v39 >> 26);
          *(_DWORD *)&buf[48] = -[VCVideoReceiverDelegate vcVideoReceiver:receivedTMMBR:](-[VCVideoReceiverBase delegate](self, "delegate"), "vcVideoReceiver:receivedTMMBR:", self, v68);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v41 = VRTraceErrorLogLevelToCSTR();
            v42 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v78 = v66;
              *(_QWORD *)&v78[4] = v41;
              *(_WORD *)&v78[12] = 2080;
              *(_QWORD *)&v78[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
              *(_WORD *)&v78[22] = 1024;
              *(_DWORD *)&v78[24] = 708;
              *(_WORD *)&v78[28] = 1024;
              *(_DWORD *)&v78[30] = v40 << (v39 >> 26);
              *(_WORD *)&v78[34] = 1024;
              *(_DWORD *)&v78[36] = (v39 >> 9) & 0x1FFFF;
              v79 = 1024;
              v80 = v39 >> 26;
              v81 = 1024;
              v82 = v39 & 0x1FF;
              v83 = 1024;
              v84 = *(_DWORD *)&buf[48];
              _os_log_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received TMMBR:%d, mantissa:%d, exponent:%d, overhead:%d adjusted TMMBN bitrate:%d", v78, 0x3Au);
            }
          }
          RTPSendControlPacket((uint64_t)self->_hRTP, (int *)buf);
          goto LABEL_52;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v55 = VRTraceErrorLogLevelToCSTR();
          v56 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v57 = *v8 & 0x1F;
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v55;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 723;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v57;
            v12 = v56;
            v13 = " [%s] %s:%d Received unknown RTCP RTPFB:%d";
            goto LABEL_56;
          }
        }
        goto LABEL_66;
      case 0xCEu:
        v38 = v6;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v43 = VRTraceErrorLogLevelToCSTR();
          v44 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v45 = *v8 & 0x1F;
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v43;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 677;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v45;
            _os_log_impl(&dword_1D8A54000, v44, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received RTCP PSFB:%d", buf, 0x22u);
          }
        }
        v46 = *v8 & 0x1F;
        if (v46 != 4)
        {
          v69 = *v8 & 0x1F;
          v70 |= (v46 - 1) < 2;
LABEL_52:
          v6 = v38;
          goto LABEL_66;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() > 6)
        {
          v47 = VRTraceErrorLogLevelToCSTR();
          v48 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            lastFIRArrivalTime = self->_lastFIRArrivalTime;
            -[VCVideoReceiverBase roundTripTime](self, "roundTripTime");
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = v47;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 680;
            *(_WORD *)&buf[28] = 2048;
            *(double *)&buf[30] = v5;
            *(_WORD *)&buf[38] = 2048;
            *(double *)&buf[40] = lastFIRArrivalTime;
            *(_WORD *)&buf[48] = 2048;
            *(_QWORD *)&buf[50] = v50;
            _os_log_impl(&dword_1D8A54000, v48, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d currentTime=%.3f, lastFIRArrivalTime=%.3f, dRTT=%.3f", buf, 0x3Au);
          }
        }
        v6 = v38;
        v58 = self->_lastFIRArrivalTime;
        if (v58 == 0.0
          || (v59 = v5 - v58, -[VCVideoReceiverBase roundTripTime](self, "roundTripTime"), v59 >= v60 + v60))
        {
          self->_lastFIRArrivalTime = v5;
          v70 = 1;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v61 = VRTraceErrorLogLevelToCSTR();
          v62 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v61;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 683;
            _os_log_impl(&dword_1D8A54000, v62, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Ignoring too many FIR", buf, 0x1Cu);
          }
          v69 = 4;
          goto LABEL_52;
        }
        v69 = 4;
LABEL_66:
        v63 = v7++ - 1;
        if (v63 < v86)
          continue;
        if ((_DWORD)v6)
        {
          kdebug_trace();
          v3 = v67;
        }
        else
        {
          v3 = v67;
          kdebug_trace();
        }
        if ((v70 & 1) != 0)
        {
          v64 = (void *)MEMORY[0x1DF086F1C](&self->super._delegate);
          objc_msgSend(v64, "vcVideoReceiverRequestKeyFrame:rtcpPSFBType:", self, v69);

        }
LABEL_73:
        ((void (*)(void *, uint64_t *))self->_rtcpPacketsCallback)(self->_rtcpContext, &v85);
        RTCPCleanupPacketList((uint64_t)&v85);
        return v3;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v18 = *((unsigned __int8 *)v8 + 1);
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v16;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiver processVideoRTCP]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 763;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = v18;
            v12 = v17;
            v13 = " [%s] %s:%d Received unknown RTCP packet type:%d";
LABEL_56:
            v30 = 34;
LABEL_57:
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v30);
          }
        }
        goto LABEL_66;
    }
  }
}

- (int)scheduleDecodeForFrameWithBuffer:(VCVideoReceiverSampleBuffer_t *)a3 timestamp:(unsigned int)a4 hostTime:(double)a5 showFrame:(BOOL)a6
{
  _BOOL8 v6;
  OpaqueCMBlockBuffer *var0;
  opaqueCMFormatDescription *formatDescription;
  CMTimeValue var1;
  char *var2;
  unint64_t v14;
  CMTimeValue value;
  CMTimeValue v16;
  uint64_t v17;
  CMTimeEpoch epoch;
  $95D729B680665BEAEFA1D6FCA8238556 *p_lastFrameTime;
  OpaqueCMClock *HostTimeClock;
  __CFAllocator *blockBufferMemoryPoolAllocator;
  opaqueCMFormatDescription *v22;
  OpaqueCMBlockBuffer *v23;
  CMSampleBufferRef v24;
  CMSampleBufferRef v25;
  CMTime v27;
  CMTime rhs;
  CMTime formatDescriptionOut;
  CMTime v30;
  CMTime v31;
  CMSampleTimingInfo parameterSetPointers;
  CMTime parameterSetSizes;
  uint64_t v34;

  v6 = a6;
  v34 = *MEMORY[0x1E0C80C00];
  var0 = a3->var6.var0;
  if (var0)
  {
    formatDescription = self->_formatDescription;
    if (formatDescription)
    {
      CFRelease(formatDescription);
      self->_formatDescription = 0;
    }
    var1 = a3->var6.var1;
    v14 = a3->var7.var1;
    var2 = a3->var7.var2;
    parameterSetPointers.duration.value = (CMTimeValue)a3->var6.var2;
    *(_QWORD *)&parameterSetPointers.duration.timescale = var2;
    parameterSetSizes.value = var1;
    *(_QWORD *)&parameterSetSizes.timescale = v14;
    formatDescriptionOut.value = 0;
    if (CMVideoFormatDescriptionCreateFromH264ParameterSets((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2uLL, (const uint8_t *const *)&parameterSetPointers, (const size_t *)&parameterSetSizes, 4, (CMFormatDescriptionRef *)&formatDescriptionOut))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:].cold.4();
      }
    }
    value = formatDescriptionOut.value;
    self->_formatDescription = (opaqueCMFormatDescription *)formatDescriptionOut.value;
    if (!value)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:].cold.3();
      }
      return 4;
    }
  }
  v31 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E90];
  v30 = *(CMTime *)(MEMORY[0x1E0CA2E90] + 48);
  if (self->super._mediaStreamSynchronizer)
  {
    v16 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 24);
    v17 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 32);
    epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 40);
    CMTimeMake(&v30, a4, 1);
  }
  else
  {
    memset(&parameterSetPointers, 170, 24);
    CMTimeMake(&parameterSetPointers.duration, a4, 90000);
    p_lastFrameTime = &self->_lastFrameTime;
    if (self->_receivedFirstRemoteFrame)
    {
      memset(&parameterSetSizes, 170, sizeof(parameterSetSizes));
      formatDescriptionOut = parameterSetPointers.duration;
      *(_OWORD *)&rhs.value = *(_OWORD *)&p_lastFrameTime->value;
      rhs.epoch = self->_lastFrameTime.epoch;
      CMTimeSubtract(&parameterSetSizes, &formatDescriptionOut, &rhs);
      rhs = (CMTime)self->_lastDisplayTime;
      v27 = parameterSetSizes;
      CMTimeAdd(&formatDescriptionOut, &rhs, &v27);
      v17 = *(_QWORD *)&formatDescriptionOut.timescale;
      v16 = formatDescriptionOut.value;
      epoch = formatDescriptionOut.epoch;
    }
    else
    {
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&parameterSetSizes, HostTimeClock);
      v16 = parameterSetSizes.value;
      v17 = *(_QWORD *)&parameterSetSizes.timescale;
      epoch = parameterSetSizes.epoch;
    }
    self->_lastDisplayTime.value = v16;
    *(_QWORD *)&self->_lastDisplayTime.timescale = v17;
    self->_lastDisplayTime.epoch = epoch;
    *(_OWORD *)&p_lastFrameTime->value = *(_OWORD *)&parameterSetPointers.duration.value;
    self->_lastFrameTime.epoch = parameterSetPointers.duration.epoch;
    v30 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    CMTimeMake(&v31, 1, 1);
  }
  blockBufferMemoryPoolAllocator = self->_blockBufferMemoryPoolAllocator;
  v22 = self->_formatDescription;
  v23 = a3->var2;
  parameterSetPointers.duration = v31;
  parameterSetPointers.presentationTimeStamp.value = v16;
  *(_QWORD *)&parameterSetPointers.presentationTimeStamp.timescale = v17;
  parameterSetPointers.presentationTimeStamp.epoch = epoch;
  parameterSetPointers.decodeTimeStamp = v30;
  v24 = VideoUtil_CreateSampleFromBuffer(v23, &parameterSetPointers, (uint64_t)blockBufferMemoryPoolAllocator, v22);
  if (!v24)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:].cold.1();
    }
    return 4;
  }
  v25 = v24;
  if (var0)
  {
    self->_lastKeyFrameSampleBufferSize = CMBlockBufferGetDataLength(a3->var2);
    -[VCVideoStreamReceiver reportingVideoStreamEvent:](self, "reportingVideoStreamEvent:", 229);
    -[VCVideoStreamReceiver updateVideoStallStatus:](self, "updateVideoStallStatus:", 0);
  }
  if (self->super._mediaStreamSynchronizer)
  {
    if (CMBufferQueueEnqueue(self->_videoQueue, v25))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:].cold.2();
      }
    }
    else
    {
      VCMediaStreamSynchronizer_scheduleDestinationPlaybackWithRTPTimestamp((uint64_t)self->super._mediaStreamSynchronizer, a4);
    }
  }
  else
  {
    -[VCVideoStreamReceiver decodeFrame:showFrame:](self, "decodeFrame:showFrame:", v25, v6);
  }
  CFRelease(v25);
  return 0;
}

- (void)reportVideoStallStatus:(BOOL)a3
{
  _BOOL4 v3;
  const __CFAllocator *v4;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v6;
  CFNumberRef v7;
  _BOOL4 valuePtr;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v6 = Mutable;
    valuePtr = v3;
    v7 = CFNumberCreate(v4, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(v6, CFSTR("VCSPVideoDegraded"), v7);
    CFRelease(v7);
    reportingGenericEvent();
    CFRelease(v6);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStreamReceiver reportVideoStallStatus:].cold.1();
  }
}

- (void)updateVideoStallStatus:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  double v6;
  double videoStallStartTime;
  uint64_t v8;
  unsigned int *p_videoStallDurationMillis;
  unsigned int v10;

  v3 = a3;
  v6 = micro();
  videoStallStartTime = self->_videoStallStartTime;
  if (v3)
  {
    v8 = 0;
    v5 = 0;
    if (videoStallStartTime != 0.0)
      goto LABEL_10;
  }
  else
  {
    if (videoStallStartTime <= 0.0)
    {
      v5 = 0;
      goto LABEL_10;
    }
    v8 = ((v6 - videoStallStartTime) * 1000.0 + 0.5);
    p_videoStallDurationMillis = &self->_videoStallDurationMillis;
    do
      v10 = __ldxr(p_videoStallDurationMillis);
    while (__stxr(v10 + v8, p_videoStallDurationMillis));
    v6 = 0.0;
  }
  self->_videoStallStartTime = v6;
  -[VCVideoStreamReceiver reportVideoStallStatus:](self, "reportVideoStallStatus:", v3, v5);
  v5 = v8;
LABEL_10:
  -[VCVideoStreamRateAdaptation updateVideoStall:withStallDuration:](self->_rateAdaptation, "updateVideoStall:withStallDuration:", v3, v5, v6);
}

- (int)createDecodeSession:(opaqueCMFormatDescription *)a3
{
  const __CFAllocator *v5;
  __CFDictionary *Mutable;
  const __CFDictionary *v7;
  const void *v8;
  OpaqueVTDecompressionSession **p_decompressionSession;
  int v10;
  CFNumberRef v11;
  CFNumberRef v12;
  uint64_t v13;
  NSObject *v14;
  __CFDictionary *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  const void *v19;
  OpaqueVTDecompressionSession **v20;
  uint64_t v22;
  NSObject *v23;
  VTDecompressionSessionRef v24;
  const char *v25;
  uint64_t v26;
  OpaqueVTDecompressionSession *v27;
  int valuePtr;
  VTDecompressionOutputCallbackRecord outputCallback;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BYTE v37[10];
  __int16 v38;
  VTDecompressionSessionRef v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  outputCallback.decompressionOutputCallback = (VTDecompressionOutputCallback)decoderFrameCallback;
  outputCallback.decompressionOutputRefCon = self;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v7 = Mutable;
    v8 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA8FE8], (const void *)*MEMORY[0x1E0C9AE50]);
    if (VCFeatureFlagManager_UseOutOfProcessVideoDecoding())
    {
      p_decompressionSession = &self->_decompressionSession;
      v10 = VTDecompressionSessionCreate(v5, a3, 0, v7, &outputCallback, p_decompressionSession);
      if (!v10 && *p_decompressionSession)
      {
        valuePtr = FigThreadGetMachThreadPriorityValue();
        v11 = CFNumberCreate(v5, kCFNumberSInt32Type, &valuePtr);
        if (v11)
        {
          v12 = v11;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v13 = VRTraceErrorLogLevelToCSTR();
            v14 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v31 = v13;
              v32 = 2080;
              v33 = "-[VCVideoStreamReceiver createDecodeSession:]";
              v34 = 1024;
              v35 = 959;
              v36 = 1024;
              *(_DWORD *)v37 = valuePtr;
              _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Adding machThreadPriority=%d as kVTDecompressionPropertyKey_MachThreadPriorityOfConsistentThreadCallingDecodeFrame", buf, 0x22u);
            }
          }
          VTDecompressionSessionSetProperty();
          CFRelease(v12);
        }
LABEL_18:
        v10 = 0;
LABEL_19:
        CFRelease(v7);
        return v10;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_19;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      v24 = *p_decompressionSession;
      *(_DWORD *)buf = 136316418;
      v31 = v22;
      v32 = 2080;
      v33 = "-[VCVideoStreamReceiver createDecodeSession:]";
      v34 = 1024;
      v35 = 954;
      v36 = 1024;
      *(_DWORD *)v37 = v10;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v10;
      v38 = 2048;
      v39 = v24;
      v25 = " [%s] %s:%d VTDecompressionSessionCreate() returned result=%d(0x%x), _decompressionSession=%p";
    }
    else
    {
      v15 = CFDictionaryCreateMutable(v5, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if ((int)VRTraceGetErrorLogLevelForModule() <= 6)
      {
        v19 = (const void *)*MEMORY[0x1E0CED458];
      }
      else
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
        v19 = (const void *)*MEMORY[0x1E0CED458];
        if (v18)
        {
          *(_DWORD *)buf = 136315906;
          v31 = v16;
          v32 = 2080;
          v33 = "-[VCVideoStreamReceiver createDecodeSession:]";
          v34 = 1024;
          v35 = 965;
          v36 = 2112;
          *(_QWORD *)v37 = v19;
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Adding kVTDecompressionSessionOption_AllowClientProcessDecode=%@ to decompressionSessionOptions", buf, 0x26u);
        }
      }
      CFDictionaryAddValue(v15, v19, v8);
      v20 = &self->_decompressionSession;
      v10 = VTDecompressionSessionCreateWithOptions();
      if (v15)
        CFRelease(v15);
      if (!v10 && *v20)
        goto LABEL_18;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_19;
      v26 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      v27 = *v20;
      *(_DWORD *)buf = 136316418;
      v31 = v26;
      v32 = 2080;
      v33 = "-[VCVideoStreamReceiver createDecodeSession:]";
      v34 = 1024;
      v35 = 969;
      v36 = 1024;
      *(_DWORD *)v37 = v10;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v10;
      v38 = 2048;
      v39 = v27;
      v25 = " [%s] %s:%d VTDecompressionSessionCreateWithOptions() returned result=%d(0x%x), _decompressionSession=%p";
    }
    _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0x32u);
    goto LABEL_19;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStreamReceiver createDecodeSession:].cold.1();
  }
  return 0;
}

- (void)teardownDecodeSession:(BOOL)a3
{
  _BOOL4 v3;
  _opaque_pthread_mutex_t *p_decompressionSessionMutex;
  OpaqueVTDecompressionSession *decompressionSession;
  OpaqueVTDecompressionSession *v7;

  v3 = a3;
  p_decompressionSessionMutex = &self->_decompressionSessionMutex;
  pthread_mutex_lock(&self->_decompressionSessionMutex);
  decompressionSession = self->_decompressionSession;
  if (decompressionSession)
  {
    if (v3)
    {
      VTDecompressionSessionWaitForAsynchronousFrames(decompressionSession);
      decompressionSession = self->_decompressionSession;
    }
    VTDecompressionSessionInvalidate(decompressionSession);
    v7 = self->_decompressionSession;
    if (v7)
    {
      CFRelease(v7);
      self->_decompressionSession = 0;
    }
  }
  pthread_mutex_unlock(p_decompressionSessionMutex);
}

- (int)decodeFrame:(opaqueCMSampleBuffer *)a3 showFrame:(BOOL)a4
{
  _BOOL4 v4;
  const opaqueCMFormatDescription *FormatDescription;
  OpaqueVTDecompressionSession *decompressionSession;
  uint64_t v9;
  NSObject *v10;
  OpaqueVTDecompressionSession *v11;
  VTDecodeFrameFlags v12;
  VTDecodeInfoFlags infoFlagsOut;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  decompressionSession = self->_decompressionSession;
  if (decompressionSession)
  {
    if (!VTDecompressionSessionCanAcceptFormatDescription(decompressionSession, FormatDescription))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v16 = v9;
          v17 = 2080;
          v18 = "-[VCVideoStreamReceiver decodeFrame:showFrame:]";
          v19 = 1024;
          v20 = 1004;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Resetting VTDecompressionSession due to format change", buf, 0x1Cu);
        }
      }
      -[VCVideoStreamReceiver teardownDecodeSession:](self, "teardownDecodeSession:", 1);
    }
    v11 = self->_decompressionSession;
    if (v11)
      goto LABEL_10;
  }
  if (!-[VCVideoStreamReceiver createDecodeSession:](self, "createDecodeSession:", FormatDescription))
  {
    v11 = self->_decompressionSession;
LABEL_10:
    if (v4)
      v12 = 1;
    else
      v12 = 3;
    infoFlagsOut = -1431655766;
    VTDecompressionSessionDecodeFrame(v11, a3, v12, 0, &infoFlagsOut);
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStreamReceiver decodeFrame:showFrame:].cold.1();
  }
  return 4;
}

- (BOOL)canDequeue:(opaqueCMBufferQueue *)a3 forTimestamp:(unsigned int)a4
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  opaqueCMSampleBuffer *Head;
  CMTime v13;
  int v14;
  __int16 v15;
  unsigned int v16;
  __int16 v17;
  CMItemCount BufferCount;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v8 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v13.value) = 136316162;
        *(CMTimeValue *)((char *)&v13.value + 4) = v6;
        LOWORD(v13.flags) = 2080;
        *(_QWORD *)((char *)&v13.flags + 2) = "-[VCVideoStreamReceiver canDequeue:forTimestamp:]";
        HIWORD(v13.epoch) = 1024;
        v14 = 1023;
        v15 = 1024;
        v16 = a4;
        v17 = 2048;
        BufferCount = CMBufferQueueGetBufferCount(a3);
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d timestamp:%08X count:%ld", (uint8_t *)&v13, 0x2Cu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v13.value) = 136316162;
      *(CMTimeValue *)((char *)&v13.value + 4) = v6;
      LOWORD(v13.flags) = 2080;
      *(_QWORD *)((char *)&v13.flags + 2) = "-[VCVideoStreamReceiver canDequeue:forTimestamp:]";
      HIWORD(v13.epoch) = 1024;
      v14 = 1023;
      v15 = 1024;
      v16 = a4;
      v17 = 2048;
      BufferCount = CMBufferQueueGetBufferCount(a3);
      _os_log_debug_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEBUG, " [%s] %s:%d timestamp:%08X count:%ld", (uint8_t *)&v13, 0x2Cu);
    }
  }
  if (CMBufferQueueIsEmpty(a3))
  {
LABEL_8:
    LOBYTE(v9) = 0;
    return v9;
  }
  Head = (opaqueCMSampleBuffer *)CMBufferQueueGetHead(a3);
  memset(&v13, 170, sizeof(v13));
  CMSampleBufferGetDecodeTimeStamp(&v13, Head);
  if ((v13.flags & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v9)
        return v9;
      -[VCVideoStreamReceiver canDequeue:forTimestamp:].cold.1();
    }
    goto LABEL_8;
  }
  LOBYTE(v9) = LODWORD(v13.value) == a4 || LODWORD(v13.value) - a4 > 0x7FFFFFFE;
  return v9;
}

- (void)dequeueAndDecodeForTimestamp:(unsigned int)a3
{
  uint64_t v3;
  opaqueCMSampleBuffer *v5;
  opaqueCMSampleBuffer *v6;
  _BOOL4 v7;
  __int128 v8;
  __int128 v9;
  OpaqueCMClock *HostTimeClock;
  CMTime v11;
  CMSampleTimingInfo sampleTimingArray;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(self->_videoQueue);
  if (v5)
  {
    v6 = v5;
    v7 = -[VCVideoStreamReceiver canDequeue:forTimestamp:](self, "canDequeue:forTimestamp:", self->_videoQueue, v3);
    v8 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v8;
    sampleTimingArray.decodeTimeStamp.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
    v9 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E90];
    *(_OWORD *)&sampleTimingArray.duration.epoch = v9;
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&sampleTimingArray.presentationTimeStamp, HostTimeClock);
    sampleTimingArray.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    CMTimeMake(&v11, 1, 1);
    sampleTimingArray.duration = v11;
    v11.value = 0;
    CMSampleBufferCreateCopyWithNewTiming((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, 1, &sampleTimingArray, (CMSampleBufferRef *)&v11);
    CFRelease(v6);
    if (v11.value)
    {
      -[VCVideoStreamReceiver decodeFrame:showFrame:](self, "decodeFrame:showFrame:", v11.value, !v7);
      CFRelease((CFTypeRef)v11.value);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamReceiver dequeueAndDecodeForTimestamp:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCVideoStreamReceiver dequeueAndDecodeForTimestamp:].cold.1();
  }
}

- (void)handleAlarmForTimeStamp:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  if (-[VCVideoStreamReceiver canDequeue:forTimestamp:](self, "canDequeue:forTimestamp:", self->_videoQueue, *(_QWORD *)&a3))
  {
    do
      -[VCVideoStreamReceiver dequeueAndDecodeForTimestamp:](self, "dequeueAndDecodeForTimestamp:", v3);
    while (-[VCVideoStreamReceiver canDequeue:forTimestamp:](self, "canDequeue:forTimestamp:", self->_videoQueue, v3));
  }
}

- (BOOL)handleRemoteVideoAttributesChange:(__CVBuffer *)a3
{
  VideoAttributes *v5;
  double Width;
  VideoAttributes *remoteVideoAttributes;

  v5 = objc_alloc_init(VideoAttributes);
  -[VideoAttributes setOrientation:](v5, "setOrientation:", self->super._remoteVideoOrientation);
  -[VideoAttributes setCamera:](v5, "setCamera:", self->_remoteVideoCamera);
  -[VideoAttributes setVideoMirrored:](v5, "setVideoMirrored:", self->_remoteVideoMirrored);
  Width = (double)CVPixelBufferGetWidth(a3);
  -[VideoAttributes setRatio:](v5, "setRatio:", Width, (double)CVPixelBufferGetHeight(a3));
  -[VideoAttributes scaleFactor](self->_remoteVideoAttributes, "scaleFactor");
  -[VideoAttributes setScaleFactor:](v5, "setScaleFactor:");
  remoteVideoAttributes = self->_remoteVideoAttributes;
  if (remoteVideoAttributes)
  {
    if (VCVideoAttributes_IsEqual((uint64_t)remoteVideoAttributes, (uint64_t)v5))
    {

      return 0;
    }

  }
  self->_remoteVideoAttributes = v5;
  return 1;
}

- (int)showDecodedFrame:(__CVBuffer *)a3 atTime:(id *)a4
{
  VideoAttributes *remoteVideoAttributes;
  void (*didReceiveRemoteFrame)(VCVideoReceiverDelegate *, __CVBuffer *, __int128 *, VideoAttributes *, _QWORD, _BOOL8);
  VCVideoReceiverDelegate *delegate;
  _BOOL8 v10;
  __int128 v12;
  int64_t var3;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[VCVideoStreamReceiver handleRemoteVideoAttributesChange:](self, "handleRemoteVideoAttributesChange:"))
  {
    -[VCVideoStreamReceiver reportingVideoStreamEvent:](self, "reportingVideoStreamEvent:", 211);
    remoteVideoAttributes = self->_remoteVideoAttributes;
  }
  else
  {
    remoteVideoAttributes = 0;
  }
  didReceiveRemoteFrame = (void (*)(VCVideoReceiverDelegate *, __CVBuffer *, __int128 *, VideoAttributes *, _QWORD, _BOOL8))self->super._delegateFunctions.didReceiveRemoteFrame;
  delegate = self->super._delegate;
  v10 = !self->_receivedFirstRemoteFrame;
  v12 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  didReceiveRemoteFrame(delegate, a3, &v12, remoteVideoAttributes, 0, v10);
  if (!self->_receivedFirstRemoteFrame)
    self->_receivedFirstRemoteFrame = 1;
  if (self->_enableReceiveBitstreamDump)
    DumpFrameYuvWithTimestamp(1, a3, a4->var0);
  return 0;
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  __CFDictionary *v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const __CFAllocator *v11;
  CFStringRef v12;
  CFStringRef v13;
  uint64_t v14;
  CFStringRef v15;
  uint64_t v16;
  CFStringRef v17;
  uint64_t v18;
  CFStringRef v19;
  uint64_t v20;
  CFStringRef v21;
  uint64_t v22;
  CFStringRef v23;
  uint64_t v24;
  CFStringRef v25;
  unsigned int *p_videoStallDurationMillis;
  uint64_t v27;
  CFStringRef v28;
  CFStringRef v29;
  CFStringRef v30;
  CFStringRef v31;
  CFStringRef v32;
  uint64_t v33;
  CFStringRef v34;
  uint64_t v35;
  CFStringRef v36;
  uint64_t v37;
  CFStringRef v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  unsigned int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = (__CFDictionary *)selectDestinationForRTMetrics();
  v5 = micro();
  if (self->_reportingIntervalStartTime == 0.0)
    self->_reportingIntervalStartTime = v5;
  if (self->_reportingLastUpdateTime > 0.0)
  {
    -[VCMediaStreamStats updateMinMaxSinceTime:](self->_stats, "updateMinMaxSinceTime:");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        -[VCMediaStreamStats framerate](self->_stats, "framerate");
        v9 = v8;
        v10 = -[VCMediaStreamStats bitrateKbps](self->_stats, "bitrateKbps");
        *(_DWORD *)buf = 136316162;
        v44 = v6;
        v45 = 2080;
        v46 = "-[VCVideoStreamReceiver gatherRealtimeStats:]";
        v47 = 1024;
        v48 = 1149;
        v49 = 2048;
        v50 = v9;
        v51 = 1024;
        v52 = v10;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: VideoStreamReceiver videoRxFrameRate=%f, videoRxBitrate=%d kbps", buf, 0x2Cu);
      }
    }
  }
  self->_reportingLastUpdateTime = v5;
  if (v4)
  {
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%d"), -[VCVideoStreamRateAdaptation sendTmmbrBitrate](self->_rateAdaptation, "sendTmmbrBitrate"));
    CFDictionaryAddValue(v4, CFSTR("VCVSTMMB"), v12);
    CFRelease(v12);
    v13 = CFStringCreateWithFormat(v11, 0, CFSTR("%d"), -[VCVideoStreamRateAdaptation operatingBitrate](self->_rateAdaptation, "operatingBitrate"));
    CFDictionaryAddValue(v4, CFSTR("VCVSRxOperatingBitrate"), v13);
    CFRelease(v13);
    -[VCVideoStreamRateAdaptation packetLossPercentage](self->_rateAdaptation, "packetLossPercentage");
    v15 = CFStringCreateWithFormat(v11, 0, CFSTR("%.5f"), v14);
    CFDictionaryAddValue(v4, CFSTR("VCVSRxPacketLossPercentage"), v15);
    CFRelease(v15);
    -[VCVideoStreamRateAdaptation roundTripTime](self->_rateAdaptation, "roundTripTime");
    v17 = CFStringCreateWithFormat(v11, 0, CFSTR("%.5f"), v16);
    CFDictionaryAddValue(v4, CFSTR("VCVSRxRoundTripTime"), v17);
    CFRelease(v17);
    -[VCVideoStreamRateAdaptation maxOWRD](self->_rateAdaptation, "maxOWRD");
    v19 = CFStringCreateWithFormat(v11, 0, CFSTR("%.5f"), v18);
    CFDictionaryAddValue(v4, CFSTR("VCVSRxMaxOWRD"), v19);
    CFRelease(v19);
    -[VCVideoStreamRateAdaptation setMaxOWRD:](self->_rateAdaptation, "setMaxOWRD:", 0.0);
    -[VCVideoStreamRateAdaptation nowrd](self->_rateAdaptation, "nowrd");
    v21 = CFStringCreateWithFormat(v11, 0, CFSTR("%.5f"), v20);
    CFDictionaryAddValue(v4, CFSTR("VCVSRxNOWRD"), v21);
    CFRelease(v21);
    -[VCVideoStreamRateAdaptation nowrdShort](self->_rateAdaptation, "nowrdShort");
    v23 = CFStringCreateWithFormat(v11, 0, CFSTR("%.5f"), v22);
    CFDictionaryAddValue(v4, CFSTR("VCVSRxNOWRDSHORT"), v23);
    CFRelease(v23);
    -[VCVideoStreamRateAdaptation nowrdAcc](self->_rateAdaptation, "nowrdAcc");
    v25 = CFStringCreateWithFormat(v11, 0, CFSTR("%.5f"), v24);
    CFDictionaryAddValue(v4, CFSTR("VCVSRxNOWRDACC"), v25);
    CFRelease(v25);
    p_videoStallDurationMillis = &self->_videoStallDurationMillis;
    do
      v27 = __ldxr(p_videoStallDurationMillis);
    while (__stxr(0, p_videoStallDurationMillis));
    v28 = CFStringCreateWithFormat(v11, 0, CFSTR("%u"), v27);
    CFDictionaryAddValue(v4, CFSTR("VCVSRxVideoStallDuration"), v28);
    CFRelease(v28);
    v29 = CFStringCreateWithFormat(v11, 0, CFSTR("%u"), -[VCMediaStreamStats maxFrameDurationMillis](self->_stats, "maxFrameDurationMillis"));
    CFDictionaryAddValue(v4, CFSTR("VCVSRxMaxFrameDuration"), v29);
    CFRelease(v29);
    -[VCMediaStreamStats setMaxFrameDurationMillis:](self->_stats, "setMaxFrameDurationMillis:", 0);
    v30 = CFStringCreateWithFormat(v11, 0, CFSTR("%u"), -[VCMediaStreamStats getBitrateKbpsSinceTime:](self->_stats, "getBitrateKbpsSinceTime:", self->_reportingIntervalStartTime));
    CFDictionaryAddValue(v4, CFSTR("VCVSRxAvgBitrate"), v30);
    CFRelease(v30);
    v31 = CFStringCreateWithFormat(v11, 0, CFSTR("%u"), -[VCMediaStreamStats maxBitrateKbps](self->_stats, "maxBitrateKbps"));
    CFDictionaryAddValue(v4, CFSTR("VCVSRxMaxBitrate"), v31);
    CFRelease(v31);
    -[VCMediaStreamStats setMaxBitrateKbps:](self->_stats, "setMaxBitrateKbps:", 0);
    v32 = CFStringCreateWithFormat(v11, 0, CFSTR("%u"), -[VCMediaStreamStats minBitrateKbps](self->_stats, "minBitrateKbps"));
    CFDictionaryAddValue(v4, CFSTR("VCVSRxMinBitrate"), v32);
    CFRelease(v32);
    -[VCMediaStreamStats setMinBitrateKbps:](self->_stats, "setMinBitrateKbps:", 0xFFFFFFFFLL);
    -[VCMediaStreamStats getFramerateSinceTime:](self->_stats, "getFramerateSinceTime:", self->_reportingIntervalStartTime);
    v34 = CFStringCreateWithFormat(v11, 0, CFSTR("%5.2f"), v33);
    CFDictionaryAddValue(v4, CFSTR("VCVSRxAvgFramerate"), v34);
    CFRelease(v34);
    -[VCMediaStreamStats maxFramerate](self->_stats, "maxFramerate");
    v36 = CFStringCreateWithFormat(v11, 0, CFSTR("%5.2f"), v35);
    CFDictionaryAddValue(v4, CFSTR("VCVSRxMaxFramerate"), v36);
    CFRelease(v36);
    -[VCMediaStreamStats setMaxFramerate:](self->_stats, "setMaxFramerate:", 0.0);
    -[VCMediaStreamStats minFramerate](self->_stats, "minFramerate");
    v38 = CFStringCreateWithFormat(v11, 0, CFSTR("%5.2f"), v37);
    CFDictionaryAddValue(v4, CFSTR("VCVSRxMinFramerate"), v38);
    CFRelease(v38);
    -[VCMediaStreamStats setMinFramerate:](self->_stats, "setMinFramerate:", 1.79769313e308);
    self->_reportingIntervalStartTime = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E0CF2758];
      v41 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = objc_msgSend((id)-[__CFDictionary description](v4, "description"), "UTF8String");
          *(_DWORD *)buf = 136315906;
          v44 = v39;
          v45 = 2080;
          v46 = "-[VCVideoStreamReceiver gatherRealtimeStats:]";
          v47 = 1024;
          v48 = 1228;
          v49 = 2080;
          v50 = v42;
          _os_log_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Rx RTCReporting:%s", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoStreamReceiver gatherRealtimeStats:].cold.1(v39, v4, v40);
      }
    }
  }
}

- (void)reportingVideoStreamEvent:(unsigned __int16)a3
{
  int v3;
  const __CFAllocator *v5;
  __CFDictionary *Mutable;
  uint64_t v7;
  CFStringRef v8;
  uint64_t v9;
  CFStringRef v10;
  CFStringRef v11;
  const __CFString *v12;
  uint64_t v13;

  v3 = a3;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  switch(v3)
  {
    case 229:
      v11 = CFStringCreateWithFormat(v5, 0, CFSTR("%zu"), self->_lastKeyFrameSampleBufferSize);
      v12 = CFSTR("VCVSKeyFrameSize");
      goto LABEL_7;
    case 223:
      -[VCVideoStreamRateAdaptation packetLossPercentage](self->_rateAdaptation, "packetLossPercentage");
      v11 = CFStringCreateWithFormat(v5, 0, CFSTR("%.5f"), v13);
      v12 = CFSTR("VCVSRxPacketLossPercentage");
      goto LABEL_7;
    case 211:
      -[VideoAttributes ratio](self->_remoteVideoAttributes, "ratio");
      v8 = CFStringCreateWithFormat(v5, 0, CFSTR("%f"), v7);
      CFDictionaryAddValue(Mutable, CFSTR("VCVSRxVideoWidth"), v8);
      CFRelease(v8);
      -[VideoAttributes ratio](self->_remoteVideoAttributes, "ratio");
      v10 = CFStringCreateWithFormat(v5, 0, CFSTR("%f"), v9);
      CFDictionaryAddValue(Mutable, CFSTR("VCVSRxVideoHeight"), v10);
      CFRelease(v10);
      v11 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), -[VideoAttributes orientation](self->_remoteVideoAttributes, "orientation"));
      v12 = CFSTR("VCVSRxVideoOrientation");
LABEL_7:
      CFDictionaryAddValue(Mutable, v12, v11);
      CFRelease(v11);
      break;
  }
  reportingVideoStreamEvent();
  CFRelease(Mutable);
}

- (void)handleActiveConnectionChange:(id)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoStreamReceiver handleActiveConnectionChange:]";
      v9 = 1024;
      v10 = 1269;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Handling active connection change is not implemented for VCVSR", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)setJitterBufferMode:(int)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoStreamReceiver setJitterBufferMode:]";
      v9 = 1024;
      v10 = 1275;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Handling setting the jitter buffer mode is not implemented for VCVSR", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)setDeferredAssemblyEnabled:(BOOL)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoStreamReceiver setDeferredAssemblyEnabled:]";
      v9 = 1024;
      v10 = 1279;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Handling setting deferred assembly at runtime is not implemented for VCVSR", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)setLooseAVSyncEnabled:(BOOL)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCVideoStreamReceiver setLooseAVSyncEnabled:]";
      v9 = 1024;
      v10 = 1283;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Handling setting loose av sync at runtime is not implemented for VCVSR", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)initWithConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d no config specified!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d no delegate specified!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCVideoStreamReceiver initWithConfig:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d VCTransportStreamRunLoopVTPCreate failed %d", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamReceiver initWithConfig:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __50__VCVideoStreamReceiver_startNetworkReceiveThread__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCVideoStreamReceiver startNetworkReceiveThread]_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Network receive thread create failed (%d)", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamReceiver startNetworkReceiveThread]_block_invoke" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)processVideoRTP
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d bCameraStatusBits = %x", v2, v3, v4, 516);
  OUTLINED_FUNCTION_3();
}

- (void)scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMSampleBufferCreate failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMBufferQueueEnqueue failed %d", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamReceiver scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to read format from sampleBuffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)scheduleDecodeForFrameWithBuffer:timestamp:hostTime:showFrame:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "_VCVideoStreamReceiver_CreateVideoFormatDescription";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMVideoFormatDescriptionCreateFromH264ParameterSets failed (%d)", v2, *(const char **)v3, (unint64_t)"_VCVideoStreamReceiver_CreateVideoFormatDescription" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)reportVideoStallStatus:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create reporting event dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)createDecodeSession:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create pixelBufferAttributes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)decodeFrame:showFrame:.cold.1()
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[14];
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCVideoStreamReceiver decodeFrame:showFrame:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  v5 = v0;
  v6 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d -createDecodeSession: returned result=%d(0x%x)", v3, 0x28u);
  OUTLINED_FUNCTION_3();
}

- (void)canDequeue:forTimestamp:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCVideoStreamReceiver canDequeue:forTimestamp:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMSampleBufferGetDecodeTimeStamp is invalid timestamp:%u", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamReceiver canDequeue:forTimestamp:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)dequeueAndDecodeForTimestamp:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMBufferQueueDequeueAndRetain returned null!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dequeueAndDecodeForTimestamp:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCVideoStreamReceiver dequeueAndDecodeForTimestamp:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMSampleBufferCreateCopyWithNewTiming failed %d", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamReceiver dequeueAndDecodeForTimestamp:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)gatherRealtimeStats:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  __int16 v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
  v7 = 136315906;
  v8 = a1;
  v9 = 2080;
  OUTLINED_FUNCTION_9();
  v10 = 1228;
  v11 = v5;
  v12 = v6;
  _os_log_debug_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Rx RTCReporting:%s", (uint8_t *)&v7, 0x26u);
}

@end
