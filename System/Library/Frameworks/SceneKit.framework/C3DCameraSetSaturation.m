@implementation C3DCameraSetSaturation

float __C3DCameraSetSaturation_block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 456) = result;
  return result;
}

@end
