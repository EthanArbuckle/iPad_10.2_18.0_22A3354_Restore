@implementation EMKTextView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emojiPreferences, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerDelegate, 0);
  objc_storeStrong((id *)&self->_textKit2Controller, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)EMKTextView;
  -[EMKTextView dealloc](&v4, sel_dealloc);
}

- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  EMKTextView *v7;
  EMKTextView *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)EMKTextView;
  v7 = -[EMKTextView initWithFrame:textContainer:](&v10, sel_initWithFrame_textContainer_, 0);
  v8 = v7;
  if (v7)
    -[EMKTextView setupLayoutManagerWithFrame:](v7, "setupLayoutManagerWithFrame:", x, y, width, height);
  return v8;
}

- (void)setupLayoutManagerWithFrame:(CGRect)a3
{
  double width;
  _EMKTextKit2Controller *v5;
  _EMKTextKit2Controller *textKit2Controller;
  void *v7;
  id v8;

  width = a3.size.width;
  __commonInit(self);
  v5 = -[_EMKTextKit2Controller initWithTextView:emojiPreferences:]([_EMKTextKit2Controller alloc], "initWithTextView:emojiPreferences:", self, self->_emojiPreferences);
  textKit2Controller = self->_textKit2Controller;
  self->_textKit2Controller = v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__showEmojiSuggestionsForInputModeChange_, *MEMORY[0x1E0CEBD58], 0);
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__keyboardDidShow_, *MEMORY[0x1E0CEB828], 0);
  -[EMKTextView textContainer](self, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSize:", width, 1.79769313e308);
  objc_msgSend(v7, "setWidthTracksTextView:", 1);
  if ((-[EMKTextView isScrollEnabled](self, "isScrollEnabled") & 1) == 0)
    objc_msgSend(v7, "setHeightTracksTextView:", 1);
  -[EMKTextView setEmojiConversionLanguagesAndActivateConversion:](self, "setEmojiConversionLanguagesAndActivateConversion:", 1);

}

- (void)setEmojiConversionLanguagesAndActivateConversion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _EMKTextKit2Controller *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _EMKTextKit2Controller *textKit2Controller;
  void *v23;
  _BOOL4 v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "primaryLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  standardLanguage(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || (objc_msgSend(v8, "hasPrefix:", CFSTR("emoji")) & 1) != 0)
  {
    self->_emojiConversionActive = !v10
                                || !objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.MobileSMS.MessagesNotificationExtension"));
    if (!v3)
      goto LABEL_27;
LABEL_24:
    -[EMKTextView traitCollection](self, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceStyle");

    textKit2Controller = self->_textKit2Controller;
    if (textKit2Controller)
    {
      -[_EMKTextKit2Controller setDarkModeEnabled:](textKit2Controller, "setDarkModeEnabled:", v21 == 2);
      -[_EMKTextKit2Controller setEmojiConversionActive:](self->_textKit2Controller, "setEmojiConversionActive:", self->_emojiConversionActive);
    }
    else
    {
      -[EMKTextView layoutManager](self, "layoutManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDarkModeEnabled:", v21 == 2);
      objc_msgSend(v23, "setEmojiConversionActive:", self->_emojiConversionActive);

    }
    goto LABEL_27;
  }
  v24 = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v25 = v6;
  objc_msgSend(v6, "multilingualLanguages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        standardLanguage(*(void **)(*((_QWORD *)&v26 + 1) + 8 * i));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length")
          && (objc_msgSend(v17, "hasPrefix:", CFSTR("emoji")) & 1) == 0
          && (objc_msgSend(v11, "containsObject:", v17) & 1) == 0)
        {
          objc_msgSend(v11, "addObject:", v17);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  v18 = self->_textKit2Controller;
  if (v18)
  {
    -[_EMKTextKit2Controller setEmojiConversionLanguages:](v18, "setEmojiConversionLanguages:", v11);
  }
  else
  {
    -[EMKTextView layoutManager](self, "layoutManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setEmojiConversionLanguages:", v11);

  }
  self->_emojiConversionActive = 0;

  v6 = v25;
  if (v24)
    goto LABEL_24;
LABEL_27:

}

- (void)setGestureRecognizerDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 2872);
}

- (void)setEmojiPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 2880);
}

- (EMKGestureRecognizerDelegate)gestureRecognizerDelegate
{
  return (EMKGestureRecognizerDelegate *)objc_getProperty(self, a2, 2872, 1);
}

