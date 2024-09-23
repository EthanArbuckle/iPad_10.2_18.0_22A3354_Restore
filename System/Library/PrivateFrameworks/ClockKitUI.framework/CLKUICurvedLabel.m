@implementation CLKUICurvedLabel

- (CLKUICurvedLabel)initWithFrame:(CGRect)a3
{
  CLKUICurvedLabel *v3;
  uint64_t v4;
  NSTextContainer *textContainer;
  uint64_t v6;
  NSLayoutManager *layoutManager;
  uint64_t v8;
  NSTextStorage *textStorage;
  uint64_t v10;
  UIColor *textColor;
  CLKUICurvedCircleGlyphLayoutProvider *v12;
  CLKUICurvedCircleGlyphLayoutProvider *circleGlyphLayoutProvider;
  CLKUICurvedPathGlyphLayoutProvider *v14;
  CLKUICurvedPathGlyphLayoutProvider *pathGlyphLayoutProvider;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CLKUICurvedLabel;
  v3 = -[CLKUICurvedLabel initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    textContainer = v3->_textContainer;
    v3->_textContainer = (NSTextContainer *)v4;

    -[NSTextContainer setMaximumNumberOfLines:](v3->_textContainer, "setMaximumNumberOfLines:", 1);
    -[NSTextContainer setLineFragmentPadding:](v3->_textContainer, "setLineFragmentPadding:", 0.0);
    -[NSTextContainer setLineBreakMode:](v3->_textContainer, "setLineBreakMode:", 4);
    v6 = objc_opt_new();
    layoutManager = v3->_layoutManager;
    v3->_layoutManager = (NSLayoutManager *)v6;

    -[NSLayoutManager addTextContainer:](v3->_layoutManager, "addTextContainer:", v3->_textContainer);
    v8 = objc_opt_new();
    textStorage = v3->_textStorage;
    v3->_textStorage = (NSTextStorage *)v8;

    -[NSTextStorage addLayoutManager:](v3->_textStorage, "addLayoutManager:", v3->_layoutManager);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = objc_claimAutoreleasedReturnValue();
    textColor = v3->_textColor;
    v3->_textColor = (UIColor *)v10;

    v3->_viewAlpha = 1.0;
    v3->_animationAlpha = 1.0;
    v3->_usesPath = 0;
    v12 = objc_alloc_init(CLKUICurvedCircleGlyphLayoutProvider);
    circleGlyphLayoutProvider = v3->_circleGlyphLayoutProvider;
    v3->_circleGlyphLayoutProvider = v12;

    v14 = objc_alloc_init(CLKUICurvedPathGlyphLayoutProvider);
    pathGlyphLayoutProvider = v3->_pathGlyphLayoutProvider;
    v3->_pathGlyphLayoutProvider = v14;

  }
  return v3;
}

- (void)dealloc
{
  UIView **p_imageView;
  id WeakRetained;
  id v5;
  objc_super v6;

  p_imageView = &self->_imageView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), &kImageViewBoundsContext);

  v5 = objc_loadWeakRetained((id *)p_imageView);
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("frame"), &kImageViewBoundsContext);

  v6.receiver = self;
  v6.super_class = (Class)CLKUICurvedLabel;
  -[CLKUICurvedLabel dealloc](&v6, sel_dealloc);
}

- (double)_lastLineBaseline
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLKUICurvedLabel;
  -[CLKUICurvedLabel _lastLineBaseline](&v3, sel__lastLineBaseline);
  return result;
}

- (void)setInterior:(BOOL)a3
{
  if (self->_interior != a3)
  {
    self->_interior = a3;
    -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUICurvedLabel _updateTracking](self, "_updateTracking");
    -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
    -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setCircleRadius:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_circleRadius = a3;
    -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUICurvedLabel _updateMaxSize](self, "_updateMaxSize");
    -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
    -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setCenterAngle:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_centerAngle = a3;
    -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
    -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setMaxAngularWidth:(double)a3
{
  double v3;
  double v5;

  v3 = a3;
  v5 = fmod(a3, 6.28318531);
  if (v3 > 6.28318531)
    v3 = v5;
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_maxAngularWidth = v3;
    -[CLKUICurvedLabel _updateMaxSize](self, "_updateMaxSize");
  }
}

- (void)setPath:(id)a3
{
  UIBezierPath *v5;
  UIBezierPath *v6;

  v5 = (UIBezierPath *)a3;
  if (self->_path != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_path, a3);
    self->_usesPath = 1;
    -[CLKUICurvedPathGlyphLayoutProvider setPath:](self->_pathGlyphLayoutProvider, "setPath:", self->_path);
    -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUICurvedLabel _updateMaxSize](self, "_updateMaxSize");
    -[CLKUICurvedLabel _updateTracking](self, "_updateTracking");
    -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
    -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
    v5 = v6;
  }

}

- (double)maxLinearWidth
{
  double maxTextWidth;
  double v3;

  maxTextWidth = self->_maxTextWidth;
  -[CLKUICurvedLabel _extraWidthForImage](self, "_extraWidthForImage");
  return maxTextWidth + v3;
}

- (double)maxLinearTextWidth
{
  return self->_maxTextWidth;
}

- (double)_extraWidthForImage
{
  double Width;
  CGRect v5;

  Width = 0.0;
  if (-[CLKUICurvedLabel _hasImage](self, "_hasImage"))
  {
    -[CLKUICurvedLabel _imageBounds](self, "_imageBounds");
    Width = CGRectGetWidth(v5);
    if (-[NSTextStorage length](self->_textStorage, "length"))
      return Width + self->_imagePadding;
  }
  return Width;
}

- (void)_updateMaxSize
{
  id *p_pathGlyphLayoutProvider;
  id v4;
  double v5;
  double v6;

  if (self->_usesPath)
  {
    p_pathGlyphLayoutProvider = (id *)&self->_pathGlyphLayoutProvider;
  }
  else
  {
    p_pathGlyphLayoutProvider = (id *)&self->_circleGlyphLayoutProvider;
    -[CLKUICurvedCircleGlyphLayoutProvider setMaxAngularWidth:](self->_circleGlyphLayoutProvider, "setMaxAngularWidth:", self->_maxAngularWidth);
    objc_msgSend(*p_pathGlyphLayoutProvider, "setCircleRadius:", self->_circleRadius);
  }
  v4 = *p_pathGlyphLayoutProvider;
  -[CLKUICurvedLabel _extraWidthForImage](self, "_extraWidthForImage");
  objc_msgSend(v4, "setExtraWidthForImage:");
  objc_msgSend(*p_pathGlyphLayoutProvider, "maxTextWidth");
  v6 = v5;
  -[NSTextContainer size](self->_textContainer, "size");
  if (!CLKFloatEqualsFloat() || (CLKFloatEqualsFloat() & 1) == 0)
  {
    -[NSTextContainer setSize:](self->_textContainer, "setSize:", v6, 1.79769313e308);
    self->_maxTextWidth = v6;
    -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
    -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)isTextTruncated
{
  NSNumber *isTextTruncated;
  NSNumber *v4;
  NSNumber *v5;
  __int128 v7;

  isTextTruncated = self->_isTextTruncated;
  if (!isTextTruncated)
  {
    v7 = xmmword_1CB9E2A40;
    -[CLKUICurvedLabel _drawableCharacterRange:](self, "_drawableCharacterRange:", &v7);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7 != 0x7FFFFFFFFFFFFFFFLL);
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_isTextTruncated;
    self->_isTextTruncated = v4;

    isTextTruncated = self->_isTextTruncated;
  }
  return -[NSNumber BOOLValue](isTextTruncated, "BOOLValue");
}

