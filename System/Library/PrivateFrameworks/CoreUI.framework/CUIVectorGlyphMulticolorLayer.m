@implementation CUIVectorGlyphMulticolorLayer

- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 colorResolver:(id)a8
{
  double height;
  double width;
  id v16;
  uint64_t v17;
  _QWORD v18[5];
  objc_super v19;
  CGRect v20;

  height = a5.height;
  width = a5.width;
  if (-[NSArray count](-[CUIVectorGlyphLayer sublayers](self, "sublayers"), "count")
    || -[CUIVectorGlyphLayer referenceShape](self, "referenceShape"))
  {
    v16 = -[CUIVectorGlyphMulticolorLayer fillColor](self, "fillColor");
    if (a8)
    {
      v17 = (*((uint64_t (**)(id, NSString *, id))a8 + 2))(a8, -[CUIVectorGlyphMulticolorLayer fillColorName](self, "fillColorName"), v16);
      if (v17)
        v16 = (id)v17;
    }
    if (self->_fillImage)
      CGContextBeginTransparencyLayer(a3, 0);
    v19.receiver = self;
    v19.super_class = (Class)CUIVectorGlyphMulticolorLayer;
    -[CUIVectorGlyphLayer drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:](&v19, sel_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_onFillColor_offFillColor_, a3, v16, 0, a4, width, height, a6, a7);
    if (self->_fillImage)
    {
      CGContextSaveGState(a3);
      CGContextSetBlendMode(a3, kCGBlendModeSourceIn);
      v20.origin.x = 0.0;
      v20.origin.y = 0.0;
      v20.size.width = width * a4;
      v20.size.height = height * a4;
      CGContextDrawImage(a3, v20, (CGImageRef)self->_fillImage);
      CGContextRestoreGState(a3);
      CGContextEndTransparencyLayer(a3);
    }
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __118__CUIVectorGlyphMulticolorLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_colorResolver___block_invoke;
    v18[3] = &unk_1E41AA960;
    v18[4] = a8;
    -[CUIVectorGlyhLayerDelegate _legacy_drawMulticolorLayerNamed:inContext:scaleFactor:targetSize:colorResolver:](-[CUIVectorGlyphLayer delegate](self, "delegate"), "_legacy_drawMulticolorLayerNamed:inContext:scaleFactor:targetSize:colorResolver:", -[CUIVectorGlyphLayer name](self, "name"), a3, v18, a4, width, height);
  }
}

- (id)fillColor
{
  return self->_fillColor;
}

- (NSString)fillColorName
{
  return self->_fillColorName;
}

- (void)_readCSSAttributes:(CGSVGAttributeMap *)a3 styleAttributes:(CGSVGAttributeMap *)a4
{
  uint64_t v6;
  CGColor *v7;
  uint64_t v8;
  CGColor *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t SRGBWhite;
  id v14;
  CGImage *v15;
  objc_class *v16;
  int *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CUIVectorGlyphMulticolorLayer;
  -[CUIVectorGlyphLayer _readCSSAttributes:styleAttributes:](&v18, sel__readCSSAttributes_styleAttributes_, a3);
  v7 = (CGColor *)objc_msgSend((id)objc_opt_class(self, v6), "_fillColorFromStyle:", a4);
  v9 = (CGColor *)objc_msgSend((id)objc_opt_class(self, v8), "_strokeColorFromStyle:", a4);
  v11 = objc_msgSend((id)objc_opt_class(self, v10), "_colorNameForRenderingStyle:", -[CUIVectorGlyphLayer name](self, "name"));
  v12 = v11;
  if (!v7)
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("white")))
      SRGBWhite = _CUIColorGetSRGBWhite();
    else
      SRGBWhite = _CUIColorGetSRGBBlack();
    v7 = (CGColor *)SRGBWhite;
  }
  v14 = -[CUIVectorGlyhLayerDelegate _symbolDefaults](-[CUIVectorGlyphLayer delegate](self, "delegate"), "_symbolDefaults");
  if (objc_msgSend(objc_msgSend(v14, "objectForKeyedSubscript:", CUIVectorGlyphDefaultsKeyFillImageNames), "containsObject:", v12)&& (v15 = (CGImage *)-[CUIVectorGlyhLayerDelegate fillImageWithName:](-[CUIVectorGlyphLayer delegate](self, "delegate"), "fillImageWithName:", v12)) != 0)
  {
    v16 = CGImageRetain(v15);
    v17 = &OBJC_IVAR___CUIVectorGlyphMulticolorLayer__fillImage;
  }
  else
  {
    self->_fillColor = CGColorCreateCopy(v7);
    self->_fillColorName = (NSString *)objc_msgSend(v12, "copy");
    self->_strokeColor = CGColorCreateCopy(v9);
    v16 = (objc_class *)objc_msgSend(v12, "copy");
    v17 = &OBJC_IVAR___CUIVectorGlyphMulticolorLayer__strokeColorName;
  }
  *(Class *)((char *)&self->super.super.isa + *v17) = v16;
}

