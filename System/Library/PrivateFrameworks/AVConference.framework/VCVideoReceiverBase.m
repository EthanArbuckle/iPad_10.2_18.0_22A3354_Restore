@implementation VCVideoReceiverBase

- (VCVideoReceiverBase)initWithDelegate:(id)a3 delegateFunctions:(const tagVCVideoReceiverDelegateRealtimeInstanceVTable *)a4
{
  VCVideoReceiverBase *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoReceiverBase;
  result = -[VCVideoReceiverBase init](&v7, sel_init);
  if (result)
  {
    result->_rtpTimestampRate = 90000;
    result->_delegate = (VCVideoReceiverDelegate *)a3;
    result->_vTable.setExternalOutputLatency = _VCVideoReceiverRealtime_SetExternalOutputLatency;
    if (a4)
      result->_delegateFunctions = *a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  self->_mediaStreamSynchronizer = 0;
  self->_syncSource = 0;
  v3.receiver = self;
  v3.super_class = (Class)VCVideoReceiverBase;
  -[VCVideoReceiverBase dealloc](&v3, sel_dealloc);
}

- (void)setEnableCVO:(BOOL)a3 cvoExtensionID:(unint64_t)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), a4, "-[VCVideoReceiverBase setEnableCVO:cvoExtensionID:]"), 0));
}

- (void)setEnableRateAdaptation:(BOOL)a3 maxBitrate:(unsigned int)a4 minBitrate:(unsigned int)a5 adaptationInterval:(double)a6
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), *(_QWORD *)&a4, *(_QWORD *)&a5, a6, "-[VCVideoReceiverBase setEnableRateAdaptation:maxBitrate:minBitrate:adaptationInterval:]"), 0));
}

- (void)startVideo
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase startVideo]"), 0));
}

- (void)stopVideo
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase stopVideo]"), 0));
}

- (void)pauseVideo
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase pauseVideo]"), 0));
}

- (void)rtcpSendIntervalElapsed
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase rtcpSendIntervalElapsed]"), 0));
}

- (BOOL)startSynchronization:(id)a3
{
  uint64_t v5;
  VCMediaStreamSynchronizer *mediaStreamSynchronizer;
  VCMediaStreamSynchronizer *v7;
  uint64_t v8;
  NSObject *v9;
  VCMediaStreamSynchronizer *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  VCMediaStreamSynchronizer *v19;
  __int16 v20;
  VCVideoReceiverBase *v21;
  __int16 v22;
  VCMediaStreamSyncSource *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[VCVideoReceiverBase setSyncSource:](self, "setSyncSource:");
  v5 = objc_msgSend(a3, "getSyncSourceSampleRate");
  mediaStreamSynchronizer = self->_mediaStreamSynchronizer;
  if (mediaStreamSynchronizer
    && -[VCMediaStreamSynchronizer sourceSampleRate](mediaStreamSynchronizer, "sourceSampleRate") == (_DWORD)v5)
  {
    VCMediaStreamSynchronizer_resetDestinationState((uint64_t)self->_mediaStreamSynchronizer);
    VCMediaStreamSyncSourceDelegate_resetSourceState((uint64_t)self->_mediaStreamSynchronizer);
  }
  else
  {
    -[VCVideoReceiverBase setSynchronizer:](self, "setSynchronizer:", 0);

    v7 = -[VCMediaStreamSynchronizer initWithSourceSampleRate:destinationSampleRate:]([VCMediaStreamSynchronizer alloc], "initWithSourceSampleRate:destinationSampleRate:", v5, self->_rtpTimestampRate);
    self->_mediaStreamSynchronizer = v7;
    if (!v7)
      return (char)v7;
    -[VCVideoReceiverBase setSynchronizer:](self, "setSynchronizer:", v7);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_mediaStreamSynchronizer;
      v12 = 136316418;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCVideoReceiverBase startSynchronization:]";
      v16 = 1024;
      v17 = 98;
      v18 = 2048;
      v19 = v10;
      v20 = 2048;
      v21 = self;
      v22 = 2048;
      v23 = -[VCVideoReceiverBase syncSource](self, "syncSource");
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting syncSourceDelegate (%p) for VideoReceiver (%p) for syncSource (%p)", (uint8_t *)&v12, 0x3Au);
    }
  }
  objc_msgSend(a3, "addSyncSourceDelegate:", self->_mediaStreamSynchronizer);
  LOBYTE(v7) = 1;
  return (char)v7;
}

- (void)stopSynchronization
{
  -[VCMediaStreamSyncSource removeSyncSourceDelegate:](-[VCVideoReceiverBase syncSource](self, "syncSource"), "removeSyncSourceDelegate:", self->_mediaStreamSynchronizer);
  -[VCVideoReceiverBase setSyncSource:](self, "setSyncSource:", 0);
}

- (void)collectChannelMetrics:(id *)a3 interval:(float)a4
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase collectChannelMetrics:interval:]"), 0));
}

- (void)setTargetStreamID:(unsigned __int16)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase setTargetStreamID:]"), 0));
}

- (unsigned)lastDisplayedFrameRTPTimestamp
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase lastDisplayedFrameRTPTimestamp]"), 0));
}

- (void)setDeferredAssemblyEnabled:(BOOL)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase setDeferredAssemblyEnabled:]"), 0));
}

- (void)setLooseAVSyncEnabled:(BOOL)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase setLooseAVSyncEnabled:]"), 0));
}

- (void)handleActiveConnectionChange:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase handleActiveConnectionChange:]"), 0));
}

- (void)setJitterBufferMode:(int)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase setJitterBufferMode:]"), 0));
}

- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s must be overridden in a subclass/category"), "-[VCVideoReceiverBase updateSourcePlayoutTime:]"), 0));
}

- (VCVideoReceiverDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (VCVideoReceiverDelegate *)a3;
}

- (int)remoteVideoOrientation
{
  return self->_remoteVideoOrientation;
}

- (void)setRemoteVideoOrientation:(int)a3
{
  self->_remoteVideoOrientation = a3;
}

- (VCMediaStreamSyncSource)syncSource
{
  return self->_syncSource;
}

- (void)setSyncSource:(id)a3
{
  self->_syncSource = (VCMediaStreamSyncSource *)a3;
}

- (double)roundTripTime
{
  return self->_roundTripTime;
}

- (void)setRoundTripTime:(double)a3
{
  self->_roundTripTime = a3;
}

- (double)lastReceivedVideoRTPPacketTime
{
  return self->_lastReceivedVideoRTPPacketTime;
}

- (double)lastReceivedVideoRTCPPacketTime
{
  return self->_lastReceivedVideoRTCPPacketTime;
}

- (float)lastLastVideoStallDuration
{
  return self->_lastLastVideoStallDuration;
}

- (tagVCVideoReceiverDelegateRealtimeInstanceVTable)delegateFunctions
{
  void *didReceiveRemoteFrame;
  void *didReceiveSampleBuffer;
  tagVCVideoReceiverDelegateRealtimeInstanceVTable result;

  didReceiveRemoteFrame = self->_delegateFunctions.didReceiveRemoteFrame;
  didReceiveSampleBuffer = self->_delegateFunctions.didReceiveSampleBuffer;
  result.didReceiveRemoteFrame = didReceiveRemoteFrame;
  result.didReceiveSampleBuffer = didReceiveSampleBuffer;
  return result;
}

- (void)setDelegateFunctions:(tagVCVideoReceiverDelegateRealtimeInstanceVTable)a3
{
  self->_delegateFunctions = a3;
}

@end