- (void)setEmojiConversionLanguagesForInputModeChange:(id)a3
{
  -[EMKTextView setEmojiConversionLanguagesAndActivateConversion:](self, "setEmojiConversionLanguagesAndActivateConversion:", 1);
}

- (void)_emk_removeRenderingAttribute:(id)a3 forTextRange:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[EMKTextView textLayoutManager](self, "textLayoutManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeRenderingAttribute:forTextRange:", v7, v6);

}

- (void)_emk_addRenderingAttribute:(id)a3 value:(id)a4 forTextRange:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[EMKTextView textLayoutManager](self, "textLayoutManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addRenderingAttribute:value:forTextRange:", v10, v9, v8);

}

+ (void)__emk_setNeedsDisplayCurrentRenderAttributesForView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setNeedsDisplay");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v4, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(a1, "__emk_setNeedsDisplayCurrentRenderAttributesForView:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_emk_setNeedsDisplayCurrentRenderAttributes
{
  objc_msgSend((id)objc_opt_class(), "__emk_setNeedsDisplayCurrentRenderAttributesForView:", self);
}

- (void)_setTokenListsHidden_emk:(BOOL)a3
{
  id v5;
  _QWORD v6[5];
  BOOL v7;

  -[EMKTextView textLayoutManager](self, "textLayoutManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__EMKTextView_Helper___setTokenListsHidden_emk___block_invoke;
  v6[3] = &unk_1EA258AB8;
  v7 = a3;
  v6[4] = self;
  objc_msgSend(v5, "_enumerateAllTokenListsUsingBlock_emk:", v6);
  -[EMKTextView _emk_setNeedsDisplayCurrentRenderAttributes](self, "_emk_setNeedsDisplayCurrentRenderAttributes");

}

void __48__EMKTextView_Helper___setTokenListsHidden_emk___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = *MEMORY[0x1E0DC1140];
  if (*(_BYTE *)(a1 + 40))
  {
    v5 = (void *)MEMORY[0x1E0CEA478];
    v6 = a3;
    objc_msgSend(v5, "clearColor");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_emk_addRenderingAttribute:value:forTextRange:", v4);

  }
  else
  {
    v7 = a3;
    objc_msgSend(v3, "_emk_removeRenderingAttribute:forTextRange:", v4);
  }

}

- (void)_setTokenListsHighlighted_emk:(BOOL)a3 rippler:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  _EMKGlyphRenderingAttributes *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  id v18;

  v4 = a3;
  v14 = a4;
  -[EMKTextView textLayoutManager](self, "textLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v8 = -[_EMKGlyphRenderingAttributes initWithValuesFromRippler:timeIndex:glyphIndex:numberOfGlyphs:]([_EMKGlyphRenderingAttributes alloc], "initWithValuesFromRippler:timeIndex:glyphIndex:numberOfGlyphs:", v14, objc_msgSend(v14, "currentTimeIndex"), 0, 1);
    -[_EMKGlyphRenderingAttributes color](v8, "color");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMKTextView font](self, "font");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointSize");
    -[_EMKGlyphRenderingAttributes shadowIfNeededForFontPointSize:](v8, "shadowIfNeededForFontPointSize:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __61__EMKTextView_Helper___setTokenListsHighlighted_emk_rippler___block_invoke;
    v16[3] = &unk_1EA258AE0;
    v16[4] = self;
    v17 = v9;
    v18 = v11;
    v12 = v11;
    v13 = v9;
    objc_msgSend(v7, "_enumerateAllTokenListsUsingBlock_emk:", v16);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61__EMKTextView_Helper___setTokenListsHighlighted_emk_rippler___block_invoke_2;
    v15[3] = &unk_1EA258B08;
    v15[4] = self;
    objc_msgSend(v6, "_enumerateAllTokenListsUsingBlock_emk:", v15);
  }
  -[EMKTextView _emk_setNeedsDisplayCurrentRenderAttributes](self, "_emk_setNeedsDisplayCurrentRenderAttributes");

}

void __61__EMKTextView_Helper___setTokenListsHighlighted_emk_rippler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_emk_addRenderingAttribute:value:forTextRange:", *MEMORY[0x1E0DC1140], *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_emk_addRenderingAttribute:value:forTextRange:", *MEMORY[0x1E0DC1198], v4, v5);

}

