@implementation DisplayGetRestrictionFactorForNits

float __DisplayGetRestrictionFactorForNits_block_invoke(uint64_t a1)
{
  float result;
  float v2;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
    v2 = *(float *)(*(_QWORD *)(a1 + 40) + 1320);
  else
    v2 = *(float *)(*(_QWORD *)(a1 + 40) + 1312);
  result = v2;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  return result;
}

@end
