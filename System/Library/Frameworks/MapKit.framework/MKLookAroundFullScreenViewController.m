@implementation MKLookAroundFullScreenViewController

- (int64_t)overrideUserInterfaceStyle
{
  return 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundFullScreenViewController;
  -[MKLookAroundFullScreenViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (-[MKLookAroundFullScreenViewController isBeingPresented](self, "isBeingPresented"))
  {
    -[MKLookAroundFullScreenViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullScreenViewControllerWillPresent:", self);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundFullScreenViewController;
  -[MKLookAroundFullScreenViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (-[MKLookAroundFullScreenViewController isBeingPresented](self, "isBeingPresented"))
  {
    -[MKLookAroundFullScreenViewController attachContentView](self, "attachContentView");
    -[MKLookAroundFullScreenViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullScreenViewControllerDidPresent:", self);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundFullScreenViewController;
  -[MKLookAroundFullScreenViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (-[MKLookAroundFullScreenViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[MKLookAroundFullScreenViewController detachContentView](self, "detachContentView");
    -[MKLookAroundFullScreenViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullScreenViewControllerWillDismiss:", self);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKLookAroundFullScreenViewController;
  -[MKLookAroundFullScreenViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (-[MKLookAroundFullScreenViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[MKLookAroundFullScreenViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fullScreenViewControllerDidDismiss:", self);

  }
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
  -[MKLookAroundFullScreenViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fullScreenViewController:viewWillTransitionToSize:coordinator:", self, v7, width, height);

  v9.receiver = self;
  v9.super_class = (Class)MKLookAroundFullScreenViewController;
  -[MKLookAroundFullScreenViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MKLookAroundFullScreenViewController;
  -[MKLookAroundFullScreenViewController viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
  -[MKLookAroundFullScreenViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundFullScreenViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    -[MKLookAroundFullScreenViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[MKLookAroundFullScreenViewController contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  }
}

- (void)attachContentView
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  -[MKLookAroundFullScreenViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MKLookAroundFullScreenViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewForFullScreenViewController:", self);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[MKLookAroundFullScreenViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isDescendantOfView:", v5);

    if ((v6 & 1) == 0)
    {
      -[MKLookAroundFullScreenViewController setOriginalAutoresizingMask:](self, "setOriginalAutoresizingMask:", objc_msgSend(v9, "autoresizingMask"));
      objc_msgSend(v9, "setAutoresizingMask:", 18);
      -[MKLookAroundFullScreenViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bounds");
      objc_msgSend(v9, "setFrame:");

      -[MKLookAroundFullScreenViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v9);

      -[MKLookAroundFullScreenViewController setContentView:](self, "setContentView:", v9);
    }

  }
}

- (void)detachContentView
{
  void *v3;
  int v4;
  id v5;

  -[MKLookAroundFullScreenViewController contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MKLookAroundFullScreenViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "isDescendantOfView:", v3);

  if (v4)
  {
    objc_msgSend(v5, "removeFromSuperview");
    objc_msgSend(v5, "setAutoresizingMask:", -[MKLookAroundFullScreenViewController originalAutoresizingMask](self, "originalAutoresizingMask"));
  }

}

- (MKLookAroundFullScreenViewControllerDelegate)delegate
{
  return (MKLookAroundFullScreenViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_contentView);
}

- (void)setContentView:(id)a3
{
  objc_storeWeak((id *)&self->_contentView, a3);
}

- (unint64_t)originalAutoresizingMask
{
  return self->_originalAutoresizingMask;
}

- (void)setOriginalAutoresizingMask:(unint64_t)a3
{
  self->_originalAutoresizingMask = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
