@implementation BWAudioSourceNode

- (OpaqueCMClock)clock
{
  return self->_clock;
}

- (BOOL)didBeginInterruption
{
  return self->_didBeginInterruption;
}

- (uint64_t)_generatePullBuffers
{
  const void *v2;
  const AudioStreamBasicDescription *StreamBasicDescription;
  unsigned int v4;
  int32_t v5;
  const __CFAllocator *v6;
  uint64_t v7;
  AudioFormatFlags mFormatFlags;
  unsigned int mChannelsPerFrame;
  unsigned int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  int outData;
  UInt32 ioDataSize;

  if (!a1)
    return 0;
  outData = 4096;
  TimestampedAudioBufferListQueueReleaseAndClear((CFTypeRef *)(a1 + 288));
  TimestampedAudioBufferListQueueReleaseAndClear((CFTypeRef *)(a1 + 296));
  v2 = *(const void **)(a1 + 280);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 280) = 0;
  }
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)(a1 + 248));
  if (StreamBasicDescription->mSampleRate <= 0.0)
  {
    v4 = 0;
  }
  else
  {
    v4 = *(_DWORD *)(a1 + 256);
    if (v4)
      v4 = (StreamBasicDescription->mSampleRate / (double)v4);
  }
  if (v4 <= 5)
    v5 = 5;
  else
    v5 = v4;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v7 = CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, (CMSimpleQueueRef *)(a1 + 288));
  if ((_DWORD)v7)
    return v7;
  v7 = CMSimpleQueueCreate(v6, v5, (CMSimpleQueueRef *)(a1 + 296));
  if ((_DWORD)v7)
    return v7;
  v7 = CMSimpleQueueCreate(v6, v5, (CMSimpleQueueRef *)(a1 + 280));
  if ((_DWORD)v7)
    return v7;
  ioDataSize = 4;
  AudioUnitGetProperty(*(AudioUnit *)(a1 + 264), 0xEu, 0, 0, &outData, &ioDataSize);
  mFormatFlags = StreamBasicDescription->mFormatFlags;
  if ((mFormatFlags & 0x20) != 0)
    mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
  else
    mChannelsPerFrame = 1;
  if ((mFormatFlags & 0x20) != 0)
    v10 = 1;
  else
    v10 = StreamBasicDescription->mChannelsPerFrame;
  while (1)
  {
    v11 = TimestampedAudioBufferListNew(v6, mChannelsPerFrame, v10, StreamBasicDescription->mBytesPerFrame * outData);
    v12 = CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(a1 + 288), v11);
    if ((_DWORD)v12)
      break;
    if (!--v5)
    {
      v13 = 0;
      *(_QWORD *)(a1 + 304) = 0;
      v14 = *MEMORY[0x1E0CA2E18];
      v15 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      *(_QWORD *)(a1 + 328) = v15;
      *(_OWORD *)(a1 + 312) = v14;
      *(_OWORD *)(a1 + 360) = v14;
      *(_QWORD *)(a1 + 376) = v15;
      return v13;
    }
  }
  v13 = v12;
  TimestampedAudioBufferListDispose((const __CFAllocator **)v11);
  return v13;
}

- (id)nodeSubType
{
  return CFSTR("AudioDevice");
}

void *__27__BWAudioSourceNode_start___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *result;

  for (i = 0; i != 24; i += 8)
  {
    result = *(void **)(*(_QWORD *)(a1 + 32) + 96 + i);
    if (result)
    {
      result = (void *)objc_msgSend(result, "liveFormat");
      if (!result)
        result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96 + i), "makeConfiguredFormatLive");
    }
  }
  return result;
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BWAudioSourceNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v2, sel_prepareForCurrentConfigurationToBecomeLive);
}

- (uint64_t)_audioCombinedLatency
{
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  int v5;
  int v6;
  UInt32 ioDataSize;
  AudioObjectPropertyAddress inAddress;
  AudioObjectID outData;

  if (result)
  {
    v1 = result;
    outData = 0;
    v5 = 0;
    v6 = 0;
    if (FigCaptureAudiomxdSupportEnabled())
    {
      objc_msgSend(*(id *)(v1 + 128), "sampleRate");
      v3 = v2;
      objc_msgSend(*(id *)(v1 + 128), "inputLatency");
      return (v3 * v4 + 0.5);
    }
    result = *(unsigned int *)(v1 + 240);
    if ((_DWORD)result)
    {
      *(_QWORD *)&inAddress.mSelector = 0x696E707473746D23;
      inAddress.mElement = 0;
      ioDataSize = 4;
      if (AudioObjectGetPropertyData(result, &inAddress, 0, 0, &ioDataSize, &outData)
        || (*(_QWORD *)&inAddress.mSelector = 0x676C6F626C746E63,
            inAddress.mElement = 0,
            ioDataSize = 4,
            !AudioObjectGetPropertyData(outData, &inAddress, 0, 0, &ioDataSize, &v6)))
      {
        *(_QWORD *)&inAddress.mSelector = 0x696E70746C746E63;
        inAddress.mElement = 0;
        ioDataSize = 4;
        if (!AudioObjectGetPropertyData(*(_DWORD *)(v1 + 240), &inAddress, 0, 0, &ioDataSize, &v5))
          return (v5 + v6);
        FigDebugAssert3();
      }
      return 0;
    }
  }
  return result;
}

- (void)setVideoRecordingEnabled:(BOOL)a3
{
  self->_videoRecordingEnabled = a3;
}

- (void)setLivePhotoCaptureEnabled:(BOOL)a3
{
  self->_livePhotoCaptureEnabled = a3;
}

- (void)setLevelMeteringEnabled:(BOOL)a3
{
  _BOOL4 inData;

  self->_levelMeteringEnabled = a3;
  inData = a3;
  if (AudioUnitSetProperty(self->_audioUnit, 0x766u, 1u, 1u, &inData, 4u))
    self->_levelMeteringEnabled = 0;
}

- (void)setAudioCaptureMode:(int)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  self->_audioCaptureMode = a3;
  if (a3 == 5)
  {
    self->_silenceFramesFillingDisabled = 1;
    if (dword_1ECFE96B0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (id)outputForMicSourcePosition:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return self->_outputsByMicSourcePosition[a3];
}

- (int)audioCaptureMode
{
  return self->_audioCaptureMode;
}

- (uint64_t)_configureAudioSessionWithDefaultHardwareSampleRate:(double)a3 didCallDoNotNotifyOtherSessionsOnNextInactive:
{
  _DWORD *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  int v15;
  NSObject *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD block[5];
  _BOOL4 v22;
  int v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v24 = 0;
  v7 = *(unsigned __int8 *)(a1 + 152);
  -[BWAudioSourceNode _deactivateAudioSessionIfNecessary:](a1, a2);
  if (-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E0D494F8], (uint64_t)CFSTR("PlayAndRecord"))|| -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E0D49528], *(_QWORD *)(a1 + 136)))
  {
    goto LABEL_38;
  }
  if (!v7)
  {
    if (-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E0D495B0], (uint64_t)CFSTR("Speaker")))goto LABEL_38;
LABEL_11:
    objc_msgSend(*(id *)(a1 + 128), "setPreferredOutputSampleRate:error:", &v24, a3);
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 128), "preferDecoupledIO:error:", 1, &v24);
  v8 = objc_msgSend(v24, "code");
  if (-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E0D495B0], (uint64_t)CFSTR("Speaker")))goto LABEL_38;
  if (v8)
    goto LABEL_11;
  objc_msgSend(*(id *)(a1 + 128), "setPreferredInputSampleRate:error:", &v24, a3);
LABEL_12:
  objc_msgSend(v24, "code");
  if (*(_BYTE *)(a1 + 169))
    v9 = 2;
  else
    v9 = 1048578;
  objc_msgSend(*(id *)(a1 + 128), "setAudioHardwareControlFlags:error:", v9, &v24);
  if (!objc_msgSend(v24, "code"))
  {
    if (!*(_BYTE *)(a1 + 169)
      || (v10 = (void *)objc_msgSend(MEMORY[0x1E0D48560], "sharedInstance"),
          v11 = objc_msgSend((id)objc_msgSend((id)a1, "graph"), "clientApplicationID"),
          objc_msgSend(v10, "setAttribute:forKey:error:", v11, *MEMORY[0x1E0D47E80], &v24),
          !objc_msgSend(v24, "code"))
      && (objc_msgSend(*(id *)(a1 + 128), "setPreferredIOBufferFrameSize:error:", (unint64_t)(a3 * 0.01), &v24),
          !objc_msgSend(v24, "code"))
      && !-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E0D49B80], MEMORY[0x1E0C9AAB0]))
    {
      if ((v12 = (void *)objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController"),
            v13 = objc_msgSend((id)objc_msgSend(v12, "attributeForKey:", *MEMORY[0x1E0D48090]), "count"),
            !*(_BYTE *)(a1 + 536))
        && (!*(_BYTE *)(a1 + 174) || v13)
        || !-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E0D49878], (uint64_t)&unk_1E49FB2E0))
      {
        if (!-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E0D49858], 0))
        {
          if (BWAudioCaptureModeIsSpatial(*(_DWORD *)(a1 + 540)))
          {
            v14 = *(_QWORD *)(a1 + 112) == 0;
            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 596));
            v15 = *(_DWORD *)(a1 + 592);
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 596));
            v16 = *(NSObject **)(a1 + 560);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __119__BWAudioSourceNode__configureAudioSessionWithDefaultHardwareSampleRate_didCallDoNotNotifyOtherSessionsOnNextInactive___block_invoke;
            block[3] = &unk_1E491F158;
            block[4] = a1;
            v22 = v14;
            v23 = v15;
            dispatch_async(v16, block);
            goto LABEL_35;
          }
          if (!FigCFEqual() || *(_BYTE *)(a1 + 169))
            goto LABEL_35;
          v17 = *(_QWORD *)(a1 + 96) != 0;
          if (*(_QWORD *)(a1 + 104))
            v17 |= 2u;
          v18 = *(_QWORD *)(a1 + 112) ? v17 | 4 : v17;
          v25[0] = CFSTR("camera mics");
          v26[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18);
          v25[1] = CFSTR("camera wind suppression");
          v26[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned __int8 *)(a1 + 544));
          v25[2] = CFSTR("camera real time dynamics");
          v26[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_BYTE *)(a1 + 545) == 0);
          v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
          if (!-[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E0D49598], v19))goto LABEL_35;
        }
      }
    }
  }
LABEL_38:
  FigDebugAssert3();
LABEL_35:
  if (*v6 == 1)
    kdebug_trace();
  return 0;
}

- (uint64_t)_setAudioSessionMXPropertyWithKey:(uint64_t)a3 value:
{
  _DWORD *v6;
  uint64_t v7;
  id v9;

  if (!a1)
    return 0;
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (FigCaptureAudiomxdSupportEnabled())
  {
    v9 = 0;
    objc_msgSend(*(id *)(a1 + 128), "setMXSessionProperty:value:error:", a2, a3, &v9);
    v7 = objc_msgSend(v9, "code");
  }
  else
  {
    v7 = -[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1);
  }
  if (*v6 == 1)
    kdebug_trace();
  return v7;
}

- (uint64_t)_deactivateAudioSessionIfNecessary:(uint64_t)a1
{
  void *v4;
  uint64_t v6;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 128), "isActive"))
    {
      v4 = (void *)objc_msgSend(*(id *)(a1 + 128), "category");
      if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CFEFB8]) & 1) == 0)
      {
        if (!*(_BYTE *)(a1 + 171))
        {
          -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](a1, *MEMORY[0x1E0D49748], MEMORY[0x1E0C9AAB0]);
          *a2 = 1;
        }
        v6 = 0;
        objc_msgSend(*(id *)(a1 + 128), "setActive:error:", 0, &v6);
      }
    }
  }
  return 0;
}

