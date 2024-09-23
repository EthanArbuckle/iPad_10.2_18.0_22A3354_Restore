@implementation _PKAnimatableBorderCornerRadiusView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_PKAnimatableBorderCornerRadiusView;
  if (-[_PKAnimatableBorderCornerRadiusView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("cornerRadius"));
  }

  return v5;
}

- (void)setBorderWidth:(double)a3
{
  id v4;

  -[_PKAnimatableBorderCornerRadiusView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBorderWidth:", a3);

}

- (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  -[_PKAnimatableBorderCornerRadiusView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "borderWidth");
  v4 = v3;

  return v4;
}

- (void)setBorderColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[_PKAnimatableBorderCornerRadiusView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setBorderColor:", v6);
}

- (UIColor)borderColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  -[_PKAnimatableBorderCornerRadiusView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "borderColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

@end
