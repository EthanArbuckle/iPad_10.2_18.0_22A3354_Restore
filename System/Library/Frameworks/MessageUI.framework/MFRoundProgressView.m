@implementation MFRoundProgressView

- (MFRoundProgressView)initWithFrame:(CGRect)a3
{
  MFRoundProgressView *v3;
  MFRoundProgressView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFRoundProgressView;
  v3 = -[MFRoundProgressView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MFRoundProgressView _updateSubviews](v3, "_updateSubviews");
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFRoundProgressView;
  -[MFRoundProgressView layoutSubviews](&v3, sel_layoutSubviews);
  -[MFRoundProgressView _updateSubviews](self, "_updateSubviews");
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MFRoundProgressView;
  -[MFRoundProgressView dealloc](&v3, sel_dealloc);
}

- (void)_updateSubviews
{
  id v3;
  UIView *v4;
  UIView *contentView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CAShapeLayer *sliceLayer;
  CAShapeLayer *v13;
  CAShapeLayer *v14;
  id v15;
  CAShapeLayer *circleLayer;
  CAShapeLayer *v17;
  CAShapeLayer *v18;
  id v19;
  double pieRadius;
  CGFloat x;
  CGFloat y;
  CGPath *Mutable;
  id v24;
  double v25;
  id v26;

  if (!self->_contentView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    contentView = self->_contentView;
    self->_contentView = v4;

    -[UIView setAutoresizingMask:](self->_contentView, "setAutoresizingMask:", 18);
    -[MFRoundProgressView addSubview:](self, "addSubview:", self->_contentView);
  }
  -[MFRoundProgressView bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  v10 = v7 * 0.5;
  if (v7 * 0.5 >= v9 * 0.5)
    v10 = v9 * 0.5;
  v11 = ceil(v10 / 5.5);
  -[MFRoundProgressView setPieRadius:](self, "setPieRadius:", v10 - v11 * 0.5);
  -[MFRoundProgressView resetProgress](self, "resetProgress");
  -[UIView layer](self->_contentView, "layer");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  sliceLayer = self->_sliceLayer;
  if (!sliceLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v13 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    v14 = self->_sliceLayer;
    self->_sliceLayer = v13;

    objc_msgSend(v26, "addSublayer:", self->_sliceLayer);
    sliceLayer = self->_sliceLayer;
  }
  -[CAShapeLayer setZPosition:](sliceLayer, "setZPosition:", 0.0);
  -[CAShapeLayer setStrokeColor:](self->_sliceLayer, "setStrokeColor:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setFillColor:](self->_sliceLayer, "setFillColor:", objc_msgSend(v15, "CGColor"));
  circleLayer = self->_circleLayer;
  if (!circleLayer)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v17 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    v18 = self->_circleLayer;
    self->_circleLayer = v17;

    objc_msgSend(v26, "addSublayer:", self->_circleLayer);
    circleLayer = self->_circleLayer;
  }
  -[CAShapeLayer setZPosition:](circleLayer, "setZPosition:", 0.0);
  v19 = objc_retainAutorelease(v15);
  -[CAShapeLayer setStrokeColor:](self->_circleLayer, "setStrokeColor:", objc_msgSend(v19, "CGColor"));
  -[CAShapeLayer setFillColor:](self->_circleLayer, "setFillColor:", 0);
  -[CAShapeLayer setLineWidth:](self->_circleLayer, "setLineWidth:", v11);
  pieRadius = self->_pieRadius;
  x = self->_pieCenter.x;
  y = self->_pieCenter.y;
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, x, y, pieRadius + -1.0, 0.0, 6.28318531, 0);
  CGPathCloseSubpath(Mutable);
  -[CAShapeLayer setPath:](self->_circleLayer, "setPath:", Mutable);
  CGPathRelease(Mutable);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.75);
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v26, "setShadowColor:", objc_msgSend(v24, "CGColor"));

  objc_msgSend(v26, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  LODWORD(v25) = 1.0;
  objc_msgSend(v26, "setShadowOpacity:", v25);
  objc_msgSend(v26, "setShadowRadius:", 0.5);
  -[MFRoundProgressView _updateUIProgress](self, "_updateUIProgress");

}

- (void)setPieRadius:(double)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  double pieRadius;
  id v11;
  CGRect v12;
  CGRect v13;

  self->_pieRadius = a3;
  -[MFRoundProgressView bounds](self, "bounds");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidY = CGRectGetMidY(v13);
  self->_pieCenter.x = MidX;
  self->_pieCenter.y = MidY;
  pieRadius = self->_pieRadius;
  -[MFRoundProgressView layer](self, "layer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", pieRadius);

}

