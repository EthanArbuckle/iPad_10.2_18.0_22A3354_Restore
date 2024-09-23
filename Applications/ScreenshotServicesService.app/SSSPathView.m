@implementation SSSPathView

+ (Class)layerClass
{
  return (Class)objc_opt_class(CAShapeLayer, a2);
}

- (void)setPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SSSPathView _shapeLayer](self, "_shapeLayer"));
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGPath");

  objc_msgSend(v7, "setPath:", v6);
}

- (UIBezierPath)path
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSPathView _shapeLayer](self, "_shapeLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", objc_msgSend(v2, "path")));

  return (UIBezierPath *)v3;
}

- (void)setFillColor:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[SSSPathView _shapeLayer](self, "_shapeLayer"));
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setFillColor:", v6);
}

- (UIColor)fillColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SSSPathView _shapeLayer](self, "_shapeLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v2, "fillColor")));

  return (UIColor *)v3;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SSSPathView;
  if (-[SSSPathView _shouldAnimatePropertyWithKey:](&v7, "_shouldAnimatePropertyWithKey:", v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("path"));

  return v5;
}

@end
