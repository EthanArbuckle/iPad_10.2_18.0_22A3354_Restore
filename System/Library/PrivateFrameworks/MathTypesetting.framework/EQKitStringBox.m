@implementation EQKitStringBox

- (EQKitStringBox)initWithAttributedString:(id)a3 cgColor:(CGColor *)a4
{
  id v6;
  EQKitStringBox *v7;
  uint64_t v8;
  NSAttributedString *attributedString;
  CGColor *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EQKitStringBox;
  v7 = -[EQKitStringBox init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    attributedString = v7->_attributedString;
    v7->_attributedString = (NSAttributedString *)v8;

    if (a4)
      v10 = (CGColor *)CFRetain(a4);
    else
      v10 = 0;
    v7->_cgColor = v10;
  }

  return v7;
}

- (void)dealloc
{
  __CTLine *line;
  objc_super v4;

  line = self->_line;
  if (line)
    CFRelease(line);
  CGColorRelease(self->_cgColor);
  v4.receiver = self;
  v4.super_class = (Class)EQKitStringBox;
  -[EQKitStringBox dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[EQKitStringBox attributedString](self, "attributedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAttributedString:cgColor:", v5, self->_cgColor);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  EQKitStringBox *v4;
  EQKitStringBox *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v4 = (EQKitStringBox *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    if (-[EQKitStringBox isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[EQKitStringBox attributedString](self, "attributedString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EQKitStringBox attributedString](v5, "attributedString");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v6 == (void *)v7)
        goto LABEL_7;
      v9 = 0;
      if (!v6 || !v7)
        goto LABEL_11;
      if (objc_msgSend(v6, "isEqualToAttributedString:", v7))
LABEL_7:
        v9 = CGColorEqualToColor(-[EQKitStringBox color](self, "color"), -[EQKitStringBox color](v5, "color"));
      else
        v9 = 0;
LABEL_11:

      goto LABEL_12;
    }
    v9 = 0;
  }
LABEL_12:

  return v9;
}

- (void)p_ensureDimensionsAreValid
{
  if (!self->_dimensionsValid)
  {
    -[EQKitStringBox p_cacheDimensions](self, "p_cacheDimensions");
    self->_dimensionsValid = 1;
  }
}

- (double)height
{
  -[EQKitStringBox p_ensureDimensionsAreValid](self, "p_ensureDimensionsAreValid");
  return self->_height;
}

- (double)depth
{
  -[EQKitStringBox p_ensureDimensionsAreValid](self, "p_ensureDimensionsAreValid");
  return self->_depth;
}

- (double)width
{
  -[EQKitStringBox p_ensureDimensionsAreValid](self, "p_ensureDimensionsAreValid");
  return self->_width;
}

- (CGRect)erasableBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  -[EQKitStringBox p_ensureDimensionsAreValid](self, "p_ensureDimensionsAreValid");
  x = self->_erasableBounds.origin.x;
  y = self->_erasableBounds.origin.y;
  width = self->_erasableBounds.size.width;
  height = self->_erasableBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (__CTLine)line
{
  __CTLine *result;
  const __CFAttributedString *v4;

  result = self->_line;
  if (!result)
  {
    -[EQKitStringBox attributedString](self, "attributedString");
    v4 = (const __CFAttributedString *)objc_claimAutoreleasedReturnValue();
    self->_line = CTLineCreateWithAttributedString(v4);

    return self->_line;
  }
  return result;
}

- (void)renderIntoContext:(id)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  CGContext *v8;
  __CTLine *v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  objc_super v13;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EQKitStringBox;
  -[EQKitBox renderIntoContext:offset:](&v13, sel_renderIntoContext_offset_, v7, x, y);
  v8 = (CGContext *)objc_msgSend(v7, "cgContext");
  if (v8)
  {
    v9 = -[EQKitStringBox line](self, "line");
    if (v9)
    {
      if (self->_cgColor)
      {
        CGContextSaveGState(v8);
        CGContextSetFillColorWithColor(v8, self->_cgColor);
      }
      memset(&v12, 0, sizeof(v12));
      CGContextGetTextMatrix(&v12, v8);
      CGAffineTransformMakeScale(&v11, 1.0, -1.0);
      CGContextSetTextMatrix(v8, &v11);
      CGContextSetTextPosition(v8, x, y);
      CTLineDraw(v9, v8);
      v10 = v12;
      CGContextSetTextMatrix(v8, &v10);
      if (self->_cgColor)
        CGContextRestoreGState(v8);
    }
  }

}

- (double)positionOfCharacterAtIndex:(unint64_t)a3
{
  __CTLine *v5;
  const __CTLine *v6;
  void *v7;
  unint64_t v8;

  v5 = -[EQKitStringBox line](self, "line");
  if (v5
    && (v6 = v5,
        -[EQKitStringBox attributedString](self, "attributedString"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "length"),
        v7,
        v8 >= a3))
  {
    return CTLineGetOffsetForStringIndex(v6, a3, 0);
  }
  else
  {
    return 0.0;
  }
}

- (BOOL)p_appendEntryToSpec:(void *)a3 run:(__CTRun *)a4 glyphRange:(id)a5 offset:(CGPoint)a6
{
  double y;
  double x;
  CFIndex var1;
  CFIndex var0;
  const __CFDictionary *Attributes;
  const __CFDictionary *v13;
  const __CTFont *Value;
  CGPoint v16;
  CGGlyph buffer;
  CFRange v18;
  CGPoint v19;

  y = a6.y;
  x = a6.x;
  var1 = a5.var1;
  var0 = a5.var0;
  buffer = 0;
  CTRunGetGlyphs(a4, (CFRange)a5, &buffer);
  Attributes = CTRunGetAttributes(a4);
  v13 = Attributes;
  if (Attributes)
  {
    Value = (const __CTFont *)CFDictionaryGetValue(Attributes, (const void *)*MEMORY[0x24BDC4C28]);
    v18.location = var0;
    v18.length = var1;
    CTRunGetPositions(a4, v18, &v16);
    v19.x = x + v16.x;
    v19.y = y + v16.y;
    EQKit::OpticalKern::Spec::appendEntry((EQKit::OpticalKern::Spec *)a3, v19, Value, buffer);
  }
  return v13 != 0;
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  double y;
  double x;
  const __CFArray *GlyphRuns;
  CFIndex Count;
  int v10;
  const __CTRun *v11;
  EQKitStringBox *v12;
  void *v13;
  const __CTRun *v14;
  CFIndex v15;
  const __CTRun *ValueAtIndex;
  CFIndex GlyphCount;

  y = a4.y;
  x = a4.x;
  GlyphRuns = CTLineGetGlyphRuns(-[EQKitStringBox line](self, "line"));
  Count = CFArrayGetCount(GlyphRuns);
  if (Count)
  {
    v10 = *((_DWORD *)a3 + 6);
    if (v10 == 2)
    {
      ValueAtIndex = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, Count - 1);
      GlyphCount = CTRunGetGlyphCount(ValueAtIndex);
      v15 = GlyphCount - 1;
      if (GlyphCount >= 1)
      {
        v12 = self;
        v13 = a3;
        v14 = ValueAtIndex;
        return -[EQKitStringBox p_appendEntryToSpec:run:glyphRange:offset:](v12, "p_appendEntryToSpec:run:glyphRange:offset:", v13, v14, v15, 1, x, y);
      }
    }
    else if (!v10)
    {
      v11 = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, 0);
      if (CTRunGetGlyphCount(v11) >= 1)
      {
        v12 = self;
        v13 = a3;
        v14 = v11;
        v15 = 0;
        return -[EQKitStringBox p_appendEntryToSpec:run:glyphRange:offset:](v12, "p_appendEntryToSpec:run:glyphRange:offset:", v13, v14, v15, 1, x, y);
      }
    }
  }
  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[EQKitStringBox height](self, "height");
  v6 = v5;
  -[EQKitStringBox depth](self, "depth");
  v8 = v7;
  -[EQKitStringBox width](self, "width");
  v10 = v9;
  -[EQKitStringBox attributedString](self, "attributedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: height=%f depth=%f width=%f attributedString=%@"), v4, self, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)p_cacheDimensions
{
  CGRect *p_erasableBounds;
  CGSize v4;
  __CTLine *v5;
  const __CTLine *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxY;
  double MinY;
  double TypographicBounds;
  CGFloat MinX;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect ImageBounds;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  self->_height = 0.0;
  self->_depth = 0.0;
  self->_width = 0.0;
  p_erasableBounds = &self->_erasableBounds;
  v4 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->_erasableBounds.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->_erasableBounds.size = v4;
  v5 = -[EQKitStringBox line](self, "line");
  if (v5)
  {
    v6 = v5;
    ImageBounds = CTLineGetImageBounds(v5, 0);
    x = ImageBounds.origin.x;
    y = ImageBounds.origin.y;
    width = ImageBounds.size.width;
    height = ImageBounds.size.height;
    MaxY = CGRectGetMaxY(ImageBounds);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    MinY = CGRectGetMinY(v19);
    TypographicBounds = CTLineGetTypographicBounds(v6, 0, 0, 0);
    if (TypographicBounds > 0.0)
    {
      self->_height = MaxY;
      self->_depth = -MinY;
      self->_width = TypographicBounds;
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      MinX = CGRectGetMinX(v20);
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      v15 = -CGRectGetMaxY(v21);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      v16 = CGRectGetWidth(v22);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v17 = CGRectGetHeight(v23);
      p_erasableBounds->origin.x = MinX;
      p_erasableBounds->origin.y = v15;
      p_erasableBounds->size.width = v16;
      p_erasableBounds->size.height = v17;
    }
  }
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (CGColor)color
{
  return self->_cgColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
