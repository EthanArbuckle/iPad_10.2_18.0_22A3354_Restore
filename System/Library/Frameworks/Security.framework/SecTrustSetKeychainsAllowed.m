@implementation SecTrustSetKeychainsAllowed

uint64_t __SecTrustSetKeychainsAllowed_block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 117) = *(_BYTE *)(result + 40) != 0;
  return result;
}

@end
