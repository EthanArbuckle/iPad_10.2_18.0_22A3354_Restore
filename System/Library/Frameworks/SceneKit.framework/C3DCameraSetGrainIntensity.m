@implementation C3DCameraSetGrainIntensity

float __C3DCameraSetGrainIntensity_block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 464) = result;
  return result;
}

@end
