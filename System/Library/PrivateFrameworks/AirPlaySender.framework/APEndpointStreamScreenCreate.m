@implementation APEndpointStreamScreenCreate

void __APEndpointStreamScreenCreate_block_invoke()
{
  uint64_t DerivedStorage;
  const __CFAllocator *v1;
  uint64_t CMBaseObject;
  void (*v3)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *);
  uint64_t Shared;
  NSObject *v5;
  const __CFDictionary *v6;
  const __CFArray *v7;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v9;
  const void *Value;
  const void *v11;
  const void *v12;
  CFIndex Count;
  CFIndex v14;
  uint64_t v15;
  const void *ValueAtIndex;
  unsigned int *v17;
  unsigned int v18;
  CMTimeEpoch v19;
  CMTimeEpoch v20;
  const void *v21;
  _QWORD block[7];
  _QWORD v23[3];
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  CFTypeRef v29;
  CFTypeRef cf;
  CMSampleTimingInfo sampleTimingArray;
  CMSampleBufferRef v32;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v32 = 0;
  memset(&sampleTimingArray, 0, sizeof(sampleTimingArray));
  v29 = 0;
  cf = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2000000000;
  v24 = 0;
  if (gLogCategory_APEndpointStreamScreen <= 30
    && (gLogCategory_APEndpointStreamScreen != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_QWORD *)(DerivedStorage + 136))
  {
    v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CMBaseObject = FigTransportStreamGetCMBaseObject();
    v3 = *(void (**)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 48);
    if (v3)
      v3(CMBaseObject, *MEMORY[0x1E0CF1FA0], v1, &cf);
    if (*(_BYTE *)(DerivedStorage + 948) || *(_DWORD *)(DerivedStorage + 944))
    {
      Shared = APSenderStatsCollectorGetShared();
      APSenderStatsCollectorCopySystemStats(Shared, (uint64_t)&v29);
    }
    v5 = *(NSObject **)(DerivedStorage + 480);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __screenstream_statsTimerFired_block_invoke;
    block[3] = &unk_1E82708C8;
    block[4] = v23;
    block[5] = &v25;
    block[6] = DerivedStorage;
    dispatch_sync(v5, block);
    v6 = (const __CFDictionary *)cf;
    v7 = (const __CFArray *)v26[3];
    if (v29)
      MutableCopy = CFDictionaryCreateMutableCopy(v1, 0, (CFDictionaryRef)v29);
    else
      MutableCopy = CFDictionaryCreateMutable(v1, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v9 = MutableCopy;
    if (v6)
    {
      Value = CFDictionaryGetValue(v6, (const void *)*MEMORY[0x1E0CF1F08]);
      if (Value)
        CFDictionarySetValue(v9, CFSTR("txCapacityAvg"), Value);
      v11 = CFDictionaryGetValue(v6, (const void *)*MEMORY[0x1E0CF1EF8]);
      if (v11)
        CFDictionarySetValue(v9, CFSTR("lossAvg"), v11);
      v12 = CFDictionaryGetValue(v6, (const void *)*MEMORY[0x1E0CF1F00]);
      if (v12)
        CFDictionarySetValue(v9, CFSTR("rttAvg"), v12);
    }
    if (v7)
    {
      Count = CFArrayGetCount(v7);
      if (Count >= 1)
      {
        v14 = 0;
        if (Count >= 7)
          v15 = 7;
        else
          v15 = Count;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v7, v14);
          CFDictionarySetValue(v9, screenstream_createCombinedStats_fpsKeys[v14++], ValueAtIndex);
        }
        while (v15 != v14);
      }
    }
    FigCFDictionarySetInt32();
    if (CFDictionaryGetInt64() >= 1)
    {
      v17 = (unsigned int *)(DerivedStorage + 1176);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 + 1, v17));
    }
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E68];
    v19 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value = *MEMORY[0x1E0CA2E18];
    v20 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    sampleTimingArray.duration.epoch = v19;
    sampleTimingArray.presentationTimeStamp.epoch = v20;
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = *(_OWORD *)&sampleTimingArray.presentationTimeStamp.value;
    sampleTimingArray.decodeTimeStamp.epoch = v20;
    if (CMSampleBufferCreate(v1, 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, &v32))
    {
      APSLogErrorAt();
    }
    else
    {
      CMSetAttachment(v32, CFSTR("APStats"), v9, 0);
      CMBufferQueueEnqueue(*(CMBufferQueueRef *)(DerivedStorage + 104), v32);
    }
  }
  else
  {
    APSLogErrorAt();
    v9 = 0;
  }
  if (v32)
    CFRelease(v32);
  if (v9)
    CFRelease(v9);
  if (cf)
    CFRelease(cf);
  if (v29)
    CFRelease(v29);
  v21 = (const void *)v26[3];
  if (v21)
    CFRelease(v21);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
}

@end
