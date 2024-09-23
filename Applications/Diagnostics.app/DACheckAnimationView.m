@implementation DACheckAnimationView

- (DACheckAnimationView)initWithFrame:(CGRect)a3 color:(id)a4 scale:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  DACheckAnimationView *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CGAffineTransform v30;
  objc_super v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v31.receiver = self;
  v31.super_class = (Class)DACheckAnimationView;
  v12 = -[DACheckAnimationView initWithFrame:](&v31, "initWithFrame:", x, y, width, height);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
    objc_msgSend(v13, "moveToPoint:", 0.0, 10.0);
    objc_msgSend(v13, "addLineToPoint:", 10.0, 18.0);
    objc_msgSend(v13, "addLineToPoint:", 24.0, 0.0);
    CGAffineTransformMakeScale(&v30, a5, a5);
    objc_msgSend(v13, "applyTransform:", &v30);
    -[DACheckAnimationView setStrokeColor:](v12, "setStrokeColor:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView layer](v12, "layer"));
    -[DACheckAnimationView setCheck:](v12, "setCheck:", v14);

    v15 = objc_retainAutorelease(v13);
    v16 = objc_msgSend(v15, "CGPath");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    objc_msgSend(v17, "setPath:", v16);

    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView strokeColor](v12, "strokeColor")));
    v19 = objc_msgSend(v18, "CGColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    objc_msgSend(v20, "setStrokeColor:", v19);

    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    v22 = objc_msgSend(v21, "CGColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    objc_msgSend(v23, "setFillColor:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    objc_msgSend(v24, "setLineWidth:", 5.0);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    objc_msgSend(v25, "setStrokeStart:", 0.0);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    objc_msgSend(v26, "setStrokeEnd:", 0.0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    objc_msgSend(v27, "setLineCap:", kCALineCapRound);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v12, "check"));
    objc_msgSend(v28, "setLineJoin:", kCALineJoinRound);

  }
  return v12;
}

- (DACheckAnimationView)initWithColor:(id)a3 lineWidth:(double)a4 scale:(double)a5
{
  DACheckAnimationView *v6;
  DACheckAnimationView *v7;
  void *v8;

  v6 = -[DACheckAnimationView initWithFrame:color:scale:](self, "initWithFrame:color:scale:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height, a5);
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](v6, "check"));
    objc_msgSend(v8, "setLineWidth:", a4);

  }
  return v7;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAShapeLayer);
}

- (void)hideCheck
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  objc_msgSend(v2, "setStrokeEnd:", 0.0);

}

- (void)showCheck
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  objc_msgSend(v2, "setStrokeEnd:", 1.0);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v3;
  void *v4;
  id v5;

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView strokeColor](self, "strokeColor")));
  v3 = objc_msgSend(v5, "CGColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  objc_msgSend(v4, "setStrokeColor:", v3);

}

- (void)layoutSubviews
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  v4 = objc_msgSend(v3, "strokeColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView strokeColor](self, "strokeColor")));
  v6 = objc_msgSend(v5, "CGColor");

  if (v4 != v6)
  {
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView strokeColor](self, "strokeColor")));
    v8 = objc_msgSend(v7, "CGColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
    objc_msgSend(v9, "setStrokeColor:", v8);

  }
  v10.receiver = self;
  v10.super_class = (Class)DACheckAnimationView;
  -[DACheckAnimationView layoutSubviews](&v10, "layoutSubviews");
}

- (void)playCheckAnimationWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  -[DACheckAnimationView setAnimationCompletion:](self, "setAnimationCompletion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  objc_msgSend(v4, "setStrokeEnd:", 1.0);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("strokeEnd")));
  objc_msgSend(v8, "setDuration:", 0.375);
  objc_msgSend(v8, "setFillMode:", kCAFillModeBoth);
  objc_msgSend(v8, "setBeginTime:", CACurrentMediaTime() + 0.150000006);
  objc_msgSend(v8, "setFromValue:", &off_10013FB10);
  objc_msgSend(v8, "setToValue:", &off_10013FB20);
  objc_msgSend(v8, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(v8, "setTimingFunction:", v5);

  LODWORD(v6) = 1.0;
  objc_msgSend(v8, "setRepeatCount:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView check](self, "check"));
  objc_msgSend(v7, "addAnimation:forKey:", v8, CFSTR("strokeEndAnimation"));

}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(id, _BOOL8);

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACheckAnimationView animationCompletion](self, "animationCompletion", a3));

  if (v6)
  {
    v7 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue(-[DACheckAnimationView animationCompletion](self, "animationCompletion"));
    v7[2](v7, v4);

  }
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
}

- (CAShapeLayer)check
{
  return self->_check;
}

- (void)setCheck:(id)a3
{
  objc_storeStrong((id *)&self->_check, a3);
}

- (id)animationCompletion
{
  return self->_animationCompletion;
}

- (void)setAnimationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationCompletion, 0);
  objc_storeStrong((id *)&self->_check, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
}

@end
