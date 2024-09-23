@implementation _PKPathView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[_PKPathView _shapeLayer](self, "_shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGPath");

  objc_msgSend(v7, "setPath:", v6);
}

- (UIBezierPath)path
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3508];
  -[_PKPathView _shapeLayer](self, "_shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bezierPathWithCGPath:", objc_msgSend(v3, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIBezierPath *)v4;
}

- (void)setFillColor:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  -[_PKPathView _shapeLayer](self, "_shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGColor");

  objc_msgSend(v7, "setFillColor:", v6);
}

- (UIColor)fillColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  -[_PKPathView _shapeLayer](self, "_shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "fillColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v4;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_PKPathView;
  if (-[_PKPathView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("path"));

  return v5;
}

@end