- (void)_generateSamples
{
  const AudioStreamBasicDescription *StreamBasicDescription;
  AudioFormatFlags mFormatFlags;
  uint64_t v4;
  char *v5;
  char *v6;
  _OWORD *v7;
  int64_t v8;
  uint64_t v9;
  int v10;
  uint64_t i;
  CMSampleBufferRef v12;
  CMSampleBufferRef v13;
  NSObject *v14;
  dispatch_time_t v15;
  void *context;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime lhs;
  CMTime rhs;
  CMTime v22;

  if (a1 && !*(_BYTE *)(a1 + 402))
  {
    context = (void *)MEMORY[0x1A858DD40]();
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)(a1 + 248));
    mFormatFlags = StreamBasicDescription->mFormatFlags;
    v4 = *(_QWORD *)(a1 + 448);
    *(_QWORD *)(a1 + 448) = 0;
    while (CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(a1 + 280)))
      ;
    v5 = (char *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(a1 + 296));
    if (v5)
    {
      v6 = v5;
      do
      {
        v7 = v6 + 24;
        v22 = *(CMTime *)(v6 + 1);
        v8 = *((unsigned int *)v6 + 14);
        if ((_DWORD)v8)
        {
          CMTimeMake(&rhs, v8, (int)StreamBasicDescription->mSampleRate);
          *(_OWORD *)&lhs.value = *v7;
          lhs.epoch = *((_QWORD *)v6 + 5);
          CMTimeAdd(&v22, &lhs, &rhs);
        }
        if (v4)
        {
          v9 = *((unsigned int *)v6 + 14);
          if ((_DWORD)v9)
          {
            v10 = (v9 - v4) & ~((v9 - v4) >> 63);
            *((_DWORD *)v6 + 14) = v10;
            CMTimeMake(&v19, (v9 - v10), (int)StreamBasicDescription->mSampleRate);
            *(_OWORD *)&v18.value = *v7;
            v18.epoch = *((_QWORD *)v6 + 5);
            CMTimeAdd(&lhs, &v18, &v19);
            *v7 = *(_OWORD *)&lhs.value;
            *((_QWORD *)v6 + 5) = lhs.epoch;
          }
        }
        if ((mFormatFlags & 0x20) != 0 && *(_DWORD *)(a1 + 540) == 6)
        {
          for (i = 0; i != 3; ++i)
          {
            if (*(_QWORD *)(a1 + 96 + 8 * i))
            {
              v12 = -[BWAudioSourceNode _createSampleBufferForTimestampedAudioBufferList:audioBufferIndex:]((CMSampleBufferRef)a1, (uint64_t)v6, i);
              objc_msgSend(*(id *)(a1 + 96 + 8 * i), "emitSampleBuffer:", v12);
              if (v12)
                CFRelease(v12);
            }
          }
        }
        else
        {
          v13 = -[BWAudioSourceNode _createSampleBufferForTimestampedAudioBufferList:audioBufferIndex:]((CMSampleBufferRef)a1, (uint64_t)v6, 0);
          objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", v13, context);
          if (v13)
            CFRelease(v13);
        }
        *(_QWORD *)(a1 + 464) = *((_QWORD *)v6 + 1);
        CMTimeMake(&v17, *((unsigned int *)v6 + 5), (int)StreamBasicDescription->mSampleRate);
        v18 = v22;
        CMTimeAdd(&lhs, &v18, &v17);
        *(CMTime *)(a1 + 480) = lhs;
        v14 = *(NSObject **)(a1 + 432);
        v15 = dispatch_time(0, (uint64_t)((double)(2 * *((_DWORD *)v6 + 5))/ StreamBasicDescription->mSampleRate* 1000000000.0));
        dispatch_source_set_timer(v14, v15, 0xFFFFFFFFFFFFFFFFLL, 0);
        TimestampedAudioBufferListReset((uint64_t)v6);
        CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(a1 + 288), v6);
        v6 = (char *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(a1 + 296));
        v4 = 0;
      }
      while (v6);
    }
    objc_autoreleasePoolPop(context);
  }
}

- (CMSampleBufferRef)_createSampleBufferForTimestampedAudioBufferList:(int)a3 audioBufferIndex:
{
  CMTime *v5;
  const opaqueCMFormatDescription *v6;
  const AudioStreamBasicDescription *StreamBasicDescription;
  const AudioStreamBasicDescription *v8;
  UInt32 mBytesPerFrame;
  size_t v10;
  size_t v11;
  UInt32 mChannelsPerFrame;
  int v13;
  const __CFAllocator *v14;
  OSStatus DataPointer;
  char v16;
  size_t v17;
  size_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  size_t v24;
  size_t v25;
  size_t v26;
  uint64_t v27;
  char *v28;
  const size_t *sampleSizeArray;
  OSStatus v30;
  const opaqueCMFormatDescription *formatDescription;
  CMTime *v32;
  CMTime rhs;
  CMTime lhs;
  CMTime v35;
  uint64_t mBytesPerPacket;
  CMSampleTimingInfo v37;
  char *dataPointerOut;
  CMSampleBufferRef v39;
  CMBlockBufferRef blockBufferOut;

  if (result)
  {
    v5 = (CMTime *)result;
    v6 = (const opaqueCMFormatDescription *)objc_msgSend((id)objc_msgSend(*((id *)result + 2), "format"), "formatDescription");
    StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(v6);
    v8 = StreamBasicDescription;
    mBytesPerFrame = StreamBasicDescription->mBytesPerFrame;
    v10 = mBytesPerFrame * *(_DWORD *)(a2 + 56);
    v11 = *(_DWORD *)(a2 + 20) * mBytesPerFrame;
    if (StreamBasicDescription->mChannelsPerFrame >= 2
      && (StreamBasicDescription->mFormatFlags & 0x20) != 0
      && objc_msgSend((id)-[CMTime outputs](v5, "outputs"), "count") == 1)
    {
      mChannelsPerFrame = v8->mChannelsPerFrame;
      v10 = mChannelsPerFrame * (unint64_t)v10;
      v11 = mChannelsPerFrame * (unint64_t)v11;
      v13 = 1;
    }
    else
    {
      v13 = 0;
    }
    v39 = 0;
    blockBufferOut = 0;
    dataPointerOut = 0;
    memset(&v37, 0, sizeof(v37));
    mBytesPerPacket = 0;
    v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    DataPointer = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v11 + v10, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, v11 + v10, 1u, &blockBufferOut);
    if (!DataPointer)
    {
      DataPointer = CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, 0, &dataPointerOut);
      if (!DataPointer)
      {
        v32 = v5;
        if (v10)
          v16 = v13;
        else
          v16 = 1;
        if ((v16 & 1) == 0)
          bzero(dataPointerOut, v10);
        formatDescription = v6;
        if (v11)
        {
          if (BYTE3(v5[22].epoch) && v8->mChannelsPerFrame == 2 && (v8->mFormatFlags & 0x20) == 0)
          {
            v17 = 0;
            v18 = (unint64_t)v8->mBytesPerFrame >> 1;
            v19 = *(char **)(*(_QWORD *)(a2 + 48) + 16 * a3 + 16);
            v20 = &dataPointerOut[v10];
            do
            {
              memcpy(&v20[v18], v19, v18);
              memcpy(v20, &v19[v18], v18);
              v21 = v8->mBytesPerFrame;
              v19 += v21;
              v20 += v21;
              v17 += v21;
            }
            while (v17 < v11);
          }
          else if (v13)
          {
            if (**(_DWORD **)(a2 + 48))
            {
              v22 = 0;
              v23 = v8->mChannelsPerFrame;
              v24 = v10 / v23;
              v25 = v11 / v23;
              v26 = v25 + v10 / v23;
              v27 = 16;
              do
              {
                v28 = &dataPointerOut[v26 * v22];
                bzero(v28, v24);
                memcpy(&v28[v24], *(const void **)(*(_QWORD *)(a2 + 48) + v27), v25);
                ++v22;
                v27 += 16;
              }
              while (v22 < **(unsigned int **)(a2 + 48));
            }
          }
          else
          {
            memcpy(&dataPointerOut[v10], *(const void **)(*(_QWORD *)(a2 + 48) + 16 * a3 + 16), v11);
          }
        }
        mBytesPerPacket = v8->mBytesPerPacket;
        if (v13)
          sampleSizeArray = 0;
        else
          sampleSizeArray = (const size_t *)&mBytesPerPacket;
        CMTimeMake(&v37.duration, 1, (int)v8->mSampleRate);
        lhs = *(CMTime *)(a2 + 24);
        rhs = v32[17];
        CMTimeSubtract(&v35, &lhs, &rhs);
        v37.presentationTimeStamp = v35;
        v37.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
        DataPointer = CMSampleBufferCreate(v14, blockBufferOut, 1u, 0, 0, formatDescription, (*(_DWORD *)(a2 + 56) + *(_DWORD *)(a2 + 20)), 1, &v37, v13 ^ 1u, sampleSizeArray, &v39);
      }
    }
    v30 = DataPointer;
    if (blockBufferOut)
      CFRelease(blockBufferOut);
    result = v39;
    if (v30)
    {
      if (v39)
      {
        CFRelease(v39);
        return 0;
      }
    }
  }
  return result;
}

- (BOOL)start:(id *)a3
{
  uint64_t v3;
  _DWORD *v6;
  BOOL streamStarted;
  int v9;
  NSString *clientAudioClockDeviceUID;
  AVAudioSession *audioSession;
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  const __CFString *v17;
  int v18;
  int updated;
  NSObject *generateSamplesDispatchQueue;
  uint64_t v21;
  int v22;
  OS_dispatch_source *v23;
  const AudioStreamBasicDescription *StreamBasicDescription;
  uint64_t v25;
  int64_t v26;
  CMClockRef HostTimeClock;
  CMTimeEpoch epoch;
  int32_t mSampleRate;
  NSObject *silenceTimer;
  dispatch_time_t v31;
  OSStatus v32;
  uint64_t v33;
  NSObject *zoomHandlerQueue;
  AVAudioSession *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[5];
  CMTime v39;
  CMTime time;
  CMTime v41;
  _QWORD handler[5];
  _QWORD block[5];
  AudioDeviceID deviceIDOut;
  char v45;
  _QWORD v46[2];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v45 = 0;
  streamStarted = self->_streamStarted;
  if (self->_streamStarted)
    goto LABEL_4;
  deviceIDOut = 0;
  if (CMAudioDeviceClockGetAudioDevice(self->_clock, 0, &deviceIDOut, 0))
    self->_audioDeviceID = deviceIDOut;
  if (FigCaptureAudiomxdSupportEnabled() && self->_audioSessionIsProxy)
  {
    v12 = -12782;
    v16 = 1;
    goto LABEL_54;
  }
  v9 = FigCaptureAudiomxdSupportEnabled();
  if (self->_configuresSession)
  {
    if (self->_audioSession)
    {
      -[BWAudioSourceNode _setAudioSessionAudioModeAndSelectMic:]((uint64_t)self, &v45);
    }
    else if (self->_CMSession)
    {
      -[BWAudioSourceNode _setCMSessionAudioModeAndSelectMic:]((uint64_t)self, &v45);
    }
  }
  if (!self->_audioSession && !self->_CMSession)
    goto LABEL_33;
  clientAudioClockDeviceUID = self->_clientAudioClockDeviceUID;
  if (clientAudioClockDeviceUID)
    -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D49510], (uint64_t)clientAudioClockDeviceUID);
  if ((-[BWAudioSourceNode _audioSessionMXBooleanPropertyIsTrue:]((uint64_t)self, *MEMORY[0x1E0D49880]) & 1) != 0)
    goto LABEL_32;
  audioSession = self->_audioSession;
  if (audioSession)
  {
    v41.value = 0;
    -[AVAudioSession setActive:error:](audioSession, "setActive:error:", 1, &v41);
    v12 = objc_msgSend((id)v41.value, "code");
    if (!v12 && !self->_isConfiguredForContinuityCapture)
    {
      v46[0] = CFSTR("camera wind suppression");
      v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_windNoiseRemovalEnabled);
      v46[1] = CFSTR("camera real time dynamics");
      v47[0] = v13;
      v47[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", !self->_cinematicVideoCaptureEnabled);
      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
      if (objc_msgSend(v14, "count"))
      {
        v15 = -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D49598], (uint64_t)v14);
        if (v15)
        {
          v37 = v3;
          LODWORD(v36) = v15;
          v12 = v15;
          FigDebugAssert3();
          v16 = 1;
LABEL_72:
          v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
          goto LABEL_54;
        }
      }
    }
LABEL_30:
    if (v12)
    {
LABEL_71:
      v16 = 1;
      goto LABEL_72;
    }
    goto LABEL_31;
  }
  if (self->_CMSession)
  {
    v12 = CMSessionBeginInterruption();
    goto LABEL_30;
  }
