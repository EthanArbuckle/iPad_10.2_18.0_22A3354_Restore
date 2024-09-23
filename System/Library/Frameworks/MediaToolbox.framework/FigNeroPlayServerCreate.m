@implementation FigNeroPlayServerCreate

void __FigNeroPlayServerCreate_block_invoke(uint64_t a1, int a2, CFTypeRef cf)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  CFTypeRef v6;
  OpaqueCMClock *HostTimeClock;
  uint64_t v8;
  const __CFAllocator *v9;
  int value;
  int v11;
  _OWORD *v12;
  CMTimeEpoch epoch;
  __int128 v14;
  int v15;
  CMTimeValue v16;
  CMTimeValue v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  CMTimeValue v23;
  int v24;
  int v25;
  int v26;
  const void *v27;
  CMTime v28;
  void *v29;
  uint64_t v30;
  CMSampleBufferRef v31;
  CFTypeRef v32;
  CMTime v33;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v37;
  CMTime v38;
  CMSampleTimingInfo timingArrayOut;
  CMTime v40;
  CMSampleBufferRef sampleBufferOut;
  opaqueCMSampleBuffer *v42;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2 <= 1700885536)
  {
    if (a2 == 1651470958)
    {
LABEL_8:
      v5 = MEMORY[0x1E0CA2E18];
      *(_OWORD *)(v3 + 272) = *MEMORY[0x1E0CA2E18];
      *(_QWORD *)(v3 + 288) = *(_QWORD *)(v5 + 16);
      return;
    }
    v4 = 1684628836;
LABEL_6:
    if (a2 != v4)
      return;
    _FigNeroPlayServerStopAudio(*(_QWORD *)(a1 + 32));
    *(_QWORD *)(v3 + 24) = 0;
    goto LABEL_8;
  }
  if (a2 != 1700885537)
  {
    v4 = 1919249523;
    goto LABEL_6;
  }
  v6 = cf;
  if (*(_QWORD *)(v3 + 32))
  {
    sampleBufferOut = 0;
    v42 = 0;
    v40 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    memset(&timingArrayOut, 0, sizeof(timingArrayOut));
    memset(&v38, 0, sizeof(v38));
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&v38, HostTimeClock);
    v8 = mach_absolute_time();
    if (v6)
      CFRetain(v6);
    v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (!FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer()
      && !CMSampleBufferGetSampleTimingInfoArray(v42, 1, &timingArrayOut, 0))
    {
      memset(&v37, 0, sizeof(v37));
      CMSampleBufferGetPresentationTimeStamp(&v37, v42);
      time = v38;
      CMTimeConvertScale(&v28, &time, v37.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      v38 = v28;
      CMSampleBufferGetDuration(&time, v42);
      value = time.value;
      v11 = *(_DWORD *)(v3 + 76);
      v12 = (_OWORD *)(v3 + 272);
      if ((*(_BYTE *)(v3 + 284) & 1) == 0)
      {
        epoch = v38.epoch;
        *(_QWORD *)(v3 + 312) = v38.epoch;
        v14 = *(_OWORD *)&v38.value;
        *(_OWORD *)(v3 + 296) = *(_OWORD *)&v38.value;
        *(_OWORD *)&lhs.value = v14;
        lhs.epoch = epoch;
        rhs = v37;
        CMTimeSubtract(&v28, &lhs, &rhs);
        *v12 = *(_OWORD *)&v28.value;
        *(_QWORD *)(v3 + 288) = v28.epoch;
        memset(&v28, 0, sizeof(v28));
        CMTimeMake(&v28, 20, 1000);
        rhs = v28;
        CMTimeConvertScale(&lhs, &rhs, v37.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        v28 = lhs;
        *(_OWORD *)&rhs.value = *v12;
        rhs.epoch = *(_QWORD *)(v3 + 288);
        v33 = lhs;
        CMTimeSubtract(&lhs, &rhs, &v33);
        *v12 = *(_OWORD *)&lhs.value;
        *(_QWORD *)(v3 + 288) = lhs.epoch;
      }
      v15 = v11 * value;
      v28 = v38;
      rhs = *(CMTime *)(v3 + 296);
      CMTimeSubtract(&lhs, &v28, &rhs);
      v16 = lhs.value;
      if (lhs.value > v37.timescale)
      {
        *(_QWORD *)(v3 + 128) = v8;
        *(_QWORD *)(v3 + 136) = v16;
      }
      v17 = v37.value + v15;
      *(_QWORD *)(v3 + 144) = v8;
      *(_QWORD *)(v3 + 152) = v17;
      _FigNeroPlayServerUpdateDesiredOctaviaSampleRate(v3);
      v28 = v37;
      *(_OWORD *)&rhs.value = *v12;
      rhs.epoch = *(_QWORD *)(v3 + 288);
      CMTimeAdd(&v40, &v28, &rhs);
      timingArrayOut.presentationTimeStamp = v40;
      timingArrayOut.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      if (!CMSampleBufferCreateCopyWithNewTiming(v9, v42, 1, &timingArrayOut, &sampleBufferOut))
      {
        v18 = *(_QWORD *)(v3 + 32);
        v19 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
        if (v19)
          v20 = v19(v18);
        else
          v20 = MEMORY[0x1E0C80D38];
        v28.value = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v28.timescale = 0x40000000;
        v28.epoch = (CMTimeEpoch)___FigNeroPlayServerEnqueueAudioBufferOnValeria_block_invoke;
        v29 = &__block_descriptor_tmp_33_1;
        v30 = v3;
        v31 = sampleBufferOut;
        v32 = v6;
        dispatch_async(v20, &v28);
        v6 = 0;
        sampleBufferOut = 0;
      }
    }
    if (v42)
      CFRelease(v42);
    v27 = sampleBufferOut;
    if (!sampleBufferOut)
      goto LABEL_38;
  }
  else
  {
    v38.value = 0;
    if (cf)
      CFRetain(cf);
    v21 = mach_absolute_time();
    if (*(_BYTE *)(v3 + 248))
    {
      v22 = v21;
      if (!FigRemote_CreateSampleBufferFromSerializedAtomDataBlockBuffer())
      {
        CMSampleBufferGetPresentationTimeStamp(&timingArrayOut.duration, (CMSampleBufferRef)v38.value);
        v23 = timingArrayOut.duration.value;
        CMSampleBufferGetDuration(&v28, (CMSampleBufferRef)v38.value);
        v24 = v28.value;
        v25 = *(_DWORD *)(v3 + 76);
        if (!CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(v3 + 96), (const void *)v38.value))
        {
          v26 = v25 * v24;
          v38.value = 0;
          v40.value = 0;
          *(_QWORD *)&v40.timescale = 0;
          if (_FigNeroPlayServerDrainQueue(*(opaqueCMSimpleQueue **)(v3 + 104), &v40.value))
            *(_OWORD *)(v3 + 128) = *(_OWORD *)&v40.value;
          *(_QWORD *)(v3 + 144) = v22;
          *(_QWORD *)(v3 + 152) = v23 + v26;
          _FigNeroPlayServerUpdateDesiredOctaviaSampleRate(v3);
        }
      }
    }
    v27 = (const void *)v38.value;
    if (!v38.value)
      goto LABEL_38;
  }
  CFRelease(v27);
