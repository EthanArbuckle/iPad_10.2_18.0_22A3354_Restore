@implementation _MPMoviePlayerProxyView

- (_MPMoviePlayerProxyView)initWithMoviePlayerController:(id)a3
{
  id v4;
  _MPMoviePlayerProxyView *v5;
  _MPMoviePlayerProxyView *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MPMoviePlayerProxyView;
  v5 = -[_MPMoviePlayerProxyView init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_controller, v4);

  return v6;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MPMoviePlayerProxyView;
  v4 = a3;
  -[_MPMoviePlayerProxyView willMoveToWindow:](&v6, sel_willMoveToWindow_, v4);
  -[_MPMoviePlayerProxyView superview](self, "superview", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPMoviePlayerProxyView _updateContainmentInWindow:superview:](self, "_updateContainmentInWindow:superview:", v4, v5);

}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_MPMoviePlayerProxyView;
  v4 = a3;
  -[_MPMoviePlayerProxyView willMoveToSuperview:](&v6, sel_willMoveToSuperview_, v4);
  -[_MPMoviePlayerProxyView window](self, "window", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPMoviePlayerProxyView _updateContainmentInWindow:superview:](self, "_updateContainmentInWindow:superview:", v5, v4);

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id WeakRetained;
  void *v9;
  void *v10;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)_MPMoviePlayerProxyView;
  -[_MPMoviePlayerProxyView setFrame:](&v11, sel_setFrame_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "playerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", x, y, width, height);

}

- (void)_updateContainmentInWindow:(id)a3 superview:(id)a4
{
  id WeakRetained;
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
  unint64_t v23;

  v23 = (unint64_t)a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (!((unint64_t)a3 | v23))
  {
    objc_msgSend(WeakRetained, "playerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "willMoveToParentViewController:", 0);

    objc_msgSend(WeakRetained, "playerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    objc_msgSend(WeakRetained, "playerViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromParentViewController");
LABEL_10:

    goto LABEL_11;
  }
  if (v23)
  {
    objc_msgSend(WeakRetained, "hostingViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0DC3F20], "viewControllerForView:", v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(WeakRetained, "playerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v12)
    {
      objc_msgSend(WeakRetained, "prepareToPlay");
      objc_msgSend(WeakRetained, "playerViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "parentViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(WeakRetained, "playerViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "willMoveToParentViewController:", 0);

        objc_msgSend(WeakRetained, "playerViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeFromSuperview");

        objc_msgSend(WeakRetained, "playerViewController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeFromParentViewController");

      }
      objc_msgSend(WeakRetained, "playerViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addChildViewController:", v19);

      objc_msgSend(WeakRetained, "playerViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPMoviePlayerProxyView addSubview:](self, "addSubview:", v21);

      objc_msgSend(WeakRetained, "playerViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "didMoveToParentViewController:", v10);

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (MPMoviePlayerController)controller
{
  return (MPMoviePlayerController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
}

@end
