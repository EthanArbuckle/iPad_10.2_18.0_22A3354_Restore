@implementation CKBrowserFullscreenRevealPresentationController

- (CKBrowserFullscreenRevealPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  CKBrowserFullscreenRevealPresentationController *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIStatusBar *statusBar;
  void *v10;
  uint64_t v11;
  UIStatusBarWindow *statusBarWindow;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  v4 = -[CKBrowserFullscreenRevealPresentationController initWithPresentedViewController:presentingViewController:](&v15, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v4, sel_dimmingViewTapped_);
    -[CKBrowserFullscreenRevealPresentationController dimmingView](v4, "dimmingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addGestureRecognizer:", v5);

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "statusBar");
    v8 = objc_claimAutoreleasedReturnValue();
    statusBar = v4->_statusBar;
    v4->_statusBar = (UIStatusBar *)v8;

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusBarWindow");
    v11 = objc_claimAutoreleasedReturnValue();
    statusBarWindow = v4->_statusBarWindow;
    v4->_statusBarWindow = (UIStatusBarWindow *)v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v4, sel__willChangeStatusBarFrame_, *MEMORY[0x1E0CEB348], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  -[CKBrowserFullscreenRevealPresentationController dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (BOOL)_shouldGrabPresentersView
{
  return 1;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  -[CKBrowserFullscreenRevealPresentationController setPresenting:](self, "setPresenting:", 1);
  v6.receiver = self;
  v6.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  -[CKBrowserFullscreenRevealPresentationController presentationTransitionWillBegin](&v6, sel_presentationTransitionWillBegin);
  -[CKBrowserFullscreenRevealPresentationController _prepareViewHierarchyForPresentation](self, "_prepareViewHierarchyForPresentation");
  -[CKBrowserFullscreenRevealPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__CKBrowserFullscreenRevealPresentationController_presentationTransitionWillBegin__block_invoke;
  v5[3] = &unk_1E274B4D0;
  v5[4] = self;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

}

uint64_t __82__CKBrowserFullscreenRevealPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureViewsForPresentedState");
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[CKBrowserFullscreenRevealPresentationController setPresenting:](self, "setPresenting:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  -[CKBrowserFullscreenRevealPresentationController presentationTransitionDidEnd:](&v5, sel_presentationTransitionDidEnd_, v3);
  if (!v3)
    -[CKBrowserFullscreenRevealPresentationController _cleanupPresentation](self, "_cleanupPresentation");
}

- (void)dismissalTransitionWillBegin
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  objc_super v26;
  CGRect v27;
  CGRect v28;

  -[CKBrowserFullscreenRevealPresentationController setDismissing:](self, "setDismissing:", 1);
  v26.receiver = self;
  v26.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  -[CKBrowserFullscreenRevealPresentationController dismissalTransitionWillBegin](&v26, sel_dismissalTransitionWillBegin);
  -[CKBrowserFullscreenRevealPresentationController presentingSnapshotFrame](self, "presentingSnapshotFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v28.origin.x = v13;
  v28.origin.y = v14;
  v28.size.width = v15;
  v28.size.height = v16;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v17 = CGRectEqualToRect(v27, v28);

  if (!v17)
  {
    -[CKBrowserFullscreenRevealPresentationController containerView](self, "containerView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserFullscreenRevealPresentationController presentingSnapshotView](self, "presentingSnapshotView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertSubview:belowSubview:", v20, v21);

    -[CKBrowserFullscreenRevealPresentationController presentingSnapshotView](self, "presentingSnapshotView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeFromSuperview");

  }
  -[CKBrowserFullscreenRevealPresentationController presentedViewController](self, "presentedViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "transitionCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __79__CKBrowserFullscreenRevealPresentationController_dismissalTransitionWillBegin__block_invoke;
  v25[3] = &unk_1E274B4D0;
  v25[4] = self;
  objc_msgSend(v24, "animateAlongsideTransition:completion:", v25, 0);

}

uint64_t __79__CKBrowserFullscreenRevealPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureViewsForDismissedState");
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  BOOL v19;
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
  objc_super v31;
  CGRect v32;
  CGRect v33;

  v3 = a3;
  -[CKBrowserFullscreenRevealPresentationController setDismissing:](self, "setDismissing:", 0);
  v31.receiver = self;
  v31.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  -[CKBrowserFullscreenRevealPresentationController dismissalTransitionDidEnd:](&v31, sel_dismissalTransitionDidEnd_, v3);
  if (v3)
  {
    -[CKBrowserFullscreenRevealPresentationController _cleanupPresentation](self, "_cleanupPresentation");
  }
  else
  {
    -[CKBrowserFullscreenRevealPresentationController presentingSnapshotFrame](self, "presentingSnapshotFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v33.origin.x = v15;
    v33.origin.y = v16;
    v33.size.width = v17;
    v33.size.height = v18;
    v32.origin.x = v6;
    v32.origin.y = v8;
    v32.size.width = v10;
    v32.size.height = v12;
    v19 = CGRectEqualToRect(v32, v33);

    if (!v19)
    {
      -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "snapshotViewAfterScreenUpdates:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserFullscreenRevealPresentationController setPresentingSnapshotView:](self, "setPresentingSnapshotView:", v22);

      -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "frame");
      -[CKBrowserFullscreenRevealPresentationController setPresentingSnapshotFrame:](self, "setPresentingSnapshotFrame:");

      -[CKBrowserFullscreenRevealPresentationController containerView](self, "containerView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserFullscreenRevealPresentationController presentingSnapshotView](self, "presentingSnapshotView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "insertSubview:aboveSubview:", v26, v28);

      -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeFromSuperview");

    }
    -[CKBrowserFullscreenRevealPresentationController _configureViewsForPresentedState](self, "_configureViewsForPresentedState");
  }
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
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[3];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  -[CKBrowserFullscreenRevealPresentationController containerViewWillLayoutSubviews](&v28, sel_containerViewWillLayoutSubviews);
  if (!-[CKBrowserFullscreenRevealPresentationController isDismissing](self, "isDismissing")
    && !-[CKBrowserFullscreenRevealPresentationController isPresenting](self, "isPresenting"))
  {
    -[CKBrowserFullscreenRevealPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[CKBrowserFullscreenRevealPresentationController presentedViewController](self, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[CKBrowserFullscreenRevealPresentationController _viewsToApplyTransform](self, "_viewsToApplyTransform");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v22 = *MEMORY[0x1E0C9BAA8];
      v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
          v23[0] = v22;
          v23[1] = v21;
          v23[2] = v20;
          objc_msgSend(v18, "setTransform:", v23, v20, v21, v22);
          -[CKBrowserFullscreenRevealPresentationController containerView](self, "containerView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "bounds");
          objc_msgSend(v18, "setFrame:");

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v15);
    }

  }
}

- (void)containerViewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKBrowserFullscreenRevealPresentationController;
  -[CKBrowserFullscreenRevealPresentationController containerViewDidLayoutSubviews](&v13, sel_containerViewDidLayoutSubviews);
  if (!-[CKBrowserFullscreenRevealPresentationController isDismissing](self, "isDismissing")
    && !-[CKBrowserFullscreenRevealPresentationController isPresenting](self, "isPresenting"))
  {
    -[CKBrowserFullscreenRevealPresentationController _configureViewsForPresentedState](self, "_configureViewsForPresentedState");
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusBarFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKBrowserFullscreenRevealPresentationController statusBar](self, "statusBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGFloat Width;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  -[CKBrowserFullscreenRevealPresentationController containerView](self, "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "statusBarFrame");
  v13 = v12;

  if (v13 >= 20.0)
    v14 = v13;
  else
    v14 = 20.0;
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  Width = CGRectGetWidth(v20);
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v16 = CGRectGetHeight(v21) - v14 + -8.0;
  v17 = 0.0;
  v18 = v14 + 8.0;
  v19 = Width;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)dimmingViewTapped:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  -[CKBrowserFullscreenRevealPresentationController dismissHandler](self, "dismissHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKBrowserFullscreenRevealPresentationController dismissHandler](self, "dismissHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, CKBrowserFullscreenRevealPresentationController *))v5)[2](v5, self);

    -[CKBrowserFullscreenRevealPresentationController setDismissHandler:](self, "setDismissHandler:", 0);
  }
  else
  {
    -[CKBrowserFullscreenRevealPresentationController presentedViewController](self, "presentedViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_willChangeStatusBarFrame:(id)a3
{
  id v3;

  -[CKBrowserFullscreenRevealPresentationController containerView](self, "containerView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (CKBrowserFullscreenRevealDimmingView)dimmingView
{
  CKBrowserFullscreenRevealDimmingView *dimmingView;
  CKBrowserFullscreenRevealDimmingView *v4;
  CKBrowserFullscreenRevealDimmingView *v5;
  CKBrowserFullscreenRevealDimmingView *v6;
  void *v7;

  dimmingView = self->_dimmingView;
  if (!dimmingView)
  {
    v4 = [CKBrowserFullscreenRevealDimmingView alloc];
    v5 = -[CKBrowserFullscreenRevealDimmingView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_dimmingView;
    self->_dimmingView = v5;

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.200000003);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserFullscreenRevealDimmingView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", v7);

    -[CKBrowserFullscreenRevealDimmingView setAlpha:](self->_dimmingView, "setAlpha:", 0.0);
    -[CKBrowserFullscreenRevealDimmingView setAutoresizingMask:](self->_dimmingView, "setAutoresizingMask:", 18);
    dimmingView = self->_dimmingView;
  }
  return dimmingView;
}

- (id)_viewsToApplyTransform
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController presentingSnapshotView](self, "presentingSnapshotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (id)_viewsToApplyCornerRadius
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController presentingSnapshotView](self, "presentingSnapshotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[CKBrowserFullscreenRevealPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (void)_configureViewsForPresentedState
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double Height;
  double v17;
  double v18;
  CGFloat v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CGAffineTransform v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;
  CGRect v57;

  v55 = *MEMORY[0x1E0C80C00];
  -[CKBrowserFullscreenRevealPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKBrowserFullscreenRevealPresentationController dimmingView](self, "dimmingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 1.0);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "statusBarFrame");
  v15 = v14;

  v56.origin.x = v5;
  v56.origin.y = v7;
  v56.size.width = v9;
  v56.size.height = v11;
  Height = CGRectGetHeight(v56);
  v17 = 7.0;
  if (v15 >= 20.0)
    v17 = v15 + -13.0;
  memset(&v52.c, 0, 32);
  if (Height < 1024.0)
    v18 = v17;
  else
    v18 = 0.0;
  *(_OWORD *)&v52.a = 0uLL;
  v57.origin.x = v5;
  v57.origin.y = v7;
  v57.size.width = v9;
  v57.size.height = v11;
  v19 = CGRectGetHeight(v57);
  CGAffineTransformMakeTranslation(&v52, 0.0, floor(v18 * (667.0 / v19)));
  memset(&v51, 0, sizeof(v51));
  CGAffineTransformMakeScale(&v51, 0.959999979, 0.959999979);
  t1 = v52;
  memset(&v50, 0, sizeof(v50));
  t2 = v51;
  CGAffineTransformConcat(&v50, &t1, &t2);
  -[CKBrowserFullscreenRevealPresentationController statusBar](self, "statusBar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController statusBarWindow](self, "statusBarWindow");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 != v22)
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "_synchronizeDrawing");
    -[CKBrowserFullscreenRevealPresentationController statusBarWindow](self, "statusBarWindow");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserFullscreenRevealPresentationController statusBar](self, "statusBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v24);

  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[CKBrowserFullscreenRevealPresentationController _viewsToApplyTransform](self, "_viewsToApplyTransform");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v45 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        v43 = v50;
        objc_msgSend(v30, "setTransform:", &v43);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v27);
  }

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "_setBackgroundStyle:", 5);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[CKBrowserFullscreenRevealPresentationController _viewsToApplyCornerRadius](self, "_viewsToApplyCornerRadius", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v40 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v37, "layer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setMaskedCorners:", 3);

        objc_msgSend(v37, "_setContinuousCornerRadius:", 8.0);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    }
    while (v34);
  }

}