- (void)setTextColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_textColor) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_textColor, a3);
    -[CLKUICurvedLabel _updateTextColor](self, "_updateTextColor");
  }

}

- (void)_updateTextColor
{
  uint64_t v3;
  UIColor *v4;
  double viewAlpha;
  uint64_t v6;
  void *v7;
  NSAttributedString *attributedStringWithoutColorModification;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  UIColor *v12;
  _QWORD v13[4];
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v3 = -[NSTextStorage length](self->_textStorage, "length");
  v4 = self->_textColor;
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    viewAlpha = self->_viewAlpha;
    v17 = 0.0;
    v18 = 0.0;
    v16 = 0.0;
    v15 = 1.0;
    -[UIColor getRed:green:blue:alpha:](v4, "getRed:green:blue:alpha:", &v18, &v17, &v16, &v15);
    v15 = viewAlpha * v15;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v15 * v18, v15 * v17, v15 * v16, 1.0);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (UIColor *)v6;
  }
  if (-[CLKUICurvedLabel attributedTextProvidesColor](self, "attributedTextProvidesColor"))
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndexesInRange:", 0, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    attributedStringWithoutColorModification = self->_attributedStringWithoutColorModification;
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __36__CLKUICurvedLabel__updateTextColor__block_invoke;
    v13[3] = &unk_1E86E0990;
    v14 = v7;
    v10 = v7;
    -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](attributedStringWithoutColorModification, "enumerateAttributesInRange:options:usingBlock:", 0, v3, 0x100000, v13);
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __36__CLKUICurvedLabel__updateTextColor__block_invoke_2;
    v11[3] = &unk_1E86E09B8;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v10, "enumerateRangesUsingBlock:", v11);

  }
  else
  {
    -[NSTextStorage addAttribute:value:range:](self->_textStorage, "addAttribute:value:range:", *MEMORY[0x1E0DC32A8], v4, 0, v3);
  }
  -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");

}

void __36__CLKUICurvedLabel__updateTextColor__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DC32A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a3, a4);
}

uint64_t __36__CLKUICurvedLabel__updateTextColor__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 808), "addAttribute:value:range:", *MEMORY[0x1E0DC32A8], *(_QWORD *)(a1 + 40), a2, a3);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setAlpha:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_viewAlpha = a3;
    -[CLKUICurvedLabel _updateTextColor](self, "_updateTextColor");
  }
}

- (double)alpha
{
  return self->_viewAlpha;
}

- (void)setAnimationAlpha:(double)a3
{
  objc_super v5;

  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_animationAlpha = a3;
    v5.receiver = self;
    v5.super_class = (Class)CLKUICurvedLabel;
    -[CLKUICurvedLabel setAlpha:](&v5, sel_setAlpha_, a3);
  }
}

- (UIEdgeInsets)opticalInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0DC49E8];
  v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_setAttributedText:(id)a3
{
  id v4;
  NSAttributedString *v5;
  NSAttributedString *attributedStringUnmodified;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSAttributedString *v22;
  NSAttributedString *attributedStringWithoutColorModification;
  NSTextStorage *textStorage;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToAttributedString:", self->_attributedStringUnmodified) & 1) == 0)
  {
    v5 = (NSAttributedString *)objc_msgSend(v4, "copy");
    attributedStringUnmodified = self->_attributedStringUnmodified;
    self->_attributedStringUnmodified = v5;

    if (!v4)
      goto LABEL_10;
    v7 = objc_msgSend(v4, "length");
    v8 = 0;
    v9 = 0;
    while (1)
    {
      objc_msgSend(v4, "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:range:", v11, 0, v8, v7);
      v14 = v13;

      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (!v9)
        v9 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v9, "mutableString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "replaceCharactersInRange:withString:", v12, v14, CFSTR(" "));

      v8 = v12 + 1;
      v7 = objc_msgSend(v4, "length") - v8;
    }
    if (v9)
    {
      v16 = v9;
      v17 = v16;
    }
    else
    {
LABEL_10:
      v16 = (id)objc_msgSend(v4, "mutableCopy");
      v17 = 0;
    }
    v18 = objc_msgSend(v16, "length");
    self->_storageIsEmpty = v18 == 0;
    if (!v18)
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR("​"));

      v16 = (id)v19;
    }
    v20 = *MEMORY[0x1E0DC32C0];
    if (_CurvedParagraphStyle_onceToken != -1)
      dispatch_once(&_CurvedParagraphStyle_onceToken, &__block_literal_global_11);
    v21 = (id)_CurvedParagraphStyle_paragraphStyle;
    objc_msgSend(v16, "addAttribute:value:range:", v20, v21, 0, objc_msgSend(v16, "length"));

    -[NSTextStorage setAttributedString:](self->_textStorage, "setAttributedString:", v16);
    v22 = (NSAttributedString *)objc_msgSend(v16, "copy");
    attributedStringWithoutColorModification = self->_attributedStringWithoutColorModification;
    self->_attributedStringWithoutColorModification = v22;

    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    textStorage = self->_textStorage;
    v25 = -[NSTextStorage length](textStorage, "length");
    v26 = *MEMORY[0x1E0DC32A0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __39__CLKUICurvedLabel__setAttributedText___block_invoke;
    v27[3] = &unk_1E86E09E0;
    v27[4] = &v28;
    -[NSTextStorage enumerateAttribute:inRange:options:usingBlock:](textStorage, "enumerateAttribute:inRange:options:usingBlock:", v26, 0, v25, 0, v27);
    self->_hasMonospacedNumbers = *((_BYTE *)v29 + 24);
    -[CLKUICurvedLabel _updateTextColor](self, "_updateTextColor");
    -[CLKUICurvedLabel _updateTracking](self, "_updateTracking");
    -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
    -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
    _Block_object_dispose(&v28, 8);

  }
}

void __39__CLKUICurvedLabel__setAttributedText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
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
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DC4A28]);
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
    v11 = *MEMORY[0x1E0DC4A58];
    v12 = *MEMORY[0x1E0DC4A48];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToNumber:", &unk_1E86EF158) & 1) != 0)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToNumber:", &unk_1E86EF170);

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

- (void)setAttributedText:(id)a3
{
  self->_storageIsNonAttributedText = 0;
  -[CLKUICurvedLabel _setAttributedText:](self, "_setAttributedText:", a3);
}

