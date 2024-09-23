@implementation PlaybackSessionRemovePlayQueueItem

void __pap_PlaybackSessionRemovePlayQueueItem_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  __CFDictionary *Mutable;
  uint64_t v4;
  void (*v5)(uint64_t, __CFDictionary *, _QWORD, _QWORD);

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA3EA8], *(const void **)(a1 + 40));
  if (pap_ShouldUseInterstitialQueuing())
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA3D70], (const void *)*MEMORY[0x1E0C9AE50]);
  v4 = *(_QWORD *)(DerivedStorage + 280);
  v5 = *(void (**)(uint64_t, __CFDictionary *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                        + 40);
  if (v5)
    v5(v4, Mutable, 0, 0);
  if (Mutable)
    CFRelease(Mutable);
}

@end
