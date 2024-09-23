@implementation HUCenterFillOBWelcomeController

- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentView:(id)a6
{
  id v11;
  HUCenterFillOBWelcomeController *v12;
  HUCenterFillOBWelcomeController *v13;
  id *p_centerFillContentView;
  UIView *v15;
  UIView *contentViewContainer;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *contentViewContainerHeightConstraint;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *contentViewContainerWidthConstraint;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *contentViewTopConstraint;
  void *v27;
  void *v28;
  uint64_t v29;
  NSLayoutConstraint *contentViewBottomConstraint;
  void *v31;
  void *v32;
  uint64_t v33;
  NSLayoutConstraint *contentViewLeadingConstraint;
  void *v35;
  void *v36;
  uint64_t v37;
  NSLayoutConstraint *contentViewTrailingConstraint;
  objc_super v40;

  v11 = a6;
  v40.receiver = self;
  v40.super_class = (Class)HUCenterFillOBWelcomeController;
  v12 = -[HUCenterFillOBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v40, sel_initWithTitle_detailText_icon_contentLayout_, a3, a4, a5, 2);
  v13 = v12;
  if (v12)
  {
    p_centerFillContentView = (id *)&v12->_centerFillContentView;
    objc_storeStrong((id *)&v12->_centerFillContentView, a6);
    objc_msgSend(*p_centerFillContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v15 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    contentViewContainer = v13->_contentViewContainer;
    v13->_contentViewContainer = v15;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v13->_contentViewContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v13->_contentViewContainer, "addSubview:", *p_centerFillContentView);
    v13->_contentMode = 1;
    *(_OWORD *)&v13->_contentInsets.top = xmmword_1B9442520;
    *(_OWORD *)&v13->_contentInsets.bottom = xmmword_1B9442520;
    v13->_maxSize = (CGSize)*MEMORY[0x1E0C9D820];
    -[UIView heightAnchor](v13->_contentViewContainer, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", 1.0);
    v18 = objc_claimAutoreleasedReturnValue();
    contentViewContainerHeightConstraint = v13->_contentViewContainerHeightConstraint;
    v13->_contentViewContainerHeightConstraint = (NSLayoutConstraint *)v18;

    -[UIView widthAnchor](v13->_contentViewContainer, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToConstant:", 1.0);
    v21 = objc_claimAutoreleasedReturnValue();
    contentViewContainerWidthConstraint = v13->_contentViewContainerWidthConstraint;
    v13->_contentViewContainerWidthConstraint = (NSLayoutConstraint *)v21;

    objc_msgSend(*p_centerFillContentView, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v13->_contentViewContainer, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    contentViewTopConstraint = v13->_contentViewTopConstraint;
    v13->_contentViewTopConstraint = (NSLayoutConstraint *)v25;

    objc_msgSend(*p_centerFillContentView, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v13->_contentViewContainer, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    contentViewBottomConstraint = v13->_contentViewBottomConstraint;
    v13->_contentViewBottomConstraint = (NSLayoutConstraint *)v29;

    objc_msgSend(*p_centerFillContentView, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v13->_contentViewContainer, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    contentViewLeadingConstraint = v13->_contentViewLeadingConstraint;
    v13->_contentViewLeadingConstraint = (NSLayoutConstraint *)v33;

    objc_msgSend(*p_centerFillContentView, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v13->_contentViewContainer, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v36);
    v37 = objc_claimAutoreleasedReturnValue();
    contentViewTrailingConstraint = v13->_contentViewTrailingConstraint;
    v13->_contentViewTrailingConstraint = (NSLayoutConstraint *)v37;

    -[OBWelcomeFullCenterContentController setCenteredContentView:](v13, "setCenteredContentView:", v13->_contentViewContainer);
  }

  return v13;
}

- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTitle_detailText_icon_contentView_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCenterFillOBWelcomeController.m"), 75, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCenterFillOBWelcomeController initWithTitle:detailText:symbolName:contentLayout:]",
    v9);

  return 0;
}

- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTitle_detailText_icon_contentView_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCenterFillOBWelcomeController.m"), 80, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCenterFillOBWelcomeController initWithTitle:detailText:icon:contentLayout:]",
    v9);

  return 0;
}

- (HUCenterFillOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTitle_detailText_icon_contentView_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUCenterFillOBWelcomeController.m"), 85, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUCenterFillOBWelcomeController initWithTitle:detailText:icon:]",
    v8);

  return 0;
}

