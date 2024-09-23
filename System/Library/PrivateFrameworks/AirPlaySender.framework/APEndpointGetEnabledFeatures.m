@implementation APEndpointGetEnabledFeatures

uint64_t __APEndpointGetEnabledFeatures_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = APEndpointGetFeatureFromStreamType(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

@end