LABEL_38:
  if (v6)
    CFRelease(v6);
}

void __FigNeroPlayServerCreate_block_invoke_2(uint64_t a1, int a2, OpaqueCMBlockBuffer *a3, uint64_t a4)
{
  uint64_t v5;
  dispatch_time_t v7;
  dispatch_time_t v8;
  BOOL v9;
  const __CFAllocator *v10;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v12;
  CFNumberRef v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void (*v19)(uint64_t, uint64_t);
  OpaqueAudioComponentInstance *v20;
  OpaqueAudioComponentInstance *v21;
  __int128 v22;
  __CFData *v23;
  __CFData *v24;
  __CFData *v25;
  __CFData *v26;
  __int128 destination;
  __int128 v28;
  uint64_t v29;
  int valuePtr;

  v5 = *(_QWORD *)(a1 + 32);
  if (a2 <= 1936418166)
  {
    if (a2 != 1634102644)
    {
      if (a2 != 1735336224)
        goto LABEL_35;
      LODWORD(destination) = 0;
      v7 = dispatch_time(0, 2000000000);
      if (!*(_DWORD *)(v5 + 64))
        goto LABEL_35;
      v8 = v7;
      CMSimpleQueueGetCount(*(CMSimpleQueueRef *)(v5 + 96));
      CMSimpleQueueGetCount(*(CMSimpleQueueRef *)(v5 + 104));
      if (a3)
      {
        if (CMBlockBufferGetDataLength(a3) != 4)
        {
LABEL_48:
          if (!FigSignalErrorAt())
            goto LABEL_35;
          goto LABEL_34;
        }
        if (CMBlockBufferCopyDataBytes(a3, 0, 4uLL, &destination))
        {
LABEL_34:
          _FigNeroPlayServerStopAudio(v5);
          goto LABEL_35;
        }
        v9 = (destination & 1) == 0;
      }
      else
      {
        v9 = 1;
      }
      v14 = *(double *)(v5 + 56);
      *(_QWORD *)(v5 + 200) = -(uint64_t)((*(double *)(v5 + 320) + 0.033) * v14);
      *(_QWORD *)(v5 + 144) = 0;
      *(_QWORD *)(v5 + 152) = 0;
      *(_QWORD *)(v5 + 128) = 0;
      *(_QWORD *)(v5 + 136) = 0;
      *(_QWORD *)(v5 + 160) = 0;
      *(_DWORD *)(v5 + 168) = 0;
      v15 = MEMORY[0x1E0CA2E18];
      *(double *)(v5 + 176) = v14;
      *(_OWORD *)(v5 + 272) = *(_OWORD *)v15;
      *(_QWORD *)(v5 + 288) = *(_QWORD *)(v15 + 16);
      *(_BYTE *)(v5 + 248) = 1;
      if (!v9)
        *(_BYTE *)(v5 + 221) = 1;
      v16 = *(_QWORD *)(v5 + 32);
      if (v16)
      {
        if (*(_BYTE *)(v5 + 221))
        {
          v17 = *(_QWORD *)(v5 + 224);
          v18 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
          if (*v18 == 2)
          {
            v19 = (void (*)(uint64_t, uint64_t))v18[7];
            if (v19)
              v19(v16, v17);
          }
        }
      }
      v20 = *(OpaqueAudioComponentInstance **)(v5 + 48);
      if (!v20)
        goto LABEL_35;
      *(_BYTE *)(v5 + 184) = 1;
      if (!AudioUnitInitialize(v20) && !AudioOutputUnitStart(*(AudioUnit *)(v5 + 48)))
      {
        if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v5 + 192), v8))
          goto LABEL_35;
        goto LABEL_48;
      }
      goto LABEL_34;
    }
    v29 = 0;
    destination = 0u;
    v28 = 0u;
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (!Mutable)
      goto LABEL_36;
    v12 = Mutable;
    if (!a3 || CMBlockBufferGetDataLength(a3) != 40)
    {
      valuePtr = FigSignalErrorAt();
      goto LABEL_16;
    }
    valuePtr = CMBlockBufferCopyDataBytes(a3, 0, 0x28uLL, &destination);
    if (valuePtr)
      goto LABEL_16;
    if (memcmp(&destination, (const void *)(v5 + 56), 0x28uLL))
    {
      v21 = *(OpaqueAudioComponentInstance **)(v5 + 48);
      if (v21)
      {
        valuePtr = AudioUnitSetProperty(v21, 8u, 1u, 0, &destination, 0x28u);
        if (valuePtr)
          goto LABEL_16;
      }
      v22 = v28;
      *(_OWORD *)(v5 + 56) = destination;
      *(_OWORD *)(v5 + 72) = v22;
      *(_QWORD *)(v5 + 88) = v29;
    }
    *(_QWORD *)(v5 + 176) = *(_QWORD *)(v5 + 56);
    if (*(_QWORD *)(v5 + 48))
    {
      v23 = _FigNeroPlayServerCopyAudioProperty(v5, 0x73726E64u);
      if (v23)
      {
        v24 = v23;
        CFDictionarySetValue(v12, CFSTR("PreferredAudioChannelLayout"), v23);
        CFRelease(v24);
      }
      v25 = _FigNeroPlayServerCopyAudioProperty(v5, 0x73726464u);
      if (v25)
      {
        v26 = v25;
        CFDictionarySetValue(v12, CFSTR("DefaultAudioChannelLayout"), v25);
        CFRelease(v26);
      }
    }
LABEL_16:
    v13 = CFNumberCreate(v10, kCFNumberSInt32Type, &valuePtr);
    CFDictionarySetValue(v12, CFSTR("Error"), v13);
    CFRelease(v13);
    valuePtr = FigRemote_CreateSerializedAtomDataBlockBufferForCFType();
    CFRelease(v12);
    if (!valuePtr)
      goto LABEL_35;
    goto LABEL_36;
  }
  if (a2 != 1936418167)
  {
    if (a2 == 1937010544)
      _FigNeroPlayServerStopAudio(v5);
    goto LABEL_35;
  }
  if (!FigCreateBlockBufferCopyingMemoryBlock())
LABEL_35:
    FigCreateBlockBufferCopyingMemoryBlock();
LABEL_36:
  (*(void (**)(uint64_t))(a4 + 16))(a4);
}

@end
