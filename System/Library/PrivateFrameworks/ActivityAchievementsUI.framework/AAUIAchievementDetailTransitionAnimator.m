@implementation AAUIAchievementDetailTransitionAnimator

- (AAUIAchievementDetailTransitionAnimator)initWithPresentingViewController:(id)a3 detailViewController:(id)a4 shouldPlayFlipInAnimation:(BOOL)a5 initialBadgeFrame:(CGRect)a6 conversionView:(id)a7 presentAlongsideBlock:(id)a8 dismissAlongsideBlock:(id)a9 completionBlock:(id)a10
{
  return -[AAUIAchievementDetailTransitionAnimator initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:willStartAnimationBlock:presentAlongsideBlock:dismissAlongsideBlock:completionBlock:](self, "initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:willStartAnimationBlock:presentAlongsideBlock:dismissAlongsideBlock:completionBlock:", a3, a4, a5, a7, 0, a8, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, a9, a10);
}

- (AAUIAchievementDetailTransitionAnimator)initWithPresentingViewController:(id)a3 detailViewController:(id)a4 shouldPlayFlipInAnimation:(BOOL)a5 initialBadgeFrame:(CGRect)a6 conversionView:(id)a7 willStartAnimationBlock:(id)a8 presentAlongsideBlock:(id)a9 dismissAlongsideBlock:(id)a10 completionBlock:(id)a11
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  AAUIAchievementDetailTransitionAnimator *v27;
  AAUIAchievementDetailTransitionAnimator *v28;
  uint64_t v29;
  id willStartAnimationBlock;
  uint64_t v31;
  id presentBlock;
  uint64_t v33;
  id dismissBlock;
  uint64_t v35;
  id completionBlock;
  void *v37;
  _OWORD *p_a;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  id v46;
  CGAffineTransform v47;
  objc_super v48;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v46 = a3;
  v21 = a4;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v48.receiver = self;
  v48.super_class = (Class)AAUIAchievementDetailTransitionAnimator;
  v27 = -[AAUIAchievementDetailTransitionAnimator init](&v48, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_presentingViewController, a3);
    objc_storeStrong((id *)&v28->_detailViewController, a4);
    objc_storeStrong((id *)&v28->_conversionView, a7);
    v28->_initialBadgeFrame.origin.x = x;
    v28->_initialBadgeFrame.origin.y = y;
    v28->_initialBadgeFrame.size.width = width;
    v28->_initialBadgeFrame.size.height = height;
    v29 = objc_msgSend(v23, "copy");
    willStartAnimationBlock = v28->_willStartAnimationBlock;
    v28->_willStartAnimationBlock = (id)v29;

    v31 = objc_msgSend(v24, "copy");
    presentBlock = v28->_presentBlock;
    v28->_presentBlock = (id)v31;

    v33 = objc_msgSend(v25, "copy");
    dismissBlock = v28->_dismissBlock;
    v28->_dismissBlock = (id)v33;

    v35 = objc_msgSend(v26, "copy");
    completionBlock = v28->_completionBlock;
    v28->_completionBlock = (id)v35;

    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v28->_isWatch = objc_msgSend(v37, "isAppleWatch");

    p_a = (_OWORD *)&v28->_finalPresentingVCTransform.a;
    if (v28->_isWatch)
    {
      v39 = MEMORY[0x24BDBD8B8];
      v40 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      *p_a = *MEMORY[0x24BDBD8B8];
      *(_OWORD *)&v28->_finalPresentingVCTransform.c = v40;
      v41 = *(_OWORD *)(v39 + 32);
    }
    else
    {
      CGAffineTransformMakeScale(&v47, 0.95, 0.95);
      v42 = *(_OWORD *)&v47.c;
      *p_a = *(_OWORD *)&v47.a;
      *(_OWORD *)&v28->_finalPresentingVCTransform.c = v42;
      v41 = *(_OWORD *)&v47.tx;
    }
    *(_OWORD *)&v28->_finalPresentingVCTransform.tx = v41;
    v28->_shouldPlayFlipInAnimation = a5;
    v28->_shouldDismissGracefullyForTextSizeChange = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", v28, sel_textSizeDidChange_, *MEMORY[0x24BEBE088], 0);

    v28->_reduceMotion = UIAccessibilityIsReduceMotionEnabled();
    v28->_shouldAdjustForInset = 1;
  }

  return v28;
}

