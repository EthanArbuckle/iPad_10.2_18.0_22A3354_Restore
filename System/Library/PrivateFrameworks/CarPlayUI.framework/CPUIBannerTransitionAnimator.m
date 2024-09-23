@implementation CPUIBannerTransitionAnimator

+ (double)defaultTransitionDuration
{
  return 0.15;
}

+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    v10 = (void *)MEMORY[0x24BDF6F90];
    objc_msgSend(a1, "defaultTransitionDuration");
    v12 = v11;
    v13 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __73__CPUIBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke;
    v16[3] = &unk_24DF242C0;
    v17 = v7;
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __73__CPUIBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke_2;
    v14[3] = &unk_24DF242E8;
    v15 = v9;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v16, v14, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
  }

}

uint64_t __73__CPUIBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__CPUIBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (double)transitionDuration:(id)a3
{
  double result;

  objc_msgSend((id)objc_opt_class(), "defaultTransitionDuration");
  return result;
}

@end
