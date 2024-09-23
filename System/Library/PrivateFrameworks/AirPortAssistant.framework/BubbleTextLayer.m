@implementation BubbleTextLayer

- (BubbleTextLayer)initWithOwningView:(id)a3
{
  BubbleTextLayer *v4;
  const char *v5;
  BubbleTextLayer *v6;
  const char *v7;
  CGColor *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  CGColorRef v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BubbleTextLayer;
  v4 = -[BubbleTextLayer init](&v17, sel_init);
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setOwningView_(v4, v5, (uint64_t)a3);
    objc_msgSend_setNeedsDisplayOnBoundsChange_(v6, v7, 1);
    v8 = sub_21A71CA30(0.0, 0.0, 0.0, 0.0);
    objc_msgSend_setFillColor_(v6, v9, (uint64_t)v8);
    CGColorRelease(v8);
    if (sub_21A731938(v10, v11, v12))
      v15 = 0;
    else
      v15 = sub_21A71CA30(1.0, 1.0, 1.0, 1.0);
    v6->_whiteShadowColor = v15;
    v6->_generalShadowColor = 0;
    objc_msgSend_setFontSize_(v6, v13, v14, 17.0);
  }
  return v6;
}

- (void)dealloc
{
  __CTLine *theLine;
  __CTFont *curCTFont;
  CGColor *generalShadowColor;
  CGColor *whiteShadowColor;
  objc_super v7;

  theLine = self->_theLine;
  if (theLine)
  {
    CFRelease(theLine);
    self->_theLine = 0;
  }
  curCTFont = self->_curCTFont;
  if (curCTFont)
  {
    CFRelease(curCTFont);
    self->_curCTFont = 0;
  }
  generalShadowColor = self->_generalShadowColor;
  if (generalShadowColor)
  {
    CFRelease(generalShadowColor);
    self->_generalShadowColor = 0;
  }
  whiteShadowColor = self->_whiteShadowColor;
  if (whiteShadowColor)
  {
    CFRelease(whiteShadowColor);
    self->_whiteShadowColor = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)BubbleTextLayer;
  -[BubbleTextLayer dealloc](&v7, sel_dealloc);
}

- (void)addAnnotationPoint:(CGPoint)a3
{
  CFDictionaryRef DictionaryRepresentation;
  const char *v5;
  const char *v6;
  uint64_t v7;

  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(a3);
  objc_msgSend_addObject_(self->_annotationPoints, v5, (uint64_t)DictionaryRepresentation);

  objc_msgSend_setNeedsLayout(self, v6, v7);
}

- (void)setOwningView:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  self->_owningView = a3;
  v4 = (void *)objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], a2, (uint64_t)a3);
  objc_msgSend_scale(v4, v5, v6);
  MEMORY[0x24BEDD108](self, sel_setContentsScale_, v7);
}

- (id)owningView
{
  return self->_owningView;
}

- (CGImage)image
{
  uint64_t v2;
  CGImage *result;

  result = (CGImage *)self->_leftImageLayer;
  if (result)
    return (CGImage *)objc_msgSend_contents(result, a2, v2);
  return result;
}

- (void)setImage:(CGImage *)a3
{
  CALayer *v5;
  const char *v6;
  void *v7;
  double v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  if (!self->_leftImageLayer)
  {
    v5 = (CALayer *)objc_msgSend_layer(MEMORY[0x24BDE56D0], a2, (uint64_t)a3);
    self->_leftImageLayer = v5;
    objc_msgSend_addSublayer_(self, v6, (uint64_t)v5);
  }
  objc_msgSend_begin(MEMORY[0x24BDE57D8], a2, (uint64_t)a3);
  v7 = (void *)MEMORY[0x24BDE57D8];
  LODWORD(v8) = 0;
  v11 = objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v9, v10, v8);
  objc_msgSend_setValue_forKey_(v7, v12, v11, *MEMORY[0x24BDE5DE8]);
  objc_msgSend_setContents_(self->_leftImageLayer, v13, (uint64_t)a3);
  objc_msgSend_setNeedsLayout(self, v14, v15);
  MEMORY[0x24BEDD108](MEMORY[0x24BDE57D8], sel_commit, v16);
}

