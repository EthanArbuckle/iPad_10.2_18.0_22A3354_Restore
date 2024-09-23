@implementation SecTrustSetPinningException

uint64_t __SecTrustSetPinningException_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = SecTrustRemoveOptionInPolicies(*(const void **)(*(_QWORD *)(a1 + 40) + 32), CFSTR("PinningRequired"));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
