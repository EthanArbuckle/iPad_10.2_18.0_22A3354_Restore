@implementation _HKShapeView

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
  -[_HKShapeView shapeLayer](self, "shapeLayer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGPath");

  objc_msgSend(v7, "setPath:", v6);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("path")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_HKShapeView;
    v5 = -[_HKShapeView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (UIBezierPath)path
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[_HKShapeView shapeLayer](self, "shapeLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "path");

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BEBD420];
    -[_HKShapeView shapeLayer](self, "shapeLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bezierPathWithCGPath:", objc_msgSend(v6, "path"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (UIBezierPath *)v7;
}

@end
