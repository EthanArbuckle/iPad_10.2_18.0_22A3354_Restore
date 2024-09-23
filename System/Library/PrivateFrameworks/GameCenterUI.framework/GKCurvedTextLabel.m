@implementation GKCurvedTextLabel

- (GKCurvedTextLabel)init
{
  return -[GKCurvedTextLabel initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (GKCurvedTextLabel)initWithFrame:(CGRect)a3
{
  GKCurvedTextLabel *v3;
  NSTextContainer *v4;
  NSTextContainer *textContainer;
  NSLayoutManager *v6;
  NSLayoutManager *layoutManager;
  NSTextStorage *v8;
  NSTextStorage *textStorage;
  uint64_t v10;
  UIColor *textColor;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GKCurvedTextLabel;
  v3 = -[GKCurvedTextLabel initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSTextContainer *)objc_alloc_init(MEMORY[0x1E0DC12C0]);
    textContainer = v3->_textContainer;
    v3->_textContainer = v4;

    -[NSTextContainer setMaximumNumberOfLines:](v3->_textContainer, "setMaximumNumberOfLines:", 1);
    -[NSTextContainer setLineFragmentPadding:](v3->_textContainer, "setLineFragmentPadding:", 0.0);
    -[NSTextContainer setLineBreakMode:](v3->_textContainer, "setLineBreakMode:", 4);
    v6 = (NSLayoutManager *)objc_alloc_init(MEMORY[0x1E0DC1280]);
    layoutManager = v3->_layoutManager;
    v3->_layoutManager = v6;

    -[NSLayoutManager addTextContainer:](v3->_layoutManager, "addTextContainer:", v3->_textContainer);
    v8 = (NSTextStorage *)objc_alloc_init(MEMORY[0x1E0DC1320]);
    textStorage = v3->_textStorage;
    v3->_textStorage = v8;

    -[NSTextStorage addLayoutManager:](v3->_textStorage, "addLayoutManager:", v3->_layoutManager);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = objc_claimAutoreleasedReturnValue();
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v10;

  }
  return v3;
}

- (NSDictionary)textAttributes
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[GKCurvedTextLabel attributedText](self, "attributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  if (v3)
  {
    objc_msgSend(v2, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (void)setInterior:(BOOL)a3
{
  if (self->_interior != a3)
  {
    self->_interior = a3;
    -[GKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[GKCurvedTextLabel setNeedsLayout](self, "setNeedsLayout");
    -[GKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setCircleRadius:(double)a3
{
  if (self->_circleRadius != a3)
  {
    self->_circleRadius = a3;
    -[GKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[GKCurvedTextLabel _updateMaxSize](self, "_updateMaxSize");
    -[GKCurvedTextLabel setNeedsLayout](self, "setNeedsLayout");
    -[GKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setCenterAngle:(double)a3
{
  if (self->_centerAngle != a3)
  {
    self->_centerAngle = a3;
    -[GKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[GKCurvedTextLabel setNeedsLayout](self, "setNeedsLayout");
    -[GKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setMaxAngularWidth:(double)a3
{
  long double v5;

  v5 = fmod(a3, 6.28318531);
  if (a3 <= 6.28318531)
    v5 = a3;
  if (self->_maxAngularWidth != v5)
  {
    self->_maxAngularWidth = v5;
    -[GKCurvedTextLabel _updateMaxSize](self, "_updateMaxSize");
  }
}

- (double)linearWidth
{
  return self->_textWidth;
}

- (void)_updateMaxSize
{
  double maxAngularWidth;
  double circleRadius;
  double v5;
  double v6;

  maxAngularWidth = self->_maxAngularWidth;
  if (maxAngularWidth == 0.0 || (circleRadius = self->_circleRadius, circleRadius == 0.0))
  {
    v5 = 1.79769313e308;
  }
  else
  {
    if (maxAngularWidth > 3.14159265)
      maxAngularWidth = 6.28318531 - maxAngularWidth;
    v5 = maxAngularWidth * circleRadius;
  }
  -[NSTextContainer size](self->_textContainer, "size");
  if (v6 != v5 || self->_textWidth != v5)
  {
    -[NSTextContainer setSize:](self->_textContainer, "setSize:", v5, 1.79769313e308);
    self->_textWidth = v5;
    -[GKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[GKCurvedTextLabel setNeedsLayout](self, "setNeedsLayout");
    -[GKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setTextColor:(id)a3
{
  UIColor *v5;
  UIColor *textColor;
  UIColor *v7;

  v5 = (UIColor *)a3;
  textColor = self->_textColor;
  v7 = v5;
  if (v5 && textColor)
  {
    if ((-[UIColor isEqual:](v5, "isEqual:") & 1) != 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (textColor != v5)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_textColor, a3);
    -[GKCurvedTextLabel _updateTextColor](self, "_updateTextColor");
  }
LABEL_7:

}

- (void)_updateTextColor
{
  uint64_t v3;

  v3 = -[NSTextStorage length](self->_textStorage, "length");
  if (v3)
  {
    -[NSTextStorage addAttribute:value:range:](self->_textStorage, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], self->_textColor, 0, v3);
    -[GKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (id)textColor
{
  return self->_textColor;
}

- (void)setAttributedText:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSTextStorage *textStorage;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToAttributedString:", self->_textStorage) & 1) == 0)
  {
    if (!v4)
      goto LABEL_11;
    v5 = objc_msgSend(v4, "length");
    v6 = 0;
    v7 = 0;
    while (1)
    {
      objc_msgSend(v4, "string");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:range:", v9, 0, v6, v5);
      v12 = v11;

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (v7)
      {

        v7 = 0;
      }
      else
      {
        v7 = (void *)objc_msgSend(v4, "mutableCopy");
      }
      objc_msgSend(v7, "mutableString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "replaceCharactersInRange:withString:", v10, v12, CFSTR(" "));

      v6 = v10 + 1;
      v5 = objc_msgSend(v4, "length") - v6;
    }
    if (v7)
    {
      v14 = v7;
      v15 = v14;
    }
    else
    {
LABEL_11:
      v16 = (void *)objc_msgSend(v4, "mutableCopy");
      v17 = v16;
      if (v16)
        v18 = v16;
      else
        v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E59EB978);
      v15 = v18;

      v14 = 0;
    }
    v19 = *MEMORY[0x1E0DC1178];
    if (_CurvedParagraphStyle_onceToken != -1)
      dispatch_once(&_CurvedParagraphStyle_onceToken, &__block_literal_global_31);
    v20 = (id)_CurvedParagraphStyle_paragraphStyle;
    objc_msgSend(v15, "addAttribute:value:range:", v19, v20, 0, objc_msgSend(v15, "length"));

    -[NSTextStorage setAttributedString:](self->_textStorage, "setAttributedString:", v15);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    textStorage = self->_textStorage;
    v22 = -[NSTextStorage length](textStorage, "length");
    v23 = *MEMORY[0x1E0DC1138];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __39__GKCurvedTextLabel_setAttributedText___block_invoke;
    v24[3] = &unk_1E59C6EB8;
    v24[4] = &v25;
    -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](textStorage, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v22, 0, v24);
    self->_hasMonospacedNumbers = *((_BYTE *)v26 + 24);
    -[GKCurvedTextLabel _updateTextColor](self, "_updateTextColor");
    -[GKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[GKCurvedTextLabel setNeedsDisplay](self, "setNeedsDisplay");
    -[GKCurvedTextLabel setNeedsLayout](self, "setNeedsLayout");
    _Block_object_dispose(&v25, 8);

  }
}

void __39__GKCurvedTextLabel_setAttributedText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC1380]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = *MEMORY[0x1E0DC13D8];
    v12 = *MEMORY[0x1E0DC13D0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToNumber:", &unk_1E5A5E028) & 1) != 0)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToNumber:", &unk_1E5A5E040);

          if (v17)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
            *a5 = 1;
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }
LABEL_12:

}

- (id)attributedText
{
  return self->_textStorage;
}

- (void)setText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  UIFont *font;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3498];
    v5 = a3;
    v6 = [v4 alloc];
    font = self->_font;
    v10 = *MEMORY[0x1E0DC1138];
    v11[0] = font;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v8);

  }
  else
  {
    v9 = 0;
  }
  -[GKCurvedTextLabel setAttributedText:](self, "setAttributedText:", v9);

}

- (id)text
{
  return (id)-[NSTextStorage string](self->_textStorage, "string");
}

- (void)setFont:(id)a3
{
  UIFont *v5;
  UIFont *font;
  void *v7;
  UIFont *v8;

  v5 = (UIFont *)a3;
  font = self->_font;
  v8 = v5;
  if (v5 && font)
  {
    if ((-[UIFont isEqual:](v5, "isEqual:") & 1) != 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (font != v5)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_font, a3);
    -[GKCurvedTextLabel text](self, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKCurvedTextLabel setText:](self, "setText:", v7);

    -[GKCurvedTextLabel invalidateCachedSize](self, "invalidateCachedSize");
  }
LABEL_7:

}

- (id)font
{
  return self->_font;
}

- (void)invalidateCachedSize
{
  CGPoint v2;
  CGSize v3;

  self->_cachedSizeIsValid = 0;
  self->_cachedSize = (CGSize)*MEMORY[0x1E0C9D820];
  v2 = (CGPoint)*MEMORY[0x1E0C9D648];
  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_cachedBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_cachedBounds.size = v3;
  self->_cachedGlyphsBoundingRect.origin = v2;
  self->_cachedGlyphsBoundingRect.size = v3;
  self->_cachedLeadingAngle = self->_centerAngle;
  self->_cachedTrailingAngle = self->_centerAngle;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGSize *p_cachedSize;
  double width;
  double height;
  double v7;
  double v8;
  CGSize result;

  p_cachedSize = &self->_cachedSize;
  if (self->_cachedSizeIsValid)
  {
    width = p_cachedSize->width;
    height = self->_cachedSize.height;
  }
  else
  {
    -[GKCurvedTextLabel _glyphsBoundingRect](self, "_glyphsBoundingRect", a3.width, a3.height);
    width = v7;
    height = v8;
    p_cachedSize->width = v7;
    p_cachedSize->height = v8;
    self->_cachedSizeIsValid = 1;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  __CTLine *v8;
  CGFloat x;
  CGFloat y;
  CGContext *CurrentContext;
  _QWORD v12[7];
  CGAffineTransform transform;
  _QWORD v14[4];
  CGFloat v15;
  CGFloat v16;
  CGRect ImageBounds;

  -[GKCurvedTextLabel _glyphsBoundingRect](self, "_glyphsBoundingRect");
  -[GKCurvedTextLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:");
  v5 = v4;
  v7 = v6;
  v8 = -[GKCurvedTextLabel _newLineFromDrawableTextStorage](self, "_newLineFromDrawableTextStorage");
  ImageBounds = CTLineGetImageBounds(v8, 0);
  x = ImageBounds.origin.x;
  y = ImageBounds.origin.y;
  CFRelease(v8);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3010000000;
  v14[3] = &unk_1AB8BD257;
  v15 = x;
  v16 = y;
  if (self->_hasMonospacedNumbers)
    v15 = 0.0;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGAffineTransformMakeTranslation(&transform, v5, v7);
  CGContextConcatCTM(CurrentContext, &transform);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__GKCurvedTextLabel_drawTextInRect___block_invoke;
  v12[3] = &unk_1E59C6EE0;
  v12[4] = self;
  v12[5] = v14;
  v12[6] = CurrentContext;
  -[GKCurvedTextLabel _enumerateTransformsForDrawableCharacters:](self, "_enumerateTransformsForDrawableCharacters:", v12);
  _Block_object_dispose(v14, 8);
}

void __36__GKCurvedTextLabel_drawTextInRect___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, double a5, double a6)
{
  CGContext *v12;
  __int128 v13;
  CGAffineTransform v14;

  CGContextSaveGState(*(CGContextRef *)(a1 + 48));
  v12 = *(CGContext **)(a1 + 48);
  v13 = a4[1];
  *(_OWORD *)&v14.a = *a4;
  *(_OWORD *)&v14.c = v13;
  *(_OWORD *)&v14.tx = a4[2];
  CGContextConcatCTM(v12, &v14);
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "drawGlyphsForGlyphRange:atPoint:", a2, a3, -a5 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), -a6);
  CGContextRestoreGState(*(CGContextRef *)(a1 + 48));
}

- (CGRect)textBoundingRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[GKCurvedTextLabel _glyphsBoundingRect](self, "_glyphsBoundingRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[GKCurvedTextLabel bounds](self, "bounds");
  -[GKCurvedTextLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:", v4, v6, v8, v10, v11, v12, v13, v14);
  v16 = v4 + v15;
  v18 = v6 + v17;
  v19 = v8;
  v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v16;
  return result;
}

- (double)textLeadingAngle
{
  return self->_cachedLeadingAngle;
}

- (double)textTrailingAngle
{
  return self->_cachedTrailingAngle;
}

- (_NSRange)_drawableCharacterRange:(_NSRange *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v5 = -[NSLayoutManager glyphRangeForTextContainer:](self->_layoutManager, "glyphRangeForTextContainer:", self->_textContainer);
  v7 = v6;
  v8 = -[NSLayoutManager truncatedGlyphRangeInLineFragmentForGlyphAtIndex:](self->_layoutManager, "truncatedGlyphRangeInLineFragmentForGlyphAtIndex:", v5);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v8 + 1;
    if (a3)
    {
      a3->location = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self->_layoutManager, "characterRangeForGlyphRange:actualGlyphRange:", v8, v9, 0);
      a3->length = v10;
    }
  }
  v11 = -[NSLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self->_layoutManager, "characterRangeForGlyphRange:actualGlyphRange:", v5, v7, 0);
  result.length = v12;
  result.location = v11;
  return result;
}

- (__CTLine)_newLineFromDrawableTextStorage
{
  uint64_t v3;
  uint64_t v4;
  NSTextStorage *textStorage;
  uint64_t v6;
  uint64_t v7;
  NSTextStorage *v8;
  NSTextStorage *v9;
  uint64_t v10;
  __CTLine *v11;
  __int128 v13;

  v13 = xmmword_1AB7F8200;
  v4 = -[GKCurvedTextLabel _drawableCharacterRange:](self, "_drawableCharacterRange:", &v13);
  textStorage = self->_textStorage;
  if ((_QWORD)v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v3;
    v7 = -[NSTextStorage length](textStorage, "length");
    v8 = self->_textStorage;
    if (v4 || v6 != v7)
    {
      v9 = (NSTextStorage *)-[NSTextStorage mutableCopy](v8, "mutableCopy");
      -[NSTextStorage deleteCharactersInRange:](v9, "deleteCharactersInRange:", v6, -[NSTextStorage length](self->_textStorage, "length") - v6);
    }
    else
    {
      v9 = v8;
    }
  }
  else
  {
    v9 = (NSTextStorage *)-[NSTextStorage mutableCopy](textStorage, "mutableCopy");
    v10 = -[NSTextStorage length](self->_textStorage, "length");
    *((_QWORD *)&v13 + 1) = v10 - v13;
    -[NSTextStorage replaceCharactersInRange:withString:](v9, "replaceCharactersInRange:withString:");
  }
  v11 = CTLineCreateWithAttributedString((CFAttributedStringRef)v9);

  return v11;
}

- (CGPoint)_offsetOfBoundingRect:(CGRect)a3 inRect:(CGRect)a4
{
  CGFloat v4;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat rect;
  CGFloat width;
  CGPoint result;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  rect = a4.size.height;
  width = a3.size.width;
  v4 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  height = a3.size.height;
  v8 = a3.size.width;
  v9 = a3.origin.y;
  v10 = a3.origin.x;
  v11 = CGRectGetWidth(a4);
  v19.origin.x = v10;
  v19.origin.y = v9;
  v19.size.width = v8;
  v19.size.height = height;
  v12 = v11 - CGRectGetMaxX(v19);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = v4;
  v20.size.height = rect;
  v13 = CGRectGetHeight(v20);
  v21.origin.x = v10;
  v21.origin.y = v9;
  v21.size.width = width;
  v21.size.height = height;
  v14 = v13 - CGRectGetMaxY(v21);
  v15 = v12;
  result.y = v14;
  result.x = v15;
  return result;
}

- (CGRect)_glyphsBoundingRect
{
  CGRect *p_cachedBounds;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  __int128 v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double *p_x;
  CGSize size;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CGRect *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  CGRect v38;
  CGRect result;
  CGRect v40;

  p_cachedBounds = &self->_cachedBounds;
  -[GKCurvedTextLabel bounds](self, "bounds");
  v40.origin.x = v4;
  v40.origin.y = v5;
  v40.size.width = v6;
  v40.size.height = v7;
  if (CGRectEqualToRect(*p_cachedBounds, v40) && !CGRectIsEmpty(self->_cachedGlyphsBoundingRect))
  {
    x = self->_cachedGlyphsBoundingRect.origin.x;
    y = self->_cachedGlyphsBoundingRect.origin.y;
    width = self->_cachedGlyphsBoundingRect.size.width;
    height = self->_cachedGlyphsBoundingRect.size.height;
  }
  else
  {
    v32 = 0;
    v33 = (CGRect *)&v32;
    v34 = 0x4010000000;
    v35 = &unk_1AB8BD257;
    v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v36 = *MEMORY[0x1E0C9D628];
    v37 = v8;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0x10000000000000;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0x10000000000000;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __40__GKCurvedTextLabel__glyphsBoundingRect__block_invoke;
    v23[3] = &unk_1E59C6F08;
    v23[4] = &v32;
    v23[5] = &v28;
    v23[6] = &v24;
    -[GKCurvedTextLabel _enumerateTransformsForDrawableCharacters:](self, "_enumerateTransformsForDrawableCharacters:", v23);
    v38 = CGRectInset(v33[1], 0.0, -1.0);
    v33[1] = v38;
    -[GKCurvedTextLabel bounds](self, "bounds");
    p_cachedBounds->origin.x = v9;
    p_cachedBounds->origin.y = v10;
    p_cachedBounds->size.width = v11;
    p_cachedBounds->size.height = v12;
    p_x = &v33->origin.x;
    size = v33[1].size;
    self->_cachedGlyphsBoundingRect.origin = v33[1].origin;
    self->_cachedGlyphsBoundingRect.size = size;
    *(_QWORD *)&self->_cachedLeadingAngle = v29[3];
    *(_QWORD *)&self->_cachedTrailingAngle = v25[3];
    x = p_x[4];
    y = p_x[5];
    width = p_x[6];
    height = p_x[7];
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

void __40__GKCurvedTextLabel__glyphsBoundingRect__block_invoke(_QWORD *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, uint64_t a9, uint64_t a10, _OWORD *a11)
{
  double v12;
  __int128 v15;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  CGAffineTransform v24;
  CGRect v25;

  v12 = a5;
  v15 = a11[1];
  *(_OWORD *)&v24.a = *a11;
  *(_OWORD *)&v24.c = v15;
  *(_OWORD *)&v24.tx = a11[2];
  *(double *)&v15 = a7;
  v25 = CGRectApplyAffineTransform(*(CGRect *)(&v12 - 1), &v24);
  *(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32) = CGRectUnion(v25, *(CGRect *)(*(_QWORD *)(a1[4] + 8) + 32));
  v17 = *(_QWORD *)(a1[5] + 8);
  v18 = *(double *)(v17 + 24);
  if (v18 >= a8)
    v19 = a8;
  else
    v19 = *(double *)(v17 + 24);
  if (v18 == 2.22507386e-308)
    v20 = a8;
  else
    v20 = v19;
  *(double *)(v17 + 24) = v20;
  v21 = *(_QWORD *)(a1[6] + 8);
  v22 = *(double *)(v21 + 24);
  if (v22 < a8 || v22 == 2.22507386e-308)
    v22 = a8;
  *(double *)(v21 + 24) = v22;
}

- (double)_distance
{
  double result;

  result = self->_circleRadius;
  if (!self->_interior)
    return -result;
  return result;
}

- (void)_enumerateTransformsForDrawableCharacters:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  __CTLine *v15;
  CGFloat x;
  CGFloat y;
  CGFloat MinX;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  void (*v36)(_QWORD *, uint64_t, _QWORD, __int128 *, double, double, double, double, double, double, double);
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  double MaxX;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  void (*v56)(_QWORD *, uint64_t, _QWORD, __int128 *, double, double, double, double, double, double, double);
  uint64_t v57;
  CGFloat v58;
  CGFloat rect;
  double MidX;
  CGFloat v61;
  CGFloat v62;
  CGFloat height;
  CGFloat width;
  double TypographicBounds;
  uint64_t v66;
  CGFloat v67;
  uint64_t v68;
  CGFloat v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  _QWORD v75[5];
  _QWORD *v76;
  uint64_t v77;
  CGFloat v78;
  __int128 v79;
  uint64_t v80;
  double v81;
  double v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  BOOL v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  double v96;
  _OWORD v97[2];
  CGRect ImageBounds;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v4 = a3;
  -[GKCurvedTextLabel bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[GKCurvedTextLabel _distance](self, "_distance");
  v14 = v13;
  v15 = -[GKCurvedTextLabel _newLineFromDrawableTextStorage](self, "_newLineFromDrawableTextStorage");
  ImageBounds = CTLineGetImageBounds(v15, 0);
  x = ImageBounds.origin.x;
  y = ImageBounds.origin.y;
  height = ImageBounds.size.height;
  width = ImageBounds.size.width;
  MinX = 0.0;
  TypographicBounds = 0.0;
  if (self->_hasMonospacedNumbers)
    TypographicBounds = CTLineGetTypographicBounds(v15, 0, 0, 0);
  CFRelease(v15);
  v61 = y;
  if (self->_hasMonospacedNumbers)
  {
    v19 = TypographicBounds;
  }
  else
  {
    v99.origin.x = x;
    v99.origin.y = y;
    v99.size.height = height;
    v99.size.width = width;
    v20 = CGRectGetWidth(v99);
    v21 = y;
    v19 = v20;
    if (!self->_hasMonospacedNumbers)
    {
      v22 = x;
      v24 = height;
      v23 = width;
      MinX = CGRectGetMinX(*(CGRect *)(&v21 - 1));
    }
  }
  v62 = x;
  v97[0] = xmmword_1AB7F8200;
  v25 = -[GKCurvedTextLabel _drawableCharacterRange:](self, "_drawableCharacterRange:", v97);
  v27 = v26;
  if (self->_hasMonospacedNumbers)
  {
    -[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], 0, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v100.origin.y = v61;
    v100.origin.x = x;
    v100.size.height = height;
    v100.size.width = width;
    rect = CGRectGetMinX(v100);
    objc_msgSend(v28, "xHeight");
    *(double *)&v72 = v14;
    v30 = v29;
    -[NSLayoutManager locationForGlyphAtIndex:](self->_layoutManager, "locationForGlyphAtIndex:", 0);
    v66 = v12;
    v68 = v10;
    v32 = v31;
    v101.origin.y = 0.0;
    v101.origin.x = v33 + 0.0;
    v34 = v101.origin.x;
    v101.size.width = rect;
    v101.size.height = v30;
    v102.origin.y = v32 - CGRectGetMaxY(v101);
    v58 = v102.origin.y;
    v102.origin.x = v34;
    v102.size.width = rect;
    v102.size.height = v30;
    v96 = 0.0;
    v94 = 0u;
    v95 = 0u;
    v93 = 0u;
    MidX = CGRectGetMidX(v102);
    v35 = v32;
    v12 = v66;
    _TransformForLayoutLocation((uint64_t)&v93, MidX, v35, v19, *(double *)&v72, self->_centerAngle, v6, v8, v68, v66);
    v103.origin.x = v34;
    v10 = v68;
    v103.origin.y = v58;
    v103.size.height = v30;
    v103.size.width = rect;
    v14 = *(double *)&v72;
    v104 = CGRectOffset(v103, -MidX, -v35);
    v36 = (void (*)(_QWORD *, uint64_t, _QWORD, __int128 *, double, double, double, double, double, double, double))v4[2];
    v90 = v93;
    v91 = v94;
    v92 = v95;
    v36(v4, 0x7FFFFFFFFFFFFFFFLL, 0, &v90, MidX, v35, v104.origin.x, v104.origin.y, v104.size.width, v104.size.height, v96);

  }
  v73 = v25 + v27;
  if (v25 < v25 + v27)
  {
    v70 = v4;
    do
    {
      v93 = xmmword_1AB7F8200;
      v38 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self->_layoutManager, "glyphRangeForCharacterRange:actualCharacterRange:", v25, 1, &v93);
      v39 = *(_QWORD *)&v97[0];
      v40 = v93;
      if (*(_QWORD *)&v97[0] == (_QWORD)v93)
        v41 = 1;
      else
        v41 = v37;
      v42 = (void *)objc_opt_new();
      v43 = v41;
      v44 = v38;
      if (v38 < v41 + v38)
      {
        do
        {
          if ((-[NSLayoutManager propertyForGlyphAtIndex:](self->_layoutManager, "propertyForGlyphAtIndex:", v44) & 1) == 0)
            objc_msgSend(v42, "addIndex:", v44);
          ++v44;
          --v43;
        }
        while (v43);
      }
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __63__GKCurvedTextLabel__enumerateTransformsForDrawableCharacters___block_invoke;
      v75[3] = &unk_1E59C6F30;
      v75[4] = self;
      v77 = 0;
      v78 = MinX;
      v4 = v70;
      v79 = v93;
      v80 = v41;
      v89 = v39 == v40;
      v81 = v19;
      v82 = v14;
      v83 = v6;
      v84 = v8;
      v85 = v10;
      v86 = v12;
      if (v39 == v40)
        v45 = (char *)v97 + 8;
      else
        v45 = (char *)&v93 + 8;
      v76 = v70;
      v87 = v38;
      v88 = v41;
      objc_msgSend(v42, "enumerateRangesUsingBlock:", v75);
      v46 = *(_QWORD *)v45;
      if (*(_QWORD *)v45 <= 1uLL)
        v46 = 1;
      v25 += v46;

    }
    while (v25 < v73);
  }
  if (self->_hasMonospacedNumbers)
  {
    v47 = v73 - 1;
    -[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], v73 - 1, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v105.origin.x = v62;
    v105.origin.y = v61;
    v74 = v6;
    v105.size.width = width;
    v71 = v8;
    v105.size.height = height;
    v69 = TypographicBounds - CGRectGetMaxX(v105);
    v106.origin.x = v62;
    v106.origin.y = v61;
    v106.size.width = width;
    v106.size.height = height;
    MaxX = CGRectGetMaxX(v106);
    objc_msgSend(v48, "xHeight");
    v51 = v50;
    -[NSLayoutManager locationForGlyphAtIndex:](self->_layoutManager, "locationForGlyphAtIndex:", -[NSLayoutManager glyphIndexForCharacterAtIndex:](self->_layoutManager, "glyphIndexForCharacterAtIndex:", v47));
    v53 = v52;
    v107.origin.y = 0.0;
    v107.origin.x = MaxX + 0.0;
    v107.size.width = v69;
    v107.size.height = v51;
    v108.origin.y = v53 - CGRectGetMaxY(v107);
    v67 = v108.origin.y;
    v108.origin.x = MaxX + 0.0;
    v108.size.width = v69;
    v108.size.height = v51;
    v54 = CGRectGetMidX(v108);
    v96 = 0.0;
    v94 = 0u;
    v95 = 0u;
    v93 = 0u;
    v57 = v10;
    v55 = v54;
    _TransformForLayoutLocation((uint64_t)&v93, v54, v53, v19, v14, self->_centerAngle, v74, v71, v57, v12);
    v109.origin.x = MaxX + 0.0;
    v109.origin.y = v67;
    v109.size.width = v69;
    v109.size.height = v51;
    v110 = CGRectOffset(v109, -v55, -v53);
    v56 = (void (*)(_QWORD *, uint64_t, _QWORD, __int128 *, double, double, double, double, double, double, double))v4[2];
    v90 = v93;
    v91 = v94;
    v92 = v95;
    v56(v4, 0x7FFFFFFFFFFFFFFFLL, 0, &v90, v55, v53, v110.origin.x, v110.origin.y, v110.size.width, v110.size.height, v96);

  }
}

void __63__GKCurvedTextLabel__enumerateTransformsForDrawableCharacters___block_invoke(uint64_t a1, uint64_t a2, CFIndex a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  CFIndex v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const __CTFont *v16;
  uint64_t v17;
  const CGGlyph *v18;
  double x;
  CGFloat y;
  CGFloat width;
  double v22;
  CGFloat height;
  CGFloat v24;
  CGFloat v25;
  double MidX;
  void (*v27)(double, double, double, double, double, double, double);
  _OWORD v28[3];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  double v32;
  uint64_t v33;
  CGRect BoundingRectsForGlyphs;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "locationForGlyphAtIndex:", a2);
  v7 = v6;
  v9 = v8;
  v10 = a2 + 1;
  if (a2 + 1 < (unint64_t)(a2 + a3))
  {
    v11 = a3 - 1;
    do
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "locationForGlyphAtIndex:", v10);
      if (v12 < v7)
      {
        v9 = v13;
        v7 = v12;
      }
      ++v10;
      --v11;
    }
    while (v11);
  }
  v14 = *(double *)(a1 + 48);
  v15 = *(double *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 808), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1138], *(_QWORD *)(a1 + 64), 0);
  v16 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1E0C80A78]();
  v18 = (const CGGlyph *)((char *)v28 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", a2, a3, v18, 0, 0, 0);
  BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(v16, kCTFontOrientationDefault, v18, 0, a3);
  x = BoundingRectsForGlyphs.origin.x;
  y = BoundingRectsForGlyphs.origin.y;
  width = BoundingRectsForGlyphs.size.width;
  if (*(_BYTE *)(a1 + 152))
  {
    -[__CTFont xHeight](v16, "xHeight");
    height = v22;
  }
  else
  {
    height = BoundingRectsForGlyphs.size.height;
  }
  v24 = v7 + v14 - v15 + x;
  v35.origin.x = v24;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v25 = v9 - CGRectGetMaxY(v35);
  v36.origin.x = v24;
  v36.origin.y = v25;
  v36.size.width = width;
  v36.size.height = height;
  MidX = CGRectGetMidX(v36);
  v32 = 0.0;
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  _TransformForLayoutLocation((uint64_t)&v29, MidX, v9, *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(*(_QWORD *)(a1 + 32) + 976), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128));
  v37.origin.x = v24;
  v37.origin.y = v25;
  v37.size.width = width;
  v37.size.height = height;
  v38 = CGRectOffset(v37, -MidX, -v9);
  v27 = *(void (**)(double, double, double, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16);
  v28[0] = v29;
  v28[1] = v30;
  v28[2] = v31;
  v27(MidX, v9, v38.origin.x, v38.origin.y, v38.size.width, v38.size.height, v32);

}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (BOOL)interior
{
  return self->_interior;
}

- (double)centerAngle
{
  return self->_centerAngle;
}

- (double)maxAngularWidth
{
  return self->_maxAngularWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end
