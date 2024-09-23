@implementation CAMExposureBiasSlider

- (CAMExposureBiasSlider)initWithFrame:(CGRect)a3
{
  CAMExposureBiasSlider *v3;
  double v4;
  CAMExposureBiasSlider *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  UIView *minTrackView;
  uint64_t v16;
  UIView *maxTrackView;
  uint64_t v18;
  UIView *minTrackMaskView;
  uint64_t v20;
  UIView *maxTrackMaskView;
  UIView *v22;
  void *v23;
  UIView *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CAMExposureBiasSliderThumb *v30;
  CAMExposureBiasSliderThumb *thumbView;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)CAMExposureBiasSlider;
  v3 = -[CAMExposureBiasSlider initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 0;
    -[CAMExposureBiasSlider setExposureBiasMin:](v3, "setExposureBiasMin:", v4);
    LODWORD(v6) = 1.0;
    -[CAMExposureBiasSlider setExposureBiasMax:](v5, "setExposureBiasMax:", v6);
    LODWORD(v7) = 0;
    -[CAMExposureBiasSlider setExposureBiasValue:](v5, "setExposureBiasValue:", v7);
    -[CAMExposureBiasSlider tintColor](v5, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0DC3890]);
    v10 = *MEMORY[0x1E0C9D648];
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E0C9D648], v11, v12, v13);
    minTrackView = v5->__minTrackView;
    v5->__minTrackView = (UIView *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v10, v11, v12, v13);
    maxTrackView = v5->__maxTrackView;
    v5->__maxTrackView = (UIView *)v16;

    -[UIView setBackgroundColor:](v5->__minTrackView, "setBackgroundColor:", v8);
    -[UIView setBackgroundColor:](v5->__maxTrackView, "setBackgroundColor:", v8);
    -[CAMExposureBiasSlider addSubview:](v5, "addSubview:", v5->__minTrackView);
    -[CAMExposureBiasSlider addSubview:](v5, "addSubview:", v5->__maxTrackView);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v10, v11, v12, v13);
    minTrackMaskView = v5->__minTrackMaskView;
    v5->__minTrackMaskView = (UIView *)v18;

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v10, v11, v12, v13);
    maxTrackMaskView = v5->__maxTrackMaskView;
    v5->__maxTrackMaskView = (UIView *)v20;

    v22 = v5->__minTrackMaskView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    v24 = v5->__maxTrackMaskView;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v24, "setBackgroundColor:", v25);

    -[UIView layer](v5->__minTrackView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v5->__minTrackMaskView, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setMask:", v27);

    -[UIView layer](v5->__maxTrackView, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v5->__maxTrackMaskView, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setMask:", v29);

    v30 = -[CAMExposureBiasSliderThumb initWithFrame:]([CAMExposureBiasSliderThumb alloc], "initWithFrame:", v10, v11, v12, v13);
    thumbView = v5->__thumbView;
    v5->__thumbView = v30;

    -[CAMExposureBiasSlider addSubview:](v5, "addSubview:", v5->__thumbView);
  }
  return v5;
}

