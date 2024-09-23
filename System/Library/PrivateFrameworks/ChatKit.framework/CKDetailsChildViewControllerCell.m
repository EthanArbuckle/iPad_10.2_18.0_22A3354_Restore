@implementation CKDetailsChildViewControllerCell

- (CKDetailsChildViewControllerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsChildViewControllerCell *v4;
  CKDetailsChildViewControllerCell *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDetailsChildViewControllerCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v8, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKDetailsChildViewControllerCell setShouldUseLayoutMargins:](v4, "setShouldUseLayoutMargins:", 1);
    -[CKDetailsChildViewControllerCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsChildViewControllerCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

  }
  return v5;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsChildViewControllerViewCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double x;
  double v6;
  double y;
  double v8;
  double width;
  double v10;
  double height;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)CKDetailsChildViewControllerCell;
  -[CKDetailsCell layoutSubviews](&v16, sel_layoutSubviews);
  -[CKDetailsChildViewControllerCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  x = v4;
  y = v6;
  width = v8;
  height = v10;

  -[CKDetailsChildViewControllerCell childViewControllerView](self, "childViewControllerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKDetailsChildViewControllerCell shouldUseLayoutMargins](self, "shouldUseLayoutMargins"))
  {
    -[CKDetailsChildViewControllerCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutMargins");
    v15 = v14;

    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    v18 = CGRectInset(v17, v15, 0.0);
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
  }
  objc_msgSend(v12, "setFrame:", x, y, width, height);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDetailsChildViewControllerCell;
  -[CKDetailsCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKDetailsChildViewControllerCell setShouldUseLayoutMargins:](self, "setShouldUseLayoutMargins:", 1);
}

- (void)setChildViewControllerView:(id)a3
{
  UIView *v5;
  UIView **p_childViewControllerView;
  UIView *childViewControllerView;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_childViewControllerView = &self->_childViewControllerView;
  childViewControllerView = self->_childViewControllerView;
  if (childViewControllerView != v5)
  {
    v9 = v5;
    -[UIView removeFromSuperview](childViewControllerView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_childViewControllerView, a3);
    -[CKDetailsChildViewControllerCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_childViewControllerView);

    v5 = v9;
  }

}

- (UIView)childViewControllerView
{
  return self->_childViewControllerView;
}

- (BOOL)shouldUseLayoutMargins
{
  return self->_shouldUseLayoutMargins;
}

- (void)setShouldUseLayoutMargins:(BOOL)a3
{
  self->_shouldUseLayoutMargins = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childViewControllerView, 0);
}

@end