- (void)_configureViewsForDismissedState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[3];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[CKBrowserFullscreenRevealPresentationController dimmingView](self, "dimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[CKBrowserFullscreenRevealPresentationController _viewsToApplyTransform](self, "_viewsToApplyTransform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v23 = *MEMORY[0x1E0C9BAA8];
    v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
        v28[0] = v23;
        v28[1] = v22;
        v28[2] = v21;
        objc_msgSend(v9, "setTransform:", v28, v21, v22, v23);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[CKBrowserFullscreenRevealPresentationController _viewsToApplyCornerRadius](self, "_viewsToApplyCornerRadius");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14++), "_setContinuousCornerRadius:", 0.0);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  -[CKBrowserFullscreenRevealPresentationController statusBar](self, "statusBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "superview");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController statusBarWindow](self, "statusBarWindow");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 != v17)
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "_synchronizeDrawing");
    -[CKBrowserFullscreenRevealPresentationController statusBarWindow](self, "statusBarWindow");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserFullscreenRevealPresentationController statusBar](self, "statusBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v19);

  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_setBackgroundStyle:", 0);

}

- (void)_prepareViewHierarchyForPresentation
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController setPresentingSnapshotView:](self, "setPresentingSnapshotView:", v5);

  -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  -[CKBrowserFullscreenRevealPresentationController setPresentingSnapshotFrame:](self, "setPresentingSnapshotFrame:");

  -[CKBrowserFullscreenRevealPresentationController containerView](self, "containerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController presentingSnapshotView](self, "presentingSnapshotView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertSubview:aboveSubview:", v9, v11);

  -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeFromSuperview");

  -[CKBrowserFullscreenRevealPresentationController containerView](self, "containerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController dimmingView](self, "dimmingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController presentingSnapshotView](self, "presentingSnapshotView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertSubview:aboveSubview:", v15, v16);

  -[CKBrowserFullscreenRevealPresentationController containerView](self, "containerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[CKBrowserFullscreenRevealPresentationController dimmingView](self, "dimmingView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);

  -[CKBrowserFullscreenRevealPresentationController presentedViewController](self, "presentedViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setClipsToBounds:", 1);

  -[CKBrowserFullscreenRevealPresentationController presentingSnapshotView](self, "presentingSnapshotView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setClipsToBounds:", 1);

  -[CKBrowserFullscreenRevealPresentationController statusBar](self, "statusBar");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController setStatusBarResizeMask:](self, "setStatusBarResizeMask:", objc_msgSend(v30, "autoresizingMask"));

  -[CKBrowserFullscreenRevealPresentationController statusBar](self, "statusBar");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAutoresizingMask:", 0);

}

