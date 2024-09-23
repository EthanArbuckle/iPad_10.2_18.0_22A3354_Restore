@implementation PlaybackSessionSeekToDate

void __pap_PlaybackSessionSeekToDate_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  _QWORD *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, __CFDictionary *, void (*)(const void *, int, uint64_t *), _QWORD *);

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v4 = Mutable;
  if (!*(_BYTE *)DerivedStorage)
  {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA3EA8], *(const void **)(*(_QWORD *)(a1 + 40) + 80));
    if (pap_ShouldUseInterstitialQueuing())
      CFDictionaryAddValue(v4, (const void *)*MEMORY[0x1E0CA3D70], (const void *)*MEMORY[0x1E0C9AE50]);
    v5 = malloc_type_calloc(1uLL, 0x40uLL, 0x10600403C78B70CuLL);
    v6 = *(const void **)(a1 + 48);
    *v5 = v6;
    if (v6)
      CFRetain(v6);
    v7 = *(const void **)(DerivedStorage + 280);
    v5[2] = v7;
    if (v7)
      CFRetain(v7);
    v8 = *(const void **)(a1 + 56);
    v5[1] = v8;
    if (v8)
      CFRetain(v8);
    *((_DWORD *)v5 + 6) = *(_DWORD *)(a1 + 72);
    *((_BYTE *)v5 + 28) = *(_DWORD *)(a1 + 72) != 0;
    v9 = MEMORY[0x1E0CA2E18];
    *((_OWORD *)v5 + 2) = *MEMORY[0x1E0CA2E18];
    v5[6] = *(_QWORD *)(v9 + 16);
    v10 = *(_QWORD *)(DerivedStorage + 280);
    v11 = *(_QWORD *)(a1 + 64);
    v12 = *(void (**)(uint64_t, uint64_t, __CFDictionary *, void (*)(const void *, int, uint64_t *), _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
    if (v12)
      v12(v10, v11, v4, pap_playbackSessionSeekCompletion, v5);
  }
  if (v4)
    CFRelease(v4);
}

@end