void __61__EMKTextView_Helper___setTokenListsHighlighted_emk_rippler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = *MEMORY[0x1E0DC1140];
  v6 = a3;
  objc_msgSend(v4, "_emk_removeRenderingAttribute:forTextRange:", v5, v6);
  objc_msgSend(*(id *)(a1 + 32), "_emk_removeRenderingAttribute:forTextRange:", *MEMORY[0x1E0DC1198], v6);

}

- (UIView)textContainerOverlayView
{
  return -[_EMKTextKit2Controller textContainerOverlayView](self->_textKit2Controller, "textContainerOverlayView");
}

- (void)setTextContainerOverlayView:(id)a3
{
  -[_EMKTextKit2Controller setTextContainerOverlayView:](self->_textKit2Controller, "setTextContainerOverlayView:", a3);
}

- (void)setEmojiConversionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  if (self->_textKit2Controller)
  {
    -[_EMKTextKit2Controller setEmojiConversionEnabled:](self->_textKit2Controller, "setEmojiConversionEnabled:", a3);
  }
  else
  {
    -[EMKTextView layoutManager](self, "layoutManager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEmojiConversionEnabled:", v3);

  }
}

- (BOOL)isEmojiConversionEnabled
{
  void *v3;
  char v4;

  if (self->_textKit2Controller)
    return -[_EMKTextKit2Controller isEmojiConversionEnabled](self->_textKit2Controller, "isEmojiConversionEnabled");
  -[EMKTextView layoutManager](self, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiConversionEnabled");

  return v4;
}

- (void)dismissOverlayView
{
  _EMKTextKit2Controller *textKit2Controller;
  EMKOverlayView *overlayView;

  textKit2Controller = self->_textKit2Controller;
  if (textKit2Controller)
  {
    -[_EMKTextKit2Controller dismissOverlayView](textKit2Controller, "dismissOverlayView");
  }
  else
  {
    -[EMKOverlayView dismiss](self->_overlayView, "dismiss");
    overlayView = self->_overlayView;
    self->_overlayView = 0;

  }
}

- (void)calculateDisplayRect
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect *p_displayRect;
  CGSize v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  CGFloat width;
  double v21;
  CGFloat height;
  double v23;
  double x;
  double v25;
  double y;
  uint64_t v27;
  uint64_t v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  -[EMKTextView layoutManager](self, "layoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMKTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = objc_msgSend(v4, "length");
  -[EMKTextView textContainer](self, "textContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMKTextView textContainerInset](self, "textContainerInset");
  v10 = v9;
  v12 = v11;
  v27 = 0;
  v28 = 0;
  p_displayRect = &self->_displayRect;
  v14 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_displayRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_displayRect.size = v14;
  if (v7)
  {
    v15 = 0;
    do
    {
      objc_msgSend(v4, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("EMKEmojiTokenList"), v15, &v27, v15, v7 - v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 && v28 + v27 <= v6)
      {
        v17 = objc_msgSend(v3, "glyphRangeForCharacterRange:actualCharacterRange:");
        objc_msgSend(v3, "boundingRectForGlyphRange:inTextContainer:", v17, v18, v8);
        width = v19;
        height = v21;
        x = v12 + v23;
        y = v10 + v25;
        v29.origin.x = p_displayRect->origin.x;
        v29.origin.y = self->_displayRect.origin.y;
        v29.size.width = self->_displayRect.size.width;
        v29.size.height = self->_displayRect.size.height;
        if (!CGRectIsEmpty(v29))
        {
          v30.origin.x = p_displayRect->origin.x;
          v30.origin.y = self->_displayRect.origin.y;
          v30.size.width = self->_displayRect.size.width;
          v30.size.height = self->_displayRect.size.height;
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v31 = CGRectUnion(v30, v32);
          x = v31.origin.x;
          y = v31.origin.y;
          width = v31.size.width;
          height = v31.size.height;
        }
        p_displayRect->origin.x = x;
        self->_displayRect.origin.y = y;
        self->_displayRect.size.width = width;
        self->_displayRect.size.height = height;
      }

      v15 = v28 + v27;
    }
    while (v28 + v27 < v7);
  }

}

- (void)updateEmojiDisplay:(id)a3
{
  void *v4;
  CGRect *p_displayRect;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSTimer *timer;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  CGRect v19;

  v18 = *MEMORY[0x1E0C80C00];
  -[EMKTextView layoutManager](self, "layoutManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  p_displayRect = &self->_displayRect;
  if (CGRectIsNull(self->_displayRect))
    -[EMKTextView calculateDisplayRect](self, "calculateDisplayRect");
  v19.origin.x = p_displayRect->origin.x;
  v19.origin.y = self->_displayRect.origin.y;
  v19.size.width = self->_displayRect.size.width;
  v19.size.height = self->_displayRect.size.height;
  if (!CGRectIsEmpty(v19))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[EMKTextView subviews](self, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v11, "convertRect:fromView:", self, p_displayRect->origin.x, self->_displayRect.origin.y, self->_displayRect.size.width, self->_displayRect.size.height);
          objc_msgSend(v11, "setNeedsDisplayInRect:");
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  if ((objc_msgSend(v4, "isEmojiAnimationActive") & 1) == 0)
  {
    -[NSTimer invalidate](self->_timer, "invalidate");
    timer = self->_timer;
    self->_timer = 0;

  }
}

- (void)_startTextKit1EmojiDisplayUpdateTimer:(id)a3
{
  CGSize v4;
  NSTimer *v5;
  NSTimer *timer;
  void *v7;

  v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_displayRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_displayRect.size = v4;
  if (!self->_timer)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateEmojiDisplay_, 0, 1, 0.0166666667);
    v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timer = self->_timer;
    self->_timer = v5;

  }
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTimer:forMode:", self->_timer, *MEMORY[0x1E0CEBDA0]);

  -[EMKTextView dismissOverlayView](self, "dismissOverlayView");
}

- (void)_stopTextKit1EmojiDisplayUpdateTimer:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSTimer *timer;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[EMKTextView setNeedsDisplay](self, "setNeedsDisplay", a3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[EMKTextView subviews](self, "subviews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "setNeedsDisplay");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  -[EMKTextView dismissOverlayView](self, "dismissOverlayView");
}

- (void)_emojifyingDisabled:(id)a3
{
  -[EMKTextView dismissOverlayView](self, "dismissOverlayView", a3);
  -[EMKTextView _stopTextKit1EmojiDisplayUpdateTimer:](self, "_stopTextKit1EmojiDisplayUpdateTimer:", 0);
}

- (void)setEmojiConversionLanguagesForKeyboardShow:(id)a3
{
  -[EMKTextView setEmojiConversionLanguagesAndActivateConversion:](self, "setEmojiConversionLanguagesAndActivateConversion:", 0);
}

- (void)_showEmojiSuggestionsForInputModeChange:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_setEmojiConversionLanguagesForInputModeChange_, 0, 0, 0.01);
}

