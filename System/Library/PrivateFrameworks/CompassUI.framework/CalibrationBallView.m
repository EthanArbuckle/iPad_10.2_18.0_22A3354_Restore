@implementation CalibrationBallView

- (CalibrationBallView)initWithFrame:(CGRect)a3 ballRadius:(double)a4
{
  CalibrationBallView *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CalibrationBallView;
  result = -[CalibrationBallView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_currentAngle = 0.0;
    result->_ballRadius = a4;
  }
  return result;
}

- (id)ballView
{
  UIView *ballView;
  UIView *v4;
  UIView *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;

  ballView = self->_ballView;
  if (!ballView)
  {
    if (self->_ballRadius <= 0.0)
    {
      ballView = 0;
    }
    else
    {
      v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, self->_ballRadius, self->_ballRadius);
      v5 = self->_ballView;
      self->_ballView = v4;

      objc_msgSend(MEMORY[0x24BDF6950], "redColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = objc_msgSend(v6, "CGColor");
      -[UIView layer](self->_ballView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v7);

      -[UIView layer](self->_ballView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMasksToBounds:", 1);

      v10 = self->_ballRadius * 0.5;
      -[UIView layer](self->_ballView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCornerRadius:", v10);

      -[CalibrationBallView addSubview:](self, "addSubview:", self->_ballView);
      ballView = self->_ballView;
    }
  }
  return ballView;
}

- (void)setBallRadius:(double)a3
{
  self->_ballRadius = a3;
  -[CalibrationBallView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTrackRadius:(double)a3
{
  self->_trackRadius = a3;
  -[CalibrationBallView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  double MidX;
  double MidY;
  void *v5;
  double trackRadius;
  __double2 v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)CalibrationBallView;
  -[CalibrationBallView layoutSubviews](&v8, sel_layoutSubviews);
  -[CalibrationBallView bounds](self, "bounds");
  MidX = CGRectGetMidX(v9);
  -[CalibrationBallView bounds](self, "bounds");
  MidY = CGRectGetMidY(v10);
  -[CalibrationBallView ballView](self, "ballView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  trackRadius = self->_trackRadius;
  v7 = __sincos_stret(self->_currentAngle);
  objc_msgSend(v5, "setCenter:", MidX + trackRadius * v7.__cosval, MidY + trackRadius * v7.__sinval);

}

- (void)setAngle:(double)a3
{
  self->_currentAngle = a3;
  -[CalibrationBallView setNeedsLayout](self, "setNeedsLayout");
}

- (double)ballRadius
{
  return self->_ballRadius;
}

- (double)trackRadius
{
  return self->_trackRadius;
}

- (double)currentAngle
{
  return self->_currentAngle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ballView, 0);
}

@end
