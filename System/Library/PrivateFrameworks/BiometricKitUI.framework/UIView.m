@implementation UIView

+ (void)bkui_animateWithDuration:(void *)a3 animations:
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_opt_self();
  +[UIView bkui_animateWithDuration:animations:completion:](a1, v4, v5, 0);

}

+ (void)bkui_animateWithDuration:(void *)a3 animations:(void *)a4 completion:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  _QWORD aBlock[4];
  id v13;
  id v14;
  double v15;
  CAFrameRateRange v16;

  v6 = a3;
  v7 = a4;
  objc_opt_self();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__UIView_BKUI_ANIMATIONS__bkui_animateWithDuration_animations_completion___block_invoke;
  aBlock[3] = &unk_1EA280748;
  v15 = a1;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v10 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (MGGetProductType() == 1060988941
    || MGGetProductType() == 3585085679
    || MGGetProductType() == 689804742
    || MGGetProductType() == 2309863438)
  {
    v11 = (void *)MEMORY[0x1E0CEABB0];
    v16 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v11, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2293761, v10, *(double *)&v16.minimum, *(double *)&v16.maximum, *(double *)&v16.preferred);
  }
  else
  {
    v10[2](v10);
  }

}

uint64_t __74__UIView_BKUI_ANIMATIONS__bkui_animateWithDuration_animations_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

+ (void)bkui_animateWithDuration:(uint64_t)a3 delay:(uint64_t)a4 options:(void *)a5 animations:(void *)a6 completion:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  _QWORD aBlock[4];
  id v17;
  id v18;
  double v19;
  double v20;
  uint64_t v21;
  CAFrameRateRange v22;

  v10 = a5;
  v11 = a6;
  objc_opt_self();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__UIView_BKUI_ANIMATIONS__bkui_animateWithDuration_delay_options_animations_completion___block_invoke;
  aBlock[3] = &unk_1EA280770;
  v19 = a1;
  v20 = a2;
  v21 = a4;
  v12 = v10;
  v17 = v12;
  v13 = v11;
  v18 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (MGGetProductType() == 1060988941
    || MGGetProductType() == 3585085679
    || MGGetProductType() == 689804742
    || MGGetProductType() == 2309863438)
  {
    v15 = (void *)MEMORY[0x1E0CEABB0];
    v22 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v15, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2293761, v14, *(double *)&v22.minimum, *(double *)&v22.maximum, *(double *)&v22.preferred);
  }
  else
  {
    v14[2](v14);
  }

}

uint64_t __88__UIView_BKUI_ANIMATIONS__bkui_animateWithDuration_delay_options_animations_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

@end