- (CALayer)rightAccessoryLayer
{
  return self->_rightAccessoryLayer;
}

- (void)setRightAccessoryLayer:(id)a3
{
  CALayer *rightAccessoryLayer;
  BOOL v6;

  if (a3 && self->_rightAccessoryLayer != a3)
    objc_msgSend_addSublayer_(self, a2, (uint64_t)a3);
  rightAccessoryLayer = self->_rightAccessoryLayer;
  if (rightAccessoryLayer)
    v6 = rightAccessoryLayer == a3;
  else
    v6 = 1;
  if (!v6)
    objc_msgSend_removeFromSuperlayer(rightAccessoryLayer, a2, (uint64_t)a3);
  self->_rightAccessoryLayer = (CALayer *)a3;
  objc_msgSend_setNeedsLayout(self, a2, (uint64_t)a3);
}

- (void)setFont:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CFTypeID v9;
  const char *v10;
  uint64_t v11;
  CGFloat v12;
  __CTFont *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  CGFloat v18;
  __CTFont *v19;
  __CTFont *curCTFont;

  if (dword_2550F4828 <= 800)
  {
    if (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer setFont:]", 800, (uint64_t)"%@\n", v3, v4, v5, v6, (uint64_t)self);
    if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer setFont:]", 800, (uint64_t)"%@\n", v3, v4, v5, v6, (uint64_t)a3);
  }
  v9 = CFGetTypeID(a3);
  if (v9 == CGFontGetTypeID())
  {
    objc_msgSend_fontSize(self, v10, v11);
    v13 = CTFontCreateWithGraphicsFont((CGFontRef)a3, v12, 0, 0);
  }
  else if (v9 == CFStringGetTypeID())
  {
    objc_msgSend_fontSize(self, v16, v17);
    v13 = CTFontCreateWithName((CFStringRef)a3, v18, 0);
  }
  else
  {
    if (v9 != CTFontGetTypeID())
      return;
    v13 = (__CTFont *)CFRetain(a3);
  }
  v19 = v13;
  if (v13)
  {
    curCTFont = self->_curCTFont;
    if (curCTFont)
      CFRelease(curCTFont);
    self->_curCTFont = v19;
    objc_msgSend_setNeedsLayout(self, v14, v15);
  }
}

- (void)setBoundsSizeConstraint:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CGFloat height;
  CGFloat width;

  height = a3.height;
  width = a3.width;
  if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer setBoundsSizeConstraint:]", 800, (uint64_t)"%@  constraint = (w = %.2f h = %.2f)\n", v4, v5, v6, v7, (uint64_t)self);
  self->_boundsSizeConstraint.width = width;
  self->_boundsSizeConstraint.height = height;
  objc_msgSend_layoutSublayers(self, a2, v3);
}

- (CGSize)boundsSizeConstraint
{
  double width;
  double height;
  CGSize result;

  width = self->_boundsSizeConstraint.width;
  height = self->_boundsSizeConstraint.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)getImagePreferredSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGImage *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CGImage *v13;
  double Width;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  double Height;
  const char *v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGSize result;

  if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer getImagePreferredSize]", 800, (uint64_t)"%@\n", v3, v4, v5, v6, (uint64_t)self);
  v8 = (CGImage *)objc_msgSend_contents(self->_leftImageLayer, a2, v2);
  if (v8)
  {
    v13 = v8;
    Width = (double)CGImageGetWidth(v8);
    objc_msgSend_contentsScale(self, v15, v16);
    v18 = Width / v17;
    Height = (double)CGImageGetHeight(v13);
    objc_msgSend_contentsScale(self, v20, v21);
    v23 = Height / v22;
  }
  else
  {
    v18 = *MEMORY[0x24BDBF148];
    v23 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer getImagePreferredSize]", 800, (uint64_t)"image layer size w = %.1f h = %.1f\n", v9, v10, v11, v12, *(uint64_t *)&v18);
  v24 = v18;
  v25 = v23;
  result.height = v25;
  result.width = v24;
  return result;
}

