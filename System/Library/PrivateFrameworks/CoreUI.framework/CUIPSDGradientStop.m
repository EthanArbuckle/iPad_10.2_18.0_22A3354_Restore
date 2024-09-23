@implementation CUIPSDGradientStop

+ (void)initialize
{
  if ((id)objc_opt_class(CUIPSDGradientStop, a2) == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (CUIPSDGradientStop)initWithLocation:(double)a3
{
  CUIPSDGradientStop *v5;
  CUIPSDGradientStop *v6;
  double v7;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CUIPSDGradientStop;
  v5 = -[CUIPSDGradientStop init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = 0.0;
    if (fabs(a3) >= 0.00001)
    {
      v7 = a3;
      if (fabs(a3 + -1.0) < 0.00001)
        v7 = 1.0;
    }
    v5->location = v7;
    if (v7 < 0.0 || v7 > 1.0)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("CUIPSDGradientEvaluator.m"), 46, CFSTR("Location for CUIPSDGradientStop must be in the closed unit interval."));
  }
  return v6;
}

- (CUIPSDGradientStop)initWithCoder:(id)a3
{
  CUIPSDGradientStop *v4;
  double v5;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIPSDGradientStop;
  v4 = -[CUIPSDGradientStop init](&v8, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "allowsKeyedCoding"))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientStopLocation"));
    }
    else
    {
      v7 = 0.0;
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "d", &v7, 8);
      v5 = v7;
    }
    v4->location = v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double location;
  double v5;

  location = self->location;
  v5 = location;
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientStop version](CUIPSDGradientStop, "version"), CFSTR("CUIPSDGradientStopVersion"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientStopLocation"), location);
  }
  else
  {
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "d", &v5);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  if (result)
    *((_QWORD *)result + 1) = *(_QWORD *)&self->location;
  return result;
}

- (double)location
{
  return self->location;
}

- (void)setLocation:(double)a3
{
  self->location = a3;
}

- (BOOL)isDoubleStop
{
  return 0;
}

- (BOOL)isColorStop
{
  return 0;
}

- (BOOL)isOpacityStop
{
  return 0;
}

@end
