@implementation Invalidate

void __remoteXPCItem_Invalidate_block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 192);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = 0;
  }
}

uint64_t __playerairplay_Invalidate_block_invoke()
{
  return playerairplay_removeFigAudioSessionNotificationHandlers();
}

void __playerairplay_Invalidate_block_invoke_6(uint64_t a1)
{
  playerairplay_resetAirPlayRouteInformation(*(const void **)(a1 + 32));
}

void __playerairplay_Invalidate_block_invoke_7(uint64_t a1)
{
  pap_setAirPlayState(*(const void **)(a1 + 32), 0);
  playerairplay_removeAndCleanupQueuedItemsOnAirPlayController();
}

void __itemairplay_Invalidate_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  if (!**(_BYTE **)(a1 + 32))
    playerairplay_removeQueuedItemUUIDStringOnAirPlayController(*(const void **)(a1 + 40), *(const void **)(a1 + 48));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

void __videoQueueRemote_Invalidate_block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 112);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
  }
}

void __videoQueueRemote_Invalidate_block_invoke_2(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 128);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
  }
}

_QWORD *__surrogateAIG_Invalidate_block_invoke(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = result[5];
  if (!*(_BYTE *)(v1 + 40))
  {
    v2 = result;
    result = *(_QWORD **)(v1 + 24);
    if (result)
      result = CFRetain(result);
    *(_QWORD *)(*(_QWORD *)(v2[4] + 8) + 24) = result;
    *(_BYTE *)(v2[5] + 40) = 1;
  }
  return result;
}

uint64_t __octrp_Invalidate_block_invoke()
{
  return NeroTransportUnregisterObject();
}

@end
