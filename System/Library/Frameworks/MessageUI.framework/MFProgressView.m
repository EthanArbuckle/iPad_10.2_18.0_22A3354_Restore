@implementation MFProgressView

+ (id)progressViewWithDefaultStyleStrokeAndRect
{
  MFProgressView *v2;
  double v3;
  double v4;
  double v5;

  v2 = [MFProgressView alloc];
  UIRoundToViewScale();
  v4 = v3;
  UIRoundToViewScale();
  return -[MFProgressView initWithProgressViewStyle:stroke:frame:](v2, "initWithProgressViewStyle:stroke:frame:", 0, 3.0, 0.0, 0.0, v4, v5);
}

- (MFProgressView)initWithProgressViewStyle:(int64_t)a3 stroke:(double)a4 frame:(CGRect)a5
{
  MFProgressView *v6;
  MFProgressView *v7;
  void *v8;
  void *v9;
  MFProgressView *v10;
  objc_super v12;
  CGRect v13;

  v12.receiver = self;
  v12.super_class = (Class)MFProgressView;
  v6 = -[MFProgressView initWithFrame:](&v12, sel_initWithFrame_, a3, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v7 = v6;
  if (v6)
  {
    v6->_stroke = a4;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.870000005, 0.870000005, 0.870000005, 1.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFProgressView setTintColor:](v7, "setTintColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFProgressView setBackgroundColor:](v7, "setBackgroundColor:", v9);

    -[MFProgressView bounds](v7, "bounds");
    -[MFProgressView setBounds:](v7, "setBounds:");
    -[MFProgressView bounds](v7, "bounds");
    v7->_diameter = CGRectGetWidth(v13);
    v10 = v7;
  }

  return v7;
}

- (CGSize)intrinsicContentSize
{
  double diameter;
  double v3;
  CGSize result;

  diameter = self->_diameter;
  v3 = diameter;
  result.height = v3;
  result.width = diameter;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[MFProgressView _invalidateDisplayLink](self, "_invalidateDisplayLink");
  -[MFProgressView _invalidateSimulationTimer](self, "_invalidateSimulationTimer");
  v3.receiver = self;
  v3.super_class = (Class)MFProgressView;
  -[MFProgressView dealloc](&v3, sel_dealloc);
}

- (void)_invalidateDisplayLink
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)setProgress:(double)a3
{
  double v4;
  CADisplayLink *v6;
  CADisplayLink *displayLink;
  CADisplayLink *v8;
  CADisplayLink *v9;
  void *v10;
  CAFrameRateRange v11;

  v4 = self->_targetProgress - a3;
  if (v4 < 0.0)
    v4 = -v4;
  if (v4 >= 0.00000011920929)
  {
    if (!self->_displayLink)
    {
      objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__onDisplayLink_);
      v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v6;

      v8 = self->_displayLink;
      v11 = CAFrameRateRangeMake(30.0, 120.0, 0.0);
      -[CADisplayLink setPreferredFrameRateRange:](v8, "setPreferredFrameRateRange:", *(double *)&v11.minimum, *(double *)&v11.maximum, *(double *)&v11.preferred);

      v9 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v9, "addToRunLoop:forMode:", v10, *MEMORY[0x1E0C99860]);

    }
    self->_targetProgress = a3;
  }
}

- (void)progressDidFinish
{
  id WeakRetained;

  self->_targetProgress = 0.0;
  self->_displayedProgress = 0.0;
  -[MFProgressView _invalidateDisplayLink](self, "_invalidateDisplayLink");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "progressViewCanBeRemoved:", self);

}

- (void)simulateActivity
{
  NSTimer *v3;
  NSTimer *simulateActivityTimer;

  if (self->_simulateActivityTimer)
  {
    -[MFProgressView setProgress:](self, "setProgress:", self->_targetProgress + 0.1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_simulateActivity, 0, 1, 1.0);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    simulateActivityTimer = self->_simulateActivityTimer;
    self->_simulateActivityTimer = v3;

  }
}

- (void)_invalidateSimulationTimer
{
  NSTimer *simulateActivityTimer;

  -[NSTimer invalidate](self->_simulateActivityTimer, "invalidate");
  simulateActivityTimer = self->_simulateActivityTimer;
  self->_simulateActivityTimer = 0;

}

