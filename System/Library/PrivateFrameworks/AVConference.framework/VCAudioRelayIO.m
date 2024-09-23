@implementation VCAudioRelayIO

- (VCAudioRelayIO)init
{
  VCAudioRelayIO *v2;
  VCAudioRelayIO *v3;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)VCAudioRelayIO;
  v2 = -[VCObject init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[VCAudioRelayIO initializeFormatContextPointers](v2, "initializeFormatContextPointers");
  return v3;
}

- (VCAudioRelayIO)initWithMicContext:(const tagVCAudioRelayIOContext *)a3 speakerContext:(const tagVCAudioRelayIOContext *)a4
{
  char *v6;
  VCAudioRelayIO *v7;
  __int128 v8;
  __int128 v9;
  unint64_t controllerTimestamp;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  tagVCAudioFrameFormat *relayFormat;
  __int128 v19;
  __int128 v20;
  objc_super v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)VCAudioRelayIO;
  v6 = -[VCObject init](&v22, sel_init);
  v7 = (VCAudioRelayIO *)v6;
  if (v6)
  {
    v9 = *(_OWORD *)&a3->timeInfo.clientSampleRate;
    v8 = *(_OWORD *)&a3->timeInfo.lastHostTime;
    controllerTimestamp = a3->timeInfo.controllerTimestamp;
    *((_OWORD *)v6 + 20) = *(_OWORD *)&a3->sampleBuffer;
    v11 = *(_OWORD *)&a3->callback;
    *((_OWORD *)v6 + 18) = *(_OWORD *)&a3->clientFormat;
    *((_OWORD *)v6 + 19) = v11;
    *((_QWORD *)v6 + 46) = controllerTimestamp;
    *((_OWORD *)v6 + 21) = v9;
    *((_OWORD *)v6 + 22) = v8;
    *((_QWORD *)v6 + 40) = 0;
    v13 = *(_OWORD *)&a4->timeInfo.clientSampleRate;
    v12 = *(_OWORD *)&a4->timeInfo.lastHostTime;
    v14 = a4->timeInfo.controllerTimestamp;
    *(_OWORD *)(v6 + 408) = *(_OWORD *)&a4->sampleBuffer;
    *(_OWORD *)(v6 + 424) = v13;
    v15 = *(_OWORD *)&a4->callback;
    *(_OWORD *)(v6 + 376) = *(_OWORD *)&a4->clientFormat;
    *(_OWORD *)(v6 + 392) = v15;
    *((_QWORD *)v6 + 57) = v14;
    *(_OWORD *)(v6 + 440) = v12;
    *((_QWORD *)v6 + 51) = 0;
    v17 = *(_OWORD *)&a3->clientFormat->format.mBytesPerPacket;
    v16 = *(_OWORD *)&a3->clientFormat->format.mBitsPerChannel;
    *((_OWORD *)v6 + 12) = *(_OWORD *)&a3->clientFormat->format.mSampleRate;
    *((_OWORD *)v6 + 13) = v17;
    *((_OWORD *)v6 + 14) = v16;
    relayFormat = a3->relayFormat;
    v20 = *(_OWORD *)&relayFormat->format.mBytesPerPacket;
    v19 = *(_OWORD *)&relayFormat->format.mBitsPerChannel;
    *((_OWORD *)v6 + 15) = *(_OWORD *)&relayFormat->format.mSampleRate;
    *((_OWORD *)v6 + 16) = v20;
    *((_OWORD *)v6 + 17) = v19;
    objc_msgSend(v6, "initializeFormatContextPointers");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  VCAudioBufferList_Destroy((uint64_t *)&self->_micContext.sampleBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_speakerContext.sampleBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_micBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_speakerBuffer);
  -[VCAudioRelayIO destroyPacketThread](self, "destroyPacketThread");
  -[VCAudioRelayIO closeRecordings](self, "closeRecordings");

  objc_storeWeak(&self->_relay, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCAudioRelayIO;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (void)initializeFormatContextPointers
{
  self->_micContext.clientFormat = &self->_clientFormat;
  self->_micContext.relayFormat = &self->_relayFormat;
  self->_speakerContext.clientFormat = &self->_clientFormat;
  self->_speakerContext.relayFormat = &self->_relayFormat;
}

- (BOOL)isInitialized
{
  BOOL result;

  if (-[VCAudioRelayIO micCallback](self, "micCallback") && -[VCAudioRelayIO speakerCallback](self, "speakerCallback"))
    return 1;
  result = 0;
  self->_remoteCodecInfo.codecType = 0;
  self->_remoteCodecInfo.sampleRate = 24000.0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VCAudioRelayIO *v4;
  VCAudioRelayIO *v5;

  v4 = -[VCAudioRelayIO initWithMicContext:speakerContext:]([VCAudioRelayIO alloc], "initWithMicContext:speakerContext:", &self->_micContext, &self->_speakerContext);
  v5 = v4;
  if (v4)
  {
    -[VCAudioRelayIO setUsePacketThread:](v4, "setUsePacketThread:", self->_usePacketThread);
    -[VCAudioRelayIO setStartCompletionHandler:](v5, "setStartCompletionHandler:", self->_startCompletionHandler);
    -[VCAudioRelayIO setUpdateRemoteCodecInfoContext:](v5, "setUpdateRemoteCodecInfoContext:", self->_updateRemoteCodecInfoContext);
    -[VCAudioRelayIO setUpdateRemoteCodecInfoCallback:](v5, "setUpdateRemoteCodecInfoCallback:", self->_updateRemoteCodecInfoCallback);
    -[VCAudioRelayIO setRemoteCodecInfo:](v5, "setRemoteCodecInfo:", &self->_remoteCodecInfo);
    -[VCAudioRelayIO setRelay:](v5, "setRelay:", -[VCAudioRelayIO relay](self, "relay"));
  }
  return v5;
}

- (BOOL)isEqualToRelayIO:(id)a3
{
  int usePacketThread;
  void *updateRemoteCodecInfoCallback;
  void *updateRemoteCodecInfoContext;
  BOOL result;

  usePacketThread = self->_usePacketThread;
  result = 0;
  if (usePacketThread == objc_msgSend(a3, "usePacketThread")
    && !memcmp(&self->_micContext, (const void *)objc_msgSend(a3, "micContext"), 0x58uLL)
    && !memcmp(&self->_speakerContext, (const void *)objc_msgSend(a3, "speakerContext"), 0x58uLL))
  {
    updateRemoteCodecInfoCallback = self->_updateRemoteCodecInfoCallback;
    if (updateRemoteCodecInfoCallback == (void *)objc_msgSend(a3, "updateRemoteCodecInfoCallback"))
    {
      updateRemoteCodecInfoContext = self->_updateRemoteCodecInfoContext;
      if (updateRemoteCodecInfoContext == (void *)objc_msgSend(a3, "updateRemoteCodecInfoContext"))
        return 1;
    }
  }
  return result;
}

- (const)remoteCodecInfo
{
  return &self->_remoteCodecInfo;
}

- (void)setRemoteCodecInfo:(const _VCRemoteCodecInfo *)a3
{
  unsigned int codecType;
  double sampleRate;
  _VCRemoteCodecInfo *p_remoteCodecInfo;

  if (a3)
  {
    codecType = a3->codecType;
    sampleRate = a3->sampleRate;
  }
  else
  {
    codecType = 0;
    sampleRate = 24000.0;
  }
  p_remoteCodecInfo = &self->_remoteCodecInfo;
  if (self->_remoteCodecInfo.codecType != codecType || self->_remoteCodecInfo.sampleRate != sampleRate)
  {
    p_remoteCodecInfo->codecType = codecType;
    self->_remoteCodecInfo.sampleRate = sampleRate;
    -[VCBasebandCodecNotifications didUpdateBasebandCodec:](-[VCAudioRelayIO relay](self, "relay"), "didUpdateBasebandCodec:", p_remoteCodecInfo);
  }
}

- (void)setRelay:(id)a3
{
  objc_storeWeak(&self->_relay, a3);
}

- (VCBasebandCodecNotifications)relay
{
  return (VCBasebandCodecNotifications *)objc_loadWeak(&self->_relay);
}

- (void)createBuffersForIOContext:(tagVCAudioRelayIOContext *)a3
{
  opaqueVCAudioBufferList **p_sampleBuffer;
  opaqueVCAudioBufferList *sampleBuffer;
  tagVCAudioFrameFormat *clientFormat;
  int v7;
  __int128 v8;
  __int128 v9;
  __int128 v10[2];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sampleBuffer = a3->sampleBuffer;
  p_sampleBuffer = &a3->sampleBuffer;
  if (!sampleBuffer)
  {
    clientFormat = a3->clientFormat;
    v7 = 2 * clientFormat->samplesPerFrame;
    v8 = *(_OWORD *)&clientFormat->format.mSampleRate;
    v9 = *(_OWORD *)&clientFormat->format.mBytesPerPacket;
    v11 = *(_QWORD *)&clientFormat->format.mBitsPerChannel;
    v10[0] = v8;
    v10[1] = v9;
    VCAudioBufferList_Allocate(v10, v7, p_sampleBuffer);
  }
}

- (void)createAudioBuffers
{
  tagVCAudioFrameFormat *p_relayFormat;
  unsigned int samplesPerFrame;
  __int128 v5;
  uint64_t *p_speakerBuffer;
  int v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[VCAudioRelayIO createBuffersForIOContext:](self, "createBuffersForIOContext:", &self->_micContext);
  -[VCAudioRelayIO createBuffersForIOContext:](self, "createBuffersForIOContext:", &self->_speakerContext);
  if (self->_micBuffer)
    VCAudioBufferList_Destroy((uint64_t *)&self->_micBuffer);
  p_relayFormat = &self->_relayFormat;
  samplesPerFrame = self->_relayFormat.samplesPerFrame;
  v5 = *(_OWORD *)&self->_relayFormat.format.mBytesPerPacket;
  v9 = *(_OWORD *)&self->_relayFormat.format.mSampleRate;
  v10 = v5;
  v11 = *(_QWORD *)&self->_relayFormat.format.mBitsPerChannel;
  VCAudioBufferList_Allocate(&v9, samplesPerFrame, &self->_micBuffer);
  p_speakerBuffer = (uint64_t *)&self->_speakerBuffer;
  if (*p_speakerBuffer)
    VCAudioBufferList_Destroy(p_speakerBuffer);
  v7 = p_relayFormat->samplesPerFrame;
  v8 = *(_OWORD *)&p_relayFormat->format.mBytesPerPacket;
  v9 = *(_OWORD *)&p_relayFormat->format.mSampleRate;
  v10 = v8;
  v11 = *(_QWORD *)&p_relayFormat->format.mBitsPerChannel;
  VCAudioBufferList_Allocate(&v9, v7, p_speakerBuffer);
}

- (void)printStreamFormats
{
  VCAudioStructs_PrintFrameFormat((uint64_t)"client format: ", (uint64_t *)&self->_clientFormat);
  VCAudioStructs_PrintFrameFormat((uint64_t)"relay format:  ", (uint64_t *)&self->_relayFormat);
}

- (const)micContext
{
  return &self->_micContext;
}

- (const)speakerContext
{
  return &self->_speakerContext;
}

- (const)clientFormat
{
  return &self->_clientFormat;
}

- (void)setClientFormat:(const tagVCAudioFrameFormat *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  unsigned int mSampleRate;

  -[VCObject lock](self, "lock");
  if (a3 && !self->_isRunning)
  {
    v6 = *(_OWORD *)&a3->format.mBytesPerPacket;
    v5 = *(_OWORD *)&a3->format.mBitsPerChannel;
    *(_OWORD *)&self->_clientFormat.format.mSampleRate = *(_OWORD *)&a3->format.mSampleRate;
    *(_OWORD *)&self->_clientFormat.format.mBytesPerPacket = v6;
    *(_OWORD *)&self->_clientFormat.format.mBitsPerChannel = v5;
    v7 = *(_OWORD *)&a3->format.mSampleRate;
    v8 = *(_OWORD *)&a3->format.mBitsPerChannel;
    *(_OWORD *)&self->_relayFormat.format.mBytesPerPacket = *(_OWORD *)&a3->format.mBytesPerPacket;
    *(_OWORD *)&self->_relayFormat.format.mBitsPerChannel = v8;
    *(_OWORD *)&self->_relayFormat.format.mSampleRate = v7;
    mSampleRate = a3->format.mSampleRate;
    self->_micContext.timeInfo.clientSampleRate = mSampleRate;
    self->_micContext.timeInfo.controllerSampleRate = mSampleRate;
    self->_speakerContext.timeInfo.clientSampleRate = mSampleRate;
    self->_speakerContext.timeInfo.controllerSampleRate = mSampleRate;
  }
  -[VCObject unlock](self, "unlock");
}

- (const)relayFormat
{
  return &self->_relayFormat;
}

- (void)micCallback
{
  return self->_micContext.callback;
}

- (void)setMicCallback:(void *)a3
{
  self->_micContext.callback = a3;
}

- (void)micCallbackContext
{
  return self->_micContext.callbackContext;
}

- (void)setMicCallbackContext:(void *)a3
{
  self->_micContext.callbackContext = a3;
}

- (void)speakerCallback
{
  return self->_speakerContext.callback;
}

- (void)setSpeakerCallback:(void *)a3
{
  self->_speakerContext.callback = a3;
}

- (void)speakerCallbackContext
{
  return self->_speakerContext.callbackContext;
}

- (void)setSpeakerCallbackContext:(void *)a3
{
  self->_speakerContext.callbackContext = a3;
}

- (double)preferredIODuration
{
  unint64_t v2;

  LODWORD(v2) = self->_clientFormat.samplesPerFrame;
  return (double)v2 / self->_clientFormat.format.mSampleRate;
}

- (void)internalPushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  tagVCAudioRelayIOContext *p_micContext;
  int Timestamp;
  double HostTime;
  int SampleCount;
  unsigned int v9;
  unsigned int samplesPerFrame;
  opaqueVCAudioBufferList *sampleBuffer;
  double v12;
  int v13;
  unsigned int v14;

  p_micContext = &self->_micContext;
  if (self->_micContext.callback)
  {
    Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
    HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
    SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
    v9 = VCAudioBufferList_GetSampleCount((uint64_t)p_micContext->sampleBuffer);
    if (v9
      || (samplesPerFrame = self->_clientFormat.samplesPerFrame, sampleBuffer = a3, SampleCount != samplesPerFrame))
    {
      VCAudioBufferList_Append((uint64_t)p_micContext->sampleBuffer, (uint64_t)a3, 0);
      sampleBuffer = p_micContext->sampleBuffer;
    }
    if (VCAudioBufferList_GetSampleCount((uint64_t)sampleBuffer) >= p_micContext->clientFormat->samplesPerFrame)
    {
      v12 = HostTime - (double)v9 / p_micContext->clientFormat->format.mSampleRate;
      v13 = VCAudioStructs_ClientTimestampForControllerTime(&p_micContext->timeInfo.clientSampleRate, Timestamp - v9, v12);
      v14 = VCAudioBufferList_GetSampleCount((uint64_t)sampleBuffer);
      VCAudioBufferList_SetTime((uint64_t)sampleBuffer, v13, v12);
      VCAudioBufferList_SetSampleCount((uint64_t)sampleBuffer, p_micContext->clientFormat->samplesPerFrame);
      ((void (*)(void *, opaqueVCAudioBufferList *))p_micContext->callback)(p_micContext->callbackContext, sampleBuffer);
      VCAudioBufferList_SetSampleCount((uint64_t)sampleBuffer, v14);
      if (sampleBuffer == p_micContext->sampleBuffer)
        VCAudioBufferList_Shift((uint64_t)sampleBuffer, p_micContext->clientFormat->samplesPerFrame);
    }
    VCAudioBufferList_SetTime((uint64_t)a3, Timestamp, HostTime);
  }
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  if (self->_packetThread)
  {
    if (!PacketThread_SendSampleBuffer((uint64_t)self->_packetThread, a3)
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioRelayIO pushAudioSamples:].cold.1();
    }
  }
  else
  {
    -[VCAudioRelayIO internalPushAudioSamples:](self, "internalPushAudioSamples:", a3);
  }
}

- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3
{
  tagVCAudioRelayIOContext *p_speakerContext;
  int Timestamp;
  double HostTime;
  unsigned int SampleCount;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  double *p_mSampleRate;
  opaqueVCAudioBufferList *sampleBuffer;
  double v13;
  int v14;
  unsigned int v15;

  p_speakerContext = &self->_speakerContext;
  if (self->_speakerContext.callback)
  {
    Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
    HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
    SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
    v8 = VCAudioBufferList_GetSampleCount((uint64_t)p_speakerContext->sampleBuffer);
    v9 = v8;
    if (SampleCount >= v8)
      v10 = v8;
    else
      v10 = SampleCount;
    VCAudioBufferList_SetSampleCount((uint64_t)a3, 0);
    if (v10)
    {
      VCAudioBufferList_Append((uint64_t)a3, (uint64_t)p_speakerContext->sampleBuffer, 0);
      VCAudioBufferList_Shift((uint64_t)p_speakerContext->sampleBuffer, v10);
      if (SampleCount > v9)
      {
        p_mSampleRate = &p_speakerContext->clientFormat->format.mSampleRate;
LABEL_11:
        sampleBuffer = p_speakerContext->sampleBuffer;
LABEL_12:
        v13 = HostTime + (double)v10 / *p_mSampleRate;
        v14 = VCAudioStructs_ClientTimestampForControllerTime(&p_speakerContext->timeInfo.clientSampleRate, v10 + Timestamp, v13);
        VCAudioBufferList_SetTime((uint64_t)sampleBuffer, v14, v13);
        VCAudioBufferList_SetSampleCount((uint64_t)sampleBuffer, p_speakerContext->clientFormat->samplesPerFrame);
        ((void (*)(void *, opaqueVCAudioBufferList *))p_speakerContext->callback)(p_speakerContext->callbackContext, sampleBuffer);
        if (sampleBuffer == p_speakerContext->sampleBuffer)
        {
          v15 = VCAudioBufferList_Append((uint64_t)a3, (uint64_t)sampleBuffer, 0);
          VCAudioBufferList_Shift((uint64_t)p_speakerContext->sampleBuffer, v15);
        }
      }
    }
    else if (SampleCount)
    {
      p_mSampleRate = &p_speakerContext->clientFormat->format.mSampleRate;
      sampleBuffer = a3;
      if (p_speakerContext->clientFormat->samplesPerFrame == p_speakerContext->relayFormat->samplesPerFrame)
        goto LABEL_12;
      goto LABEL_11;
    }
    VCAudioBufferList_SetTime((uint64_t)a3, Timestamp, HostTime);
  }
}

