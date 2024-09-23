@implementation CKTextEntryLayoutManager

- (CKTextEntryLayoutManager)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTextEntryLayoutManager;
  v2 = -[EMKLayoutManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 49);
    *((_QWORD *)v2 + 49) = v3;

    v5 = (void *)*((_QWORD *)v2 + 46);
    *((_QWORD *)v2 + 46) = 0;

    *((_QWORD *)v2 + 47) = 0x3FF0000000000000;
    *(_OWORD *)(v2 + 408) = *MEMORY[0x1E0C9D820];
    v6 = (void *)*((_QWORD *)v2 + 48);
    *((_QWORD *)v2 + 48) = 0;

  }
  return (CKTextEntryLayoutManager *)v2;
}

- (void)updateMentionAttributes:(id)a3
{
  NSMutableAttributedString *v4;
  NSMutableAttributedString *mentionAttributes;
  NSMutableAttributedString *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];

  v9 = a3;
  if ((-[NSMutableAttributedString isEqualToAttributedString:](self->_mentionAttributes, "isEqualToAttributedString:") & 1) == 0)
  {
    v4 = (NSMutableAttributedString *)objc_msgSend(v9, "mutableCopy");
    mentionAttributes = self->_mentionAttributes;
    self->_mentionAttributes = v4;

    v6 = self->_mentionAttributes;
    v7 = *MEMORY[0x1E0D381C8];
    v8 = -[NSMutableAttributedString length](v6, "length");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__CKTextEntryLayoutManager_updateMentionAttributes___block_invoke;
    v10[3] = &unk_1E274EF20;
    v10[4] = self;
    -[NSMutableAttributedString enumerateAttribute:inRange:options:usingBlock:](v6, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 2, v10);
  }

}

void __52__CKTextEntryLayoutManager_updateMentionAttributes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  CKMentionRippler *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v7, "length"))
      {
        objc_msgSend(*(id *)(a1 + 32), "animationsByIdentifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v7);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4)
        {
          v5 = objc_alloc_init(CKMentionRippler);
          objc_msgSend(*(id *)(a1 + 32), "animationsByIdentifier");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

          -[CKMentionRippler start](v5, "start");
          objc_msgSend(*(id *)(a1 + 32), "startTimerIfNeeded");

        }
      }
    }
  }

}

- (BOOL)isAnyMentionAnimationActive
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CKTextEntryLayoutManager mentionAttributes](self, "mentionAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTextEntryLayoutManager mentionAttributes](self, "mentionAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v6 = *MEMORY[0x1E0D381C8];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__CKTextEntryLayoutManager_isAnyMentionAnimationActive__block_invoke;
  v10[3] = &unk_1E2750250;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 2, v10);

  if (*((_BYTE *)v12 + 24))
  {
    v7 = 1;
  }
  else
  {
    -[CKTextEntryLayoutManager animationsByIdentifier](self, "animationsByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAllObjects");

    v7 = *((_BYTE *)v12 + 24) != 0;
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

void __55__CKTextEntryLayoutManager_isAnyMentionAnimationActive__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a2;
  if (v6)
  {
    v10 = v6;
    objc_msgSend(*(id *)(a1 + 32), "animationsByIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (objc_msgSend(v8, "finishedForGlyphIndex:numberOfGlyphs:timeIndex:", a4, a4, objc_msgSend(v8, "currentTimeIndex")))
      {
        objc_msgSend(*(id *)(a1 + 32), "animationsByIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObjectForKey:", v10);

      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }
    }

    v6 = v10;
  }

}

- (void)startTimerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKTextEntryLayoutManager mentionTimer](self, "mentionTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateMentionDisplay, 0, 1, 0.0166666667);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTextEntryLayoutManager setMentionTimer:](self, "setMentionTimer:", v4);

  }
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKTextEntryLayoutManager mentionTimer](self, "mentionTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addTimer:forMode:", v5, *MEMORY[0x1E0CEBDA0]);

}