- (void)_keyboardDidShow:(id)a3
{
  id v3;

  v3 = (id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_setEmojiConversionLanguagesForKeyboardShow_, 0, 0, 0.01);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EMKTextView;
  -[EMKTextView didMoveToWindow](&v3, sel_didMoveToWindow);
  -[EMKTextView dismissOverlayView](self, "dismissOverlayView");
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EMKTextView;
  -[EMKTextView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[EMKTextView dismissOverlayView](self, "dismissOverlayView");
}

- (void)deleteBackward
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EMKTextView;
  -[EMKTextView deleteBackward](&v3, sel_deleteBackward);
  -[EMKTextView dismissOverlayView](self, "dismissOverlayView");
}

- (EMKTextView)init
{
  return -[EMKTextView initWithFrame:textContainer:](self, "initWithFrame:textContainer:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  EMKTextView *v8;
  EMKTextView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)EMKTextView;
  v8 = -[EMKTextView initWithFrame:textContainer:](&v11, sel_initWithFrame_textContainer_, a4);
  v9 = v8;
  if (v8)
    -[EMKTextView setupLayoutManagerWithFrame:](v8, "setupLayoutManagerWithFrame:", x, y, width, height);
  return v9;
}

- (EMKTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  EMKLayoutManager *v15;
  EMKTextView *v16;
  EMKTextView *v17;
  CGSize v18;
  void *v19;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  objc_msgSend(v9, "layoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && v10 && v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = v11;
    v14 = v9;
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x1E0DC1320]);

    v14 = objc_alloc_init(MEMORY[0x1E0DC12C0]);
    objc_msgSend(v14, "setSize:", width, 1.79769313e308);
    objc_msgSend(v14, "setWidthTracksTextView:", 1);
    if ((-[EMKTextView isScrollEnabled](self, "isScrollEnabled") & 1) == 0)
      objc_msgSend(v14, "setHeightTracksTextView:", 1);
    v15 = objc_alloc_init(EMKLayoutManager);

    -[EMKLayoutManager setAllowsNonContiguousLayout:](v15, "setAllowsNonContiguousLayout:", 1);
    -[EMKLayoutManager addTextContainer:](v15, "addTextContainer:", v14);
    objc_msgSend(v13, "addLayoutManager:", v15);
    v10 = v15;
  }
  v22.receiver = self;
  v22.super_class = (Class)EMKTextView;
  v16 = -[EMKTextView initWithFrame:textContainer:](&v22, sel_initWithFrame_textContainer_, v14, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    __commonInit(v16);
    v17->_tappedGlyphIndex = 0x7FFFFFFFFFFFFFFFLL;
    v17->_tappedGlyphRange = (_NSRange)xmmword_1DB1A2740;
    v18 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v17->_displayRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v17->_displayRect.size = v18;
    v17->_emojiConversionActive = 0;
    -[EMKTextView layoutManager](v17, "layoutManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v17, sel__startTextKit1EmojiDisplayUpdateTimer_, CFSTR("EMKStartTimerNotificationName"), v19);

    -[EMKTextView layoutManager](v17, "layoutManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v17, sel__stopTextKit1EmojiDisplayUpdateTimer_, CFSTR("EMKStopTimerNotificationName"), v20);

    objc_msgSend(v12, "addObserver:selector:name:object:", v17, sel__emojifyingDisabled_, CFSTR("EMKEmojiConversionDisabledNotificationName"), 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v17, sel__showEmojiSuggestionsForInputModeChange_, *MEMORY[0x1E0CEBD58], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v17, sel__keyboardDidShow_, *MEMORY[0x1E0CEB828], 0);
    -[EMKTextView setEmojiConversionLanguagesAndActivateConversion:](v17, "setEmojiConversionLanguagesAndActivateConversion:", 1);
  }

  return v17;
}

- (void)replaceRange:(_NSRange)a3 withEmojiToken:(id)a4 language:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  uint64_t v11;
  EMKEmojiSignifier *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  EMKEmojiSignifier *v29;
  id v30;
  id v31;

  length = a3.length;
  location = a3.location;
  v31 = a4;
  v30 = a5;
  -[EMKTextView textStorage](self, "textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "string");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMKTextView layoutManager](self, "layoutManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "attributes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  v12 = [EMKEmojiSignifier alloc];
  objc_msgSend(v9, "attributedSubstringFromRange:", location, length);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "string");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[EMKEmojiSignifier initWithString:](v12, "initWithString:", v14);

  -[EMKTextView beginningOfDocument](self, "beginningOfDocument");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMKTextView positionFromPosition:offset:](self, "positionFromPosition:offset:", v15, location);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMKTextView beginningOfDocument](self, "beginningOfDocument");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMKTextView positionFromPosition:offset:](self, "positionFromPosition:offset:", v17, location + length);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMKTextView textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[EMKTextView inputDelegate](self, "inputDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "textWillChange:", self);

  -[EMKTextView replaceRange:withText:](self, "replaceRange:withText:", v19, v10);
  -[EMKTextView inputDelegate](self, "inputDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "textDidChange:", self);

  v22 = objc_msgSend(v9, "length");
  v23 = objc_msgSend(v26, "length");
  if (v11 + location <= v22 && v11 + location <= v23)
  {
    objc_msgSend(v27, "substringWithRange:", location, v11);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", v10);

    if (v25)
    {
      objc_msgSend(v26, "addAttribute:value:range:", CFSTR("EMKEmojiSignifier"), v29, location, v11);
      if (v30)
        objc_msgSend(v26, "addAttribute:value:range:", CFSTR("EMKEmojiConversionLanguage"), v30, location, v11);
    }
  }
  -[EMFEmojiPreferences didUseEmoji:usageMode:](self->_emojiPreferences, "didUseEmoji:usageMode:", v31, *MEMORY[0x1E0D1F220]);

}

- (CGRect)anchorRect
{
  _NSRange *p_tappedGlyphRange;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[9];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CGRect result;

  if (self->_tappedGlyphIndex == 0x7FFFFFFFFFFFFFFFLL
    || (p_tappedGlyphRange = &self->_tappedGlyphRange, self->_tappedGlyphRange.location == 0x7FFFFFFFFFFFFFFFLL)
    || !self->_tappedGlyphRange.length)
  {
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[EMKTextView textContainerInset](self, "textContainerInset");
    v5 = v4;
    v7 = v6;
    -[EMKTextView layoutManager](self, "layoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMKTextView textContainer](self, "textContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "boundingRectForGlyphRange:inTextContainer:", self->_tappedGlyphIndex, 1, v9);
    v24 = 0;
    v25 = (double *)&v24;
    v26 = 0x4010000000;
    v27 = &unk_1DB1A32D1;
    v28 = v10;
    v29 = v11;
    v30 = v12;
    v31 = v13;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __25__EMKTextView_anchorRect__block_invoke;
    v23[3] = &unk_1EA258D40;
    v23[5] = v10;
    v23[6] = v11;
    v23[7] = v12;
    v23[8] = v13;
    v23[4] = &v24;
    objc_msgSend(v8, "enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock:", p_tappedGlyphRange->location, p_tappedGlyphRange->length, 0x7FFFFFFFFFFFFFFFLL, 0, v9, v23);
    v14 = v25;
    v15 = v7 + v25[4];
    v16 = v5 + v25[5];
    v25[4] = v15;
    v14[5] = v16;
    v17 = v14[6];
    v18 = v14[7];
    _Block_object_dispose(&v24, 8);

  }
  v19 = v15;
  v20 = v16;
  v21 = v17;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

BOOL __25__EMKTextView_anchorRect__block_invoke(uint64_t a1, _BYTE *a2, double a3, double a4, double a5, double a6)
{
  _BOOL8 result;
  double *v13;

  result = CGRectIntersectsRect(*(CGRect *)&a3, *(CGRect *)(a1 + 40));
  if (result)
  {
    v13 = *(double **)(*(_QWORD *)(a1 + 32) + 8);
    v13[4] = a3;
    v13[5] = a4;
    v13[6] = a5;
    v13[7] = a6;
    *a2 = 1;
  }
  return result;
}

- (id)personalizedEmojiTokenListForList:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  EMKEmojiTokenList *v19;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA6E0], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!personalizedEmojiTokenListForList__fistEmoji)
  {
    objc_msgSend(MEMORY[0x1E0D1F268], "emojiTokenWithString:localeData:", CFSTR("✊"), 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)personalizedEmojiTokenListForList__fistEmoji;
    personalizedEmojiTokenListForList__fistEmoji = v5;

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = v3;
  objc_msgSend(v3, "emojiTokenArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  v9 = 0x1F02CF000uLL;
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v25;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v7);
        v13 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v12);
        if (!objc_msgSend(v13, "skinTone")
          || (objc_msgSend(v13, "isEqualIgnoringModifiers:", *(_QWORD *)(v9 + 2688)) & 1) == 0)
        {
          -[EMFEmojiPreferences lastUsedVariantEmojiForEmoji:](self->_emojiPreferences, "lastUsedVariantEmojiForEmoji:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 && !objc_msgSend(v14, "isEqual:", v13))
          {
            v13 = v14;
          }
          else
          {
            objc_msgSend(v13, "string");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "lastUsedVariantEmojiForEmojiString:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
            {
              v17 = (void *)MEMORY[0x1E0D1F268];
              objc_msgSend(v13, "localeData");
              v18 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "emojiTokenWithString:localeData:", v16, v18);
              v13 = (id)objc_claimAutoreleasedReturnValue();

              v14 = (void *)v18;
              v9 = 0x1F02CF000;
            }
            else
            {
              v13 = v13;
            }

          }
        }
        objc_msgSend(v4, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v10);
  }

  v19 = -[EMKEmojiTokenList initWithEmojiTokenArray:]([EMKEmojiTokenList alloc], "initWithEmojiTokenArray:", v4);
  return v19;
}

