@implementation CoreAudioRampParameterStart

void __CoreAudioRampParameterStart_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  float v4;
  uint64_t v5;

  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(float *)(a1 + 80)
                                                             + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, float))softLinkAudioUnitSetParameter_700[0])(*(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 84), *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 92), 0, *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(_DWORD *)(v2 + 24) + 1;
  *(_DWORD *)(v2 + 24) = v3;
  if (v3 >= *(_DWORD *)(a1 + 96) || *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == *(float *)(a1 + 100))
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
    v4 = *(float *)(a1 + 100);
    if (*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != v4)
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, float))softLinkAudioUnitSetParameter_700[0])(*(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 84), *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 92), 0, v4);
    v5 = *(_QWORD *)(a1 + 32);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
    if (!*(_QWORD *)(a1 + 72))
      dispatch_release(*(dispatch_object_t *)(a1 + 64));
  }
}

@end
