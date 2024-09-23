@implementation HUViewControllerTableViewCell

- (void)prepareForReuse
{
  objc_super v3;

  -[HUViewControllerTableViewCell setViewController:](self, "setViewController:", 0);
  -[HUViewControllerTableViewCell setParentViewController:](self, "setParentViewController:", 0);
  -[HUViewControllerTableViewCell setIgnoreRounding:](self, "setIgnoreRounding:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HUViewControllerTableViewCell;
  -[HUViewControllerTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
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
  CGSize result;

  width = a3.width;
  -[HUViewControllerTableViewCell viewController](self, "viewController", a3.width, a3.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[HUViewControllerTableViewCell viewController](self, "viewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v10, v12, width, v16);

  -[HUViewControllerTableViewCell viewController](self, "viewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "layoutIfNeeded");

  -[HUViewControllerTableViewCell viewController](self, "viewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v10, v12, v14, v16);

  -[HUViewControllerTableViewCell viewController](self, "viewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "preferredContentSize");
  v25 = v24;
  v27 = v26;

  v28 = v25;
  v29 = v27;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)layoutSubviews
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUViewControllerTableViewCell;
  -[HUViewControllerTableViewCell layoutSubviews](&v13, sel_layoutSubviews);
  -[HUViewControllerTableViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HUViewControllerTableViewCell viewController](self, "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  if (-[HUViewControllerTableViewCell ignoreRounding](self, "ignoreRounding"))
    -[UITableViewCell turnOffRounding](self, "turnOffRounding");
}

- (void)setViewController:(id)a3
{
  UIViewController *v5;
  void *v6;
  UIViewController *viewController;
  void *v8;
  void *v9;
  UIViewController *v10;

  v5 = (UIViewController *)a3;
  if (self->_viewController != v5)
  {
    v10 = v5;
    -[HUViewControllerTableViewCell parentViewController](self, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      viewController = self->_viewController;

      if (viewController)
        -[HUViewControllerTableViewCell _removeFromParentViewControllerAndClearProperty:](self, "_removeFromParentViewControllerAndClearProperty:", 0);
    }
    objc_storeStrong((id *)&self->_viewController, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIViewController setWantsPreferredContentSize:](v10, "setWantsPreferredContentSize:", 1);
    -[HUViewControllerTableViewCell parentViewController](self, "parentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v10;
    if (v10 && v8)
    {
      -[HUViewControllerTableViewCell parentViewController](self, "parentViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUViewControllerTableViewCell addToParentViewController:](self, "addToParentViewController:", v9);

      v5 = v10;
    }
  }

}

- (void)addToParentViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HUViewControllerTableViewCell viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUViewControllerTableViewCell viewController](self, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addChildViewController:", v5);

    -[HUViewControllerTableViewCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUViewControllerTableViewCell viewController](self, "viewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v8);

    -[HUViewControllerTableViewCell viewController](self, "viewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didMoveToParentViewController:", v10);

  }
  -[HUViewControllerTableViewCell setParentViewController:](self, "setParentViewController:", v10);

}

- (void)removeFromParentViewController
{
  -[HUViewControllerTableViewCell _removeFromParentViewControllerAndClearProperty:](self, "_removeFromParentViewControllerAndClearProperty:", 1);
}

- (void)_removeFromParentViewControllerAndClearProperty:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  -[HUViewControllerTableViewCell viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "willMoveToParentViewController:", 0);

  -[HUViewControllerTableViewCell viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[HUViewControllerTableViewCell viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeFromParentViewController");

  if (v3)
    -[HUViewControllerTableViewCell setParentViewController:](self, "setParentViewController:", 0);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (BOOL)ignoreRounding
{
  return self->_ignoreRounding;
}

- (void)setIgnoreRounding:(BOOL)a3
{
  self->_ignoreRounding = a3;
}

- (UIViewController)parentViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_parentViewController);
}

- (void)setParentViewController:(id)a3
{
  objc_storeWeak((id *)&self->_parentViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