- (void)dealloc
{
  CGColor *fillColor;
  CGColor *strokeColor;
  CGImage *fillImage;
  objc_super v6;

  fillColor = (CGColor *)self->_fillColor;
  if (fillColor)
    CGColorRelease(fillColor);
  strokeColor = (CGColor *)self->_strokeColor;
  if (strokeColor)
    CGColorRelease(strokeColor);
  fillImage = (CGImage *)self->_fillImage;
  if (fillImage)
    CGImageRelease(fillImage);
  v6.receiver = self;
  v6.super_class = (Class)CUIVectorGlyphMulticolorLayer;
  -[CUIVectorGlyphLayer dealloc](&v6, sel_dealloc);
}

- (id)debugDescription
{
  id v3;
  NSString *v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  NSString *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CUIVectorGlyphMulticolorLayer;
  v3 = -[CUIVectorGlyphLayer debugDescription](&v10, sel_debugDescription);
  v4 = -[CUIVectorGlyphMulticolorLayer fillColorName](self, "fillColorName");
  v5 = CFSTR("<unspecified>");
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("<unspecified>");
  v7 = -[CUIVectorGlyphMulticolorLayer fillColor](self, "fillColor");
  v8 = -[CUIVectorGlyphMulticolorLayer strokeColorName](self, "strokeColorName");
  if (v8)
    v5 = (const __CFString *)v8;
  return objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" fill color name=%@ fill color=%@ stroke color name=%@ stroke color=%@"), v6, v7, v5, -[CUIVectorGlyphMulticolorLayer strokeColor](self, "strokeColor"));
}

- (BOOL)needsWideGamut
{
  CGColor *v2;
  CGColorSpace *ColorSpace;

  v2 = -[CUIVectorGlyphMulticolorLayer fillColor](self, "fillColor");
  if (v2)
  {
    ColorSpace = CGColorGetColorSpace(v2);
    LOBYTE(v2) = CGColorSpaceIsWideGamutRGB(ColorSpace);
  }
  return (char)v2;
}

uint64_t __118__CUIVectorGlyphMulticolorLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_colorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 colorResolver:(id)a7
{
  double height;
  double width;
  double v14;
  double v15;
  CGColorSpace *SRGB;
  uint64_t v17;
  uint64_t v18;
  CGContext *v19;
  NSArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  CGImage *Image;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  height = a4.height;
  width = a4.width;
  v14 = a4.width * a3;
  v15 = a4.height * a3;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v19 = CUICGBitmapContextCreate(vcvtpd_u64_f64(v14), vcvtpd_u64_f64(v15), 8uLL, 0, SRGB, 8193, v17, v18);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = -[CUIVectorGlyphLayer sublayers](self, "sublayers", 0);
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v24), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:colorResolver:", v19, a7, a3, width, height, a5, a6);
        v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v22);
  }
  Image = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  return Image;
}

- (NSString)strokeColorName
{
  return self->_strokeColorName;
}

- (id)strokeColor
{
  return self->_strokeColor;
}

- (id)fillImage
{
  return self->_fillImage;
}

@end