- (NSAttributedString)attributedText
{
  _BOOL4 storageIsEmpty;
  NSTextStorage *textStorage;
  NSTextStorage *v4;

  storageIsEmpty = self->_storageIsEmpty;
  textStorage = self->_textStorage;
  if (storageIsEmpty)
  {
    -[NSTextStorage attributedSubstringFromRange:](textStorage, "attributedSubstringFromRange:", 0, 0);
    v4 = (NSTextStorage *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = textStorage;
  }
  return (NSAttributedString *)v4;
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
    v10 = *MEMORY[0x1E0DC32A0];
    v11[0] = font;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v8);

  }
  else
  {
    v9 = 0;
  }
  self->_storageIsNonAttributedText = 1;
  -[CLKUICurvedLabel _setAttributedText:](self, "_setAttributedText:", v9);

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[CLKUICurvedLabel attributedText](self, "attributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setFont:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_font) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    if (self->_storageIsNonAttributedText)
    {
      -[CLKUICurvedLabel text](self, "text");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUICurvedLabel setText:](self, "setText:", v5);

    }
  }

}

- (UIFont)font
{
  return self->_font;
}

- (void)setTracking:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_tracking = a3;
    -[CLKUICurvedLabel _updateTracking](self, "_updateTracking");
    -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
    -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_updateTracking
{
  double v3;
  uint64_t v4;
  NSTextStorage *textStorage;
  uint64_t v6;
  void *v7;
  id v8;

  -[CLKUICurvedLabel tracking](self, "tracking");
  if (v3 < 0.0)
    v3 = -v3;
  if (v3 > 0.00000011920929)
  {
    v4 = -[NSTextStorage length](self->_textStorage, "length");
    textStorage = self->_textStorage;
    v6 = *MEMORY[0x1E0DC32B0];
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[CLKUICurvedLabel tracking](self, "tracking");
    CLKKernValueForDesignSpecTrackingValue();
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[NSTextStorage addAttribute:value:range:](textStorage, "addAttribute:value:range:", v6, v8, 0, v4);

  }
}

- (void)setBaselineOffset:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_baselineOffset = a3;
    -[CLKUICurvedPathGlyphLayoutProvider setBaselineOffset:](self->_pathGlyphLayoutProvider, "setBaselineOffset:", a3);
  }
}

- (void)setImagePlacement:(unint64_t)a3
{
  if (self->_imagePlacement != a3)
  {
    self->_imagePlacement = a3;
    -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
    -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImagePadding:(double)a3
{
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    self->_imagePadding = a3;
    -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
    -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImageView:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_loadWeakRetained((id *)&self->_imageView);
    objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), &kImageViewBoundsContext);

    v7 = objc_loadWeakRetained((id *)&self->_imageView);
    objc_msgSend(v7, "removeObserver:forKeyPath:context:", self, CFSTR("frame"), &kImageViewBoundsContext);

    v8 = objc_loadWeakRetained((id *)&self->_imageView);
    objc_msgSend(v8, "removeFromSuperview");

    v9 = objc_storeWeak((id *)&self->_imageView, obj);
    if (obj)
    {
      v10 = objc_loadWeakRetained((id *)&self->_imageView);
      objc_msgSend(v10, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAnchorPoint:", 0.5, 1.0);

      v12 = objc_loadWeakRetained((id *)&self->_imageView);
      objc_msgSend(v12, "sizeToFit");

      v13 = objc_loadWeakRetained((id *)&self->_imageView);
      objc_msgSend(v13, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 3, &kImageViewBoundsContext);

      v14 = objc_loadWeakRetained((id *)&self->_imageView);
      objc_msgSend(v14, "addObserver:forKeyPath:options:context:", self, CFSTR("frame"), 3, &kImageViewBoundsContext);

      v15 = objc_loadWeakRetained((id *)&self->_imageView);
      -[CLKUICurvedLabel addSubview:](self, "addSubview:", v15);

    }
    else
    {
      self->_imagePlacement = 0;
    }
    -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUICurvedLabel _updateMaxSize](self, "_updateMaxSize");
    -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
    -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
    v5 = obj;
  }

}

- (void)setImageViewOverrideSize:(CGSize)a3
{
  if (self->_imageViewOverrideSize.width != a3.width || self->_imageViewOverrideSize.height != a3.height)
  {
    self->_imageViewOverrideSize = a3;
    -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
    -[CLKUICurvedLabel _updateMaxSize](self, "_updateMaxSize");
    -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
    -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImageView:(id)a3 placement:(unint64_t)a4 padding:(double)a5
{
  self->_imagePlacement = a4;
  self->_imagePadding = a5;
  -[CLKUICurvedLabel setImageView:](self, "setImageView:", a3);
}

- (BOOL)_hasImage
{
  CGRect v3;

  if (!self->_imagePlacement)
    return 0;
  -[CLKUICurvedLabel _imageBounds](self, "_imageBounds");
  return !CGRectIsEmpty(v3);
}

- (void)invalidateCachedSize
{
  NSNumber *isTextTruncated;
  CGSize v4;
  CGPoint v5;

  self->_cachedSizeIsValid = 0;
  isTextTruncated = self->_isTextTruncated;
  self->_isTextTruncated = 0;

  self->_cachedSize = (CGSize)*MEMORY[0x1E0C9D820];
  v5 = (CGPoint)*MEMORY[0x1E0C9D648];
  v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_cachedBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_cachedBounds.size = v4;
  self->_cachedGlyphsBoundingRect.origin = v5;
  self->_cachedGlyphsBoundingRect.size = v4;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[13];
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLKUICurvedLabel;
  -[CLKUICurvedLabel layoutSubviews](&v9, sel_layoutSubviews);
  v3 = -[CLKUICurvedLabel _hasImage](self, "_hasImage");
  WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend(WeakRetained, "setHidden:", 0);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __34__CLKUICurvedLabel_layoutSubviews__block_invoke;
    v8[3] = &unk_1E86E0A08;
    v8[4] = self;
    -[CLKUICurvedLabel _transformForImage:](self, "_transformForImage:", v8);
    -[CLKUICurvedLabel transformForImage](self, "transformForImage");
    -[CLKUICurvedLabel imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)v7 = *(_OWORD *)&v7[7];
    *(_OWORD *)&v7[2] = *(_OWORD *)&v7[9];
    *(_OWORD *)&v7[4] = *(_OWORD *)&v7[11];
    objc_msgSend(v6, "setTransform:", v7);

  }
  else
  {
    objc_msgSend(WeakRetained, "setHidden:", 1);

  }
}

void __34__CLKUICurvedLabel_layoutSubviews__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "imageView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  objc_msgSend(v14, "setBounds:");
  objc_msgSend(v14, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "anchorPoint");
  v11 = v10;
  v13 = v12;

  objc_msgSend(v14, "setCenter:", a2 + v11 * a4, a3 + v13 * a5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  double width;
  double height;
  CGSize result;

  if (!self->_cachedSizeIsValid)
  {
    -[CLKUICurvedLabel _glyphsBoundingRect](self, "_glyphsBoundingRect", a3.width, a3.height);
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    CLKCeilForDevice();
    v7 = v6;
    CLKCeilForDevice();
    self->_cachedSize.width = v7;
    self->_cachedSize.height = v8;
    self->_cachedSizeIsValid = 1;

  }
  width = self->_cachedSize.width;
  height = self->_cachedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  UIFont *font;
  void *v9;
  void *v10;
  NSAttributedString *attributedStringUnmodified;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, uint64_t);
  void *v17;
  id v18;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CLKUICurvedLabel;
  v4 = a3;
  -[CLKUICurvedLabel traitCollectionDidChange:](&v20, sel_traitCollectionDidChange_, v4);
  -[CLKUICurvedLabel traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "legibilityWeight");
  v7 = objc_msgSend(v4, "legibilityWeight");

  if (v6 != v7)
  {
    font = self->_font;
    if (font)
    {
      -[UIFont _fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:](font, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUICurvedLabel setFont:](self, "setFont:", v9);

    }
    if (!self->_storageIsNonAttributedText)
    {
      v10 = (void *)-[NSAttributedString mutableCopy](self->_attributedStringUnmodified, "mutableCopy");
      attributedStringUnmodified = self->_attributedStringUnmodified;
      v12 = -[NSAttributedString length](attributedStringUnmodified, "length");
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __45__CLKUICurvedLabel_traitCollectionDidChange___block_invoke;
      v17 = &unk_1E86E0A30;
      v18 = v5;
      v19 = v10;
      v13 = v10;
      -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](attributedStringUnmodified, "enumerateAttributesInRange:options:usingBlock:", 0, v12, 0x100000, &v14);
      -[CLKUICurvedLabel setAttributedText:](self, "setAttributedText:", v13, v14, v15, v16, v17);

    }
  }

}