LABEL_31:
  self->_didBeginInterruption = 1;
  self->_streamInterrupted = 0;
LABEL_32:
  -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D49750], MEMORY[0x1E0C9AAA0]);
  if ((FigCaptureAudiomxdSupportEnabled() & 1) != 0)
  {
LABEL_33:
    if ((v9 & 1) != 0)
      goto LABEL_41;
    v17 = CFSTR("VirtualAudioDevice_Default");
    goto LABEL_40;
  }
  v18 = -[BWAudioSourceNode _cmSessionBooleanPropertyIsTrue:]((uint64_t)self);
  if (v18)
    v17 = CFSTR("VirtualAudioDevice_DecoupledInput");
  else
    v17 = CFSTR("VirtualAudioDevice_Default");
  if ((v18 & 1) != 0 || ((v9 ^ 1) & 1) != 0)
LABEL_40:
    -[BWAudioSourceNode _updateAudioDeviceUID:]((uint64_t)self, v17);
LABEL_41:
  updated = -[BWAudioSourceNode _updatePullFormatDescription]((uint64_t)self);
  if (updated)
  {
    v12 = updated;
    goto LABEL_71;
  }
  generateSamplesDispatchQueue = self->_generateSamplesDispatchQueue;
  v21 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__BWAudioSourceNode_start___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(generateSamplesDispatchQueue, block);
  self->_auRenderCount = 0;
  self->_silenceFramesGeneratedSinceLastAURenderProc = 0;
  self->_currentSilenceBuffer.sampleTime = 0.0;
  *(_OWORD *)&self->_currentSilenceBuffer.pts.timescale = 0u;
  *(_OWORD *)&self->_currentSilenceBuffer.abl = 0u;
  *(_OWORD *)&self->_currentSilenceBuffer.allocator = 0u;
  *(_OWORD *)&self->_currentSilenceBuffer.dataBytesCapacity = 0u;
  TimestampedAudioBufferListQueueTransfer(self->_activeBuffersQueue, self->_inactiveBuffersQueue);
  if ((self->_audioSession || self->_CMSession) && !self->_isAppAudioSession)
  {
    v22 = -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D49908], MEMORY[0x1E0C9AAB0]);
    if (v22
      || (v22 = -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D49918], MEMORY[0x1E0C9AAB0])) != 0)
    {
      v12 = v22;
      v16 = 0;
      goto LABEL_69;
    }
  }
  v23 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_generateSamplesDispatchQueue);
  self->_silenceTimer = v23;
  if (!v23)
  {
    v16 = 0;
    v12 = -12780;
    goto LABEL_69;
  }
  handler[0] = v21;
  handler[1] = 3221225472;
  handler[2] = __27__BWAudioSourceNode_start___block_invoke_2;
  handler[3] = &unk_1E491E720;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v23, handler);
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(self->_auOutputFormatDescription);
  v25 = mach_absolute_time();
  v26 = AudioConvertHostTimeToNanos(v25);
  CMTimeMake(&time, v26, 1000000000);
  HostTimeClock = CMClockGetHostTimeClock();
  CMSyncConvertTime(&v41, &time, HostTimeClock, self->_clock);
  *(_OWORD *)&self->_currentSilenceBuffer.pts.value = *(_OWORD *)&v41.value;
  epoch = v41.epoch;
  self->_currentSilenceBuffer.pts.epoch = v41.epoch;
  mSampleRate = (int)StreamBasicDescription->mSampleRate;
  *(_OWORD *)&v39.value = *(_OWORD *)&self->_currentSilenceBuffer.pts.value;
  v39.epoch = epoch;
  CMTimeConvertScale(&v41, &v39, mSampleRate, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  self->_currentSilenceBuffer.pts = ($95D729B680665BEAEFA1D6FCA8238556)v41;
  silenceTimer = self->_silenceTimer;
  v31 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer(silenceTimer, v31, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_silenceTimer);
  v32 = AudioOutputUnitStart(self->_audioUnit);
  if (!v32)
  {
    self->_streamStarted = 1;
    zoomHandlerQueue = self->_zoomHandlerQueue;
    v38[0] = v21;
    v38[1] = 3221225472;
    v38[2] = __27__BWAudioSourceNode_start___block_invoke_3;
    v38[3] = &unk_1E491E720;
    v38[4] = self;
    dispatch_sync(zoomHandlerQueue, v38);
    streamStarted = 1;
    v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    goto LABEL_5;
  }
  v12 = v32;
  if (!self->_audioSession && !self->_CMSession)
  {
    v16 = 0;
LABEL_69:
    v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    goto LABEL_54;
  }
  if (!self->_isAppAudioSession)
  {
    v33 = MEMORY[0x1E0C9AAA0];
    -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D49908], MEMORY[0x1E0C9AAA0]);
    -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D49918], v33);
  }
  v16 = 0;
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_54:
  AudioUnitUninitialize(self->_audioUnit);
  if (self->_didBeginInterruption)
  {
    self->_didBeginInterruption = 0;
  }
  else
  {
    if (!v45)
      goto LABEL_63;
    -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D49748], MEMORY[0x1E0C9AAA0]);
  }
  v35 = self->_audioSession;
  if (v35)
  {
    v41.value = 0;
    -[AVAudioSession setActive:error:](v35, "setActive:error:", 0, &v41);
  }
  else if (self->_CMSession)
  {
    CMSessionEndInterruption();
  }
LABEL_63:
  if (a3)
  {
    *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v12, 0);
    if ((v16 & 1) == 0)
      goto LABEL_67;
LABEL_4:
    -[BWAudioSourceNode makeOutputsLiveIfNeeded](self, "makeOutputsLiveIfNeeded", v36, v37);
    goto LABEL_5;
  }
  if (v16)
    goto LABEL_4;
LABEL_67:
  streamStarted = 0;
LABEL_5:
  if (*v6 == 1)
    kdebug_trace();
  return streamStarted;
}

- (uint64_t)_setupAudioUnit
{
  _DWORD *v2;
  OSType v3;
  OpaqueAudioComponent *Next;
  uint64_t Property;
  void *v6;
  int PrimaryAudioSessionIDForAuditToken;
  UInt32 v8;
  void *v9;
  Float64 v10;
  double v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  const void *v17;
  uint64_t i;
  uint64_t v19;
  _QWORD v21[5];
  UInt32 ioDataSize;
  int v23;
  int inData;
  AudioComponentDescription inDesc;
  uint64_t (*v26)(uint64_t, AudioUnitRenderActionFlags *, const AudioTimeStamp *, uint64_t, UInt32);
  uint64_t v27;
  AudioStreamBasicDescription asbd;
  AudioStreamBasicDescription outData;

  if (!a1)
    return 0;
  memset(&outData, 0, sizeof(outData));
  memset(&asbd, 0, sizeof(asbd));
  v26 = 0;
  v27 = 0;
  v2 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v3 = *(_DWORD *)(a1 + 272);
  inDesc.componentType = 1635086197;
  inDesc.componentSubType = v3;
  *(_QWORD *)&inDesc.componentManufacturer = 1634758764;
  inDesc.componentFlagsMask = 0;
  Next = AudioComponentFindNext(0, &inDesc);
  if (Next)
  {
    Property = AudioComponentInstanceNew(Next, (AudioComponentInstance *)(a1 + 264));
    if ((_DWORD)Property)
      goto LABEL_39;
    Property = AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 0x7D9u, 0, 0, (const void *)(a1 + 184), 0x20u);
    if ((_DWORD)Property)
      goto LABEL_39;
    if (*(_DWORD *)(a1 + 216))
    {
      v6 = *(void **)(a1 + 128);
      if (v6)
      {
        PrimaryAudioSessionIDForAuditToken = objc_msgSend(v6, "opaqueSessionID");
LABEL_12:
        inData = PrimaryAudioSessionIDForAuditToken;
        AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 0x7E7u, 0, 0, &inData, 4u);
        goto LABEL_13;
      }
      if (*(_BYTE *)(a1 + 172))
      {
        PrimaryAudioSessionIDForAuditToken = AudioSessionGetPrimaryAudioSessionIDForAuditToken();
        goto LABEL_12;
      }
    }
LABEL_13:
    v23 = 1;
    Property = AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 0x7D3u, 1u, 1u, &v23, 4u);
    if (!(_DWORD)Property)
    {
      v23 = 0;
      Property = AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 0x7D3u, 2u, 0, &v23, 4u);
      if (!(_DWORD)Property)
      {
        ioDataSize = 40;
        Property = AudioUnitGetProperty(*(AudioUnit *)(a1 + 264), 8u, 1u, 1u, &outData, &ioDataSize);
        if (!(_DWORD)Property)
        {
          asbd = outData;
          asbd.mFormatFlags = 12;
          if ((outData.mFormatFlags & 1) != 0)
          {
            asbd.mBitsPerChannel = 16;
            v8 = 2;
          }
          else
          {
            v8 = asbd.mBitsPerChannel >> 3;
          }
          asbd.mBytesPerFrame = v8 * asbd.mChannelsPerFrame;
          asbd.mBytesPerPacket = v8 * asbd.mChannelsPerFrame;
          v9 = *(void **)(a1 + 128);
          if (v9)
          {
            if (!*(_BYTE *)(a1 + 173))
            {
              objc_msgSend(v9, "sampleRate");
              asbd.mSampleRate = v10;
              goto LABEL_32;
            }
LABEL_24:
            v11 = fmax(*(double *)(a1 + 176), 0.0);
            if (*(_BYTE *)(a1 + 169))
              v11 = 48000.0;
            if (v11 == 0.0)
              v11 = 44100.0;
            asbd.mSampleRate = v11;
            if (v9)
            {
              v12 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", a1);
              v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
              v14 = *(_QWORD *)(a1 + 128);
              v15 = *MEMORY[0x1E0CFF188];
              v21[0] = MEMORY[0x1E0C809B0];
              v21[1] = 3221225472;
              v21[2] = __36__BWAudioSourceNode__setupAudioUnit__block_invoke;
              v21[3] = &unk_1E491EAC8;
              v21[4] = v12;
              objc_msgSend(v13, "addObserverForName:object:queue:usingBlock:", v15, v14, 0, v21);
            }
            else
            {
              CMNotificationCenterGetDefaultLocalCenter();
              FigNotificationCenterAddWeakListener();
            }
            goto LABEL_32;
          }
          if (*(_QWORD *)(a1 + 144))
          {
            if (*(_BYTE *)(a1 + 173))
              goto LABEL_24;
            v16 = -[BWAudioSourceNode _copyAudioSessionMXProperty:err:]((id *)a1, *MEMORY[0x1E0D49678], 0);
            asbd.mSampleRate = (double)objc_msgSend(v16, "longLongValue");

          }
LABEL_32:
          Property = AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 8u, 2u, 1u, &asbd, 0x28u);
          if (!(_DWORD)Property)
          {
            v17 = *(const void **)(a1 + 248);
            if (v17)
            {
              CFRelease(v17);
              *(_QWORD *)(a1 + 248) = 0;
            }
            Property = CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &asbd, 0, 0, 0, 0, 0, (CMAudioFormatDescriptionRef *)(a1 + 248));
            if (!(_DWORD)Property)
            {
              for (i = 0; i != 24; i += 8)
                objc_msgSend(*(id *)(a1 + 96 + i), "setFormat:", +[BWAudioFormat formatWithAudioFormatDescription:](BWAudioFormat, "formatWithAudioFormatDescription:", *(_QWORD *)(a1 + 248)));
              v26 = asn_audioUnitRenderProc;
              v27 = a1;
              Property = AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 0x7D5u, 0, 0, &v26, 0x10u);
            }
          }
        }
      }
    }
LABEL_39:
    v19 = Property;
    goto LABEL_40;
  }
  v19 = 4294954514;
LABEL_40:
  if (*v2 == 1)
    kdebug_trace();
  return v19;
}

