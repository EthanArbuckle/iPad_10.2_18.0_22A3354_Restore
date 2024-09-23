@implementation SetProperty

uint64_t __audioRendererCentral_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = audioRendererCentral_setFigAudioSession(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __audioRendererCentral_SetProperty_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = audioRendererCentral_setFigAudioSession(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __audioRendererAirPlay_SetProperty_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = audioRendererAirPlay_setRoutingContextAndRemoteDeviceIDInternal(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48), *(const void **)(*(_QWORD *)(a1 + 56) + 32));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __audioRendererAirPlay_SetProperty_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = audioRendererAirPlay_setRoutingContextAndRemoteDeviceIDInternal(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48), *(const void **)(*(_QWORD *)(a1 + 56) + 32));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __audioRendererAirPlay_SetProperty_block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = audioRendererAirPlay_setRoutingContextAndRemoteDeviceIDInternal(*(_QWORD *)(a1 + 40), *(const void **)(*(_QWORD *)(a1 + 48) + 24), *(const void **)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __videoReceiver_SetProperty_block_invoke(uint64_t a1)
{
  const void *Float32;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex v5;
  const __CFDictionary *ValueAtIndex;
  CMTime v7;
  CMTime time;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&v7.value = *(_OWORD *)(a1 + 40);
  v7.epoch = *(_QWORD *)(a1 + 56);
  CMBaseObjectGetDerivedStorage();
  time = v7;
  CMTimeGetSeconds(&time);
  Float32 = (const void *)FigCFNumberCreateFloat32();
  if (dword_1EE2A2D38 >= 2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v3 = (const __CFArray *)FigCFDictionaryCopyArrayOfValues();
  if (v3)
  {
    v4 = v3;
    if (CFArrayGetCount(v3) >= 1)
    {
      v5 = 0;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v5);
        CFDictionaryGetValue(ValueAtIndex, CFSTR("ImageQueueReceiverKey"));
        CAXPCImageQueueReceiverSetProperty();
        ++v5;
      }
      while (v5 < CFArrayGetCount(v4));
    }
    CFRelease(v4);
  }
  if (Float32)
    CFRelease(Float32);
}

void __videoReceiver_SetProperty_block_invoke_2()
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const __CFArray *v1;
  const __CFArray *v2;
  CFIndex v3;
  const __CFDictionary *ValueAtIndex;

  CMBaseObjectGetDerivedStorage();
  if (dword_1EE2A2D38 >= 2)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v1 = (const __CFArray *)FigCFDictionaryCopyArrayOfValues();
  if (v1)
  {
    v2 = v1;
    if (CFArrayGetCount(v1) >= 1)
    {
      v3 = 0;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v3);
        CFDictionaryGetValue(ValueAtIndex, CFSTR("ImageQueueReceiverKey"));
        CAXPCImageQueueReceiverSetDisplayedPixelCount();
        ++v3;
      }
      while (v3 < CFArrayGetCount(v2));
    }
    CFRelease(v2);
  }
}

uint64_t __remoteSampleCursor_SetProperty_block_invoke(uint64_t a1, CMBlockBufferRef theBuffer)
{
  uint64_t result;
  char *v4;
  char *v5;
  size_t v6;
  char *dataPointerOut;

  v6 = 0;
  dataPointerOut = 0;
  result = CMBlockBufferGetDataPointer(theBuffer, 0, &v6, 0, &dataPointerOut);
  if (!(_DWORD)result)
  {
    v4 = dataPointerOut;
    result = 4294949526;
    if ((dataPointerOut & 7) == 0 && v6 > 0x197)
    {
      *((_QWORD *)dataPointerOut + 50) = 0;
      *((_OWORD *)v4 + 23) = 0u;
      *((_OWORD *)v4 + 24) = 0u;
      *((_OWORD *)v4 + 21) = 0u;
      *((_OWORD *)v4 + 22) = 0u;
      *((_OWORD *)v4 + 19) = 0u;
      *((_OWORD *)v4 + 20) = 0u;
      *((_OWORD *)v4 + 17) = 0u;
      *((_OWORD *)v4 + 18) = 0u;
      *((_OWORD *)v4 + 15) = 0u;
      *((_OWORD *)v4 + 16) = 0u;
      *((_OWORD *)v4 + 13) = 0u;
      *((_OWORD *)v4 + 14) = 0u;
      *((_OWORD *)v4 + 11) = 0u;
      *((_OWORD *)v4 + 12) = 0u;
      *((_OWORD *)v4 + 9) = 0u;
      *((_OWORD *)v4 + 10) = 0u;
      *((_OWORD *)v4 + 7) = 0u;
      *((_OWORD *)v4 + 8) = 0u;
      *((_OWORD *)v4 + 5) = 0u;
      *((_OWORD *)v4 + 6) = 0u;
      *((_OWORD *)v4 + 3) = 0u;
      *((_OWORD *)v4 + 4) = 0u;
      *((_OWORD *)v4 + 1) = 0u;
      *((_OWORD *)v4 + 2) = 0u;
      *(_OWORD *)v4 = 0u;
      v5 = dataPointerOut;
      *(_QWORD *)dataPointerOut = *(_QWORD *)(a1 + 32);
      *((_QWORD *)v5 + 1) = 0;
      *((_DWORD *)v5 + 4) = 779314548;
      result = FigInMemorySerializerAppendCFString();
      if (!(_DWORD)result)
        v5[344] = *(_BYTE *)(a1 + 56);
    }
  }
  return result;
}

