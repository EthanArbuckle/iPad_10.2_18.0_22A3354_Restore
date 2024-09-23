@implementation PKProgressAlertContentView

- (void)layoutSubviews
{
  _PKAnimatableBorderCornerRadiusView *outerRingView;
  void *v4;
  _PKPathView *innerPieView;
  id v6;

  -[PKProgressAlertContentView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  -[_PKAnimatableBorderCornerRadiusView setFrame:](self->_outerRingView, "setFrame:");
  UIRectCenteredIntegralRect();
  -[_PKPathView setFrame:](self->_innerPieView, "setFrame:");
  -[_PKAnimatableBorderCornerRadiusView setBorderWidth:](self->_outerRingView, "setBorderWidth:", 4.0);
  -[_PKAnimatableBorderCornerRadiusView setCornerRadius:](self->_outerRingView, "setCornerRadius:", 20.0);
  outerRingView = self->_outerRingView;
  -[PKProgressAlertContentView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PKAnimatableBorderCornerRadiusView setBorderColor:](outerRingView, "setBorderColor:", v4);

  innerPieView = self->_innerPieView;
  -[PKProgressAlertContentView tintColor](self, "tintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_PKPathView setFillColor:](innerPieView, "setFillColor:", v6);

}

- (id)_shapeLayerPathForProgress:(double)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "moveToPoint:", 18.0, 18.0);
  objc_msgSend(v4, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, 18.0, 18.0, 18.0, -1.57079633, a3 * 6.28318531 + -1.57079633);
  objc_msgSend(v4, "closePath");
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 105.0;
  v3 = 105.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setProgress:(double)a3
{
  double progress;
  _QWORD v4[8];

  progress = self->_progress;
  self->_progress = a3;
  if (progress < 0.1)
    progress = 0.1;
  if (a3 < 0.1)
    a3 = 0.1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__PKProgressAlertContentView_setProgress___block_invoke;
  v4[3] = &unk_1E777A828;
  *(double *)&v4[6] = progress;
  v4[7] = 0x3F847AE147AE147BLL;
  v4[4] = self;
  v4[5] = (uint64_t)fmax((a3 - progress) / 0.01, 1.0);
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 4, v4, 0);
}

uint64_t __42__PKProgressAlertContentView_setProgress___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  _QWORD v6[6];

  v1 = *(_QWORD *)(result + 40);
  if (v1 >= 1)
  {
    v2 = result;
    v3 = 0;
    v4 = MEMORY[0x1E0C809B0];
    do
    {
      v5 = *(double *)(v2 + 48) + (double)v3 * *(double *)(v2 + 56);
      v6[0] = v4;
      v6[1] = 3221225472;
      v6[2] = __42__PKProgressAlertContentView_setProgress___block_invoke_2;
      v6[3] = &unk_1E7778048;
      v6[4] = *(_QWORD *)(v2 + 32);
      *(double *)&v6[5] = v5;
      result = objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v6, (double)v3++ / (double)v1, 1.0 / (double)v1);
      v1 = *(_QWORD *)(v2 + 40);
    }
    while (v3 < v1);
  }
  return result;
}

void __42__PKProgressAlertContentView_setProgress___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 424);
  objc_msgSend(*(id *)(a1 + 32), "_shapeLayerPathForProgress:", *(double *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPath:", v2);

}

- (PKProgressAlertContentView)initWithFrame:(CGRect)a3
{
  PKProgressAlertContentView *v3;
  _PKAnimatableBorderCornerRadiusView *v4;
  _PKAnimatableBorderCornerRadiusView *outerRingView;
  _PKPathView *v6;
  _PKPathView *innerPieView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKProgressAlertContentView;
  v3 = -[PKProgressAlertContentView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(_PKAnimatableBorderCornerRadiusView);
  outerRingView = v3->_outerRingView;
  v3->_outerRingView = v4;

  -[PKProgressAlertContentView addSubview:](v3, "addSubview:", v3->_outerRingView);
  v6 = objc_alloc_init(_PKPathView);
  innerPieView = v3->_innerPieView;
  v3->_innerPieView = v6;

  -[PKProgressAlertContentView addSubview:](v3, "addSubview:", v3->_innerPieView);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.455, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKProgressAlertContentView setTintColor:](v3, "setTintColor:", v8);

  return v3;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerPieView, 0);
  objc_storeStrong((id *)&self->_outerRingView, 0);
}

@end
