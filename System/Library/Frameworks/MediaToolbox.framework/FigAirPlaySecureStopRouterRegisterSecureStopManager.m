@implementation FigAirPlaySecureStopRouterRegisterSecureStopManager

void __FigAirPlaySecureStopRouterRegisterSecureStopManager_block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;

  if (!CFDictionaryContainsKey((CFDictionaryRef)sAirPlayManagerSingletonContext_0, *(const void **)(a1 + 40)))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (Mutable)
    {
      v3 = Mutable;
      CFDictionarySetValue(Mutable, CFSTR("FigAirPlaySSM_SecureStopManager"), *(const void **)(a1 + 48));
      CFDictionarySetValue((CFMutableDictionaryRef)sAirPlayManagerSingletonContext_0, *(const void **)(a1 + 40), v3);
      CFRelease(v3);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = FigSignalErrorAt();
    }
  }
}

@end
