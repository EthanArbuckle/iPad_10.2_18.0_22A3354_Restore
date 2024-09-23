@implementation ForceTouchRingView

- (ForceTouchRingView)initWithFrame:(CGRect)a3 ringCenter:(CGPoint)a4 startingCircleRadius:(float)a5 startingCircleRatio:(float)a6 endingCircleRatio:(float)a7 ringStartingColor:(id)a8 ringSuccessColor:(id)a9 ringFailedColor:(id)a10
{
  CGFloat y;
  CGFloat x;
  double height;
  double width;
  double v19;
  double v20;
  id v22;
  id v23;
  id v24;
  ForceTouchRingView *v25;
  void *v26;
  float v27;
  float v28;
  void *v29;
  uint64_t v30;
  CAShapeLayer *circle;
  id v32;
  id v33;
  objc_super v35;

  y = a4.y;
  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v19 = a3.origin.y;
  v20 = a3.origin.x;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v35.receiver = self;
  v35.super_class = (Class)ForceTouchRingView;
  v25 = -[ForceTouchRingView initWithFrame:](&v35, "initWithFrame:", v20, v19, width, height);
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[ForceTouchRingView setBackgroundColor:](v25, "setBackgroundColor:", v26);

    v25->_ringCenter.x = x;
    v25->_ringCenter.y = y;
    v25->_startingCircleRadius = a5;
    objc_storeStrong((id *)&v25->_ringStartingColor, a8);
    objc_storeStrong((id *)&v25->_ringSuccessColor, a9);
    objc_storeStrong((id *)&v25->_ringFailedColor, a10);
    if (a6 >= a7)
      v27 = a7;
    else
      v27 = a6;
    v25->_minimumCircleRatio = v27;
    if (a6 >= a7)
      v28 = a6;
    else
      v28 = a7;
    v25->_maximumCircleRatio = v28;
    v25->_ringShouldGrow = a6 <= a7;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v25->_ringCenter.x, v25->_ringCenter.y, (float)(v25->_startingCircleRadius * v25->_minimumCircleRatio), 0.0, 6.28318531));
    -[ForceTouchRingView setCirclePath:](v25, "setCirclePath:", v29);

    v30 = objc_claimAutoreleasedReturnValue(-[ForceTouchRingView layer](v25, "layer"));
    circle = v25->_circle;
    v25->_circle = (CAShapeLayer *)v30;

    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circlePath](v25, "circlePath")));
    -[CAShapeLayer setPath:](v25->_circle, "setPath:", objc_msgSend(v32, "CGPath"));

    v33 = objc_retainAutorelease(v22);
    -[CAShapeLayer setStrokeColor:](v25->_circle, "setStrokeColor:", objc_msgSend(v33, "CGColor"));
    -[CAShapeLayer setFillColor:](v25->_circle, "setFillColor:", objc_msgSend(objc_retainAutorelease(v33), "CGColor"));
  }

  return v25;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAShapeLayer, a2);
}

- (void)playCircleAnimationWithCompletion:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[ForceTouchRingView setAnimationCompletion:](self, "setAnimationCompletion:", a3);
  -[ForceTouchRingView ringCenter](self, "ringCenter");
  v5 = v4;
  v7 = v6;
  -[ForceTouchRingView startingCircleRadius](self, "startingCircleRadius");
  v9 = v8;
  -[ForceTouchRingView minimumCircleRatio](self, "minimumCircleRatio");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v5, v7, (float)(v9 * v10), 0.0, 6.28318531));
  -[ForceTouchRingView setCirclePath:](self, "setCirclePath:", v11);

  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circlePath](self, "circlePath")));
  v13 = objc_msgSend(v12, "CGPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circle](self, "circle"));
  objc_msgSend(v14, "setPath:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("path")));
  -[ForceTouchRingView setCirclePathAnimation:](self, "setCirclePathAnimation:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circlePathAnimation](self, "circlePathAnimation"));
  objc_msgSend(v16, "setDuration:", 0.5);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circlePathAnimation](self, "circlePathAnimation"));
  objc_msgSend(v17, "setDelegate:", self);

  v19 = (id)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circle](self, "circle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circlePathAnimation](self, "circlePathAnimation"));
  objc_msgSend(v19, "addAnimation:forKey:", v18, 0);

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  void (**v6)(void);

  if (a4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView animationCompletion](self, "animationCompletion", a3));

    if (v5)
    {
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[ForceTouchRingView animationCompletion](self, "animationCompletion"));
      v6[2]();

    }
  }
}

- (id)colorInterpolationFromColor:(id)a3 toColor:(id)a4 atRatio:(double)a5
{
  id v7;
  id v8;
  const CGFloat *Components;
  id v10;
  CGColor *v11;
  const CGFloat *v12;

  v7 = objc_retainAutorelease(a3);
  v8 = a4;
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v7, "CGColor"));
  v10 = objc_retainAutorelease(v8);
  v11 = (CGColor *)objc_msgSend(v10, "CGColor");

  v12 = CGColorGetComponents(v11);
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", *v12 * a5 + (1.0 - a5) * *Components, v12[1] * a5 + (1.0 - a5) * Components[1], v12[2] * a5 + (1.0 - a5) * Components[2], 1.0);
}

