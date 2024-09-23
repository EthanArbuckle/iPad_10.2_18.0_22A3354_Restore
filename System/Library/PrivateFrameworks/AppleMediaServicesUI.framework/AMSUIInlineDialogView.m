@implementation AMSUIInlineDialogView

- (id)_contentView
{
  void *v2;
  void *v3;

  -[AMSUIInlineDialogView subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AMSUIInlineDialogView;
  -[AMSUIInlineDialogView layoutSubviews](&v4, sel_layoutSubviews);
  -[AMSUIInlineDialogView _contentView](self, "_contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AMSUIInlineDialogView bounds](self, "bounds");
    objc_msgSend(v3, "setFrame:");
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[AMSUIInlineDialogView _contentView](self, "_contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "sizeThatFits:", width, height);
    width = v7;
    v9 = v8;
  }
  else
  {
    v9 = 0.0;
  }

  v10 = width;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (unint64_t)_axesForDerivingIntrinsicContentSizeFromLayoutSize
{
  return 3;
}

- (BOOL)_layoutHeightDependsOnWidth
{
  return 1;
}

@end
