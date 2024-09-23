@implementation CUIPSDGradientDoubleColorStop

+ (void)initialize
{
  if ((id)objc_opt_class(CUIPSDGradientDoubleColorStop, a2) == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

+ (id)doubleColorStopWithLocation:(double)a3 leadInColor:(_psdGradientColor)a4 leadOutColor:(_psdGradientColor)a5
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1, a2)), "initWithLocation:leadInColor:leadOutColor:", a3, a4.red, a4.green, a4.blue, a4.alpha, *(_QWORD *)&a5.red, *(_QWORD *)&a5.green, *(_QWORD *)&a5.blue, *(_QWORD *)&a5.alpha);
}

- (CUIPSDGradientDoubleColorStop)initWithLocation:(double)a3 leadInColor:(_psdGradientColor)a4 leadOutColor:(_psdGradientColor)a5
{
  CUIPSDGradientDoubleColorStop *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientDoubleColorStop;
  result = -[CUIPSDGradientColorStop initWithLocation:gradientColor:](&v6, sel_initWithLocation_gradientColor_, a3, a4.red, a4.green, a4.blue, a4.alpha);
  if (result)
    result->leadOutColor = a5;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientDoubleColorStop;
  result = -[CUIPSDGradientColorStop copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (result)
  {
    v5 = *(_OWORD *)&self->leadOutColor.blue;
    *((_OWORD *)result + 3) = *(_OWORD *)&self->leadOutColor.red;
    *((_OWORD *)result + 4) = v5;
  }
  return result;
}

- (CUIPSDGradientDoubleColorStop)initWithCoder:(id)a3
{
  CUIPSDGradientDoubleColorStop *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CUIPSDGradientDoubleColorStop;
  v4 = -[CUIPSDGradientColorStop initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    if (objc_msgSend(a3, "allowsKeyedCoding"))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientDoubleColorStopRed"));
      v4->leadOutColor.red = v5;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientDoubleColorStopGreen"));
      v4->leadOutColor.green = v6;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientDoubleColorStopBlue"));
      v4->leadOutColor.blue = v7;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientDoubleColorStopAlpha"));
      v4->leadOutColor.alpha = v8;
    }
    else
    {
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "dddd", &v4->leadOutColor, &v4->leadOutColor.green, &v4->leadOutColor.blue, &v4->leadOutColor.alpha);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _psdGradientColor *p_leadOutColor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientDoubleColorStop;
  -[CUIPSDGradientColorStop encodeWithCoder:](&v6, sel_encodeWithCoder_);
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientDoubleColorStop version](CUIPSDGradientDoubleColorStop, "version"), CFSTR("CUIPSDGradientDoubleColorStopVersion"));
    p_leadOutColor = &self->leadOutColor;
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientDoubleColorStopRed"), p_leadOutColor->red);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientDoubleColorStopGreen"), p_leadOutColor->green);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientDoubleColorStopBlue"), p_leadOutColor->blue);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientDoubleColorStopAlpha"), p_leadOutColor->alpha);
  }
  else
  {
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "dddd", &self->leadOutColor, &self->leadOutColor.green, &self->leadOutColor.blue, &self->leadOutColor.alpha);
  }
}

- (_psdGradientColor)leadOutColor
{
  double red;
  double green;
  double blue;
  double alpha;
  _psdGradientColor result;

  red = self->leadOutColor.red;
  green = self->leadOutColor.green;
  blue = self->leadOutColor.blue;
  alpha = self->leadOutColor.alpha;
  result.alpha = alpha;
  result.blue = blue;
  result.green = green;
  result.red = red;
  return result;
}

- (BOOL)isDoubleStop
{
  return 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradientDoubleColorStop;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ lead-out color: (%f, %f, %f, %f) - (%d, %d, %d)"), -[CUIPSDGradientColorStop description](&v3, sel_description), *(_QWORD *)&self->leadOutColor.red, *(_QWORD *)&self->leadOutColor.green, *(_QWORD *)&self->leadOutColor.blue, *(_QWORD *)&self->leadOutColor.alpha, (int)(self->leadOutColor.red * 255.0 + 0.5), (int)(self->leadOutColor.green * 255.0 + 0.5), (int)(self->leadOutColor.blue * 255.0 + 0.5));
}

@end
