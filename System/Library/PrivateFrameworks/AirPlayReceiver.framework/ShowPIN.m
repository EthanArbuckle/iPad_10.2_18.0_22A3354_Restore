@implementation ShowPIN

uint64_t __sharedUI_ShowPIN_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AirPlayReceiverUI_EnsurePINVisible(**(_QWORD **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
