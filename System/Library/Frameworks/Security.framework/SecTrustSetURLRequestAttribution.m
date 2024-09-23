@implementation SecTrustSetURLRequestAttribution

uint64_t __SecTrustSetURLRequestAttribution_block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 152) = *(_QWORD *)(result + 40);
  return result;
}

@end
