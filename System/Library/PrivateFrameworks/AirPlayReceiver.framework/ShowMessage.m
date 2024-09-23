@implementation ShowMessage

uint64_t __sharedUI_ShowMessage_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AirPlayReceiverUI_UpdateStatus(**(_QWORD **)(a1 + 40), *(_DWORD *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
