@implementation CUIPSDGradientColorStop

+ (void)initialize
{
  if ((id)objc_opt_class(CUIPSDGradientColorStop, a2) == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

+ (id)colorStopWithLocation:(double)a3 gradientColor:(_psdGradientColor)a4
{
  return objc_msgSend(objc_alloc((Class)objc_opt_class(a1, a2)), "initWithLocation:gradientColor:", a3, a4.red, a4.green, a4.blue, a4.alpha);
}

- (CUIPSDGradientColorStop)initWithLocation:(double)a3 gradientColor:(_psdGradientColor)a4
{
  double alpha;
  double blue;
  double green;
  double red;
  CUIPSDGradientColorStop *result;
  objc_super v9;

  alpha = a4.alpha;
  blue = a4.blue;
  green = a4.green;
  red = a4.red;
  v9.receiver = self;
  v9.super_class = (Class)CUIPSDGradientColorStop;
  result = -[CUIPSDGradientStop initWithLocation:](&v9, sel_initWithLocation_, a3);
  if (result)
  {
    result->gradientColor.red = red;
    result->gradientColor.green = green;
    result->gradientColor.blue = blue;
    result->gradientColor.alpha = alpha;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientColorStop;
  result = -[CUIPSDGradientStop copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (result)
  {
    v5 = *(_OWORD *)&self->gradientColor.blue;
    *((_OWORD *)result + 1) = *(_OWORD *)&self->gradientColor.red;
    *((_OWORD *)result + 2) = v5;
  }
  return result;
}

- (CUIPSDGradientColorStop)initWithCoder:(id)a3
{
  CUIPSDGradientColorStop *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CUIPSDGradientColorStop;
  v4 = -[CUIPSDGradientStop initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    if (objc_msgSend(a3, "allowsKeyedCoding"))
    {
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientColorStopRed"));
      v4->gradientColor.red = v5;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientColorStopGreen"));
      v4->gradientColor.green = v6;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientColorStopBlue"));
      v4->gradientColor.blue = v7;
      objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("CUIPSDGradientColorStopAlpha"));
      v4->gradientColor.alpha = v8;
    }
    else
    {
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "dddd", &v4->gradientColor, &v4->gradientColor.green, &v4->gradientColor.blue, &v4->gradientColor.alpha);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  _psdGradientColor *p_gradientColor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientColorStop;
  -[CUIPSDGradientStop encodeWithCoder:](&v6, sel_encodeWithCoder_);
  if (objc_msgSend(a3, "allowsKeyedCoding"))
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientColorStop version](CUIPSDGradientColorStop, "version"), CFSTR("CUIPSDGradientColorStopVersion"));
    p_gradientColor = &self->gradientColor;
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientColorStopRed"), p_gradientColor->red);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientColorStopGreen"), p_gradientColor->green);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientColorStopBlue"), p_gradientColor->blue);
    objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("CUIPSDGradientColorStopAlpha"), p_gradientColor->alpha);
  }
  else
  {
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "dddd", &self->gradientColor, &self->gradientColor.green, &self->gradientColor.blue, &self->gradientColor.alpha);
  }
}

- (_psdGradientColor)gradientColor
{
  double red;
  double green;
  double blue;
  double alpha;
  _psdGradientColor result;

  red = self->gradientColor.red;
  green = self->gradientColor.green;
  blue = self->gradientColor.blue;
  alpha = self->gradientColor.alpha;
  result.alpha = alpha;
  result.blue = blue;
  result.green = green;
  result.red = red;
  return result;
}

- (BOOL)isColorStop
{
  return 1;
}

- (id)description
{
  id v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientColorStop;
  v3 = -[CUIPSDGradientColorStop description](&v6, sel_description);
  -[CUIPSDGradientStop location](self, "location");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - location: %f color: (%f, %f, %f, %f) - (%d, %d, %d)"), v3, v4, *(_QWORD *)&self->gradientColor.red, *(_QWORD *)&self->gradientColor.green, *(_QWORD *)&self->gradientColor.blue, *(_QWORD *)&self->gradientColor.alpha, (int)(self->gradientColor.red * 255.0 + 0.5), (int)(self->gradientColor.green * 255.0 + 0.5), (int)(self->gradientColor.blue * 255.0 + 0.5));
}

@end
