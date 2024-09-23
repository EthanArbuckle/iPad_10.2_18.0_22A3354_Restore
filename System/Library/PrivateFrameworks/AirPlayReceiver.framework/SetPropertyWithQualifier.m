@implementation SetPropertyWithQualifier

uint64_t __sharedUI_SetPropertyWithQualifier_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AirPlayReceiverUI_SetProperty(**(_QWORD **)(a1 + 40), *(CFStringRef *)(a1 + 48), *(_QWORD *)(a1 + 56), *(const void **)(a1 + 64));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
