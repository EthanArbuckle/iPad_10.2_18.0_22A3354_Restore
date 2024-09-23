@implementation _EMKTextLayoutFragmentView

- (_EMKTextLayoutFragmentView)initWithFrame:(CGRect)a3 layoutFragment:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  _EMKTextLayoutFragmentView *v11;
  _EMKTextLayoutFragmentView *v12;
  EMKGlyphRippler *rippler;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)_EMKTextLayoutFragmentView;
  v11 = -[_EMKTextLayoutFragmentView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_layoutFragment, a4);
    rippler = v12->_rippler;
    v12->_rippler = 0;

    v12->_timeIndex = 0;
    v12->_animatingGlyphCount = 0;
    v12->_animatingGlyphCountBeforeFragment = 0;
    -[_EMKTextLayoutFragmentView setContentMode:](v12, "setContentMode:", 3);
    -[_EMKTextLayoutFragmentView setClipsToBounds:](v12, "setClipsToBounds:", 1);
    -[_EMKTextLayoutFragmentView layer](v12, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMasksToBounds:", 1);

  }
  return v12;
}

- (void)startAnimationWithRippler:(id)a3 animatingGlyphCount:(unint64_t)a4 animatingGlyphCountBefore:(unint64_t)a5
{
  id v7;

  self->_timeIndex = 0;
  self->_animatingGlyphCountBeforeFragment = a5;
  v7 = a3;
  -[_EMKTextLayoutFragmentView setAnimatingGlyphCount:](self, "setAnimatingGlyphCount:", a4);
  -[_EMKTextLayoutFragmentView setRippler:](self, "setRippler:", v7);

}

- (void)updateWithTimeIndex:(unint64_t)a3
{
  self->_timeIndex = a3;
  -[_EMKTextLayoutFragmentView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  NSTextLayoutFragment *layoutFragment;
  void *v5;
  void *v6;
  void *v7;
  unint64_t animatingGlyphCountBeforeFragment;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)_EMKTextLayoutFragmentView;
  -[_EMKTextLayoutFragmentView drawRect:](&v20, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  layoutFragment = self->_layoutFragment;
  if (layoutFragment)
  {
    -[NSTextLayoutFragment textLayoutManager](layoutFragment, "textLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && self->_rippler)
    {
      objc_msgSend(v5, "documentRange");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ensureLayoutForRange:", v7);
      animatingGlyphCountBeforeFragment = self->_animatingGlyphCountBeforeFragment;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      -[NSTextLayoutFragment textLineFragments](self->_layoutFragment, "textLineFragments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
            v15 = 0;
            -[_EMKTextLayoutFragmentView _drawTextLineFragment:animatingGlyphCountBefore:drawnGlyphCount:](self, "_drawTextLineFragment:animatingGlyphCountBefore:drawnGlyphCount:", v14, animatingGlyphCountBeforeFragment, &v15);
            animatingGlyphCountBeforeFragment += v15;
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v11);
      }

    }
  }
}

- (void)_drawTextLineFragment:(id)a3 animatingGlyphCountBefore:(int64_t)a4 drawnGlyphCount:(int64_t *)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double MinX;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = objc_retainAutorelease(a3);
  CTLineGetGlyphRuns((CTLineRef)objc_msgSend(v8, "lineRef"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "glyphOrigin");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v8, "typographicBounds");
  x = v36.origin.x;
  y = v36.origin.y;
  width = v36.size.width;
  height = v36.size.height;
  MinY = CGRectGetMinY(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  MinX = CGRectGetMinX(v37);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v9;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    v24 = v11 + MinX;
    v25 = v13 + MinY;
    v26 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(v20);
        v28 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v29 = 0;
        -[_EMKTextLayoutFragmentView __drawAnimatingEmojiRun:textPosition:animatingGlyphCountBefore:drawnRunGlyphCount:](self, "__drawAnimatingEmojiRun:textPosition:animatingGlyphCountBefore:drawnRunGlyphCount:", v28, v23 + a4, &v29, v24, v25);
        v23 += v29;
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v22);
  }
  else
  {
    v23 = 0;
  }

  *a5 = v23;
}