- (uint64_t)_updatePullFormatDescription
{
  void *v2;
  double v3;
  double v4;
  uint64_t Pull;
  double v6;
  const AudioStreamBasicDescription *StreamBasicDescription;
  __int128 v8;
  __int128 v9;
  double v10;
  double v11;
  _BOOL4 v12;
  id *v13;
  UInt32 v14;
  uint64_t v15;
  _BOOL4 v16;
  int v17;
  int v18;
  const AudioChannelLayout *ChannelLayout;
  int v20;
  AudioChannelLayout *v21;
  const __CFAllocator *v22;
  const void *v23;
  CMAudioFormatDescriptionRef v24;
  AudioChannelLayout *v25;
  uint64_t i;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  CMAudioFormatDescriptionRef v31;
  UInt32 outDataSize;
  CMAudioFormatDescriptionRef formatDescriptionOut;
  AudioStreamBasicDescription cf;
  unsigned int v35;
  AudioStreamBasicDescription __s2;
  unsigned int PropertyInfo;

  if (!a1)
    return 0;
  PropertyInfo = 0;
  memset(&__s2, 0, sizeof(__s2));
  v35 = 0;
  v2 = *(void **)(a1 + 128);
  if (v2)
  {
    objc_msgSend(v2, "inputSampleRate");
    v4 = v3;
  }
  else
  {
    if (!*(_QWORD *)(a1 + 144))
    {
      v16 = 0;
      v10 = 0.0;
      v4 = 0.0;
      goto LABEL_38;
    }
    cf.mSampleRate = 0.0;
    Pull = CMSessionCopyProperty();
    PropertyInfo = Pull;
    if ((_DWORD)Pull)
      return Pull;
    objc_opt_class();
    v4 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)&cf.mSampleRate, "doubleValue");
      v4 = v6;
    }
    CFRelease(*(CFTypeRef *)&cf.mSampleRate);
  }
  StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)(a1 + 248));
  if (!StreamBasicDescription)
    return 4294954586;
  v8 = *(_OWORD *)&StreamBasicDescription->mSampleRate;
  v9 = *(_OWORD *)&StreamBasicDescription->mBytesPerPacket;
  *(_QWORD *)&__s2.mBitsPerChannel = *(_QWORD *)&StreamBasicDescription->mBitsPerChannel;
  *(_OWORD *)&__s2.mSampleRate = v8;
  *(_OWORD *)&__s2.mBytesPerPacket = v9;
  v10 = v4;
  if (*(_BYTE *)(a1 + 173))
  {
    v11 = fmax(*(double *)(a1 + 176), 0.0);
    if (*(_BYTE *)(a1 + 169))
      v11 = 48000.0;
    if (v11 == 0.0)
      v11 = 44100.0;
    if (v4 <= v11)
      v10 = v4;
    else
      v10 = v11;
  }
  if ((int)__s2.mSampleRate == (int)v10)
  {
    v12 = 0;
  }
  else
  {
    __s2.mSampleRate = v10;
    v12 = 1;
  }
  if (*(_QWORD *)(a1 + 128))
  {
    v13 = -[BWAudioSourceNode _copyAudioSessionMXProperty:err:]((id *)a1, *MEMORY[0x1E0D49650], &PropertyInfo);
    v14 = objc_msgSend(v13, "intValue");

    v15 = PropertyInfo;
    if (PropertyInfo)
      return v15;
  }
  else if (*(_QWORD *)(a1 + 144))
  {
    cf.mSampleRate = 0.0;
    Pull = CMSessionCopyProperty();
    PropertyInfo = Pull;
    if ((_DWORD)Pull)
      return Pull;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = objc_msgSend(*(id *)&cf.mSampleRate, "intValue");
    else
      v14 = 0;
    CFRelease(*(CFTypeRef *)&cf.mSampleRate);
  }
  else
  {
    v14 = 0;
  }
  if (__s2.mChannelsPerFrame != v14)
  {
    __s2.mBytesPerFrame = (__s2.mBitsPerChannel >> 3) * v14;
    __s2.mChannelsPerFrame = v14;
    __s2.mBytesPerPacket = __s2.mBytesPerFrame;
    v12 = 1;
  }
  if (FigCFEqual())
  {
    cf = __s2;
    if (__s2.mChannelsPerFrame != 3)
      return 4294954516;
    __s2.mFormatFlags |= 0x20u;
    __s2.mBytesPerPacket = __s2.mBitsPerChannel >> 3;
    __s2.mFramesPerPacket = 1;
    __s2.mBytesPerFrame = __s2.mBitsPerChannel >> 3;
    v12 = memcmp(&cf, &__s2, 0x28uLL) != 0;
  }
  v16 = v12;
LABEL_38:
  if (*(_BYTE *)(a1 + 169))
  {
    __s2.mSampleRate = 48000.0;
    __s2.mBytesPerFrame = 4;
    *(_OWORD *)&__s2.mFormatID = xmmword_1A32B1CC0;
    *(_QWORD *)&__s2.mBitsPerChannel = 32;
    v17 = *(_DWORD *)(a1 + 540);
    if (v17 == 5)
    {
      __s2.mChannelsPerFrame = 4;
      goto LABEL_46;
    }
    v16 = 1;
    __s2.mChannelsPerFrame = 1;
  }
  else
  {
    v17 = *(_DWORD *)(a1 + 540);
  }
  if (v17 == 2)
  {
    __s2.mSampleRate = 48000.0;
    *(_OWORD *)&__s2.mFormatID = xmmword_1A32B1CC0;
    *(_OWORD *)&__s2.mBytesPerFrame = xmmword_1A32B1CD0;
  }
  else if (!v16)
  {
    v18 = 0;
    goto LABEL_47;
  }
LABEL_46:
  v18 = 1;
  Pull = AudioUnitSetProperty(*(AudioUnit *)(a1 + 264), 8u, 2u, 1u, &__s2, 0x28u);
  PropertyInfo = Pull;
  if ((_DWORD)Pull)
    return Pull;
LABEL_47:
  ChannelLayout = CMAudioFormatDescriptionGetChannelLayout(*(CMAudioFormatDescriptionRef *)(a1 + 248), 0);
  Pull = AudioUnitInitialize(*(AudioUnit *)(a1 + 264));
  PropertyInfo = Pull;
  if ((_DWORD)Pull)
    return Pull;
  if (ChannelLayout)
    v20 = v18;
  else
    v20 = 1;
  if (v20 != 1)
    goto LABEL_71;
  formatDescriptionOut = 0;
  outDataSize = 0;
  v21 = 0;
  PropertyInfo = AudioUnitGetPropertyInfo(*(AudioUnit *)(a1 + 264), 0x13u, 1u, 1u, &outDataSize, 0);
  if (!PropertyInfo)
  {
    if (outDataSize)
    {
      v21 = (AudioChannelLayout *)malloc_type_malloc(outDataSize, 0x1E2BACDEuLL);
      PropertyInfo = AudioUnitGetProperty(*(AudioUnit *)(a1 + 264), 0x13u, 1u, 1u, v21, &outDataSize);
      if (PropertyInfo)
      {
        outDataSize = 0;
        if (v21)
        {
          free(v21);
          v21 = 0;
        }
      }
    }
  }
  v22 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  PropertyInfo = CMAudioFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &__s2, outDataSize, v21, 0, 0, 0, &formatDescriptionOut);
  free(v21);
  v15 = PropertyInfo;
  if (!PropertyInfo)
  {
    v23 = *(const void **)(a1 + 248);
    v24 = formatDescriptionOut;
    *(_QWORD *)(a1 + 248) = formatDescriptionOut;
    if (v24)
      CFRetain(v24);
    if (v23)
      CFRelease(v23);
    if (formatDescriptionOut)
      CFRelease(formatDescriptionOut);
    v31 = 0;
    if (!FigCFEqual())
    {
      v31 = (CMAudioFormatDescriptionRef)CFRetain(*(CFTypeRef *)(a1 + 248));
      goto LABEL_68;
    }
    cf = __s2;
    cf.mChannelsPerFrame = 1;
    cf.mFormatFlags = __s2.mFormatFlags & 0xFFFFFFDF;
    v25 = (AudioChannelLayout *)malloc_type_calloc(0xCuLL, 1uLL, 0xD9F5186FuLL);
    v25->mChannelLayoutTag = 6553601;
    v15 = CMAudioFormatDescriptionCreate(v22, &cf, 0xCuLL, v25, 0, 0, 0, &v31);
    PropertyInfo = v15;
    free(v25);
    if (!(_DWORD)v15)
    {
LABEL_68:
      for (i = 0; i != 24; i += 8)
        objc_msgSend(*(id *)(a1 + 96 + i), "setFormat:", +[BWAudioFormat formatWithAudioFormatDescription:](BWAudioFormat, "formatWithAudioFormatDescription:", v31));
      CFRelease(v31);
LABEL_71:
      Pull = -[BWAudioSourceNode _getAudioDevicePullFrames:](a1, &v35);
      PropertyInfo = Pull;
      if (!(_DWORD)Pull)
      {
        v27 = v35;
        if (v10 != v4)
        {
          v27 = vcvtpd_u64_f64(v10 * (double)v35 / v4);
          v35 = v27;
        }
        if (v27 == *(_DWORD *)(a1 + 256)
          || (*(_DWORD *)(a1 + 256) = v27,
              Pull = -[BWAudioSourceNode _generatePullBuffers](a1),
              (PropertyInfo = Pull) == 0))
        {
          v28 = -[BWAudioSourceNode _audioCombinedLatency](a1);
          CMTimeMake((CMTime *)&cf, v28, (int)__s2.mSampleRate);
          *(_OWORD *)(a1 + 408) = *(_OWORD *)&cf.mSampleRate;
          *(_QWORD *)(a1 + 424) = *(_QWORD *)&cf.mBytesPerPacket;
          v29 = a1 + 336;
          CMTimeMake((CMTime *)&cf, 2, (int)__s2.mSampleRate);
          *(_OWORD *)v29 = *(_OWORD *)&cf.mSampleRate;
          *(_QWORD *)(v29 + 16) = *(_QWORD *)&cf.mBytesPerPacket;
          return PropertyInfo;
        }
      }
      return Pull;
    }
  }
  return v15;
}

- (id)_copyAudioSessionMXProperty:(_DWORD *)a3 err:
{
  id *v5;
  _DWORD *v6;
  void *v7;
  int v8;
  id v9;
  id v10;

  if (!result)
    return result;
  v5 = result;
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v10 = 0;
  if (FigCaptureAudiomxdSupportEnabled())
  {
    v9 = 0;
    v7 = (void *)objc_msgSend(v5[16], "getMXSessionProperty:error:", a2, &v9);
    if (v9)
      v8 = objc_msgSend(v9, "code");
    else
      v8 = 0;
    v10 = v7;
    if (!a3)
      goto LABEL_12;
  }
  else
  {
    v8 = CMSessionCopyProperty();
    if (!a3)
      goto LABEL_12;
  }
  *a3 = v8;
LABEL_12:
  if (*v6 == 1)
    kdebug_trace();
  return (id *)v10;
}

- (uint64_t)_setAudioSessionAudioModeAndSelectMic:(uint64_t)a1
{
  double v4;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 128))
    {
      -[BWAudioSourceNode _updateMXSessionAudioMode](a1);
      v4 = fmax(*(double *)(a1 + 176), 0.0);
      if (*(_BYTE *)(a1 + 169))
        v4 = 48000.0;
      if (v4 == 0.0)
        v4 = 44100.0;
      -[BWAudioSourceNode _configureAudioSessionWithDefaultHardwareSampleRate:didCallDoNotNotifyOtherSessionsOnNextInactive:](a1, a2, v4);
    }
    -[BWAudioSourceNode _selectMicForCurrentAudioRoute](a1);
  }
  return 0;
}

- (void)_updateMXSessionAudioMode
{
  int v1;
  const void **v2;
  const void *v3;
  const void *v4;

  if (a1)
  {
    v1 = *(_DWORD *)(a1 + 540);
    if (v1 == 6)
    {
      v2 = (const void **)MEMORY[0x1E0D49118];
    }
    else if (*(_BYTE *)(a1 + 536))
    {
      v2 = (const void **)MEMORY[0x1E0D490D8];
    }
    else if (v1 == 2)
    {
      v2 = (const void **)MEMORY[0x1E0D49180];
    }
    else if (v1 == 1)
    {
      v2 = (const void **)MEMORY[0x1E0D49190];
    }
    else if (*(_BYTE *)(a1 + 546))
    {
      v2 = (const void **)MEMORY[0x1E0D491E0];
    }
    else if ((v1 - 3) >= 2)
    {
      if (v1 == 5)
        v2 = (const void **)MEMORY[0x1E0D49228];
      else
        v2 = (const void **)MEMORY[0x1E0D49090];
    }
    else
    {
      v2 = (const void **)MEMORY[0x1E0D49218];
    }
    v3 = *v2;
    v4 = *(const void **)(a1 + 136);
    *(_QWORD *)(a1 + 136) = v3;
    if (v3)
      CFRetain(v3);
    if (v4)
      CFRelease(v4);
  }
}