- (AAUIAchievementDetailTransitionAnimator)initWithPresentingViewController:(id)a3 detailViewController:(id)a4 shouldPlayFlipInAnimation:(BOOL)a5 initialBadgeFrame:(CGRect)a6 conversionView:(id)a7 didStartAnimationBlock:(id)a8 didFinishAnimationBlock:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v15;
  id v19;
  id v20;
  AAUIAchievementDetailTransitionAnimator *v21;
  uint64_t v22;
  id didStartAnimationBlock;
  uint64_t v24;
  id didFinishAnimationBlock;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a5;
  v19 = a8;
  v20 = a9;
  v21 = -[AAUIAchievementDetailTransitionAnimator initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:willStartAnimationBlock:presentAlongsideBlock:dismissAlongsideBlock:completionBlock:](self, "initWithPresentingViewController:detailViewController:shouldPlayFlipInAnimation:initialBadgeFrame:conversionView:willStartAnimationBlock:presentAlongsideBlock:dismissAlongsideBlock:completionBlock:", a3, a4, v15, a7, 0, 0, x, y, width, height, 0, 0);
  if (v21)
  {
    v22 = objc_msgSend(v19, "copy");
    didStartAnimationBlock = v21->_didStartAnimationBlock;
    v21->_didStartAnimationBlock = (id)v22;

    v24 = objc_msgSend(v20, "copy");
    didFinishAnimationBlock = v21->_didFinishAnimationBlock;
    v21->_didFinishAnimationBlock = (id)v24;

  }
  return v21;
}

- (void)textSizeDidChange:(id)a3
{
  -[AAUIAchievementDetailTransitionAnimator setShouldDismissGracefullyForTextSizeChange:](self, "setShouldDismissGracefullyForTextSizeChange:", 1);
}

- (BOOL)isPresentingWithContext:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  objc_msgSend(a3, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "topViewController");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  -[AAUIAchievementDetailTransitionAnimator detailViewController](self, "detailViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 == v6;

  return v7;
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)prepareForAnimationsWithContext:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat x;
  double v8;
  CGFloat y;
  double v10;
  double width;
  double v12;
  CGFloat height;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  CGFloat MidX;
  double v29;
  double v30;
  _OWORD v31[3];
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  objc_msgSend(a3, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementDetailTransitionAnimator conversionView](self, "conversionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementDetailTransitionAnimator initialBadgeFrame](self, "initialBadgeFrame");
  objc_msgSend(v5, "convertRect:toView:", v4);
  x = v6;
  y = v8;
  width = v10;
  height = v12;

  if (self->_shouldAdjustForInset)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    v16 = v15;

    if (v16 == 3.0)
      v17 = -4.66666667;
    else
      v17 = -3.0;
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    v35 = CGRectInset(v34, v17, v17);
    x = v35.origin.x;
    y = v35.origin.y;
    width = v35.size.width;
    height = v35.size.height;
  }
  -[AAUIAchievementDetailTransitionAnimator detailViewController](self, "detailViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "badgeFrame");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  CGAffineTransformMakeScale(&v33, width / v24, width / v24);
  v32 = v33;
  -[AAUIAchievementDetailTransitionAnimator setInitialBadgeTransform:](self, "setInitialBadgeTransform:", &v32);
  v27 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v31[0] = *MEMORY[0x24BDBD8B8];
  v31[1] = v27;
  v31[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[AAUIAchievementDetailTransitionAnimator setFinalBadgeTransform:](self, "setFinalBadgeTransform:", v31);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  MidX = CGRectGetMidX(v36);
  v37.size.height = height;
  v29 = MidX;
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  -[AAUIAchievementDetailTransitionAnimator setInitialBadgeCenter:](self, "setInitialBadgeCenter:", v29, CGRectGetMidY(v37));
  v38.origin.x = v20;
  v38.origin.y = v22;
  v38.size.width = v24;
  v38.size.height = v26;
  v30 = CGRectGetMidX(v38);
  v39.origin.x = v20;
  v39.origin.y = v22;
  v39.size.width = v24;
  v39.size.height = v26;
  -[AAUIAchievementDetailTransitionAnimator setFinalBadgeCenter:](self, "setFinalBadgeCenter:", v30, CGRectGetMidY(v39));
  -[AAUIAchievementDetailTransitionAnimator setFinalBadgeFrame:](self, "setFinalBadgeFrame:", v20, v22, v24, v26);

}

- (void)animateTransition:(id)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  v4 = -[AAUIAchievementDetailTransitionAnimator isPresentingWithContext:](self, "isPresentingWithContext:");
  v5 = -[AAUIAchievementDetailTransitionAnimator reduceMotion](self, "reduceMotion");
  if (v4)
  {
    if (v5)
      -[AAUIAchievementDetailTransitionAnimator reducedMotionAnimatePresentationWithContext:](self, "reducedMotionAnimatePresentationWithContext:", v6);
    else
      -[AAUIAchievementDetailTransitionAnimator animatePresentationWithContext:](self, "animatePresentationWithContext:", v6);
  }
  else if (v5)
  {
    -[AAUIAchievementDetailTransitionAnimator reducedMotionAnimateDismissalWithContext:](self, "reducedMotionAnimateDismissalWithContext:", v6);
  }
  else
  {
    -[AAUIAchievementDetailTransitionAnimator animateDismissalWithContext:](self, "animateDismissalWithContext:", v6);
  }

}

- (void)reducedMotionAnimatePresentationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSString *v30;
  NSString *presentingViewControllerWeeTitle;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[5];
  id v48;
  _OWORD v49[6];

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementDetailTransitionAnimator setPresentingViewController:](self, "setPresentingViewController:", v6);

  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 1.0);

  objc_msgSend(v7, "setAlpha:", 0.0);
  objc_msgSend(v5, "addSubview:", v7);
  objc_msgSend(v5, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[AAUIAchievementDetailTransitionAnimator detailViewController](self, "detailViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

  -[AAUIAchievementDetailTransitionAnimator detailViewController](self, "detailViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutIfNeeded");

  -[AAUIAchievementDetailTransitionAnimator detailViewController](self, "detailViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "badgeView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addSubview:", v23);
  -[AAUIAchievementDetailTransitionAnimator prepareForAnimationsWithContext:](self, "prepareForAnimationsWithContext:", v4);
  -[AAUIAchievementDetailTransitionAnimator finalBadgeFrame](self, "finalBadgeFrame");
  objc_msgSend(v23, "setFrame:");
  objc_msgSend(v23, "setNeedsLayout");
  objc_msgSend(v23, "layoutIfNeeded");
  objc_msgSend(v23, "resizeBadgeForCurrentViewSize");
  -[AAUIAchievementDetailTransitionAnimator finalBadgeTransform](self, "finalBadgeTransform");
  v49[0] = v49[3];
  v49[1] = v49[4];
  v49[2] = v49[5];
  objc_msgSend(v23, "setTransform:", v49);
  objc_msgSend(v23, "setPaused:", 0);
  -[AAUIAchievementDetailTransitionAnimator detailViewController](self, "detailViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "placeBadgeViewInContainer");

  -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "navigationItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_weeTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "navigationItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_weeTitle");
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    presentingViewControllerWeeTitle = self->_presentingViewControllerWeeTitle;
    self->_presentingViewControllerWeeTitle = v30;

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "navigationItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_setWeeTitle:", 0);

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "navigationController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "navigationBar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setNeedsLayout");

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "navigationController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "navigationBar");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "layoutIfNeeded");

  }
  -[AAUIAchievementDetailTransitionAnimator transitionDuration:](self, "transitionDuration:", v4);
  v41 = v40;
  v42 = (void *)MEMORY[0x24BEBDB00];
  v46 = v4;
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __87__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimatePresentationWithContext___block_invoke;
  v47[3] = &unk_24E0B2E08;
  v47[4] = self;
  v48 = v7;
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __87__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimatePresentationWithContext___block_invoke_2;
  v45[3] = &unk_24E0B3098;
  v43 = v4;
  v44 = v7;
  objc_msgSend(v42, "animateWithDuration:animations:completion:", v47, v45, v41);

}

uint64_t __87__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimatePresentationWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __87__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimatePresentationWithContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (void)animatePresentationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void (**v15)(double);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *presentingViewControllerWeeTitle;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void (**v32)(void);
  void *v33;
  void (**v34)(_QWORD, _QWORD);
  void *v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  _OWORD v44[6];

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementDetailTransitionAnimator setPresentingViewController:](self, "setPresentingViewController:", v6);

  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", 1.0);

  objc_msgSend(v7, "setAlpha:", 0.0);
  objc_msgSend(v5, "addSubview:", v7);
  objc_msgSend(v5, "layoutIfNeeded");
  -[AAUIAchievementDetailTransitionAnimator detailViewController](self, "detailViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "badgeView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addSubview:", v11);
  -[AAUIAchievementDetailTransitionAnimator prepareForAnimationsWithContext:](self, "prepareForAnimationsWithContext:", v4);
  -[AAUIAchievementDetailTransitionAnimator finalBadgeFrame](self, "finalBadgeFrame");
  objc_msgSend(v11, "setFrame:");
  objc_msgSend(v11, "setNeedsLayout");
  objc_msgSend(v11, "layoutIfNeeded");
  objc_msgSend(v11, "resizeBadgeForCurrentViewSize");
  -[AAUIAchievementDetailTransitionAnimator initialBadgeTransform](self, "initialBadgeTransform");
  v44[0] = v44[3];
  v44[1] = v44[4];
  v44[2] = v44[5];
  objc_msgSend(v11, "setTransform:", v44);
  -[AAUIAchievementDetailTransitionAnimator initialBadgeCenter](self, "initialBadgeCenter");
  objc_msgSend(v11, "setCenter:");
  if (-[AAUIAchievementDetailTransitionAnimator shouldPlayFlipInAnimation](self, "shouldPlayFlipInAnimation"))
    objc_msgSend(v11, "playFlipInAnimation");
  objc_msgSend(v11, "setPaused:", 0);
  -[AAUIAchievementDetailTransitionAnimator transitionDuration:](self, "transitionDuration:", v4);
  v13 = v12;
  -[AAUIAchievementDetailTransitionAnimator presentBlock](self, "presentBlock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AAUIAchievementDetailTransitionAnimator presentBlock](self, "presentBlock");
    v15 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v15[2](v13);

  }
  -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_weeTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_weeTitle");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    presentingViewControllerWeeTitle = self->_presentingViewControllerWeeTitle;
    self->_presentingViewControllerWeeTitle = v21;

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "navigationItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_setWeeTitle:", 0);

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "navigationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "navigationBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setNeedsLayout");

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "navigationController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "navigationBar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "layoutIfNeeded");

  }
  -[AAUIAchievementDetailTransitionAnimator didStartAnimationBlock](self, "didStartAnimationBlock");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    -[AAUIAchievementDetailTransitionAnimator didStartAnimationBlock](self, "didStartAnimationBlock");
    v32 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v32[2]();

  }
  -[AAUIAchievementDetailTransitionAnimator willStartAnimationBlock](self, "willStartAnimationBlock");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[AAUIAchievementDetailTransitionAnimator willStartAnimationBlock](self, "willStartAnimationBlock");
    v34 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v34[2](v34, 1);

  }
  v35 = (void *)MEMORY[0x24BEBDB00];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke;
  v41[3] = &unk_24E0B30C0;
  v41[4] = self;
  v42 = v7;
  v43 = v11;
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_5;
  v39[3] = &unk_24E0B30E8;
  v39[4] = self;
  v40 = v4;
  v36 = v4;
  v37 = v11;
  v38 = v7;
  objc_msgSend(v35, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v41, v39, v13, 0.0);

}

