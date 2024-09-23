@implementation _SFAutoFillInputViewButton

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
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double Width;
  void *v20;
  void *v21;
  objc_super v22;
  CGRect v23;

  -[_SFAutoFillInputViewButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_SFAutoFillInputViewButton layoutMargins](self, "layoutMargins");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  v23.origin.x = v12;
  v23.origin.y = v14;
  v23.size.width = v16;
  v23.size.height = v18;
  Width = CGRectGetWidth(v23);
  -[_SFAutoFillInputViewButton titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPreferredMaxLayoutWidth:", Width);

  v22.receiver = self;
  v22.super_class = (Class)_SFAutoFillInputViewButton;
  -[_SFAutoFillInputViewButton layoutSubviews](&v22, sel_layoutSubviews);
  -[_SFAutoFillInputViewButton titleLabel](self, "titleLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v12, v14, v16, v18);

}

@end
