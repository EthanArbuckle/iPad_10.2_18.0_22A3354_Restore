@implementation DrawAbsoluteAnimationFrameWithOperation

unint64_t __DrawAbsoluteAnimationFrameWithOperation_block_invoke(uint64_t a1, uint64_t a2)
{
  return vcvtmd_s64_f64(fmod(*(long double *)(a1 + 32), (double)a2));
}

@end
