@implementation CKMentionsRenderingAttributes

- (void)_applyInContext:(CGContext *)a3 fontPointSize:(double)a4 getAdjustedFontSize:(double *)a5
{
  double v9;
  double v10;
  id v11;
  CGColorSpace *ColorSpace;
  id v13;
  id v14;

  -[CKMentionsRenderingAttributes scale](self, "scale");
  v10 = v9 * a4;
  CGContextSetFontSize(a3, v10);
  -[CKMentionsRenderingAttributes color](self, "color");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v11, "CGColor"));
  CGContextSetStrokeColorSpace(a3, ColorSpace);
  CGContextSetFillColorSpace(a3, ColorSpace);
  v13 = objc_retainAutorelease(v11);
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v13, "CGColor"));
  v14 = objc_retainAutorelease(v13);
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v14, "CGColor"));
  if (a5)
    *a5 = v10;

}

- (CKMentionsRenderingAttributes)initWithColor:(id)a3 shadowColor:(id)a4 scale:(double)a5
{
  id v8;
  id v9;
  CKMentionsRenderingAttributes *v10;
  uint64_t v11;
  UIColor *color;
  uint64_t v13;
  UIColor *shadowColor;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKMentionsRenderingAttributes;
  v10 = -[CKMentionsRenderingAttributes init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    color = v10->_color;
    v10->_color = (UIColor *)v11;

    v13 = objc_msgSend(v9, "copy");
    shadowColor = v10->_shadowColor;
    v10->_shadowColor = (UIColor *)v13;

    v10->_scale = a5;
  }

  return v10;
}

- (CKMentionsRenderingAttributes)initWithValuesFromRippler:(id)a3 timeIndex:(unint64_t)a4 glyphIndex:(unint64_t)a5 glyphCount:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  CKMentionsRenderingAttributes *v15;

  v10 = a3;
  objc_msgSend(v10, "currentColorForGlyphIndex:numberOfGlyphs:timeIndex:", a5, a6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentShadowColorForGlyphIndex:numberOfGlyphs:timeIndex:", a5, a6, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentScaleForGlyphIndex:numberOfGlyphs:timeIndex:", a5, a6, a4);
  v14 = v13;

  v15 = -[CKMentionsRenderingAttributes initWithColor:shadowColor:scale:](self, "initWithColor:shadowColor:scale:", v11, v12, v14);
  return v15;
}

+ (id)newWithValuesFromRippler:(id)a3 timeIndex:(unint64_t)a4 glyphIndex:(unint64_t)a5 glyphCount:(unint64_t)a6
{
  id v10;
  void *v11;

  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValuesFromRippler:timeIndex:glyphIndex:glyphCount:", v10, a4, a5, a6);

  return v11;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end
