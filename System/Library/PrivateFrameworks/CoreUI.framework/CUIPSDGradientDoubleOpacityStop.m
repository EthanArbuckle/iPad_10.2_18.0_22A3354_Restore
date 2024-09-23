@implementation CUIPSDGradientDoubleOpacityStop

+ (void)initialize
{
  if ((id)objc_opt_class(CUIPSDGradientDoubleOpacityStop, a2) == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

+ (id)doubleOpacityStopWithLocation:(double)a3 leadInOpacity:(double)a4 leadOutOpacity:(double)a5
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1, a2)), "initWithLocation:leadInOpacity:leadOutOpacity:", a3, a4, a5);
}

- (CUIPSDGradientDoubleOpacityStop)initWithLocation:(double)a3 leadInOpacity:(double)a4 leadOutOpacity:(double)a5
{
  CUIPSDGradientDoubleOpacityStop *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIPSDGradientDoubleOpacityStop;
  result = -[CUIPSDGradientOpacityStop initWithLocation:opacity:](&v7, sel_initWithLocation_opacity_, a3, a4);
  if (result)
    result->leadOutOpacity = a5;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUIPSDGradientDoubleOpacityStop;
  result = -[CUIPSDGradientOpacityStop copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
    *((_QWORD *)result + 3) = *(_QWORD *)&self->leadOutOpacity;
  return result;
}

- (CUIPSDGradientDoubleOpacityStop)initWithCoder:(id)a3
{
  CUIPSDGradientDoubleOpacityStop *v4;
  double v5;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CUIPSDGradientDoubleOpacityStop;
  v4 = -[CUIPSDGradientOpacityStop initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    if (objc_msgSend(a3, "allowsKeyedCoding"))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientDoubleOpacityStopOpacity"));
    }
    else
    {
      v7 = 0.0;
      objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "d", &v7, 8);
      v5 = v7;
    }
    v4->leadOutOpacity = v5;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  double leadOutOpacity;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIPSDGradientDoubleOpacityStop;
  -[CUIPSDGradientOpacityStop encodeWithCoder:](&v7, sel_encodeWithCoder_);
  leadOutOpacity = self->leadOutOpacity;
  v6 = leadOutOpacity;
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientDoubleOpacityStop version](CUIPSDGradientDoubleOpacityStop, "version"), CFSTR("CUIPSDGradientDoubleOpacityStopVersion"));
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientDoubleOpacityStopOpacity"), leadOutOpacity);
  }
  else
  {
    objc_msgSend(a3, "encodeValueOfObjCType:at:", "d", &v6);
  }
}

- (double)leadOutOpacity
{
  return self->leadOutOpacity;
}

- (BOOL)isDoubleStop
{
  return 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradientDoubleOpacityStop;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ lead-out opacity: %f"), -[CUIPSDGradientOpacityStop description](&v3, sel_description), *(_QWORD *)&self->leadOutOpacity);
}

@end