uint64_t __remoteSampleCursor_SetProperty_block_invoke_2()
{
  return 0;
}

void __vq_SetProperty_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, const __CFString *, uint64_t);

  if (!FigCFEqual())
  {
    v3 = *(_QWORD *)(a1 + 32);
    v2 = *(const void **)(a1 + 40);
    v4 = *(const void **)(v3 + 632);
    *(_QWORD *)(v3 + 632) = v2;
    if (v2)
      CFRetain(v2);
    if (v4)
      CFRelease(v4);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 376);
    if (v6)
    {
      v7 = *(_QWORD *)(v5 + 632);
      v8 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v8)
        v8(v6, CFSTR("DisplayList"), v7);
    }
  }
}

void __surrogateAIG_SetProperty_block_invoke(uint64_t a1)
{
  CFTypeRef v2;
  __CFDictionary *v3;
  const __CFAllocator *v4;

  v2 = *(CFTypeRef *)(*(_QWORD *)(a1 + 48) + 24);
  if (v2)
    v2 = CFRetain(v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v3 = *(__CFDictionary **)(*(_QWORD *)(a1 + 48) + 32);
    if (v3
      || (v4 = CFGetAllocator(*(CFTypeRef *)(a1 + 56)),
          *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32) = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]), (v3 = *(__CFDictionary **)(*(_QWORD *)(a1 + 48) + 32)) != 0))
    {
      CFDictionarySetValue(v3, *(const void **)(a1 + 64), *(const void **)(a1 + 72));
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = FigSignalErrorAt();
    }
  }
}

CFTypeID __fpic_SetProperty_block_invoke(uint64_t a1)
{
  CFTypeID result;
  CFTypeID TypeID;
  const void *v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t DerivedStorage;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  const void *ValueAtIndex;
  CFTypeID v14;

  result = FigCFEqual();
  if ((_DWORD)result)
  {
    if (*(_QWORD *)(a1 + 48))
    {
      TypeID = CFDictionaryGetTypeID();
      result = CFGetTypeID(*(CFTypeRef *)(a1 + 48));
      if (TypeID == result)
      {
        v4 = *(const void **)(a1 + 48);
        v5 = *(_QWORD *)(a1 + 56);
        v6 = *(const void **)(v5 + 1032);
        *(_QWORD *)(v5 + 1032) = v4;
        if (v4)
          CFRetain(v4);
        if (v6)
          CFRelease(v6);
        v8 = *(_QWORD *)(a1 + 64);
        v7 = *(_QWORD *)(a1 + 72);
        DerivedStorage = CMBaseObjectGetDerivedStorage();
        Count = CFArrayGetCount(*(CFArrayRef *)(DerivedStorage + 600));
        if (Count < 1)
        {
LABEL_12:
          result = 0;
        }
        else
        {
          v11 = Count;
          v12 = 0;
          while (1)
          {
            ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(DerivedStorage + 600), v12);
            result = fpic_updateIntegratedTimelineOffsetTimesOnItemForEvent(v8, v7, (uint64_t)ValueAtIndex);
            if ((_DWORD)result)
              break;
            if (v11 == ++v12)
              goto LABEL_12;
          }
        }
        goto LABEL_18;
      }
    }
  }
  else
  {
    result = FigCFEqual();
    if (!(_DWORD)result)
    {
      result = FigSignalErrorAt();
LABEL_18:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
      return result;
    }
    if (*(_QWORD *)(a1 + 48))
    {
      v14 = CFNumberGetTypeID();
      result = CFGetTypeID(*(CFTypeRef *)(a1 + 48));
      if (v14 == result)
      {
        result = FigCFNumberGetSInt32();
        *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1084) = result;
      }
    }
  }
  return result;
}

@end