- (void)stopTimerRemovingAttribute:(BOOL)a3
{
  void *v4;

  -[CKTextEntryLayoutManager updateDisplayForMentionGlyphRangeRemovingAttribute:](self, "updateDisplayForMentionGlyphRangeRemovingAttribute:", a3);
  -[CKTextEntryLayoutManager mentionTimer](self, "mentionTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[CKTextEntryLayoutManager setMentionTimer:](self, "setMentionTimer:", 0);
}

- (void)updateMentionDisplay
{
  -[CKTextEntryLayoutManager updateDisplayForMentionGlyphRangeRemovingAttribute:](self, "updateDisplayForMentionGlyphRangeRemovingAttribute:", 0);
  if (!-[CKTextEntryLayoutManager isAnyMentionAnimationActive](self, "isAnyMentionAnimationActive"))
    -[CKTextEntryLayoutManager stopTimerRemovingAttribute:](self, "stopTimerRemovingAttribute:", 1);
}

- (void)updateDisplayForMentionGlyphRangeRemovingAttribute:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  -[CKTextEntryLayoutManager mentionAttributes](self, "mentionAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v17 = 0;
  v18 = 0;
  -[CKTextEntryLayoutManager textStorage](self, "textStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  v9 = objc_msgSend(v6, "length");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *MEMORY[0x1E0D381C8];
    do
    {
      objc_msgSend(v6, "attribute:atIndex:longestEffectiveRange:inRange:", v12, v11, &v17, v11, v10 - v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length") && v18 + v17 <= v8)
      {
        if (v3)
        {
          -[CKTextEntryLayoutManager mentionsDelegate](self, "mentionsDelegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "layoutManagerDidFinishAnimatingMentionWithAnimationIdentifier:", v13);

        }
        v15 = -[CKTextEntryLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:");
        -[CKTextEntryLayoutManager invalidateDisplayForGlyphRange:](self, "invalidateDisplayForGlyphRange:", v15, v16);
      }

      v11 = v18 + v17;
    }
    while (v18 + v17 < v10);
  }

}

- (void)drawGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  NSUInteger length;
  NSUInteger location;
  void *v9;
  int v10;
  objc_super v11;

  y = a4.y;
  x = a4.x;
  length = a3.length;
  location = a3.location;
  -[CKTextEntryLayoutManager mentionAttributes](self, "mentionAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsAttribute:", *MEMORY[0x1E0D381C8]);

  if (v10)
  {
    -[CKTextEntryLayoutManager drawAttributedMentionGlyphsForGlyphRange:atPoint:](self, "drawAttributedMentionGlyphsForGlyphRange:atPoint:", location, length, x, y);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CKTextEntryLayoutManager;
    -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v11, sel_drawGlyphsForGlyphRange_atPoint_, location, length, x, y);
  }
}

- (void)drawAttributedMentionGlyphsForGlyphRange:(_NSRange)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  NSUInteger length;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t i;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  NSUInteger location;
  objc_super v36;
  objc_super v37;
  objc_super v38;
  unint64_t v39;
  uint64_t v40;

  y = a4.y;
  x = a4.x;
  length = a3.length;
  location = a3.location;
  v8 = -[CKTextEntryLayoutManager characterRangeForGlyphRange:actualGlyphRange:](self, "characterRangeForGlyphRange:actualGlyphRange:", a3.location, a3.length, 0);
  v10 = v9;
  v39 = v8;
  v40 = 0;
  -[CKTextEntryLayoutManager mentionAttributes](self, "mentionAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  v30 = v8 + v10;
  v31 = v12;
  if (v12 >= v8 + v10)
    v13 = v8 + v10;
  else
    v13 = v12;
  if (v8 < v13)
  {
    v33 = *MEMORY[0x1E0D381C8];
    v14 = location + length;
    v15 = *MEMORY[0x1E0C9D820];
    v16 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v32 = v13;
    do
    {
      -[CKTextEntryLayoutManager mentionAttributes](self, "mentionAttributes", v30, v31);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "attribute:atIndex:longestEffectiveRange:inRange:", v33, v40 + v39, &v39, v40 + v39, v13 - (v40 + v39));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[CKTextEntryLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:", v39, v40, 0);
      v21 = v20;
      if (objc_msgSend(v18, "length"))
      {
        -[CKTextEntryLayoutManager animationsByIdentifier](self, "animationsByIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v18;
        objc_msgSend(v22, "objectForKeyedSubscript:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          for (i = 0; i != v21; ++i)
          {
            if (location <= v19 + i && v19 + i + 1 <= v14)
            {
              v26 = objc_msgSend(v23, "currentTimeIndex");
              objc_msgSend(v23, "currentColorForGlyphIndex:numberOfGlyphs:timeIndex:", i, v21, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[CKTextEntryLayoutManager setCurrentMentionColor:](self, "setCurrentMentionColor:", v27);

              objc_msgSend(v23, "currentScaleForGlyphIndex:numberOfGlyphs:timeIndex:", i, v21, v26);
              -[CKTextEntryLayoutManager setCurrentMentionScale:](self, "setCurrentMentionScale:");
              objc_msgSend(v23, "currentOffsetForGlyphIndex:numberOfGlyphs:timeIndex:", i, v21, v26);
              -[CKTextEntryLayoutManager setCurrentMentionOffset:](self, "setCurrentMentionOffset:");
              v38.receiver = self;
              v38.super_class = (Class)CKTextEntryLayoutManager;
              -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v38, sel_drawGlyphsForGlyphRange_atPoint_, v19 + i, 1, x, y);
              -[CKTextEntryLayoutManager setCurrentMentionColor:](self, "setCurrentMentionColor:", 0);
              -[CKTextEntryLayoutManager setCurrentMentionScale:](self, "setCurrentMentionScale:", 1.0);
              -[CKTextEntryLayoutManager setCurrentMentionOffset:](self, "setCurrentMentionOffset:", v15, v16);
              -[CKTextEntryLayoutManager setCurrentMentionShadowColor:](self, "setCurrentMentionShadowColor:", 0);
            }
          }
        }

        v13 = v32;
        v18 = v34;
      }
      else
      {
        v37.receiver = self;
        v37.super_class = (Class)CKTextEntryLayoutManager;
        -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v37, sel_drawGlyphsForGlyphRange_atPoint_, v19, v21, x, y);
      }

    }
    while (v40 + v39 < v13);
  }
  if (v30 > v31)
  {
    v39 = v31;
    v40 = v30 - v31;
    v28 = -[CKTextEntryLayoutManager glyphRangeForCharacterRange:actualCharacterRange:](self, "glyphRangeForCharacterRange:actualCharacterRange:");
    v36.receiver = self;
    v36.super_class = (Class)CKTextEntryLayoutManager;
    -[EMKLayoutManager drawGlyphsForGlyphRange:atPoint:](&v36, sel_drawGlyphsForGlyphRange_atPoint_, v28, v29, x, y);
  }
}

- (void)showCGGlyphs:(const unsigned __int16 *)a3 positions:(const CGPoint *)a4 count:(int64_t)a5 font:(id)a6 textMatrix:(CGAffineTransform *)a7 attributes:(id)a8 inContext:(CGContext *)a9
{
  id v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double width;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  CGColor *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  CGPoint v41;
  CGSize v42;
  CGRect BoundingRectsForGlyphs;

  v15 = a6;
  v16 = a8;
  v41 = *a4;
  if (a5 == 1)
  {
    objc_msgSend(v15, "pointSize");
    v18 = v17;
    -[CKTextEntryLayoutManager currentMentionShadowColor](self, "currentMentionShadowColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v18 <= 22.0 && v19 != 0;

    -[CKTextEntryLayoutManager currentMentionScale](self, "currentMentionScale");
    if (v22 != 1.0
      || (-[CKTextEntryLayoutManager currentMentionOffset](self, "currentMentionOffset"), v23 != 0.0)
      || (-[CKTextEntryLayoutManager currentMentionOffset](self, "currentMentionOffset"), v24 != 0.0))
    {
      -[CKTextEntryLayoutManager currentMentionScale](self, "currentMentionScale");
      CGContextSetFontSize(a9, v18 * v25);
      BoundingRectsForGlyphs = CTFontGetBoundingRectsForGlyphs((CTFontRef)v15, kCTFontOrientationDefault, a3, 0, 1);
      width = BoundingRectsForGlyphs.size.width;
      -[CKTextEntryLayoutManager currentMentionOffset](self, "currentMentionOffset", BoundingRectsForGlyphs.origin.x, BoundingRectsForGlyphs.origin.y);
      v28 = v27;
      -[CKTextEntryLayoutManager currentMentionScale](self, "currentMentionScale");
      v41.x = v41.x + v28 + width * (v29 + -1.0) * -0.5;
      -[CKTextEntryLayoutManager currentMentionOffset](self, "currentMentionOffset");
      v41.y = v41.y - v30;
      a4 = &v41;
    }
    -[CKTextEntryLayoutManager currentMentionColor](self, "currentMentionColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      -[UIColor set](self->_currentMentionColor, "set");
    if (v21)
    {
      -[CKTextEntryLayoutManager currentMentionShadowColor](self, "currentMentionShadowColor");
      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v33 = (CGColor *)objc_msgSend(v32, "CGColor");
      v42.width = 0.25;
      v42.height = 0.0;
      CGContextSetShadowWithColor(a9, v42, 0.0, v33);

      v40.receiver = self;
      v40.super_class = (Class)CKTextEntryLayoutManager;
      v34 = *(_OWORD *)&a7->c;
      v37 = *(_OWORD *)&a7->a;
      v38 = v34;
      v39 = *(_OWORD *)&a7->tx;
      -[CKTextEntryLayoutManager showCGGlyphs:positions:count:font:textMatrix:attributes:inContext:](&v40, sel_showCGGlyphs_positions_count_font_textMatrix_attributes_inContext_, a3, a4, 1, v15, &v37, v16, a9);
      CGContextSetShadowWithColor(a9, *MEMORY[0x1E0C9D820], 0.0, 0);
    }
    else
    {
      v40.receiver = self;
      v40.super_class = (Class)CKTextEntryLayoutManager;
      v36 = *(_OWORD *)&a7->c;
      v37 = *(_OWORD *)&a7->a;
      v38 = v36;
      v39 = *(_OWORD *)&a7->tx;
      -[CKTextEntryLayoutManager showCGGlyphs:positions:count:font:textMatrix:attributes:inContext:](&v40, sel_showCGGlyphs_positions_count_font_textMatrix_attributes_inContext_, a3, a4, 1, v15, &v37, v16, a9);
    }
  }
  else
  {
    v40.receiver = self;
    v40.super_class = (Class)CKTextEntryLayoutManager;
    v35 = *(_OWORD *)&a7->c;
    v37 = *(_OWORD *)&a7->a;
    v38 = v35;
    v39 = *(_OWORD *)&a7->tx;
    -[CKTextEntryLayoutManager showCGGlyphs:positions:count:font:textMatrix:attributes:inContext:](&v40, sel_showCGGlyphs_positions_count_font_textMatrix_attributes_inContext_, a3, a4, a5, v15, &v37, v16, a9);
  }

}

- (CKTextEntryLayoutManagerMentionsDelegate)mentionsDelegate
{
  return (CKTextEntryLayoutManagerMentionsDelegate *)objc_loadWeakRetained((id *)&self->_mentionsDelegate);
}

- (void)setMentionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_mentionsDelegate, a3);
}

- (NSMutableAttributedString)mentionAttributes
{
  return self->_mentionAttributes;
}

- (void)setMentionAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_mentionAttributes, a3);
}

