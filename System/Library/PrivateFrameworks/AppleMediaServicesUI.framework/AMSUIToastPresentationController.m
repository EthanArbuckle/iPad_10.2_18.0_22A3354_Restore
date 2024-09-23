@implementation AMSUIToastPresentationController

- (AMSUIToastPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  AMSUITouchForwardingView *v9;
  _OWORD *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AMSUIToastPresentationController;
  v4 = -[AMSUIToastPresentationController initWithPresentedViewController:presentingViewController:](&v15, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDC48]), "initWithDimensions:", 1);
    v6 = (void *)*((_QWORD *)v4 + 49);
    *((_QWORD *)v4 + 49) = v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDC40]), "initWithDimensions:", 1);
    v8 = (void *)*((_QWORD *)v4 + 48);
    *((_QWORD *)v4 + 48) = v7;

    objc_msgSend(*((id *)v4 + 48), "_setRegion:", *((_QWORD *)v4 + 49));
    objc_msgSend(*((id *)v4 + 48), "_setDelegate:", v4);
    v4[352] = 1;
    v9 = [AMSUITouchForwardingView alloc];
    v10 = (_OWORD *)MEMORY[0x24BDBF090];
    v11 = -[AMSUITouchForwardingView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    v12 = (void *)*((_QWORD *)v4 + 52);
    *((_QWORD *)v4 + 52) = v11;

    v13 = v10[1];
    *(_OWORD *)(v4 + 424) = *v10;
    *(_OWORD *)(v4 + 440) = v13;
    *((_QWORD *)v4 + 46) = 0x4014000000000000;
  }
  return (AMSUIToastPresentationController *)v4;
}