- (CGSize)getRightAccessoryLayerPreferredSize
{
  uint64_t v2;
  CALayer *rightAccessoryLayer;
  double v4;
  double v5;
  CGSize result;

  rightAccessoryLayer = self->_rightAccessoryLayer;
  if (rightAccessoryLayer)
  {
    objc_msgSend_preferredFrameSize(rightAccessoryLayer, a2, v2);
  }
  else
  {
    v4 = *MEMORY[0x24BDBF148];
    v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)isAnnotationBubble
{
  uint64_t v2;
  NSMutableArray *annotationPoints;

  annotationPoints = self->_annotationPoints;
  if (annotationPoints)
    LOBYTE(annotationPoints) = objc_msgSend_count(annotationPoints, a2, v2) != 0;
  return (char)annotationPoints;
}

- (CGSize)textPreferredFrameSizeForLayerSize:(CGSize)a3
{
  uint64_t v3;
  double height;
  double width;
  char isKindOfClass;
  const char *v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  __CTLine *theLine;
  const __CFAttributedString *v13;
  id v14;
  __CTFont *curCTFont;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const __CFDictionary *v21;
  const char *v22;
  uint64_t v23;
  const __CFString *v24;
  const __CFAttributedString *v25;
  __CTLine *v26;
  id v28;
  __CTFont *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const __CFDictionary *v35;
  const __CFAttributedString *v36;
  const __CTLine *v37;
  __CTLine *TruncatedLine;
  __CTLine *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  float TypographicBounds;
  uint64_t v45;
  float v46;
  double v47;
  double v48;
  double v49;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend_string(self, a2, v3);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = (uint64_t *)MEMORY[0x24BDC4C28];
  v11 = (_QWORD *)MEMORY[0x24BDC4EE0];
  if ((isKindOfClass & 1) != 0)
  {
    theLine = self->_theLine;
    if (theLine)
      CFRelease(theLine);
    v13 = (const __CFAttributedString *)objc_msgSend_string(self, v8, v9);
    self->_theLine = CTLineCreateWithAttributedString(v13);
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x24BDBCE70]);
    curCTFont = self->_curCTFont;
    v16 = *v10;
    v19 = objc_msgSend_foregroundColor(self, v17, v18);
    v21 = (const __CFDictionary *)objc_msgSend_initWithObjectsAndKeys_(v14, v20, (uint64_t)curCTFont, v16, v19, *v11, 0);
    v24 = (const __CFString *)objc_msgSend_string(self, v22, v23);
    v25 = CFAttributedStringCreate(0, v24, v21);
    v26 = self->_theLine;
    if (v26)
      CFRelease(v26);
    self->_theLine = CTLineCreateWithAttributedString(v25);
    CFRelease(v21);
    CFRelease(v25);
  }
  if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    TruncatedLine = self->_theLine;
  }
  else
  {
    v28 = objc_alloc(MEMORY[0x24BDBCE70]);
    v29 = self->_curCTFont;
    v30 = *v10;
    v33 = objc_msgSend_foregroundColor(self, v31, v32);
    v35 = (const __CFDictionary *)objc_msgSend_initWithObjectsAndKeys_(v28, v34, (uint64_t)v29, v30, v33, *v11, 0);
    v36 = CFAttributedStringCreate(0, CFSTR("…"), v35);
    v37 = CTLineCreateWithAttributedString(v36);
    TruncatedLine = CTLineCreateTruncatedLine(self->_theLine, width, kCTLineTruncationMiddle, v37);
    if (v35)
      CFRelease(v35);
    if (v36)
      CFRelease(v36);
    if (v37)
      CFRelease(v37);
    v39 = self->_theLine;
    if (v39)
      CFRelease(v39);
    self->_theLine = TruncatedLine;
  }
  TypographicBounds = CTLineGetTypographicBounds(TruncatedLine, &self->_ascent, &self->_descent, &self->_leading);
  *(double *)&v45 = ceilf(TypographicBounds);
  v46 = self->_ascent + self->_descent;
  v47 = ceilf(v46);
  if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer textPreferredFrameSizeForLayerSize:]", 800, (uint64_t)"width = %.2f  height = %.2f  ascent = %.2f  descent = %.2f  leading = %.2f\n", v40, v41, v42, v43, v45);
  v48 = *(double *)&v45;
  v49 = v47;
  result.height = v49;
  result.width = v48;
  return result;
}

