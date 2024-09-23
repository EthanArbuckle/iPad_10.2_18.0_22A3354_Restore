@implementation _EMKGlyphRenderingAttributes

- (_EMKGlyphRenderingAttributes)initWithColor:(id)a3 shadowColor:(id)a4 scale:(double)a5
{
  id v8;
  id v9;
  _EMKGlyphRenderingAttributes *v10;
  uint64_t v11;
  UIColor *color;
  uint64_t v13;
  UIColor *shadowColor;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_EMKGlyphRenderingAttributes;
  v10 = -[_EMKGlyphRenderingAttributes init](&v16, sel_init);
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

- (_EMKGlyphRenderingAttributes)initWithValuesFromRippler:(id)a3 timeIndex:(unint64_t)a4 glyphIndex:(unint64_t)a5 numberOfGlyphs:(unint64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  _EMKGlyphRenderingAttributes *v15;

  v10 = a3;
  objc_msgSend(v10, "currentColorForGlyphIndex:numberOfGlyphs:timeIndex:", a5, a6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentShadowColorForGlyphIndex:numberOfGlyphs:timeIndex:", a5, a6, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentScaleForGlyphIndex:numberOfGlyphs:timeIndex:", a5, a6, a4);
  v14 = v13;

  v15 = -[_EMKGlyphRenderingAttributes initWithColor:shadowColor:scale:](self, "initWithColor:shadowColor:scale:", v11, v12, v14);
  return v15;
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

- (void)_applyInContext:(CGContext *)a3 fontPointSize:(double)a4
{
  void *v7;
  double v8;
  CGFloat v9;
  id v10;
  CGColorSpace *ColorSpace;
  id v12;
  void *v13;
  id v14;

  -[_EMKGlyphRenderingAttributes color](self, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EMKGlyphRenderingAttributes scale](self, "scale");
  v9 = v8 * a4;
  CGContextSetFontSize(a3, v9);
  v10 = objc_retainAutorelease(v7);
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v10, "CGColor"));
  CGContextSetStrokeColorSpace(a3, ColorSpace);
  CGContextSetFillColorSpace(a3, ColorSpace);
  v12 = objc_retainAutorelease(v10);
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)objc_msgSend(v12, "CGColor"));
  v14 = objc_retainAutorelease(v12);
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v14, "CGColor"));
  -[_EMKGlyphRenderingAttributes shadowIfNeededForFontPointSize:](self, "shadowIfNeededForFontPointSize:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applyToGraphicsContext_emk:", a3);

}

- (id)shadowIfNeededForFontPointSize:(double)a3
{
  id v4;
  void *v5;

  if (a3 >= 22.0)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC1298]);
    objc_msgSend(v4, "setShadowOffset:", 0.25, 0.0);
    objc_msgSend(v4, "setShadowBlurRadius:", 0.0);
    -[_EMKGlyphRenderingAttributes shadowColor](self, "shadowColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShadowColor:", v5);

  }
  return v4;
}

@end
