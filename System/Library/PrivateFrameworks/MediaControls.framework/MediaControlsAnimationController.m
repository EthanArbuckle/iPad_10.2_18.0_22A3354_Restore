@implementation MediaControlsAnimationController

- (id)initForPresenting:(BOOL)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MediaControlsAnimationController;
  result = -[MediaControlsAnimationController init](&v5, sel_init);
  if (result)
    *((_BYTE *)result + 8) = a3;
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  CGAffineTransform *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  double v19;
  CGAffineTransform v20;
  _OWORD v21[3];
  CGAffineTransform v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v4 = a3;
  v5 = v4;
  v6 = *MEMORY[0x1E0C9BAA8];
  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v24 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v25 = v7;
  *(_OWORD *)&v22.a = v6;
  *(_OWORD *)&v22.c = v24;
  *(_OWORD *)&v22.tx = v7;
  v23 = v6;
  if (self->_presenting)
  {
    objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0DC55D0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    v10 = 1.0;
    v11 = 0.0;
    v12 = (CGAffineTransform *)&v23;
  }
  else
  {
    objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0DC55C0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0.0;
    v11 = 1.0;
    v12 = &v22;
  }
  CGAffineTransformMakeScale(v12, 1.92, 1.92);
  if (objc_msgSend(v5, "isAnimated"))
  {
    objc_msgSend(v8, "setAlpha:", v11);
    v21[0] = v23;
    v21[1] = v24;
    v21[2] = v25;
    objc_msgSend(v8, "setTransform:", v21);
    objc_msgSend(MEMORY[0x1E0CC2368], "standardSpringAnimator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __54__MediaControlsAnimationController_animateTransition___block_invoke;
    v17[3] = &unk_1E5819A78;
    v18 = v8;
    v19 = v10;
    v20 = v22;
    objc_msgSend(v13, "addAnimations:", v17);
    v15[0] = v14;
    v15[1] = 3221225472;
    v15[2] = __54__MediaControlsAnimationController_animateTransition___block_invoke_2;
    v15[3] = &unk_1E5819AA0;
    v16 = v5;
    objc_msgSend(v13, "addCompletion:", v15);
    objc_msgSend(v13, "startAnimation");

  }
  else
  {
    objc_msgSend(v5, "completeTransition:", 1);
  }

}

uint64_t __54__MediaControlsAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
  v2 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 80);
  return objc_msgSend(*(id *)(a1 + 32), "setTransform:", v4);
}

uint64_t __54__MediaControlsAnimationController_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  unsigned int v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "transitionWasCancelled") ^ 1;
  if (a2)
    v5 = 0;
  else
    v5 = v4;
  return objc_msgSend(v3, "completeTransition:", v5);
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

@end
