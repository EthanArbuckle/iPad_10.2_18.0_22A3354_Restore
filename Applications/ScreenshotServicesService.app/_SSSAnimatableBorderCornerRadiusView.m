@implementation _SSSAnimatableBorderCornerRadiusView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_SSSAnimatableBorderCornerRadiusView;
  if (-[_SSSAnimatableBorderCornerRadiusView _shouldAnimatePropertyWithKey:](&v7, "_shouldAnimatePropertyWithKey:", v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("cornerRadius"));

  return v5;
}

- (void)setCornerRadius:(double)a3
{
  -[_SSSAnimatableBorderCornerRadiusView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", a3);
}

- (double)cornerRadius
{
  double result;

  -[_SSSAnimatableBorderCornerRadiusView _continuousCornerRadius](self, "_continuousCornerRadius");
  return result;
}

- (void)setBorderWidth:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[_SSSAnimatableBorderCornerRadiusView layer](self, "layer"));
  objc_msgSend(v4, "setBorderWidth:", a3);

}

- (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSAnimatableBorderCornerRadiusView layer](self, "layer"));
  objc_msgSend(v2, "borderWidth");
  v4 = v3;

  return v4;
}

- (void)setBorderColor:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[_SSSAnimatableBorderCornerRadiusView layer](self, "layer"));
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setBorderColor:", v6);
}

- (UIColor)borderColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSAnimatableBorderCornerRadiusView layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v2, "borderColor")));

  return (UIColor *)v3;
}

@end
