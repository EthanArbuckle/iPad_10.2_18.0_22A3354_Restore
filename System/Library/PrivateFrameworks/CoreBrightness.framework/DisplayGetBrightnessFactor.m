@implementation DisplayGetBrightnessFactor

float ___DisplayGetBrightnessFactor_block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(a1 + 40) + 348);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