- (uint64_t)_audioSessionMXBooleanPropertyIsTrue:(uint64_t)result
{
  void *v2;
  uint64_t v3;

  if (result)
  {
    v2 = *(void **)(result + 128);
    if (v2)
    {
      v3 = 0;
      return objc_msgSend((id)objc_msgSend(v2, "getMXSessionProperty:error:", a2, &v3), "BOOLValue");
    }
    else if (*(_QWORD *)(result + 144))
    {
      return -[BWAudioSourceNode _cmSessionBooleanPropertyIsTrue:](result);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_getAudioDevicePullFrames:(uint64_t)a1
{
  uint64_t v2;
  int v4;
  AudioObjectID v5;
  uint64_t PropertyData;
  UInt32 ioDataSize;
  int outData;
  AudioObjectPropertyAddress inAddress;

  v2 = a1;
  if (a1)
  {
    outData = 0;
    if (FigCaptureAudiomxdSupportEnabled())
    {
      if (a2)
      {
        v4 = objc_msgSend(*(id *)(v2 + 128), "IOBufferFrameSize");
        v2 = 0;
        *a2 = v4;
        return v2;
      }
    }
    else
    {
      v5 = *(_DWORD *)(v2 + 240);
      if (v5)
      {
        *(_QWORD *)&inAddress.mSelector = 0x676C6F627666737ALL;
        inAddress.mElement = 0;
        ioDataSize = 4;
        if (AudioObjectGetPropertyData(v5, &inAddress, 0, 0, &ioDataSize, &outData))
        {
          inAddress.mSelector = 1718839674;
          ioDataSize = 4;
          PropertyData = AudioObjectGetPropertyData(*(_DWORD *)(v2 + 240), &inAddress, 0, 0, &ioDataSize, &outData);
          if ((_DWORD)PropertyData)
          {
            v2 = PropertyData;
            FigDebugAssert3();
            return v2;
          }
        }
        if (a2)
        {
          v2 = 0;
          *a2 = outData;
          return v2;
        }
      }
    }
    return 0;
  }
  return v2;
}

- (uint64_t)_selectMicForCurrentAudioRoute
{
  uint64_t v1;
  _DWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;

  if (!result)
    return result;
  v1 = result;
  v2 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v16 = 0;
  v3 = (void *)objc_msgSend(*(id *)(v1 + 128), "availableInputs");
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_msgSend(v4, "portType");
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CFF120]);
    if (v4 && v6 != 0)
    {
      if (FigCFEqual() || FigCFEqual() || FigCFEqual())
      {
        v8 = -[BWAudioSourceNode _copyAudioSessionMXProperty:err:]((id *)v1, *MEMORY[0x1E0D49C10], &v16);
        v9 = objc_msgSend(v8, "bw_builtInMicRouteDictionary");
        if (v9)
        {
          v10 = (void *)v9;
          if (*(_QWORD *)(v1 + 112))
          {
            if (objc_msgSend((id)v1, "isAudioPlayingToBuiltinSpeaker"))
              v11 = 1651799149;
            else
              v11 = 1718775412;
LABEL_19:
            v12 = (void *)objc_msgSend(v10, "bw_dataSourceDictionaryForDesiredMicOrientation:", v11);
            if (v12)
            {
              v13 = v12;
              v14 = objc_msgSend(v12, "bw_optimalMicPolarPattern");
              v15 = objc_msgSend(MEMORY[0x1E0C99D20], "bw_selectedInputsArrayForBuiltInMicRouteDictionary:dataSource:polarPattern:", v10, v13, v14);
              if (v15)
              {
                v16 = -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](v1, *MEMORY[0x1E0D49AA0], v15);
                if (v16)
                  FigDebugAssert3();
              }
              else
              {
                FigDebugAssert3();
                v16 = -12783;
              }
            }
            goto LABEL_23;
          }
          if (*(_QWORD *)(v1 + 104))
          {
            v11 = 1650549611;
            goto LABEL_19;
          }
        }
LABEL_23:
        if (v8)
          CFRelease(v8);
        goto LABEL_25;
      }
      -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](v1, *MEMORY[0x1E0D49AA0], 0);
    }
  }
LABEL_25:
  if (*v2 == 1)
    kdebug_trace();
  return v16;
}

- (void)_updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer:(uint64_t)a1
{
  uint64_t UpTimeNanoseconds;
  dispatch_time_t v5;
  float v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD handler[5];

  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    if (BWAudioCaptureModeIsSpatial(*(_DWORD *)(a1 + 540)) && *(_BYTE *)(a1 + 400) && !*(_QWORD *)(a1 + 584))
    {
      UpTimeNanoseconds = FigGetUpTimeNanoseconds();
      v5 = dispatch_time(0, 0);
      if (UpTimeNanoseconds >= *(_QWORD *)(a1 + 576))
      {
        os_unfair_lock_lock((os_unfair_lock_t)(a1 + 596));
        v6 = *(float *)(a1 + 592);
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 596));
        -[BWAudioSourceNode _setVADCameraParametersWithDirection:zoomFactor:forTime:](a1, 0xFFFFFFFFLL, UpTimeNanoseconds, v6);
      }
      if (a2)
      {
        v7 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(a1 + 560));
        *(_QWORD *)(a1 + 584) = v7;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __82__BWAudioSourceNode__updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer___block_invoke;
        handler[3] = &unk_1E491E720;
        handler[4] = a1;
        dispatch_source_set_event_handler(v7, handler);
        v8 = *(NSObject **)(a1 + 584);
        v9 = dispatch_time(v5, *(_QWORD *)(a1 + 576) - UpTimeNanoseconds);
        dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
        dispatch_resume(*(dispatch_object_t *)(a1 + 584));
      }
    }
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BOOL)hasNonLiveConfigurationChanges
{
  return 0;
}

- (uint64_t)_setCMSessionAudioModeAndSelectMic:(uint64_t)a1
{
  double v4;

  if (a1 && *(_QWORD *)(a1 + 144))
  {
    -[BWAudioSourceNode _updateMXSessionAudioMode](a1);
    v4 = fmax(*(double *)(a1 + 176), 0.0);
    if (*(_BYTE *)(a1 + 169))
      v4 = 48000.0;
    if (v4 == 0.0)
      v4 = 44100.0;
    -[BWAudioSourceNode _configureCMSessionWithDefaultHardwareSampleRate:didCallDoNotNotifyOtherSessionsOnNextInactive:](a1, a2, v4);
    CMSessionCopyProperty();
  }
  return 0;
}

- (uint64_t)_cmSessionBooleanPropertyIsTrue:(uint64_t)a1
{
  if (a1 && *(_QWORD *)(a1 + 144))
    CMSessionCopyProperty();
  return 0;
}

- (uint64_t)_updateAudioDeviceUID:(uint64_t)result
{
  uint64_t v2;
  AudioDeviceID deviceIDOut;

  if (result)
  {
    v2 = result;
    result = CMAudioDeviceClockSetAudioDeviceUID(*(CMClockRef *)(result + 232), a2);
    if (!(_DWORD)result)
    {
      deviceIDOut = 0;
      result = CMAudioDeviceClockGetAudioDevice(*(CMClockRef *)(v2 + 232), 0, &deviceIDOut, 0);
      if (!(_DWORD)result)
        *(_DWORD *)(v2 + 240) = deviceIDOut;
    }
  }
  return result;
}

void __27__BWAudioSourceNode_start___block_invoke_2(uint64_t a1)
{
  -[BWAudioSourceNode _generateSilenceIfNeeded](*(_QWORD *)(a1 + 32));
}

- (void)_generateSilenceIfNeeded
{
  void *v2;
  unint64_t *v3;
  unint64_t v4;
  const AudioStreamBasicDescription *StreamBasicDescription;
  uint64_t v6;
  int64_t v7;
  CMClockRef HostTimeClock;
  int32_t mSampleRate;
  uint64_t v10;
  CMItemCount NumSamples;
  opaqueCMSampleBuffer *v12;
  opaqueCMSampleBuffer *v13;
  NSObject *v14;
  Float64 Seconds;
  dispatch_time_t v16;
  void *context;
  CMTime v18;
  CMTime v19;
  CMTime rhs;
  CMTime lhs;
  CMTime v22;
  CMTime time;
  CMTime v24;
  CMTime v25;

  if (a1 && !*(_BYTE *)(a1 + 600) && *(_BYTE *)(a1 + 400) && !*(_BYTE *)(a1 + 402))
  {
    v2 = (void *)MEMORY[0x1A858DD40]();
    v3 = (unint64_t *)(a1 + 440);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4, v3));
    if (*(_QWORD *)(a1 + 464) == v4)
    {
      context = v2;
      StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(*(CMAudioFormatDescriptionRef *)(a1 + 248));
      memset(&v25, 0, sizeof(v25));
      CMTimeMake(&v25, *(unsigned int *)(a1 + 256), (int)StreamBasicDescription->mSampleRate);
      memset(&v24, 0, sizeof(v24));
      v6 = mach_absolute_time();
      v7 = AudioConvertHostTimeToNanos(v6);
      CMTimeMake(&time, v7, 1000000000);
      HostTimeClock = CMClockGetHostTimeClock();
      CMSyncConvertTime(&v24, &time, HostTimeClock, *(CMClockOrTimebaseRef *)(a1 + 232));
      mSampleRate = (int)StreamBasicDescription->mSampleRate;
      lhs = v24;
      CMTimeConvertScale(&v22, &lhs, mSampleRate, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      v24 = v22;
      lhs = v22;
      rhs = v25;
      CMTimeSubtract(&v22, &lhs, &rhs);
      v24 = v22;
      memset(&v22, 0, sizeof(v22));
      lhs = *(CMTime *)(a1 + 480);
      rhs = v25;
      CMTimeAdd(&v22, &lhs, &rhs);
      lhs = v22;
      rhs = v24;
      if (CMTimeCompare(&lhs, &rhs) <= 0)
      {
        while (1)
        {
          *(_DWORD *)(a1 + 512) = *(_DWORD *)(a1 + 256);
          if ((StreamBasicDescription->mFormatFlags & 0x20) != 0 && *(_DWORD *)(a1 + 540) == 6)
            break;
          v13 = -[BWAudioSourceNode _createSampleBufferForTimestampedAudioBufferList:audioBufferIndex:]((CMSampleBufferRef)a1, a1 + 456, 0);
          objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", v13);
          NumSamples = CMSampleBufferGetNumSamples(v13);
          if (v13)
            CFRelease(v13);
LABEL_22:
          *(_QWORD *)(a1 + 448) += NumSamples;
          memset(&lhs, 0, sizeof(lhs));
          CMTimeMake(&lhs, *(unsigned int *)(a1 + 512), (int)StreamBasicDescription->mSampleRate);
          v19 = *(CMTime *)(a1 + 480);
          v18 = lhs;
          CMTimeAdd(&rhs, &v19, &v18);
          *(CMTime *)(a1 + 480) = rhs;
          v19 = *(CMTime *)(a1 + 480);
          v18 = v25;
          CMTimeAdd(&rhs, &v19, &v18);
          v22 = rhs;
          lhs = rhs;
          rhs = v24;
          if (CMTimeCompare(&lhs, &rhs) >= 1)
            goto LABEL_23;
        }
        v10 = 0;
        NumSamples = 0;
        while (1)
        {
          if (*(_QWORD *)(a1 + 96 + 8 * v10))
          {
            v12 = -[BWAudioSourceNode _createSampleBufferForTimestampedAudioBufferList:audioBufferIndex:]((CMSampleBufferRef)a1, a1 + 456, v10);
            objc_msgSend(*(id *)(a1 + 96 + 8 * v10), "emitSampleBuffer:", v12);
            if (!NumSamples)
            {
              NumSamples = CMSampleBufferGetNumSamples(v12);
              if (!v12)
                goto LABEL_16;
LABEL_15:
              CFRelease(v12);
              goto LABEL_16;
            }
            if (v12)
              goto LABEL_15;
          }
LABEL_16:
          if (++v10 == 3)
            goto LABEL_22;
        }
      }
LABEL_23:
      v14 = *(NSObject **)(a1 + 432);
      lhs = v25;
      Seconds = CMTimeGetSeconds(&lhs);
      v16 = dispatch_time(0, (uint64_t)(Seconds * 1000000000.0));
      dispatch_source_set_timer(v14, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
      v2 = context;
    }
    objc_autoreleasePoolPop(v2);
  }
}

