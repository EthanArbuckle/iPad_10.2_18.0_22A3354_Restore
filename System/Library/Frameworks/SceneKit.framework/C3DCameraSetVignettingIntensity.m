@implementation C3DCameraSetVignettingIntensity

float __C3DCameraSetVignettingIntensity_block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 480) = result;
  return result;
}

@end
