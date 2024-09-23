@implementation CUIVectorGlyphHierarchicalLayer

- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 paletteColorResolver:(id)a8
{
  double height;
  double width;
  unsigned int v16;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  CGColor *SRGBBlack;
  CGColor *SRGBClear;
  double v23;
  CGColorRef CopyWithAlpha;
  _QWORD v25[5];
  objc_super v26;

  height = a5.height;
  width = a5.width;
  v16 = -[CUIVectorGlyphLayer isEraserLayer](self, "isEraserLayer");
  -[CUIVectorGlyphLayer opacity](self, "opacity");
  v18 = v17;
  v19 = -[CUIVectorGlyphLayer index](self, "index");
  v20 = -[CUIVectorGlyphHierarchicalLayer hierarchyLevel](self, "hierarchyLevel");
  SRGBBlack = (CGColor *)_CUIColorGetSRGBBlack();
  if (v16 && v18 < 2.22044605e-16)
  {
    SRGBClear = (CGColor *)_CUIColorGetSRGBClear();
    SRGBBlack = SRGBClear;
    v23 = 0.7;
  }
  else
  {
    if (!a8)
    {
      CopyWithAlpha = 0;
      goto LABEL_7;
    }
    SRGBBlack = (CGColor *)(*((uint64_t (**)(id, unint64_t, unint64_t))a8 + 2))(a8, v19, v20);
    v23 = CGColorGetAlpha(SRGBBlack) * 0.3;
    SRGBClear = SRGBBlack;
  }
  CopyWithAlpha = CGColorCreateCopyWithAlpha(SRGBClear, v23);
  CFAutorelease(CopyWithAlpha);
LABEL_7:
  if (-[NSArray count](-[CUIVectorGlyphLayer sublayers](self, "sublayers"), "count")
    || -[CUIVectorGlyphLayer referenceShape](self, "referenceShape"))
  {
    v26.receiver = self;
    v26.super_class = (Class)CUIVectorGlyphHierarchicalLayer;
    -[CUIVectorGlyphLayer drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:](&v26, sel_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_onFillColor_offFillColor_, a3, SRGBBlack, CopyWithAlpha, a4, width, height, a6, a7);
  }
  else
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __127__CUIVectorGlyphHierarchicalLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_paletteColorResolver___block_invoke;
    v25[3] = &unk_1E41AA960;
    v25[4] = a8;
    -[CUIVectorGlyhLayerDelegate _legacy_drawHierarchicalLayerNamed:inContext:scaleFactor:targetSize:colorResolver:](-[CUIVectorGlyphLayer delegate](self, "delegate"), "_legacy_drawHierarchicalLayerNamed:inContext:scaleFactor:targetSize:colorResolver:", -[CUIVectorGlyphLayer name](self, "name"), a3, v25, a4, width, height);
  }
}

- (unint64_t)hierarchyLevel
{
  return self->_hierarchyLevel;
}