void __27__BWAudioSourceNode_start___block_invoke_3(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 576) = FigGetUpTimeNanoseconds();
  -[BWAudioSourceNode _updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer:](*(_QWORD *)(a1 + 32), 0);
}

- (void)makeOutputsLiveIfNeeded
{
  NSObject *generateSamplesDispatchQueue;
  _QWORD block[5];

  generateSamplesDispatchQueue = self->_generateSamplesDispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__BWAudioSourceNode_makeOutputsLiveIfNeeded__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(generateSamplesDispatchQueue, block);
}

void *__44__BWAudioSourceNode_makeOutputsLiveIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t i;
  void *result;

  for (i = 0; i != 24; i += 8)
  {
    result = *(void **)(*(_QWORD *)(a1 + 32) + 96 + i);
    if (result)
    {
      result = (void *)objc_msgSend(result, "liveFormat");
      if (!result)
        result = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96 + i), "makeConfiguredFormatLive");
    }
  }
  return result;
}

- (BOOL)stop:(id *)a3
{
  _DWORD *v4;
  _BOOL4 streamStarted;
  NSObject *silenceTimer;
  NSObject *generateSamplesDispatchQueue;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  int64_t v11;
  __int128 v12;
  NSObject *zoomHandlerQueue;
  AVAudioSession *audioSession;
  _QWORD v16[5];
  uint64_t v17;
  _QWORD block[5];

  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  streamStarted = self->_streamStarted;
  self->_streamStarted = 0;
  silenceTimer = self->_silenceTimer;
  if (silenceTimer)
    dispatch_source_cancel(silenceTimer);
  generateSamplesDispatchQueue = self->_generateSamplesDispatchQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__BWAudioSourceNode_stop___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(generateSamplesDispatchQueue, block);
  if (streamStarted)
  {
    AudioOutputUnitStop(self->_audioUnit);
    AudioUnitUninitialize(self->_audioUnit);
    if (self->_audioSession || self->_CMSession)
    {
      if (self->_clientAudioClockDeviceUID)
        -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D49510], (uint64_t)&stru_1E4928818);
      if (!self->_isAppAudioSession)
      {
        v9 = MEMORY[0x1E0C9AAA0];
        -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D49908], MEMORY[0x1E0C9AAA0]);
        -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D49918], v9);
      }
    }
    self->_nextExpectedHostTime = 0;
    v10 = (__int128 *)MEMORY[0x1E0CA2E18];
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    self->_nextExpectedSampleTime.epoch = v11;
    v12 = *v10;
    *(_OWORD *)&self->_nextExpectedSampleTime.value = *v10;
    *(_OWORD *)&self->_prevPTS.value = v12;
    self->_prevPTS.epoch = v11;
    if (!self->_streamInterrupted && self->_didBeginInterruption)
    {
      audioSession = self->_audioSession;
      if (audioSession)
      {
        if (self->_doEndInterruption || self->_livePhotoCaptureEnabled || self->_mixWithOthersEnabled)
        {
          v17 = 0;
          -[AVAudioSession setActive:error:](audioSession, "setActive:error:", 0, &v17);
        }
      }
      else if (self->_CMSession
             && (self->_doEndInterruption || self->_livePhotoCaptureEnabled || self->_mixWithOthersEnabled))
      {
        CMSessionEndInterruption();
      }
    }
    self->_streamInterrupted = 0;
    self->_didBeginInterruption = 0;
  }
  zoomHandlerQueue = self->_zoomHandlerQueue;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __26__BWAudioSourceNode_stop___block_invoke_2;
  v16[3] = &unk_1E491E720;
  v16[4] = self;
  dispatch_sync(zoomHandlerQueue, v16);
  if (*v4 == 1)
    kdebug_trace();
  return 1;
}

void __26__BWAudioSourceNode_stop___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;

  for (i = 0; i != 24; i += 8)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96 + i), "markEndOfLiveOutput");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 402) = 1;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  if (v3)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432) = 0;
  }
}

void __26__BWAudioSourceNode_stop___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 584);
  if (v2)
  {
    dispatch_source_cancel(v2);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584) = 0;
  }
}

+ (id)audioSourceNodeWithAttributes:(id)a3 sessionPreset:(id)a4 clock:(OpaqueCMClock *)a5 doConfigureAudio:(BOOL)a6 doMixWithOthers:(BOOL)a7 audioSession:(id)a8 CMSession:(opaqueCMSession *)a9 isAppAudioSession:(BOOL)a10 doEndInterruption:(BOOL)a11 audioSessionIsProxy:(BOOL)a12 audioIsPlayingToBuiltinSpeaker:(BOOL)a13 clientAuditToken:(id *)a14 clientOSVersionSupportsDecoupledIO:(BOOL)a15 clientAudioClockDeviceUID:(id)a16 audioCaptureConnectionConfigurations:(id)a17 isConfiguredForContinuityCapture:(BOOL)a18
{
  BWAudioSourceNode *v19;
  __int128 v20;
  _OWORD v27[3];

  v19 = [BWAudioSourceNode alloc];
  v20 = *(_OWORD *)&a14->var0[4];
  v27[0] = *(_OWORD *)a14->var0;
  v27[1] = v20;
  return -[BWAudioSourceNode _initWithAttributes:sessionPreset:clock:doConfigureAudio:doMixWithOthers:audioSession:CMSession:isAppAudioSession:doEndInterruption:audioSessionIsProxy:audioIsPlayingToBuiltinSpeaker:clientAuditToken:clientOSVersionSupportsDecoupledIO:clientAudioClockDeviceUID:audioCaptureConnectionConfigurations:isConfiguredForContinuityCapture:]((char *)v19, a3, (uint64_t)a4, a5, a6, a7, (unint64_t)a8, (unint64_t)a9, a10, a11, a12, a13, v27, a15, a16, a17, a18);
}

- (char)_initWithAttributes:(uint64_t)a3 sessionPreset:(const void *)a4 clock:(char)a5 doConfigureAudio:(char)a6 doMixWithOthers:(unint64_t)a7 audioSession:(unint64_t)a8 CMSession:(char)a9 isAppAudioSession:(char)a10 doEndInterruption:(char)a11 audioSessionIsProxy:(char)a12 audioIsPlayingToBuiltinSpeaker:(_OWORD *)a13 clientAuditToken:(char)a14 clientOSVersionSupportsDecoupledIO:(void *)a15 clientAudioClockDeviceUID:(void *)a16 audioCaptureConnectionConfigurations:(char)a17 isConfiguredForContinuityCapture:
{
  char *v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef v26;
  int *v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  BWNodeOutput *v36;
  double v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  os_log_type_t type;
  int v47;
  objc_super v48;
  _BYTE v49[128];
  _OWORD v50[8];
  uint64_t v51;

  v17 = a1;
  v51 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return v17;
  if (!a4)
  {
LABEL_36:
    FigDebugAssert3();

    return 0;
  }
  v48.receiver = a1;
  v48.super_class = (Class)BWAudioSourceNode;
  v17 = (char *)objc_msgSendSuper2(&v48, sel_init);
  if (!v17)
    return v17;
  *((_QWORD *)v17 + 29) = CFRetain(a4);
  *((_DWORD *)v17 + 60) = 0;
  *((_DWORD *)v17 + 101) = 1;
  *((_QWORD *)v17 + 15) = (id)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AudioSettingsForPresetsMap")), "objectForKeyedSubscript:", a3);
  v17[169] = a17;
  v17[600] = 0;
  if (v17[600] && dword_1ECFE96B0)
  {
    v47 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v17[601] = a12;
  if (a7 | a8)
  {
    if (a7)
    {
      v26 = (id)a7;
      v27 = &OBJC_IVAR___BWAudioSourceNode__audioSession;
    }
    else
    {
      if (!a8)
      {
LABEL_13:
        v17[173] = a5;
        v17[174] = a6;
        v17[171] = a10;
        v17[172] = a9;
        v17[168] = a11;
        if (v17[173])
        {
          *((_QWORD *)v17 + 17) = CFRetain((CFTypeRef)*MEMORY[0x1E0D49090]);
          if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("PrefersDecoupledIO")), "BOOLValue"))
          {
            if (a14 && v17[172] && !v17[169])
              v17[152] = 1;
          }
        }
        goto LABEL_19;
      }
      v26 = CFRetain((CFTypeRef)a8);
      v27 = &OBJC_IVAR___BWAudioSourceNode__CMSession;
    }
    *(_QWORD *)&v17[*v27] = v26;
    goto LABEL_13;
  }
LABEL_19:
  if ((FigCaptureAudiomxdSupportEnabled() & 1) == 0)
    FigAudioDeviceClockSetIgnoresBluetoothPresentationTimeSupport();
  v28 = a13[1];
  *(_OWORD *)(v17 + 184) = *a13;
  *(_OWORD *)(v17 + 200) = v28;
  v29 = *(_OWORD *)(v17 + 200);
  v50[0] = *(_OWORD *)(v17 + 184);
  v50[1] = v29;
  *((_DWORD *)v17 + 54) = FigCaptureGetPIDFromAuditToken(v50);
  v30 = 0;
  *((_QWORD *)v17 + 28) = a15;
  *((_DWORD *)v17 + 68) = 1919512419;
  *((_QWORD *)v17 + 22) = 0;
  do
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v31 = objc_msgSend(a16, "countByEnumeratingWithState:objects:count:", &v42, v49, 16, v40, v41);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v43;
      while (2)
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v43 != v33)
            objc_enumerationMutation(a16);
          v35 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (v30 == objc_msgSend(v35, "builtInMicrophonePosition"))
          {
            v36 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1936684398, v17);
            *(_QWORD *)&v17[8 * v30 + 96] = v36;
            objc_msgSend(v17, "addOutput:", v36);

            objc_msgSend(v35, "builtInMicrophoneRequiredSampleRate");
            if (v37 > *((double *)v17 + 22))
            {
              objc_msgSend(v35, "builtInMicrophoneRequiredSampleRate");
              *((_QWORD *)v17 + 22) = v38;
            }
            goto LABEL_33;
          }
        }
        v32 = objc_msgSend(a16, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        if (v32)
          continue;
        break;
      }
    }
LABEL_33:
    ++v30;
  }
  while (v30 != 3);
  *((_QWORD *)v17 + 49) = FigDispatchQueueCreateWithPriority();
  *((_QWORD *)v17 + 70) = FigDispatchQueueCreateWithPriority();
  *((_DWORD *)v17 + 149) = 0;
  *((_QWORD *)v17 + 71) = 100000000;
  if (-[BWAudioSourceNode _setupAudioUnit]((uint64_t)v17))
    goto LABEL_36;
  return v17;
}

- (void)dealloc
{
  void *v3;
  opaqueCMSession *CMSession;
  NSString *MXSessionAudioMode;
  OpaqueAudioComponentInstance *audioUnit;
  opaqueCMSimpleQueue *renderProcErrorQueue;
  OpaqueCMClock *clock;
  opaqueCMFormatDescription *auOutputFormatDescription;
  objc_super v10;

  if (self->_configuresSession)
  {
    if (self->_audioSession)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CFF188], self->_audioSession);
    }
    else if (self->_CMSession)
    {
      CMNotificationCenterGetDefaultLocalCenter();
      FigNotificationCenterRemoveWeakListener();
    }
  }

  CMSession = self->_CMSession;
  if (CMSession)
  {
    CFRelease(CMSession);
    self->_CMSession = 0;
  }
  MXSessionAudioMode = self->_MXSessionAudioMode;
  if (MXSessionAudioMode)
  {
    CFRelease(MXSessionAudioMode);
    self->_MXSessionAudioMode = 0;
  }
  audioUnit = self->_audioUnit;
  if (audioUnit)
  {
    AudioUnitUninitialize(audioUnit);
    AudioComponentInstanceDispose(self->_audioUnit);
    self->_audioUnit = 0;
  }

  renderProcErrorQueue = self->_renderProcErrorQueue;
  if (renderProcErrorQueue)
  {
    CFRelease(renderProcErrorQueue);
    self->_renderProcErrorQueue = 0;
  }
  TimestampedAudioBufferListQueueReleaseAndClear((CFTypeRef *)&self->_inactiveBuffersQueue);
  TimestampedAudioBufferListQueueReleaseAndClear((CFTypeRef *)&self->_activeBuffersQueue);
  clock = self->_clock;
  if (clock)
  {
    CFRelease(clock);
    self->_clock = 0;
  }
  auOutputFormatDescription = self->_auOutputFormatDescription;
  if (auOutputFormatDescription)
  {
    CFRelease(auOutputFormatDescription);
    self->_auOutputFormatDescription = 0;
  }

  v10.receiver = self;
  v10.super_class = (Class)BWAudioSourceNode;
  -[BWNode dealloc](&v10, sel_dealloc);
}

