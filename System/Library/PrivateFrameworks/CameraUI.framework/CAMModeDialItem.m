@implementation CAMModeDialItem

- (CAMModeDialItem)initWithFrame:(CGRect)a3
{
  CAMModeDialItem *v3;
  CAMModeDialItem *v4;
  CAMModeDialItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMModeDialItem;
  v3 = -[CAMModeDialItem initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CAMModeDialItem _commonCAMModeDialItemInitialization](v3, "_commonCAMModeDialItemInitialization");
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMModeDialItemInitialization
{
  UIFont *v3;
  UIFont *font;
  CAShapeLayer *v5;
  CAShapeLayer *scalableTextLayer;
  id v7;

  +[CAMFont cameraModeDialFontForContentSize:](CAMFont, "cameraModeDialFontForContentSize:", *MEMORY[0x1E0DC4918]);
  v3 = (UIFont *)objc_claimAutoreleasedReturnValue();
  font = self->_font;
  self->_font = v3;

  objc_msgSend(MEMORY[0x1E0CD2840], "layer");
  v5 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
  scalableTextLayer = self->__scalableTextLayer;
  self->__scalableTextLayer = v5;

  -[CAMModeDialItem layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", self->__scalableTextLayer);

}

- (void)setTitle:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    -[CAMModeDialItem _updateScalableTextPathFromAttributedTitle](self, "_updateScalableTextPathFromAttributedTitle");
  }

}

