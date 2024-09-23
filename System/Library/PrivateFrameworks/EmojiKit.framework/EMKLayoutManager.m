@implementation EMKLayoutManager

- (EMKLayoutManager)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  EMKGlyphRippler *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  EMKTextEnumerator *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EMKLayoutManager;
  v2 = -[EMKLayoutManager init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3778], "emptyAttributedStringOfLength_emk:", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 33);
    *((_QWORD *)v2 + 33) = v3;

    v5 = objc_alloc_init(EMKGlyphRippler);
    v6 = (void *)*((_QWORD *)v2 + 34);
    *((_QWORD *)v2 + 34) = v5;

    v7 = (void *)*((_QWORD *)v2 + 35);
    *((_QWORD *)v2 + 35) = 0;

    *((_QWORD *)v2 + 36) = 0x3FF0000000000000;
    *(_OWORD *)(v2 + 296) = *MEMORY[0x1E0C9D820];
    v8 = (void *)*((_QWORD *)v2 + 39);
    *((_QWORD *)v2 + 39) = 0;

    v9 = (void *)*((_QWORD *)v2 + 40);
    *((_QWORD *)v2 + 40) = &unk_1EA25B970;

    v10 = objc_alloc_init(EMKTextEnumerator);
    v11 = (void *)*((_QWORD *)v2 + 41);
    *((_QWORD *)v2 + 41) = v10;

    v12 = (void *)*((_QWORD *)v2 + 42);
    *((_QWORD *)v2 + 42) = 0;

    v2[344] = 1;
    v2[345] = 0;
    v2[346] = 0;
  }
  return (EMKLayoutManager *)v2;
}

- (void)flushGlyphIndexTable
{
  NSMutableData *glyphIndexTable;

  glyphIndexTable = self->_glyphIndexTable;
  self->_glyphIndexTable = 0;

}

- (BOOL)convertGlyphIndex:(unint64_t)a3 toAttributeRelativeGlyphIndex:(unint64_t *)a4 numberOfAttributedGlyphs:(unint64_t *)a5
{
  unint64_t v9;
  NSMutableData *glyphIndexTable;
  unint64_t v11;
  NSMutableData *v12;
  NSMutableData *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v9 = -[EMKLayoutManager numberOfGlyphs](self, "numberOfGlyphs");
  if (!v9)
    return v9 != 0;
  glyphIndexTable = self->_glyphIndexTable;
  if (!glyphIndexTable)
  {
    v25 = a3;
    v11 = -[NSMutableAttributedString length](self->_attributes, "length");
    v26 = 0;
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * v9 + 8);
    v12 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
    v13 = self->_glyphIndexTable;
    self->_glyphIndexTable = v12;

    v14 = -[NSMutableData mutableBytes](self->_glyphIndexTable, "mutableBytes");
    if (v11)
    {
      v24 = a4;
      v15 = 0;
      v16 = 0;
      do
      {
        -[NSMutableAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_attributes, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("EMKEmojiTokenList"), v15, &v26, v15, v11 - v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[EMKLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v26, v27, 0);
        v20 = v18 + v19;
        if (v18 < v18 + v19)
        {
          v21 = &v14[v18];
          do
          {
            *v21++ = v16;
            v16 += v17 != 0;
            --v19;
          }
          while (v19);
        }

        v15 = v27 + v26;
      }
      while (v27 + v26 < v11);
      a4 = v24;
      if (v20 > v9)
        goto LABEL_13;
    }
    else
    {
      v16 = 0;
      v20 = 0;
    }
    do
      v14[v20++] = v16;
    while (v20 <= v9);
LABEL_13:
    glyphIndexTable = self->_glyphIndexTable;
    a3 = v25;
  }
  v22 = -[NSMutableData mutableBytes](glyphIndexTable, "mutableBytes");
  if (a4)
    *a4 = *(_QWORD *)(v22 + 8 * a3);
  if (a5)
    *a5 = *(_QWORD *)(v22 + 8 * v9);
  return v9 != 0;
}