- (void)tintColorDidChange
{
  id v3;

  -[CAMExposureBiasSlider tintColor](self, "tintColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->__minTrackView, "setBackgroundColor:", v3);
  -[UIView setBackgroundColor:](self->__maxTrackView, "setBackgroundColor:", v3);

}

- (void)setExposureBiasMin:(float)a3
{
  if (self->_exposureBiasMin != a3)
  {
    self->_exposureBiasMin = a3;
    -[CAMExposureBiasSlider _updateForChangedNormalizedExposureValue](self, "_updateForChangedNormalizedExposureValue");
  }
}

- (void)setExposureBiasMax:(float)a3
{
  if (self->_exposureBiasMax != a3)
  {
    self->_exposureBiasMax = a3;
    -[CAMExposureBiasSlider _updateForChangedNormalizedExposureValue](self, "_updateForChangedNormalizedExposureValue");
  }
}

- (void)setExposureBiasValue:(float)a3
{
  if (self->_exposureBiasValue != a3)
  {
    self->_exposureBiasValue = a3;
    -[CAMExposureBiasSlider _updateForChangedNormalizedExposureValue](self, "_updateForChangedNormalizedExposureValue");
  }
  -[CAMExposureBiasSlider updateLastInteractionTime](self, "updateLastInteractionTime");
}

- (double)thumbMaxExtension
{
  double result;

  -[CAMExposureBiasSliderThumb maxRadius](self->__thumbView, "maxRadius");
  return result;
}

- (void)_updateForChangedNormalizedExposureValue
{
  -[CAMExposureBiasSlider _normalizedExposureValue](self, "_normalizedExposureValue");
  -[CAMExposureBiasSliderThumb setNormalizedExposureValue:](self->__thumbView, "setNormalizedExposureValue:");
  -[CAMExposureBiasSlider setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 143.0;
  v4 = 1.0;
  result.height = v3;
  result.width = v4;
  return result;
}

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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat width;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  double v21;
  double v22;
  double v23;
  double MaxY;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v25.receiver = self;
  v25.super_class = (Class)CAMExposureBiasSlider;
  -[CAMExposureBiasSlider layoutSubviews](&v25, sel_layoutSubviews);
  -[CAMExposureBiasSlider bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[CAMExposureBiasSlider _normalizedExposureValue](self, "_normalizedExposureValue");
  -[CAMExposureBiasSlider _sunCenterForNormalizedValue:](self, "_sunCenterForNormalizedValue:");
  -[CAMExposureBiasSliderThumb sizeThatFits:](self->__thumbView, "sizeThatFits:", v4, v6);
  v8 = v7;
  v10 = v9;
  UIRoundToViewScale();
  v12 = v11;
  UIRoundToViewScale();
  v14 = v13;
  -[CAMExposureBiasSliderThumb setFrame:](self->__thumbView, "setFrame:", v12, v13, v8, v10);
  v15 = *MEMORY[0x1E0C9D648];
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  -[UIView setFrame:](self->__minTrackView, "setFrame:", *MEMORY[0x1E0C9D648], v16, 1.0, 143.0);
  -[UIView setFrame:](self->__maxTrackView, "setFrame:", v15, v16, 1.0, 143.0);
  -[CAMExposureBiasSlider convertRect:toView:](self, "convertRect:toView:", self->__minTrackView, v12, v14, v8, v10);
  width = v26.size.width;
  v26.origin.x = v21 + 0.0;
  x = v26.origin.x;
  v26.origin.y = v22 + -3.0;
  y = v26.origin.y;
  v26.size.height = v23 + 6.0;
  height = v26.size.height;
  -[UIView setFrame:](self->__minTrackMaskView, "setFrame:", 0.0, 0.0, 1.0, CGRectGetMinY(v26));
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxY = CGRectGetMaxY(v27);
  v28.size.width = 1.0;
  v28.origin.x = v15;
  v28.origin.y = v16;
  v28.size.height = 143.0;
  -[UIView setFrame:](self->__maxTrackMaskView, "setFrame:", 0.0, MaxY, 1.0, CGRectGetMaxY(v28) - MaxY);
}

- (CGPoint)_sunCenterForNormalizedValue:(float)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat MaxY;
  double v16;
  double MidX;
  double v18;
  CGPoint result;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[CAMExposureBiasSlider bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = 3.0 - CAMPixelWidthForView(self);
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  v14 = CGRectGetMinY(v20) + v13;
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  MaxY = CGRectGetMaxY(v21);
  v16 = MaxY - v13 + a3 * (v14 - (MaxY - v13));
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  MidX = CGRectGetMidX(v22);
  v18 = v16;
  result.y = v18;
  result.x = MidX;
  return result;
}

- (float)_normalizedExposureValue
{
  float v3;
  float v4;
  float v5;
  double v6;
  float v7;

  -[CAMExposureBiasSlider exposureBiasMin](self, "exposureBiasMin");
  v4 = v3;
  -[CAMExposureBiasSlider exposureBiasMax](self, "exposureBiasMax");
  v5 = *(float *)&v6;
  LODWORD(v6) = 0;
  if (v5 > v4)
  {
    -[CAMExposureBiasSlider exposureBiasValue](self, "exposureBiasValue", v6);
    if (v7 < v4)
      v7 = v4;
    if (v7 > v5)
      v7 = v5;
    *(float *)&v6 = (float)(v7 - v4) / (float)(v5 - v4);
  }
  return *(float *)&v6;
}

- (void)setSuspendTrackFadeOut:(BOOL)a3
{
  if (self->_suspendTrackFadeOut != a3)
  {
    self->_suspendTrackFadeOut = a3;
    if (a3)
    {
      -[CAMExposureBiasSlider _cancelDelayedDim](self, "_cancelDelayedDim");
      -[CAMExposureBiasSlider updateLastInteractionTime](self, "updateLastInteractionTime");
    }
    else
    {
      -[CAMExposureBiasSlider _scheduleDelayedDim](self, "_scheduleDelayedDim");
    }
  }
}

- (void)forceTrackDimmed
{
  -[CAMExposureBiasSlider _cancelDelayedDim](self, "_cancelDelayedDim");
  -[CAMExposureBiasSlider _animateTrackAlpha:withDuration:](self, "_animateTrackAlpha:withDuration:", 0.0, 0.0);
}

- (void)updateLastInteractionTime
{
  double v3;

  -[CAMExposureBiasSlider _cancelDelayedDim](self, "_cancelDelayedDim");
  self->__lastInteractionTime = CFAbsoluteTimeGetCurrent();
  -[CAMExposureBiasSlider _trackAlpha](self, "_trackAlpha");
  if (fabs(v3) <= 0.00000011920929)
    -[CAMExposureBiasSlider _animateTrackAlpha:withDuration:](self, "_animateTrackAlpha:withDuration:", 1.0, 0.0);
  -[CAMExposureBiasSlider _scheduleDelayedDim](self, "_scheduleDelayedDim");
}

- (void)_scheduleDelayedDim
{
  if (!-[CAMExposureBiasSlider suspendTrackFadeOut](self, "suspendTrackFadeOut"))
    -[CAMExposureBiasSlider performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__dimTrackForInactivity, 0, 1.2);
}

- (void)_cancelDelayedDim
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__dimTrackForInactivity, 0);
}