void __45__CLKUICurvedLabel_traitCollectionDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  BOOL v9;
  id v10;

  v7 = *MEMORY[0x1E0DC32A0];
  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0DC32A0]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9 && (objc_msgSend(v10, "isEqual:", v8) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v7, v8, a3, a4);

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
  uint64_t v12;
  _QWORD v13[7];
  _QWORD v14[6];
  CGAffineTransform transform;
  _QWORD v16[4];
  CGFloat v17;
  CGFloat v18;
  CGRect ImageBounds;

  -[CLKUICurvedLabel _glyphsBoundingRect](self, "_glyphsBoundingRect");
  -[CLKUICurvedLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:");
  v5 = v4;
  v7 = v6;
  v8 = -[CLKUICurvedLabel _newLineFromDrawableTextStorage](self, "_newLineFromDrawableTextStorage");
  ImageBounds = CTLineGetImageBounds(v8, 0);
  x = ImageBounds.origin.x;
  y = ImageBounds.origin.y;
  CFRelease(v8);
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3010000000;
  v16[3] = "";
  v17 = x;
  v18 = y;
  if (self->_hasMonospacedNumbers)
    v17 = 0.0;
  CurrentContext = UIGraphicsGetCurrentContext();
  if (!self->_usesPath)
  {
    CGAffineTransformMakeTranslation(&transform, v5, v7);
    CGContextConcatCTM(CurrentContext, &transform);
  }
  v12 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __35__CLKUICurvedLabel_drawTextInRect___block_invoke;
  v14[3] = &unk_1E86E0A58;
  v14[4] = self;
  v14[5] = v16;
  -[CLKUICurvedLabel _transformForImage:](self, "_transformForImage:", v14);
  v13[0] = v12;
  v13[1] = 3221225472;
  v13[2] = __35__CLKUICurvedLabel_drawTextInRect___block_invoke_2;
  v13[3] = &unk_1E86E0A80;
  v13[5] = v16;
  v13[6] = CurrentContext;
  v13[4] = self;
  -[CLKUICurvedLabel _enumerateTransformsForDrawableCharacters:](self, "_enumerateTransformsForDrawableCharacters:", v13);
  _Block_object_dispose(v16, 8);
}

uint64_t __35__CLKUICurvedLabel_drawTextInRect___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  uint64_t result;
  double Width;
  double v12;
  CGRect v13;

  result = objc_msgSend(*(id *)(a1 + 32), "imagePlacement");
  if (result == 1)
  {
    v13.origin.x = a2;
    v13.origin.y = a3;
    v13.size.width = a4;
    v13.size.height = a5;
    Width = CGRectGetWidth(v13);
    result = objc_msgSend(*(id *)(a1 + 32), "imagePadding");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 32)
                                                                - (Width
                                                                 + v12);
  }
  return result;
}

