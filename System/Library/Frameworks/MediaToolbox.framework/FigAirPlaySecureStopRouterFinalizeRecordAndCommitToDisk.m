@implementation FigAirPlaySecureStopRouterFinalizeRecordAndCommitToDisk

void __FigAirPlaySecureStopRouterFinalizeRecordAndCommitToDisk_block_invoke(uint64_t a1)
{
  const void *Value;
  CFTypeRef v3;
  const void *v4;
  const void *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(const void *, const void *, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t);
  int v17;
  CFTypeRef cf;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("record"));
  cf = 0;
  if (!Value)
  {
    v7 = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSignalErrorAt();
    goto LABEL_14;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSecureStopRecordCreateFromSerializedData(Value, &cf);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
LABEL_10:
    v7 = 0;
    goto LABEL_14;
  }
  v3 = cf;
  v4 = (const void *)*((_QWORD *)cf + 7);
  if (v4)
  {
    v5 = CFDictionaryGetValue((CFDictionaryRef)sAirPlayManagerSingletonContext_0, *((const void **)cf + 7));
    if (v5)
    {
      v6 = (const __CFDictionary *)CFRetain(v5);
      v7 = v6;
      if (v6)
      {
        v8 = CFDictionaryGetValue(v6, CFSTR("FigAirPlaySSM_SecureStopManager"));
        if (v8)
        {
          v9 = v8;
          v10 = CFDictionaryGetValue(v7, CFSTR("FigAirPlaySSM_AppID"));
          if (v10)
          {
            v11 = v10;
            v12 = *((_QWORD *)cf + 6);
            v13 = *((_QWORD *)cf + 7);
            v14 = *((_QWORD *)cf + 2);
            v15 = *((_QWORD *)cf + 3);
            v16 = *(uint64_t (**)(const void *, const void *, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
            v17 = v16 ? v16(v9, v11, v12, v13, 0, v14, v15) : -12782;
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v17;
            if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
              CFDictionaryRemoveValue((CFMutableDictionaryRef)sAirPlayManagerSingletonContext_0, v4);
          }
        }
      }
LABEL_14:
      v3 = cf;
      if (!cf)
        goto LABEL_16;
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  v7 = 0;
LABEL_15:
  CFRelease(v3);
LABEL_16:
  if (v7)
    CFRelease(v7);
}

@end
