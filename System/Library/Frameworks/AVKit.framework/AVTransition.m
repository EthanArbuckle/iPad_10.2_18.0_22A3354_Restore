@implementation AVTransition

- (AVTransition)initWithTransitionContext:(id)a3
{
  id v4;
  AVTransition *v5;
  NSObject *v6;
  uint64_t v7;
  NSMutableArray *allAnimators;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  AVTransition *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVTransition;
  v5 = -[AVTransition init](&v10, sel_init);
  if (v5)
  {
    _AVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "-[AVTransition initWithTransitionContext:]";
      v13 = 1024;
      v14 = 48;
      v15 = 2048;
      v16 = v5;
      _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    allAnimators = v5->_allAnimators;
    v5->_allAnimators = (NSMutableArray *)v7;

    objc_storeWeak((id *)&v5->_transitionContext, v4);
  }

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  AVTransition *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v6 = "-[AVTransition dealloc]";
    v7 = 1024;
    v8 = 58;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVTransition;
  -[AVTransition dealloc](&v4, sel_dealloc);
}

- (double)duration
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[AVTransition presentationContext](self, "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionDuration");
  v6 = v5;

  return v6;
}

- (double)transitionAnimatorProgress
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double result;

  -[AVTransition transitionAnimator](self, "transitionAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fractionComplete");
  v5 = v4;

  -[AVTransition transitionAnimator](self, "transitionAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v6, "isReversed");

  result = 1.0 - v5;
  if (!(_DWORD)v3)
    return v5;
  return result;
}

- (void)startInteractiveTransition
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  UIViewPropertyAnimator *v16;
  UIViewPropertyAnimator *clientAnimator;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  UIViewPropertyAnimator *v25;
  UIViewPropertyAnimator *transitionAnimator;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  AVTransition *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "-[AVTransition startInteractiveTransition]";
    v41 = 1024;
    v42 = 86;
    v43 = 2048;
    v44 = self;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  -[AVTransition presentationContext](self, "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPresenting");

  -[AVTransition presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "presentingTransition");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v8;
    -[AVTransition transitionContext](self, "transitionContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWasInitiallyInteractive:", objc_msgSend(v11, "isInteractive"));

    goto LABEL_8;
  }
  v9 = objc_msgSend(v6, "isDismissing");

  if (v9)
  {
    -[AVTransition presentationContext](self, "presentationContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissingTransition");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  v12 = objc_alloc(MEMORY[0x1E0DC3F38]);
  -[AVTransition duration](self, "duration");
  v14 = v13;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 5);
  v16 = (UIViewPropertyAnimator *)objc_msgSend(v12, "initWithDuration:timingParameters:", v15, v14);
  clientAnimator = self->_clientAnimator;
  self->_clientAnimator = v16;

  -[AVTransition clientAnimator](self, "clientAnimator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setScrubsLinearly:", 0);

  -[AVTransition allAnimators](self, "allAnimators");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition clientAnimator](self, "clientAnimator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v20);

  v21 = objc_alloc(MEMORY[0x1E0DC3F38]);
  -[AVTransition duration](self, "duration");
  v23 = v22;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithAnimationCurve:", 5);
  v25 = (UIViewPropertyAnimator *)objc_msgSend(v21, "initWithDuration:timingParameters:", v24, v23);
  transitionAnimator = self->_transitionAnimator;
  self->_transitionAnimator = v25;

  -[AVTransition transitionAnimator](self, "transitionAnimator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setScrubsLinearly:", 0);

  -[AVTransition allAnimators](self, "allAnimators");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition transitionAnimator](self, "transitionAnimator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addObject:", v29);

  -[AVTransition presentationContext](self, "presentationContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "backgroundView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition delegate](self, "delegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "transitionBackgroundViewBackgroundColor:", self);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackgroundColor:", v33);

  -[AVTransition presentationContext](self, "presentationContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "presentedView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition delegate](self, "delegate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "transitionPresentedViewBackgroundColor:", self);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setBackgroundColor:", v37);

  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __42__AVTransition_startInteractiveTransition__block_invoke;
  v38[3] = &unk_1E5BB4CA0;
  v38[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v38);
}