- (void)_updateScalableTextPathFromAttributedTitle
{
  CAMModeDialItem *v2;
  CGPath *v3;
  id v4;
  double v5;
  id v6;

  v2 = self;
  v3 = -[CAMModeDialItem _pathForAttributedString:](self, "_pathForAttributedString:", -[CAMModeDialItem _attributedTitle](self, "_attributedTitle"));
  -[CAMModeDialItem _scalableTextLayer](v2, "_scalableTextLayer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = -[CAMModeDialItem shouldShadowTitleText](v2, "shouldShadowTitleText");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  objc_msgSend(v6, "setPath:", v3);
  if ((_DWORD)v2)
  {
    objc_msgSend(v6, "setShadowPath:", v3);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "setShadowColor:", objc_msgSend(v4, "CGColor"));

    LODWORD(v5) = 1051931443;
    objc_msgSend(v6, "setShadowOpacity:", v5);
    objc_msgSend(v6, "setShadowOffset:", 0.0, 0.0);
    objc_msgSend(v6, "setShadowRadius:", 2.0);
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (__CFAttributedString)_attributedTitle
{
  void *v3;
  void *v4;
  uint64_t v5;
  CTParagraphStyleRef v6;
  void *v7;
  const __CFAllocator *v8;
  const __CFDictionary *v9;
  CFAttributedStringRef v10;
  __CFAttributedString *v11;
  uint64_t v13;
  char v14;
  void *values[3];
  void *keys[3];
  CTParagraphStyleSetting settings;
  int v18;
  uint64_t v19;
  uint64_t *v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CAMModeDialItem font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMFont cameraKerningForFont:](CAMFont, "cameraKerningForFont:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 2;
  objc_msgSend(v3, "leading");
  v13 = v5;
  settings.spec = kCTParagraphStyleSpecifierAlignment;
  settings.valueSize = 1;
  settings.value = &v14;
  v18 = 14;
  v19 = 8;
  v20 = &v13;
  v21 = 15;
  v22 = 8;
  v23 = &v13;
  v6 = CTParagraphStyleCreate(&settings, 3uLL);
  v7 = (void *)*MEMORY[0x1E0CA8588];
  keys[0] = *(void **)MEMORY[0x1E0CA8188];
  keys[1] = v7;
  keys[2] = *(void **)MEMORY[0x1E0CA85A0];
  values[0] = v3;
  values[1] = v4;
  values[2] = v6;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)values, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v10 = CFAttributedStringCreate(v8, (CFStringRef)-[CAMModeDialItem title](self, "title"), v9);
  CFRelease(v6);
  CFRelease(v9);
  v11 = (__CFAttributedString *)CFAutorelease(v10);

  return v11;
}

- (UIFont)font
{
  return self->_font;
}

- (NSString)title
{
  return self->_title;
}

- (CGPath)_pathForAttributedString:(__CFAttributedString *)a3
{
  const __CTFramesetter *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  const __CTFrame *Frame;
  const __CFArray *Lines;
  CFIndex Count;
  CGPoint *v13;
  CFIndex v14;
  const __CTLine *ValueAtIndex;
  const __CFArray *GlyphRuns;
  const __CFArray *v17;
  CFIndex v18;
  const __CTRun *v19;
  const __CFDictionary *Attributes;
  const __CTFont *Value;
  int64_t GlyphCount;
  CFIndex v23;
  double *v24;
  CGFloat v25;
  CGFloat v26;
  const CGPath *v27;
  void *v28;
  int v29;
  double b;
  double v31;
  const void *v32;
  const __CTFrame *v34;
  const CGPath *path;
  const __CTFramesetter *cf;
  const __CFArray *theArray;
  void *key;
  const __CFArray *v39;
  CFIndex v40;
  double *v41;
  CAMModeDialItem *v42;
  CGPath *path1;
  CGAffineTransform v44;
  CGAffineTransform m;
  CGAffineTransform matrix;
  CGGlyph buffer;
  CFRange fitRange;
  CFRange v49;
  CFRange v50;
  CFRange v51;
  CFRange v52;
  CGSize v53;
  CGRect v54;

  path1 = CGPathCreateMutable();
  v5 = CTFramesetterCreateWithAttributedString(a3);
  fitRange.location = 0;
  fitRange.length = 0;
  v49.length = CFAttributedStringGetLength(a3);
  v53.width = 1.79769313e308;
  v49.location = 0;
  v53.height = 1.79769313e308;
  CTFramesetterSuggestFrameSizeWithConstraints(v5, v49, 0, v53, &fitRange);
  UICeilToViewScale();
  v7 = v6;
  UICeilToViewScale();
  v9 = v8;
  v42 = self;
  -[CAMModeDialItem _setTextFrameSize:](self, "_setTextFrameSize:", v7, v8);
  v54.origin.x = 0.0;
  v54.origin.y = 0.0;
  v54.size.width = v7;
  v54.size.height = v9;
  path = CGPathCreateWithRect(v54, 0);
  cf = v5;
  Frame = CTFramesetterCreateFrame(v5, fitRange, path, 0);
  Lines = CTFrameGetLines(Frame);
  Count = CFArrayGetCount(Lines);
  v13 = (CGPoint *)malloc_type_malloc(16 * Count, 0x1000040451B5BE8uLL);
  v34 = Frame;
  v50.location = 0;
  v50.length = 0;
  CTFrameGetLineOrigins(Frame, v50, v13);
  if (CFArrayGetCount(Lines) >= 1)
  {
    v14 = 0;
    theArray = Lines;
    key = (void *)*MEMORY[0x1E0CA8188];
    do
    {
      ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v14);
      if (ValueAtIndex)
      {
        GlyphRuns = CTLineGetGlyphRuns(ValueAtIndex);
        if (GlyphRuns)
        {
          v17 = GlyphRuns;
          if (CFArrayGetCount(GlyphRuns) >= 1)
          {
            v18 = 0;
            v39 = v17;
            do
            {
              v40 = v18;
              v19 = (const __CTRun *)CFArrayGetValueAtIndex(v17, v18);
              Attributes = CTRunGetAttributes(v19);
              Value = (const __CTFont *)CFDictionaryGetValue(Attributes, key);
              GlyphCount = CTRunGetGlyphCount(v19);
              v41 = (double *)malloc_type_calloc(GlyphCount, 0x10uLL, 0x1000040451B5BE8uLL);
              CTRunGetStretchFactors();
              if (GlyphCount >= 1)
              {
                v23 = 0;
                v24 = v41 + 1;
                do
                {
                  buffer = 0;
                  v51.location = v23;
                  v51.length = 1;
                  CTRunGetGlyphs(v19, v51, &buffer);
                  v25 = *(v24 - 1);
                  v26 = *v24;
                  memset(&matrix, 0, sizeof(matrix));
                  CGAffineTransformMakeScale(&matrix, v25, v26);
                  v44.a = 0.0;
                  v44.b = 0.0;
                  v52.location = v23;
                  v52.length = 1;
                  CTRunGetPositions(v19, v52, (CGPoint *)&v44);
                  v27 = CTFontCreatePathForGlyph(Value, buffer, &matrix);
                  *(float64x2_t *)&v44.a = vaddq_f64((float64x2_t)v13[v14], *(float64x2_t *)&v44.a);
                  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities", v34, path, cf);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  v29 = objc_msgSend(v28, "sfCameraFontSupported");

                  if (v29)
                  {
                    b = v44.b;
                  }
                  else
                  {
                    v31 = CAMPixelWidthForView(v42);
                    b = v31 + v44.b;
                    v44.b = v31 + v44.b;
                  }
                  memset(&m, 0, sizeof(m));
                  CGAffineTransformMakeTranslation(&m, v44.a, b);
                  CGPathAddPath(path1, &m, v27);
                  CGPathRelease(v27);
                  ++v23;
                  v24 += 2;
                }
                while (GlyphCount != v23);
              }
              free(v41);
              v17 = v39;
              v18 = v40 + 1;
            }
            while (v40 + 1 < CFArrayGetCount(v39));
          }
        }
      }
      ++v14;
      Lines = theArray;
    }
    while (v14 < CFArrayGetCount(theArray));
  }
  if (v13)
    free(v13);
  memset(&matrix, 0, sizeof(matrix));
  CGAffineTransformMakeScale(&matrix, 1.0, -1.0);
  v44 = matrix;
  CGAffineTransformTranslate(&m, &v44, 0.0, -v9);
  matrix = m;
  v32 = (const void *)MEMORY[0x1DF0B488C](path1, &matrix);
  CGPathRelease(path1);
  CGPathRelease(path);
  CFRelease(cf);
  CFRelease(v34);
  return (CGPath *)CFAutorelease(v32);
}

