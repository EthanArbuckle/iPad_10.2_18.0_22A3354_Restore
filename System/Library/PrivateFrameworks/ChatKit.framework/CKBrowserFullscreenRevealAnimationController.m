@implementation CKBrowserFullscreenRevealAnimationController

- (CKBrowserFullscreenRevealAnimationController)initWithDirection:(BOOL)a3
{
  _BOOL4 v3;
  CKBrowserFullscreenRevealAnimationController *v4;
  CKBrowserFullscreenRevealAnimationController *v5;
  void *v6;
  CKBrowserFullscreenCubicSpringTimingParameters *v7;
  double v8;
  CKBrowserFullscreenCubicSpringTimingParameters *v9;
  CKBrowserFullscreenCubicSpringPropertyAnimator *v10;
  UIViewPropertyAnimator *ascentDescentAnimator;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKBrowserFullscreenRevealAnimationController;
  v4 = -[CKBrowserFullscreenRevealAnimationController init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_presenting = v3;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA4D0]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
    v7 = [CKBrowserFullscreenCubicSpringTimingParameters alloc];
    if (v3)
      v8 = 100.0;
    else
      v8 = 39.0;
    v9 = -[CKBrowserFullscreenCubicSpringTimingParameters initWithMass:stiffness:damping:initialVelocity:](v7, "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, v8, 0.0, 0.0);
    -[CKBrowserFullscreenCubicSpringTimingParameters setSpringCubicTimingParameters:](v9, "setSpringCubicTimingParameters:", v6);
    v10 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([CKBrowserFullscreenCubicSpringPropertyAnimator alloc], "initWithDuration:timingParameters:", v9, 0.0);
    ascentDescentAnimator = v5->_ascentDescentAnimator;
    v5->_ascentDescentAnimator = &v10->super;

    -[UIViewPropertyAnimator setInterruptible:](v5->_ascentDescentAnimator, "setInterruptible:", 0);
  }
  return v5;
}

- (double)transitionDuration:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[CKBrowserFullscreenRevealAnimationController ascentDescentAnimator](self, "ascentDescentAnimator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  v5 = v4;

  return v5;
}

- (void)animateTransition:(id)a3
{
  id v4;
  _BOOL4 v5;
  _QWORD *v6;
  void *v7;
  _BOOL4 v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double Height;
  CGFloat MinY;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  _QWORD aBlock[4];
  id v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGRect v49;
  CGRect v50;

  v4 = a3;
  v5 = -[CKBrowserFullscreenRevealAnimationController isPresenting](self, "isPresenting");
  v6 = (_QWORD *)MEMORY[0x1E0CEBDB8];
  if (!v5)
    v6 = (_QWORD *)MEMORY[0x1E0CEBDA8];
  objc_msgSend(v4, "viewControllerForKey:", *v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKBrowserFullscreenRevealAnimationController isPresenting](self, "isPresenting");
  v9 = (_QWORD *)MEMORY[0x1E0CEBDC0];
  if (!v8)
    v9 = (_QWORD *)MEMORY[0x1E0CEBDB0];
  objc_msgSend(v4, "viewForKey:", *v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v7);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (-[CKBrowserFullscreenRevealAnimationController isPresenting](self, "isPresenting"))
  {
    objc_msgSend(v11, "addSubview:", v10);
    objc_msgSend(v10, "setFrame:", v13, v15, v17, v19);
    objc_msgSend(v10, "layoutIfNeeded");
    objc_msgSend(v11, "bounds");
    Height = CGRectGetHeight(v49);
    v50.origin.x = v13;
    v50.origin.y = v15;
    v50.size.width = v17;
    v50.size.height = v19;
    MinY = CGRectGetMinY(v50);
    CGAffineTransformMakeTranslation(&v48, 0.0, Height - MinY);
    v47 = v48;
    objc_msgSend(v10, "setTransform:", &v47);
  }
  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke;
  aBlock[3] = &unk_1E274A208;
  v23 = v7;
  v46 = v23;
  v24 = _Block_copy(aBlock);
  v38[0] = v22;
  v38[1] = 3221225472;
  v38[2] = __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke_2;
  v38[3] = &unk_1E2755EA0;
  v39 = v23;
  v40 = v11;
  v41 = v13;
  v42 = v15;
  v43 = v17;
  v44 = v19;
  v25 = v11;
  v26 = v23;
  v27 = _Block_copy(v38);
  -[CKBrowserFullscreenRevealAnimationController ascentDescentAnimator](self, "ascentDescentAnimator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKBrowserFullscreenRevealAnimationController isPresenting](self, "isPresenting"))
    v29 = v24;
  else
    v29 = v27;
  objc_msgSend(v28, "addAnimations:", v29);

  -[CKBrowserFullscreenRevealAnimationController ascentDescentAnimator](self, "ascentDescentAnimator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v22;
  v34 = 3221225472;
  v35 = __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke_3;
  v36 = &unk_1E274C9E8;
  v37 = v4;
  v31 = v4;
  objc_msgSend(v30, "addCompletion:", &v33);

  -[CKBrowserFullscreenRevealAnimationController ascentDescentAnimator](self, "ascentDescentAnimator", v33, v34, v35, v36);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "startAnimation");

}

void __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v3[3];

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v3[0] = *MEMORY[0x1E0C9BAA8];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v1, "setTransform:", v3);

}

void __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  double Height;
  CGFloat MinY;
  void *v4;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGRect v7;

  objc_msgSend(*(id *)(a1 + 40), "bounds");
  Height = CGRectGetHeight(v7);
  MinY = CGRectGetMinY(*(CGRect *)(a1 + 48));
  CGAffineTransformMakeTranslation(&v6, 0.0, Height - MinY);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  objc_msgSend(v4, "setTransform:", &v5);

}

uint64_t __66__CKBrowserFullscreenRevealAnimationController_animateTransition___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (a2)
    v3 = 0;
  else
    v3 = objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1;
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", v3);
}

- (UIViewPropertyAnimator)ascentDescentAnimator
{
  return self->_ascentDescentAnimator;
}

- (void)setAscentDescentAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_ascentDescentAnimator, a3);
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ascentDescentAnimator, 0);
}

@end
