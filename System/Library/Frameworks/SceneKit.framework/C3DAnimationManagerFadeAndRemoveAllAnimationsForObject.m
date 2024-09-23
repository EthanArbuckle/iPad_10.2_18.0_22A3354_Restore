@implementation C3DAnimationManagerFadeAndRemoveAllAnimationsForObject

void __C3DAnimationManagerFadeAndRemoveAllAnimationsForObject_block_invoke(uint64_t a1, uint64_t a2, CFTimeInterval *a3)
{
  double v5;

  a3[11] = CACurrentMediaTime();
  a3[12] = CACurrentMediaTime();
  v5 = *(double *)(a1 + 32);
  if (v5 < 0.0001)
    v5 = 0.0001;
  a3[13] = v5;
}

@end
