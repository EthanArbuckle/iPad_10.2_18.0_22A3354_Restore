@implementation RequestCGImageAtTimeAsync

CFTypeRef __surrogateAIG_RequestCGImageAtTimeAsync_block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 40) + 24);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __surrogateAIG_RequestCGImageAtTimeAsync_block_invoke_2(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  const __CFDictionary *v4;
  const void *Value;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v7;
  const void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(uint64_t, __int128 *, uint64_t, uint64_t);
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 40))
    goto LABEL_3;
  v3 = DerivedStorage;
  if (surrogateAIG_EnsureSubGeneratorCreated(*(const void **)(a1 + 32)))
    goto LABEL_3;
  v10 = *(_QWORD *)(v3 + 24);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 48);
  v14 = *(_OWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 72);
  v13 = *(unsigned int (**)(uint64_t, __int128 *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 16);
  if (!v13 || (v16 = v14, v17 = v15, v13(v10, &v16, v11, v12)))
  {
LABEL_3:
    v4 = *(const __CFDictionary **)(a1 + 40);
    if (v4)
      Value = CFDictionaryGetValue(v4, CFSTR("RequestID"));
    else
      Value = 0;
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (Mutable)
    {
      v7 = Mutable;
      FigCFDictionarySetInt32();
      if (Value)
        CFDictionarySetValue(v7, CFSTR("RequestID"), Value);
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
      CFRelease(v7);
    }
    else
    {
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterPostNotification();
    }
  }
  v8 = *(const void **)(a1 + 48);
  if (v8)
    CFRelease(v8);
  v9 = *(const void **)(a1 + 40);
  if (v9)
    CFRelease(v9);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