- (BOOL)createPacketThreadWithIOBufferDuration:(double)a3 name:(id)a4 error:(id *)a5
{
  BOOL v9;
  int SerializedSize;
  uint64_t v11;
  PacketThread_s *v12;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  -[VCObject lock](self, "lock");
  self->_relayFormat.samplesPerFrame = vcvtad_u64_f64(self->_relayFormat.format.mSampleRate * a3);
  v9 = 1;
  self->_micContext.timeInfo.didHostTimeReferenceChange = 1;
  self->_speakerContext.timeInfo.didHostTimeReferenceChange = 1;
  -[VCAudioRelayIO createAudioBuffers](self, "createAudioBuffers");
  if (!self->_usePacketThread)
    goto LABEL_4;
  SerializedSize = VCAudioBufferList_GetSerializedSize((unsigned int *)self->_micBuffer);
  v11 = objc_msgSend(a4, "UTF8String");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__VCAudioRelayIO_createPacketThreadWithIOBufferDuration_name_error___block_invoke;
  v14[3] = &unk_1E9E53E68;
  v14[4] = self;
  v12 = (PacketThread_s *)PacketThread_Create(SerializedSize, 0, 0x10u, 19, v11, v14);
  self->_packetThread = v12;
  if (v12)
  {
    PacketThread_ReceiverIsReady((uint64_t)v12);
LABEL_4:
    self->_isRunning = 1;
    goto LABEL_9;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioRelayIO createPacketThreadWithIOBufferDuration:name:error:].cold.1();
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32005, 0, 0, CFSTR("createPacketThreadWithIOBufferDuration failed"), CFSTR("PacketThread_Create failed"));
  v9 = 0;
