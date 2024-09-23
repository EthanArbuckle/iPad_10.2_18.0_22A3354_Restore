@implementation HUPCCenterFillContentController

- (HUPCCenterFillContentController)initWithTitle:(id)a3 detailText:(id)a4 contentView:(id)a5
{
  id v8;
  id v9;
  id v10;
  HUPCCenterFillContentController *v11;
  HUPCCenterFillContentController *v12;
  UIView *v13;
  UIView *contentViewContainer;
  void *v15;
  uint64_t v16;
  NSLayoutConstraint *contentViewContainerHeightConstraint;
  void *v18;
  uint64_t v19;
  NSLayoutConstraint *contentViewContainerWidthConstraint;
  void *v21;
  void *v22;
  uint64_t v23;
  NSLayoutConstraint *contentViewTopConstraint;
  void *v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *contentViewBottomConstraint;
  void *v29;
  void *v30;
  uint64_t v31;
  NSLayoutConstraint *contentViewLeadingConstraint;
  void *v33;
  void *v34;
  uint64_t v35;
  NSLayoutConstraint *contentViewTrailingConstraint;
  objc_super v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v38.receiver = self;
  v38.super_class = (Class)HUPCCenterFillContentController;
  v11 = -[HUPCCenterFillContentController initWithContentView:](&v38, sel_initWithContentView_, 0);
  v12 = v11;
  if (v11)
  {
    -[HUPCCenterFillContentController setTitle:](v11, "setTitle:", v8);
    -[HUPCCenterFillContentController setSubtitle:](v12, "setSubtitle:", v9);
    objc_storeStrong((id *)&v12->_centerFillContentView, a5);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_centerFillContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    contentViewContainer = v12->_contentViewContainer;
    v12->_contentViewContainer = v13;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v12->_contentViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v12->_contentViewContainer, "addSubview:", v12->_centerFillContentView);
    v12->_contentMode = 1;
    *(_OWORD *)&v12->_contentInsets.top = xmmword_1B9442520;
    *(_OWORD *)&v12->_contentInsets.bottom = xmmword_1B9442520;
    -[UIView heightAnchor](v12->_contentViewContainer, "heightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToConstant:", 1.0);
    v16 = objc_claimAutoreleasedReturnValue();
    contentViewContainerHeightConstraint = v12->_contentViewContainerHeightConstraint;
    v12->_contentViewContainerHeightConstraint = (NSLayoutConstraint *)v16;

    -[UIView widthAnchor](v12->_contentViewContainer, "widthAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToConstant:", 1.0);
    v19 = objc_claimAutoreleasedReturnValue();
    contentViewContainerWidthConstraint = v12->_contentViewContainerWidthConstraint;
    v12->_contentViewContainerWidthConstraint = (NSLayoutConstraint *)v19;

    -[UIView topAnchor](v12->_centerFillContentView, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v12->_contentViewContainer, "topAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    contentViewTopConstraint = v12->_contentViewTopConstraint;
    v12->_contentViewTopConstraint = (NSLayoutConstraint *)v23;

    -[UIView bottomAnchor](v12->_centerFillContentView, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v12->_contentViewContainer, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    contentViewBottomConstraint = v12->_contentViewBottomConstraint;
    v12->_contentViewBottomConstraint = (NSLayoutConstraint *)v27;

    -[UIView leadingAnchor](v12->_centerFillContentView, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v12->_contentViewContainer, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    contentViewLeadingConstraint = v12->_contentViewLeadingConstraint;
    v12->_contentViewLeadingConstraint = (NSLayoutConstraint *)v31;

    -[UIView trailingAnchor](v12->_centerFillContentView, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v12->_contentViewContainer, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = objc_claimAutoreleasedReturnValue();
    contentViewTrailingConstraint = v12->_contentViewTrailingConstraint;
    v12->_contentViewTrailingConstraint = (NSLayoutConstraint *)v35;

    -[HUPCFullCenterContentViewController setCenteredContentView:](v12, "setCenteredContentView:", v12->_contentViewContainer);
  }

  return v12;
}

- (void)setContentMode:(unint64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    if (-[HUPCCenterFillContentController isViewLoaded](self, "isViewLoaded"))
    {
      -[HUPCCenterFillContentController _updateContentViewContainerConstraints](self, "_updateContentViewContainerConstraints");
      -[HUPCCenterFillContentController _updateContentViewInsetConstraints](self, "_updateContentViewInsetConstraints");
    }
  }
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    if (-[HUPCCenterFillContentController isViewLoaded](self, "isViewLoaded"))
    {
      -[HUPCCenterFillContentController _updateContentViewContainerConstraints](self, "_updateContentViewContainerConstraints");
      -[HUPCCenterFillContentController _updateContentViewInsetConstraints](self, "_updateContentViewInsetConstraints");
    }
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUPCCenterFillContentController;
  -[HUPCFullCenterContentViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HUPCCenterFillContentController _updateContentViewContainerConstraints](self, "_updateContentViewContainerConstraints");
  -[HUPCCenterFillContentController _updateContentViewInsetConstraints](self, "_updateContentViewInsetConstraints");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUPCCenterFillContentController;
  -[HUPCCenterFillContentController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[HUPCCenterFillContentController _updateContentViewContainerConstraints](self, "_updateContentViewContainerConstraints");
}

- (double)_contentAspectRatio
{
  return 1.0;
}

- (void)_viewDidUpdateContent
{
  -[HUPCCenterFillContentController _updateContentViewContainerConstraints](self, "_updateContentViewContainerConstraints");
  -[HUPCCenterFillContentController _updateContentViewInsetConstraints](self, "_updateContentViewInsetConstraints");
}

- (void)_updateContentViewContainerConstraints
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
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  if (-[HUPCCenterFillContentController contentMode](self, "contentMode") == 1)
  {
    -[HUPCCenterFillContentController contentViewContainer](self, "contentViewContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;

    if (v6 <= 0.0)
      return;
    -[HUPCCenterFillContentController contentInsets](self, "contentInsets");
    v8 = v7;
    -[HUPCCenterFillContentController contentInsets](self, "contentInsets");
    v10 = v6 - (v8 + v9);
    -[HUPCCenterFillContentController _contentAspectRatio](self, "_contentAspectRatio");
    v12 = ceil(v10 / v11);
    -[HUPCCenterFillContentController contentInsets](self, "contentInsets");
    v14 = v13;
    -[HUPCCenterFillContentController contentInsets](self, "contentInsets");
    v16 = v12 + v14 + v15;
    -[HUPCCenterFillContentController contentViewContainerWidthConstraint](self, "contentViewContainerWidthConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setConstant:", v6);

    -[HUPCCenterFillContentController contentViewContainerWidthConstraint](self, "contentViewContainerWidthConstraint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    -[HUPCCenterFillContentController contentViewContainerHeightConstraint](self, "contentViewContainerHeightConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setConstant:", v16);

    -[HUPCCenterFillContentController contentViewContainerHeightConstraint](self, "contentViewContainerHeightConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v20;
    v21 = 1;
  }
  else
  {
    -[HUPCCenterFillContentController contentViewContainerHeightConstraint](self, "contentViewContainerHeightConstraint");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 0);

    -[HUPCCenterFillContentController contentViewContainerWidthConstraint](self, "contentViewContainerWidthConstraint");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v20;
    v21 = 0;
  }
  objc_msgSend(v20, "setActive:", v21);

}

- (void)_updateContentViewInsetConstraints
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (-[HUPCCenterFillContentController contentMode](self, "contentMode") == 1)
  {
    -[HUPCCenterFillContentController contentInsets](self, "contentInsets");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v4 = *MEMORY[0x1E0CEB4B0];
    v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  -[HUPCCenterFillContentController contentViewTopConstraint](self, "contentViewTopConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v4);

  -[HUPCCenterFillContentController contentViewTopConstraint](self, "contentViewTopConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[HUPCCenterFillContentController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", -v8);

  -[HUPCCenterFillContentController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[HUPCCenterFillContentController contentViewLeadingConstraint](self, "contentViewLeadingConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v6);

  -[HUPCCenterFillContentController contentViewLeadingConstraint](self, "contentViewLeadingConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HUPCCenterFillContentController contentViewTrailingConstraint](self, "contentViewTrailingConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setConstant:", -v10);

  -[HUPCCenterFillContentController contentViewTrailingConstraint](self, "contentViewTrailingConstraint");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

}

- (UIView)centerFillContentView
{
  return self->_centerFillContentView;
}

- (unint64_t)contentMode
{
  return self->_contentMode;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIView)contentViewContainer
{
  return self->_contentViewContainer;
}

- (NSLayoutConstraint)contentViewContainerHeightConstraint
{
  return self->_contentViewContainerHeightConstraint;
}

- (NSLayoutConstraint)contentViewContainerWidthConstraint
{
  return self->_contentViewContainerWidthConstraint;
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (NSLayoutConstraint)contentViewBottomConstraint
{
  return self->_contentViewBottomConstraint;
}

- (NSLayoutConstraint)contentViewLeadingConstraint
{
  return self->_contentViewLeadingConstraint;
}

- (NSLayoutConstraint)contentViewTrailingConstraint
{
  return self->_contentViewTrailingConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewContainer, 0);
  objc_storeStrong((id *)&self->_centerFillContentView, 0);
}

@end
