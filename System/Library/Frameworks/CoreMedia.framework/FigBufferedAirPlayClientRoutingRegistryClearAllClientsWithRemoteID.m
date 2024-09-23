@implementation FigBufferedAirPlayClientRoutingRegistryClearAllClientsWithRemoteID

void __FigBufferedAirPlayClientRoutingRegistryClearAllClientsWithRemoteID_block_invoke(_QWORD *a1, const void *a2, const __CFDictionary *a3)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v7;
  _QWORD v8[6];

  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  v7 = Mutable;
  if (a3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 0x40000000;
    v8[2] = __FigBufferedAirPlayClientRoutingRegistryClearAllClientsWithRemoteID_block_invoke_2;
    v8[3] = &__block_descriptor_tmp_5;
    v8[4] = a1[5];
    v8[5] = Mutable;
    FigCFDictionaryApplyBlock(a3, v8);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1[6] + 24), a2, v7);
    if (!v7)
      return;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = -17721;
    if (!Mutable)
      return;
  }
  CFRelease(v7);
}

void __FigBufferedAirPlayClientRoutingRegistryClearAllClientsWithRemoteID_block_invoke_2(uint64_t a1, const void *a2, const void *a3)
{
  if (*(const void **)(a1 + 32) != a3)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), a2, a3);
}

@end