- (void)textTapGestureRecognized:(id)a3
{
  id v4;
  _EMKTextKit2Controller *textKit2Controller;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSUInteger v45;
  EMKOverlayView *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  EMKOverlayView *v55;
  EMKOverlayView *overlayView;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  __int128 v71;
  id location;
  __int128 v73;
  _QWORD v74[3];
  CGPoint v75;
  CGRect v76;

  v74[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  textKit2Controller = self->_textKit2Controller;
  if (!textKit2Controller)
  {
    objc_msgSend(v4, "locationInView:", self);
    v7 = v6;
    v9 = v8;
    -[EMKTextView textContainerInset](self, "textContainerInset");
    v11 = v10;
    v13 = v12;
    -[EMKTextView textStorage](self, "textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMKTextView layoutManager](self, "layoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributes");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "string");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "length");
    v17 = objc_msgSend(v65, "length");
    -[EMKTextView textContainer](self, "textContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v7 - v13;
    v20 = v9 - v11;
    v21 = objc_msgSend(v15, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v18, 0, v19, v20);
    v22 = objc_msgSend(v15, "glyphIndexForCharacterAtIndex:", v21);
    objc_msgSend(v15, "boundingRectForGlyphRange:inTextContainer:", v22, 1, v18);
    if (!self->_emojiConversionActive)
      goto LABEL_24;
    v27 = v23;
    v28 = v24;
    v29 = v25;
    v30 = v26;
    if (!objc_msgSend(v15, "isEmojiConversionEnabled"))
      goto LABEL_24;
    v76.origin.x = v27;
    v76.origin.y = v28;
    v76.size.width = v29;
    v76.size.height = v30;
    v75.x = v19;
    v75.y = v20;
    if (!CGRectContainsPoint(v76, v75)
      || v21 >= v16
      || v21 >= v17
      || (objc_msgSend(MEMORY[0x1E0CEA3C8], "sharedCalloutBarIsVisible") & 1) != 0)
    {
      goto LABEL_24;
    }
    objc_msgSend(v65, "attribute:atIndex:effectiveRange:");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "attribute:atIndex:effectiveRange:", CFSTR("EMKEmojiConversionLanguage"), v21, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "attribute:atIndex:effectiveRange:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0uLL;
    if (objc_msgSend(v63, "count"))
    {
      -[EMKTextView personalizedEmojiTokenListForList:](self, "personalizedEmojiTokenListForList:", v63);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_msgSend(v62, "count");
      v32 = (id)objc_msgSend(v65, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("EMKEmojiTokenList"), v21, &v73, 0, v17);
      if (*((_QWORD *)&v73 + 1) + (_QWORD)v73 > v16 || !v31)
        goto LABEL_23;
      if (v31 == 1)
      {
        objc_msgSend(v62, "emojiTokenAtIndex:", 0);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        -[EMKTextView replaceRange:withEmojiToken:language:](self, "replaceRange:withEmojiToken:language:", v73, v33, v60);
      }
      else
      {
        objc_msgSend(v64, "substringWithRange:");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        self->_tappedGlyphIndex = v22;
        self->_tappedGlyphRange.location = objc_msgSend(v15, "glyphRangeForCharacterRange:actualCharacterRange:", v73, 0);
        self->_tappedGlyphRange.length = v45;
        objc_initWeak(&location, self);
        v46 = [EMKOverlayView alloc];
        -[EMKTextView anchorRect](self, "anchorRect");
        v48 = v47;
        v50 = v49;
        v52 = v51;
        v54 = v53;
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __40__EMKTextView_textTapGestureRecognized___block_invoke;
        v66[3] = &unk_1EA258C20;
        objc_copyWeak(&v70, &location);
        v71 = v73;
        v67 = v64;
        v33 = v44;
        v68 = v33;
        v69 = v60;
        v55 = -[EMKOverlayView initWithView:anchorRect:emojiTokenList:selectionHandler:](v46, "initWithView:anchorRect:emojiTokenList:selectionHandler:", self, v62, v66, v48, v50, v52, v54);
        overlayView = self->_overlayView;
        self->_overlayView = v55;

        objc_destroyWeak(&v70);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      if (!v61
        || (v34 = (id)objc_msgSend(v65, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("EMKEmojiSignifier"), v21, &v73, 0, v17), *((_QWORD *)&v73 + 1) + (_QWORD)v73 > v16))
      {
        v62 = v63;
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      -[EMKTextView beginningOfDocument](self, "beginningOfDocument");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMKTextView positionFromPosition:offset:](self, "positionFromPosition:offset:", v35, (_QWORD)v73);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMKTextView beginningOfDocument](self, "beginningOfDocument");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMKTextView positionFromPosition:offset:](self, "positionFromPosition:offset:", v37, *((_QWORD *)&v73 + 1) + (_QWORD)v73);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMKTextView textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v36, v38);
      v33 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "emojiConversionLanguages");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v60)
      {
        v74[0] = v60;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setEmojiConversionLanguages:", v40);

        -[EMKTextView inputDelegate](self, "inputDelegate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "textWillChange:", self);

        objc_msgSend(v61, "string");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMKTextView replaceRange:withText:](self, "replaceRange:withText:", v33, v42);

        -[EMKTextView inputDelegate](self, "inputDelegate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "textDidChange:", self);

        objc_msgSend(v15, "setEmojiConversionLanguages:", v39);
      }
      else
      {
        -[EMKTextView inputDelegate](self, "inputDelegate");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "textWillChange:", self);

        objc_msgSend(v61, "string");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[EMKTextView replaceRange:withText:](self, "replaceRange:withText:", v33, v58);

        -[EMKTextView inputDelegate](self, "inputDelegate");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "textDidChange:", self);

      }
      v62 = v63;
    }

    goto LABEL_23;
  }
  -[_EMKTextKit2Controller textTapGestureRecognized:](textKit2Controller, "textTapGestureRecognized:", v4);
