@implementation CUIVectorGlyphGraphicVariantOptions

+ (double)defaultSymbolPointSizeRatio
{
  double v2;

  +[CUIVectorGlyphMutator transformForGlyphSize:](CUIVectorGlyphMutator, "transformForGlyphSize:", 2);
  return v2 * 1.2;
}

- (CUIVectorGlyphGraphicVariantOptions)init
{
  CUIVectorGlyphGraphicVariantOptions *v2;
  CUIVectorGlyphGraphicVariantOptions *v3;
  CGColorRef ConstantColor;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIVectorGlyphGraphicVariantOptions;
  v2 = -[CUIVectorGlyphGraphicVariantOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->roundedRectCornerRadius = 0.225;
    v2->imageScaling = 3;
    ConstantColor = CGColorGetConstantColor(kCGColorBlack);
    v3->borderColor = ConstantColor;
    CFRetain(ConstantColor);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CUIVectorGlyphGraphicVariantOptions *v4;
  CGColor *monochromeForegroundColor;
  CGColor *borderColor;

  v4 = -[CUIVectorGlyphGraphicVariantOptions init](+[CUIVectorGlyphGraphicVariantOptions allocWithZone:](CUIVectorGlyphGraphicVariantOptions, "allocWithZone:", a3), "init");
  v4->shape = self->shape;
  v4->fill = self->fill;
  v4->contentEffect = self->contentEffect;
  v4->fillColors = (NSArray *)-[NSArray copy](self->fillColors, "copy");
  monochromeForegroundColor = (CGColor *)self->monochromeForegroundColor;
  if (monochromeForegroundColor)
    monochromeForegroundColor = CGColorCreateCopy(monochromeForegroundColor);
  v4->monochromeForegroundColor = monochromeForegroundColor;
  v4->roundedRectCornerRadius = self->roundedRectCornerRadius;
  v4->imageScaling = self->imageScaling;
  v4->imageAlignment = self->imageAlignment;
  v4->imageOffset = self->imageOffset;
  v4->shapeEffect = self->shapeEffect;
  v4->borderWidth = self->borderWidth;
  borderColor = (CGColor *)self->borderColor;
  if (borderColor)
    borderColor = CGColorCreateCopy(borderColor);
  v4->borderColor = borderColor;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIVectorGlyphGraphicVariantOptions;
  -[CUIVectorGlyphGraphicVariantOptions dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v13;
  id shape;
  id fill;
  id contentEffect;
  unsigned int v17;
  CGColor *monochromeForegroundColor;
  double roundedRectCornerRadius;
  double v20;
  id imageCentering;
  id imageScaling;
  id imageAlignment;
  double v24;
  double v25;
  id shapeEffect;
  double borderWidth;
  double v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if (a3 == self)
  {
    LOBYTE(v17) = 1;
    return v17;
  }
  v30 = v10;
  v31 = v9;
  v32 = v6;
  v33 = v5;
  v34 = v4;
  v35 = v3;
  v13 = objc_opt_class(self, a2);
  if ((objc_opt_isKindOfClass(a3, v13) & 1) == 0)
    goto LABEL_20;
  shape = (id)self->shape;
  if (shape != objc_msgSend(a3, "shape"))
    goto LABEL_20;
  fill = (id)self->fill;
  if (fill != objc_msgSend(a3, "fill"))
    goto LABEL_20;
  contentEffect = (id)self->contentEffect;
  if (contentEffect != objc_msgSend(a3, "contentEffect"))
    goto LABEL_20;
  v17 = -[NSArray isEqual:](self->fillColors, "isEqual:", objc_msgSend(a3, "fillColors"));
  if (!v17)
    return v17;
  monochromeForegroundColor = (CGColor *)self->monochromeForegroundColor;
  if (monochromeForegroundColor)
    goto LABEL_10;
  if (objc_msgSend(a3, "monochromeForegroundColor"))
  {
    monochromeForegroundColor = (CGColor *)self->monochromeForegroundColor;
LABEL_10:
    v17 = CGColorEqualToColor(monochromeForegroundColor, (CGColorRef)objc_msgSend(a3, "monochromeForegroundColor", v10, v9, v6, v33, v34, v35, v7, v8));
    if (!v17)
      return v17;
  }
  roundedRectCornerRadius = self->roundedRectCornerRadius;
  objc_msgSend(a3, "roundedRectCornerRadius", v30, v31, v32, v33, v34, v35);
  if (roundedRectCornerRadius != v20)
    goto LABEL_20;
  imageCentering = (id)self->imageCentering;
  if (imageCentering != objc_msgSend(a3, "imageCentering"))
    goto LABEL_20;
  imageScaling = (id)self->imageScaling;
  if (imageScaling != objc_msgSend(a3, "imageScaling"))
    goto LABEL_20;
  imageAlignment = (id)self->imageAlignment;
  if (imageAlignment != objc_msgSend(a3, "imageAlignment"))
    goto LABEL_20;
  objc_msgSend(a3, "imageOffset");
  LOBYTE(v17) = 0;
  if (self->imageOffset.width != v25 || self->imageOffset.height != v24)
    return v17;
  shapeEffect = (id)self->shapeEffect;
  if (shapeEffect != objc_msgSend(a3, "shapeEffect"))
  {
LABEL_20:
    LOBYTE(v17) = 0;
    return v17;
  }
  v17 = CGColorEqualToColor((CGColorRef)self->borderColor, (CGColorRef)objc_msgSend(a3, "borderColor"));
  if (v17)
  {
    borderWidth = self->borderWidth;
    objc_msgSend(a3, "borderWidth");
    LOBYTE(v17) = vabdd_f64(borderWidth, v28) < 0.0004;
  }
  return v17;
}

- (BOOL)_areValid
{
  double width;
  BOOL v3;
  double height;
  BOOL v6;
  double roundedRectCornerRadius;
  BOOL v8;

  width = self->imageOffset.width;
  v3 = width >= -0.5 && width <= 0.5;
  v6 = 0;
  if (v3)
  {
    height = self->imageOffset.height;
    if (height >= -0.5 && height <= 0.5)
      v6 = 1;
  }
  roundedRectCornerRadius = self->roundedRectCornerRadius;
  v8 = roundedRectCornerRadius >= 0.0;
  if (roundedRectCornerRadius > 0.5)
    v8 = 0;
  return v6 && v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  CFHashCode v4;
  CFHashCode v5;
  id monochromeForegroundColor;
  uint64_t v7;
  CFHashCode v8;
  unint64_t v9;
  unint64_t v10;
  id borderColor;
  CFHashCode v12;

  v3 = (self->fill << (self->fill & 7)) + 83 * (self->shape << (self->shape & 7)) + 6889;
  if (-[NSArray count](self->fillColors, "count"))
  {
    v4 = CFHash(-[NSArray firstObject](self->fillColors, "firstObject"));
    v3 = (v4 << (CFHash(-[NSArray firstObject](self->fillColors, "firstObject")) & 7)) + 83 * v3;
  }
  if (-[NSArray count](self->fillColors, "count") >= 2)
  {
    v5 = CFHash(-[NSArray lastObject](self->fillColors, "lastObject"));
    v3 = (v5 << (CFHash(-[NSArray lastObject](self->fillColors, "lastObject")) & 7)) + 83 * v3;
  }
  monochromeForegroundColor = self->monochromeForegroundColor;
  v7 = (self->contentEffect << (self->contentEffect & 7)) + 83 * v3;
  if (monochromeForegroundColor)
  {
    v8 = CFHash(monochromeForegroundColor);
    v7 = (v8 << (CFHash(self->monochromeForegroundColor) & 7)) + 83 * v7;
  }
  v9 = (unint64_t)(self->imageOffset.width * 1000.0);
  v10 = ((unint64_t)(self->borderWidth * 1000.0) << ((unint64_t)(self->borderWidth * 1000.0) & 7))
      + 83
      * ((self->shapeEffect << (self->shapeEffect & 7))
       + 83
       * (((unint64_t)(self->imageOffset.height * 1000.0) << ((unint64_t)(self->imageOffset.height * 1000.0) & 7))
        + 83
        * ((v9 << (v9 & 7))
         + 83
         * ((self->imageAlignment << (self->imageAlignment & 7))
          + 83
          * ((self->imageScaling << (self->imageScaling & 7))
           + 83
           * ((self->imageCentering << (self->imageCentering & 7))
            + 83
            * (((unint64_t)(self->roundedRectCornerRadius * 1000.0) << ((unint64_t)(self->roundedRectCornerRadius
                                                                                                * 1000.0) & 7))
             + 83 * v7)))))));
  borderColor = self->borderColor;
  if (borderColor)
  {
    v12 = CFHash(borderColor);
    return (v12 << (CFHash(self->borderColor) & 7)) + 83 * v10;
  }
  return v10;
}

- (int64_t)shape
{
  return self->shape;
}

- (void)setShape:(int64_t)a3
{
  self->shape = a3;
}

- (int64_t)fill
{
  return self->fill;
}

- (void)setFill:(int64_t)a3
{
  self->fill = a3;
}

- (NSArray)fillColors
{
  return self->fillColors;
}

- (void)setFillColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)contentEffect
{
  return self->contentEffect;
}

- (void)setContentEffect:(int64_t)a3
{
  self->contentEffect = a3;
}

- (id)monochromeForegroundColor
{
  return self->monochromeForegroundColor;
}

- (void)setMonochromeForegroundColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (double)roundedRectCornerRadius
{
  return self->roundedRectCornerRadius;
}

- (void)setRoundedRectCornerRadius:(double)a3
{
  self->roundedRectCornerRadius = a3;
}

- (int64_t)imageCentering
{
  return self->imageCentering;
}

- (void)setImageCentering:(int64_t)a3
{
  self->imageCentering = a3;
}

- (int64_t)imageScaling
{
  return self->imageScaling;
}

- (void)setImageScaling:(int64_t)a3
{
  self->imageScaling = a3;
}

- (int64_t)imageAlignment
{
  return self->imageAlignment;
}

- (void)setImageAlignment:(int64_t)a3
{
  self->imageAlignment = a3;
}

- (CGSize)imageOffset
{
  double width;
  double height;
  CGSize result;

  width = self->imageOffset.width;
  height = self->imageOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageOffset:(CGSize)a3
{
  self->imageOffset = a3;
}

- (int64_t)shapeEffect
{
  return self->shapeEffect;
}

- (void)setShapeEffect:(int64_t)a3
{
  self->shapeEffect = a3;
}

- (id)borderColor
{
  return self->borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (double)borderWidth
{
  return self->borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->borderWidth = a3;
}

@end
