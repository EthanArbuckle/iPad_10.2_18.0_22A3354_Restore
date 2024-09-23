@implementation SFProgressView

- (SFProgressView)initWithFrame:(CGRect)a3
{
  SFProgressView *v3;
  SFRingView *v4;
  SFRingView *trackRing;
  void *v6;
  SFRingView *v7;
  SFRingView *progressRing;
  void *v9;
  UIView *v10;
  UIView *rectangularFillView;
  void *v12;
  void *v13;
  SFProgressView *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SFProgressView;
  v3 = -[SFProgressView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SFRingView);
    trackRing = v3->_trackRing;
    v3->_trackRing = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRingView setTintColor:](v3->_trackRing, "setTintColor:", v6);

    -[SFProgressView addSubview:](v3, "addSubview:", v3->_trackRing);
    v7 = objc_alloc_init(SFRingView);
    progressRing = v3->_progressRing;
    v3->_progressRing = v7;

    -[SFRingView shapeLayer](v3->_progressRing, "shapeLayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStrokeEnd:", 0.0);

    -[SFProgressView addSubview:](v3, "addSubview:", v3->_progressRing);
    v10 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    rectangularFillView = v3->_rectangularFillView;
    v3->_rectangularFillView = v10;

    -[UIView setFrame:](v3->_rectangularFillView, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView _setContinuousCornerRadius:](v3->_rectangularFillView, "_setContinuousCornerRadius:", 1.0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_rectangularFillView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorWithAlphaComponent:", 0.33);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_rectangularFillView, "setBackgroundColor:", v13);

    -[UIView setHidden:](v3->_rectangularFillView, "setHidden:", 1);
    -[SFProgressView addSubview:](v3, "addSubview:", v3->_rectangularFillView);
    v14 = v3;
  }

  return v3;
}

- (void)setStyle:(int64_t)a3
{
  _BOOL8 v4;
  uint64_t v5;

  if (self->_style != a3)
  {
    self->_style = a3;
    if ((unint64_t)a3 <= 2)
    {
      v4 = (a3 & 7) == 2;
      v5 = (3u >> a3) & 1;
      -[SFRingView setHidden:](self->_trackRing, "setHidden:", v4);
      -[SFRingView setHidden:](self->_progressRing, "setHidden:", v4);
      -[UIView setHidden:](self->_rectangularFillView, "setHidden:", v5);
    }
  }
}

- (void)setProgress:(double)a3
{
  -[SFProgressView setProgress:animated:completion:](self, "setProgress:animated:completion:", 0, 0, a3);
}

- (void)setProgress:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  uint64_t v9;
  id v10;
  void (**v11)(_QWORD);
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[6];
  _QWORD aBlock[4];
  id v19;

  v5 = a4;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__SFProgressView_setProgress_animated_completion___block_invoke;
  aBlock[3] = &unk_1E21E4698;
  v10 = v8;
  v19 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  v12 = v11;
  if (self->_progress == a3)
  {
    v11[2](v11);
  }
  else
  {
    self->_progress = a3;
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __50__SFProgressView_setProgress_animated_completion___block_invoke_2;
    v17[3] = &unk_1E21E2658;
    v17[4] = self;
    *(double *)&v17[5] = a3;
    v13 = _Block_copy(v17);
    v14 = (void *)MEMORY[0x1E0DC3F10];
    if (v5)
    {
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __50__SFProgressView_setProgress_animated_completion___block_invoke_3;
      v15[3] = &unk_1E21E2608;
      v16 = v12;
      objc_msgSend(v14, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v13, v15);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v13);
      v12[2](v12);
    }

  }
}

uint64_t __50__SFProgressView_setProgress_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __50__SFProgressView_setProgress_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  double v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 440);
  if (v3 >= 2)
  {
    if (v3 == 2)
      objc_msgSend((id)v2, "_updateRectangularProgressFill");
  }
  else
  {
    v4 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(v2 + 424), "shapeLayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStrokeEnd:", v4);

  }
}

uint64_t __50__SFProgressView_setProgress_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setRadius:(double)a3
{
  if (self->_radius != a3)
  {
    self->_radius = a3;
    -[SFProgressView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[SFProgressView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setTrackWidth:(double)a3
{
  if (self->_trackWidth != a3)
  {
    self->_trackWidth = a3;
    -[SFProgressView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIColor)trackTintColor
{
  return (UIColor *)-[SFRingView tintColor](self->_trackRing, "tintColor");
}

- (void)setTrackTintColor:(id)a3
{
  -[SFRingView setTintColor:](self->_trackRing, "setTintColor:", a3);
}

- (void)layoutSubviews
{
  double trackWidth;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFProgressView;
  -[SFProgressView layoutSubviews](&v9, sel_layoutSubviews);
  trackWidth = self->_trackWidth;
  v4 = trackWidth * 0.5;
  v5 = self->_radius - trackWidth * 0.5 + self->_radius - trackWidth * 0.5;
  -[SFRingView shapeLayer](self->_trackRing, "shapeLayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineWidth:", trackWidth);

  -[SFRingView setRadius:](self->_trackRing, "setRadius:", self->_radius - trackWidth * 0.5);
  -[SFRingView setFrame:](self->_trackRing, "setFrame:", trackWidth * 0.5, trackWidth * 0.5, v5, v5);
  v7 = self->_trackWidth;
  -[SFRingView shapeLayer](self->_progressRing, "shapeLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLineWidth:", v7);

  -[SFRingView setRadius:](self->_progressRing, "setRadius:", self->_radius - v4);
  -[SFRingView setFrame:](self->_progressRing, "setFrame:", v4, v4, v5, v5);
  -[SFProgressView _updateRectangularProgressFill](self, "_updateRectangularProgressFill");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = self->_radius + self->_radius;
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_updateRectangularProgressFill
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;

  -[SFProgressView bounds](self, "bounds");
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  v7 = CGRectGetWidth(v13);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v8 = CGRectGetHeight(v14);
  v9 = _SFRoundFloatToPixels(v7 * 0.6);
  v10 = _SFRoundFloatToPixels(v8 * 0.55 * fmin(self->_progress, 1.0));
  v11 = _SFRoundFloatToPixels(0.25);
  v12 = _SFRoundFloatToPixels(2.47);
  -[UIView setFrame:](self->_rectangularFillView, "setFrame:", _SFRoundFloatToPixels((v7 - v9) * 0.5) - v11, v8 - v10 - v12, v9, v10);
}

- (int64_t)style
{
  return self->_style;
}

- (double)progress
{
  return self->_progress;
}

- (double)radius
{
  return self->_radius;
}

- (double)trackWidth
{
  return self->_trackWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectangularFillView, 0);
  objc_storeStrong((id *)&self->_progressRing, 0);
  objc_storeStrong((id *)&self->_trackRing, 0);
}

@end
