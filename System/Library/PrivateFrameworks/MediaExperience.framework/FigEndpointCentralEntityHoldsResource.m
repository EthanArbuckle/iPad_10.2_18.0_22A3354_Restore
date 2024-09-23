@implementation FigEndpointCentralEntityHoldsResource

uint64_t __FigEndpointCentralEntityHoldsResource_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = _FigEndpointCentralEntityHoldsResource(a1[5], a1[6], a1[7]);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
