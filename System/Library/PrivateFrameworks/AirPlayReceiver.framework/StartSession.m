@implementation StartSession

uint64_t __sharedUI_StartSession_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AirPlayReceiverUI_StartAudio(**(_QWORD **)(a1 + 40), *(CFDictionaryRef *)(a1 + 48), *(CFMutableDictionaryRef **)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
