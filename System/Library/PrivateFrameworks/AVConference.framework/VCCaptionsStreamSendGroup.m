@implementation VCCaptionsStreamSendGroup

- (VCCaptionsStreamSendGroup)initWithConfig:(id)a3
{
  VCCaptionsStreamSendGroup *v4;
  uint64_t v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCCaptionsStreamSendGroup;
  v4 = -[VCMediaStreamSendGroup initWithConfig:](&v7, sel_initWithConfig_);
  if (v4)
  {
    v4->_common = -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:]([VCAudioStreamGroupCommon alloc], "initWithConfig:audioCallback:context:audioDirection:stateQueue:", a3, VCCaptionsStreamSendGroup_PushAudioSamples, v4, 2, v4->super.super._stateQueue);
    -[VCObject setLogPrefix:](v4->_common, "setLogPrefix:", -[VCObject logPrefix](v4, "logPrefix"));
    if (v4->_common)
    {
      v4->_audioCaptions = -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:]([VCAudioCaptions alloc], "initWithDelegate:isLocal:taskIdentifier:reportingAgent:", v4, 1, CFSTR("facetimecaptions"), 0);
      VCCaptionsEncoder_Create(&v4->_captionsEncoder);
    }
    else
    {

      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCaptionsStreamSendGroup initWithConfig:].cold.1(v6);
      }
      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  VCCaptionsEncoder_Destroy((id **)&self->_captionsEncoder);
  -[VCAudioCaptions setDelegate:](self->_audioCaptions, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsStreamSendGroup;
  -[VCMediaStreamSendGroup dealloc](&v3, sel_dealloc);
}

- (id)willStart
{
  id result;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)VCCaptionsStreamSendGroup;
  result = -[VCMediaStreamGroup willStart](&v4, sel_willStart);
  if (!result)
  {
    objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "registerCaptionsSource:streamToken:", self, -[VCMediaStreamGroup streamToken](self, "streamToken"));
    if (-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:](self->_common, "configureAudioIOWithDeviceRole:operatingMode:", -[VCCaptionsStreamSendGroup deviceRole](self, "deviceRole"), objc_msgSend(-[NSArray firstObject](-[NSDictionary allValues](self->super.super._streamIDToMediaStreamMap, "allValues"), "firstObject"), "operatingMode")))
    {
      -[VCAudioStreamGroupCommon startAudioDump](self->_common, "startAudioDump");
      -[VCAudioCaptions enableCaptions:](self->_audioCaptions, "enableCaptions:", 1);
      -[VCAudioCaptions start:forToken:withCompletionHandler:](self->_audioCaptions, "start:forToken:withCompletionHandler:", -[VCAudioIO clientFormat](-[VCAudioStreamGroupCommon audioIO](self->_common, "audioIO"), "clientFormat"), -[VCMediaStreamGroup streamToken](self, "streamToken"), 0);
      return 0;
    }
    else
    {
      objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "unregisterCaptionsSourceWithStreamToken:", -[VCMediaStreamGroup streamToken](self, "streamToken"));
      return +[VCSessionErrorUtils VCSessionParticipantErrorEvent:errorPath:](VCSessionErrorUtils, "VCSessionParticipantErrorEvent:errorPath:", 14, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCaptionsStreamSendGroup.m", 76));
    }
  }
  return result;
}

- (void)didStop
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCAudioCaptions stop](self->_audioCaptions, "stop");
  -[VCAudioCaptions enableCaptions:](self->_audioCaptions, "enableCaptions:", 0);
  -[VCAudioStreamGroupCommon stopAudioDump](self->_common, "stopAudioDump");
  objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "unregisterCaptionsSourceWithStreamToken:", -[VCMediaStreamGroup streamToken](self, "streamToken"));
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsStreamSendGroup;
  -[VCMediaStreamSendGroup didStop](&v3, sel_didStop);
}

- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6
{
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCCaptionsStreamSendGroup *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  -[VCMediaStreamSendGroup setIsSuspended:](self, "setIsSuspended:", objc_msgSend(a3, "count") == 0);
  if (objc_msgSend(a3, "count"))
  {
    v9 = (void *)objc_msgSend(a3, "firstObject");

    self->_activeCaptionsStreamID = (NSNumber *)v9;
    v10 = -[NSDictionary objectForKeyedSubscript:](self->super.super._streamIDToMediaStreamMap, "objectForKeyedSubscript:", v9);
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, "setTargetEncoderBitrate:", objc_msgSend((id)objc_msgSend(a5, "firstObject"), "unsignedIntValue"));
      v28[0] = v9;
      v12 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      objc_msgSend(v11, "setStreamIDs:repairStreamIDs:", v12, MEMORY[0x1E0C9AA60]);
    }
    else if ((VCCaptionsStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCaptionsStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCCaptionsStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v16 = 136316418;
          v17 = v14;
          v18 = 2080;
          v19 = "-[VCCaptionsStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
          v20 = 1024;
          v21 = 104;
          v22 = 2112;
          v23 = v13;
          v24 = 2048;
          v25 = self;
          v26 = 2112;
          v27 = v9;
          _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) not found captions stream with stream ID %@", (uint8_t *)&v16, 0x3Au);
        }
      }
    }
  }
}

- (id)activeStreamKeys
{
  id result;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  result = -[NSDictionary objectForKeyedSubscript:](self->super.super._streamIDToMediaStreamMap, "objectForKeyedSubscript:", self->_activeCaptionsStreamID);
  if (result)
  {
    v4[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), self->super.super._participantUUID, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(result, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID")));
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  }
  return result;
}

- (BOOL)isMuted
{
  return -[VCAudioStreamGroupCommon isMuted](self->_common, "isMuted");
}

- (void)setMuted:(BOOL)a3
{
  -[VCAudioStreamGroupCommon setMuted:](self->_common, "setMuted:", a3);
}

- (BOOL)setDeviceRole:(int)a3 operatingMode:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *stateQueue;
  _QWORD v9[6];
  int v10;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  stateQueue = self->super.super._stateQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__VCCaptionsStreamSendGroup_setDeviceRole_operatingMode___block_invoke;
  v9[3] = &unk_1E9E52378;
  v9[4] = self;
  v9[5] = &v12;
  v10 = a3;
  v11 = a4;
  dispatch_sync(stateQueue, v9);
  -[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:](self->_common, "configureAudioIOWithDeviceRole:operatingMode:", v5, v4);
  LOBYTE(v4) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v4;
}

uint64_t __57__VCCaptionsStreamSendGroup_setDeviceRole_operatingMode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "setDeviceRole:operatingMode:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)deviceRole
{
  return -[VCAudioStreamGroupCommon deviceRole](self->_common, "deviceRole");
}

- (BOOL)isPowerSpectrumEnabled
{
  return 0;
}

- (void)collectAndLogChannelMetrics:(id *)a3
{
  if (self->_activeCaptionsStreamID)
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super.super._streamIDToMediaStreamMap, "objectForKeyedSubscript:"), "collectTxChannelMetrics:", a3);
}

- (void)setReportingAgent:(opaqueRTCReporting *)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VCCaptionsStreamSendGroup_setReportingAgent___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  block[5] = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __47__VCCaptionsStreamSendGroup_setReportingAgent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)VCCaptionsStreamSendGroup;
  objc_msgSendSuper2(&v4, sel_setReportingAgent_, v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 736), "setReportingAgent:", *(_QWORD *)(a1 + 40));
}

- (id)startCapture
{
  return -[VCAudioStreamGroupCommon startCapture](self->_common, "startCapture");
}

- (id)stopCapture
{
  return -[VCAudioStreamGroupCommon stopCapture](self->_common, "stopCapture");
}

- (void)registerCaptionsEventDelegate:(id)a3
{
  if (objc_msgSend(a3, "conformsToProtocol:", &unk_1F01D1B48))
    objc_storeWeak((id *)&self->_captionsDelegate, a3);
}

- (id)captionsDelegate
{
  return objc_loadWeak((id *)&self->_captionsDelegate);
}

- (void)setCaptionsLocale:(id)a3
{
  -[VCAudioCaptions setLocale:](self->_audioCaptions, "setLocale:", a3);
}

- (void)setCaptionsUsage:(id)a3
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = CFSTR("ACSU");
    v4[0] = a3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
    reportingGenericEvent();
  }
}

- (BOOL)captionsEnabled
{
  return -[VCAudioCaptions enabled](self->_audioCaptions, "enabled");
}

- (BOOL)captionsSupported
{
  return -[VCAudioCaptions supported](self->_audioCaptions, "supported");
}