LABEL_25:

}

void __40__EMKTextView_textTapGestureRecognized___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)WeakRetained[348];
    WeakRetained[348] = 0;

    v4[349] = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v9)
  {
    v6 = *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 64);
    if (v6 <= objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      v7 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

      if ((_DWORD)v7)
        objc_msgSend(v4, "replaceRange:withEmojiToken:language:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v9, *(_QWORD *)(a1 + 48));
    }
  }

}

- (void)updateOverlayView:(id)a3
{
  EMKOverlayView *overlayView;

  overlayView = self->_overlayView;
  if (overlayView)
  {
    -[EMKTextView anchorRect](self, "anchorRect", a3);
    -[EMKOverlayView setView:anchorRect:](overlayView, "setView:anchorRect:", self);
  }
}

- (void)layoutSubviews
{
  _EMKTextKit2Controller *textKit2Controller;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EMKTextView;
  -[EMKTextView layoutSubviews](&v5, sel_layoutSubviews);
  textKit2Controller = self->_textKit2Controller;
  if (textKit2Controller)
  {
    -[_EMKTextKit2Controller textViewDidLayoutSubviews](textKit2Controller, "textViewDidLayoutSubviews");
  }
  else if (self->_overlayView)
  {
    v4 = (id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateOverlayView_, 0, 0, 0.01);
  }
}

