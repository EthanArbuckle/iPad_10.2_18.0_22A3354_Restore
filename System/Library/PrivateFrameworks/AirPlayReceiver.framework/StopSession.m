@implementation StopSession

uint64_t __sharedUI_StopSession_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AirPlayReceiverUI_StopAudio(**(_QWORD **)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
