@implementation BNBannerTransitionAnimator

- (id)initForPresenting:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BNBannerTransitionAnimator;
  result = -[BNBannerAnimator init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 24) = a3;
  return result;
}

+ (void)animateInteractive:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    v10 = (void *)MEMORY[0x1E0CEABB0];
    if (v6)
      v11 = 0.85;
    else
      v11 = 1.0;
    if (v6)
      v12 = 0.08;
    else
      v12 = 0.5;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__BNBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke;
    v13[3] = &unk_1E7044C38;
    v14 = v7;
    objc_msgSend(v10, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", v6, v13, v9, v11, v12, 0.0, 0.0, 0.0, 0.998);

  }
  else if (v8)
  {
    (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 1, 0);
  }

}

uint64_t __71__BNBannerTransitionAnimator_animateInteractive_animations_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)actionsForTransition:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  if (self->_presenting)
    v5 = (_QWORD *)MEMORY[0x1E0CEBDB8];
  else
    v5 = (_QWORD *)MEMORY[0x1E0CEBDA8];
  objc_msgSend(v4, "viewControllerForKey:", *v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_presenting)
  {
    objc_msgSend(v17, "initialFrameForViewController:", v6);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)MEMORY[0x1E0CEABB0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __51__BNBannerTransitionAnimator_actionsForTransition___block_invoke;
    v18[3] = &unk_1E7044C60;
    v19 = v7;
    v20 = v9;
    v21 = v11;
    v22 = v13;
    v23 = v15;
    objc_msgSend(v16, "performWithoutAnimation:", v18);

  }
  objc_msgSend(v17, "finalFrameForViewController:", v6);
  objc_msgSend(v7, "setFrame:");

}

uint64_t __51__BNBannerTransitionAnimator_actionsForTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (double)transitionDuration:(id)a3
{
  uint64_t *v3;
  uint64_t v4;
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGRect v25;
  CGRect v26;

  if (self->_presenting)
    v3 = (uint64_t *)MEMORY[0x1E0CEBDB8];
  else
    v3 = (uint64_t *)MEMORY[0x1E0CEBDA8];
  v4 = *v3;
  v5 = a3;
  objc_msgSend(v5, "viewControllerForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialFrameForViewController:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "finalFrameForViewController:", v6);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v25.origin.x = v8;
  v25.origin.y = v10;
  v25.size.width = v12;
  v25.size.height = v14;
  v26.origin.x = v16;
  v26.origin.y = v18;
  v26.size.width = v20;
  v26.size.height = v22;
  if (CGRectEqualToRect(v25, v26))
    v23 = 0.0;
  else
    v23 = 0.375;

  return v23;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

@end