void __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  v2 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_2;
  v12[3] = &unk_24E0B2E78;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBDB00], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v12, 0.0, 0.4);
  v3 = (void *)MEMORY[0x24BEBDB00];
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_3;
  v10[3] = &unk_24E0B2E78;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v10, 0.6, 0.4);
  v4 = (void *)MEMORY[0x24BEBDB00];
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_4;
  v7[3] = &unk_24E0B2E08;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.0, 1.0);

}

void __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "finalPresentingVCTransform");
    v2 = *(void **)(a1 + 32);
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
  }
  objc_msgSend(v2, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  objc_msgSend(v4, "setTransform:", v7);

  if ((objc_msgSend(*(id *)(a1 + 32), "isWatch") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 0.0);

  }
}

uint64_t __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _OWORD v5[3];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v2, "finalBadgeTransform");
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
  }
  v3 = *(void **)(a1 + 32);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  objc_msgSend(v3, "setTransform:", v5);
  objc_msgSend(*(id *)(a1 + 40), "finalBadgeCenter");
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:");
}

void __74__AAUIAchievementDetailTransitionAnimator_animatePresentationWithContext___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void (**v11)(void);
  _OWORD v12[3];

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v12[0] = *MEMORY[0x24BDBD8B8];
  v12[1] = v4;
  v12[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v3, "setTransform:", v12);

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "detailViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placeBadgeViewInContainer");

  objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[2](v9, 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "didFinishAnimationBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "didFinishAnimationBlock");
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v11[2]();

  }
}

- (void)reducedMotionAnimateDismissalWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSString *presentingViewControllerWeeTitle;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  AAUIAchievementDetailTransitionAnimator *v33;
  _OWORD v34[3];

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "presentationStyle") == -1)
  {
    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v34[0] = *MEMORY[0x24BDBD8B8];
    v34[1] = v10;
    v34[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v9, "setTransform:", v34);

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v12);

  }
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9A8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v13);
  objc_msgSend(v5, "layoutIfNeeded");
  -[AAUIAchievementDetailTransitionAnimator transitionDuration:](self, "transitionDuration:", v4);
  v15 = v14;
  presentingViewControllerWeeTitle = self->_presentingViewControllerWeeTitle;
  if (presentingViewControllerWeeTitle)
  {
    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setWeeTitle:", presentingViewControllerWeeTitle);

    v19 = self->_presentingViewControllerWeeTitle;
    self->_presentingViewControllerWeeTitle = 0;

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "navigationBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNeedsLayout");

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "navigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "navigationBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layoutIfNeeded");

  }
  v26 = (void *)MEMORY[0x24BEBDB00];
  v30 = v4;
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __84__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimateDismissalWithContext___block_invoke;
  v31[3] = &unk_24E0B2E08;
  v32 = v13;
  v33 = self;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __84__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimateDismissalWithContext___block_invoke_2;
  v29[3] = &unk_24E0B3098;
  v27 = v4;
  v28 = v13;
  objc_msgSend(v26, "animateWithDuration:animations:completion:", v31, v29, v15);

}

void __84__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimateDismissalWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 40), "presentingViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

}