void __35__CLKUICurvedLabel_drawTextInRect___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, double a5, double a6)
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

  -[CLKUICurvedLabel _glyphsBoundingRect](self, "_glyphsBoundingRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CLKUICurvedLabel bounds](self, "bounds");
  -[CLKUICurvedLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:", v4, v6, v8, v10, v11, v12, v13, v14);
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

  v13 = xmmword_1CB9E2A40;
  v4 = -[CLKUICurvedLabel _drawableCharacterRange:](self, "_drawableCharacterRange:", &v13);
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

- (void)getTextCenter:(CGPoint *)a3 startAngle:(double *)a4 endAngle:(double *)a5
{
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
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double centerAngle;
  double MidX;
  __double2 v35;
  CGFloat MinY;
  __CTLine *v37;
  __CTLine *v38;
  double TypographicBounds;
  double v40;
  double v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGRect v48;
  CGRect v49;
  CGRect ImageBounds;
  CGRect v51;

  if (-[NSTextStorage length](self->_textStorage, "length") || -[CLKUICurvedLabel _hasImage](self, "_hasImage"))
  {
    -[CLKUICurvedLabel _distance](self, "_distance");
    v10 = v9;
    -[CLKUICurvedLabel _glyphsBoundingRect](self, "_glyphsBoundingRect");
    if (a3)
    {
      v15 = v11;
      v16 = v12;
      v17 = v13;
      v18 = v14;
      v47 = v10;
      if (-[NSTextStorage length](self->_textStorage, "length"))
      {
        -[NSLayoutManager locationForGlyphAtIndex:](self->_layoutManager, "locationForGlyphAtIndex:", 0);
        -[CLKUICurvedLabel bounds](self, "bounds", v19);
      }
      else
      {
        -[UIFont ascender](self->_font, "ascender");
        -[CLKUICurvedLabel bounds](self, "bounds", v24);
      }
      -[CLKUICurvedLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:", v15, v16, v17, v18, v20, v21, v22, v23);
      v26 = v25;
      v28 = v27;
      -[CLKUICurvedLabel bounds](self, "bounds");
      x = v48.origin.x;
      y = v48.origin.y;
      width = v48.size.width;
      height = v48.size.height;
      centerAngle = self->_centerAngle;
      MidX = CGRectGetMidX(v48);
      v35 = __sincos_stret(centerAngle);
      v49.origin.x = x;
      v49.origin.y = y;
      v49.size.width = width;
      v10 = v47;
      v49.size.height = height;
      MinY = CGRectGetMinY(v49);
      a3->x = v26 + MidX - v47 * v35.__sinval;
      a3->y = v28 + v46 + MinY - v47 * v35.__cosval;
    }
    v37 = -[CLKUICurvedLabel _newLineFromDrawableTextStorage](self, "_newLineFromDrawableTextStorage");
    v38 = v37;
    if (self->_hasMonospacedNumbers)
    {
      TypographicBounds = CTLineGetTypographicBounds(v37, 0, 0, 0);
    }
    else
    {
      ImageBounds = CTLineGetImageBounds(v37, 0);
      TypographicBounds = CGRectGetWidth(ImageBounds);
    }
    v40 = TypographicBounds;
    CFRelease(v38);
    if (-[CLKUICurvedLabel _hasImage](self, "_hasImage"))
    {
      -[CLKUICurvedLabel _imageBounds](self, "_imageBounds");
      v41 = CGRectGetWidth(v51);
      -[CLKUICurvedLabel _drawableCharacterRange:](self, "_drawableCharacterRange:", 0);
      if (v42)
        v41 = v41 + self->_imagePadding;
      v40 = v40 + v41;
    }
    v43 = dbl_1CB9E2A30[!self->_interior];
    if (a4)
    {
      v44 = 0.0;
      if (v10 != 0.0)
        v44 = (v40 * -0.5 + 0.0) / v10 + self->_centerAngle;
      *a4 = v43 - v44;
    }
    if (a5)
    {
      v45 = 0.0;
      if (v10 != 0.0)
        v45 = (v40 + v40 * -0.5) / v10 + self->_centerAngle;
      *a5 = v43 - v45;
    }
  }
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
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double *p_x;
  CGSize size;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  CGRect *v27;
  uint64_t v28;
  const char *v29;
  __int128 v30;
  __int128 v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  p_cachedBounds = &self->_cachedBounds;
  -[CLKUICurvedLabel bounds](self, "bounds");
  v34.origin.x = v4;
  v34.origin.y = v5;
  v34.size.width = v6;
  v34.size.height = v7;
  if (CGRectEqualToRect(*p_cachedBounds, v34) && !CGRectIsEmpty(self->_cachedGlyphsBoundingRect))
  {
    x = self->_cachedGlyphsBoundingRect.origin.x;
    y = self->_cachedGlyphsBoundingRect.origin.y;
    width = self->_cachedGlyphsBoundingRect.size.width;
    height = self->_cachedGlyphsBoundingRect.size.height;
  }
  else
  {
    v26 = 0;
    v27 = (CGRect *)&v26;
    v28 = 0x4010000000;
    v29 = "";
    v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v9 = MEMORY[0x1E0C809B0];
    v30 = *MEMORY[0x1E0C9D628];
    v31 = v8;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __39__CLKUICurvedLabel__glyphsBoundingRect__block_invoke;
    v25[3] = &unk_1E86E0AA8;
    v25[4] = &v26;
    -[CLKUICurvedLabel _transformForImage:](self, "_transformForImage:", v25);
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __39__CLKUICurvedLabel__glyphsBoundingRect__block_invoke_2;
    v24[3] = &unk_1E86E0AD0;
    v24[4] = &v26;
    -[CLKUICurvedLabel _enumerateTransformsForDrawableCharacters:](self, "_enumerateTransformsForDrawableCharacters:", v24);
    v32 = CGRectInset(v27[1], 0.0, -1.0);
    v27[1] = v32;
    -[CLKUICurvedLabel bounds](self, "bounds");
    p_cachedBounds->origin.x = v10;
    p_cachedBounds->origin.y = v11;
    p_cachedBounds->size.width = v12;
    p_cachedBounds->size.height = v13;
    p_x = &v27->origin.x;
    size = v27[1].size;
    self->_cachedGlyphsBoundingRect.origin = v27[1].origin;
    self->_cachedGlyphsBoundingRect.size = size;
    x = p_x[4];
    y = p_x[5];
    width = p_x[6];
    height = p_x[7];
    _Block_object_dispose(&v26, 8);
  }
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

void __39__CLKUICurvedLabel__glyphsBoundingRect__block_invoke(uint64_t a1, _OWORD *a2, double a3, double a4, double a5, double a6)
{
  __int128 v7;
  CGAffineTransform v8;
  CGRect v9;

  v7 = a2[1];
  *(_OWORD *)&v8.a = *a2;
  *(_OWORD *)&v8.c = v7;
  *(_OWORD *)&v8.tx = a2[2];
  v9 = CGRectApplyAffineTransform(*(CGRect *)&a3, &v8);
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(v9, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32));
}

void __39__CLKUICurvedLabel__glyphsBoundingRect__block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, _OWORD *a10)
{
  double v10;
  __int128 v13;
  CGAffineTransform v15;
  CGRect v16;

  v10 = a5;
  v13 = a10[1];
  *(_OWORD *)&v15.a = *a10;
  *(_OWORD *)&v15.c = v13;
  *(_OWORD *)&v15.tx = a10[2];
  *(double *)&v13 = a7;
  v16 = CGRectApplyAffineTransform(*(CGRect *)(&v10 - 1), &v15);
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(v16, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32));
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
  -[CLKUICurvedLabel _enumerateTransforms:callback:](self, "_enumerateTransforms:callback:", 0, a3);
}

- (void)_transformForImage:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CLKUICurvedLabel__transformForImage___block_invoke;
  v6[3] = &unk_1E86E0AF8;
  v7 = v4;
  v5 = v4;
  -[CLKUICurvedLabel _enumerateTransforms:callback:](self, "_enumerateTransforms:callback:", 1, v6);

}