- (BOOL)levelMeteringEnabled
{
  return self->_levelMeteringEnabled;
}

- (BOOL)livePhotoCaptureEnabled
{
  return self->_livePhotoCaptureEnabled;
}

- (BOOL)mixWithOthersEnabled
{
  return self->_mixWithOthersEnabled;
}

- (void)setMixWithOthersEnabled:(BOOL)a3
{
  self->_mixWithOthersEnabled = a3;
}

- (BOOL)windNoiseRemovalEnabled
{
  return self->_windNoiseRemovalEnabled;
}

- (void)setWindNoiseRemovalEnabled:(BOOL)a3
{
  self->_windNoiseRemovalEnabled = a3;
}

- (BOOL)cinematicVideoCaptureEnabled
{
  return self->_cinematicVideoCaptureEnabled;
}

- (void)setCinematicVideoCaptureEnabled:(BOOL)a3
{
  self->_cinematicVideoCaptureEnabled = a3;
}

- (BOOL)flipStereoAudioCaptureChannels
{
  return self->_flipStereoAudioCaptureChannels;
}

- (void)setFlipStereoAudioCaptureChannels:(BOOL)a3
{
  self->_flipStereoAudioCaptureChannels = a3;
}

- (BOOL)videoRecordingEnabled
{
  return self->_videoRecordingEnabled;
}

- (BOOL)isAudioPlayingToBuiltinSpeaker
{
  return self->_audioPlayingToBuiltinSpeaker;
}

- (void)updateWithAudioSession:(id)a3 clientAuditToken:(id *)a4
{
  __int128 v6;
  __int128 v7;
  OpaqueCMClock *clock;
  _OWORD v9[2];

  if (!self->_streamStarted)
  {
    v6 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)self->_clientAuditToken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&self->_clientAuditToken.val[4] = v6;
    v7 = *(_OWORD *)&a4->var0[4];
    v9[0] = *(_OWORD *)a4->var0;
    v9[1] = v7;
    self->_clientPID = FigCaptureGetPIDFromAuditToken(v9);

    self->_audioSession = (AVAudioSession *)a3;
    self->_audioSessionIsProxy = 0;
    *(_QWORD *)&v9[0] = 0;
    if (FigAudioSessionClockCreateForAVAudioSession())
      goto LABEL_7;
    clock = self->_clock;
    if (clock)
      CFRelease(clock);
    self->_clock = *(OpaqueCMClock **)&v9[0];
    if (-[BWAudioSourceNode _setupAudioUnit]((uint64_t)self))
LABEL_7:
      FigDebugAssert3();
  }
}

- (NSArray)audioLevels
{
  AudioUnitPropertyID v3;
  char *v4;
  unint64_t v5;
  NSArray *v6;
  double v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  double v11;
  UInt32 outDataSize;

  outDataSize = 0;
  if (self->_audioLevelUnits == 1)
    v3 = 1892;
  else
    v3 = 1893;
  if (AudioUnitGetPropertyInfo(self->_audioUnit, v3, 1u, 1u, &outDataSize, 0) || outDataSize - 136 < 0xFFFFFF79)
  {
    v6 = 0;
    v4 = 0;
    goto LABEL_14;
  }
  v4 = (char *)malloc_type_calloc(1uLL, outDataSize, 0x35A71CC9uLL);
  if (!v4)
  {
    FigDebugAssert3();
LABEL_17:
    v6 = 0;
    goto LABEL_14;
  }
  if (AudioUnitGetProperty(self->_audioUnit, v3, 1u, 1u, v4, &outDataSize) || outDataSize < 8)
    goto LABEL_17;
  v5 = (unint64_t)outDataSize >> 3;
  v6 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2 * v5);
  v8 = 0;
  if (v5 <= 1)
    v9 = 1;
  else
    v9 = v5;
  v10 = 8 * v9;
  do
  {
    LODWORD(v7) = *(_DWORD *)&v4[v8];
    -[NSArray addObject:](v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7));
    LODWORD(v11) = *(_DWORD *)&v4[v8 + 4];
    -[NSArray addObject:](v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11));
    v8 += 8;
  }
  while (v10 != v8);
LABEL_14:
  free(v4);
  return v6;
}

- (float)stereoAudioCapturePairedCameraBaseFieldOfView
{
  return self->_stereoAudioCapturePairedCameraBaseFieldOfView;
}

- (void)setStereoAudioCapturePairedCameraBaseFieldOfView:(float)a3
{
  self->_stereoAudioCapturePairedCameraBaseFieldOfView = a3;
}

- (float)stereoAudioCapturePairedCameraZoomFactor
{
  return self->_stereoAudioCapturePairedCameraZoomFactor;
}

- (void)setStereoAudioCapturePairedCameraZoomFactor:(float)a3
{
  if (!self->_streamStarted)
  {
    self->_stereoAudioCapturePairedCameraZoomFactor = a3;
    self->_nextZoomFactor = a3;
  }
}

- (void)zoomCommandHandler:(id)a3 didApplyZoomFactor:(float)a4 zoomFactorWithoutFudge:(float)a5 targetZoomFactor:(float)a6 rampComplete:(BOOL)a7 rampCommandID:(int)a8
{
  os_unfair_lock_s *p_zoomLock;
  NSObject *zoomHandlerQueue;
  _QWORD block[5];

  p_zoomLock = &self->_zoomLock;
  os_unfair_lock_lock(&self->_zoomLock);
  self->_nextZoomFactor = a4;
  os_unfair_lock_unlock(p_zoomLock);
  zoomHandlerQueue = self->_zoomHandlerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __126__BWAudioSourceNode_zoomCommandHandler_didApplyZoomFactor_zoomFactorWithoutFudge_targetZoomFactor_rampComplete_rampCommandID___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(zoomHandlerQueue, block);
}

void __126__BWAudioSourceNode_zoomCommandHandler_didApplyZoomFactor_zoomFactorWithoutFudge_targetZoomFactor_rampComplete_rampCommandID___block_invoke(uint64_t a1)
{
  -[BWAudioSourceNode _updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer:](*(_QWORD *)(a1 + 32), 1);
}

- (uint64_t)_setVADCameraParametersWithDirection:(uint64_t)a3 zoomFactor:(float)a4 forTime:
{
  uint64_t v4;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (result)
  {
    v8 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!(_DWORD)result)
    {
      v16 = v4;
      LODWORD(v15) = 0;
      result = FigDebugAssert3();
    }
    if (!*(_BYTE *)(v8 + 169))
    {
      if (a4 < 1.0)
        a4 = 1.0;
      if ((_DWORD)a2 != -1 || a4 != *(float *)(v8 + 552))
      {
        *(float *)&v9 = *(float *)(v8 + 548) / a4;
        v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9, v15, v16);
        if ((a2 & 0x80000000) != 0)
          v11 = 0;
        else
          v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned __int8 *)(v8 + 544));
        v14 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v10, CFSTR("camera fov"), v13, CFSTR("camera wind suppression"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_BYTE *)(v8 + 545) == 0), CFSTR("camera real time dynamics"), v11, CFSTR("camera dir"), 0);
        result = -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](v8, *MEMORY[0x1E0D49598], v14);
        if (!(_DWORD)result)
          *(float *)(v8 + 552) = a4;
      }
      *(_QWORD *)(v8 + 576) = *(_QWORD *)(v8 + 568) + a3;
    }
  }
  return result;
}

uint64_t __82__BWAudioSourceNode__updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584) = 0;
  return -[BWAudioSourceNode _updateStereoAudioCapturePairedCameraZoomFactorAndStartTimer:](*(_QWORD *)(a1 + 32), 0);
}

void __36__BWAudioSourceNode__setupAudioUnit__block_invoke(uint64_t a1)
{
  -[BWAudioSourceNode _activeAudioRouteDidChangeHandler](objc_msgSend(*(id *)(a1 + 32), "referencedObject"));
}

- (void)_activeAudioRouteDidChangeHandler
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (void *)MEMORY[0x1A858DD40]();
    v3 = (void *)objc_msgSend(*(id *)(a1 + 128), "currentRoute");
    v25 = 0;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = (void *)objc_msgSend(v3, "inputs");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      v8 = *MEMORY[0x1E0CFF120];
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "portType"), "isEqualToString:", v8) & 1) != 0)
          {
            v10 = 0;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
        if (v6)
          continue;
        break;
      }
    }
    v10 = 1;
LABEL_12:
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = (void *)objc_msgSend(v3, "outputs", 0);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      v15 = *MEMORY[0x1E0CFF130];
LABEL_14:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16), "portType"), "isEqualToString:", v15) & 1) != 0)break;
        if (v13 == ++v16)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
          if (v13)
            goto LABEL_14;
          goto LABEL_22;
        }
      }
      if ((v10 & 1) != 0)
        goto LABEL_22;
      objc_msgSend(*(id *)(a1 + 128), "overrideOutputAudioPort:error:", 1936747378, &v25);
      objc_msgSend(v25, "code");
    }
    else
    {
LABEL_22:
      -[BWAudioSourceNode _selectMicForCurrentAudioRoute](a1);
    }
    objc_autoreleasePoolPop(v2);
  }
}

- (uint64_t)_setCMSessionPropertyWithKey:(uint64_t)a1 value:
{
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 0;
  v2 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (*(_DWORD *)(a1 + 216) && *(_BYTE *)(a1 + 172))
    v3 = AudioSessionSetCMProperty();
  else
    v3 = CMSessionSetProperty();
  v4 = v3;
  if (*v2 == 1)
    kdebug_trace();
  return v4;
}

- (uint64_t)_selectMicForAudioRoute:(_QWORD *)a1
{
  _DWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (!a1)
    return 0;
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (!objc_msgSend(a2, "bw_containsBuiltInMicAsAnInput"))
  {
    v8 = 0;
    goto LABEL_25;
  }
  if (!FigCFEqual() && !FigCFEqual() && !FigCFEqual())
  {
    -[BWAudioSourceNode _setCMSessionPropertyWithKey:value:]((uint64_t)a1);
    goto LABEL_24;
  }
  if (!a2)
  {
    FigDebugAssert3();
    v8 = 4294954516;
    goto LABEL_25;
  }
  v5 = (void *)a1[18];
  if (v5)
  {
    v6 = CMSessionCopyProperty();
    if ((_DWORD)v6)
    {
      v8 = v6;
LABEL_30:
      FigDebugAssert3();
      goto LABEL_25;
    }
    v5 = 0;
  }
  v7 = (void *)objc_msgSend(v5, "bw_builtInMicRouteDictionary");
  v8 = (uint64_t)v7;
  if (!v7)
    goto LABEL_25;
  if (a1[14])
  {
    v9 = 1718775412;
  }
  else
  {
    if (!a1[13])
      goto LABEL_24;
    v9 = 1650549611;
  }
  v10 = (void *)objc_msgSend(v7, "bw_dataSourceDictionaryForDesiredMicOrientation:", v9);
  if (!v10)
    goto LABEL_24;
  v11 = v10;
  v12 = objc_msgSend(v10, "bw_optimalMicPolarPattern");
  if (objc_msgSend(MEMORY[0x1E0C99D20], "bw_selectedInputsArrayForBuiltInMicRouteDictionary:dataSource:polarPattern:", v8, v11, v12))
  {
    if (a1[18])
    {
      v8 = -[BWAudioSourceNode _setCMSessionPropertyWithKey:value:]((uint64_t)a1);
      if (!(_DWORD)v8)
        goto LABEL_25;
      goto LABEL_30;
    }
LABEL_24:
    v8 = 0;
    goto LABEL_25;
  }
  FigDebugAssert3();
  v8 = 4294954513;
LABEL_25:
  if (*v4 == 1)
    kdebug_trace();
  return v8;
}

