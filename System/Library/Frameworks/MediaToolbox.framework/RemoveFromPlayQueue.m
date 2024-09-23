@implementation RemoveFromPlayQueue

void __playerairplay_RemoveFromPlayQueue_block_invoke(uint64_t a1)
{
  int v2;
  BOOL v3;
  const void *v4;
  const void *v5;

  if (!**(_BYTE **)(a1 + 32))
  {
    v2 = pap_AirPlayState(*(const void **)(a1 + 40));
    if (v2)
      v3 = v2 == 10;
    else
      v3 = 1;
    if (!v3)
      playerairplay_removeItemFromLocalPlayQueue(*(const void **)(a1 + 40), *(const void **)(a1 + 48));
    playerairplay_removeItemFromSubPlayerPlayQueue(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48));
  }
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 48);
  if (v5)
    CFRelease(v5);
}

@end