- (void)updateCircleWithPressureRatio:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  float v33;
  double v34;
  double v35;
  float v36;
  double v37;
  double v38;
  double v39;
  float v40;
  double v41;
  void *v42;
  id v43;
  void *v44;
  id v45;

  if (-[ForceTouchRingView timedOut](self, "timedOut"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView ringStartingColor](self, "ringStartingColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView ringFailedColor](self, "ringFailedColor"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView colorInterpolationFromColor:toColor:atRatio:](self, "colorInterpolationFromColor:toColor:atRatio:", v5, v6, 1.0)));
    v8 = objc_msgSend(v7, "CGColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circle](self, "circle"));
    objc_msgSend(v9, "setStrokeColor:", v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView ringStartingColor](self, "ringStartingColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView ringFailedColor](self, "ringFailedColor"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView colorInterpolationFromColor:toColor:atRatio:](self, "colorInterpolationFromColor:toColor:atRatio:", v10, v11, 1.0)));
    v13 = objc_msgSend(v12, "CGColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circle](self, "circle"));
    objc_msgSend(v14, "setFillColor:", v13);

  }
  else
  {
    v15 = fmin(fmax(a3, 0.0), 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView ringStartingColor](self, "ringStartingColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView ringSuccessColor](self, "ringSuccessColor"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView colorInterpolationFromColor:toColor:atRatio:](self, "colorInterpolationFromColor:toColor:atRatio:", v16, v17, v15)));
    v19 = objc_msgSend(v18, "CGColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circle](self, "circle"));
    objc_msgSend(v20, "setStrokeColor:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView ringStartingColor](self, "ringStartingColor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView ringSuccessColor](self, "ringSuccessColor"));
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView colorInterpolationFromColor:toColor:atRatio:](self, "colorInterpolationFromColor:toColor:atRatio:", v21, v22, v15)));
    v24 = objc_msgSend(v23, "CGColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circle](self, "circle"));
    objc_msgSend(v25, "setFillColor:", v24);

    -[ForceTouchRingView maximumCircleRatio](self, "maximumCircleRatio");
    v27 = v26;
    if (v15 < v27)
      v27 = v15;
    -[ForceTouchRingView setPressureRatio:](self, "setPressureRatio:", v27);
  }
  -[ForceTouchRingView ringCenter](self, "ringCenter");
  v29 = v28;
  v31 = v30;
  -[ForceTouchRingView startingCircleRadius](self, "startingCircleRadius");
  v33 = v32;
  if (-[ForceTouchRingView ringShouldGrow](self, "ringShouldGrow"))
  {
    -[ForceTouchRingView pressureRatio](self, "pressureRatio");
    v35 = v34;
  }
  else
  {
    -[ForceTouchRingView maximumCircleRatio](self, "maximumCircleRatio");
    v37 = v36;
    -[ForceTouchRingView pressureRatio](self, "pressureRatio");
    v35 = v37 - v38;
  }
  v39 = v33;
  -[ForceTouchRingView minimumCircleRatio](self, "minimumCircleRatio");
  v41 = v40;
  if (v35 >= v41)
    v41 = v35;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v29, v31, v41 * v39, 0.0, 6.28318531));
  -[ForceTouchRingView setCirclePath:](self, "setCirclePath:", v42);

  v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circlePath](self, "circlePath")));
  v43 = objc_msgSend(v45, "CGPath");
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ForceTouchRingView circle](self, "circle"));
  objc_msgSend(v44, "setPath:", v43);

}

- (CGPoint)ringCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_ringCenter.x;
  y = self->_ringCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRingCenter:(CGPoint)a3
{
  self->_ringCenter = a3;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (UIColor)ringStartingColor
{
  return self->_ringStartingColor;
}

- (void)setRingStartingColor:(id)a3
{
  objc_storeStrong((id *)&self->_ringStartingColor, a3);
}

- (UIColor)ringSuccessColor
{
  return self->_ringSuccessColor;
}

- (void)setRingSuccessColor:(id)a3
{
  objc_storeStrong((id *)&self->_ringSuccessColor, a3);
}

- (UIColor)ringFailedColor
{
  return self->_ringFailedColor;
}

- (void)setRingFailedColor:(id)a3
{
  objc_storeStrong((id *)&self->_ringFailedColor, a3);
}

- (CAShapeLayer)circle
{
  return self->_circle;
}

- (void)setCircle:(id)a3
{
  objc_storeStrong((id *)&self->_circle, a3);
}

- (CABasicAnimation)circlePathAnimation
{
  return self->_circlePathAnimation;
}

- (void)setCirclePathAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_circlePathAnimation, a3);
}

- (UIBezierPath)circlePath
{
  return self->_circlePath;
}

- (void)setCirclePath:(id)a3
{
  objc_storeStrong((id *)&self->_circlePath, a3);
}

- (id)animationCompletion
{
  return self->_animationCompletion;
}

- (void)setAnimationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (double)pressureRatio
{
  return self->_pressureRatio;
}

- (void)setPressureRatio:(double)a3
{
  self->_pressureRatio = a3;
}

- (float)startingCircleRadius
{
  return self->_startingCircleRadius;
}

- (void)setStartingCircleRadius:(float)a3
{
  self->_startingCircleRadius = a3;
}

- (float)minimumCircleRatio
{
  return self->_minimumCircleRatio;
}

- (void)setMinimumCircleRatio:(float)a3
{
  self->_minimumCircleRatio = a3;
}

- (float)maximumCircleRatio
{
  return self->_maximumCircleRatio;
}

- (void)setMaximumCircleRatio:(float)a3
{
  self->_maximumCircleRatio = a3;
}

- (BOOL)ringShouldGrow
{
  return self->_ringShouldGrow;
}

- (void)setRingShouldGrow:(BOOL)a3
{
  self->_ringShouldGrow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong((id *)&self->_circlePath, 0);
  objc_storeStrong((id *)&self->_circlePathAnimation, 0);
  objc_storeStrong((id *)&self->_circle, 0);
  objc_storeStrong((id *)&self->_ringFailedColor, 0);
  objc_storeStrong((id *)&self->_ringSuccessColor, 0);
  objc_storeStrong((id *)&self->_ringStartingColor, 0);
}

@end