- (void)enableCaptions:(BOOL)a3
{
  -[VCAudioCaptions enableCaptions:](self->_audioCaptions, "enableCaptions:", a3);
}

- (void)didDisableCaptions:(BOOL)a3 error:(id)a4
{
  NSObject *global_queue;
  _QWORD v8[6];
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__VCCaptionsStreamSendGroup_didDisableCaptions_error___block_invoke;
  v8[3] = &unk_1E9E52210;
  v9 = a3;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(global_queue, v8);
}

uint64_t __54__VCCaptionsStreamSendGroup_didDisableCaptions_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "streamToken:didDisableCaptions:error:", objc_msgSend(*(id *)(a1 + 32), "streamToken"), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)didEnableCaptions:(BOOL)a3 error:(id)a4
{
  NSObject *global_queue;
  _QWORD v8[6];
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__VCCaptionsStreamSendGroup_didEnableCaptions_error___block_invoke;
  v8[3] = &unk_1E9E52210;
  v9 = a3;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(global_queue, v8);
}

uint64_t __53__VCCaptionsStreamSendGroup_didEnableCaptions_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "streamToken:didEnableCaptions:error:", objc_msgSend(*(id *)(a1 + 32), "streamToken"), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)didStartCaptioningWithReason:(int)a3 streamToken:(int64_t)a4
{
  NSObject *global_queue;
  _QWORD v8[6];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__VCCaptionsStreamSendGroup_didStartCaptioningWithReason_streamToken___block_invoke;
  v8[3] = &unk_1E9E52350;
  v8[4] = self;
  v8[5] = a4;
  v9 = a3;
  dispatch_async(global_queue, v8);
}

uint64_t __70__VCCaptionsStreamSendGroup_didStartCaptioningWithReason_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "streamToken:didStartCaptioningWithReason:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)didStopCaptioningWithReason:(int)a3 streamToken:(int64_t)a4
{
  NSObject *global_queue;
  _QWORD v8[6];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__VCCaptionsStreamSendGroup_didStopCaptioningWithReason_streamToken___block_invoke;
  v8[3] = &unk_1E9E52350;
  v8[4] = self;
  v8[5] = a4;
  v9 = a3;
  dispatch_async(global_queue, v8);
}

uint64_t __69__VCCaptionsStreamSendGroup_didStopCaptioningWithReason_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "streamToken:didStopCaptioningWithReason:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)didUpdateCaptions:(id)a3
{
  NSObject *global_queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VCCaptionsStreamSendGroup_didUpdateCaptions___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(global_queue, block);
  -[VCCaptionsStreamSendGroup transmitTranscription:](self, "transmitTranscription:", a3);
}

uint64_t __47__VCCaptionsStreamSendGroup_didUpdateCaptions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 760), "streamToken:didUpdateCaptions:", objc_msgSend(*(id *)(a1 + 32), "streamToken"), *(_QWORD *)(a1 + 40));
}

