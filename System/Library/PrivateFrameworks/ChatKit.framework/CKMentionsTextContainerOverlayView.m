@implementation CKMentionsTextContainerOverlayView

- (CKMentionsTextContainerOverlayView)initWithFrame:(CGRect)a3 textView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  CKMentionsTextContainerOverlayView *v11;
  CKMentionsTextContainerOverlayView *v12;
  NSDictionary *mentionAnimations;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKMentionsTextContainerOverlayView;
  v11 = -[CKMentionsTextContainerOverlayView initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_textView, a4);
    mentionAnimations = v12->_mentionAnimations;
    v12->_mentionAnimations = (NSDictionary *)MEMORY[0x1E0C9AA70];

    -[CKMentionsTextContainerOverlayView setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 1);
    -[CKMentionsTextContainerOverlayView layer](v12, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMasksToBounds:", 1);

    -[CKMentionsTextContainerOverlayView setClipsToBounds:](v12, "setClipsToBounds:", 1);
    -[CKMentionsTextContainerOverlayView setContentMode:](v12, "setContentMode:", 3);
  }

  return v12;
}

- (void)updateUsingAnimations:(id)a3
{
  -[CKMentionsTextContainerOverlayView setMentionAnimations:](self, "setMentionAnimations:", a3);
  -[CKMentionsTextContainerOverlayView setNeedsDisplay](self, "setNeedsDisplay");
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[9];
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)CKMentionsTextContainerOverlayView;
  -[CKMentionsTextContainerOverlayView drawRect:](&v20, sel_drawRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");

  -[CKMentionsTextContainerOverlayView bounds](self, "bounds");
  UIRectFill(v21);
  -[CKMentionsTextContainerOverlayView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMentionsTextContainerOverlayView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textContainerInset");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v6, "documentRange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47__CKMentionsTextContainerOverlayView_drawRect___block_invoke;
  v19[3] = &unk_1E2759C78;
  v19[5] = v9;
  v19[6] = v11;
  v19[7] = v13;
  v19[8] = v15;
  v19[4] = self;
  v18 = (id)objc_msgSend(v6, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v17, 4, v19);

}

uint64_t __47__CKMentionsTextContainerOverlayView_drawRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  uint64_t i;
  id v6;
  uint64_t v7;
  const __CTLine *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  const __CTRun *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[2];
  _OWORD v38[2];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v38[0] = *MEMORY[0x1E0C9D648];
  v38[1] = v4;
  v37[0] = v38[0];
  v37[1] = v4;
  objc_msgSend(v3, "_ck_getFragmentViewFrame:getBounds:textContainerInset:", v37, v38, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v3, "textLineFragments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(obj);
        v6 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i));
        v7 = objc_msgSend(v6, "lineRef");
        if (v7)
        {
          v8 = (const __CTLine *)v7;
          v28 = i;
          objc_msgSend(v6, "glyphOrigin");
          v10 = v9;
          v12 = v11;
          CTLineGetGlyphRuns(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v30;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v30 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(const __CTRun **)(*((_QWORD *)&v29 + 1) + 8 * j);
                CKCTRunGetMentionsAnimationIdentifier(v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19)
                {
                  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "objectForKeyedSubscript:", v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v20)
                  {
                    objc_msgSend(v6, "typographicBounds");
                    v22 = v21;
                    objc_msgSend(v3, "layoutFragmentFrame");
                    objc_msgSend(*(id *)(a1 + 32), "_drawAnimatedMentionRun:textPosition:rippler:layoutFragment:", v18, v20, v3, v10, v12 + *(double *)(a1 + 40) + v22 + v23);
                  }

                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
            }
            while (v15);
          }

          i = v28;
        }
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v27);
  }

  return 1;
}

