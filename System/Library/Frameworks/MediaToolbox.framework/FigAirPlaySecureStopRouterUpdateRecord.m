@implementation FigAirPlaySecureStopRouterUpdateRecord

void __FigAirPlaySecureStopRouterUpdateRecord_block_invoke(uint64_t a1)
{
  const __CFDictionary *Value;
  __CFDictionary *MutableCopy;
  __CFDictionary *v4;

  Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)sAirPlayManagerSingletonContext_0, *(const void **)(a1 + 40));
  if (Value)
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, Value);
    if (MutableCopy)
    {
      v4 = MutableCopy;
      CFDictionarySetValue(MutableCopy, CFSTR("FigAirPlaySSM_AppID"), *(const void **)(a1 + 48));
      CFDictionarySetValue(v4, CFSTR("FigAirPlaySSM_AssetID"), *(const void **)(a1 + 56));
      CFDictionarySetValue(v4, CFSTR("FigAirPlaySSM_SessionLifespanSPC"), *(const void **)(a1 + 64));
      CFDictionarySetValue((CFMutableDictionaryRef)sAirPlayManagerSingletonContext_0, *(const void **)(a1 + 40), v4);
      CFRelease(v4);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSignalErrorAt();
    }
  }
}

@end
