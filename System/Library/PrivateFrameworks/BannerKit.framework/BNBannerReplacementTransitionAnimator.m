@implementation BNBannerReplacementTransitionAnimator

- (void)actionsForTransition:(id)a3
{
  id v4;
  _BOOL4 v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  __int128 v9;
  double v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  double v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  v4 = a3;
  v5 = -[BNBannerTransitionAnimator isPresenting](self, "isPresenting");
  v6 = (_QWORD *)MEMORY[0x1E0CEBDB8];
  if (!v5)
    v6 = (_QWORD *)MEMORY[0x1E0CEBDA8];
  objc_msgSend(v4, "viewControllerForKey:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v17, 0, sizeof(v17));
  if (v5)
  {
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v17.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v17.c = v9;
    *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v10 = 1.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v17, 0.8, 0.8);
    v10 = 0.0;
  }
  v16 = v17;
  objc_msgSend(v8, "setTransform:", &v16);
  v11 = (void *)MEMORY[0x1E0CEABB0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__BNBannerReplacementTransitionAnimator_actionsForTransition___block_invoke;
  v13[3] = &unk_1E7044BE8;
  v14 = v8;
  v15 = v10;
  v12 = v8;
  objc_msgSend(v11, "animateWithDuration:delay:options:animations:completion:", 0, v13, 0, 0.2, 0.25);

}

uint64_t __62__BNBannerReplacementTransitionAnimator_actionsForTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

@end