- (void)_drawAnimatedMentionRun:(__CTRun *)a3 textPosition:(CGPoint)a4 rippler:(id)a5 layoutFragment:(id)a6
{
  double y;
  double x;
  id v12;
  const __CFDictionary *Attributes;
  const void *Value;
  size_t GlyphCount;
  int64_t v16;
  CGPoint *v17;
  CGGlyph *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double *p_y;
  const void *v23;
  id v24;
  uint64_t v25;
  double v26;
  double v27;
  id v28;
  uint64_t v29;
  void *v30;
  CGPoint *v31;
  id v32;
  CFRange v33;
  CFRange v34;

  y = a4.y;
  x = a4.x;
  v32 = a5;
  v12 = a6;
  Attributes = CTRunGetAttributes(a3);
  Value = CFDictionaryGetValue(Attributes, (const void *)*MEMORY[0x1E0CA8188]);
  if (!Value)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKMentionsTextContainerOverlayView.m"), 175, CFSTR("font required"));

  }
  GlyphCount = CTRunGetGlyphCount(a3);
  if (GlyphCount)
  {
    v16 = GlyphCount;
    v17 = (CGPoint *)malloc_type_calloc(GlyphCount, 0x10uLL, 0x1000040451B5BE8uLL);
    v18 = (CGGlyph *)malloc_type_calloc(v16, 2uLL, 0x1000040BDFB0063uLL);
    v33.location = 0;
    v33.length = 0;
    CTRunGetGlyphs(a3, v33, v18);
    v34.location = 0;
    v34.length = 0;
    v31 = v17;
    CTRunGetPositions(a3, v34, v17);
    v19 = objc_msgSend(v32, "currentTimeIndex");
    if (v16 >= 1)
    {
      v20 = v19;
      v21 = 0;
      p_y = &v17->y;
      do
      {
        v23 = Value;
        v24 = v12;
        v25 = v18[v21];
        v26 = *(p_y - 1);
        v27 = *p_y;
        v28 = +[CKMentionsRenderingAttributes newWithValuesFromRippler:timeIndex:glyphIndex:glyphCount:](CKMentionsRenderingAttributes, "newWithValuesFromRippler:timeIndex:glyphIndex:glyphCount:", v32, v20, v21, v16, v31);
        v29 = v25;
        v12 = v24;
        Value = v23;
        -[CKMentionsTextContainerOverlayView __drawGlyph:textPosition:glyphPosition:font:attributes:layoutFragment:](self, "__drawGlyph:textPosition:glyphPosition:font:attributes:layoutFragment:", v29, v23, v28, v12, x, y, v26, v27);

        ++v21;
        p_y += 2;
      }
      while (v16 != v21);
    }
    free(v18);
    free(v31);
  }

}

- (void)__drawGlyph:(unsigned __int16)a3 textPosition:(CGPoint)a4 glyphPosition:(CGPoint)a5 font:(__CTFont *)a6 attributes:(id)a7 layoutFragment:(id)a8
{
  double x;
  CGFloat y;
  CGFloat v12;
  id v13;
  id v14;
  CGContext *CurrentContext;
  const __CTFont *CopyWithAttributes;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGFloat v28;
  CGGlyph glyphs;
  CGPoint positions;
  CGRect v31;

  x = a5.x;
  y = a4.y;
  v12 = a4.x;
  positions.y = a5.y;
  glyphs = a3;
  v13 = a8;
  v14 = a7;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v28 = 0.0;
  objc_msgSend(v14, "_applyInContext:fontPointSize:getAdjustedFontSize:", CurrentContext, &v28, CTFontGetSize(a6));

  CopyWithAttributes = CTFontCreateCopyWithAttributes(a6, v28, 0, 0);
  memset(&v27, 0, sizeof(v27));
  CGContextGetTextMatrix(&v27, CurrentContext);
  v25 = v27;
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformScale(&v26, &v25, 1.0, -1.0);
  v25 = v26;
  CGContextSetTextMatrix(CurrentContext, &v25);
  CGContextSetTextPosition(CurrentContext, v12, y);
  objc_msgSend(v13, "layoutFragmentFrame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;

  v31.origin.x = v18;
  v31.origin.y = v20;
  v31.size.width = v22;
  v31.size.height = v24;
  positions.x = CGRectGetMinX(v31) + x;
  CTFontDrawGlyphs(CopyWithAttributes, &glyphs, &positions, 1uLL, CurrentContext);
  CGContextRestoreGState(CurrentContext);
  v25 = v27;
  CGContextSetTextMatrix(CurrentContext, &v25);
  CFRelease(CopyWithAttributes);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (NSDictionary)mentionAnimations
{
  return self->_mentionAnimations;
}

- (void)setMentionAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionAnimations, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
