@implementation CEKWheelScrubberSectionDividerView

- (CEKWheelScrubberSectionDividerView)initWithFrame:(CGRect)a3
{
  CEKWheelScrubberSectionDividerView *v3;
  UIView *v4;
  UIView *separatorView;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CEKWheelScrubberSectionDividerView;
  v3 = -[CEKWheelScrubberSectionDividerView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v3->__separatorView;
    v3->__separatorView = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->__separatorView, "setBackgroundColor:", v6);

    -[UIView layer](v3->__separatorView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMasksToBounds:", 1);

    v8 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](v3->__separatorView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerCurve:", v8);

    -[UIView layer](v3->__separatorView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCornerRadius:", 2.0);

    -[CEKWheelScrubberSectionDividerView addSubview:](v3, "addSubview:", v3->__separatorView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  BOOL v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CEKWheelScrubberSectionDividerView;
  -[CEKWheelScrubberSectionDividerView layoutSubviews](&v11, sel_layoutSubviews);
  -[CEKWheelScrubberSectionDividerView bounds](self, "bounds");
  v5 = v4 <= v3;
  v6 = v4 * 0.5 + -2.0;
  v7 = v3 + -20.0;
  v8 = v3 * 0.5 + -2.0;
  v9 = v4 + -20.0;
  if (v5)
  {
    v8 = 10.0;
    v10 = v3 + -20.0;
  }
  else
  {
    v6 = 10.0;
    v10 = 4.0;
  }
  if (v5)
    v9 = 4.0;
  -[UIView setFrame:](self->__separatorView, "setFrame:", v8, v6, v10, v9, -2.0, -20.0, v7);
}

+ (double)dividerViewWidth
{
  return 30.0;
}

- (UIView)_separatorView
{
  return self->__separatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__separatorView, 0);
}

@end
