@implementation C3DCameraSetVignettingPower

float __C3DCameraSetVignettingPower_block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 476) = result;
  return result;
}

@end
