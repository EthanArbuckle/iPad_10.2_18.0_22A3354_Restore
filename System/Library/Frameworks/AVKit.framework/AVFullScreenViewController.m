@implementation AVFullScreenViewController

- (BOOL)_canShowWhileLocked
{
  void *v2;
  char v3;

  -[AVFullScreenViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_canShowWhileLocked");

  return v3;
}

- (id)keyCommands
{
  void *v3;
  void *v4;
  void *v5;

  -[AVFullScreenViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyCommandResponderForFullScreenViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyCommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  -[AVFullScreenViewController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyCommandResponderForFullScreenViewController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "canPerformAction:withSender:", a3, v6) & 1) == 0)
  {

LABEL_6:
    v10.receiver = self;
    v10.super_class = (Class)AVFullScreenViewController;
    -[AVFullScreenViewController targetForAction:withSender:](&v10, sel_targetForAction_withSender_, a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v8)
    goto LABEL_6;
LABEL_7:

  return v8;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)loadView
{
  AVPresentationContainerView *v3;

  v3 = objc_alloc_init(AVPresentationContainerView);
  -[AVFullScreenViewController setView:](self, "setView:", v3);

}

- (void)viewWillMoveToWindow:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVFullScreenViewController;
  -[AVFullScreenViewController viewWillMoveToWindow:](&v6, sel_viewWillMoveToWindow_);
  if (!a3)
  {
    if (-[AVFullScreenViewController isBeingDismissed](self, "isBeingDismissed"))
    {
      -[AVFullScreenViewController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fullScreenViewControllerWillEndFullScreenPresentation:", self);

    }
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVFullScreenViewController;
  -[AVFullScreenViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v8, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
  {
    -[AVFullScreenViewController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[AVFullScreenViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fullScreenViewControllerWillBeginFullScreenPresentation:", self);

      -[AVFullScreenViewController attachContentView](self, "attachContentView");
    }
  }
}

- (void)attachContentView
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  char v8;
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
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[AVFullScreenViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AVFullScreenViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewForFullScreenViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      _AVLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        _AVMethodProem(self);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVFullScreenViewController delegate](self, "delegate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412546;
        v21 = v18;
        v22 = 2112;
        v23 = v19;
        _os_log_error_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_ERROR, "%@ did not receive a view from its delegate, %@.", (uint8_t *)&v20, 0x16u);

      }
    }
    -[AVFullScreenViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isDescendantOfView:", v7);

    if ((v8 & 1) == 0)
    {
      -[AVFullScreenViewController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "fullScreenViewControllerWillAttachContentView:", self);

      objc_msgSend(v5, "setAutoresizingMask:", 18);
      -[AVFullScreenViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      objc_msgSend(v5, "setFrame:");

      -[AVFullScreenViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPresentationContainerContentView:", v5);

      -[AVFullScreenViewController view](self, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appearanceProxy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVFullScreenViewController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "playbackContainerViewForFullScreenViewController:", self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActualView:", v15);

      -[AVFullScreenViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", v5);

      -[AVFullScreenViewController delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fullScreenViewControllerDidAttachContentView:", self);

      -[AVFullScreenViewController setContentView:](self, "setContentView:", v5);
    }

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVFullScreenViewController;
  -[AVFullScreenViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[UIViewController avkit_setNeedsUpdatePreferencesIfNeeded](self, "avkit_setNeedsUpdatePreferencesIfNeeded");
}

- (BOOL)modalPresentationCapturesStatusBarAppearance
{
  return 1;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  void *v2;
  int64_t v3;

  -[AVFullScreenViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredInterfaceOrientationForPresentation");

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  -[AVFullScreenViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedInterfaceOrientations");

  return v3;
}

- (BOOL)shouldAutorotate
{
  void *v2;
  char v3;

  -[AVFullScreenViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldAutorotate");

  return v3;
}

- (BOOL)prefersStatusBarHidden
{
  AVFullScreenViewController *v2;
  void *v3;

  v2 = self;
  -[AVFullScreenViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "prefersStatusBarHiddenForFullScreenViewController:", v2);

  return (char)v2;
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  int64_t v4;

  -[AVFullScreenViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preferredStatusStyleForFullScreenViewController:", self);

  return v4;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[AVFullScreenViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fullScreenViewController:viewWillTransitionToSize:coordinator:", self, v7, width, height);

  v9.receiver = self;
  v9.super_class = (Class)AVFullScreenViewController;
  -[AVFullScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return 3;
}

- (BOOL)avkit_isEffectivelyFullScreen
{
  return 1;
}

- (AVFullScreenViewControllerDelegate)delegate
{
  return (AVFullScreenViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVFullScreenViewController)associatedFullScreenViewController
{
  return (AVFullScreenViewController *)objc_loadWeakRetained((id *)&self->_associatedFullScreenViewController);
}

- (void)setAssociatedFullScreenViewController:(id)a3
{
  objc_storeWeak((id *)&self->_associatedFullScreenViewController, a3);
}

- (AVFullScreenViewController)sourceFullScreenViewController
{
  return (AVFullScreenViewController *)objc_loadWeakRetained((id *)&self->_sourceFullScreenViewController);
}

- (void)setSourceFullScreenViewController:(id)a3
{
  objc_storeWeak((id *)&self->_sourceFullScreenViewController, a3);
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)setContentView:(id)a3
{
  objc_storeWeak((id *)&self->_contentView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_sourceFullScreenViewController);
  objc_destroyWeak((id *)&self->_associatedFullScreenViewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
