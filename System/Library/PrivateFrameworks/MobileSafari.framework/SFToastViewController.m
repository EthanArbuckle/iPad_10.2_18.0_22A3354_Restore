@implementation SFToastViewController

- (SFToastViewController)initWithContentViewController:(id)a3
{
  id v5;
  SFToastViewController *v6;
  SFToastViewController *v7;
  SFToastViewController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFToastViewController;
  v6 = -[SFToastViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contentViewController, a3);
    v7->_dismissalMode = 0;
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  UIView *v6;
  UIView *contentContainerView;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  UIVisualEffectView *v17;
  UIVisualEffectView *backgroundVisualEffectView;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  NSLayoutConstraint *v24;
  NSLayoutConstraint *contentPreferredWidthConstraint;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *contentPreferredHeightConstraint;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *contentTopConstraint;
  NSLayoutConstraint *v33;
  NSLayoutConstraint *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  UIPanGestureRecognizer *v44;
  UIPanGestureRecognizer *panRecognizer;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  _QWORD v53[9];

  v53[7] = *MEMORY[0x1E0C80C00];
  v52.receiver = self;
  v52.super_class = (Class)SFToastViewController;
  -[SFToastViewController viewDidLoad](&v52, sel_viewDidLoad);
  -[SFToastViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIViewController preferredContentSize](self->_contentViewController, "preferredContentSize");
  if (v4 == 0.0)
    v5 = 48.0;
  else
    v5 = v4;
  v6 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 300.0, v5);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v6;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "CGColor");
  -[UIView layer](self->_contentContainerView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShadowColor:", v9);

  -[UIView layer](self->_contentContainerView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 1042536202;
  objc_msgSend(v11, "setShadowOpacity:", v12);

  -[UIView layer](self->_contentContainerView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShadowRadius:", 20.0);

  -[UIView layer](self->_contentContainerView, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShadowOffset:", 0.0, 5.0);

  -[UIViewController willMoveToParentViewController:](self->_contentViewController, "willMoveToParentViewController:", self);
  v15 = objc_alloc(MEMORY[0x1E0DC3F58]);
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (UIVisualEffectView *)objc_msgSend(v15, "initWithEffect:", v16);
  backgroundVisualEffectView = self->_backgroundVisualEffectView;
  self->_backgroundVisualEffectView = v17;

  -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundVisualEffectView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_backgroundVisualEffectView, "_setContinuousCornerRadius:", v5 * 0.5);
  -[UIView addSubview:](self->_contentContainerView, "addSubview:", self->_backgroundVisualEffectView);
  v19 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(MEMORY[0x1E0CB3718], "safari_constraintsMatchingFrameOfView:withFrameOfView:", self->_backgroundVisualEffectView, self->_contentContainerView);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activateConstraints:", v20);

  -[UIViewController view](self->_contentViewController, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setAutoresizingMask:", 18);
  -[UIView bounds](self->_contentContainerView, "bounds");
  objc_msgSend(v51, "setFrame:");
  -[UIView addSubview:](self->_contentContainerView, "addSubview:", v51);
  -[UIViewController didMoveToParentViewController:](self->_contentViewController, "didMoveToParentViewController:", self);
  objc_msgSend(v3, "addSubview:", self->_contentContainerView);
  -[UIView widthAnchor](self->_contentContainerView, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToConstant:", 300.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = 1144750080;
  objc_msgSend(v22, "sf_withPriority:", v23);
  v24 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentPreferredWidthConstraint = self->_contentPreferredWidthConstraint;
  self->_contentPreferredWidthConstraint = v24;

  -[UIView heightAnchor](self->_contentContainerView, "heightAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToConstant:", 48.0);
  v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentPreferredHeightConstraint = self->_contentPreferredHeightConstraint;
  self->_contentPreferredHeightConstraint = v27;

  -[UIView topAnchor](self->_contentContainerView, "topAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentTopConstraint = self->_contentTopConstraint;
  self->_contentTopConstraint = v31;

  v46 = (void *)MEMORY[0x1E0CB3718];
  v33 = self->_contentPreferredHeightConstraint;
  v53[0] = self->_contentPreferredWidthConstraint;
  v53[1] = v33;
  -[UIView widthAnchor](self->_contentContainerView, "widthAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintLessThanOrEqualToConstant:", 300.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = self->_contentTopConstraint;
  v53[2] = v49;
  v53[3] = v34;
  -[UIView leadingAnchor](self->_contentContainerView, "leadingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v3;
  objc_msgSend(v3, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53[4] = v36;
  -[UIView widthAnchor](self->_contentContainerView, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "widthAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53[5] = v39;
  -[UIView heightAnchor](self->_contentContainerView, "heightAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "heightAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53[6] = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 7);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "activateConstraints:", v43);

  v44 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__didReceivePan_);
  panRecognizer = self->_panRecognizer;
  self->_panRecognizer = v44;

  objc_msgSend(v35, "addGestureRecognizer:", self->_panRecognizer);
}

- (void)updateViewConstraints
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double contentOffset;
  double v9;
  double Height;
  objc_super v11;
  CGRect v12;
  CGRect v13;

  v11.receiver = self;
  v11.super_class = (Class)SFToastViewController;
  -[SFToastViewController updateViewConstraints](&v11, sel_updateViewConstraints);
  -[SFToastViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController preferredContentSize](self->_contentViewController, "preferredContentSize");
  v6 = v5;
  if (v4 == 0.0)
    v4 = 300.0;
  -[NSLayoutConstraint setConstant:](self->_contentPreferredWidthConstraint, "setConstant:", v4);
  v7 = 48.0;
  if (v6 != 0.0)
    v7 = v6;
  -[NSLayoutConstraint setConstant:](self->_contentPreferredHeightConstraint, "setConstant:", v7);
  contentOffset = self->_contentOffset;
  objc_msgSend(v3, "bounds");
  v9 = -CGRectGetHeight(v12);
  objc_msgSend(v3, "bounds");
  Height = CGRectGetHeight(v13);
  -[NSLayoutConstraint setConstant:](self->_contentTopConstraint, "setConstant:", SFRubberBandOffsetForOffset(contentOffset, v9, 0.0, Height));

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)SFToastViewController;
  -[SFToastViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[UIView bounds](self->_contentContainerView, "bounds");
  -[UIVisualEffectView _setContinuousCornerRadius:](self->_backgroundVisualEffectView, "_setContinuousCornerRadius:", CGRectGetHeight(v4) * 0.5);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFToastViewController;
  -[SFToastViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  self->_contentOffset = 0.0;
  -[SFToastViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConstraints");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFToastViewController;
  -[SFToastViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_remainingToastDuration = 0.0;
  -[SFToastViewController _scheduleToastTimerIfNeeded](self, "_scheduleToastTimerIfNeeded");
}

- (void)_scheduleToastTimerIfNeeded
{
  double remainingToastDuration;
  double v4;
  void *v5;
  NSTimer *v6;
  NSTimer *dismissalTimer;
  _QWORD v8[4];
  id v9;
  id location;

  if (self->_dismissalMode != 1 && !-[NSTimer isValid](self->_dismissalTimer, "isValid"))
  {
    remainingToastDuration = self->_remainingToastDuration;
    if (remainingToastDuration == 0.0)
    {
      remainingToastDuration = self->_toastDuration;
      if (remainingToastDuration == 0.0)
        remainingToastDuration = 6.0;
    }
    v4 = fmax(remainingToastDuration, 0.5);
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__SFToastViewController__scheduleToastTimerIfNeeded__block_invoke;
    v8[3] = &unk_1E21E2168;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, v4);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    dismissalTimer = self->_dismissalTimer;
    self->_dismissalTimer = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __52__SFToastViewController__scheduleToastTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissToastViewController:", v3);

    WeakRetained = v3;
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  NSTimer *dismissalTimer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFToastViewController;
  -[SFToastViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  -[NSTimer invalidate](self->_dismissalTimer, "invalidate");
  dismissalTimer = self->_dismissalTimer;
  self->_dismissalTimer = 0;

}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFToastViewController;
  -[SFToastViewController preferredContentSizeDidChangeForChildContentContainer:](&v5, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[SFToastViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConstraints");

}

- (void)_didReceivePan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  NSTimer *dismissalTimer;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  CGRect v27;
  CGRect v28;

  v4 = a3;
  if (-[NSTimer isValid](self->_dismissalTimer, "isValid"))
  {
    -[NSTimer fireDate](self->_dismissalTimer, "fireDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceNow");
    self->_remainingToastDuration = v6;

    -[NSTimer invalidate](self->_dismissalTimer, "invalidate");
    dismissalTimer = self->_dismissalTimer;
    self->_dismissalTimer = 0;

  }
  -[SFToastViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v8);
  self->_contentOffset = v9;
  objc_msgSend(v8, "setNeedsUpdateConstraints");
  if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4)
  {
    objc_msgSend(v4, "translationInView:", v8);
    v11 = v10;
    v13 = v12;
    objc_msgSend(v4, "velocityInView:", v8);
    v16 = SFProjectedOffsetForOffsetWithVelocity(v11, v13, v14, v15, *MEMORY[0x1E0DC5360], *MEMORY[0x1E0DC5360]);
    v18 = v17;
    objc_msgSend(v8, "bounds", (double)v16);
    v19 = CGRectGetHeight(v27) * -0.5;
    v20 = 0.0;
    if (v18 < v19)
    {
      objc_msgSend(v8, "bounds", 0.0);
      v20 = fmin(v18 + CGRectGetHeight(v28), 0.0);
    }
    self->_contentOffset = v20;
    v21 = (void *)MEMORY[0x1E0DC3F10];
    v22 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __40__SFToastViewController__didReceivePan___block_invoke;
    v25[3] = &unk_1E21E2050;
    v26 = v8;
    v24[0] = v22;
    v24[1] = 3221225472;
    v24[2] = __40__SFToastViewController__didReceivePan___block_invoke_2;
    v24[3] = &unk_1E21E2190;
    v24[4] = self;
    objc_msgSend(v21, "animateWithDuration:animations:completion:", v25, v24, 0.5);
    if (v18 < v19)
    {
      -[SFToastViewController delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dismissToastViewController:", self);

    }
  }

}

uint64_t __40__SFToastViewController__didReceivePan___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __40__SFToastViewController__didReceivePan___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleToastTimerIfNeeded");
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (SFToastViewControllerDelegate)delegate
{
  return (SFToastViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)dismissalMode
{
  return self->_dismissalMode;
}

- (void)setDismissalMode:(unint64_t)a3
{
  self->_dismissalMode = a3;
}

- (double)toastDuration
{
  return self->_toastDuration;
}

- (void)setToastDuration:(double)a3
{
  self->_toastDuration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_contentTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentPreferredHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentPreferredWidthConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end
