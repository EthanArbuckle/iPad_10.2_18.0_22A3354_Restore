@implementation PlaybackSessionSetRate

void __pap_PlaybackSessionSetRate_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  _QWORD *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  int v8;
  __CFDictionary *Mutable;
  uint64_t v10;
  float v11;
  void (*v12)(uint64_t, __CFDictionary *, void (*)(int, uint64_t *), _QWORD *, float);

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = CMBaseObjectGetDerivedStorage();
  v4 = malloc_type_calloc(1uLL, 0x28uLL, 0x10600408834611BuLL);
  v5 = *(const void **)(a1 + 40);
  *v4 = v5;
  if (v5)
    CFRetain(v5);
  v6 = *(const void **)(DerivedStorage + 280);
  v4[1] = v6;
  if (v6)
    CFRetain(v6);
  *((_DWORD *)v4 + 4) = *(_DWORD *)(a1 + 56);
  v7 = *(const void **)(a1 + 48);
  v4[3] = v7;
  v8 = *(_DWORD *)(v3 + 52);
  *(_DWORD *)(v3 + 52) = v8 + 1;
  *((_DWORD *)v4 + 8) = v8;
  if (v7)
    CFRetain(v7);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (pap_ShouldUseInterstitialQueuing())
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA3D70], (const void *)*MEMORY[0x1E0C9AE50]);
  if (*(_BYTE *)(a1 + 108))
  {
    FigCFDictionarySetCMTime();
    FigCFDictionarySetCMTime();
  }
  v10 = *(_QWORD *)(DerivedStorage + 280);
  v11 = *(float *)(a1 + 56);
  v12 = *(void (**)(uint64_t, __CFDictionary *, void (*)(int, uint64_t *), _QWORD *, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
  if (v12)
    v12(v10, Mutable, pap_playbackSessionSetRateCompletion, v4, v11);
  if (Mutable)
    CFRelease(Mutable);
}

@end
