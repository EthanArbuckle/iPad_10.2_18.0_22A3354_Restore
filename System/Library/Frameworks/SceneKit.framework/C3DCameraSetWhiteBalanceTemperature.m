@implementation C3DCameraSetWhiteBalanceTemperature

float __C3DCameraSetWhiteBalanceTemperature_block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 484) = result;
  return result;
}

@end
