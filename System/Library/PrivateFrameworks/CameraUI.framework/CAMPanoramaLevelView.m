@implementation CAMPanoramaLevelView

- (CAMPanoramaLevelView)initWithFrame:(CGRect)a3
{
  CAMPanoramaLevelView *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  UIView *lineView;
  CAMPanoramaLevelView *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMPanoramaLevelView;
  v3 = -[CAMPanoramaLevelView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPanoramaLevelView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.75);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    lineView = v3->_lineView;
    v3->_lineView = (UIView *)v8;

    -[UIView setBackgroundColor:](v3->_lineView, "setBackgroundColor:", v6);
    -[CAMPanoramaLevelView addSubview:](v3, "addSubview:", v3->_lineView);
    v10 = v3;

  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  objc_super v9;
  CGRect v10;

  v9.receiver = self;
  v9.super_class = (Class)CAMPanoramaLevelView;
  -[CAMPanoramaLevelView layoutSubviews](&v9, sel_layoutSubviews);
  -[CAMPanoramaLevelView bounds](self, "bounds");
  Width = CGRectGetWidth(v10);
  UIRectCenteredIntegralRectScale();
  UIRectGetCenter();
  v5 = v4;
  v7 = v6;
  -[CAMPanoramaLevelView lineView](self, "lineView", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, Width, 1.0);
  objc_msgSend(v8, "setCenter:", v5, v7);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CAMPanoramaLevelView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMPanoramaLevelView;
  -[CAMPanoramaLevelView hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CAMPanoramaLevelView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {

    v5 = 0;
  }
  return v5;
}

- (UIView)lineView
{
  return self->_lineView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineView, 0);
}

@end
