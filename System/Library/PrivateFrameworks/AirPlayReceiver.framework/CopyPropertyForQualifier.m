@implementation CopyPropertyForQualifier

NSObject **__sharedUI_CopyPropertyForQualifier_block_invoke(uint64_t a1)
{
  NSObject **result;

  result = AirPlayReceiverUI_CopyProperty(**(_QWORD **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), (int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  **(_QWORD **)(a1 + 40) = result;
  return result;
}

@end