uint64_t __39__CLKUICurvedLabel__transformForImage___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, __int128 *a10)
{
  uint64_t (*v11)(double, double, double, double);
  __int128 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v11 = *(uint64_t (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16);
  v12 = a10[1];
  v14 = *a10;
  v15 = v12;
  v16 = a10[2];
  return v11(a4, a5, a6, a7);
}

- (void)_enumerateTransforms:(BOOL)a3 callback:(id)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  _BOOL4 v7;
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
  CGFloat width;
  CGFloat MinX;
  double TypographicBounds;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  __int128 v40;
  unint64_t imagePlacement;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  CGFloat v54;
  CGFloat v55;
  double MidX;
  void *v57;
  CGFloat v58;
  double v59;
  double v60;
  double v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  void (*v66)(_QWORD *, uint64_t, _QWORD, __int128 *, double, double, double, double, double, double);
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  uint64_t v76;
  void *v77;
  double MaxX;
  double v79;
  CGFloat v80;
  double v81;
  double v82;
  CGFloat v83;
  CGFloat v84;
  double v85;
  double v86;
  void (*v87)(_QWORD *, uint64_t, _QWORD, __int128 *, double, double, double, double, double, double);
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  double v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  void (*v96)(_QWORD *, _QWORD, _QWORD, __int128 *, double, double, double, double, double, double);
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat rect;
  double v101;
  double v102;
  double v103;
  CGFloat v104;
  CGFloat v105;
  CGFloat v106;
  unint64_t v107;
  double v108;
  CGFloat v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  _QWORD v114[5];
  _QWORD *v115;
  double v116;
  CGFloat v117;
  __int128 v118;
  uint64_t v119;
  double v120;
  double v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  BOOL v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _OWORD v135[2];
  CGRect ImageBounds;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;

  v4 = a3;
  v113 = a4;
  v6 = -[CLKUICurvedLabel _hasImage](self, "_hasImage");
  v7 = v6;
  if (!v4 || v6)
  {
    -[CLKUICurvedLabel bounds](self, "bounds");
    v111 = v9;
    v112 = v8;
    v110 = v10;
    v12 = v11;
    -[CLKUICurvedLabel _distance](self, "_distance");
    v14 = v13;
    v15 = -[CLKUICurvedLabel _newLineFromDrawableTextStorage](self, "_newLineFromDrawableTextStorage");
    ImageBounds = CTLineGetImageBounds(v15, 0);
    x = ImageBounds.origin.x;
    y = ImageBounds.origin.y;
    width = ImageBounds.size.width;
    rect = ImageBounds.size.height;
    MinX = 0.0;
    TypographicBounds = 0.0;
    if (self->_hasMonospacedNumbers)
      TypographicBounds = CTLineGetTypographicBounds(v15, 0, 0, 0);
    CFRelease(v15);
    v98 = width;
    v99 = y;
    if (self->_hasMonospacedNumbers)
    {
      v21 = TypographicBounds;
    }
    else
    {
      v137.origin.x = x;
      v137.origin.y = y;
      v137.size.width = width;
      v137.size.height = rect;
      v22 = CGRectGetWidth(v137);
      v23 = width;
      v21 = v22;
      if (!self->_hasMonospacedNumbers)
      {
        v24 = x;
        v25 = y;
        v26 = rect;
        MinX = CGRectGetMinX(*(CGRect *)(&v23 - 2));
      }
    }
    v135[0] = xmmword_1CB9E2A40;
    v27 = -[CLKUICurvedLabel _drawableCharacterRange:](self, "_drawableCharacterRange:", v135);
    v29 = v28;
    v30 = 0.0;
    if (v7)
    {
      -[CLKUICurvedLabel _imageBounds](self, "_imageBounds");
      v31 = CGRectGetWidth(v138);
      if (v29)
        v31 = v31 + self->_imagePadding;
      v32 = x;
      v21 = v21 + v31;
      if (self->_imagePlacement == 1)
        v30 = v31;
      else
        v30 = 0.0;
    }
    else
    {
      v32 = x;
    }
    if (self->_usesPath)
    {
      -[CLKUICurvedPathGlyphLayoutProvider setTextAlignment:](self->_pathGlyphLayoutProvider, "setTextAlignment:", self->_textAlignment);
      -[CLKUICurvedPathGlyphLayoutProvider setUsedWidth:](self->_pathGlyphLayoutProvider, "setUsedWidth:", v21);
      v32 = x;
    }
    if (v4 && v7)
    {
      -[CLKUICurvedLabel _imageBounds](self, "_imageBounds");
      v36 = v35;
      v38 = v37;
      v39 = v34;
      v40 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v132 = *MEMORY[0x1E0C9BAA8];
      v133 = v40;
      v134 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      if (v29)
      {
        v101 = v14;
        imagePlacement = self->_imagePlacement;
        v105 = v34;
        v42 = v38;
        v43 = v33;
        -[NSLayoutManager locationForGlyphAtIndex:](self->_layoutManager, "locationForGlyphAtIndex:", -[NSLayoutManager glyphIndexForCharacterAtIndex:](self->_layoutManager, "glyphIndexForCharacterAtIndex:", 0));
        v45 = v44;
        v47 = v46;
        -[NSLayoutManager locationForGlyphAtIndex:](self->_layoutManager, "locationForGlyphAtIndex:", -[NSLayoutManager glyphIndexForCharacterAtIndex:](self->_layoutManager, "glyphIndexForCharacterAtIndex:", v27 + v29 - 1));
        if (imagePlacement == 1)
          v50 = v47;
        else
          v50 = v49;
        if (imagePlacement != 1)
          v49 = v47;
        if (v45 >= v48)
          v51 = v49;
        else
          v51 = v50;
        v139.origin.x = v36;
        v139.origin.y = v43;
        v38 = v42;
        v39 = v105;
        v139.size.width = v38;
        v139.size.height = v105;
        v52 = v51 - CGRectGetHeight(v139);
        v108 = v52;
        if (imagePlacement == 1)
        {
          v36 = 0.0;
          v53 = 0;
          v54 = v38;
          v55 = v105;
          MidX = CGRectGetMidX(*(CGRect *)(&v52 - 1));
        }
        else
        {
          v88 = v36;
          v89 = v38;
          v90 = v105;
          v91 = v52;
          v151.origin.x = v21 - CGRectGetWidth(*(CGRect *)(&v52 - 1));
          v151.origin.y = v91;
          v36 = v151.origin.x;
          v151.size.width = v38;
          v151.size.height = v105;
          MidX = v21 + CGRectGetWidth(v151) * -0.5;
        }
        -[CLKUICurvedLabel centerAngle](self, "centerAngle");
        -[CLKUICurvedLabel _transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:](self, "_transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:", MidX, v51, v21, v101, v92, v112, v111, v110, v12);
        v33 = v108;
      }
      else
      {
        MidX = *MEMORY[0x1E0C9D538];
        v51 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      }
      v93 = v36;
      v94 = v38;
      v95 = v39;
      v152 = CGRectOffset(*(CGRect *)(&v33 - 1), -MidX, -v51);
      v96 = (void (*)(_QWORD *, _QWORD, _QWORD, __int128 *, double, double, double, double, double, double))v113[2];
      v129 = v132;
      v130 = v133;
      v131 = v134;
      v96(v113, 0, 0, &v129, MidX, v51, v152.origin.x, v152.origin.y, v152.size.width, v152.size.height);
    }
    else
    {
      v97 = v32;
      v102 = v14;
      if (self->_hasMonospacedNumbers)
      {
        -[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC32A0], 0, 0);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v140.origin.x = v97;
        v140.size.width = v98;
        v140.origin.y = v99;
        v140.size.height = rect;
        v58 = CGRectGetMinX(v140);
        objc_msgSend(v57, "xHeight");
        v106 = v59;
        -[NSLayoutManager locationForGlyphAtIndex:](self->_layoutManager, "locationForGlyphAtIndex:", 0);
        v61 = v60;
        v103 = v60;
        v141.origin.y = 0.0;
        v141.origin.x = v30 + v62 + 0.0;
        v63 = v141.origin.x;
        v141.size.width = v58;
        v141.size.height = v106;
        v142.origin.y = v61 - CGRectGetMaxY(v141);
        v104 = v142.origin.y;
        v142.origin.x = v63;
        v142.size.width = v58;
        v142.size.height = v106;
        v64 = CGRectGetMidX(v142);
        v133 = 0u;
        v134 = 0u;
        v132 = 0u;
        -[CLKUICurvedLabel centerAngle](self, "centerAngle");
        -[CLKUICurvedLabel _transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:](self, "_transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:", v64, v103, v21, v102, v65, v112, v111, v110, v12);
        v143.origin.x = v63;
        v14 = v102;
        v143.origin.y = v104;
        v143.size.height = v106;
        v143.size.width = v58;
        v144 = CGRectOffset(v143, -v64, -v103);
        v66 = (void (*)(_QWORD *, uint64_t, _QWORD, __int128 *, double, double, double, double, double, double))v113[2];
        v129 = v132;
        v130 = v133;
        v131 = v134;
        v66(v113, 0x7FFFFFFFFFFFFFFFLL, 0, &v129, v64, v103, v144.origin.x, v144.origin.y, v144.size.width, v144.size.height);

      }
      v107 = v27 + v29;
      while (v27 < v107)
      {
        v132 = xmmword_1CB9E2A40;
        v68 = -[NSLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self->_layoutManager, "glyphRangeForCharacterRange:actualCharacterRange:", v27, 1, &v132);
        v69 = *(_QWORD *)&v135[0];
        v70 = v132;
        if (*(_QWORD *)&v135[0] == (_QWORD)v132)
          v71 = 1;
        else
          v71 = v67;
        v72 = (void *)objc_opt_new();
        v73 = v71;
        v74 = v68;
        if (v68 < v71 + v68)
        {
          do
          {
            if ((-[NSLayoutManager propertyForGlyphAtIndex:](self->_layoutManager, "propertyForGlyphAtIndex:", v74) & 1) == 0)
              objc_msgSend(v72, "addIndex:", v74);
            ++v74;
            --v73;
          }
          while (v73);
        }
        v114[0] = MEMORY[0x1E0C809B0];
        v114[1] = 3221225472;
        v114[2] = __50__CLKUICurvedLabel__enumerateTransforms_callback___block_invoke;
        v114[3] = &unk_1E86E0B20;
        v114[4] = self;
        v116 = v30;
        v117 = MinX;
        v118 = v132;
        v119 = v71;
        v128 = v69 == v70;
        v120 = v21;
        v121 = v14;
        v122 = v112;
        v123 = v111;
        v124 = v110;
        v125 = v12;
        if (v69 == v70)
          v75 = (char *)v135 + 8;
        else
          v75 = (char *)&v132 + 8;
        v115 = v113;
        v126 = v68;
        v127 = v71;
        objc_msgSend(v72, "enumerateRangesUsingBlock:", v114);
        v76 = *(_QWORD *)v75;
        if (*(_QWORD *)v75 <= 1uLL)
          v76 = 1;
        v27 += v76;

      }
      if (self->_hasMonospacedNumbers)
      {
        -[NSTextStorage attribute:atIndex:effectiveRange:](self->_textStorage, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC32A0], v107 - 1, 0);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v145.origin.x = v97;
        v145.origin.y = v99;
        v145.size.width = v98;
        v145.size.height = rect;
        v109 = TypographicBounds - CGRectGetMaxX(v145);
        v146.origin.x = v97;
        v146.origin.y = v99;
        v146.size.width = v98;
        v146.size.height = rect;
        MaxX = CGRectGetMaxX(v146);
        objc_msgSend(v77, "xHeight");
        v80 = v79;
        -[NSLayoutManager locationForGlyphAtIndex:](self->_layoutManager, "locationForGlyphAtIndex:", -[NSLayoutManager glyphIndexForCharacterAtIndex:](self->_layoutManager, "glyphIndexForCharacterAtIndex:", v107 - 1));
        v82 = v81;
        v83 = v30 + MaxX;
        v147.origin.y = 0.0;
        v147.origin.x = v83;
        v147.size.width = v109;
        v147.size.height = v80;
        v84 = v82 - CGRectGetMaxY(v147);
        v148.origin.x = v83;
        v148.origin.y = v84;
        v148.size.width = v109;
        v148.size.height = v80;
        v85 = CGRectGetMidX(v148);
        v133 = 0u;
        v134 = 0u;
        v132 = 0u;
        -[CLKUICurvedLabel centerAngle](self, "centerAngle");
        -[CLKUICurvedLabel _transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:](self, "_transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:", v85, v82, v21, v102, v86, v112, v111, v110, v12);
        v149.origin.x = v83;
        v149.origin.y = v84;
        v149.size.width = v109;
        v149.size.height = v80;
        v150 = CGRectOffset(v149, -v85, -v82);
        v87 = (void (*)(_QWORD *, uint64_t, _QWORD, __int128 *, double, double, double, double, double, double))v113[2];
        v129 = v132;
        v130 = v133;
        v131 = v134;
        v87(v113, 0x7FFFFFFFFFFFFFFFLL, 0, &v129, v85, v82, v150.origin.x, v150.origin.y, v150.size.width, v150.size.height);

      }
    }
  }

}