- (void)_onDisplayLink:(id)a3
{
  -[MFProgressView bounds](self, "bounds", a3);
  -[MFProgressView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[MFProgressView _adjustProgress](self, "_adjustProgress");
  -[MFProgressView _drawProgressInRect:](self, "_drawProgressInRect:", x, y, width, height);
}

- (void)_adjustProgress
{
  double targetProgress;
  double displayedProgress;
  CADisplayLink *v5;
  CAFrameRateRange v6;
  CAFrameRateRange v7;

  targetProgress = self->_targetProgress;
  if (targetProgress >= 0.999999881)
  {
    self->_displayedProgress = 1.0;
  }
  else
  {
    displayedProgress = self->_displayedProgress;
    v5 = self->_displayLink;
    if (displayedProgress <= targetProgress)
    {
      v7 = CAFrameRateRangeMake(30.0, 120.0, 0.0);
      -[CADisplayLink setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);

      self->_displayedProgress = self->_displayedProgress + 0.02;
    }
    else
    {
      v6 = CAFrameRateRangeMake(30.0, 120.0, 30.0);
      -[CADisplayLink setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);

    }
  }
}

- (void)_drawProgressInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  UIRectGetCenter();
  v9 = v8;
  v11 = v10;
  v12 = v8 - x + self->_stroke * -0.5;
  if (-[MFProgressView _isValidCenter:radius:rect:](self, "_isValidCenter:radius:rect:", v8, v10, v12, x, y, width, height))
  {
    -[MFProgressView _drawCircleWithCenter:radius:](self, "_drawCircleWithCenter:radius:", v9, v11, v12);
    -[MFProgressView _drawWedgeWithCenter:radius:](self, "_drawWedgeWithCenter:radius:", v9, v11, v12);
  }
}

- (BOOL)_isValidCenter:(CGPoint)a3 radius:(double)a4 rect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  NSObject *v14;
  void *v15;
  void *v16;
  double displayedProgress;
  double targetProgress;
  int v19;
  void *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  uint64_t v29;
  CGPoint v30;
  CGRect v31;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3.y;
  v11 = a3.x;
  v29 = *MEMORY[0x1E0C80C00];
  if (CGFloatIsValid() && CGFloatIsValid() && (CGFloatIsValid() & 1) != 0)
    return 1;
  MFLogGeneral();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v30.x = v11;
    v30.y = v10;
    NSStringFromCGPoint(v30);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v31.origin.x = x;
    v31.origin.y = y;
    v31.size.width = width;
    v31.size.height = height;
    NSStringFromCGRect(v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    displayedProgress = self->_displayedProgress;
    targetProgress = self->_targetProgress;
    v19 = 138413314;
    v20 = v15;
    v21 = 2048;
    v22 = a4;
    v23 = 2112;
    v24 = v16;
    v25 = 2048;
    v26 = displayedProgress;
    v27 = 2048;
    v28 = targetProgress;
    _os_log_impl(&dword_1AB96A000, v14, OS_LOG_TYPE_DEFAULT, "#Warning Invalid progress metrics (see 15710132): center: %@, radius: %f, rect:%@, progress: %f, target: %f", (uint8_t *)&v19, 0x34u);

  }
  return 0;
}

- (void)_drawCircleWithCenter:(CGPoint)a3 radius:(double)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a3.x, a3.y, a4, 0.0, 6.28318531);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIColor setStroke](self->_tintColor, "setStroke");
  -[UIColor setFill](self->_tintColor, "setFill");
  objc_msgSend(v5, "setLineWidth:", self->_stroke);
  objc_msgSend(v5, "strokeWithBlendMode:alpha:", 17, 1.0);

}

- (void)_drawWedgeWithCenter:(CGPoint)a3 radius:(double)a4
{
  double y;
  double x;
  double displayedProgress;
  id v8;

  y = a3.y;
  x = a3.x;
  displayedProgress = self->_displayedProgress;
  if (fabs(displayedProgress) >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "moveToPoint:", x, y);
    objc_msgSend(v8, "addLineToPoint:", x, y - a4);
    objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, a4, -1.57079633, displayedProgress * 6.28318531 + -1.57079633);
    objc_msgSend(v8, "addLineToPoint:", x, y);
    objc_msgSend(v8, "fillWithBlendMode:alpha:", 17, 1.0);

  }
}

- (void)_stopSimulationIfCompleted
{
  if (self->_simulateActivityTimer)
  {
    if (self->_targetProgress >= 0.999999881)
      -[MFProgressView _invalidateSimulationTimer](self, "_invalidateSimulationTimer");
  }
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (MFProgressViewDelegate)delegate
{
  return (MFProgressViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_simulateActivityTimer, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
