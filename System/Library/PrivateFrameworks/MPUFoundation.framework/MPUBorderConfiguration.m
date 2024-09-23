@implementation MPUBorderConfiguration

- (MPUBorderConfiguration)init
{
  MPUBorderConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPUBorderConfiguration;
  result = -[MPUBorderConfiguration init](&v3, sel_init);
  if (result)
  {
    result->_borderAlpha = 1.0;
    result->_dropShadowAlpha = 1.0;
    result->_fillAlpha = 1.0;
  }
  return result;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = llround(self->_borderAlpha * 10.0);
  v4 = v3
     + 10 * -[UIColor hash](self->_borderColor, "hash")
     + 100 * llround(self->_borderWidth * 6.0)
     + 1000 * llround(self->_fillAlpha * 10.0);
  v5 = v4 + 10000 * -[UIColor hash](self->_fillColor, "hash") + 100000 * llround(self->_dropShadowAlpha * 10.0);
  return v5
       + 1000000 * -[UIColor hash](self->_dropShadowColor, "hash")
       + 10000000 * self->_dropShadowEdges
       + 100000000 * llround(self->_dropShadowWidth * 6.0);
}

- (BOOL)isEqual:(id)a3
{
  MPUBorderConfiguration *v4;
  MPUBorderConfiguration *v5;
  UIColor *borderColor;
  UIColor *fillColor;
  UIColor *dropShadowColor;
  BOOL v9;

  v4 = (MPUBorderConfiguration *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v9 = MPUFloatEqualToFloat(self->_borderAlpha, v5->_borderAlpha)
        && ((borderColor = self->_borderColor, borderColor == v5->_borderColor)
         || -[UIColor isEqual:](borderColor, "isEqual:"))
        && MPUFloatEqualToFloat(self->_borderWidth * 6.0, v5->_borderWidth * 6.0)
        && MPUFloatEqualToFloat(self->_fillAlpha, v5->_fillAlpha)
        && ((fillColor = self->_fillColor, fillColor == v5->_fillColor)
         || -[UIColor isEqual:](fillColor, "isEqual:"))
        && MPUFloatEqualToFloat(self->_dropShadowAlpha, v5->_dropShadowAlpha)
        && ((dropShadowColor = self->_dropShadowColor, dropShadowColor == v5->_dropShadowColor)
         || -[UIColor isEqual:](dropShadowColor, "isEqual:"))
        && self->_dropShadowEdges == v5->_dropShadowEdges
        && MPUFloatEqualToFloat(self->_dropShadowWidth * 6.0, v5->_dropShadowWidth * 6.0);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v5[1] = *(_QWORD *)&self->_borderAlpha;
  v6 = -[UIColor copyWithZone:](self->_borderColor, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[3] = *(_QWORD *)&self->_borderWidth;
  v5[4] = *(_QWORD *)&self->_fillAlpha;
  v8 = -[UIColor copyWithZone:](self->_fillColor, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v5[6] = *(_QWORD *)&self->_dropShadowAlpha;
  v10 = -[UIColor copyWithZone:](self->_dropShadowColor, "copyWithZone:", a3);
  v11 = (void *)v5[7];
  v5[7] = v10;

  v5[8] = self->_dropShadowEdges;
  v5[9] = *(_QWORD *)&self->_dropShadowWidth;
  return v5;
}

- (BOOL)isFullyTransparent
{
  if (self->_dropShadowAlpha >= 0.00000011920929
    && self->_dropShadowColor
    && self->_dropShadowEdges
    && self->_dropShadowWidth >= 0.00000011920929
    || self->_borderAlpha >= 0.00000011920929 && self->_borderWidth >= 0.00000011920929 && self->_borderColor)
  {
    return 0;
  }
  if (self->_fillAlpha >= 0.00000011920929)
    return self->_fillColor == 0;
  return 1;
}

- (double)borderAlpha
{
  return self->_borderAlpha;
}

- (void)setBorderAlpha:(double)a3
{
  self->_borderAlpha = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (double)fillAlpha
{
  return self->_fillAlpha;
}

- (void)setFillAlpha:(double)a3
{
  self->_fillAlpha = a3;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
}

- (double)dropShadowAlpha
{
  return self->_dropShadowAlpha;
}

- (void)setDropShadowAlpha:(double)a3
{
  self->_dropShadowAlpha = a3;
}

- (UIColor)dropShadowColor
{
  return self->_dropShadowColor;
}

- (void)setDropShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_dropShadowColor, a3);
}

- (unint64_t)dropShadowEdges
{
  return self->_dropShadowEdges;
}

- (void)setDropShadowEdges:(unint64_t)a3
{
  self->_dropShadowEdges = a3;
}

- (double)dropShadowWidth
{
  return self->_dropShadowWidth;
}

- (void)setDropShadowWidth:(double)a3
{
  self->_dropShadowWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropShadowColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