- (void)_presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  id v61;
  CGRect v62;

  -[AVTransition presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "transitionStyle");

  -[AVTransition presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  -[AVTransition presentationContext](self, "presentationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAutoresizingMask:", 18);

  -[AVTransition presentationContext](self, "presentationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "touchBlockingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAutoresizingMask:", 18);

  -[AVTransition transitionContext](self, "transitionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentedView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v15);

  -[AVTransition presentationContext](self, "presentationContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transitionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "containerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "backgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "presentedView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertSubview:belowSubview:", v20, v22);

  -[AVTransition presentationContext](self, "presentationContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "transitionContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "containerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "touchBlockingView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "presentedView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "insertSubview:belowSubview:", v27, v29);

  -[AVTransition presentationContext](self, "presentationContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "backgroundView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAlpha:", 0.0);

  if (!v5)
  {
    -[AVTransition transitionContext](self, "transitionContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "containerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAlpha:", 0.0);

  }
  -[AVTransition presentationContext](self, "presentationContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "sourceView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {

LABEL_6:
    -[AVTransition presentationContext](self, "presentationContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "presentedView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransition presentationContext](self, "presentationContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sourceView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransition _updateCornerAppearanceAttributesOfView:toSourceView:similarity:](self, "_updateCornerAppearanceAttributesOfView:toSourceView:similarity:", v39, v41, 1.0);

    -[AVTransition presentationContext](self, "presentationContext");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "presentedView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransition _sourceViewFrameInContainerView](self, "_sourceViewFrameInContainerView");
    v44 = v43;
    goto LABEL_7;
  }
  -[AVTransition transitionContext](self, "transitionContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "isInteractive");

  if (v37)
    goto LABEL_6;
  -[AVTransition transitionContext](self, "transitionContext");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "containerView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");
  v54 = v53;
  v56 = v55;
  v58 = v57;
  v60 = v59;

  if (v5 == 1)
  {
    v62.origin.x = v54;
    v62.origin.y = v56;
    v62.size.width = v58;
    v62.size.height = v60;
    CGRectGetHeight(v62);
  }
  -[AVTransition presentationContext](self, "presentationContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "presentedView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v44;
LABEL_7:
  objc_msgSend(v44, "setFrame:");

  -[AVTransition presentationContext](self, "presentationContext");
  v61 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "presentedPresentationContainerView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "presentingTransition");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "initialInterfaceOrientation");
  -[AVTransition presentationContext](self, "presentationContext");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "presentingTransition");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "willStartPresentationTransitionFromInterfaceOrientation:toOrientation:needsCounterRotation:", v48, objc_msgSend(v50, "finalInterfaceOrientation"), 0);

}

- (void)_dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CGRect v57;

  -[AVTransition presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertSubview:belowSubview:", v7, v9);

  -[AVTransition presentationContext](self, "presentationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "touchBlockingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentedView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "insertSubview:belowSubview:", v14, v16);

  -[AVTransition transitionContext](self, "transitionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "viewForKey:", *MEMORY[0x1E0DC55D0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTransition transitionContext](self, "transitionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "viewForKey:", *MEMORY[0x1E0DC55C0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTransition transitionContext](self, "transitionContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "transform");
  }
  else
  {
    v55 = 0u;
    v56 = 0u;
    v54 = 0u;
  }
  *(_OWORD *)&self->_destinationViewTransform.a = v54;
  *(_OWORD *)&self->_destinationViewTransform.c = v55;
  *(_OWORD *)&self->_destinationViewTransform.tx = v56;
  if (v18)
  {
    -[AVTransition transitionContext](self, "transitionContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "finalFrameForViewController:", v22);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    v57.origin.x = v25;
    v57.origin.y = v27;
    v57.size.width = v29;
    v57.size.height = v31;
    if (!CGRectIsEmpty(v57))
    {
      objc_msgSend(v22, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

    }
    -[AVTransition transitionContext](self, "transitionContext", v54, v55, v56);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "containerView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransition presentationContext](self, "presentationContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "backgroundView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "insertSubview:belowSubview:", v18, v36);

    objc_msgSend(v22, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layoutIfNeeded");

    objc_msgSend(v22, "view");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 != v38)
      objc_msgSend(v18, "layoutIfNeeded");
  }
  -[AVTransition presentationContext](self, "presentationContext", v54, v55, v56);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "configuration");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "transitionStyle");

  -[AVTransition transitionContext](self, "transitionContext");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "isInteractive"))
  {

LABEL_13:
    -[AVTransition presentationContext](self, "presentationContext");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "backgroundView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAlpha:", 1.0);

    goto LABEL_14;
  }
  -[AVTransition presentationContext](self, "presentationContext");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "sourceView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44 || !v41)
    goto LABEL_13;
LABEL_14:
  -[AVTransition presentationContext](self, "presentationContext");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "presentedPresentationContainerView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "dismissingTransition");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "initialInterfaceOrientation");
  -[AVTransition presentationContext](self, "presentationContext");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "dismissingTransition");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "willStartDismissalTransitionFromInterfaceOrientation:toOrientation:needsCounterRotation:", v51, objc_msgSend(v53, "finalInterfaceOrientation"), 0);

}

- (void)pauseInteractiveTransition
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[AVTransition transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pauseInteractiveTransition");

  -[AVTransition allAnimators](self, "allAnimators");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "makeObjectsPerformSelector:", sel_pauseAnimation);

  -[AVTransition transitionAnimator](self, "transitionAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke;
  v6[3] = &unk_1E5BB4CA0;
  v6[4] = self;
  objc_msgSend(v5, "addAnimations:", v6);

}

- (void)updateWithPercentComplete:(double)a3 scale:(double)a4 translation:(CGPoint)a5 rotation:(double)a6
{
  CGFloat y;
  CGFloat x;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  void *v18;
  void *v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  y = a5.y;
  x = a5.x;
  v28 = *MEMORY[0x1E0C80C00];
  -[AVTransition transitionContext](self, "transitionContext", a3, a4, a5.x, a5.y, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateInteractiveTransition:", a3);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[AVTransition allAnimators](self, "allAnimators");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16++), "setFractionComplete:", a3);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v14);
  }

  v17 = *(_OWORD *)&self->_destinationViewTransform.c;
  *(_OWORD *)&v21.a = *(_OWORD *)&self->_destinationViewTransform.a;
  *(_OWORD *)&v21.c = v17;
  *(_OWORD *)&v21.tx = *(_OWORD *)&self->_destinationViewTransform.tx;
  memset(&v22, 0, sizeof(v22));
  CGAffineTransformTranslate(&v22, &v21, x, y);
  v20 = v22;
  CGAffineTransformScale(&v21, &v20, a4, a4);
  v22 = v21;
  -[AVTransition presentationContext](self, "presentationContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentedView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v22;
  objc_msgSend(v19, "setTransform:", &v21);

}

- (void)finishInteractiveTransition
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVTransition *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[AVTransition finishInteractiveTransition]";
    v12 = 1024;
    v13 = 262;
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  -[AVTransition transitionContext](self, "transitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishInteractiveTransition");

  -[AVTransition transitionAnimator](self, "transitionAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__AVTransition_finishInteractiveTransition__block_invoke;
  v9[3] = &unk_1E5BB4CA0;
  v9[4] = self;
  objc_msgSend(v5, "addAnimations:", v9);

  -[AVTransition transitionAnimator](self, "transitionAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __43__AVTransition_finishInteractiveTransition__block_invoke_2;
  v8[3] = &unk_1E5BB3318;
  v8[4] = self;
  objc_msgSend(v7, "addCompletion:", v8);

  -[AVTransition _startOrContinueAnimatorsReversed:](self, "_startOrContinueAnimatorsReversed:", 0);
}

- (void)_animateFinishInteractiveTransition
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  _OWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  BOOL IsEmpty;
  void *v31;
  void *v32;
  __int128 v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double Height;
  double v87;
  void *v88;
  void *v89;
  __int128 v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double Width;
  void *v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  id v117;
  id v118;
  uint64_t v119;
  _QWORD v120[5];
  CGAffineTransform v121;
  CGAffineTransform v122;
  _QWORD v123[5];
  CGAffineTransform v124;
  _QWORD v125[5];
  CGAffineTransform buf;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;

  -[AVTransition presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "transitionStyle");

  -[AVTransition presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "transitionType");

  switch(v7)
  {
    case 0:
      _AVLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.a) = 0;
        _os_log_error_impl(&dword_1AC4B1000, v26, OS_LOG_TYPE_ERROR, "Unexpected", (uint8_t *)&buf, 2u);
      }
      goto LABEL_41;
    case 2:
      -[AVTransition presentationContext](self, "presentationContext");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sourceView");
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        v29 = (void *)v28;
        -[AVTransition _sourceViewFrameInContainerView](self, "_sourceViewFrameInContainerView");
        IsEmpty = CGRectIsEmpty(v127);

        if (!IsEmpty)
        {
          -[AVTransition _freezeDismissingViewForFinishing](self, "_freezeDismissingViewForFinishing");
          -[AVTransition presentationContext](self, "presentationContext");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "presentedView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          *(_OWORD *)&buf.a = *MEMORY[0x1E0C9BAA8];
          *(_OWORD *)&buf.c = v33;
          *(_OWORD *)&buf.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          objc_msgSend(v32, "setTransform:", &buf);

          -[AVTransition presentationContext](self, "presentationContext");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "presentedView");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[AVTransition _sourceViewFrameInContainerView](self, "_sourceViewFrameInContainerView");
          objc_msgSend(v35, "setFrame:");

          v36 = (void *)MEMORY[0x1E0DC3F10];
          v123[0] = MEMORY[0x1E0C809B0];
          v123[1] = 3221225472;
          v123[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_4;
          v123[3] = &unk_1E5BB4CA0;
          v123[4] = self;
          v37 = v123;
          goto LABEL_44;
        }
      }
      else
      {

      }
      -[AVTransition presentationContext](self, "presentationContext");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "dismissingTransition");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "wasInitiallyInteractive");

      if (!v55)
      {
        -[AVTransition transitionContext](self, "transitionContext");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "viewForKey:", *MEMORY[0x1E0DC55C0]);
        v118 = (id)objc_claimAutoreleasedReturnValue();

        -[AVTransition transitionContext](self, "transitionContext");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "viewForKey:", *MEMORY[0x1E0DC55D0]);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v118, "frame");
        v71 = v70;
        v73 = v72;
        objc_msgSend(v69, "frame");
        v75 = v74;
        v77 = v76;
        v79 = v78;
        v81 = v80;
        objc_msgSend(v69, "convertPoint:toView:", v118, v71, v73);
        v83 = v82;
        v85 = v84;
        v128.origin.x = v75;
        v128.origin.y = v77;
        v128.size.width = v79;
        v128.size.height = v81;
        Height = CGRectGetHeight(v128);
        v87 = Height;
        if (v75 == v83 && v77 == v85)
        {
          v77 = Height;
        }
        else
        {
          v129.origin.x = v75;
          v129.origin.y = v77;
          v129.size.width = v79;
          v129.size.height = v81;
          Width = CGRectGetWidth(v129);
          if (v83 == v87)
          {
            v75 = Width;
          }
          else if (v85 == Width)
          {
            v132.origin.x = v75;
            v132.origin.y = v77;
            v132.size.width = v79;
            v132.size.height = v81;
            v75 = -CGRectGetWidth(v132);
          }
          else
          {
            v133.origin.x = v75;
            v133.origin.y = v77;
            v133.size.width = v79;
            v133.size.height = v81;
            v77 = -CGRectGetHeight(v133);
          }
        }
        -[AVTransition presentationContext](self, "presentationContext");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "presentedView");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "setFrame:", v75, v77, v79, v81);

        -[AVTransition presentationContext](self, "presentationContext");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "backgroundView");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "setAlpha:", 0.0);

        if (!v5)
        {
          -[AVTransition presentationContext](self, "presentationContext");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "containerView");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v114, "setAlpha:", 0.0);

        }
        return;
      }
      -[AVTransition presentationContext](self, "presentationContext");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "presentedView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTransition presentationContext](self, "presentationContext");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "sourceView");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTransition _updateCornerAppearanceAttributesOfView:toSourceView:similarity:](self, "_updateCornerAppearanceAttributesOfView:toSourceView:similarity:", v57, v59, 1.0);

      -[AVTransition presentationContext](self, "presentationContext");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "backgroundView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setAlpha:", 0.0);

      -[AVTransition _freezeDismissingViewForFinishing](self, "_freezeDismissingViewForFinishing");
      -[AVTransition presentationContext](self, "presentationContext");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "presentedView");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTransition presentationContext](self, "presentationContext");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "presentedView");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      if (v65)
        objc_msgSend(v65, "transform");
      else
        memset(&v121, 0, sizeof(v121));
      CGAffineTransformScale(&v122, &v121, 0.001, 0.001);
      objc_msgSend(v63, "setTransform:", &v122);

      v36 = (void *)MEMORY[0x1E0DC3F10];
      v120[0] = MEMORY[0x1E0C809B0];
      v120[1] = 3221225472;
      v120[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_7;
      v120[3] = &unk_1E5BB4CA0;
      v120[4] = self;
      v37 = v120;
LABEL_44:
      objc_msgSend(v36, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v37, 0, 0.0, 0.0);
      return;
    case 1:
      -[AVTransition presentationContext](self, "presentationContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentingTransition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "wasInitiallyInteractive");

      -[AVTransition presentationContext](self, "presentationContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = (_OWORD *)MEMORY[0x1E0C9BAA8];
      v119 = v5;
      if (v10)
      {
        objc_msgSend(v11, "backgroundView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAlpha:", 1.0);

        -[AVTransition presentationContext](self, "presentationContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "presentedView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTransition presentationContext](self, "presentationContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "sourceView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTransition _updateCornerAppearanceAttributesOfView:toSourceView:similarity:](self, "_updateCornerAppearanceAttributesOfView:toSourceView:similarity:", v16, v18, 0.0);

        -[AVTransition presentationContext](self, "presentationContext");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "presentedView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTransition transitionContext](self, "transitionContext");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "containerView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bounds");
        objc_msgSend(v20, "setFrame:");

        -[AVTransition presentationContext](self, "presentationContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "presentedView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v13[1];
        *(_OWORD *)&buf.a = *v13;
        *(_OWORD *)&buf.c = v25;
        *(_OWORD *)&buf.tx = v13[2];
        objc_msgSend(v24, "setTransform:", &buf);

      }
      else
      {
        objc_msgSend(v11, "sourceView");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38)
        {
          v125[0] = MEMORY[0x1E0C809B0];
          v125[1] = 3221225472;
          v125[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke;
          v125[3] = &unk_1E5BB4CA0;
          v125[4] = self;
          objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v125, 0, 0.0, 0.0);
        }
      }
      -[AVTransition presentationContext](self, "presentationContext");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "presentingTransition");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "wasInitiallyInteractive");
      if ((v41 & 1) == 0)
      {
        -[AVTransition presentationContext](self, "presentationContext");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "sourceView");
        v43 = objc_claimAutoreleasedReturnValue();
        if (!v43)
        {

          goto LABEL_29;
        }
        v115 = v43;
        v117 = v42;
      }
      -[AVTransition presentationContext](self, "presentationContext", v115);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "presentingTransition");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "initialInterfaceOrientation");
      -[AVTransition presentationContext](self, "presentationContext");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "presentingTransition");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "finalInterfaceOrientation");

      if ((v41 & 1) == 0)
      {

      }
      if (v46 != v49)
      {
        memset(&buf, 0, sizeof(buf));
        -[AVTransition presentationContext](self, "presentationContext");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "presentingTransition");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        if (v51)
          objc_msgSend(v51, "rotationTransform");
        else
          memset(&buf, 0, sizeof(buf));

        -[AVTransition transitionContext](self, "transitionContext");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "containerView");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "bounds");
        v124 = buf;
        v131 = CGRectApplyAffineTransform(v130, &v124);
        v99 = v131.size.width;
        v100 = v131.size.height;

        v101 = *MEMORY[0x1E0C9D538];
        v102 = *(double *)(MEMORY[0x1E0C9D538] + 8);
        if (v99 < 0.0)
          v99 = -v99;
        if (v100 < 0.0)
          v100 = -v100;
        -[AVTransition presentationContext](self, "presentationContext");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "presentedView");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setFrame:", v101, v102, v99, v100);

        -[AVTransition presentationContext](self, "presentationContext");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "presentedView");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTransition transitionContext](self, "transitionContext");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v107, "containerView");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "bounds");
        UIRectGetCenter();
        objc_msgSend(v106, "setCenter:");

        -[AVTransition presentationContext](self, "presentationContext");
        v26 = objc_claimAutoreleasedReturnValue();
        -[NSObject presentedView](v26, "presentedView");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = buf;
        objc_msgSend(v95, "setTransform:", &v124);