- (UIColor)currentMentionColor
{
  return self->_currentMentionColor;
}

- (void)setCurrentMentionColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentMentionColor, a3);
}

- (double)currentMentionScale
{
  return self->_currentMentionScale;
}

- (void)setCurrentMentionScale:(double)a3
{
  self->_currentMentionScale = a3;
}

- (CGSize)currentMentionOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_currentMentionOffset.width;
  height = self->_currentMentionOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCurrentMentionOffset:(CGSize)a3
{
  self->_currentMentionOffset = a3;
}

- (UIColor)currentMentionShadowColor
{
  return self->_currentMentionShadowColor;
}

- (void)setCurrentMentionShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentMentionShadowColor, a3);
}

- (NSMutableDictionary)animationsByIdentifier
{
  return self->_animationsByIdentifier;
}

- (void)setAnimationsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_animationsByIdentifier, a3);
}

- (NSTimer)mentionTimer
{
  return self->_mentionTimer;
}

- (void)setMentionTimer:(id)a3
{
  objc_storeStrong((id *)&self->_mentionTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionTimer, 0);
  objc_storeStrong((id *)&self->_animationsByIdentifier, 0);
  objc_storeStrong((id *)&self->_currentMentionShadowColor, 0);
  objc_storeStrong((id *)&self->_currentMentionColor, 0);
  objc_storeStrong((id *)&self->_mentionAttributes, 0);
  objc_destroyWeak((id *)&self->_mentionsDelegate);
}

@end