uint64_t __119__BWAudioSourceNode__configureAudioSessionWithDefaultHardwareSampleRate_didCallDoNotNotifyOtherSessionsOnNextInactive___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  float v3;
  uint64_t UpTimeNanoseconds;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned int *)(a1 + 40);
  v3 = *(float *)(a1 + 44);
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  return -[BWAudioSourceNode _setVADCameraParametersWithDirection:zoomFactor:forTime:](v1, v2, UpTimeNanoseconds, v3);
}

- (uint64_t)_configureCMSessionWithDefaultHardwareSampleRate:(double)a3 didCallDoNotNotifyOtherSessionsOnNextInactive:
{
  _DWORD *v6;
  int v7;
  uint64_t v8;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  _QWORD block[5];
  _BOOL4 v16;
  int v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v7 = *(unsigned __int8 *)(a1 + 152);
  if (!-[BWAudioSourceNode _deactivateCMSessionIfNecessary:](a1, a2))
  {
    if (!-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1)
      && !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
    {
      if (v7)
      {
        -[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1);
        if (!-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
          goto LABEL_11;
      }
      else if (!-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
      {
LABEL_11:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
        -[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1);
        if (*(_BYTE *)(a1 + 169))
          v8 = 2;
        else
          v8 = 1048578;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
        if (!-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
        {
          if (!*(_BYTE *)(a1 + 169)
            || (objc_msgSend((id)objc_msgSend((id)a1, "graph"), "clientApplicationID"),
                !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
            && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3 * 0.01),
                !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
            && !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
          {
            if ((!*(_BYTE *)(a1 + 536) && !*(_BYTE *)(a1 + 174)
               || !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
              && !-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
            {
              if (BWAudioCaptureModeIsSpatial(*(_DWORD *)(a1 + 540)))
              {
                v9 = *(_QWORD *)(a1 + 112) == 0;
                os_unfair_lock_lock((os_unfair_lock_t)(a1 + 596));
                v10 = *(_DWORD *)(a1 + 592);
                os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 596));
                v11 = *(NSObject **)(a1 + 560);
                block[0] = MEMORY[0x1E0C809B0];
                block[1] = 3221225472;
                block[2] = __116__BWAudioSourceNode__configureCMSessionWithDefaultHardwareSampleRate_didCallDoNotNotifyOtherSessionsOnNextInactive___block_invoke;
                block[3] = &unk_1E491F158;
                block[4] = a1;
                v16 = v9;
                v17 = v10;
                dispatch_async(v11, block);
                goto LABEL_32;
              }
              if (!FigCFEqual())
                goto LABEL_32;
              v12 = *(_QWORD *)(a1 + 96) != 0;
              if (*(_QWORD *)(a1 + 104))
                v12 |= 2u;
              v13 = *(_QWORD *)(a1 + 112) ? v12 | 4 : v12;
              v18 = CFSTR("camera mics");
              v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
              if (!-[BWAudioSourceNode _setCMSessionPropertyWithKey:value:](a1))
                goto LABEL_32;
            }
          }
        }
      }
    }
    FigDebugAssert3();
  }
LABEL_32:
  if (*v6 == 1)
    kdebug_trace();
  return 0;
}

- (uint64_t)_deactivateCMSessionIfNecessary:(uint64_t)a1
{
  uint64_t v4;

  if (!a1 || !*(_QWORD *)(a1 + 144) || !-[BWAudioSourceNode _cmSessionBooleanPropertyIsTrue:](a1))
    return 0;
  v4 = CMSessionCopyProperty();
  if ((_DWORD)v4)
  {
    FigDebugAssert3();
  }
  else if (!FigCFEqual())
  {
    if (!*(_BYTE *)(a1 + 171))
    {
      CMSessionSetProperty();
      *a2 = 1;
    }
    CMSessionEndInterruption();
  }
  return v4;
}

uint64_t __116__BWAudioSourceNode__configureCMSessionWithDefaultHardwareSampleRate_didCallDoNotNotifyOtherSessionsOnNextInactive___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  float v3;
  uint64_t UpTimeNanoseconds;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned int *)(a1 + 40);
  v3 = *(float *)(a1 + 44);
  UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  return -[BWAudioSourceNode _setVADCameraParametersWithDirection:zoomFactor:forTime:](v1, v2, UpTimeNanoseconds, v3);
}

- (uint64_t)_setupPrepareToRecordStateWithFlags:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    if ((a2 & 1) != 0 && !*(_QWORD *)(result + 160))
    {
      result = FigDispatchQueueCreateWithPriority();
      *(_QWORD *)(v3 + 160) = result;
      if ((a2 & 2) == 0)
        return result;
    }
    else if ((a2 & 2) == 0)
    {
      return result;
    }
    if (!*(_QWORD *)(v3 + 528))
    {
      result = FigDispatchQueueCreateWithPriority();
      *(_QWORD *)(v3 + 528) = result;
    }
  }
  return result;
}

- (void)prepareToStartRecordingWithOrientation:(int)a3 recordingSettingsID:(int64_t)a4 prefersNoInterruptionsByRingtonesAndAlerts:(BOOL)a5 completionHandler:(id)a6
{
  OS_dispatch_queue *audioSessionSetRecordingRelatedPropertyQueue;
  _QWORD *v11;
  _QWORD v12[6];
  _QWORD block[8];
  int v14;
  _QWORD v15[3];
  BOOL v16;

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = a5;
  self->_prefersNoInterruptionsByRingtonesAndAlerts = a5;
  if (a5 || FigCFEqual())
  {
    -[BWAudioSourceNode _setupPrepareToRecordStateWithFlags:]((uint64_t)self, -1);
    audioSessionSetRecordingRelatedPropertyQueue = self->_audioSessionSetRecordingRelatedPropertyQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke;
    block[3] = &unk_1E4925700;
    v14 = a3;
    block[4] = self;
    block[5] = a6;
    block[6] = v15;
    block[7] = a4;
    v11 = block;
  }
  else
  {
    audioSessionSetRecordingRelatedPropertyQueue = self->_preparedToRecordHandlerCallbackQueue;
    if (!audioSessionSetRecordingRelatedPropertyQueue)
    {
      audioSessionSetRecordingRelatedPropertyQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      self->_preparedToRecordHandlerCallbackQueue = audioSessionSetRecordingRelatedPropertyQueue;
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke_3;
    v12[3] = &unk_1E4922E60;
    v12[4] = a6;
    v12[5] = a4;
    v11 = v12;
  }
  dispatch_async((dispatch_queue_t)audioSessionSetRecordingRelatedPropertyQueue, v11);
  _Block_object_dispose(v15, 8);
}

void __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int64_t v5;
  CMClockRef HostTimeClock;
  const void *v7;
  int32_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD block[6];
  CMTime v15;
  CMTime rhs;
  CMTime time;
  CMTime v18;
  CMTime v19;

  v19 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 128))
    {
      FigGetUpTimeNanoseconds();
      v18.value = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setPrefersNoInterruptionsFromSystemAlerts:error:", 1, &v18);
      objc_msgSend((id)v18.value, "code");
    }
    else
    {
      if (!*(_QWORD *)(v2 + 144))
        goto LABEL_7;
      FigGetUpTimeNanoseconds();
      CMSessionSetProperty();
    }
    FigGetUpTimeNanoseconds();
  }
LABEL_7:
  if (FigCFEqual())
  {
    FigGetUpTimeNanoseconds();
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
    v4 = objc_msgSend(v3, "mutableBytes");
    *(_DWORD *)v4 = *(_DWORD *)(a1 + 64);
    *(_QWORD *)(v4 + 8) = 0;
    -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](*(_QWORD *)(a1 + 32), *MEMORY[0x1E0D495A8], (uint64_t)v3);
    FigGetUpTimeNanoseconds();
    v5 = AudioConvertHostTimeToNanos(*(_QWORD *)(objc_msgSend(v3, "mutableBytes") + 8));
    CMTimeMake(&v19, v5, 1000000000);
    HostTimeClock = CMClockGetHostTimeClock();
    v7 = *(const void **)(*(_QWORD *)(a1 + 32) + 232);
    time = v19;
    CMSyncConvertTime(&v18, &time, HostTimeClock, v7);
    v19 = v18;
    v8 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 416);
    time = v18;
    CMTimeConvertScale(&v18, &time, v8, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    v19 = v18;
    v9 = *(_QWORD *)(a1 + 32) + 408;
    time = v18;
    v10 = *(_OWORD *)v9;
    rhs.epoch = *(_QWORD *)(v9 + 16);
    *(_OWORD *)&rhs.value = v10;
    CMTimeSubtract(&v18, &time, &rhs);
    v19 = v18;
  }
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 528);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke_2;
  block[3] = &unk_1E49256D8;
  block[1] = 3221225472;
  v15 = v19;
  v13 = *(_QWORD *)(a1 + 56);
  block[4] = v11;
  block[5] = v13;
  dispatch_async(v12, block);
}

uint64_t __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, __int128 *, uint64_t);
  __int128 v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(uint64_t (**)(uint64_t, __int128 *, uint64_t))(v2 + 16);
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 64);
  return v3(v2, &v5, v1);
}

uint64_t __141__BWAudioSourceNode_prepareToStartRecordingWithOrientation_recordingSettingsID_prefersNoInterruptionsByRingtonesAndAlerts_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, __int128 *, uint64_t);
  __int128 v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(uint64_t (**)(uint64_t, __int128 *, uint64_t))(v2 + 16);
  v5 = *MEMORY[0x1E0CA2E68];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  return v3(v2, &v5, v1);
}

- (void)unprepareForRecording
{
  _BOOL4 v3;
  OS_dispatch_queue *audioSessionSetRecordingRelatedPropertyQueue;
  _QWORD v5[6];
  _QWORD v6[3];
  BOOL prefersNoInterruptionsByRingtonesAndAlerts;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  prefersNoInterruptionsByRingtonesAndAlerts = self->_prefersNoInterruptionsByRingtonesAndAlerts;
  v3 = prefersNoInterruptionsByRingtonesAndAlerts;
  self->_prefersNoInterruptionsByRingtonesAndAlerts = 0;
  if (v3 || FigCFEqual())
  {
    audioSessionSetRecordingRelatedPropertyQueue = self->_audioSessionSetRecordingRelatedPropertyQueue;
    if (!audioSessionSetRecordingRelatedPropertyQueue)
    {
      audioSessionSetRecordingRelatedPropertyQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
      self->_audioSessionSetRecordingRelatedPropertyQueue = audioSessionSetRecordingRelatedPropertyQueue;
    }
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__BWAudioSourceNode_unprepareForRecording__block_invoke;
    v5[3] = &unk_1E491E9A8;
    v5[4] = self;
    v5[5] = v6;
    dispatch_async((dispatch_queue_t)audioSessionSetRecordingRelatedPropertyQueue, v5);
  }
  _Block_object_dispose(v6, 8);
}

uint64_t __42__BWAudioSourceNode_unprepareForRecording__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  void *v5;
  id v6;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    FigGetUpTimeNanoseconds();
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 128);
    if (v3)
    {
      v6 = 0;
      objc_msgSend(v3, "setPrefersNoInterruptionsFromSystemAlerts:error:", 0, &v6);
      objc_msgSend(v6, "code");
    }
    else if (*(_QWORD *)(v2 + 144))
    {
      CMSessionSetProperty();
    }
    FigGetUpTimeNanoseconds();
  }
  result = FigCFEqual();
  if ((_DWORD)result)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 16);
    *(_DWORD *)objc_msgSend(v5, "mutableBytes") = 5;
    FigGetUpTimeNanoseconds();
    -[BWAudioSourceNode _setAudioSessionMXPropertyWithKey:value:](*(_QWORD *)(a1 + 32), *MEMORY[0x1E0D495A8], (uint64_t)v5);
    return FigGetUpTimeNanoseconds();
  }
  return result;
}

- (BOOL)interrupted
{
  return self->_streamInterrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_streamInterrupted = a3;
}

@end