- (void)drawInContext:(CGContext *)a3 scaleFactor:(double)a4 targetSize:(CGSize)a5 variableMinValue:(double)a6 variableMaxValue:(double)a7 hierarchicalColorResolver:(id)a8
{
  double height;
  double width;
  unsigned int v16;
  double v17;
  double v18;
  unint64_t v19;
  unint64_t v20;
  CGColor *SRGBBlack;
  CGColorRef CopyWithAlpha;
  _QWORD v23[5];
  objc_super v24;

  height = a5.height;
  width = a5.width;
  v16 = -[CUIVectorGlyphLayer isEraserLayer](self, "isEraserLayer");
  -[CUIVectorGlyphLayer opacity](self, "opacity");
  v18 = v17;
  v19 = -[CUIVectorGlyphLayer index](self, "index");
  v20 = -[CUIVectorGlyphHierarchicalLayer hierarchyLevel](self, "hierarchyLevel");
  SRGBBlack = (CGColor *)_CUIColorGetSRGBBlack();
  if (v16 && v18 < 2.22044605e-16)
  {
    SRGBBlack = (CGColor *)_CUIColorGetSRGBClear();
    CopyWithAlpha = CGColorCreateCopyWithAlpha(SRGBBlack, 0.7);
    CFAutorelease(CopyWithAlpha);
  }
  else if (a8)
  {
    SRGBBlack = (CGColor *)(*((uint64_t (**)(id, unint64_t, unint64_t))a8 + 2))(a8, v19, v20);
    CopyWithAlpha = (CGColorRef)(*((uint64_t (**)(id, unint64_t, uint64_t))a8 + 2))(a8, v19, 2);
  }
  else
  {
    CopyWithAlpha = 0;
  }
  if (-[NSArray count](-[CUIVectorGlyphLayer sublayers](self, "sublayers"), "count")
    || -[CUIVectorGlyphLayer referenceShape](self, "referenceShape"))
  {
    v24.receiver = self;
    v24.super_class = (Class)CUIVectorGlyphHierarchicalLayer;
    -[CUIVectorGlyphLayer drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:](&v24, sel_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_onFillColor_offFillColor_, a3, SRGBBlack, CopyWithAlpha, a4, width, height, a6, a7);
  }
  else
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = __132__CUIVectorGlyphHierarchicalLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_hierarchicalColorResolver___block_invoke;
    v23[3] = &unk_1E41AA960;
    v23[4] = a8;
    -[CUIVectorGlyhLayerDelegate _legacy_drawHierarchicalLayerNamed:inContext:scaleFactor:targetSize:colorResolver:](-[CUIVectorGlyphLayer delegate](self, "delegate"), "_legacy_drawHierarchicalLayerNamed:inContext:scaleFactor:targetSize:colorResolver:", -[CUIVectorGlyphLayer name](self, "name"), a3, v23, a4, width, height);
  }
}

- (void)_readCSSAttributes:(CGSVGAttributeMap *)a3 styleAttributes:(CGSVGAttributeMap *)a4
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CUIVectorGlyphHierarchicalLayer;
  -[CUIVectorGlyphLayer _readCSSAttributes:styleAttributes:](&v10, sel__readCSSAttributes_styleAttributes_, a3, a4);
  v6 = objc_msgSend((id)objc_opt_class(self, v5), "_colorNameForRenderingStyle:", -[CUIVectorGlyphLayer name](self, "name"));
  v8 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, v7), "_layerHierarchyStyleNames"), "indexOfObject:", v6);
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = (unint64_t)v8;
  self->_hierarchyLevel = v9;
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIVectorGlyphHierarchicalLayer;
  return objc_msgSend(-[CUIVectorGlyphLayer debugDescription](&v3, sel_debugDescription), "stringByAppendingFormat:", CFSTR(" hierarchy level=%ld"), -[CUIVectorGlyphHierarchicalLayer hierarchyLevel](self, "hierarchyLevel"));
}

