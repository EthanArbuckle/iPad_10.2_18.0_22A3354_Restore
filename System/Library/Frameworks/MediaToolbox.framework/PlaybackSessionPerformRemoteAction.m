@implementation PlaybackSessionPerformRemoteAction

uint64_t __pap_PlaybackSessionPerformRemoteAction_block_invoke(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (pap_ShouldUseInterstitialQueuing())
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 48), (const void *)*MEMORY[0x1E0CA3D70], (const void *)*MEMORY[0x1E0C9AE50]);
  v3 = *(_QWORD *)(DerivedStorage + 280);
  v5 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  result = CMBaseObjectGetVTable();
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(result + 16) + 112);
  if (v9)
    return v9(v3, v4, v5, v7, v6);
  return result;
}

@end