- (void)_dimTrackForInactivity
{
  double v3;

  if (!-[CAMExposureBiasSlider suspendTrackFadeOut](self, "suspendTrackFadeOut"))
  {
    -[CAMExposureBiasSlider _trackAlpha](self, "_trackAlpha");
    if (v3 == 1.0)
      -[CAMExposureBiasSlider _animateTrackAlpha:withDuration:](self, "_animateTrackAlpha:withDuration:", 0.0, 0.36);
  }
}

- (void)_animateTrackAlpha:(double)a3 withDuration:(double)a4
{
  _QWORD v6[6];

  if (a4 <= 0.0)
  {
    -[UIView setAlpha:](self->__minTrackView, "setAlpha:", a3);
    -[UIView setAlpha:](self->__maxTrackView, "setAlpha:", a3);
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__CAMExposureBiasSlider__animateTrackAlpha_withDuration___block_invoke;
    v6[3] = &unk_1EA328B18;
    v6[4] = self;
    *(double *)&v6[5] = a3;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, a4, 0.0);
  }
}

uint64_t __57__CAMExposureBiasSlider__animateTrackAlpha_withDuration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setAlpha:", *(double *)(a1 + 40));
}

- (double)_trackAlpha
{
  double result;

  -[UIView alpha](self->__minTrackView, "alpha");
  return result;
}

- (float)exposureBiasMin
{
  return self->_exposureBiasMin;
}

- (float)exposureBiasMax
{
  return self->_exposureBiasMax;
}

- (float)exposureBiasValue
{
  return self->_exposureBiasValue;
}

- (BOOL)suspendTrackFadeOut
{
  return self->_suspendTrackFadeOut;
}

- (CAMExposureBiasSliderThumb)_thumbView
{
  return self->__thumbView;
}

- (UIView)_minTrackView
{
  return self->__minTrackView;
}

- (UIView)_maxTrackView
{
  return self->__maxTrackView;
}

- (UIView)_minTrackMaskView
{
  return self->__minTrackMaskView;
}

- (UIView)_maxTrackMaskView
{
  return self->__maxTrackMaskView;
}

- (double)_lastInteractionTime
{
  return self->__lastInteractionTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__maxTrackMaskView, 0);
  objc_storeStrong((id *)&self->__minTrackMaskView, 0);
  objc_storeStrong((id *)&self->__maxTrackView, 0);
  objc_storeStrong((id *)&self->__minTrackView, 0);
  objc_storeStrong((id *)&self->__thumbView, 0);
}

@end