void __50__CLKUICurvedLabel__enumerateTransforms_callback___block_invoke(uint64_t a1, uint64_t a2, CFIndex a3)
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
  const __CTFont *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const CGGlyph *v22;
  double x;
  CGFloat y;
  CGFloat width;
  double v26;
  CGFloat height;
  double v28;
  double v29;
  double MidX;
  void *v31;
  double v32;
  double v33;
  double v34;
  void (*v35)(double, double, double, double, double, double);
  _OWORD v36[3];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  CGRect BoundingRectsForGlyphs;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v40 = *MEMORY[0x1E0C80C00];
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
  v14 = v7 + *(double *)(a1 + 48) - *(double *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 808), "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC32A0], *(_QWORD *)(a1 + 64), 0);
  v15 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1E0C80A78](v15, v16, v17, v18, v19, v20);
  v22 = (const CGGlyph *)((char *)v36 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 816), "getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels:", a2, a3, v22, 0, 0, 0);
  BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs(v15, kCTFontOrientationDefault, v22, 0, a3);
  x = BoundingRectsForGlyphs.origin.x;
  y = BoundingRectsForGlyphs.origin.y;
  width = BoundingRectsForGlyphs.size.width;
  if (*(_BYTE *)(a1 + 152))
  {
    -[__CTFont xHeight](v15, "xHeight");
    height = v26;
  }
  else
  {
    height = BoundingRectsForGlyphs.size.height;
  }
  v28 = v14 + x;
  v42.origin.x = v28;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v29 = v9 - CGRectGetMaxY(v42);
  v43.origin.x = v28;
  v43.origin.y = v29;
  v43.size.width = width;
  v43.size.height = height;
  MidX = CGRectGetMidX(v43);
  v38 = 0u;
  v39 = 0u;
  v37 = 0u;
  v31 = *(void **)(a1 + 32);
  v32 = *(double *)(a1 + 88);
  v33 = *(double *)(a1 + 96);
  objc_msgSend(v31, "centerAngle");
  if (v31)
  {
    objc_msgSend(v31, "_transformForLayoutLocation:usedWidth:distance:centerAngle:bounds:", MidX, v9, v32, v33, v34, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128));
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    v37 = 0u;
  }
  v44.origin.x = v28;
  v44.origin.y = v29;
  v44.size.width = width;
  v44.size.height = height;
  v45 = CGRectOffset(v44, -MidX, -v9);
  v35 = *(void (**)(double, double, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16);
  v36[0] = v37;
  v36[1] = v38;
  v36[2] = v39;
  v35(MidX, v9, v45.origin.x, v45.origin.y, v45.size.width, v45.size.height);

}

