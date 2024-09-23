@implementation CKBrowserSwitcherFooterAccessoryCell

+ (id)supplementryViewKind
{
  return CFSTR("CKBrowserSwitcherFooterAccessoryCellKind");
}

+ (id)reuseIdentifier
{
  return CFSTR("CKBrowserSwitcherFooterAccesssoryReuseIdentifier");
}

- (CKBrowserSwitcherFooterAccessoryCell)initWithFrame:(CGRect)a3
{
  CKBrowserSwitcherFooterAccessoryCell *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKBrowserSwitcherFooterAccessoryCell;
  v3 = -[CKBrowserSwitcherFooterAccessoryCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "browserAppStripSeperatorBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v8);

    -[CKBrowserSwitcherFooterAccessoryCell addSubview:](v3, "addSubview:", v5);
    -[CKBrowserSwitcherFooterAccessoryCell setSeperatorView:](v3, "setSeperatorView:", v5);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double x;
  double y;
  double width;
  double height;
  void *v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  v25.receiver = self;
  v25.super_class = (Class)CKBrowserSwitcherFooterAccessoryCell;
  -[CKBrowserSwitcherFooterAccessoryCell layoutSubviews](&v25, sel_layoutSubviews);
  -[CKBrowserSwitcherFooterAccessoryCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKBrowserSwitcherFooterAccessoryCell seperatorView](self, "seperatorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserSwitcherFooterAccessoryCell bringSubviewToFront:](self, "bringSubviewToFront:", v11);

  -[CKBrowserSwitcherFooterAccessoryCell seperatorView](self, "seperatorView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", v8);

  -[CKBrowserSwitcherFooterAccessoryCell seperatorView](self, "seperatorView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMasksToBounds:", 1);

  -[CKBrowserSwitcherFooterAccessoryCell minHeight](self, "minHeight");
  v17 = v16;
  -[CKBrowserSwitcherFooterAccessoryCell maxHeight](self, "maxHeight");
  if (v10 >= (v17 + v18) * 0.5)
    v19 = 8.0;
  else
    v19 = 6.0;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  v27 = CGRectInset(v26, 0.0, v19);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;
  -[CKBrowserSwitcherFooterAccessoryCell seperatorView](self, "seperatorView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", x, y, width, height);

}

- (double)minHeight
{
  return self->_minHeight;
}

- (void)setMinHeight:(double)a3
{
  self->_minHeight = a3;
}

- (double)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(double)a3
{
  self->_maxHeight = a3;
}

- (UIView)seperatorView
{
  return self->_seperatorView;
}

- (void)setSeperatorView:(id)a3
{
  objc_storeStrong((id *)&self->_seperatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seperatorView, 0);
}

@end
