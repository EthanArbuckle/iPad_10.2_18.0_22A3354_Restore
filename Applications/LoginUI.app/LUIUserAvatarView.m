@implementation LUIUserAvatarView

+ (LUIUserAvatarView)avatarViewWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[LUIUserAvatarView avatarViewWithFrame:style:](LUIUserAvatarView, "avatarViewWithFrame:style:", objc_msgSend(v7, "isCJKLocale"), x, y, width, height));

  return (LUIUserAvatarView *)v8;
}

+ (LUIUserAvatarView)avatarViewWithFrame:(CGRect)a3 style:(unint64_t)a4
{
  __objc2_class **v4;

  if (!a4)
  {
    v4 = &off_100068348;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v4 = off_100068340;
LABEL_5:
    a1 = objc_msgSend(objc_alloc(*v4), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  return (LUIUserAvatarView *)a1;
}

- (LUIUserAvatarView)initWithFrame:(CGRect)a3
{
  LUIUserAvatarView *v3;
  LUIUserAvatarView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIUserAvatarView;
  v3 = -[LUIUserAvatarView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LUIUserAvatarView commonInit](v3, "commonInit");
  return v4;
}

- (LUIUserAvatarView)initWithCoder:(id)a3
{
  LUIUserAvatarView *v3;
  LUIUserAvatarView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUIUserAvatarView;
  v3 = -[LUIUserAvatarView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[LUIUserAvatarView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  id v3;

  self->_imageViewAlpha = 1.0;
  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[LUIUserAvatarView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)layoutSubviews
{
  double Width;
  double Height;
  id v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)LUIUserAvatarView;
  -[LUIUserAvatarView layoutSubviews](&v6, "layoutSubviews");
  if (self->_circleLayer)
  {
    -[LUIUserAvatarView bounds](self, "bounds");
    -[CAShapeLayer setFrame:](self->_circleLayer, "setFrame:");
    -[LUIUserAvatarView bounds](self, "bounds");
    Width = CGRectGetWidth(v7);
    -[LUIUserAvatarView bounds](self, "bounds");
    Height = CGRectGetHeight(v8);
    if (Width < Height)
      Height = Width;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](UIBezierPath, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, Height * 0.5, Height * 0.5, Height * 0.5, -1.57079633, 4.71238898)));
    -[CAShapeLayer setPath:](self->_circleLayer, "setPath:", objc_msgSend(v5, "CGPath"));

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double monogramDiameter;
  double v4;
  CGSize result;

  monogramDiameter = self->_monogramDiameter;
  v4 = monogramDiameter;
  result.height = v4;
  result.width = monogramDiameter;
  return result;
}

- (CAShapeLayer)circleLayer
{
  CAShapeLayer *circleLayer;
  CAShapeLayer *v4;
  CAShapeLayer *v5;
  id v6;
  id v7;
  void *v8;

  circleLayer = self->_circleLayer;
  if (!circleLayer)
  {
    v4 = objc_opt_new(CAShapeLayer);
    v5 = self->_circleLayer;
    self->_circleLayer = v4;

    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    -[CAShapeLayer setFillColor:](self->_circleLayer, "setFillColor:", objc_msgSend(v6, "CGColor"));

    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
    -[CAShapeLayer setStrokeColor:](self->_circleLayer, "setStrokeColor:", objc_msgSend(v7, "CGColor"));

    -[CAShapeLayer setLineWidth:](self->_circleLayer, "setLineWidth:", 4.0);
    -[CAShapeLayer setLineCap:](self->_circleLayer, "setLineCap:", kCALineCapRound);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView layer](self, "layer"));
    objc_msgSend(v8, "addSublayer:", self->_circleLayer);

    circleLayer = self->_circleLayer;
  }
  return circleLayer;
}

- (void)setContacts:(id)a3
{
  NSArray *v4;
  NSArray *contacts;
  id v6;

  v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_contacts, "isEqualToArray:"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    contacts = self->_contacts;
    self->_contacts = v4;

  }
  -[LUIUserAvatarView updateMonogram](self, "updateMonogram");

}

- (double)monogramDiameter
{
  double result;
  double Width;
  CGRect v5;
  CGRect v6;

  result = self->_monogramDiameter;
  if (result == 0.0)
  {
    -[LUIUserAvatarView bounds](self, "bounds");
    Width = CGRectGetWidth(v5);
    -[LUIUserAvatarView bounds](self, "bounds");
    result = CGRectGetHeight(v6);
    if (Width < result)
      return Width;
  }
  return result;
}

