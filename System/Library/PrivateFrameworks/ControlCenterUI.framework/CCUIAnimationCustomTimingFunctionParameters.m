@implementation CCUIAnimationCustomTimingFunctionParameters

+ (id)functionWithControlPoint1:(CGPoint)a3 controlPoint2:(CGPoint)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithControlPoint1:controlPoint2:", a3.x, a3.y, a4.x, a4.y);
}

- (id)_initWithControlPoint1:(CGPoint)a3 controlPoint2:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  id result;
  objc_super v9;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)CCUIAnimationCustomTimingFunctionParameters;
  result = -[CCUIAnimationCustomTimingFunctionParameters init](&v9, sel_init);
  if (result)
  {
    *((CGFloat *)result + 1) = v7;
    *((CGFloat *)result + 2) = v6;
    *((CGFloat *)result + 3) = x;
    *((CGFloat *)result + 4) = y;
  }
  return result;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIAnimationCustomTimingFunctionParameters controlPoint1](self, "controlPoint1");
  v4 = (id)objc_msgSend(v3, "appendPoint:withName:", CFSTR("Control Point 1"));
  -[CCUIAnimationCustomTimingFunctionParameters controlPoint2](self, "controlPoint2");
  v5 = (id)objc_msgSend(v3, "appendPoint:withName:", CFSTR("Control Point 2"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIAnimationCustomTimingFunctionParameters controlPoint1](self, "controlPoint1");
  v4 = (id)objc_msgSend(v3, "appendCGPoint:");
  -[CCUIAnimationCustomTimingFunctionParameters controlPoint2](self, "controlPoint2");
  v5 = (id)objc_msgSend(v3, "appendCGPoint:");
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  CCUIAnimationCustomTimingFunctionParameters *v4;
  CCUIAnimationCustomTimingFunctionParameters *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = (CCUIAnimationCustomTimingFunctionParameters *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      -[CCUIAnimationCustomTimingFunctionParameters controlPoint1](self, "controlPoint1");
      v7 = v6;
      v9 = v8;
      -[CCUIAnimationCustomTimingFunctionParameters controlPoint1](v5, "controlPoint1");
      v11 = 0;
      if (v7 == v12 && v9 == v10)
      {
        -[CCUIAnimationCustomTimingFunctionParameters controlPoint2](self, "controlPoint2");
        v14 = v13;
        v16 = v15;
        -[CCUIAnimationCustomTimingFunctionParameters controlPoint2](v5, "controlPoint2");
        v11 = v16 == v18 && v14 == v17;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (CGPoint)controlPoint1
{
  double x;
  double y;
  CGPoint result;

  x = self->_controlPoint1.x;
  y = self->_controlPoint1.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)controlPoint2
{
  double x;
  double y;
  CGPoint result;

  x = self->_controlPoint2.x;
  y = self->_controlPoint2.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
