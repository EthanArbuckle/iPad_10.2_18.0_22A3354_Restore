@implementation CPUIPlaybackProgressView

- (CPUIPlaybackProgressView)init
{
  CPUIPlaybackProgressView *v2;
  id v3;
  uint64_t v4;
  UIView *currentProgressView;
  uint64_t v6;
  UIView *overallProgressView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CPUIPlaybackProgressView;
  v2 = -[CPUIPlaybackProgressView initWithFrame:](&v10, sel_initWithFrame_, 0.0, 0.0, 145.0, 2.5);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDF6F90]);
    v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    currentProgressView = v2->_currentProgressView;
    v2->_currentProgressView = (UIView *)v4;

    -[CPUIPlaybackProgressView addSubview:](v2, "addSubview:", v2->_currentProgressView);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 145.0, 2.5);
    overallProgressView = v2->_overallProgressView;
    v2->_overallProgressView = (UIView *)v6;

    -[UIView setAlpha:](v2->_overallProgressView, "setAlpha:", 0.200000003);
    -[UIView layer](v2->_overallProgressView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 1.25);

    -[CPUIPlaybackProgressView addSubview:](v2, "addSubview:", v2->_overallProgressView);
    -[CPUIPlaybackProgressView setProgressViewHighlighted:](v2, "setProgressViewHighlighted:", 0);
  }
  return v2;
}

- (void)setPlaybackProgress:(double)a3
{
  if (vabdd_f64(self->_playbackProgress, a3) > 0.00000011920929)
  {
    self->_playbackProgress = a3;
    -[CPUIPlaybackProgressView setShouldResizeCurrentProgress:](self, "setShouldResizeCurrentProgress:", 1);
    -[CPUIPlaybackProgressView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[CPUIPlaybackProgressView setProgressViewHighlighted:](self, "setProgressViewHighlighted:");
  }
}

- (void)setProgressViewHighlighted:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusPrimaryColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemPrimaryColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIPlaybackProgressView currentProgressView](self, "currentProgressView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  if (a3)
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusSecondaryColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CPUIPlaybackProgressView overallProgressView](self, "overallProgressView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

}

- (void)layoutSubviews
{
  double Width;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  objc_super v26;
  CGRect v27;

  v26.receiver = self;
  v26.super_class = (Class)CPUIPlaybackProgressView;
  -[CPUIPlaybackProgressView layoutSubviews](&v26, sel_layoutSubviews);
  if (-[CPUIPlaybackProgressView shouldResizeCurrentProgress](self, "shouldResizeCurrentProgress"))
  {
    -[CPUIPlaybackProgressView frame](self, "frame");
    Width = CGRectGetWidth(v27);
    -[CPUIPlaybackProgressView playbackProgress](self, "playbackProgress");
    v5 = Width * v4;
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceLayoutDirection");

    v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    if (v7 == 1)
    {
      -[CPUIPlaybackProgressView frame](self, "frame");
      v10 = v9 - v5;
    }
    else
    {
      v10 = *MEMORY[0x24BDBEFB0];
    }
    -[CPUIPlaybackProgressView frame](self, "frame");
    v12 = v11;
    -[CPUIPlaybackProgressView currentProgressView](self, "currentProgressView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v10, v8, v5, v12);

    v14 = (void *)MEMORY[0x24BDF6870];
    -[CPUIPlaybackProgressView currentProgressView](self, "currentProgressView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    objc_msgSend(v14, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIPlaybackProgressView bounds](self, "bounds");
    objc_msgSend(v17, "setFrame:");
    v18 = objc_retainAutorelease(v16);
    objc_msgSend(v17, "setPath:", objc_msgSend(v18, "CGPath"));
    -[CPUIPlaybackProgressView currentProgressView](self, "currentProgressView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setMask:", v17);

    -[CPUIPlaybackProgressView frame](self, "frame");
    v22 = v21;
    -[CPUIPlaybackProgressView frame](self, "frame");
    v24 = v23;
    -[CPUIPlaybackProgressView overallProgressView](self, "overallProgressView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", 0.0, 0.0, v22, v24);

    -[CPUIPlaybackProgressView setShouldResizeCurrentProgress:](self, "setShouldResizeCurrentProgress:", 0);
  }
}

- (double)playbackProgress
{
  return self->_playbackProgress;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (UIView)overallProgressView
{
  return self->_overallProgressView;
}

- (void)setOverallProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_overallProgressView, a3);
}

- (UIView)currentProgressView
{
  return self->_currentProgressView;
}

- (void)setCurrentProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_currentProgressView, a3);
}

- (BOOL)shouldResizeCurrentProgress
{
  return self->_shouldResizeCurrentProgress;
}

- (void)setShouldResizeCurrentProgress:(BOOL)a3
{
  self->_shouldResizeCurrentProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentProgressView, 0);
  objc_storeStrong((id *)&self->_overallProgressView, 0);
}

@end
