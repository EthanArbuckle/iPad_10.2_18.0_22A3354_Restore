@implementation PlaybackSessionSeekToTime

void __pap_PlaybackSessionSeekToTime_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  __CFDictionary *Mutable;
  const void *v4;
  const void *v5;
  int v6;
  float v7;
  _QWORD *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  __int128 *v12;
  const void *v13;
  __int128 v14;
  uint64_t v15;
  void (*v16)(uint64_t, __int128 *, __CFDictionary *, void (*)(const void *, int, uint64_t *), _QWORD *);
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!*(_BYTE *)DerivedStorage)
  {
    itemairplay_clearCoordinatedPlaybackSynchronizationTimebase();
    playerairplay_clearCoordinatedPlaybackSynchronizationTimebaseForItemsAfterItem(*(_QWORD *)(a1 + 32), *(char **)(a1 + 40));
    v4 = *(const void **)(a1 + 32);
    v5 = *(const void **)(a1 + 40);
    v6 = *(_DWORD *)(a1 + 72);
    v7 = *(float *)(DerivedStorage + 48);
    v19 = *(_OWORD *)(a1 + 76);
    v20 = *(_QWORD *)(a1 + 92);
    playerairplay_notifyStartupTasksOfSeek(v4, v5, v6, &v19, v7);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA3EA8], *(const void **)(*(_QWORD *)(a1 + 48) + 80));
    if (pap_ShouldUseInterstitialQueuing())
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CA3D70], (const void *)*MEMORY[0x1E0C9AE50]);
    FigCFDictionarySetValueFromKeyInDict();
    FigCFDictionarySetValueFromKeyInDict();
    FigCFDictionarySetValueFromKeyInDict();
    v8 = malloc_type_calloc(1uLL, 0x40uLL, 0x10600403C78B70CuLL);
    v9 = *(const void **)(a1 + 56);
    *v8 = v9;
    if (v9)
      CFRetain(v9);
    v10 = *(const void **)(DerivedStorage + 280);
    v8[2] = v10;
    if (v10)
      CFRetain(v10);
    v11 = *(const void **)(a1 + 40);
    v8[1] = v11;
    if (v11)
      CFRetain(v11);
    v12 = (__int128 *)(a1 + 76);
    *((_DWORD *)v8 + 6) = *(_DWORD *)(a1 + 72);
    *((_BYTE *)v8 + 28) = *(_BYTE *)(a1 + 100);
    v13 = *(const void **)(a1 + 64);
    v8[7] = v13;
    if (v13)
      CFRetain(v13);
    v14 = *v12;
    v8[6] = *(_QWORD *)(a1 + 92);
    *((_OWORD *)v8 + 2) = v14;
    v15 = *(_QWORD *)(DerivedStorage + 280);
    v17 = *v12;
    v18 = *(_QWORD *)(a1 + 92);
    v16 = *(void (**)(uint64_t, __int128 *, __CFDictionary *, void (*)(const void *, int, uint64_t *), _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
    if (v16)
    {
      v19 = v17;
      v20 = v18;
      v16(v15, &v19, Mutable, pap_playbackSessionSeekCompletion, v8);
    }
  }
  if (Mutable)
    CFRelease(Mutable);
}

@end