- (void)_cleanupPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;

  -[CKBrowserFullscreenRevealPresentationController _configureViewsForDismissedState](self, "_configureViewsForDismissedState");
  -[CKBrowserFullscreenRevealPresentationController dimmingView](self, "dimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKBrowserFullscreenRevealPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserFullscreenRevealPresentationController presentingSnapshotView](self, "presentingSnapshotView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertSubview:belowSubview:", v6, v7);

  -[CKBrowserFullscreenRevealPresentationController presentingSnapshotView](self, "presentingSnapshotView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromSuperview");

  v9 = -[CKBrowserFullscreenRevealPresentationController statusBarResizeMask](self, "statusBarResizeMask");
  -[CKBrowserFullscreenRevealPresentationController statusBar](self, "statusBar");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAutoresizingMask:", v9);

}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (UIStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setStatusBar:(id)a3
{
  objc_storeStrong((id *)&self->_statusBar, a3);
}

- (UIStatusBarWindow)statusBarWindow
{
  return self->_statusBarWindow;
}

- (void)setStatusBarWindow:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarWindow, a3);
}

- (unint64_t)statusBarResizeMask
{
  return self->_statusBarResizeMask;
}

- (void)setStatusBarResizeMask:(unint64_t)a3
{
  self->_statusBarResizeMask = a3;
}

- (UIView)presentingSnapshotView
{
  return self->_presentingSnapshotView;
}

- (void)setPresentingSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_presentingSnapshotView, a3);
}

- (CGRect)presentingSnapshotFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentingSnapshotFrame.origin.x;
  y = self->_presentingSnapshotFrame.origin.y;
  width = self->_presentingSnapshotFrame.size.width;
  height = self->_presentingSnapshotFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentingSnapshotFrame:(CGRect)a3
{
  self->_presentingSnapshotFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingSnapshotView, 0);
  objc_storeStrong((id *)&self->_statusBarWindow, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
}

@end