uint64_t __84__AAUIAchievementDetailTransitionAnimator_reducedMotionAnimateDismissalWithContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (void)animateDismissalWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void (**v26)(double);
  NSString *presentingViewControllerWeeTitle;
  void *v28;
  void *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void (**v38)(void);
  void *v39;
  void (**v40)(_QWORD, _QWORD);
  BOOL v41;
  void *v42;
  uint64_t v43;
  id *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  AAUIAchievementDetailTransitionAnimator *v53;
  _QWORD v54[4];
  void *v55;
  id v56;
  AAUIAchievementDetailTransitionAnimator *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  AAUIAchievementDetailTransitionAnimator *v61;
  _QWORD v62[4];
  _QWORD v63[2];
  id v64;
  _OWORD v65[6];
  _OWORD v66[6];
  _OWORD v67[3];

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "presentationStyle") == -1)
  {
    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v67[0] = *MEMORY[0x24BDBD8B8];
    v67[1] = v10;
    v67[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v9, "setTransform:", v67);

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v12);

  }
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9A8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v13);
  objc_msgSend(v5, "layoutIfNeeded");
  -[AAUIAchievementDetailTransitionAnimator detailViewController](self, "detailViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "badgeView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[AAUIAchievementDetailTransitionAnimator shouldDismissGracefullyForTextSizeChange](self, "shouldDismissGracefullyForTextSizeChange"))
  {
    goto LABEL_5;
  }
  objc_msgSend(v5, "addSubview:", v15);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
  -[AAUIAchievementDetailTransitionAnimator finalBadgeCenter](self, "finalBadgeCenter");
  objc_msgSend(v15, "setCenter:");
  -[AAUIAchievementDetailTransitionAnimator finalBadgeTransform](self, "finalBadgeTransform");
  v66[0] = v66[3];
  v66[1] = v66[4];
  v66[2] = v66[5];
  objc_msgSend(v15, "setTransform:", v66);
  objc_msgSend(v15, "playFlipOutAnimation");
  v17 = v16;
  if (v16 < 2.22044605e-16)
  {
LABEL_5:
    -[AAUIAchievementDetailTransitionAnimator transitionDuration:](self, "transitionDuration:", v4);
    v17 = v18;
  }
  -[AAUIAchievementDetailTransitionAnimator finalPresentingVCTransform](self, "finalPresentingVCTransform");
  -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v65[3];
  v65[1] = v65[4];
  v65[2] = v65[5];
  objc_msgSend(v20, "setTransform:", v65);

  v21 = -[AAUIAchievementDetailTransitionAnimator isWatch](self, "isWatch");
  -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v21)
  {
    objc_msgSend(v23, "setNeedsLayout");

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutIfNeeded");
  }
  else
  {
    objc_msgSend(v23, "setAlpha:", 0.0);
  }

  -[AAUIAchievementDetailTransitionAnimator dismissBlock](self, "dismissBlock");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[AAUIAchievementDetailTransitionAnimator dismissBlock](self, "dismissBlock");
    v26 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v26[2](v17);

  }
  presentingViewControllerWeeTitle = self->_presentingViewControllerWeeTitle;
  if (presentingViewControllerWeeTitle)
  {
    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "navigationItem");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_setWeeTitle:", presentingViewControllerWeeTitle);

    v30 = self->_presentingViewControllerWeeTitle;
    self->_presentingViewControllerWeeTitle = 0;

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "navigationController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "navigationBar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNeedsLayout");

    -[AAUIAchievementDetailTransitionAnimator presentingViewController](self, "presentingViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "navigationController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "navigationBar");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutIfNeeded");

  }
  -[AAUIAchievementDetailTransitionAnimator didStartAnimationBlock](self, "didStartAnimationBlock");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[AAUIAchievementDetailTransitionAnimator didStartAnimationBlock](self, "didStartAnimationBlock");
    v38 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v38[2]();

  }
  -[AAUIAchievementDetailTransitionAnimator willStartAnimationBlock](self, "willStartAnimationBlock");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    -[AAUIAchievementDetailTransitionAnimator willStartAnimationBlock](self, "willStartAnimationBlock");
    v40 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v40[2](v40, 0);

  }
  v41 = -[AAUIAchievementDetailTransitionAnimator shouldDismissGracefullyForTextSizeChange](self, "shouldDismissGracefullyForTextSizeChange");
  v42 = (void *)MEMORY[0x24BEBDB00];
  v43 = MEMORY[0x24BDAC760];
  if (v41)
  {
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_6;
    v54[3] = &unk_24E0B30C0;
    v44 = &v55;
    v55 = v13;
    v56 = v15;
    v57 = self;
    v50[0] = v43;
    v50[1] = 3221225472;
    v50[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_9;
    v50[3] = &unk_24E0B3110;
    v51 = v56;
    v52 = v4;
    v53 = self;
    v45 = v4;
    v46 = v13;
    objc_msgSend(v42, "animateKeyframesWithDuration:delay:options:animations:completion:", 1, v54, v50, v17, 0.0);

    v47 = v56;
  }
  else
  {
    v62[0] = MEMORY[0x24BDAC760];
    v62[1] = 3221225472;
    v62[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke;
    v62[3] = &unk_24E0B30C0;
    v44 = (id *)v63;
    v63[0] = v13;
    v63[1] = self;
    v64 = v15;
    v58[0] = v43;
    v58[1] = 3221225472;
    v58[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_5;
    v58[3] = &unk_24E0B3110;
    v59 = v64;
    v60 = v4;
    v61 = self;
    v48 = v4;
    v49 = v13;
    objc_msgSend(v42, "animateKeyframesWithDuration:delay:options:animations:completion:", 1, v62, v58, v17, 0.0);

    v47 = v64;
  }

}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;

  v2 = MEMORY[0x24BDAC760];
  v3 = (void *)MEMORY[0x24BEBDB00];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_2;
  v11[3] = &unk_24E0B2E78;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v11, 0.0, 0.4);
  v10[0] = v2;
  v10[1] = 3221225472;
  v10[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_3;
  v10[3] = &unk_24E0B2E78;
  v10[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BEBDB00], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v10, 0.6, 0.4);
  v4 = (void *)MEMORY[0x24BEBDB00];
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_4;
  v7[3] = &unk_24E0B2E08;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.0, 1.0);

}

