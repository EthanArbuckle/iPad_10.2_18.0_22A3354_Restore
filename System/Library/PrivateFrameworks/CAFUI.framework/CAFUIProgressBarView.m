@implementation CAFUIProgressBarView

- (CAFUIProgressBarView)initWithFrame:(CGRect)a3
{
  CAFUIProgressBarView *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  UIView *overallBarView;
  UIView *v11;
  void *v12;
  uint64_t v13;
  UIView *progressBarView;
  UIView *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CAFUIProgressBarView;
  v3 = -[CAFUIProgressBarView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BEBDB00]);
    v5 = *MEMORY[0x24BDBF090];
    v6 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], v6, v7, v8);
    overallBarView = v3->_overallBarView;
    v3->_overallBarView = (UIView *)v9;

    v11 = v3->_overallBarView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    -[CAFUIProgressBarView addSubview:](v3, "addSubview:", v3->_overallBarView);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v5, v6, v7, v8);
    progressBarView = v3->_progressBarView;
    v3->_progressBarView = (UIView *)v13;

    v15 = v3->_progressBarView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);

    -[CAFUIProgressBarView addSubview:](v3, "addSubview:", v3->_progressBarView);
    objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFUIProgressBarView setBarColor:](v3, "setBarColor:", v17);

    -[CAFUIProgressBarView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CAFUIProgressBarView"));
  }
  return v3;
}

- (UIColor)barColor
{
  return -[UIView backgroundColor](self->_progressBarView, "backgroundColor");
}

- (void)setBarColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_progressBarView, "setBackgroundColor:", a3);
  -[CAFUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  CGFloat v5;
  void *v6;
  double v7;
  double Width;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceLayoutDirection");

  -[CAFUIProgressBarView bounds](self, "bounds");
  v5 = CGRectGetHeight(v17) * 0.5;
  -[CAFUIProgressBarView overallBarView](self, "overallBarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setCornerRadius:", v5);
  LODWORD(v7) = 1036831949;
  objc_msgSend(v16, "setOpacity:", v7);
  -[CAFUIProgressBarView bounds](self, "bounds");
  Width = CGRectGetWidth(v18);
  -[CAFUIProgressBarView bounds](self, "bounds");
  v10 = v9;
  -[CAFUIProgressBarView bounds](self, "bounds");
  v11 = CGRectGetMidY(v19) - v5;
  -[CAFUIProgressBarView progressBarView](self, "progressBarView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setCornerRadius:", v5);
  -[UIView setFrame:](self->_overallBarView, "setFrame:", 0.0, v11, Width, v10);
  -[CAFUIProgressBarView progress](self, "progress");
  v15 = Width - floor(Width * v14);
  if (v4 != 1)
    v15 = 0.0;
  -[UIView setFrame:](self->_progressBarView, "setFrame:", v15, v11);

}

- (void)setProgress:(double)a3
{
  _QWORD v4[5];

  self->_progress = a3;
  -[CAFUIProgressBarView setNeedsLayout](self, "setNeedsLayout");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__CAFUIProgressBarView_setProgress___block_invoke;
  v4[3] = &unk_2508D1878;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:options:animations:completion:", 196612, v4, 0, 0.100000001, 0.0);
}

uint64_t __36__CAFUIProgressBarView_setProgress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (UIView)overallBarView
{
  return self->_overallBarView;
}

- (void)setOverallBarView:(id)a3
{
  objc_storeStrong((id *)&self->_overallBarView, a3);
}

- (UIView)progressBarView
{
  return self->_progressBarView;
}

- (void)setProgressBarView:(id)a3
{
  objc_storeStrong((id *)&self->_progressBarView, a3);
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBarView, 0);
  objc_storeStrong((id *)&self->_overallBarView, 0);
}

@end
