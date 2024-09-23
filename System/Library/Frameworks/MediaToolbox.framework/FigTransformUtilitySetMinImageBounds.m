@implementation FigTransformUtilitySetMinImageBounds

uint64x2_t __FigTransformUtilitySetMinImageBounds_block_invoke(uint64_t a1)
{
  uint64x2_t result;

  __asm { FMOV            V1.2D, #0.5 }
  result = vcvtq_u64_f64(vaddq_f64(*(float64x2_t *)(a1 + 40), _Q1));
  *(uint64x2_t *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

@end