- (void)containerViewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AMSUIToastPresentationController;
  -[AMSUIToastPresentationController containerViewWillLayoutSubviews](&v12, sel_containerViewWillLayoutSubviews);
  -[AMSUIToastPresentationController setLastFrameOfPresentedViewInContainerView:](self, "setLastFrameOfPresentedViewInContainerView:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[AMSUIToastPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AMSUIToastPresentationController presentedView](self, "presentedView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIToastPresentationController;
  -[AMSUIToastPresentationController dismissalTransitionWillBegin](&v4, sel_dismissalTransitionWillBegin);
  -[AMSUIToastPresentationController dismissalTimer](self, "dismissalTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[AMSUIToastPresentationController setDismissalTimer:](self, "setDismissalTimer:", 0);
}

- (int64_t)presentationStyle
{
  return 6;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
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
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[7];
  _QWORD v49[5];
  _QWORD v50[5];
  CGRect v51;
  CGRect result;

  -[AMSUIToastPresentationController presentedView](self, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIToastPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !v3)
  {

    goto LABEL_8;
  }
  -[AMSUIToastPresentationController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_8:
    v13 = *MEMORY[0x24BDBF090];
    v14 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v16 = *(double *)(MEMORY[0x24BDBF090] + 24);
    goto LABEL_9;
  }
  -[AMSUIToastPresentationController lastFrameOfPresentedViewInContainerView](self, "lastFrameOfPresentedViewInContainerView");
  if (!CGRectEqualToRect(v51, *MEMORY[0x24BDBF090]))
  {
    -[AMSUIToastPresentationController lastFrameOfPresentedViewInContainerView](self, "lastFrameOfPresentedViewInContainerView");
    v13 = v21;
    v14 = v22;
    v15 = v23;
    v16 = v24;
    goto LABEL_10;
  }
  -[AMSUIToastPresentationController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSize");
  v9 = v8;

  if (v9 == 0.0)
  {
    -[AMSUIToastPresentationController containerView](self, "containerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "frame");
    v12 = v25 + -24.0;
  }
  else
  {
    -[AMSUIToastPresentationController presentedViewController](self, "presentedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredContentSize");
    v12 = v11;
  }

  v15 = fmin(v12, 556.0);
  -[AMSUIToastPresentationController containerView](self, "containerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v16 = v27;

  if (objc_msgSend(v3, "_wantsAutolayout"))
    objc_msgSend(v3, "systemLayoutSizeFittingSize:", v15, v16);
  else
    objc_msgSend(v3, "sizeThatFits:", v15, v16);
  if (v28 < v16)
    v16 = v28;
  -[AMSUIToastPresentationController containerView](self, "containerView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  v13 = (v30 - v15) * 0.5;

  -[AMSUIToastPresentationController containerView](self, "containerView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32 - v16;
  -[AMSUIToastPresentationController _bottomMargin](self, "_bottomMargin");
  v35 = v33 - v34;

  -[AMSUIToastPresentationController _yOffset](self, "_yOffset");
  v37 = v35 - v36;
  -[AMSUIToastPresentationController containerView](self, "containerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  v40 = v39;
  -[AMSUIToastPresentationController _bottomMargin](self, "_bottomMargin");
  v42 = v16 * 0.5 + v41 + v40;

  -[AMSUIToastPresentationController interactiveRegion](self, "interactiveRegion");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = MEMORY[0x24BDAC760];
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke;
  v50[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v50[4] = v37;
  objc_msgSend(v43, "_mutateMinimumPoint:", v50);

  -[AMSUIToastPresentationController interactiveRegion](self, "interactiveRegion");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v44;
  v49[1] = 3221225472;
  v49[2] = __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke_2;
  v49[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v49[4] = v42;
  objc_msgSend(v45, "_mutateMaximumPoint:", v49);

  -[AMSUIToastPresentationController interactor](self, "interactor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v44;
  v48[1] = 3221225472;
  v48[2] = __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke_3;
  v48[3] = &unk_24CB50920;
  v48[4] = self;
  *(double *)&v48[5] = v37;
  *(double *)&v48[6] = v42;
  objc_msgSend(v46, "_mutateUnconstrainedPoint:", v48);

  -[AMSUIToastPresentationController interactor](self, "interactor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(double *)objc_msgSend(v47, "_presentationPoint");

LABEL_9:
  -[AMSUIToastPresentationController setLastFrameOfPresentedViewInContainerView:](self, "setLastFrameOfPresentedViewInContainerView:", v13, v14, v15, v16);
LABEL_10:

  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

double __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke(uint64_t a1, double *a2)
{
  double result;

  result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke_2(uint64_t a1, double *a2)
{
  double result;

  result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __71__AMSUIToastPresentationController_frameOfPresentedViewInContainerView__block_invoke_3(uint64_t a1, double *a2)
{
  int v4;
  uint64_t v5;
  double result;

  v4 = objc_msgSend(*(id *)(a1 + 32), "isShowing");
  v5 = 48;
  if (v4)
    v5 = 40;
  result = *(double *)(a1 + v5);
  *a2 = result;
  return result;
}

- (void)presentationTransitionWillBegin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUIToastPresentationController;
  -[AMSUIToastPresentationController presentationTransitionWillBegin](&v3, sel_presentationTransitionWillBegin);
  -[AMSUIToastPresentationController _setupPassthroughView](self, "_setupPassthroughView");
  -[AMSUIToastPresentationController _setupPanGestureRecognizer](self, "_setupPanGestureRecognizer");
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AMSUIToastPresentationController;
  -[AMSUIToastPresentationController presentationTransitionDidEnd:](&v5, sel_presentationTransitionDidEnd_);
  if (v3)
    -[AMSUIToastPresentationController _startDismissTimer](self, "_startDismissTimer");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AMSUIToastPresentationController;
  v4 = a3;
  -[AMSUIToastPresentationController traitCollectionDidChange:](&v15, sel_traitCollectionDidChange_, v4);
  -[AMSUIToastPresentationController traitCollection](self, "traitCollection", v15.receiver, v15.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIToastPresentationController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "horizontalSizeClass");
  v10 = objc_msgSend(v4, "horizontalSizeClass");

  -[AMSUIToastPresentationController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "verticalSizeClass");
  v13 = objc_msgSend(v4, "verticalSizeClass");

  if (v12 != v13 || v9 != v10 || v6 != v7)
  {
    -[AMSUIToastPresentationController containerView](self, "containerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

  }
}

- (void)_hyperInteractorApplyPresentationPoint:(id)a3
{
  void *v4;
  id v5;

  -[AMSUIToastPresentationController containerView](self, "containerView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[AMSUIToastPresentationController containerView](self, "containerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (void)_setupPassthroughView
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  -[AMSUIToastPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AMSUIToastPresentationController containerView](self, "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[AMSUIToastPresentationController touchForwardingView](self, "touchForwardingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    -[AMSUIToastPresentationController containerView](self, "containerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIToastPresentationController touchForwardingView](self, "touchForwardingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "insertSubview:atIndex:", v15, 0);

    -[AMSUIToastPresentationController passthroughViews](self, "passthroughViews");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      -[AMSUIToastPresentationController presentingViewController](self, "presentingViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v18;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[AMSUIToastPresentationController setPassthroughViews:](self, "setPassthroughViews:", v19);

    }
  }
}

- (void)_startDismissTimer
{
  double v3;
  void *v4;
  void *v5;
  id v6;

  -[AMSUIToastPresentationController dismissDelayTimeInterval](self, "dismissDelayTimeInterval");
  if (v3 > 0.0)
  {
    -[AMSUIToastPresentationController dismissalTimer](self, "dismissalTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    v5 = (void *)MEMORY[0x24BDBCF40];
    -[AMSUIToastPresentationController dismissDelayTimeInterval](self, "dismissDelayTimeInterval");
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__dismissTimerFired_, 0, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSUIToastPresentationController setDismissalTimer:](self, "setDismissalTimer:", v6);

  }
}

- (void)_setupPanGestureRecognizer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AMSUIToastPresentationController presentedView](self, "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", self, sel__didPanPresentedView_);
    -[AMSUIToastPresentationController setPanRecognizer:](self, "setPanRecognizer:", v4);

    -[AMSUIToastPresentationController presentedView](self, "presentedView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[AMSUIToastPresentationController panRecognizer](self, "panRecognizer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v5);

  }
}

- (void)_didPanPresentedView:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  CGRect v33;

  v4 = a3;
  -[AMSUIToastPresentationController presentedView](self, "presentedView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[AMSUIToastPresentationController containerView](self, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[AMSUIToastPresentationController dismissalTimer](self, "dismissalTimer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invalidate");

      v9 = objc_msgSend(v4, "state");
      if ((unint64_t)(v9 - 3) < 2)
      {
        -[AMSUIToastPresentationController containerView](self, "containerView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "translationInView:", v20);
        v22 = v21;

        -[AMSUIToastPresentationController containerView](self, "containerView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "velocityInView:", v23);
        v25 = v24;

        if (v25 < 400.0 && v22 <= 20.0 && -[AMSUIToastPresentationController isShowing](self, "isShowing"))
        {
          -[AMSUIToastPresentationController interactor](self, "interactor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = *(double *)objc_msgSend(v26, "_projectedPoint");
          -[AMSUIToastPresentationController containerView](self, "containerView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "bounds");
          -[AMSUIToastPresentationController setShowing:](self, "setShowing:", v27 < CGRectGetMaxX(v33));

          -[AMSUIToastPresentationController interactor](self, "interactor");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "_interactionEnded");

          -[AMSUIToastPresentationController containerView](self, "containerView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setTranslation:inView:", v30, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

          -[AMSUIToastPresentationController _startDismissTimer](self, "_startDismissTimer");
        }
        else
        {
          -[AMSUIToastPresentationController _dismissToast](self, "_dismissToast");
        }
      }
      else
      {
        if (v9 == 2)
        {
LABEL_7:
          -[AMSUIToastPresentationController containerView](self, "containerView");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "translationInView:", v12);
          v14 = v13;

          v32 = v14;
          -[AMSUIToastPresentationController containerView](self, "containerView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "velocityInView:", v15);
          v17 = v16;

          -[AMSUIToastPresentationController containerView](self, "containerView", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setNeedsLayout");

          -[AMSUIToastPresentationController interactor](self, "interactor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_interactionChangedCopyingTranslation:velocity:", &v32, &v31);

          goto LABEL_13;
        }
        if (v9 == 1)
        {
          -[AMSUIToastPresentationController containerView](self, "containerView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setNeedsLayout");

          -[AMSUIToastPresentationController interactor](self, "interactor");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_interactionBegan");

          goto LABEL_7;
        }
      }
    }
  }
LABEL_13:

}

- (NSArray)passthroughViews
{
  void *v2;
  void *v3;

  -[AMSUIToastPresentationController touchForwardingView](self, "touchForwardingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passthroughViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setPassthroughViews:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSUIToastPresentationController touchForwardingView](self, "touchForwardingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPassthroughViews:", v4);

}

- (void)setShowing:(BOOL)a3
{
  id v3;

  if (self->_showing != a3)
  {
    -[AMSUIToastPresentationController containerView](self, "containerView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (double)_yOffset
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[AMSUIToastPresentationController relativeTabBarController](self, "relativeTabBarController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[AMSUIToastPresentationController presentingViewController](self, "presentingViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v3 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;

    if (!v3)
    {
      -[AMSUIToastPresentationController presentingViewController](self, "presentingViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tabBarController");
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[AMSUIToastPresentationController presentingViewController](self, "presentingViewController", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "childViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        if (v3)
        {

          goto LABEL_23;
        }
        v12 = *(id *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v3 = v12;
        else
          v3 = 0;

        if (!v3)
        {
          objc_msgSend(v12, "tabBarController");
          v3 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (v3)
  {
LABEL_23:
    objc_msgSend(v3, "tabBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v14 = v16;

  }
  else
  {
    -[AMSUIToastPresentationController containerView](self, "containerView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeAreaInsets");
    v14 = v13;
  }

  return v14;
}

- (void)_dismissToast
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[AMSUIToastPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMSUIToastPresentationController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__AMSUIToastPresentationController__dismissToast__block_invoke;
    v6[3] = &unk_24CB4F0E8;
    v6[4] = self;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  }
}

void __49__AMSUIToastPresentationController__dismissToast__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v1;
  else
    v5 = 0;

  if (v5)
  {
    objc_msgSend(v5, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(v5, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messageViewControllerDidDismiss:", v5);

    }
  }

}

- (double)_bottomMargin
{
  void *v2;
  uint64_t v3;
  double result;

  -[AMSUIToastPresentationController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  result = 16.0;
  if (v3 == 1)
    return 20.0;
  return result;
}

- (double)dismissDelayTimeInterval
{
  return self->_dismissDelayTimeInterval;
}

- (void)setDismissDelayTimeInterval:(double)a3
{
  self->_dismissDelayTimeInterval = a3;
}

- (UITabBarController)relativeTabBarController
{
  return self->_relativeTabBarController;
}

- (void)setRelativeTabBarController:(id)a3
{
  objc_storeStrong((id *)&self->_relativeTabBarController, a3);
}

- (_UIHyperInteractor)interactor
{
  return self->_interactor;
}

- (_UIHyperrectangle)interactiveRegion
{
  return self->_interactiveRegion;
}

- (NSTimer)dismissalTimer
{
  return self->_dismissalTimer;
}

- (void)setDismissalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalTimer, a3);
}

- (UIPanGestureRecognizer)panRecognizer
{
  return self->_panRecognizer;
}

- (void)setPanRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_panRecognizer, a3);
}

- (BOOL)isShowing
{
  return self->_showing;
}

- (CGRect)lastFrameOfPresentedViewInContainerView
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastFrameOfPresentedViewInContainerView.origin.x;
  y = self->_lastFrameOfPresentedViewInContainerView.origin.y;
  width = self->_lastFrameOfPresentedViewInContainerView.size.width;
  height = self->_lastFrameOfPresentedViewInContainerView.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastFrameOfPresentedViewInContainerView:(CGRect)a3
{
  self->_lastFrameOfPresentedViewInContainerView = a3;
}

- (AMSUITouchForwardingView)touchForwardingView
{
  return self->_touchForwardingView;
}

- (void)setTouchForwardingView:(id)a3
{
  objc_storeStrong((id *)&self->_touchForwardingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchForwardingView, 0);
  objc_storeStrong((id *)&self->_panRecognizer, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
  objc_storeStrong((id *)&self->_interactiveRegion, 0);
  objc_storeStrong((id *)&self->_interactor, 0);
  objc_storeStrong((id *)&self->_relativeTabBarController, 0);
  objc_storeStrong((id *)&self->_passthroughViews, 0);
}

@end
