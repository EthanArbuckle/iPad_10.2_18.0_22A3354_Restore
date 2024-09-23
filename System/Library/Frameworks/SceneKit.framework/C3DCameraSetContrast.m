@implementation C3DCameraSetContrast

float __C3DCameraSetContrast_block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(a1 + 40);
  *(float *)(*(_QWORD *)(a1 + 32) + 460) = result;
  return result;
}

@end