- (CGAffineTransform)_transformForLayoutLocation:(SEL)a3 usedWidth:(CGPoint)a4 distance:(double)a5 centerAngle:(double)a6 bounds:(double)a7
{
  double y;
  double x;
  uint64_t v12;
  CGAffineTransform *result;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  y = a4.y;
  x = a4.x;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  if (self->_usesPath)
  {
    v12 = 1000;
    -[CLKUICurvedPathGlyphLayoutProvider setLayoutLocation:](self->_pathGlyphLayoutProvider, "setLayoutLocation:", a4.x, a4.y, a5, a6, a7);
  }
  else
  {
    v12 = 992;
    -[CLKUICurvedCircleGlyphLayoutProvider setCenterAngle:](self->_circleGlyphLayoutProvider, "setCenterAngle:", self->_centerAngle, a4.y, a5, a6, a7);
    -[CLKUICurvedCircleGlyphLayoutProvider setLayoutLocation:](self->_circleGlyphLayoutProvider, "setLayoutLocation:", x, y);
    -[CLKUICurvedCircleGlyphLayoutProvider setUsedWidth:](self->_circleGlyphLayoutProvider, "setUsedWidth:", a5);
    -[CLKUICurvedCircleGlyphLayoutProvider setDistance:](self->_circleGlyphLayoutProvider, "setDistance:", a6);
    -[CLKUICurvedCircleGlyphLayoutProvider setBounds:](self->_circleGlyphLayoutProvider, "setBounds:", a8.origin.x, a8.origin.y, a8.size.width, a8.size.height);
  }
  result = *(CGAffineTransform **)((char *)&self->super.super.super.super.isa + v12);
  if (result)
  {
    result = (CGAffineTransform *)-[CGAffineTransform makeTransform](result, "makeTransform");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }
  *(_OWORD *)&retstr->a = v16;
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tx = v18;
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  if (a6 == &kImageViewBoundsContext)
  {
    v7 = *MEMORY[0x1E0CB2CC8];
    v8 = a5;
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "CGRectValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "CGRectValue");
    if (!CLKFloatEqualsFloat() || (CLKFloatEqualsFloat() & 1) == 0)
    {
      -[CLKUICurvedLabel _updateMaxSize](self, "_updateMaxSize");
      -[CLKUICurvedLabel invalidateCachedSize](self, "invalidateCachedSize");
      -[CLKUICurvedLabel setNeedsDisplay](self, "setNeedsDisplay");
      -[CLKUICurvedLabel setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (CGRect)_imageBounds
{
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[CLKUICurvedLabel imageViewOverrideSize](self, "imageViewOverrideSize");
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
    objc_msgSend(WeakRetained, "bounds");
    v6 = v13;
    v7 = v14;
    v9 = v15;
    v11 = v16;

  }
  else
  {
    v6 = *MEMORY[0x1E0C9D538];
    v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[CLKUICurvedLabel imageViewOverrideSize](self, "imageViewOverrideSize");
    v9 = v8;
    v11 = v10;
  }
  v17 = v6;
  v18 = v7;
  v19 = v9;
  v20 = v11;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGAffineTransform)transformForImage
{
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
  CGFloat v17;
  CGFloat v18;
  uint64_t *v19;
  __int128 v20;
  CGAffineTransform *result;
  _QWORD v22[6];
  CGAffineTransform v23;
  CGAffineTransform v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  const char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  v25 = 0;
  v26 = &v25;
  v27 = 0x5010000000;
  v28 = "";
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CLKUICurvedLabel _glyphsBoundingRect](self, "_glyphsBoundingRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CLKUICurvedLabel bounds](self, "bounds");
  -[CLKUICurvedLabel _offsetOfBoundingRect:inRect:](self, "_offsetOfBoundingRect:inRect:", v6, v8, v10, v12, v13, v14, v15, v16);
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, v17, v18);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __37__CLKUICurvedLabel_transformForImage__block_invoke;
  v22[3] = &unk_1E86E0B48;
  v22[4] = self;
  v22[5] = &v25;
  v23 = v24;
  -[CLKUICurvedLabel _transformForImage:](self, "_transformForImage:", v22);
  v19 = v26;
  v20 = *((_OWORD *)v26 + 3);
  *(_OWORD *)&retstr->a = *((_OWORD *)v26 + 2);
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v19 + 4);
  _Block_object_dispose(&v25, 8);
  return result;
}

__n128 __37__CLKUICurvedLabel_transformForImage__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGAffineTransform v8;
  CGAffineTransform t1;
  CGAffineTransform v10;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 985))
  {
    result = *(__n128 *)a2;
    v4 = *(_OWORD *)(a2 + 32);
    *(_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48) = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v2 + 32) = v4;
    *(__n128 *)v2 = result;
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a2;
    *(_OWORD *)&t1.c = v5;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a2 + 32);
    v6 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&v8.a = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&v8.c = v6;
    *(_OWORD *)&v8.tx = *(_OWORD *)(a1 + 80);
    CGAffineTransformConcat(&v10, &t1, &v8);
    v7 = *(_OWORD *)&v10.c;
    result = *(__n128 *)&v10.tx;
    *(_OWORD *)v2 = *(_OWORD *)&v10.a;
    *(_OWORD *)(v2 + 16) = v7;
    *(__n128 *)(v2 + 32) = result;
  }
  return result;
}

- (CGPoint)centerForImage
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CGPoint result;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x3010000000;
  v12 = 0;
  v10 = "";
  v11 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__CLKUICurvedLabel_centerForImage__block_invoke;
  v6[3] = &unk_1E86E0AA8;
  v6[4] = &v7;
  -[CLKUICurvedLabel _transformForImage:](self, "_transformForImage:", v6);
  v2 = v8[4];
  v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  v4 = v2;
  v5 = v3;
  result.y = v5;
  result.x = v4;
  return result;
}

double __34__CLKUICurvedLabel_centerForImage__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result;
  uint64_t v6;

  result = a2 + a4 * 0.5;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(double *)(v6 + 32) = result;
  *(double *)(v6 + 40) = a3 + a5 * 0.5;
  return result;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (UIBezierPath)path
{
  return self->_path;
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

- (double)tracking
{
  return self->_tracking;
}

- (BOOL)attributedTextProvidesColor
{
  return self->_attributedTextProvidesColor;
}

- (void)setAttributedTextProvidesColor:(BOOL)a3
{
  self->_attributedTextProvidesColor = a3;
}

- (unint64_t)imagePlacement
{
  return self->_imagePlacement;
}

- (double)imagePadding
{
  return self->_imagePadding;
}

- (UIView)imageView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_imageView);
}

- (double)animationAlpha
{
  return self->_animationAlpha;
}

- (CGSize)imageViewOverrideSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageViewOverrideSize.width;
  height = self->_imageViewOverrideSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_imageView);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathGlyphLayoutProvider, 0);
  objc_storeStrong((id *)&self->_circleGlyphLayoutProvider, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_attributedStringUnmodified, 0);
  objc_storeStrong((id *)&self->_attributedStringWithoutColorModification, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_isTextTruncated, 0);
  objc_storeStrong((id *)&self->_textContainer, 0);
  objc_storeStrong((id *)&self->_layoutManager, 0);
  objc_storeStrong((id *)&self->_textStorage, 0);
}

@end
