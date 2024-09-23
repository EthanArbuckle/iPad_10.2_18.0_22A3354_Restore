@implementation DisplayGetCurrentRTPLCHeadroomCap

float __DisplayGetCurrentRTPLCHeadroomCap_block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 40) + 12676);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