uint64_t __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v7[0] = *MEMORY[0x24BDBD8B8];
  v7[1] = v4;
  v7[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v3, "setTransform:", v7);

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

}

uint64_t __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _OWORD v5[3];
  __int128 v6;
  __int128 v7;
  __int128 v8;

  objc_msgSend(*(id *)(a1 + 40), "initialBadgeCenter");
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v2, "initialBadgeTransform");
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
    v6 = 0u;
  }
  v3 = *(void **)(a1 + 32);
  v5[0] = v6;
  v5[1] = v7;
  v5[2] = v8;
  return objc_msgSend(v3, "setTransform:", v5);
}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_5(id *a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void (**v5)(void);

  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "completeTransition:", 1);
  objc_msgSend(a1[6], "completionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1[6], "completionBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

  }
  objc_msgSend(a1[6], "didFinishAnimationBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1[6], "didFinishAnimationBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = MEMORY[0x24BDAC760];
  v3 = (void *)MEMORY[0x24BEBDB00];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_7;
  v5[3] = &unk_24E0B2E08;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.4);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_8;
  v4[3] = &unk_24E0B2E78;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BEBDB00], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.6, 0.4);

}

uint64_t __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_7(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_8(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v7[0] = *MEMORY[0x24BDBD8B8];
  v7[1] = v4;
  v7[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v3, "setTransform:", v7);

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);

}

void __71__AAUIAchievementDetailTransitionAnimator_animateDismissalWithContext___block_invoke_9(id *a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void (**v5)(void);

  objc_msgSend(a1[4], "removeFromSuperview");
  objc_msgSend(a1[5], "completeTransition:", 1);
  objc_msgSend(a1[6], "completionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1[6], "completionBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

  }
  objc_msgSend(a1[6], "didFinishAnimationBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1[6], "didFinishAnimationBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

- (BOOL)shouldAdjustForInset
{
  return self->_shouldAdjustForInset;
}

- (void)setShouldAdjustForInset:(BOOL)a3
{
  self->_shouldAdjustForInset = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (AnimatorDetailViewController)detailViewController
{
  return self->_detailViewController;
}

- (void)setDetailViewController:(id)a3
{
  objc_storeStrong((id *)&self->_detailViewController, a3);
}

- (UIView)conversionView
{
  return self->_conversionView;
}

- (void)setConversionView:(id)a3
{
  objc_storeStrong((id *)&self->_conversionView, a3);
}

- (CGRect)initialBadgeFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialBadgeFrame.origin.x;
  y = self->_initialBadgeFrame.origin.y;
  width = self->_initialBadgeFrame.size.width;
  height = self->_initialBadgeFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialBadgeFrame:(CGRect)a3
{
  self->_initialBadgeFrame = a3;
}

- (CGPoint)initialBadgeCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialBadgeCenter.x;
  y = self->_initialBadgeCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialBadgeCenter:(CGPoint)a3
{
  self->_initialBadgeCenter = a3;
}

- (CGPoint)finalBadgeCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_finalBadgeCenter.x;
  y = self->_finalBadgeCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFinalBadgeCenter:(CGPoint)a3
{
  self->_finalBadgeCenter = a3;
}

- (CGAffineTransform)initialBadgeTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].tx;
  return self;
}

- (void)setInitialBadgeTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_initialBadgeTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_initialBadgeTransform.tx = v4;
  *(_OWORD *)&self->_initialBadgeTransform.a = v3;
}

