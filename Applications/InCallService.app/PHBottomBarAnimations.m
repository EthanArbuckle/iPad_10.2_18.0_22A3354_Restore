@implementation PHBottomBarAnimations

+ (id)rollAnimation
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
  objc_msgSend(v2, "setMass:", 2.0);
  objc_msgSend(v2, "setStiffness:", 300.0);
  objc_msgSend(v2, "setDamping:", 50.0);
  objc_msgSend(v2, "setDuration:", 0.910000026);
  objc_msgSend(v2, "setEndAngle:", 2.35619449);
  return v2;
}

+ (id)crossFadeAnimationFromImage:(CGImage *)a3 toImage:(CGImage *)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("contents")));
  objc_msgSend(v6, "setDuration:", 0.300000012);
  objc_msgSend(v6, "setFromValue:", a3);
  objc_msgSend(v6, "setToValue:", a4);
  objc_msgSend(v6, "setRemovedOnCompletion:", 0);
  objc_msgSend(v6, "setFillMode:", kCAFillModeForwards);
  return v6;
}

+ (id)backgroundColorAnimationFromColor:(CGColor *)a3 toColor:(CGColor *)a4
{
  void *v6;
  void *v7;
  _QWORD v9[2];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("backgroundColor")));
  v9[0] = a3;
  v9[1] = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  objc_msgSend(v6, "setValues:", v7);

  objc_msgSend(v6, "setKeyTimes:", &off_100297188);
  objc_msgSend(v6, "setDuration:", 0.254999995);
  return v6;
}

@end