- (void)setMonogramDiameter:(double)a3
{
  if (self->_monogramDiameter != a3)
  {
    self->_monogramDiameter = a3;
    -[LUIUserAvatarView updateMonogram](self, "updateMonogram");
  }
}

- (void)setImageViewAlpha:(double)a3
{
  if (self->_imageViewAlpha != a3)
    self->_imageViewAlpha = a3;
}

- (void)setSyncTaskState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t syncTaskState;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  syncTaskState = self->_syncTaskState;
  if (+[LKPlatformSupport isInternalBuild](LKPlatformSupport, "isInternalBuild"))
    v8 = syncTaskState == a3;
  else
    v8 = 1;
  if (!v8)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView _colorForSyncTaskState:](self, "_colorForSyncTaskState:", syncTaskState));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView _colorForSyncTaskState:](self, "_colorForSyncTaskState:", a3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView circleLayer](self, "circleLayer"));
    objc_msgSend(v10, "removeAllAnimations");

    v11 = objc_retainAutorelease(v9);
    v12 = objc_msgSend(v11, "CGColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView circleLayer](self, "circleLayer"));
    objc_msgSend(v13, "setStrokeColor:", v12);

    if (v4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView circleLayer](self, "circleLayer"));
      -[LUIUserAvatarView _addColorChangeAnimationOnLayer:from:to:duration:](self, "_addColorChangeAnimationOnLayer:from:to:duration:", v14, v15, v11, 0.300000012);

    }
    if (a3 == 2)
      -[LUIUserAvatarView _startCircleAnimation](self, "_startCircleAnimation");
    self->_syncTaskState = a3;

  }
}

- (id)_colorForSyncTaskState:(unint64_t)a3
{
  switch(a3)
  {
    case 2uLL:
      self = (LUIUserAvatarView *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
      break;
    case 1uLL:
      self = (LUIUserAvatarView *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
      break;
    case 0uLL:
      self = (LUIUserAvatarView *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      break;
  }
  return self;
}

- (void)_startCircleAnimation
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView circleLayer](self, "circleLayer"));
  -[LUIUserAvatarView _addStrokeEndAnimationOnLayer:duration:](self, "_addStrokeEndAnimationOnLayer:duration:", v3, 2.6);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[LUIUserAvatarView circleLayer](self, "circleLayer"));
  -[LUIUserAvatarView _addRotationAnimationOnLayer:duration:](self, "_addRotationAnimationOnLayer:duration:", v4, 2.6);

}

- (void)_addRotationAnimationOnLayer:(id)a3 duration:(double)a4
{
  id v5;
  double v6;
  id v7;

  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform.rotation")));
  objc_msgSend(v7, "setValues:", &off_10006CCB0);
  objc_msgSend(v7, "setKeyTimes:", &off_10006CCC8);
  objc_msgSend(v7, "setDuration:", a4);
  objc_msgSend(v7, "setCalculationMode:", kCAAnimationLinear);
  LODWORD(v6) = 2139095040;
  objc_msgSend(v7, "setRepeatCount:", v6);
  objc_msgSend(v5, "addAnimation:forKey:", v7, CFSTR("transform.rotation"));

}

- (void)_addStrokeEndAnimationOnLayer:(id)a3 duration:(double)a4
{
  id v5;
  double v6;
  id v7;

  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("strokeEnd")));
  objc_msgSend(v7, "setValues:", &off_10006CCE0);
  objc_msgSend(v7, "setKeyTimes:", &off_10006CCF8);
  objc_msgSend(v7, "setDuration:", a4);
  objc_msgSend(v7, "setCalculationMode:", kCAAnimationLinear);
  LODWORD(v6) = 2139095040;
  objc_msgSend(v7, "setRepeatCount:", v6);
  objc_msgSend(v5, "addAnimation:forKey:", v7, CFSTR("strokeEnd"));

}

- (void)_addColorChangeAnimationOnLayer:(id)a3 from:(id)a4 to:(id)a5 duration:(double)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("strokeColor")));
  objc_msgSend(v12, "setFromValue:", v10);

  objc_msgSend(v12, "setToValue:", v9);
  objc_msgSend(v12, "setDuration:", a6);
  objc_msgSend(v12, "setRemovedOnCompletion:", 1);
  objc_msgSend(v11, "addAnimation:forKey:", v12, CFSTR("strokeColor"));

}

- (NSArray)contacts
{
  return self->_contacts;
}

- (double)imageViewAlpha
{
  return self->_imageViewAlpha;
}

- (void)setCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_circleLayer, a3);
}

- (unint64_t)syncTaskState
{
  return self->_syncTaskState;
}

- (void)setSyncTaskState:(unint64_t)a3
{
  self->_syncTaskState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

@end
