@implementation IPMonitorControlSetInterfacePrimaryRank

void __IPMonitorControlSetInterfacePrimaryRank_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  int v4;
  __CFDictionary *v5;
  const void *v6;
  CFNumberRef v7;
  int valuePtr;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(const void **)(a1 + 40);
  v4 = *(_DWORD *)(a1 + 48);
  valuePtr = v4;
  v5 = *(__CFDictionary **)(v3 + 32);
  if (!v5)
  {
    if (!v4)
      goto LABEL_9;
    *(_QWORD *)(v3 + 32) = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
LABEL_8:
    v7 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 32), v2, v7);
    CFRelease(v7);
    goto LABEL_9;
  }
  if (v4)
    goto LABEL_8;
  CFDictionaryRemoveValue(v5, v2);
  if (!CFDictionaryGetCount(*(CFDictionaryRef *)(v3 + 32)))
  {
    v6 = *(const void **)(v3 + 32);
    if (v6)
    {
      CFRelease(v6);
      *(_QWORD *)(v3 + 32) = 0;
    }
  }
LABEL_9:
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