- (void)startOrStopTimer
{
  void *v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = 0;
  if (self->_emojiConversionEnabled
    && self->_emojiConversionActive
    && -[EMKLayoutManager convertGlyphIndex:toAttributeRelativeGlyphIndex:numberOfAttributedGlyphs:](self, "convertGlyphIndex:toAttributeRelativeGlyphIndex:numberOfAttributedGlyphs:", 0, 0, &v6)&& v6)
  {
    -[EMKGlyphRippler startWithDarkMode:](self->_rippler, "startWithDarkMode:", -[EMKLayoutManager isDarkModeEnabled](self, "isDarkModeEnabled"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("EMKStartTimerNotificationName");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("EMKStopTimerNotificationName");
  }
  objc_msgSend(v3, "postNotificationName:object:", v5, self);

}

- (BOOL)isEmojiAnimationActive
{
  _BOOL4 v3;
  BOOL result;
  unint64_t v5;
  uint64_t v6;

  v6 = 0;
  if (!self->_emojiConversionEnabled || !self->_emojiConversionActive)
    return 0;
  v3 = -[EMKLayoutManager convertGlyphIndex:toAttributeRelativeGlyphIndex:numberOfAttributedGlyphs:](self, "convertGlyphIndex:toAttributeRelativeGlyphIndex:numberOfAttributedGlyphs:", 0, 0, &v6);
  result = 0;
  if (v3)
  {
    if (v6)
    {
      v5 = -[EMKGlyphRippler currentTimeIndex](self->_rippler, "currentTimeIndex");
      return !-[EMKGlyphRippler finishedForGlyphIndex:numberOfGlyphs:timeIndex:](self->_rippler, "finishedForGlyphIndex:numberOfGlyphs:timeIndex:", v6 - 1, v6, v5);
    }
  }
  return result;
}

- (BOOL)isEmojiConversionEnabled
{
  return self->_emojiConversionEnabled;
}

- (void)setEmojiConversionEnabled:(BOOL)a3
{
  uint64_t v5;
  NSMutableAttributedString *attributes;
  void *v7;
  void *v8;

  if (self->_emojiConversionEnabled && !a3)
  {
    v5 = -[NSMutableAttributedString length](self->_attributes, "length");
    attributes = self->_attributes;
    objc_msgSend(MEMORY[0x1E0CB3498], "emptyAttributedStringOfLength_emk:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](attributes, "replaceCharactersInRange:withAttributedString:", 0, v5, v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("EMKEmojiConversionDisabledNotificationName"), self);

  }
  self->_emojiConversionEnabled = a3;
}

- (BOOL)isEmojiConversionActive
{
  return self->_emojiConversionActive;
}

- (void)setEmojiConversionActive:(BOOL)a3
{
  self->_emojiConversionActive = a3;
  -[EMKLayoutManager startOrStopTimer](self, "startOrStopTimer");
}

- (BOOL)isDarkModeEnabled
{
  return self->_darkModeEnabled;
}

- (void)setDarkModeEnabled:(BOOL)a3
{
  self->_darkModeEnabled = a3;
}

- (id)emojiConversionLanguages
{
  return self->_emojiConversionLanguages;
}

- (void)setEmojiConversionLanguages:(id)a3
{
  NSArray *v4;
  NSArray *emojiConversionLanguages;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  emojiConversionLanguages = self->_emojiConversionLanguages;
  self->_emojiConversionLanguages = v4;

}

- (id)attributes
{
  return self->_attributes;
}

- (void)drawAttributedGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  uint64_t v18;
  unint64_t v19;
  UIColor *v20;
  UIColor *currentColor;
  double v22;
  CGFloat v23;
  CGFloat v24;
  UIColor *v25;
  UIColor *currentShadowColor;
  UIColor *v27;
  UIColor *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  NSUInteger v34;
  objc_super v35;
  objc_super v36;
  objc_super v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;

  y = a4.y;
  x = a4.x;
  length = a3.length;
  location = a3.location;
  v9 = -[EMKLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", a3.location, a3.length, 0);
  v11 = v10;
  v40 = v9;
  v41 = 0;
  v12 = -[NSMutableAttributedString length](self->_attributes, "length");
  v31 = v9 + v11;
  v32 = v12;
  if (v12 >= v9 + v11)
    v13 = v9 + v11;
  else
    v13 = v12;
  if (v9 < v13)
  {
    v34 = location + length;
    v33 = v13;
    do
    {
      -[NSMutableAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_attributes, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("EMKEmojiTokenList"), v9, &v40, v9, v13 - v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[EMKLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v40, v41, 0);
      v17 = v15;
      v18 = v16;
      if (v14)
      {
        if (v15 < v15 + v16)
        {
          do
          {
            if (location <= v17 && v17 < v34)
            {
              v19 = -[EMKGlyphRippler currentTimeIndex](self->_rippler, "currentTimeIndex");
              v38 = 0;
              v39 = 0;
              -[EMKLayoutManager convertGlyphIndex:toAttributeRelativeGlyphIndex:numberOfAttributedGlyphs:](self, "convertGlyphIndex:toAttributeRelativeGlyphIndex:numberOfAttributedGlyphs:", v17, &v39, &v38);
              -[EMKGlyphRippler currentColorForGlyphIndex:numberOfGlyphs:timeIndex:](self->_rippler, "currentColorForGlyphIndex:numberOfGlyphs:timeIndex:", v39, v38, v19);
              v20 = (UIColor *)objc_claimAutoreleasedReturnValue();
              currentColor = self->_currentColor;
              self->_currentColor = v20;

              -[EMKGlyphRippler currentScaleForGlyphIndex:numberOfGlyphs:timeIndex:](self->_rippler, "currentScaleForGlyphIndex:numberOfGlyphs:timeIndex:", v39, v38, v19);
              self->_currentScale = v22;
              -[EMKGlyphRippler currentOffsetForGlyphIndex:numberOfGlyphs:timeIndex:](self->_rippler, "currentOffsetForGlyphIndex:numberOfGlyphs:timeIndex:", v39, v38, v19);
              self->_currentOffset.width = v23;
              self->_currentOffset.height = v24;
              -[EMKGlyphRippler currentShadowColorForGlyphIndex:numberOfGlyphs:timeIndex:](self->_rippler, "currentShadowColorForGlyphIndex:numberOfGlyphs:timeIndex:", v39, v38, v19);
              v25 = (UIColor *)objc_claimAutoreleasedReturnValue();
              currentShadowColor = self->_currentShadowColor;
              self->_currentShadowColor = v25;

              v37.receiver = self;
              v37.super_class = (Class)EMKLayoutManager;
              -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v37, sel_drawGlyphsForGlyphRange_atPoint_, v17, 1, x, y);
              v27 = self->_currentColor;
              self->_currentColor = 0;

              self->_currentScale = 1.0;
              self->_currentOffset = (CGSize)*MEMORY[0x1E0C9D820];
              v28 = self->_currentShadowColor;
              self->_currentShadowColor = 0;

            }
            ++v17;
            --v18;
          }
          while (v18);
        }
      }
      else
      {
        v36.receiver = self;
        v36.super_class = (Class)EMKLayoutManager;
        -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v36, sel_drawGlyphsForGlyphRange_atPoint_, v15, v16, x, y);
      }

      v9 = v41 + v40;
      v13 = v33;
    }
    while (v41 + v40 < v33);
  }
  if (v31 > v32)
  {
    v40 = v32;
    v41 = v31 - v32;
    v29 = -[EMKLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:");
    v35.receiver = self;
    v35.super_class = (Class)EMKLayoutManager;
    -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v35, sel_drawGlyphsForGlyphRange_atPoint_, v29, v30, x, y);
  }
}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  objc_super v4;

  if (self->_emojiConversionEnabled && self->_emojiConversionActive)
  {
    -[EMKLayoutManager drawAttributedGlyphsForGlyphRange:atPoint:](self, "drawAttributedGlyphsForGlyphRange:atPoint:", a3.location, a3.length, a4.x, a4.y);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)EMKLayoutManager;
    -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v4, sel_drawGlyphsForGlyphRange_atPoint_, a3.location, a3.length, a4.x, a4.y);
  }
}

- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(unint64_t)a5 font:(id)a6 matrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9
{
  id v14;
  id v15;
  double v16;
  double v17;
  _BOOL4 v19;
  CGPoint *v20;
  uint64_t v21;
  unint64_t v22;
  CGFloat v23;
  double *p_x;
  int v25;
  CGColor *v26;
  __int128 v27;
  _BOOL4 v28;
  _OWORD v30[3];
  objc_super v31;
  CGSize v32;
  CGRect BoundingRectsForGlyphs;

  v14 = a6;
  v15 = a8;
  if (self->_currentColor)
  {
    objc_msgSend(v14, "pointSize");
    v17 = v16;
    v19 = v16 <= 22.0 && self->_currentShadowColor != 0;
    v28 = v19;
    if (a5)
    {
      if (self->_currentScale == 1.0 && self->_currentOffset.width == 0.0 && self->_currentOffset.height == 0.0)
      {
        v20 = 0;
      }
      else
      {
        v20 = (CGPoint *)malloc_type_calloc(a5, 0x10uLL, 0x1000040451B5BE8uLL);
        if (v20)
        {
          CGContextSetFontSize(a9, v17 * self->_currentScale);
          BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs((CTFontRef)v14, kCTFontOrientationDefault, a3, 0, a5);
          v21 = 0;
          v22 = a5;
          do
          {
            v23 = a4[v21].y - self->_currentOffset.height;
            p_x = &v20[v21].x;
            *p_x = a4[v21].x
                 + self->_currentOffset.width
                 + BoundingRectsForGlyphs.size.width * (self->_currentScale + -1.0) * -0.5;
            p_x[1] = v23;
            ++v21;
            --v22;
          }
          while (v22);
          a4 = v20;
        }
      }
    }
    else
    {
      v20 = 0;
    }
    -[UIColor set](self->_currentColor, "set");
    if (v28)
    {
      v26 = -[UIColor CGColor](self->_currentShadowColor, "CGColor");
      v32.width = 0.25;
      v32.height = 0.0;
      CGContextSetShadowWithColor(a9, v32, 0.0, v26);
      v25 = 1;
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
    v20 = 0;
  }
  v31.receiver = self;
  v31.super_class = (Class)EMKLayoutManager;
  v27 = *(_OWORD *)&a7->c;
  v30[0] = *(_OWORD *)&a7->a;
  v30[1] = v27;
  v30[2] = *(_OWORD *)&a7->tx;
  -[EMKLayoutManager showCGGlyphs:positions:count:font:matrix:attributes:inContext:](&v31, sel_showCGGlyphs_positions_count_font_matrix_attributes_inContext_, a3, a4, a5, v14, v30, v15, a9);
  if (v25)
    CGContextSetShadowWithColor(a9, *MEMORY[0x1E0C9D820], 0.0, 0);
  if (v20)
    free(v20);

}

- (void)processEditingForTextStorage:(id)a3 edited:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6 invalidatedRange:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  char v10;
  NSMutableAttributedString *attributes;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  NSUInteger v20;
  NSUInteger v21;
  BOOL v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  EMKTextEnumerator *enumerator;
  void *v30;
  void *v31;
  NSArray *obj;
  id v33;
  _QWORD v34[7];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  NSUInteger v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  length = a5.length;
  location = a5.location;
  v10 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = 0;
  v43.receiver = self;
  v43.super_class = (Class)EMKLayoutManager;
  v33 = a3;
  -[EMKLayoutManager processEditingForTextStorage:edited:range:changeInLength:invalidatedRange:](&v43, sel_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange_, a7.location, a7.length);
  if ((v10 & 2) != 0)
  {
    attributes = self->_attributes;
    objc_msgSend(MEMORY[0x1E0CB3498], "emptyAttributedStringOfLength_emk:", length);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](attributes, "replaceCharactersInRange:withAttributedString:", location, length - a6, v13);

    v14 = objc_msgSend(v33, "length");
    v15 = -[NSMutableAttributedString length](self->_attributes, "length");
    v31 = 0;
    v16 = location + length;
    if (location + length > v14 || (v17 = v15, v15 < v16))
    {
LABEL_28:
      -[EMKLayoutManager flushGlyphIndexTable](self, "flushGlyphIndexTable");

      goto LABEL_29;
    }
    if (location)
    {
      -[NSMutableAttributedString attribute:atIndex:effectiveRange:](self->_attributes, "attribute:atIndex:effectiveRange:", CFSTR("EMKEmojiTokenList"), location - 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (id)-[NSMutableAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_attributes, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("EMKEmojiTokenList"), location - 1, &v44, 0, location);
        v20 = v44;
        v21 = v16 - v44;
      }
      else
      {
        v21 = length;
        v20 = location;
      }
    }
    else
    {
      v20 = 0;
      v18 = 0;
      v21 = length;
    }
    v22 = v17 > v16;
    v23 = v17 - v16;
    if (v22)
    {
      -[NSMutableAttributedString attribute:atIndex:effectiveRange:](self->_attributes, "attribute:atIndex:effectiveRange:", CFSTR("EMKEmojiTokenList"), location + length, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v24 = (id)-[NSMutableAttributedString attribute:atIndex:longestEffectiveRange:inRange:](self->_attributes, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("EMKEmojiTokenList"), location + length, &v44, location + length, v23);
        v21 = v44 - v20 + v45;
        if (!v21)
          goto LABEL_18;
      }
      else
      {
        v31 = 0;
        if (!v21)
          goto LABEL_18;
      }
    }
    else
    {
      v31 = v18;
      if (!v21)
      {
LABEL_18:
        if (self->_emojiConversionEnabled)
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          obj = self->_emojiConversionLanguages;
          v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
          if (v25)
          {
            v26 = *(_QWORD *)v40;
LABEL_21:
            v27 = 0;
            while (1)
            {
              if (*(_QWORD *)v40 != v26)
                objc_enumerationMutation(obj);
              v28 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v27);
              v35 = 0;
              v36 = &v35;
              v37 = 0x2020000000;
              v38 = 0;
              enumerator = self->_enumerator;
              objc_msgSend(v33, "string");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v34[0] = MEMORY[0x1E0C809B0];
              v34[1] = 3221225472;
              v34[2] = __94__EMKLayoutManager_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke;
              v34[3] = &unk_1EA258D00;
              v34[4] = self;
              v34[5] = v28;
              v34[6] = &v35;
              -[EMKTextEnumerator enumerateEmojiSignifiersInString:touchingRange:language:usingBlock:](enumerator, "enumerateEmojiSignifiersInString:touchingRange:language:usingBlock:", v30, location, length, v28, v34);

              LODWORD(v28) = *((unsigned __int8 *)v36 + 24);
              _Block_object_dispose(&v35, 8);
              if ((_DWORD)v28)
                break;
              if (v25 == ++v27)
              {
                v25 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
                if (v25)
                  goto LABEL_21;
                break;
              }
            }
          }

        }
        goto LABEL_28;
      }
    }
    -[NSMutableAttributedString removeAttribute:range:](self->_attributes, "removeAttribute:range:", CFSTR("EMKEmojiTokenList"), v20, v21);
    goto LABEL_18;
  }
LABEL_29:

}

uint64_t __94__EMKLayoutManager_processEditingForTextStorage_edited_range_changeInLength_invalidatedRange___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1[4] + 264), "addAttribute:value:range:", CFSTR("EMKEmojiTokenList"), a4, a2, a3);
  result = objc_msgSend(*(id *)(a1[4] + 264), "addAttribute:value:range:", CFSTR("EMKEmojiConversionLanguage"), a1[5], a2, a3);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return result;
}

- (void)setPreFrames:(unint64_t)a3
{
  -[EMKGlyphRippler setPreFrames:](self->_rippler, "setPreFrames:", a3);
}

- (void)setPostFrames:(unint64_t)a3
{
  -[EMKGlyphRippler setPostFrames:](self->_rippler, "setPostFrames:", a3);
}

- (void)setDelayFrames:(unint64_t)a3
{
  -[EMKGlyphRippler setDelayFrames:](self->_rippler, "setDelayFrames:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphIndexTable, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_emojiConversionLanguages, 0);
  objc_storeStrong((id *)&self->_currentShadowColor, 0);
  objc_storeStrong((id *)&self->_currentColor, 0);
  objc_storeStrong((id *)&self->_rippler, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
