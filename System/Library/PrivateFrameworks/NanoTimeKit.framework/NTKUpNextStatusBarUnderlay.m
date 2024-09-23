@implementation NTKUpNextStatusBarUnderlay

- (NTKUpNextStatusBarUnderlay)initWithFrame:(CGRect)a3
{
  NTKUpNextStatusBarUnderlay *v3;
  id v4;
  UIView *v5;
  void *v6;
  UIView *overlayView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKUpNextStatusBarUnderlay;
  v3 = -[NTKUpNextStatusBarUnderlay initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[NTKUpNextStatusBarUnderlay addSubview:](v3, "addSubview:", v5);
    overlayView = v3->_overlayView;
    v3->_overlayView = v5;

  }
  return v3;
}

- (void)layoutSubviews
{
  double Width;
  objc_super v4;
  CGRect v5;
  CGRect v6;

  v4.receiver = self;
  v4.super_class = (Class)NTKUpNextStatusBarUnderlay;
  -[NTKUpNextStatusBarUnderlay layoutSubviews](&v4, sel_layoutSubviews);
  -[NTKUpNextStatusBarUnderlay bounds](self, "bounds");
  Width = CGRectGetWidth(v5);
  -[NTKUpNextStatusBarUnderlay bounds](self, "bounds");
  -[UIView setFrame:](self->_overlayView, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v6));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end
