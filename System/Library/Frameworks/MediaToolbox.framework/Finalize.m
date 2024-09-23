@implementation Finalize

void __figPlaybackCoordinator_Finalize_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  const void *v5;
  const void *v6;
  const void *v7;

  v2 = a1[4];
  v3 = a1[5];
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 136);
  if (v4)
    v4(v2, v3);
  v5 = (const void *)a1[4];
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[6];
  if (v6)
    CFRelease(v6);
  v7 = (const void *)a1[5];
  if (v7)
    CFRelease(v7);
}

uint64_t __audioSessionAVAudioSession_Finalize_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(**(id **)(a1 + 32), "removeObserverForType:observer:name:", 2, a3, a2);
}

@end
