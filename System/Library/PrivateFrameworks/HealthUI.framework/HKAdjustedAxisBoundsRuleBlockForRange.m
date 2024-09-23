@implementation HKAdjustedAxisBoundsRuleBlockForRange

void *__HKAdjustedAxisBoundsRuleBlockForRange_block_invoke(double a1, double a2)
{
  double v2;
  _QWORD v4[8];

  v2 = a1 + (a2 - a1) * 0.122302158;
  v4[0] = MEMORY[0x1E0C809B0];
  if (a1 <= 0.0)
    v2 = a1;
  v4[1] = 3221225472;
  v4[2] = __HKAdjustedAxisBoundsRuleBlockForRange_block_invoke_2;
  v4[3] = &__block_descriptor_64_e19_B40__0d8d16_d24_d32l;
  *(double *)&v4[4] = v2;
  *(double *)&v4[5] = a1 + (a2 - a1) * 0.877697842;
  *(double *)&v4[6] = a1;
  *(double *)&v4[7] = a2;
  return _Block_copy(v4);
}

uint64_t __HKAdjustedAxisBoundsRuleBlockForRange_block_invoke_2(uint64_t a1, _QWORD *a2, _QWORD *a3, double a4, double a5)
{
  if (*(double *)(a1 + 32) > a4 || *(double *)(a1 + 40) < a5)
    return 0;
  if (a2)
    *a2 = *(_QWORD *)(a1 + 48);
  if (a3)
    *a3 = *(_QWORD *)(a1 + 56);
  return 1;
}

@end