LABEL_40:

LABEL_41:
        return;
      }
LABEL_29:
      -[AVTransition presentationContext](self, "presentationContext");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "presentedView");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&buf.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&buf.c = v90;
      *(_OWORD *)&buf.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      objc_msgSend(v89, "setTransform:", &buf);

      if (v119)
      {
        -[AVTransition presentationContext](self, "presentationContext");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "presentedView");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTransition transitionContext](self, "transitionContext");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "containerView");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "bounds");
        objc_msgSend(v92, "setFrame:");

        return;
      }
      -[AVTransition transitionContext](self, "transitionContext");
      v26 = objc_claimAutoreleasedReturnValue();
      -[NSObject containerView](v26, "containerView");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setAlpha:", 1.0);
      goto LABEL_40;
  }
}

- (void)_freezeDismissingViewForFinishing
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __49__AVTransition__freezeDismissingViewForFinishing__block_invoke;
  v2[3] = &unk_1E5BB4CA0;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v2);
}

- (void)cancelInteractiveTransition
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVTransition *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[AVTransition cancelInteractiveTransition]";
    v12 = 1024;
    v13 = 426;
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1AC4B1000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  -[AVTransition transitionContext](self, "transitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelInteractiveTransition");

  -[AVTransition transitionAnimator](self, "transitionAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__AVTransition_cancelInteractiveTransition__block_invoke;
  v9[3] = &unk_1E5BB4CA0;
  v9[4] = self;
  objc_msgSend(v5, "addAnimations:", v9);

  -[AVTransition transitionAnimator](self, "transitionAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __43__AVTransition_cancelInteractiveTransition__block_invoke_9;
  v8[3] = &unk_1E5BB3318;
  v8[4] = self;
  objc_msgSend(v7, "addCompletion:", v8);

  -[AVTransition _startOrContinueAnimatorsReversed:](self, "_startOrContinueAnimatorsReversed:", 1);
}

- (void)_animateAlongsideInteractivePresentationTransitionAnimationForCancelling
{
  void *v3;
  void *v4;
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _OWORD v14[3];

  -[AVTransition presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v14[0] = *MEMORY[0x1E0C9BAA8];
  v14[1] = v5;
  v14[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v4, "setTransform:", v14);

  -[AVTransition presentationContext](self, "presentationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition _sourceViewFrameInContainerView](self, "_sourceViewFrameInContainerView");
  objc_msgSend(v7, "setFrame:");

  -[AVTransition presentationContext](self, "presentationContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition _updateCornerAppearanceAttributesOfView:toSourceView:similarity:](self, "_updateCornerAppearanceAttributesOfView:toSourceView:similarity:", v9, v11, 1.0);

  -[AVTransition presentationContext](self, "presentationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", 0.0);

}

- (void)_animateAlongsideInteractiveDismissalTransitionAnimationForCancelling
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  void *v11;
  _OWORD v12[3];

  -[AVTransition presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition _updateCornerAppearanceAttributesOfView:toSourceView:similarity:](self, "_updateCornerAppearanceAttributesOfView:toSourceView:similarity:", v4, v6, 0.0);

  -[AVTransition presentationContext](self, "presentationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_OWORD *)&self->_destinationViewTransform.c;
  v12[0] = *(_OWORD *)&self->_destinationViewTransform.a;
  v12[1] = v9;
  v12[2] = *(_OWORD *)&self->_destinationViewTransform.tx;
  objc_msgSend(v8, "setTransform:", v12);

  -[AVTransition presentationContext](self, "presentationContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAlpha:", 1.0);

}

- (void)addRunAlongsideAnimationsIfNeeded
{
  void *v3;
  _QWORD v4[5];

  -[AVTransition clientAnimator](self, "clientAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__AVTransition_addRunAlongsideAnimationsIfNeeded__block_invoke;
  v4[3] = &unk_1E5BB4CA0;
  v4[4] = self;
  objc_msgSend(v3, "addAnimations:", v4);

}

- (void)completeTransition:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  _AVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    *(_DWORD *)buf = 136315650;
    v11 = "-[AVTransition completeTransition:]";
    v13 = "didComplete";
    v12 = 2080;
    if (v3)
      v6 = "YES";
    v14 = 2080;
    v15 = v6;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  -[AVTransition delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__AVTransition_completeTransition___block_invoke;
  v8[3] = &unk_1E5BB3340;
  v8[4] = self;
  v9 = v3;
  objc_msgSend(v7, "transitionWillComplete:success:continueBlock:", self, v3, v8);

}

- (void)_presentationTransitionDidEnd:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (a3)
  {
    -[AVTransition presentationContext](self, "presentationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransition delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionBackgroundViewBackgroundColor:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v7);

    -[AVTransition presentationContext](self, "presentationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentedView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransition delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transitionPresentedViewBackgroundColor:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v11);

    -[AVTransition presentationContext](self, "presentationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 1.0);

    -[AVTransition presentationContext](self, "presentationContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "touchBlockingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlpha:", 1.0);

  }
  -[AVTransition presentationContext](self, "presentationContext");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentedView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 1.0);

}

- (void)_dismissalTransitionDidEnd:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (!a3)
  {
    -[AVTransition presentationContext](self, "presentationContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 1.0);

    -[AVTransition presentationContext](self, "presentationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "touchBlockingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    -[AVTransition presentationContext](self, "presentationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransition delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transitionBackgroundViewBackgroundColor:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v11);

    -[AVTransition presentationContext](self, "presentationContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentedView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransition delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transitionPresentedViewBackgroundColor:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v15);

  }
  -[AVTransition presentationContext](self, "presentationContext");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentedView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", 1.0);

}

- (void)_startOrContinueAnimatorsReversed:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AVTransition allAnimators](self, "allAnimators", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    if (v3)
      v8 = 0.0;
    else
      v8 = 0.6;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "state");
        if (v11 == 2)
          goto LABEL_11;
        if (v11 != 1)
        {
          if (v11)
            continue;
LABEL_11:
          objc_msgSend(v10, "startAnimation");
          continue;
        }
        if (objc_msgSend(v10, "isRunning"))
          objc_msgSend(v10, "pauseAnimation");
        objc_msgSend(v10, "setReversed:", v3);
        objc_msgSend(v10, "timingParameters");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "continueAnimationWithTimingParameters:durationFactor:", v12, v8);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (CGRect)_initialFrameForPresentedView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[AVTransition presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isBeingPresented"))
  {
    -[AVTransition _sourceViewFrameInContainerView](self, "_sourceViewFrameInContainerView");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    -[AVTransition presentationContext](self, "presentationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentedView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v6 = v15;
    v8 = v16;
    v10 = v17;
    v12 = v18;

  }
  v19 = v6;
  v20 = v8;
  v21 = v10;
  v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)_finalFrameForPresentedView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[AVTransition presentationContext](self, "presentationContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isBeingPresented") & 1) != 0)
  {
    -[AVTransition transitionContext](self, "transitionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTransition presentationContext](self, "presentationContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finalFrameForViewController:", v7);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    -[AVTransition _sourceViewFrameInContainerView](self, "_sourceViewFrameInContainerView");
    v9 = v16;
    v11 = v17;
    v13 = v18;
    v15 = v19;
  }

  v20 = v9;
  v21 = v11;
  v22 = v13;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGAffineTransform)_transformForScale:(SEL)a3 translation:(double)a4 rotation:(CGPoint)a5 locationInWindow:(double)a6 sourceRectInContainerView:(CGPoint)a7
{
  double y;
  double x;
  double v10;
  double v11;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat Height;
  CGFloat v26;
  CGFloat v27;
  CGFloat width;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  y = a7.y;
  x = a7.x;
  v10 = a5.y;
  v11 = a5.x;
  memset(&v48, 0, sizeof(v48));
  CGAffineTransformMakeScale(&v48, a4, a4);
  -[AVTransition transitionContext](self, "transitionContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition transitionContext](self, "transitionContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "containerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "window");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertPoint:fromView:", v18, x - v11, y - v10);
  v20 = v19;
  v43 = v21;
  v44 = v19;
  v22 = v21;

  v23 = v20 - CGRectGetMinX(a8);
  v24 = v22 - CGRectGetMinY(a8);
  v41 = v23 / CGRectGetWidth(a8);
  Height = CGRectGetHeight(a8);
  v47 = v48;
  v39 = v24 / Height;
  v49 = CGRectApplyAffineTransform(a8, &v47);
  v26 = v49.origin.x;
  v27 = v49.origin.y;
  width = v49.size.width;
  v29 = v49.size.height;
  v30 = CGRectGetWidth(v49);
  v50.origin.x = v26;
  v50.origin.y = v27;
  v50.size.width = width;
  v50.size.height = v29;
  v42 = CGRectGetMinX(v50) + v30 * v41;
  v51.origin.x = v26;
  v51.origin.y = v27;
  v51.size.width = width;
  v51.size.height = v29;
  v31 = CGRectGetHeight(v51);
  v52.origin.x = v26;
  v52.origin.y = v27;
  v52.size.width = width;
  v52.size.height = v29;
  v40 = CGRectGetMinY(v52) + v31 * v39;
  UIRectGetCenter();
  v38 = v32;
  UIRectGetCenter();
  v48.tx = v38 - v33;
  UIRectGetCenter();
  v35 = v34;
  UIRectGetCenter();
  v48.tx = v44 - v42 + a5.x + v48.tx;
  v48.ty = v43 - v40 + a5.y + v35 - v36;
  v47 = v48;
  return CGAffineTransformRotate(retstr, &v47, a6);
}

- (void)_updateCornerAppearanceAttributesOfView:(id)a3 toSourceView:(id)a4 similarity:(double)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  id v13;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "layer");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = fmin(fmax(a5, 0.0), 1.0);
  objc_msgSend(v8, "setClipsToBounds:", 1);

  if (v10 <= 0.0)
  {
    objc_msgSend(v13, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);
  }
  else
  {
    objc_msgSend(v9, "cornerCurve");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerCurve:", v11);

  }
  objc_msgSend(v9, "cornerRadius");
  objc_msgSend(v13, "setCornerRadius:", v10 * v12);
  objc_msgSend(v13, "setMaskedCorners:", objc_msgSend(v9, "maskedCorners"));

}

- (CGRect)_sourceViewFrameInContainerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double MinY;
  double v54;
  double Height;
  CGFloat MidX;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect result;
  CGRect v68;

  -[AVTransition transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  MidX = CGRectGetMidX(v57);
  -[AVTransition transitionContext](self, "transitionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  Height = CGRectGetHeight(v58);
  -[AVTransition transitionContext](self, "transitionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  MinY = CGRectGetMinY(v59);
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);

  -[AVTransition presentationContext](self, "presentationContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceView");
  v12 = objc_claimAutoreleasedReturnValue();
  v54 = v10;
  v52 = v9;
  if (!v12)
  {

    goto LABEL_5;
  }
  v13 = (void *)v12;
  -[AVTransition presentationContext](self, "presentationContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sourceView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_isInAWindow");

  if (!v16)
  {
LABEL_5:
    -[AVTransition transitionContext](self, "transitionContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v32 = CGRectGetMidX(v60);
    -[AVTransition transitionContext](self, "transitionContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "containerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v37 = CGRectGetHeight(v61);
    -[AVTransition transitionContext](self, "transitionContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "containerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v34 = CGRectGetMinY(v62) + v37 * 0.75;
    goto LABEL_6;
  }
  -[AVTransition transitionContext](self, "transitionContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "containerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTransition presentationContext](self, "presentationContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sourceView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[AVTransition presentationContext](self, "presentationContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sourceView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "convertRect:fromView:", v30, v22, v24, v26, v28);
  v32 = v31;
  v34 = v33;
  v9 = v35;
  v10 = v36;
LABEL_6:

  -[AVTransition transitionContext](self, "transitionContext");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "containerView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bounds");
  v68.origin.x = v40;
  v68.origin.y = v41;
  v68.size.width = v42;
  v68.size.height = v43;
  v63.origin.x = v32;
  v63.origin.y = v34;
  v63.size.width = v9;
  v63.size.height = v10;
  v64 = CGRectIntersection(v63, v68);
  x = v64.origin.x;
  y = v64.origin.y;
  width = v64.size.width;
  v47 = v64.size.height;

  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = v47;
  if (CGRectIsEmpty(v65)
    || (v66.origin.x = v32, v66.origin.y = v34, v66.size.width = v9, v66.size.height = v10, CGRectIsInfinite(v66)))
  {
    v32 = MidX;
    v9 = v52;
    v34 = MinY + Height * 0.75;
    v10 = v54;
  }
  v48 = v32;
  v49 = v34;
  v50 = v9;
  v51 = v10;
  result.size.height = v51;
  result.size.width = v50;
  result.origin.y = v49;
  result.origin.x = v48;
  return result;
}

- (AVPresentationContext)presentationContext
{
  return self->_presentationContext;
}

- (void)setPresentationContext:(id)a3
{
  objc_storeStrong((id *)&self->_presentationContext, a3);
}

- (AVTransitionDelegate)delegate
{
  return (AVTransitionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIViewControllerContextTransitioningEx)transitionContext
{
  return (UIViewControllerContextTransitioningEx *)objc_loadWeakRetained((id *)&self->_transitionContext);
}

- (UIViewPropertyAnimator)transitionAnimator
{
  return self->_transitionAnimator;
}

- (UIViewPropertyAnimator)clientAnimator
{
  return self->_clientAnimator;
}

- (NSMutableArray)allAnimators
{
  return self->_allAnimators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAnimators, 0);
  objc_storeStrong((id *)&self->_clientAnimator, 0);
  objc_storeStrong((id *)&self->_transitionAnimator, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationContext, 0);
}

void __35__AVTransition_completeTransition___block_invoke(uint64_t a1, int a2)
{
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelInteractiveTransition");
  }
  else
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = 1.0;
    else
      v3 = 0.0;
    objc_msgSend(*(id *)(a1 + 32), "transitionContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateInteractiveTransition:", v3);

    objc_msgSend(*(id *)(a1 + 32), "presentationContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "transitionType");

    if (v6)
    {
      if (v6 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "_presentationTransitionDidEnd:", *(unsigned __int8 *)(a1 + 40));
      }
      else if (v6 == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "_dismissalTransitionDidEnd:", *(unsigned __int8 *)(a1 + 40));
      }
    }
    else
    {
      _AVLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v10) = 0;
        _os_log_error_impl(&dword_1AC4B1000, v7, OS_LOG_TYPE_ERROR, "Unexpected", (uint8_t *)&v10, 2u);
      }

    }
    _AVLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[AVTransition completeTransition:]_block_invoke";
      v12 = 1024;
      v13 = 507;
      _os_log_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v10, 0x12u);
    }

    objc_msgSend(*(id *)(a1 + 32), "transitionContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "completeTransition:", *(unsigned __int8 *)(a1 + 40));

  }
}

void __49__AVTransition_addRunAlongsideAnimationsIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_alongsideAnimationsCount");

  if (v3 >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionContext");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__runAlongsideAnimations");

  }
}