uint64_t __132__CUIVectorGlyphHierarchicalLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_hierarchicalColorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 hierarchicalColorResolver:(id)CopyWithAlpha
{
  double height;
  double width;
  double v14;
  double v15;
  CGColorSpace *SRGB;
  uint64_t v17;
  uint64_t v18;
  CGContext *v19;
  unsigned int v20;
  double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  CGColor *SRGBBlack;
  NSArray *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  CGImage *Image;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  height = a4.height;
  width = a4.width;
  v14 = a4.width * a3;
  v15 = a4.height * a3;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v19 = CUICGBitmapContextCreate(vcvtpd_u64_f64(v14), vcvtpd_u64_f64(v15), 8uLL, 0, SRGB, 8193, v17, v18);
  v20 = -[CUIVectorGlyphLayer isEraserLayer](self, "isEraserLayer");
  -[CUIVectorGlyphLayer opacity](self, "opacity");
  v22 = v21;
  v23 = -[CUIVectorGlyphLayer index](self, "index");
  v24 = -[CUIVectorGlyphHierarchicalLayer hierarchyLevel](self, "hierarchyLevel");
  SRGBBlack = (CGColor *)_CUIColorGetSRGBBlack();
  if (v20 && v22 < 2.22044605e-16)
  {
    SRGBBlack = (CGColor *)_CUIColorGetSRGBClear();
    CopyWithAlpha = CGColorCreateCopyWithAlpha(SRGBBlack, 0.7);
    CFAutorelease(CopyWithAlpha);
  }
  else if (CopyWithAlpha)
  {
    SRGBBlack = (CGColor *)(*((uint64_t (**)(id, unint64_t, unint64_t))CopyWithAlpha + 2))(CopyWithAlpha, v23, v24);
    CopyWithAlpha = (id)(*((uint64_t (**)(id, unint64_t, uint64_t))CopyWithAlpha + 2))(CopyWithAlpha, v23, 2);
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v26 = -[CUIVectorGlyphLayer sublayers](self, "sublayers", 0);
  v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", v19, SRGBBlack, CopyWithAlpha, a3, width, height, a5, a6);
      }
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v28);
  }
  Image = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  return Image;
}

uint64_t __127__CUIVectorGlyphHierarchicalLayer_drawInContext_scaleFactor_targetSize_variableMinValue_variableMaxValue_paletteColorResolver___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CGImage)createImageUsingScaleFactor:(double)a3 targetSize:(CGSize)a4 variableMinValue:(double)a5 variableMaxValue:(double)a6 paletteColorResolver:(id)CopyWithAlpha
{
  double height;
  double width;
  double v14;
  double v15;
  CGColorSpace *SRGB;
  uint64_t v17;
  uint64_t v18;
  CGContext *v19;
  unsigned int v20;
  double v21;
  double v22;
  unint64_t v23;
  unint64_t v24;
  CGColor *SRGBBlack;
  CGColor *SRGBClear;
  double v27;
  NSArray *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *i;
  CGImage *Image;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  height = a4.height;
  width = a4.width;
  v14 = a4.width * a3;
  v15 = a4.height * a3;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  v19 = CUICGBitmapContextCreate(vcvtpd_u64_f64(v14), vcvtpd_u64_f64(v15), 8uLL, 0, SRGB, 8193, v17, v18);
  v20 = -[CUIVectorGlyphLayer isEraserLayer](self, "isEraserLayer");
  -[CUIVectorGlyphLayer opacity](self, "opacity");
  v22 = v21;
  v23 = -[CUIVectorGlyphLayer index](self, "index");
  v24 = -[CUIVectorGlyphHierarchicalLayer hierarchyLevel](self, "hierarchyLevel");
  SRGBBlack = (CGColor *)_CUIColorGetSRGBBlack();
  if (v20 && v22 < 2.22044605e-16)
  {
    SRGBClear = (CGColor *)_CUIColorGetSRGBClear();
    SRGBBlack = SRGBClear;
    v27 = 0.7;
  }
  else
  {
    if (!CopyWithAlpha)
      goto LABEL_7;
    SRGBBlack = (CGColor *)(*((uint64_t (**)(id, unint64_t, unint64_t))CopyWithAlpha + 2))(CopyWithAlpha, v23, v24);
    v27 = CGColorGetAlpha(SRGBBlack) * 0.3;
    SRGBClear = SRGBBlack;
  }
  CopyWithAlpha = CGColorCreateCopyWithAlpha(SRGBClear, v27);
  CFAutorelease(CopyWithAlpha);
LABEL_7:
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = -[CUIVectorGlyphLayer sublayers](self, "sublayers", 0);
  v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v31)
          objc_enumerationMutation(v28);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "drawInContext:scaleFactor:targetSize:variableMinValue:variableMaxValue:onFillColor:offFillColor:", v19, SRGBBlack, CopyWithAlpha, a3, width, height, a5, a6);
      }
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v30);
  }
  Image = CGBitmapContextCreateImage(v19);
  CGContextRelease(v19);
  return Image;
}

@end
