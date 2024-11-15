@implementation AddToPlayQueue

void __playerairplay_AddToPlayQueue_block_invoke(uint64_t a1)
{
  int v2;
  BOOL v3;
  uint64_t v4;
  const void *v5;
  const void *v6;
  const void *v7;

  if (!**(_BYTE **)(a1 + 32))
  {
    v2 = pap_AirPlayState(*(const void **)(a1 + 40));
    if (v2)
      v3 = v2 == 10;
    else
      v3 = 1;
    if (v3
      || (v4 = *(_QWORD *)(a1 + 32), *(_DWORD *)(v4 + 232) == 11)
      && *(float *)(v4 + 48) == 0.0
      && !playerairplay_isPrimaryForNativeInterstitialsInAPVPlayback())
    {
      playerairplay_addItemToSubPlayerPlayQueue(*(const void **)(a1 + 40), *(const void **)(a1 + 48), *(const void **)(a1 + 56));
    }
    else
    {
      playerairplay_addItemToLocalPlayQueue(*(const void **)(a1 + 40), *(const void **)(a1 + 48), *(const void **)(a1 + 56));
    }
  }
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 48);
  if (v6)
    CFRelease(v6);
  v7 = *(const void **)(a1 + 56);
  if (v7)
    CFRelease(v7);
}

@end