void __43__AVTransition_cancelInteractiveTransition__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionType");

  if (v3)
  {
    if (v3 == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_animateAlongsideInteractiveDismissalTransitionAnimationForCancelling");
    }
    else if (v3 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_animateAlongsideInteractivePresentationTransitionAnimationForCancelling");
    }
  }
  else
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "Unexpected", v5, 2u);
    }

  }
}

uint64_t __43__AVTransition_cancelInteractiveTransition__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 0);
}

void __49__AVTransition__freezeDismissingViewForFinishing__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");

  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "transform");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }

  v14 = 0uLL;
  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  objc_msgSend(v8, "setTransform:", v11);

  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentedView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIRectGetCenter();
  objc_msgSend(v10, "setCenter:");

}

uint64_t __51__AVTransition__animateFinishInteractiveTransition__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_2;
  v5[3] = &unk_1E5BB4CA0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.5);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_3;
  v4[3] = &unk_1E5BB4CA0;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.5, 0.5);
}

uint64_t __51__AVTransition__animateFinishInteractiveTransition__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  _QWORD v5[5];

  v2 = MEMORY[0x1E0C809B0];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_5;
  v5[3] = &unk_1E5BB4CA0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.0, 0.5);
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_6;
  v4[3] = &unk_1E5BB4CA0;
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, 0.5, 0.5);
}

