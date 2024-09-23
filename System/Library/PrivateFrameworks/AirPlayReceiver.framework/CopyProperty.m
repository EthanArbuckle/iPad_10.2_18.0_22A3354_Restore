@implementation CopyProperty

NSObject **__sharedUI_CopyProperty_block_invoke(uint64_t a1)
{
  NSObject **result;

  result = AirPlayReceiverUI_CopyProperty(**(_QWORD **)(a1 + 48), *(_QWORD *)(a1 + 56), 0, (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  **(_QWORD **)(a1 + 40) = result;
  return result;
}

@end
