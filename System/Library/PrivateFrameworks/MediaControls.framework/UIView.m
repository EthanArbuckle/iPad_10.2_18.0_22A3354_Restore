@implementation UIView

uint64_t __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1966084, *(_QWORD *)(a1 + 32), *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke(uint64_t a1)
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1966083, *(_QWORD *)(a1 + 32), *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  CAFrameRateRange v4;

  v2 = (void *)MEMORY[0x1E0DC3F10];
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1966084, *(_QWORD *)(a1 + 32), *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __68__UIView_MRUAnimations__mru_animateUsingType_animations_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