LABEL_9:
  -[VCObject unlock](self, "unlock");
  return v9;
}

uint64_t __68__VCAudioRelayIO_createPacketThreadWithIOBufferDuration_name_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "internalPushAudioSamples:", a2);
}

- (void)destroyPacketThread
{
  int *packetThread;

  packetThread = (int *)self->_packetThread;
  if (packetThread)
  {
    PacketThread_Destroy(packetThread);
    self->_packetThread = 0;
  }
  self->_isRunning = 0;
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  void (*updateRemoteCodecInfoCallback)(void *, const _VCRemoteCodecInfo *);
  uint64_t v5;
  NSObject *v6;

  updateRemoteCodecInfoCallback = (void (*)(void *, const _VCRemoteCodecInfo *))self->_updateRemoteCodecInfoCallback;
  if (updateRemoteCodecInfoCallback)
  {
    updateRemoteCodecInfoCallback(self->_updateRemoteCodecInfoContext, a3);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioRelayIO didUpdateBasebandCodec:].cold.1(v5, (uint64_t)a3, v6);
  }
}

- (opaqueVCAudioBufferList)micBuffer
{
  return self->_micBuffer;
}

- (unsigned)micTimestamp
{
  return self->_micTimestamp;
}

- (void)setMicTimestamp:(unsigned int)a3
{
  self->_micTimestamp = a3;
}