- (CGSize)calculatePreferredSubframeSizes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t *p_leftImageLayerSize;
  const char *v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t *p_rightAccessoryLayerSize;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double v25;
  CGSize *p_textSize;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double width;
  CGFloat v34;
  double v35;
  double height;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float v43;
  double v44;
  float v45;
  double v46;
  uint64_t v47;
  CGSize result;

  if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer calculatePreferredSubframeSizes]", 800, (uint64_t)"\n", v3, v4, v5, v6, v47);
  objc_msgSend_boundsSizeConstraint(self, a2, v2);
  v9 = v8;
  v11 = v10;
  p_leftImageLayerSize = (uint64_t *)&self->_leftImageLayerSize;
  objc_msgSend_getImagePreferredSize(self, v13, v14);
  self->_leftImageLayerSize.width = v15;
  self->_leftImageLayerSize.height = v16;
  p_rightAccessoryLayerSize = (uint64_t *)&self->_rightAccessoryLayerSize;
  objc_msgSend_getRightAccessoryLayerPreferredSize(self, v18, v19);
  self->_rightAccessoryLayerSize.width = v22;
  self->_rightAccessoryLayerSize.height = v23;
  if (v9 != *MEMORY[0x24BDBF148] || v11 != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    if (self->_leftImageLayer)
      v9 = v9 - (*(double *)p_leftImageLayerSize + 7.0);
    v25 = v22 + 7.0;
    if (!self->_rightAccessoryLayer)
      v25 = 0.0;
    v9 = v9 - v25 + -16.0;
  }
  p_textSize = &self->_textSize;
  objc_msgSend_textPreferredFrameSizeForLayerSize_(self, v20, v21, v9, v11);
  self->_textSize.width = width;
  self->_textSize.height = v34;
  if (dword_2550F4828 <= 800)
  {
    if (dword_2550F4828 == -1)
    {
      if (!sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u))
        goto LABEL_19;
      width = p_textSize->width;
    }
    sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer calculatePreferredSubframeSizes]", 800, (uint64_t)"text area size w = %.1f h = %.1f\n", v29, v30, v31, v32, *(uint64_t *)&width);
LABEL_19:
    if (dword_2550F4828 <= 800)
    {
      if (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u))
        sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer calculatePreferredSubframeSizes]", 800, (uint64_t)"image layer size w = %.1f h = %.1f\n", v29, v30, v31, v32, *p_leftImageLayerSize);
      if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer calculatePreferredSubframeSizes]", 800, (uint64_t)"right accessory layer size w = %.1f h = %.1f\n", v29, v30, v31, v32, *p_rightAccessoryLayerSize);
    }
  }
  v35 = p_textSize->width;
  if (self->_leftImageLayer)
    v35 = v35 + *(double *)p_leftImageLayerSize + 7.0;
  if (self->_rightAccessoryLayer)
    v35 = v35 + *(double *)p_rightAccessoryLayerSize + 7.0;
  height = self->_textSize.height;
  self->_contentSize.width = v35;
  self->_contentSize.height = height;
  v37 = height + 12.0;
  v38 = v35 + 16.0;
  if (objc_msgSend_isAnnotationBubble(self, v27, v28))
    v37 = v37 + 16.0;
  if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer calculatePreferredSubframeSizes]", 800, (uint64_t)"final bubble size w = %.1f h = %.1f\n", v39, v40, v41, v42, *(uint64_t *)&v38);
  self->_bubbleSize.width = v38;
  self->_bubbleSize.height = v37;
  v43 = v37 + 4.0;
  v44 = ceilf(v43);
  v45 = v38 + 2.0;
  v46 = ceilf(v45);
  result.height = v44;
  result.width = v46;
  return result;
}