- (void)transmitTranscription:(id)a3
{
  OpaqueCMClock *HostTimeClock;
  __int128 v6;
  CMTimeEpoch v7;
  __int128 v8;
  int v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[2];
  int v15;
  CFTypeRef cf;
  __int128 v17;
  _BYTE v18[32];
  __int128 v19;
  CMTimeEpoch v20;
  CMTime v21;
  size_t v22;
  CMSampleTimingInfo buf;
  _BYTE __b[1280];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = 1280;
  memset(__b, 170, sizeof(__b));
  VCCaptionsEncoder_Encode((uint64_t)self->_captionsEncoder, a3, __b, &v22);
  memset(&v21, 170, sizeof(v21));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v21, HostTimeClock);
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 48);
  *(_OWORD *)&v18[16] = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 32);
  v19 = v6;
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E90] + 64);
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E90] + 16);
  v17 = *MEMORY[0x1E0CA2E90];
  *(_QWORD *)v18 = v8;
  *(CMTime *)&v18[8] = v21;
  v20 = v7;
  cf = 0;
  *(_OWORD *)&buf.presentationTimeStamp.timescale = *(_OWORD *)&v21.timescale;
  *(_OWORD *)&buf.decodeTimeStamp.value = v6;
  buf.decodeTimeStamp.epoch = v7;
  *(_OWORD *)&buf.duration.value = v17;
  *(_OWORD *)&buf.duration.epoch = *(_OWORD *)v18;
  v9 = VCCaptionsStream_CreateSampleBuffer(__b, v22, &buf, (CMSampleBufferRef *)&cf);
  if (v9)
  {
    v10 = v9;
    if ((VCCaptionsStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCaptionsStreamSendGroup transmitTranscription:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)-[VCCaptionsStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.duration.value) = 136316418;
          *(CMTimeValue *)((char *)&buf.duration.value + 4) = v12;
          LOWORD(buf.duration.flags) = 2080;
          *(_QWORD *)((char *)&buf.duration.flags + 2) = "-[VCCaptionsStreamSendGroup transmitTranscription:]";
          HIWORD(buf.duration.epoch) = 1024;
          LODWORD(buf.presentationTimeStamp.value) = 263;
          WORD2(buf.presentationTimeStamp.value) = 2112;
          *(CMTimeValue *)((char *)&buf.presentationTimeStamp.value + 6) = (CMTimeValue)v11;
          HIWORD(buf.presentationTimeStamp.flags) = 2048;
          buf.presentationTimeStamp.epoch = (CMTimeEpoch)self;
          LOWORD(buf.decodeTimeStamp.value) = 1024;
          *(_DWORD *)((char *)&buf.decodeTimeStamp.value + 2) = v10;
          _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error creating sample buffer for captions: %d", (uint8_t *)&buf, 0x36u);
        }
      }
    }
  }
  else
  {
    v14[0] = 0;
    v14[1] = 0;
    v15 = 0;
    *(_OWORD *)&buf.duration.value = *(_OWORD *)&v18[8];
    buf.duration.epoch = *(_QWORD *)&v18[24];
    -[VCCaptionsStreamSendGroup onVideoFrame:frameTime:attribute:](self, "onVideoFrame:frameTime:attribute:", cf, &buf, v14);
  }
  if (cf)
    CFRelease(cf);
}

- (void)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  NSNumber **p_activeCaptionsStreamID;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSNumber *v16;
  __int128 v17;
  int v18;
  _BYTE buf[24];
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCCaptionsStreamSendGroup *v24;
  __int16 v25;
  NSNumber *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  p_activeCaptionsStreamID = &self->_activeCaptionsStreamID;
  v10 = -[NSDictionary objectForKeyedSubscript:](self->super.super._streamIDToMediaStreamMap, "objectForKeyedSubscript:", self->_activeCaptionsStreamID);
  if (v10)
  {
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    *(_QWORD *)&buf[16] = a4->var3;
    v17 = *(_OWORD *)&a5->var0;
    v18 = *(_DWORD *)&a5->var6;
    objc_msgSend(v10, "onVideoFrame:frameTime:attribute:", a3, buf, &v17);
  }
  else if ((VCCaptionsStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCaptionsStreamSendGroup onVideoFrame:frameTime:attribute:].cold.1(v12, p_activeCaptionsStreamID, v13);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCCaptionsStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v16 = *p_activeCaptionsStreamID;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCCaptionsStreamSendGroup onVideoFrame:frameTime:attribute:]";
        *(_WORD *)&buf[22] = 1024;
        v20 = 278;
        v21 = 2112;
        v22 = v11;
        v23 = 2048;
        v24 = self;
        v25 = 2112;
        v26 = v16;
        _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) not found captions stream with stream ID %@", buf, 0x3Au);
      }
    }
  }
}

- (void)initWithConfig:(uint64_t)a1 .cold.1(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  OUTLINED_FUNCTION_1();
  v4 = 39;
  _os_log_error_impl(&dword_1D8A54000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create VCAudioStreamGroupCommon", (uint8_t *)&v2, 0x1Cu);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d not found captions stream with stream ID %@");
  OUTLINED_FUNCTION_3();
}

- (void)transmitTranscription:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error creating sample buffer for captions: %d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)onVideoFrame:(uint64_t)a1 frameTime:(_QWORD *)a2 attribute:(NSObject *)a3 .cold.1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];
  __int128 v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCCaptionsStreamSendGroup onVideoFrame:frameTime:attribute:]";
  *(_WORD *)&v3[22] = 1024;
  LODWORD(v4) = 278;
  WORD2(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 6) = *a2;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, (uint64_t)a2, a3, " [%s] %s:%d not found captions stream with stream ID %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], v4);
  OUTLINED_FUNCTION_3();
}

@end
