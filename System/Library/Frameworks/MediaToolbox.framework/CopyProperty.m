@implementation CopyProperty

CFTypeRef __audioRendererAirPlay_CopyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 32);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __audioRendererAirPlay_CopyProperty_block_invoke_2(uint64_t a1)
{
  CFTypeRef *v2;
  CFTypeRef result;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56))
    v2 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  else
    v2 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
  result = CFRetain(*v2);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __audioRendererAirPlay_CopyProperty_block_invoke_3(uint64_t a1)
{
  CFTypeRef *v2;
  CFTypeRef result;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 77))
    v2 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  else
    v2 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
  result = CFRetain(*v2);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

void __videoReceiver_CopyProperty_block_invoke(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  CFIndex v4;
  const __CFDictionary *ValueAtIndex;
  const void *Value;

  v2 = (const __CFArray *)FigCFDictionaryCopyArrayOfValues();
  if (v2)
  {
    v3 = v2;
    if (CFArrayGetCount(v2) >= 1)
    {
      v4 = 0;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v4);
        Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("ImageQueueReceiverKey"));
        CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), Value);
        ++v4;
      }
      while (v4 < CFArrayGetCount(v3));
    }
    CFRelease(v3);
  }
}

const __CFArray *__videoReceiver_CopyProperty_block_invoke_2(uint64_t a1)
{
  CFIndex i;
  const __CFArray *result;
  const void *v4;
  const void *v5;

  for (i = 0; ; ++i)
  {
    result = *(const __CFArray **)(*(_QWORD *)(a1 + 40) + 72);
    if (result)
      result = (const __CFArray *)CFArrayGetCount(result);
    if (i >= (uint64_t)result)
      break;
    CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 40) + 72), i);
    v4 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
    if (v4)
    {
      v5 = v4;
      CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), v4);
      CFRelease(v5);
    }
  }
  return result;
}

CFTypeRef __remoteXPCItem_CopyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 192);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

uint64_t __remoteSampleCursor_CopyProperty_block_invoke()
{
  return FigXPCMessageSetCFString();
}

CFTypeRef __itemairplay_CopyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 576);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 40) = result;
  return result;
}

CFTypeRef __itemairplay_CopyProperty_block_invoke_2(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 624);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFTypeRef __itemairplay_CopyProperty_block_invoke_3(uint64_t a1)
{
  int v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  CFTypeRef result;

  v2 = pap_AirPlayState(*(const void **)(a1 + 40));
  if (v2)
    v3 = v2 == 10;
  else
    v3 = 1;
  if (!v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (!*(_BYTE *)(v4 + 249) && *(float *)(v4 + 48) > 1.0)
    {
      v5 = *(_QWORD *)(a1 + 56);
      if ((*(_BYTE *)(v5 + 508) & 1) != 0)
      {
        result = *(CFTypeRef *)(v5 + 624);
        if (!result)
          goto LABEL_10;
        goto LABEL_9;
      }
    }
  }
  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 56) + 616);
  if (result)
LABEL_9:
    result = CFRetain(result);
LABEL_10:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFTypeRef __itemairplay_CopyProperty_block_invoke_4(uint64_t a1)
{
  CFTypeRef result;

  result = itemairplay_copySelectedMediaArray();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

CFTypeRef __itemairplay_CopyProperty_block_invoke_5(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 832);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __vq_CopyProperty_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFAllocator *v3;
  const void **v4;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, int *);
  BOOL v10;
  __CFString **v11;
  __CFString *v12;
  int v13;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_DWORD *)v2 || (v8 = *(_QWORD *)(v2 + 376)) == 0)
  {
    v3 = *(const __CFAllocator **)(a1 + 56);
    v4 = (const void **)kFigVideoQueueExternalProtectionStatus_Protected;
    v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
LABEL_3:
    result = (uint64_t)CFDictionaryCreate(v3, (const void **)kFigVideoQueueExternalProtectionStatusKey_Video, v4, 1, v5, v6);
    **(_QWORD **)(a1 + 48) = result;
    if (!**(_QWORD **)(a1 + 48))
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12081;
    return result;
  }
  v13 = 0;
  v9 = *(uint64_t (**)(uint64_t, uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v9)
    result = v9(v8, 7, &v13);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v10 = v13 == 1 || v13 == 4;
    v11 = kFigVideoQueueExternalProtectionStatus_Protected;
    if (!v10)
      v11 = kFigVideoQueueExternalProtectionStatus_NotProtected;
    v12 = *v11;
    v3 = *(const __CFAllocator **)(a1 + 56);
    v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
    v4 = (const void **)&v12;
    goto LABEL_3;
  }
  return result;
}

CFTypeRef __videoQueueRemote_CopyProperty_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 112);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

CFTypeRef __videoQueueRemote_CopyProperty_block_invoke_2(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 128);
  if (result)
    result = CFRetain(result);
  **(_QWORD **)(a1 + 32) = result;
  return result;
}

@end