- (void)__drawAnimatingEmojiRun:(__CTRun *)a3 textPosition:(CGPoint)a4 animatingGlyphCountBefore:(int64_t)a5 drawnRunGlyphCount:(int64_t *)a6
{
  double y;
  double x;
  const __CFDictionary *Attributes;
  const void *Value;
  CFIndex GlyphCount;
  CGPoint *v15;
  CGGlyph *v16;
  CGGlyph *v17;
  double *p_y;
  unsigned int v19;
  double v20;
  double v21;
  _EMKGlyphRenderingAttributes *v22;
  CGGlyph *v23;
  CGPoint *v24;
  CFRange v25;
  CFRange v26;

  y = a4.y;
  x = a4.x;
  if (_EMKShouldDrawCTRun(a3))
  {
    Attributes = CTRunGetAttributes(a3);
    Value = CFDictionaryGetValue(Attributes, (const void *)*MEMORY[0x1E0CA8188]);
    GlyphCount = CTRunGetGlyphCount(a3);
    v15 = (CGPoint *)malloc_type_calloc(GlyphCount, 0x10uLL, 0x1000040451B5BE8uLL);
    v16 = (CGGlyph *)malloc_type_calloc(GlyphCount, 2uLL, 0x1000040BDFB0063uLL);
    v25.location = 0;
    v25.length = 0;
    v23 = v16;
    CTRunGetGlyphs(a3, v25, v16);
    v26.location = 0;
    v26.length = 0;
    v24 = v15;
    CTRunGetPositions(a3, v26, v15);
    *a6 = GlyphCount;
    if (GlyphCount >= 1)
    {
      v17 = v23;
      p_y = &v24->y;
      do
      {
        v19 = *v17++;
        v20 = *(p_y - 1);
        v21 = *p_y;
        v22 = -[_EMKGlyphRenderingAttributes initWithValuesFromRippler:timeIndex:glyphIndex:numberOfGlyphs:]([_EMKGlyphRenderingAttributes alloc], "initWithValuesFromRippler:timeIndex:glyphIndex:numberOfGlyphs:", self->_rippler, self->_timeIndex, a5, self->_animatingGlyphCount);
        -[_EMKTextLayoutFragmentView ___drawAnimatingEmojiGlyph:textPosition:glyphPosition:font:attributes:](self, "___drawAnimatingEmojiGlyph:textPosition:glyphPosition:font:attributes:", v19, Value, v22, x, y, v20, v21);

        ++a5;
        p_y += 2;
        --GlyphCount;
      }
      while (GlyphCount);
    }
    free(v23);
    free(v24);
  }
  else
  {
    *a6 = 0;
  }
}

- (void)___drawAnimatingEmojiGlyph:(unsigned __int16)a3 textPosition:(CGPoint)a4 glyphPosition:(CGPoint)a5 font:(__CTFont *)a6 attributes:(id)a7
{
  CGFloat y;
  double x;
  CGFloat v10;
  CGFloat v11;
  id v13;
  CGContext *CurrentContext;
  double Size;
  double v16;
  CGFloat v17;
  const __CTFont *CopyWithAttributes;
  id v19;
  CGColorSpace *ColorSpace;
  id v21;
  id v22;
  void *v23;
  CGPoint v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGGlyph glyphs;
  CGRect v29;

  y = a5.y;
  x = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  glyphs = a3;
  v13 = a7;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  Size = CTFontGetSize(a6);
  objc_msgSend(v13, "scale");
  v17 = Size * v16;
  CopyWithAttributes = CTFontCreateCopyWithAttributes(a6, v17, 0, 0);
  objc_msgSend(v13, "color");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v19, "CGColor"));
  CGContextSetStrokeColorSpace(CurrentContext, ColorSpace);
  CGContextSetFillColorSpace(CurrentContext, ColorSpace);
  v21 = objc_retainAutorelease(v19);
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v21, "CGColor"));
  v22 = objc_retainAutorelease(v21);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v22, "CGColor"));
  objc_msgSend(v13, "shadowIfNeededForFontPointSize:", v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "applyToGraphicsContext_emk:", CurrentContext);
  memset(&v27, 0, sizeof(v27));
  CGContextGetTextMatrix(&v27, CurrentContext);
  v25 = v27;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformScale(&v26, &v25, 1.0, -1.0);
  v25 = v26;
  CGContextSetTextMatrix(CurrentContext, &v25);
  CGContextSetTextPosition(CurrentContext, v11, v10);
  v24.y = y;
  -[_EMKTextLayoutFragmentView bounds](self, "bounds");
  v24.x = CGRectGetMinX(v29) + x;
  CTFontDrawGlyphs(CopyWithAttributes, &glyphs, &v24, 1uLL, CurrentContext);
  CGContextRestoreGState(CurrentContext);
  CFRelease(CopyWithAttributes);
  v25 = v27;
  CGContextSetTextMatrix(CurrentContext, &v25);

}

- (NSTextLayoutFragment)layoutFragment
{
  return self->_layoutFragment;
}

- (void)setLayoutFragment:(id)a3
{
  objc_storeStrong((id *)&self->_layoutFragment, a3);
}

- (EMKGlyphRippler)rippler
{
  return self->_rippler;
}

- (void)setRippler:(id)a3
{
  objc_storeStrong((id *)&self->_rippler, a3);
}

- (unint64_t)timeIndex
{
  return self->_timeIndex;
}

- (void)setTimeIndex:(unint64_t)a3
{
  self->_timeIndex = a3;
}

- (unint64_t)animatingGlyphCount
{
  return self->_animatingGlyphCount;
}

- (void)setAnimatingGlyphCount:(unint64_t)a3
{
  self->_animatingGlyphCount = a3;
}

- (unint64_t)animatingGlyphCountBeforeFragment
{
  return self->_animatingGlyphCountBeforeFragment;
}

- (void)setAnimatingGlyphCountBeforeFragment:(unint64_t)a3
{
  self->_animatingGlyphCountBeforeFragment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rippler, 0);
  objc_storeStrong((id *)&self->_layoutFragment, 0);
}

@end