- (void)setContentMode:(unint64_t)a3
{
  if (self->_contentMode != a3)
  {
    self->_contentMode = a3;
    if (-[HUCenterFillOBWelcomeController isViewLoaded](self, "isViewLoaded"))
    {
      -[HUCenterFillOBWelcomeController _updateContentViewContainerConstraints](self, "_updateContentViewContainerConstraints");
      -[HUCenterFillOBWelcomeController _updateContentViewInsetConstraints](self, "_updateContentViewInsetConstraints");
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
    if (-[HUCenterFillOBWelcomeController isViewLoaded](self, "isViewLoaded"))
    {
      -[HUCenterFillOBWelcomeController _updateContentViewContainerConstraints](self, "_updateContentViewContainerConstraints");
      -[HUCenterFillOBWelcomeController _updateContentViewInsetConstraints](self, "_updateContentViewInsetConstraints");
    }
  }
}

- (void)setMaxSize:(CGSize)a3
{
  if (self->_maxSize.width != a3.width || self->_maxSize.height != a3.height)
  {
    self->_maxSize = a3;
    if (-[HUCenterFillOBWelcomeController isViewLoaded](self, "isViewLoaded"))
    {
      -[HUCenterFillOBWelcomeController _updateContentViewContainerConstraints](self, "_updateContentViewContainerConstraints");
      -[HUCenterFillOBWelcomeController _updateContentViewInsetConstraints](self, "_updateContentViewInsetConstraints");
    }
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUCenterFillOBWelcomeController;
  -[OBWelcomeFullCenterContentController viewDidLoad](&v3, sel_viewDidLoad);
  -[HUCenterFillOBWelcomeController _updateContentViewContainerConstraints](self, "_updateContentViewContainerConstraints");
  -[HUCenterFillOBWelcomeController _updateContentViewInsetConstraints](self, "_updateContentViewInsetConstraints");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUCenterFillOBWelcomeController;
  -[HUCenterFillOBWelcomeController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[HUCenterFillOBWelcomeController _updateContentViewContainerConstraints](self, "_updateContentViewContainerConstraints");
}

- (double)_contentAspectRatio
{
  return 1.0;
}

- (void)_viewDidUpdateContent
{
  -[HUCenterFillOBWelcomeController _updateContentViewContainerConstraints](self, "_updateContentViewContainerConstraints");
  -[HUCenterFillOBWelcomeController _updateContentViewInsetConstraints](self, "_updateContentViewInsetConstraints");
}

- (BOOL)_limitToNonScrollingContentHeight
{
  return 0;
}

- (void)_updateContentViewContainerConstraints
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  if (-[HUCenterFillOBWelcomeController contentMode](self, "contentMode") != 1)
  {
    -[HUCenterFillOBWelcomeController contentViewContainerHeightConstraint](self, "contentViewContainerHeightConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 0);

    -[HUCenterFillOBWelcomeController contentViewContainerWidthConstraint](self, "contentViewContainerWidthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v9;
    v10 = 0;
LABEL_14:
    objc_msgSend(v9, "setActive:", v10);

    return;
  }
  -[HUCenterFillOBWelcomeController maxSize](self, "maxSize");
  if (v3 > 0.0)
  {
    -[HUCenterFillOBWelcomeController maxSize](self, "maxSize");
    v7 = v11;
  }
  else
  {
    -[HUCenterFillOBWelcomeController contentViewContainer](self, "contentViewContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;

  }
  -[HUCenterFillOBWelcomeController maxSize](self, "maxSize");
  if (v12 <= 0.0)
  {
    -[HUCenterFillOBWelcomeController availableContentViewHeight](self, "availableContentViewHeight");
    v14 = v15;
  }
  else
  {
    -[HUCenterFillOBWelcomeController maxSize](self, "maxSize");
    v14 = v13;
  }
  if (v7 > 0.0)
  {
    -[HUCenterFillOBWelcomeController contentInsets](self, "contentInsets");
    v17 = v16;
    -[HUCenterFillOBWelcomeController contentInsets](self, "contentInsets");
    v19 = v7 - (v17 + v18);
    -[HUCenterFillOBWelcomeController _contentAspectRatio](self, "_contentAspectRatio");
    v21 = ceil(v19 / v20);
    -[HUCenterFillOBWelcomeController contentInsets](self, "contentInsets");
    v23 = v22;
    -[HUCenterFillOBWelcomeController contentInsets](self, "contentInsets");
    v25 = v21 + v23 + v24;
    if (v25 > v14)
    {
      if (-[HUCenterFillOBWelcomeController _limitToNonScrollingContentHeight](self, "_limitToNonScrollingContentHeight"))
      {
        -[HUCenterFillOBWelcomeController contentInsets](self, "contentInsets");
        v27 = v26;
        -[HUCenterFillOBWelcomeController contentInsets](self, "contentInsets");
        v29 = v14 - (v27 + v28);
        -[HUCenterFillOBWelcomeController _contentAspectRatio](self, "_contentAspectRatio");
        v7 = ceil(v30 * v29);
        v25 = v14;
      }
    }
    -[HUCenterFillOBWelcomeController contentViewContainerWidthConstraint](self, "contentViewContainerWidthConstraint");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setConstant:", v7);

    -[HUCenterFillOBWelcomeController contentViewContainerWidthConstraint](self, "contentViewContainerWidthConstraint");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    -[HUCenterFillOBWelcomeController contentViewContainerHeightConstraint](self, "contentViewContainerHeightConstraint");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setConstant:", v25);

    -[HUCenterFillOBWelcomeController contentViewContainerHeightConstraint](self, "contentViewContainerHeightConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v9;
    v10 = 1;
    goto LABEL_14;
  }
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

  if (-[HUCenterFillOBWelcomeController contentMode](self, "contentMode") == 1)
  {
    -[HUCenterFillOBWelcomeController contentInsets](self, "contentInsets");
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
  -[HUCenterFillOBWelcomeController contentViewTopConstraint](self, "contentViewTopConstraint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConstant:", v4);

  -[HUCenterFillOBWelcomeController contentViewTopConstraint](self, "contentViewTopConstraint");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  -[HUCenterFillOBWelcomeController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setConstant:", -v8);

  -[HUCenterFillOBWelcomeController contentViewBottomConstraint](self, "contentViewBottomConstraint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[HUCenterFillOBWelcomeController contentViewLeadingConstraint](self, "contentViewLeadingConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setConstant:", v6);

  -[HUCenterFillOBWelcomeController contentViewLeadingConstraint](self, "contentViewLeadingConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setActive:", 1);

  -[HUCenterFillOBWelcomeController contentViewTrailingConstraint](self, "contentViewTrailingConstraint");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setConstant:", -v10);

  -[HUCenterFillOBWelcomeController contentViewTrailingConstraint](self, "contentViewTrailingConstraint");
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

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSize.width;
  height = self->_maxSize.height;
  result.height = height;
  result.width = width;
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
