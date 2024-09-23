@implementation CUIPSDGradientOpacityStop

+ (void)initialize
{
  if ((id)objc_opt_class(CUIPSDGradientOpacityStop, a2) == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

+ (id)opacityStopWithLocation:(double)a3 opacity:(double)a4
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1, a2)), "initWithLocation:opacity:", a3, a4);
}

- (CUIPSDGradientOpacityStop)initWithLocation:(double)a3 opacity:(double)a4
{
  CUIPSDGradientOpacityStop *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientOpacityStop;
  result = -[CUIPSDGradientStop initWithLocation:](&v6, sel_initWithLocation_, a3);
  if (result)
    result->opacity = a4;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIPSDGradientOpacityStop;
  result = -[CUIPSDGradientStop copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
    *((_QWORD *)result + 2) = *(_QWORD *)&self->opacity;
  return result;
}

- (CUIPSDGradientOpacityStop)initWithCoder:(id)a3
{
  CUIPSDGradientOpacityStop *v4;
  double v5;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIPSDGradientOpacityStop;
  v4 = -[CUIPSDGradientStop initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    if (objc_msgSend(a3, "allowsKeyedCoding"))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientOpacityStopOpacity"));
    }
    else
    {
      v7 = 0.0;
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "d", &v7, 8);
      v5 = v7;
    }
    v4->opacity = v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double opacity;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIPSDGradientOpacityStop;
  -[CUIPSDGradientStop encodeWithCoder:](&v7, sel_encodeWithCoder_);
  opacity = self->opacity;
  v6 = opacity;
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientOpacityStop version](CUIPSDGradientOpacityStop, "version"), CFSTR("CUIPSDGradientOpacityStopVersion"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientOpacityStopOpacity"), opacity);
  }
  else
  {
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "d", &v6);
  }
}

- (double)opacity
{
  return self->opacity;
}

- (BOOL)isOpacityStop
{
  return 1;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientOpacityStop;
  v3 = -[CUIPSDGradientOpacityStop description](&v6, sel_description);
  -[CUIPSDGradientStop location](self, "location");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - location: %f opacity: %f"), v3, v4, *(_QWORD *)&self->opacity);
}

@end
