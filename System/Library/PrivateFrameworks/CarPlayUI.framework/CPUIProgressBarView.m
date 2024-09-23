@implementation CPUIProgressBarView

- (CPUIProgressBarView)initWithFrame:(CGRect)a3
{
  CPUIProgressBarView *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  UIView *overallBarView;
  UIView *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIView *progressBarView;
  UIView *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CPUIProgressBarView;
  v3 = -[CPUIProgressBarView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIProgressBarView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(MEMORY[0x24BDF6F90]);
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
    overallBarView = v3->_overallBarView;
    v3->_overallBarView = (UIView *)v10;

    v12 = v3->_overallBarView;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.200000003);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[UIView layer](v3->_overallBarView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMasksToBounds:", 1);

    -[CPUIProgressBarView addSubview:](v3, "addSubview:", v3->_overallBarView);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", v6, v7, v8, v9);
    progressBarView = v3->_progressBarView;
    v3->_progressBarView = (UIView *)v15;

    v17 = v3->_progressBarView;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[UIView addSubview:](v3->_overallBarView, "addSubview:", v3->_progressBarView);
  }
  return v3;
}

- (UIColor)trackColor
{
  return -[UIView backgroundColor](self->_overallBarView, "backgroundColor");
}

- (void)setTrackColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_overallBarView, "setBackgroundColor:", a3);
  -[CPUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
}

- (UIColor)barColor
{
  return -[UIView backgroundColor](self->_progressBarView, "backgroundColor");
}

- (void)setBarColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_progressBarView, "setBackgroundColor:", a3);
  -[CPUIProgressBarView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  double Width;
  double v6;
  double v7;
  double v8;
  id v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  -[CPUIProgressBarView bounds](self, "bounds");
  v3 = CGRectGetHeight(v10) * 0.5;
  -[CPUIProgressBarView overallBarView](self, "overallBarView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setCornerRadius:", v3);
  -[CPUIProgressBarView bounds](self, "bounds");
  Width = CGRectGetWidth(v11);
  -[CPUIProgressBarView bounds](self, "bounds");
  v7 = v6;
  -[CPUIProgressBarView bounds](self, "bounds");
  -[UIView setFrame:](self->_overallBarView, "setFrame:", 0.0, CGRectGetMidY(v12) - v3, Width, v7);
  -[CPUIProgressBarView progress](self, "progress");
  -[UIView setFrame:](self->_progressBarView, "setFrame:", 0.0, 0.0, floor(Width * v8), v7);

}

- (void)setProgress:(double)a3
{
  _QWORD v4[5];

  self->_progress = a3;
  -[CPUIProgressBarView setNeedsLayout](self, "setNeedsLayout");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__CPUIProgressBarView_setProgress___block_invoke;
  v4[3] = &unk_24DF241A0;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 196612, v4, 0, 0.100000001, 0.0);
}

uint64_t __35__CPUIProgressBarView_setProgress___block_invoke(uint64_t a1)
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