- (CGSize)preferredFrameSize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v8;
  double v9;
  uint64_t v10;
  CGSize result;

  if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer preferredFrameSize]", 800, (uint64_t)"\n", v3, v4, v5, v6, v10);
  objc_msgSend_calculatePreferredSubframeSizes(self, a2, v2);
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGRect)textFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_textFrame.origin.x;
  y = self->_textFrame.origin.y;
  width = self->_textFrame.size.width;
  height = self->_textFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)textBaselineOffset
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;

  result = 0.0;
  if (self->_textSize.width != *MEMORY[0x24BDBF148] || self->_textSize.height != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer textBaselineOffset]", 800, (uint64_t)"returning %.2f\n", v2, v3, v4, v5, *(_QWORD *)&self->_ascent);
    return self->_ascent;
  }
  return result;
}

- (void)layoutSublayers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v33;
  uint64_t v34;
  double v35;
  double v36;
  const char *v37;
  uint64_t v38;
  CGSize bubbleSize;
  double v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  double v45;
  float v46;
  double v47;
  uint64_t *p_textFrame;
  double v49;
  double v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  double height;
  CGFloat width;
  double v61;
  float v62;
  double v63;
  float v64;
  uint64_t v65;
  float v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  const char *v74;
  uint64_t v75;
  CGFloat MaxY;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  CGRect v83;
  CGRect v84;

  if (dword_2550F4828 <= 800)
  {
    if (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u))
      sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"%@\n", v3, v4, v5, v6, (uint64_t)self);
    if (dword_2550F4828 <= 800)
    {
      if (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u))
      {
        objc_msgSend_frame(self, a2, v2);
        v9 = v8;
        objc_msgSend_frame(self, v10, v11);
        objc_msgSend_frame(self, v12, v13);
        objc_msgSend_frame(self, v14, v15);
        sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"bubble layer frame=(x = %.1f, y = %.1f, w = %.1f, h = %.1f)\n", v16, v17, v18, v19, v9);
      }
      if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
      {
        objc_msgSend_boundsSizeConstraint(self, a2, v2);
        v21 = v20;
        objc_msgSend_boundsSizeConstraint(self, v22, v23);
        sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"constraint = (w = %.2f h = %.2f)\n", v24, v25, v26, v27, v21);
      }
    }
  }
  objc_msgSend_frame(self, a2, v2);
  if (v31 != *MEMORY[0x24BDBF148] || v30 != *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    objc_msgSend_calculatePreferredSubframeSizes(self, v28, v29);
    objc_msgSend_bounds(self, v33, v34);
    v36 = v35;
    objc_msgSend_bounds(self, v37, v38);
    self->_bubbleFrame.origin.y = 0.0;
    bubbleSize = self->_bubbleSize;
    self->_bubbleFrame.origin.x = ceil(v36 + (v40 - bubbleSize.width) * 0.5);
    self->_bubbleFrame.size = bubbleSize;
    objc_msgSend_bounds(self, v41, v42);
    v46 = (v45 - self->_contentSize.width) * 0.5;
    v47 = floorf(v46);
    p_textFrame = (uint64_t *)&self->_textFrame;
    self->_textFrame.origin.x = v47;
    if (self->_leftImageLayer)
      *(double *)p_textFrame = self->_leftImageLayerSize.width + 7.0 + -1.0 + v47;
    objc_msgSend_bounds(self, v43, v44);
    v50 = v49 - self->_ascent;
    objc_msgSend_bounds(self, v51, v52);
    width = self->_textSize.width;
    height = self->_textSize.height;
    v62 = v50 + (v61 - height) * -0.5;
    self->_textFrame.origin.y = ceilf(v62);
    self->_textFrame.size.width = width;
    self->_textFrame.size.height = height;
    if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
      sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"_textFrame placed at frame=(x = %.1f, y = %.1f, w = %.1f, h = %.1f)\n", v55, v56, v57, v58, *p_textFrame);
    if (self->_leftImageLayer)
    {
      objc_msgSend_bounds(self, v53, v54);
      v64 = (v63 - self->_contentSize.width) * 0.5;
      *(double *)&v65 = ceilf(v64);
      v66 = (self->_bubbleSize.height - self->_leftImageLayerSize.height) * 0.5;
      objc_msgSend_setFrame_(self->_leftImageLayer, v67, v68, *(double *)&v65, ceilf(v66), self->_leftImageLayerSize.width, self->_leftImageLayerSize.height);
      if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"_leftImageLayer placed at frame=(x = %.1f, y = %.1f, w = %.1f, h = %.1f)\n", v69, v70, v71, v72, v65);
    }
    if (self->_rightAccessoryLayer)
    {
      *(_QWORD *)&v83.origin.x = *p_textFrame;
      v83.origin.y = self->_textFrame.origin.y;
      v83.size.width = self->_textFrame.size.width;
      v83.size.height = self->_textFrame.size.height;
      v73 = CGRectGetMaxX(v83) + 7.0;
      objc_msgSend_bounds(self, v74, v75);
      MaxY = CGRectGetMaxY(v84);
      objc_msgSend_setFrame_(self->_rightAccessoryLayer, v77, v78, v73, MaxY - self->_rightAccessoryLayerSize.height, self->_rightAccessoryLayerSize.width, self->_rightAccessoryLayerSize.height);
      if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
        sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer layoutSublayers]", 800, (uint64_t)"_rightAccessoryLayer placed at frame=(x = %.1f, y = %.1f, w = %.1f, h = %.1f)\n", v79, v80, v81, v82, *(uint64_t *)&v73);
    }
    objc_msgSend_setNeedsDisplay(self, v53, v54);
  }
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v9;
  uint64_t v10;
  CGColor *generalShadowColor;
  CGRect *p_bubbleFrame;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  CGColorSpace *DeviceRGB;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const __CFArray *v26;
  CGGradient *v27;
  CGFloat MidX;
  CGFloat v29;
  CGColor *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  CGFloat v38;
  const char *v39;
  uint64_t v40;
  CGColor *v41;
  const char *v42;
  uint64_t v43;
  CGFloat v44;
  CGColor *v45;
  CGColor *whiteShadowColor;
  uint64_t v47;
  CGSize v48;
  CGPoint v49;
  CGSize v50;
  CGSize v51;
  CGSize v52;
  CGSize v53;
  CGPoint v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  if (dword_2550F4828 <= 800 && (dword_2550F4828 != -1 || sub_21A69876C((uint64_t)&dword_2550F4828, 0x320u)))
    sub_21A698FDC((uint64_t)&dword_2550F4828, (uint64_t)"-[BubbleTextLayer drawInContext:]", 800, (uint64_t)"\n", v3, v4, v5, v6, v47);
  CGContextSaveGState(a3);
  if (objc_msgSend_isAnnotationBubble(self, v9, v10))
    sub_21A71CC08(a3, self->_bubbleFrame.origin.x, self->_bubbleFrame.origin.y, self->_bubbleFrame.size.width, self->_bubbleFrame.size.height, self->_bubbleFrame.size.height * 0.5, 16.0);
  else
    sub_21A71CE0C(a3, self->_bubbleFrame.origin.x, self->_bubbleFrame.origin.y, self->_bubbleFrame.size.width, self->_bubbleFrame.size.height, self->_bubbleFrame.size.height * 0.5);
  CGContextClosePath(a3);
  generalShadowColor = self->_generalShadowColor;
  if (generalShadowColor)
  {
    v48.width = 0.0;
    v48.height = 1.0;
    CGContextSetShadowWithColor(a3, v48, 1.0, generalShadowColor);
  }
  p_bubbleFrame = &self->_bubbleFrame;
  CGContextBeginTransparencyLayerWithRect(a3, self->_bubbleFrame, 0);
  if (objc_msgSend_fillColor(self, v13, v14) && objc_msgSend_fillColor2(self, v15, v16))
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v18 = (void *)MEMORY[0x24BDBCE30];
    v21 = objc_msgSend_fillColor(self, v19, v20);
    v24 = objc_msgSend_fillColor2(self, v22, v23);
    v26 = (const __CFArray *)objc_msgSend_arrayWithObjects_(v18, v25, v21, v24, 0);
    v27 = CGGradientCreateWithColors(DeviceRGB, v26, 0);
    CGContextClip(a3);
    v55.origin.x = p_bubbleFrame->origin.x;
    v55.origin.y = self->_bubbleFrame.origin.y;
    v55.size.width = self->_bubbleFrame.size.width;
    v55.size.height = self->_bubbleFrame.size.height;
    MidX = CGRectGetMidX(v55);
    v56.origin.x = p_bubbleFrame->origin.x;
    v56.origin.y = self->_bubbleFrame.origin.y;
    v56.size.width = self->_bubbleFrame.size.width;
    v56.size.height = self->_bubbleFrame.size.height;
    v29 = CGRectGetMidX(v56);
    v57.origin.x = p_bubbleFrame->origin.x;
    v57.origin.y = self->_bubbleFrame.origin.y;
    v57.size.width = self->_bubbleFrame.size.width;
    v57.size.height = self->_bubbleFrame.size.height;
    v54.y = CGRectGetMaxY(v57);
    v49.y = 0.0;
    v49.x = MidX;
    v54.x = v29;
    CGContextDrawLinearGradient(a3, v27, v49, v54, 0);
    CGGradientRelease(v27);
    CGColorSpaceRelease(DeviceRGB);
  }
  else
  {
    v30 = (CGColor *)objc_msgSend_fillColor(self, v15, v16);
    CGContextSetFillColorWithColor(a3, v30);
    CGContextDrawPath(a3, kCGPathFill);
  }
  CGContextEndTransparencyLayer(a3);
  v50.width = 0.0;
  v50.height = 0.0;
  CGContextSetShadowWithColor(a3, v50, 0.0, 0);
  objc_msgSend_frameWidth(self, v31, v32);
  if (v35 != 0.0 && objc_msgSend_frameColor(self, v33, v34))
  {
    objc_msgSend_frameWidth(self, v36, v37);
    CGContextSetLineWidth(a3, v38);
    v41 = (CGColor *)objc_msgSend_frameColor(self, v39, v40);
    CGContextSetStrokeColorWithColor(a3, v41);
    CGContextDrawPath(a3, kCGPathStroke);
  }
  CGContextSetShouldSmoothFonts(a3, 0);
  CGContextSetAllowsFontSmoothing(a3, 0);
  CGContextSetTextPosition(a3, self->_textFrame.origin.x, self->_textFrame.origin.y);
  objc_msgSend_bounds(self, v42, v43);
  CGContextTranslateCTM(a3, 0.0, v44);
  CGContextScaleCTM(a3, 1.0, -1.0);
  v45 = self->_generalShadowColor;
  if (v45)
  {
    v51.width = 0.0;
    v51.height = -1.0;
    CGContextSetShadowWithColor(a3, v51, 1.0, v45);
  }
  whiteShadowColor = self->_whiteShadowColor;
  if (whiteShadowColor)
  {
    v52.width = 0.0;
    v52.height = 1.0;
    CGContextSetShadowWithColor(a3, v52, 0.0, whiteShadowColor);
  }
  CTLineDraw(self->_theLine, a3);
  v53.width = 0.0;
  v53.height = 0.0;
  CGContextSetShadowWithColor(a3, v53, 0.0, 0);
  CGContextRestoreGState(a3);
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  objc_super v12;

  if ((objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("foregroundColor")) & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v5, (uint64_t)CFSTR("fillColor")) & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("fillColor2")) & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v7, (uint64_t)CFSTR("frameColor")) & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v8, (uint64_t)CFSTR("frameWidth")) & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v9, (uint64_t)CFSTR("fontSize")) & 1) != 0
    || (objc_msgSend_isEqualToString_(a3, v10, (uint64_t)CFSTR("string")) & 1) != 0)
  {
    return 1;
  }
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___BubbleTextLayer;
  return objc_msgSendSuper2(&v12, sel_needsDisplayForKey_, a3);
}

@end
