@implementation MFAAAddCertChainDataEntryToCacheForHash

void __MFAAAddCertChainDataEntryToCacheForHash_block_invoke(uint64_t a1)
{
  CFNumberRef v2;
  __CFArray *Mutable;
  __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  size_t v7;
  const void **v8;
  void *v9;
  CFArrayRef *v10;
  uint64_t v11;
  const void *v12;
  const __CFNumber *ValueAtIndex;
  BOOL v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD valuePtr[2];

  valuePtr[1] = *MEMORY[0x24BDAC8D0];
  if (CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 64), *(const void **)(a1 + 48)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = IncrementCertEntryUsageCount(*(_QWORD *)(a1 + 64), *(void **)(a1 + 48));
LABEL_25:
    v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SyncCertCacheContentsToPreferencesFile(*(_QWORD *)(v31 + 56), *(const void **)(v31 + 64));
    return;
  }
  v2 = CFNumberCreate(0, kCFNumberLongType, &_block_invoke_3_kAuthUsageInitialCount);
  Mutable = CFArrayCreateMutable(0, 2, MEMORY[0x24BDBD690]);
  v4 = Mutable;
  if (Mutable)
  {
    CFArraySetValueAtIndex(Mutable, 0, v2);
    CFArraySetValueAtIndex(v4, 1, *(const void **)(a1 + 56));
    Count = CFDictionaryGetCount(*(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 64));
    if (Count >= 16)
    {
      v6 = Count;
      v7 = 8 * Count;
      MEMORY[0x24BDAC7A8](Count);
      v8 = (const void **)((char *)valuePtr - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
      v9 = memset(v8, 170, v7);
      MEMORY[0x24BDAC7A8](v9);
      v10 = (CFArrayRef *)v8;
      memset(v8, 170, v7);
      valuePtr[0] = 0xAAAAAAAAAAAAAAAALL;
      CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 64), v8, v8);
      v11 = 0;
      v12 = 0;
      do
      {
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*v10, 0);
        valuePtr[0] = 0;
        if (CFNumberGetValue(ValueAtIndex, kCFNumberLongType, valuePtr))
          v14 = valuePtr[0] < 1;
        else
          v14 = 1;
        if (!v14 && (v11 < 1 || valuePtr[0] < v11))
        {
          v12 = *v8;
          v11 = valuePtr[0];
        }
        ++v8;
        ++v10;
        --v6;
      }
      while (v6);
      if (v12)
      {
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 64), v12);
      }
      else
      {
        v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v23)
          __MFAAAddCertDataEntryToCacheForSerialNumber_block_invoke_cold_2(v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 64), *(const void **)(a1 + 48), v4);
  }
  else
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      __MFAAAddCertDataEntryToCacheForSerialNumber_block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  if (v2)
    CFRelease(v2);
  if (v4)
  {
    CFRelease(v4);
    goto LABEL_25;
  }
}

@end
