@implementation StopScreenPresentation

uint64_t __sharedUI_StopScreenPresentation_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AirPlayReceiverUI_StopPresentation(**(_QWORD **)(a1 + 40), *(const __CFDictionary **)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
