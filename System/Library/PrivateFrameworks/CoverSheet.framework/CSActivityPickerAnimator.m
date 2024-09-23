@implementation CSActivityPickerAnimator

void __47___CSActivityPickerAnimator_animateTransition___block_invoke(uint64_t a1)
{
  void *v2;
  float minimum;
  float maximum;
  float preferred;
  double v6;
  double v7;
  double v8;
  _QWORD v9[4];
  id v10;
  CAFrameRateRange v11;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  minimum = v11.minimum;
  maximum = v11.maximum;
  preferred = v11.preferred;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47___CSActivityPickerAnimator_animateTransition___block_invoke_2;
  v9[3] = &unk_1E8E2DB38;
  v10 = *(id *)(a1 + 32);
  *(float *)&v6 = minimum;
  *(float *)&v7 = maximum;
  *(float *)&v8 = preferred;
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1703937, v9, v6, v7, v8);

}

uint64_t __47___CSActivityPickerAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "__runAlongsideAnimations");
  return result;
}

uint64_t __47___CSActivityPickerAnimator_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

@end