- (BOOL)touchHasEmojiSignificance:(id)a3
{
  _EMKTextKit2Controller *textKit2Controller;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  double v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  CGPoint v34;
  CGRect v35;

  textKit2Controller = self->_textKit2Controller;
  if (textKit2Controller)
    return -[_EMKTextKit2Controller touchHasEmojiSignificance:](textKit2Controller, "touchHasEmojiSignificance:", a3);
  objc_msgSend(a3, "locationInView:", self);
  v7 = v6;
  v9 = v8;
  -[EMKTextView textContainerInset](self, "textContainerInset");
  v11 = v10;
  v13 = v12;
  -[EMKTextView textStorage](self, "textStorage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMKTextView layoutManager](self, "layoutManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "attributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v14, "length");
  v18 = objc_msgSend(v16, "length");
  -[EMKTextView textContainer](self, "textContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v7 - v13;
  v21 = v9 - v11;
  v22 = objc_msgSend(v15, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v19, 0, v20, v21);
  objc_msgSend(v15, "boundingRectForGlyphRange:inTextContainer:", objc_msgSend(v15, "glyphIndexForCharacterAtIndex:", v22), 1, v19);
  if (self->_emojiConversionActive
    && (v27 = v23, v28 = v24, v29 = v25, v30 = v26, objc_msgSend(v15, "isEmojiConversionEnabled")))
  {
    v35.origin.x = v27;
    v35.origin.y = v28;
    v35.size.width = v29;
    v35.size.height = v30;
    v34.x = v20;
    v34.y = v21;
    v31 = 0;
    if (CGRectContainsPoint(v35, v34) && v22 < v17 && v22 < v18)
    {
      objc_msgSend(v16, "attribute:atIndex:effectiveRange:", CFSTR("EMKEmojiTokenList"), v22, 0);
      v32 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "attribute:atIndex:effectiveRange:", CFSTR("EMKEmojiSignifier"), v22, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      v31 = (v32 | v33) != 0;

    }
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)_shouldSuppressSelectionCommands
{
  return self->_overlayView != 0;
}

- (void)setPreFrames:(unint64_t)a3
{
  id v4;

  -[EMKTextView layoutManager](self, "layoutManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreFrames:", a3);

}

- (void)setPostFrames:(unint64_t)a3
{
  id v4;

  -[EMKTextView layoutManager](self, "layoutManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPostFrames:", a3);

}

- (void)setDelayFrames:(unint64_t)a3
{
  id v4;

  -[EMKTextView layoutManager](self, "layoutManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelayFrames:", a3);

}

- (EMFEmojiPreferences)emojiPreferences
{
  return (EMFEmojiPreferences *)objc_getProperty(self, a2, 2880, 1);
}

@end