- (float)micPowerRMS
{
  return self->_micPowerRMS;
}

- (void)setMicPowerRMS:(float)a3
{
  self->_micPowerRMS = a3;
}

- (opaqueVCAudioBufferList)speakerBuffer
{
  return self->_speakerBuffer;
}

- (unsigned)speakerTimestamp
{
  return self->_speakerTimestamp;
}

- (void)setSpeakerTimestamp:(unsigned int)a3
{
  self->_speakerTimestamp = a3;
}

- (float)speakerPowerRMS
{
  return self->_speakerPowerRMS;
}

- (void)setSpeakerPowerRMS:(float)a3
{
  self->_speakerPowerRMS = a3;
}

- (id)startCompletionHandler
{
  return objc_getProperty(self, a2, 520, 1);
}

- (void)setStartCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 520);
}

- (BOOL)usePacketThread
{
  return self->_usePacketThread;
}

- (void)setUsePacketThread:(BOOL)a3
{
  self->_usePacketThread = a3;
}

- (PacketThread_s)packetThread
{
  return self->_packetThread;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)updateRemoteCodecInfoCallback
{
  return self->_updateRemoteCodecInfoCallback;
}

- (void)setUpdateRemoteCodecInfoCallback:(void *)a3
{
  self->_updateRemoteCodecInfoCallback = a3;
}

- (void)updateRemoteCodecInfoContext
{
  return self->_updateRemoteCodecInfoContext;
}

- (void)setUpdateRemoteCodecInfoContext:(void *)a3
{
  self->_updateRemoteCodecInfoContext = a3;
}

- (void)pushAudioSamples:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d forwardSamplesFromIO: PacketThread_SendSampleBuffer failed", v2, v3, v4, v5, 2u);
}

- (void)createPacketThreadWithIOBufferDuration:name:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d createPacketThreadWithIOBufferDuration: PacketThread_Create failed", v2, v3, v4, v5, 2u);
}

- (void)didUpdateBasebandCodec:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = FourccToCStr(*(_DWORD *)a2);
  v7 = *(_QWORD *)(a2 + 8);
  v8 = 136316162;
  v9 = a1;
  v10 = 2080;
  v11 = "-[VCAudioRelayIO didUpdateBasebandCodec:]";
  v12 = 1024;
  v13 = 463;
  v14 = 2080;
  v15 = v6;
  v16 = 2048;
  v17 = v7;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Callback function not registered. CodecType[%s] SampleRate[%f]", (uint8_t *)&v8, 0x30u);
}

@end
