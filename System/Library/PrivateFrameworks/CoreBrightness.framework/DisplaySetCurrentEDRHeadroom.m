@implementation DisplaySetCurrentEDRHeadroom

float __DisplaySetCurrentEDRHeadroom_block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 12628) = result;
  return result;
}

@end
