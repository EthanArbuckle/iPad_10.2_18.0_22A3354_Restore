@implementation StartVideoPlaybackV1

uint64_t __sharedUI_StartVideoPlaybackV1_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AirPlayReceiverUI_StartVideo(**(_QWORD **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(CFDictionaryRef *)(a1 + 64), *(CFMutableDictionaryRef **)(a1 + 72));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