uint64_t __51__AVTransition__animateFinishInteractiveTransition__block_invoke_7(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__AVTransition__animateFinishInteractiveTransition__block_invoke_8;
  v2[3] = &unk_1E5BB4CA0;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v2, 0.25, 0.75);
}

void __51__AVTransition__animateFinishInteractiveTransition__block_invoke_8(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __51__AVTransition__animateFinishInteractiveTransition__block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __51__AVTransition__animateFinishInteractiveTransition__block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "presentationContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateCornerAppearanceAttributesOfView:toSourceView:similarity:", v3, v5, 1.0);

}

void __51__AVTransition__animateFinishInteractiveTransition__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "presentationContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateCornerAppearanceAttributesOfView:toSourceView:similarity:", v3, v5, 0.0);

}

void __51__AVTransition__animateFinishInteractiveTransition__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __43__AVTransition_finishInteractiveTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animateFinishInteractiveTransition");
}

uint64_t __43__AVTransition_finishInteractiveTransition__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

uint64_t __42__AVTransition_pauseInteractiveTransition__block_invoke(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke_2;
  v2[3] = &unk_1E5BB4CA0;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v2, 0, 0.0, 0.0);
}

void __42__AVTransition_pauseInteractiveTransition__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  _QWORD *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t v11[16];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionType");

  if (v3)
  {
    if (v3 == 2)
    {
      v10 = MEMORY[0x1E0C809B0];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke_5;
      v13[3] = &unk_1E5BB4CA0;
      v13[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v13, 0.0, 0.5);
      v5 = (void *)MEMORY[0x1E0DC3F10];
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke_6;
      v12[3] = &unk_1E5BB4CA0;
      v12[4] = *(_QWORD *)(a1 + 32);
      v6 = 0.5;
      v7 = 0.5;
      v8 = v12;
    }
    else
    {
      if (v3 != 1)
        return;
      v4 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke_3;
      v15[3] = &unk_1E5BB4CA0;
      v15[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v15, 0.0, 0.5);
      v5 = (void *)MEMORY[0x1E0DC3F10];
      v14[0] = v4;
      v14[1] = 3221225472;
      v14[2] = __42__AVTransition_pauseInteractiveTransition__block_invoke_4;
      v14[3] = &unk_1E5BB4CA0;
      v14[4] = *(_QWORD *)(a1 + 32);
      v6 = 0.25;
      v7 = 0.75;
      v8 = v14;
    }
    objc_msgSend(v5, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v8, v6, v7);
  }
  else
  {
    _AVLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v9, OS_LOG_TYPE_ERROR, "Unexpected", v11, 2u);
    }

  }
}

void __42__AVTransition_pauseInteractiveTransition__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "presentationContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateCornerAppearanceAttributesOfView:toSourceView:similarity:", v3, v5, 0.0);

}

void __42__AVTransition_pauseInteractiveTransition__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

void __42__AVTransition_pauseInteractiveTransition__block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __42__AVTransition_pauseInteractiveTransition__block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "presentationContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateCornerAppearanceAttributesOfView:toSourceView:similarity:", v3, v5, 1.0);

}

void __42__AVTransition_startInteractiveTransition__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "presentationContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionType");

  if (v3)
  {
    if (v3 == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_dismissalTransitionWillBegin");
    }
    else if (v3 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_presentationTransitionWillBegin");
    }
  }
  else
  {
    _AVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_ERROR, "Unexpected", v5, 2u);
    }

  }
}

@end
