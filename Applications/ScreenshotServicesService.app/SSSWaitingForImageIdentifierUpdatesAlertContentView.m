@implementation SSSWaitingForImageIdentifierUpdatesAlertContentView

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
  _SSSAnimatableBorderCornerRadiusView *outerRingView;
  void *v12;
  SSSPathView *innerPieView;
  id v14;

  -[SSSWaitingForImageIdentifierUpdatesAlertContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_SSSAnimatableBorderCornerRadiusView setFrame:](self->_outerRingView, "setFrame:", UIRectCenteredIntegralRect(0.0, 0.0, 40.0, 40.0, v3, v5, v7, v9));
  -[SSSPathView setFrame:](self->_innerPieView, "setFrame:", UIRectCenteredIntegralRect(0.0, 0.0, 36.0, 36.0, v4, v6, v8, v10));
  -[_SSSAnimatableBorderCornerRadiusView setBorderWidth:](self->_outerRingView, "setBorderWidth:", 4.0);
  -[_SSSAnimatableBorderCornerRadiusView setCornerRadius:](self->_outerRingView, "setCornerRadius:", 20.0);
  outerRingView = self->_outerRingView;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SSSWaitingForImageIdentifierUpdatesAlertContentView tintColor](self, "tintColor"));
  -[_SSSAnimatableBorderCornerRadiusView setBorderColor:](outerRingView, "setBorderColor:", v12);

  innerPieView = self->_innerPieView;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[SSSWaitingForImageIdentifierUpdatesAlertContentView tintColor](self, "tintColor"));
  -[SSSPathView setFillColor:](innerPieView, "setFillColor:", v14);

}

- (id)_shapeLayerPathForProgress:(double)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
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
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B508;
  v4[3] = &unk_100092358;
  *(double *)&v4[6] = progress;
  v4[7] = 0x3F847AE147AE147BLL;
  v4[4] = self;
  v4[5] = (uint64_t)fmax((a3 - progress) / 0.01, 1.0);
  +[UIView animateKeyframesWithDuration:delay:options:animations:completion:](UIView, "animateKeyframesWithDuration:delay:options:animations:completion:", 4, v4, 0);
}

- (SSSWaitingForImageIdentifierUpdatesAlertContentView)initWithFrame:(CGRect)a3
{
  SSSWaitingForImageIdentifierUpdatesAlertContentView *v3;
  _SSSAnimatableBorderCornerRadiusView *v4;
  _SSSAnimatableBorderCornerRadiusView *outerRingView;
  SSSPathView *v6;
  SSSPathView *innerPieView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSSWaitingForImageIdentifierUpdatesAlertContentView;
  v3 = -[SSSWaitingForImageIdentifierUpdatesAlertContentView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(_SSSAnimatableBorderCornerRadiusView);
  outerRingView = v3->_outerRingView;
  v3->_outerRingView = v4;

  -[SSSWaitingForImageIdentifierUpdatesAlertContentView addSubview:](v3, "addSubview:", v3->_outerRingView);
  v6 = objc_alloc_init(SSSPathView);
  innerPieView = v3->_innerPieView;
  v3->_innerPieView = v6;

  -[SSSWaitingForImageIdentifierUpdatesAlertContentView addSubview:](v3, "addSubview:", v3->_innerPieView);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.455, 1.0));
  -[SSSWaitingForImageIdentifierUpdatesAlertContentView setTintColor:](v3, "setTintColor:", v8);

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