- (void)_stopDisplayLink
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (void)_startDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  id v6;

  if (self->_uiProgress < 1.0 && !self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__displayLinkDidFire_);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:");

  }
}

- (void)_displayLinkDidFire:(id)a3
{
  double realProgress;
  double v5;
  double uiProgress;
  double increaseRate;
  double v8;
  double v10;
  id v11;

  v11 = a3;
  realProgress = self->_realProgress;
  if (realProgress == 0.0 || (v5 = self->_uiProgress, v5 < realProgress))
  {
    uiProgress = self->_uiProgress;
    increaseRate = self->_increaseRate;
    v8 = 1.0;
    if (realProgress >= 1.0)
    {
      v10 = uiProgress + increaseRate;
      if (uiProgress + increaseRate <= 1.0)
      {
LABEL_13:
        self->_uiProgress = v10;
        -[MFRoundProgressView _updateUIProgress](self, "_updateUIProgress");
        v5 = self->_uiProgress;
        goto LABEL_14;
      }
    }
    else
    {
      if (uiProgress + increaseRate * 1.1 >= 1.0)
        goto LABEL_15;
      if (realProgress == 0.0 && uiProgress >= 0.25)
        goto LABEL_15;
      v8 = uiProgress + increaseRate;
    }
    v10 = v8;
    goto LABEL_13;
  }
LABEL_14:
  if (v5 >= 1.0)
LABEL_15:
    -[MFRoundProgressView _stopDisplayLink](self, "_stopDisplayLink");

}

- (double)toRadian:(double)a3
{
  return (a3 + a3) * 3.14159265;
}

- (void)_updateUIProgress
{
  double v3;
  CGFloat v4;
  double pieRadius;
  CGFloat x;
  CGFloat y;
  CGPath *Mutable;

  -[MFRoundProgressView toRadian:](self, "toRadian:", self->_uiProgress);
  if (self->_sliceLayer)
  {
    v4 = v3 + 4.71238898;
    pieRadius = self->_pieRadius;
    x = self->_pieCenter.x;
    y = self->_pieCenter.y;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, x, y);
    CGPathAddArc(Mutable, 0, x, y, pieRadius, 4.71238898, v4, 0);
    CGPathCloseSubpath(Mutable);
    -[CAShapeLayer setPath:](self->_sliceLayer, "setPath:", Mutable);
    CFRelease(Mutable);
  }
}

- (void)recalculateIncreaseProgress:(double)a3 withTimeDiff:(double)a4
{
  double v5;
  double v6;
  double v7;

  v5 = a3 / a4;
  -[CADisplayLink duration](self->_displayLink, "duration");
  v7 = v5 * v6;
  if (v7 < 0.000166666667)
    v7 = 0.000166666667;
  self->_increaseRate = v7;
}

- (void)setProgress:(double)a3
{
  double realProgress;
  double v7;
  double prevUpdateTimeInterval;
  double v9;
  double v10;
  double v11;

  self->_progress = a3;
  if (!self->_displayLink && self->_realProgress <= 1.0)
    -[MFRoundProgressView _startDisplayLink](self, "_startDisplayLink");
  if (a3 > 0.0)
  {
    realProgress = self->_realProgress;
    if (realProgress < 1.0 && realProgress < a3)
    {
      if (a3 >= 1.0)
      {
        v10 = 1.0 - self->_uiProgress;
        v11 = 0.1;
      }
      else
      {
        v7 = CACurrentMediaTime();
        prevUpdateTimeInterval = self->_prevUpdateTimeInterval;
        self->_prevUpdateTimeInterval = v7;
        v9 = v7 - prevUpdateTimeInterval;
        v10 = 1.0 - self->_uiProgress;
        v11 = v9 * (v10 / (a3 - self->_realProgress));
      }
      -[MFRoundProgressView recalculateIncreaseProgress:withTimeDiff:](self, "recalculateIncreaseProgress:withTimeDiff:", v10, v11);
      self->_realProgress = a3;
    }
  }
}

- (void)resetProgress
{
  self->_uiProgress = 0.0;
  self->_increaseRate = 0.00166666667;
  self->_realProgress = 0.0;
  self->_prevUpdateTimeInterval = CACurrentMediaTime();
  -[MFRoundProgressView _stopDisplayLink](self, "_stopDisplayLink");
  -[MFRoundProgressView _updateUIProgress](self, "_updateUIProgress");
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_sliceLayer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
