@implementation SFSearchBarWithSeparator

- (SFSearchBarWithSeparator)initWithFrame:(CGRect)a3
{
  SFSearchBarWithSeparator *v3;
  UIView *v4;
  UIView *separatorView;
  void *v6;
  SFSearchBarWithSeparator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFSearchBarWithSeparator;
  v3 = -[SFSearchBarWithSeparator initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v3->_separatorView;
    v3->_separatorView = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "tableSeparatorDarkColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_separatorView, "setBackgroundColor:", v6);

    -[SFSearchBarWithSeparator addSubview:](v3, "addSubview:", v3->_separatorView);
    v7 = v3;
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
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  v13.receiver = self;
  v13.super_class = (Class)SFSearchBarWithSeparator;
  -[SFSearchBarWithSeparator layoutSubviews](&v13, sel_layoutSubviews);
  -[SFSearchBarWithSeparator bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = _SFOnePixel();
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.width = v8;
  v14.size.height = v10;
  v12 = CGRectGetMaxY(v14) - v11;
  v15.origin.x = v4;
  v15.origin.y = v6;
  v15.size.width = v8;
  v15.size.height = v10;
  -[UIView setFrame:](self->_separatorView, "setFrame:", 0.0, v12, CGRectGetWidth(v15), v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
}

@end