- (CGAffineTransform)finalBadgeTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[5].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].tx;
  return self;
}

- (void)setFinalBadgeTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_finalBadgeTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_finalBadgeTransform.tx = v4;
  *(_OWORD *)&self->_finalBadgeTransform.a = v3;
}

- (CGRect)finalBadgeFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_finalBadgeFrame.origin.x;
  y = self->_finalBadgeFrame.origin.y;
  width = self->_finalBadgeFrame.size.width;
  height = self->_finalBadgeFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFinalBadgeFrame:(CGRect)a3
{
  self->_finalBadgeFrame = a3;
}

- (CGAffineTransform)finalPresentingVCTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[6].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[6].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[6].tx;
  return self;
}

- (void)setFinalPresentingVCTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_finalPresentingVCTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_finalPresentingVCTransform.tx = v4;
  *(_OWORD *)&self->_finalPresentingVCTransform.a = v3;
}

- (id)willStartAnimationBlock
{
  return self->_willStartAnimationBlock;
}

- (void)setWillStartAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)presentBlock
{
  return self->_presentBlock;
}

- (void)setPresentBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)dismissBlock
{
  return self->_dismissBlock;
}

- (void)setDismissBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)didStartAnimationBlock
{
  return self->_didStartAnimationBlock;
}

- (void)setDidStartAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)didFinishAnimationBlock
{
  return self->_didFinishAnimationBlock;
}

- (void)setDidFinishAnimationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isWatch
{
  return self->_isWatch;
}

- (void)setIsWatch:(BOOL)a3
{
  self->_isWatch = a3;
}

- (BOOL)shouldPlayFlipInAnimation
{
  return self->_shouldPlayFlipInAnimation;
}

- (void)setShouldPlayFlipInAnimation:(BOOL)a3
{
  self->_shouldPlayFlipInAnimation = a3;
}

- (BOOL)shouldDismissGracefullyForTextSizeChange
{
  return self->_shouldDismissGracefullyForTextSizeChange;
}

- (void)setShouldDismissGracefullyForTextSizeChange:(BOOL)a3
{
  self->_shouldDismissGracefullyForTextSizeChange = a3;
}

- (BOOL)reduceMotion
{
  return self->_reduceMotion;
}

- (void)setReduceMotion:(BOOL)a3
{
  self->_reduceMotion = a3;
}

- (NSString)presentingViewControllerWeeTitle
{
  return self->_presentingViewControllerWeeTitle;
}

- (void)setPresentingViewControllerWeeTitle:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewControllerWeeTitle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewControllerWeeTitle, 0);
  objc_storeStrong(&self->_didFinishAnimationBlock, 0);
  objc_storeStrong(&self->_didStartAnimationBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_dismissBlock, 0);
  objc_storeStrong(&self->_presentBlock, 0);
  objc_storeStrong(&self->_willStartAnimationBlock, 0);
  objc_storeStrong((id *)&self->_conversionView, 0);
  objc_storeStrong((id *)&self->_detailViewController, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
}

@end