- (void)_setTextFrameSize:(CGSize)a3
{
  self->__textFrameSize = a3;
}

- (CAShapeLayer)_scalableTextLayer
{
  return self->__scalableTextLayer;
}

- (BOOL)shouldShadowTitleText
{
  return self->_shouldShadowTitleText;
}

- (void)setFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_font, a3);
    -[CAMModeDialItem _updateScalableTextPathFromAttributedTitle](self, "_updateScalableTextPathFromAttributedTitle");
    v5 = v6;
  }

}

- (void)setShouldShadowTitleText:(BOOL)a3
{
  if (self->_shouldShadowTitleText != a3)
  {
    self->_shouldShadowTitleText = a3;
    -[CAMModeDialItem _updateScalableTextPathFromAttributedTitle](self, "_updateScalableTextPathFromAttributedTitle");
  }
}

- (void)tintColorDidChange
{
  CGColor *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  v3 = -[CAMModeDialItem _textColor](self, "_textColor");
  -[CAMModeDialItem _scalableTextLayer](self, "_scalableTextLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFillColor:", v3);

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (CGColor)_textColor
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  CGColor *v7;

  if (-[CAMModeDialItem isSelected](self, "isSelected"))
    -[CAMModeDialItem tintColor](self, "tintColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMModeDialItem traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColorWithTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  v7 = (CGColor *)objc_msgSend(v6, "CGColor");

  return v7;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  -[CAMModeDialItem setSelected:animated:](self, "setSelected:animated:", a3, 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  CGColor *v6;
  uint64_t v7;
  void *v8;
  float v9;
  void *v10;
  id v11;

  if (self->_selected != a3)
  {
    v4 = a4;
    self->_selected = a3;
    -[CAMModeDialItem _scalableTextLayer](self, "_scalableTextLayer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v6 = -[CAMModeDialItem _textColor](self, "_textColor");
    v7 = objc_msgSend(v11, "fillColor");
    objc_msgSend(v11, "setFillColor:", v6);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("fillColor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFromValue:", v7);
      UIAnimationDragCoefficient();
      objc_msgSend(v8, "setDuration:", v9 * 0.3331);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTimingFunction:", v10);

      objc_msgSend(v8, "setFillMode:", *MEMORY[0x1E0CD2B58]);
      objc_msgSend(v11, "addAnimation:forKey:", v8, CFSTR("colorAnimation"));

    }
  }
}

- (CGSize)_textFrameSize
{
  double width;
  double height;
  CGSize result;

  width = self->__textFrameSize.width;
  height = self->__textFrameSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMModeDialItem;
  -[CAMModeDialItem layoutSubviews](&v3, sel_layoutSubviews);
  -[CAMModeDialItem bounds](self, "bounds");
  -[CAShapeLayer setFrame:](self->__scalableTextLayer, "setFrame:");
}

- (CAMModeDialItem)initWithCoder:(id)a3
{
  CAMModeDialItem *v3;
  CAMModeDialItem *v4;
  CAMModeDialItem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMModeDialItem;
  v3 = -[CAMModeDialItem initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[CAMModeDialItem _commonCAMModeDialItemInitialization](v3, "_commonCAMModeDialItemInitialization");
    v5 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__scalableTextLayer, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
