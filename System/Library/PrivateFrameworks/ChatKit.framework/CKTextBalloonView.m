@implementation CKTextBalloonView

- (CKTextBalloonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  CKTextBalloonView *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[CKBalloonTextView makeTextView](CKBalloonTextView, "makeTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CKTextBalloonView initWithFrame:textView:](self, "initWithFrame:textView:", v8, x, y, width, height);

  return v9;
}

- (CKTextBalloonView)initWithFrame:(CGRect)a3 textView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CKTextBalloonView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CKTextBalloonView;
  v10 = -[CKColoredBalloonView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    objc_msgSend(v9, "_disableTiledViews");
    objc_msgSend(v9, "setInteractionDelegate:", v10);
    objc_msgSend(v9, "setDelegate:", v10);
    objc_msgSend(v9, "setShouldAdjustInsetsForMinimumSize:", 1);
    -[CKTextBalloonView addSubview:](v10, "addSubview:", v9);
    -[CKTextBalloonView setTextView:](v10, "setTextView:", v9);
  }

  return v10;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (void)prepareForReuse
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)CKTextBalloonView;
  -[CKColoredBalloonView prepareForReuse](&v19, sel_prepareForReuse);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExpressiveTextEnabled");

  if (v4)
  {
    -[CKTextBalloonView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowsTextAnimations");

    if (v6)
    {
      -[CKTextBalloonView textView](self, "textView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setCustomRenderDisplayLink:", 0);

      if (objc_msgSend((id)objc_opt_class(), "supportsAllowsTextAnimationChanges"))
      {
        -[CKTextBalloonView textView](self, "textView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAllowsTextAnimations:", 0);

      }
    }
  }
  -[CKTextBalloonView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", 0);

  -[CKTextBalloonView setContainsExcessiveLineHeightCharacters:](self, "setContainsExcessiveLineHeightCharacters:", 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CKTextBalloonView nonVibrantSubViews](self, "nonVibrantSubViews", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setUserInteractionEnabled:", 1);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v12);
  }

}

- (void)setSelected:(BOOL)a3 withSelectionState:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  v13 = a4;
  -[CKTextBalloonView setIgnoreSelectionEvent:](self, "setIgnoreSelectionEvent:", 1);
  -[CKTextBalloonView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_6;
  v7 = objc_msgSend(v13, "style");
  if (!v7)
  {
    objc_msgSend(v6, "setFakeSelected:", 0);
    objc_msgSend(v6, "setBalloonTextSelectedRange:", 0, 0);
    v12 = 1;
    goto LABEL_8;
  }
  if (v7 == 1)
  {
    objc_msgSend(v13, "textSelectionRange");
    if (v8)
    {
      objc_msgSend(v6, "setFakeSelected:", 0);
      v9 = objc_msgSend(v13, "textSelectionRange");
      v11 = v10;
LABEL_7:
      objc_msgSend(v6, "setBalloonTextSelectedRange:", v9, v11);
      v12 = 0;
LABEL_8:
      -[CKBalloonView setHasOverlay:](self, "setHasOverlay:", v12);
      goto LABEL_9;
    }
LABEL_6:
    objc_msgSend(v6, "setFakeSelected:", v4);
    v9 = 0;
    v11 = 0;
    goto LABEL_7;
  }
LABEL_9:

  -[CKTextBalloonView setIgnoreSelectionEvent:](self, "setIgnoreSelectionEvent:", 0);
}

- (void)setIgnoreSelectionEvent:(BOOL)a3
{
  self->_ignoreSelectionEvent = a3;
}

- (CKBalloonTextViewProtocol)textView
{
  return self->_textView;
}

- (void)setContainsExcessiveLineHeightCharacters:(BOOL)a3
{
  self->_containsExcessiveLineHeightCharacters = a3;
}

- (id)nonVibrantSubViews
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_textView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)configureForComposition:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  CKTextBalloonView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CKTextBalloonView;
  -[CKColoredBalloonView configureForComposition:](&v31, sel_configureForComposition_, v4);
  v5 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAttributedString:", v6);

  v8 = objc_msgSend(v7, "length");
  v9 = *MEMORY[0x1E0DC1140];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "theme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "balloonTextColorForColorType:", -[CKBalloonView color](self, "color"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v9, v12, 0, v8);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v7, "__ck_bigEmojiStyleWithSingleBigEmojiSupported:", objc_msgSend(v13, "entryViewSupportsSingleBigEmojiFont")))
  {
    case 0:
      objc_msgSend(v13, "balloonTextFont");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(v13, "singleBigEmojiFont");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(v13, "multipleBigEmojiFont");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(v13, "singleBigAssetFont");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v15 = (void *)v14;
      break;
    default:
      v15 = 0;
      break;
  }
  v16 = *MEMORY[0x1E0DC1138];
  objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v15, 0, v8);
  objc_msgSend(v4, "subject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v4, "subject");
    v29 = v9;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithAttributedString:", v19);

    v21 = objc_msgSend(v20, "length");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v30 = v15;
    v22 = self;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "balloonSubjectFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAttribute:value:range:", v16, v24, 0, v21);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "theme");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "balloonTextColorForColorType:", -[CKBalloonView color](v22, "color"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAttribute:value:range:", v29, v27, 0, v21);

    self = v22;
    v15 = v30;

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
    objc_msgSend(v20, "appendAttributedString:", v28);

    objc_msgSend(v20, "appendAttributedString:", v7);
    v7 = v20;
  }
  -[CKTextBalloonView setAttributedText:](self, "setAttributedText:", v7);

}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKTextBalloonView;
  -[CKColoredBalloonView configureForMessagePart:](&v11, sel_configureForMessagePart_, v4);
  if (objc_msgSend(v4, "containsHyperlink"))
  {
    -[CKTextBalloonView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = *MEMORY[0x1E0DC1140];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "balloonTextLinkColorForColorType:", objc_msgSend(v4, "color"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = *MEMORY[0x1E0DC1248];
    v13[0] = v8;
    v13[1] = &unk_1E2870A98;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLinkTextAttributes:", v9);

  }
  objc_msgSend(v4, "transcriptText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTextBalloonView setAttributedText:](self, "setAttributedText:", v10);

  -[CKTextBalloonView setContainsExcessiveLineHeightCharacters:](self, "setContainsExcessiveLineHeightCharacters:", objc_msgSend(v4, "containsExcessiveLineHeightCharacters"));
}

+ (BOOL)supportsAllowsTextAnimationChanges
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExpressiveTextEnabled");

  if (v3)
    return objc_msgSend(MEMORY[0x1E0CEAB18], "ck_supportsDynamicallyTogglingAllowsTextAnimations");
  else
    return 0;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[CKTextBalloonView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CKTextBalloonView;
  -[CKColoredBalloonView description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CKTextBalloonView textView:%@ %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (unint64_t)_allowedTextViewLayoutAction
{
  void *v3;
  int v4;
  id WeakRetained;
  unint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExpressiveTextEnabled");

  if (!v4)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
  v6 = objc_msgSend(WeakRetained, "textBalloonViewAllowedLayoutActionForTextBalloonView:", self);

  -[CKTextBalloonView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(WeakRetained) = objc_msgSend(v7, "ck_hasPlayingOrPausedTextAnimator");

  if ((_DWORD)WeakRetained)
    return v6;
  else
    return 0;
}

- (void)layoutSubviews
{
  CKTextBalloonViewTextEffectsDelegate **p_textEffectsDelegate;
  id WeakRetained;
  id v5;
  unint64_t v6;
  id v7;
  id v8;
  objc_super v9;

  p_textEffectsDelegate = &self->_textEffectsDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_textEffectsDelegate);
    objc_msgSend(v5, "textBalloonViewWillLayoutSubviews:", self);

  }
  v9.receiver = self;
  v9.super_class = (Class)CKTextBalloonView;
  -[CKColoredBalloonView layoutSubviews](&v9, sel_layoutSubviews);
  v6 = -[CKTextBalloonView _allowedTextViewLayoutAction](self, "_allowedTextViewLayoutAction");
  if (v6 == 1)
  {
    -[CKTextBalloonView _updateTextViewOrigin](self, "_updateTextViewOrigin");
  }
  else if (!v6)
  {
    -[CKTextBalloonView _updateTextViewFrame](self, "_updateTextViewFrame");
  }
  v7 = objc_loadWeakRetained((id *)p_textEffectsDelegate);

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)p_textEffectsDelegate);
    objc_msgSend(v8, "textBalloonViewDidLayoutSubviews:", self);

  }
}

- (UIEdgeInsets)targetTextContainerInsets
{
  void *v2;
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
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balloonTextContainerInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  UIEdgeInsets result;

  v20.receiver = self;
  v20.super_class = (Class)CKTextBalloonView;
  -[CKColoredBalloonView alignmentRectInsets](&v20, sel_alignmentRectInsets);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textAlignmentRectInsetsScaleFactor");
  v12 = v3 * v11;
  v13 = v5 * v11;
  v14 = v7 * v11;
  v15 = v9 * v11;

  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.right = v19;
  result.bottom = v18;
  result.left = v17;
  result.top = v16;
  return result;
}

- (void)prepareForDisplay
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v28;
  id v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)CKTextBalloonView;
  -[CKColoredBalloonView prepareForDisplay](&v35, sel_prepareForDisplay);
  -[CKTextBalloonView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTextBalloonView attributedText](self, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExpressiveTextEnabled");

  if (v6
    && (objc_msgSend((id)objc_opt_class(), "supportsAllowsTextAnimationChanges") & 1) == 0
    && objc_msgSend(v3, "allowsTextAnimations"))
  {
    -[CKTextBalloonView textEffectsDelegate](self, "textEffectsDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "customTextRenderingDisplayLinkForTextBalloonViewTextView:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKTextBalloonView textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setCustomRenderDisplayLink:", v8);

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CKBalloonView filters](self, "filters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v32 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v15, "textColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = (void *)objc_msgSend(v4, "mutableCopy");
          v18 = *MEMORY[0x1E0DC1140];
          v19 = objc_msgSend(v4, "length");
          v25 = MEMORY[0x1E0C809B0];
          v26 = 3221225472;
          v27 = __38__CKTextBalloonView_prepareForDisplay__block_invoke;
          v28 = &unk_1E27508C8;
          v29 = v17;
          v30 = v15;
          v20 = v17;
          objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v19, 0, &v25);
          v21 = objc_alloc(MEMORY[0x1E0CB3498]);
          v22 = objc_msgSend(v21, "initWithAttributedString:", v20, v25, v26, v27, v28);

          v4 = (void *)v22;
          goto LABEL_15;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_15:

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setAttributedText:checkForMentions:", v4, 0);
  else
    objc_msgSend(v3, "setAttributedText:", v4);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isExpressiveTextEnabled");

  if (v24 && objc_msgSend((id)objc_opt_class(), "supportsAllowsTextAnimationChanges"))
  {
    objc_msgSend(v3, "_setCustomRenderDisplayLink:", 0);
    objc_msgSend(v3, "setAllowsTextAnimations:", 0);
  }

}

void __38__CKTextBalloonView_prepareForDisplay__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v6 = *MEMORY[0x1E0DC1140];
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "textColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v6, v8, a3, a4);

}

- (CGSize)_textSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKTextBalloonView textView](self, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeThatFits:textAlignmentInsets:isSingleLine:isReplyPreview:", a4, a5, 0, width, height);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (CGSize)_minimumFittingSize
{
  uint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (-[CKBalloonView hasTail](self, "hasTail"))
    v3 = -[CKBalloonView balloonTailShape](self, "balloonTailShape");
  else
    v3 = 0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "skinnyBalloonMaskSizeWithTailShape:", v3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double v4;
  double v5;
  CGSize result;

  -[CKTextBalloonView sizeThatFits:textAlignmentInsets:isSingleLine:](self, "sizeThatFits:textAlignmentInsets:isSingleLine:", a4, 0, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4 isSingleLine:(BOOL *)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  void *v13;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __int128 v54;
  __int128 v55;
  CGSize result;

  -[UIView __ck_alignmentRectSizeForFrameSize:](self, "__ck_alignmentRectSizeForFrameSize:", a3.width, a3.height);
  v9 = v8;
  v11 = v10;
  v12 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  v54 = *MEMORY[0x1E0CEB4B0];
  v55 = v12;
  -[CKTextBalloonView textView](self, "textView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isExpressiveTextEnabled");

  if (v15)
  {
    -[CKTextBalloonView _textSizeThatFits:textAlignmentInsets:isSingleLine:](self, "_textSizeThatFits:textAlignmentInsets:isSingleLine:", &v54, a5, v9, v11);
    v17 = v16;
    v19 = v18;
  }
  else
  {
    -[CKTextBalloonView textView](self, "textView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeThatFits:textAlignmentInsets:isSingleLine:isReplyPreview:", &v54, a5, 0, v9, v11);
    v17 = v21;
    v19 = v22;

  }
  -[CKTextBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  if (*((double *)&v54 + 1) >= v24)
    v27 = v24;
  else
    v27 = *((double *)&v54 + 1);
  if (*((double *)&v55 + 1) >= v26)
    v28 = v26;
  else
    v28 = *((double *)&v55 + 1);
  if (*(double *)&v54 >= v23)
    v29 = v23;
  else
    v29 = *(double *)&v54;
  if (*(double *)&v55 >= v25)
    v30 = v25;
  else
    v30 = *(double *)&v55;
  -[UIView __ck_frameSizeForAlignmentRectSize:](self, "__ck_frameSizeForAlignmentRectSize:", v17 - (v27 + v28), v19 - (v29 + v30));
  v32 = v31;
  v34 = v33;
  -[CKTextBalloonView _minimumFittingSize](self, "_minimumFittingSize");
  v36 = v35;
  v38 = v37;
  if (objc_msgSend(v13, "shouldAdjustInsetsForMinimumSize"))
  {
    v39 = (v36 - v32) * 0.5;
    if (v32 >= v36)
      v39 = 0.0;
    v28 = v28 - v39;
    v27 = v27 - v39;
    v40 = (v38 - v34) * 0.5;
    v41 = v29 - v40;
    v42 = v30 - v40;
    if (v34 < v38)
    {
      v30 = v42;
      v29 = v41;
    }
  }
  if (a4)
  {
    a4->top = v29;
    a4->left = v27;
    a4->bottom = v30;
    a4->right = v28;
  }
  -[CKTextBalloonView traitCollection](self, "traitCollection");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "displayScale");
  if (v44 == 0.0)
  {
    if (CKMainScreenScale_once_75 != -1)
      dispatch_once(&CKMainScreenScale_once_75, &__block_literal_global_185);
    v45 = *(double *)&CKMainScreenScale_sMainScreenScale_75;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_75 == 0.0)
      v45 = 1.0;
    v46 = ceil(v32 * v45) / v45;
    v44 = *(double *)&CKMainScreenScale_sMainScreenScale_75;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_75 == 0.0)
      v44 = 1.0;
  }
  else
  {
    v46 = ceil(v32 * v44) / v44;
  }
  v47 = ceil(v34 * v44) / v44;

  v48 = fmax(v46, v36);
  v49 = fmax(v47, v38);
  if (-[CKBalloonView hasSuggestedActionsMenu](self, "hasSuggestedActionsMenu"))
  {
    if (v48 < 250.0)
      v50 = 250.0 - v48;
    else
      v50 = 0.0;
    -[CKBalloonView suggestedActionsMenuAdditionalHeightForBalloonSize:](self, "suggestedActionsMenuAdditionalHeightForBalloonSize:", fmax(v48, 250.0), 1.79769313e308);
    v48 = v48 + v50;
    v49 = v49 + v51;
  }

  v52 = v48;
  v53 = v49;
  result.height = v53;
  result.width = v52;
  return result;
}

- (void)clearFilters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTextBalloonView;
  -[CKColoredBalloonView clearFilters](&v8, sel_clearFilters);
  -[CKTextBalloonView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsGroupBlending:", 1);

  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsGroupOpacity:", 1);

  objc_msgSend(v3, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompositingFilter:", 0);

  -[CKTextBalloonView attributedText](self, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributedText:", v7);

  objc_msgSend(v3, "setAlpha:", 1.0);
}

- (void)addFilter:(id)a3
{
  id v4;
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CKTextBalloonView;
  -[CKColoredBalloonView addFilter:](&v22, sel_addFilter_, v4);
  -[CKTextBalloonView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupBlending:", 0);

  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

  objc_msgSend(v5, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textCompositingFilter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCompositingFilter:", v9);

  objc_msgSend(v4, "contentAlpha");
  objc_msgSend(v5, "setAlpha:");
  objc_msgSend(v4, "textColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v5, "attributedText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    v13 = *MEMORY[0x1E0DC1140];
    v14 = objc_msgSend(v12, "length");
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __31__CKTextBalloonView_addFilter___block_invoke;
    v19 = &unk_1E27508C8;
    v20 = v12;
    v21 = v4;
    v15 = v12;
    objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v14, 0, &v16);
    objc_msgSend(v5, "setAttributedText:", v15, v16, v17, v18, v19);

  }
}

void __31__CKTextBalloonView_addFilter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  v6 = *MEMORY[0x1E0DC1140];
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "textColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v6, v8, a3, a4);

}

- (void)updateRasterizationForInvisibleInkEffect
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (-[CKBalloonView invisibleInkEffectEnabled](self, "invisibleInkEffectEnabled"))
    v3 = -[CKBalloonView invisibleInkEffectPaused](self, "invisibleInkEffectPaused");
  else
    v3 = 0;
  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setShouldRasterize:", v3);

}

- (BOOL)wantsTapbackPickerBackingBubble
{
  return 1;
}

- (BOOL)isCandidateForTextEffectPlayback
{
  void *v3;
  void *v4;
  char v5;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSuspended");

  return v5;
}

- (void)_updateTextViewFrame
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
  id v13;

  -[CKTextBalloonView bounds](self, "bounds");
  -[CKTextBalloonView _computedTextViewFrameForBoundsSize:](self, "_computedTextViewFrameForBoundsSize:", v3, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CKTextBalloonView textView](self, "textView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CKTextBalloonView targetTextContainerInsets](self, "targetTextContainerInsets");
  objc_msgSend(v13, "setTextContainerInset:");
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

}

- (void)_updateTextViewOrigin
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  CGFloat v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Width;
  CGFloat v22;
  double v23;
  double MinX;
  double MinY;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat rect;
  void *recta;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  -[CKTextBalloonView bounds](self, "bounds");
  -[CKTextBalloonView _computedTextViewFrameForBoundsSize:](self, "_computedTextViewFrameForBoundsSize:", v3, v4);
  v6 = v5;
  v8 = v7;
  rect = v9;
  v11 = v10;
  -[CKTextBalloonView textView](self, "textView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  -[CKTextBalloonView bounds](self, "bounds");
  Width = CGRectGetWidth(v34);
  v35.origin.x = v14;
  v35.origin.y = v16;
  v35.size.width = v18;
  v35.size.height = v20;
  v31 = CGRectGetWidth(v35);
  if (-[CKTextBalloonView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
  {
    v36.origin.x = v6;
    v36.origin.y = v8;
    v36.size.width = rect;
    v36.size.height = v11;
    v22 = CGRectGetWidth(v36);
    v37.size.height = v11;
    v23 = Width - v22;
    v37.origin.x = v6;
    v37.origin.y = v8;
    v37.size.width = rect;
    MinX = Width - v31 - (v23 - CGRectGetMinX(v37));
  }
  else
  {
    v38.origin.x = v6;
    v38.origin.y = v8;
    v38.size.width = rect;
    v38.size.height = v11;
    MinX = CGRectGetMinX(v38);
  }
  v39.origin.x = v14;
  v39.origin.y = v16;
  v39.size.width = v18;
  v39.size.height = v20;
  MinY = CGRectGetMinY(v39);
  -[CKTextBalloonView textView](self, "textView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v28 = v27;
  v30 = v29;

  -[CKTextBalloonView textView](self, "textView");
  recta = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(recta, "setFrame:", MinX, MinY, v28, v30);

}

- (CGRect)_computedTextViewFrameForBoundsSize:(CGSize)a3
{
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
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGRect result;

  -[CKTextBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:", 0.0, 0.0, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKBalloonView textAlignmentInsets](self, "textAlignmentInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v11 + v12 + v18;
  if (-[CKTextBalloonView containsExcessiveLineHeightCharacters](self, "containsExcessiveLineHeightCharacters"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "transcriptTextFontLanguageAwareOutsets");
    v37 = v7;
    v21 = v5;
    v23 = v22;
    v25 = v24;

    v26 = v23 + v25;
    v5 = v21;
    v7 = v37;
    v19 = v19 + v26;
  }
  v27 = v9 + v15 + v17;
  v28 = v7 - v13;
  -[CKTextBalloonView traitCollection](self, "traitCollection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "displayScale");
  v31 = round((v5 - v15) * v30) / v30;
  v32 = round(v28 * v30) / v30;

  v33 = v31;
  v34 = v32;
  v35 = v27;
  v36 = v19;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (void)interactionStartedFromPreviewItemControllerInTextView:(id)a3
{
  id v4;

  -[CKBalloonView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionStartedFromPreviewItemControllerInBalloonView:", self);

}

- (void)interactionStoppedFromPreviewItemControllerInTextView:(id)a3
{
  id v4;

  -[CKBalloonView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionStoppedFromPreviewItemControllerInBalloonView:", self);

}

- (void)interactionStartedLongPressInTextView:(id)a3
{
  id v4;

  -[CKBalloonView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonViewLongTouched:", self);

}

- (void)interactionStartedTapInTextView:(id)a3 withModifierFlags:(int64_t)a4 selectedText:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[CKBalloonView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "balloonViewTapped:withModifierFlags:selectedText:", self, a4, v7);

}

- (void)textViewDidChangeSelection:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[CKTextBalloonView ignoreSelectionEvent](self, "ignoreSelectionEvent");
  v5 = v9;
  if (!v4)
  {
    objc_msgSend(v9, "selectedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textInRange:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      -[CKBalloonView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "balloonViewTextViewDidChangeSelection:selectedText:textView:", self, v7, v9);

      if (-[CKBalloonView hasOverlay](self, "hasOverlay"))
        -[CKBalloonView setHasOverlay:](self, "setHasOverlay:", 0);
    }

    v5 = v9;
  }

}

- (void)_textViewDidChangeCustomRenderBounds:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
  objc_msgSend(WeakRetained, "textBalloonViewTextViewDidChangeRenderBounds:", self);

}

- (void)interactionTextViewShouldCopyToPasteboard:(id)a3
{
  id v4;

  -[CKBalloonView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonViewShouldCopyToPasteboard:", self);

}

- (void)tapGestureRecognized:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  if (objc_msgSend(v4, "modifierFlags"))
  {
    v9.receiver = self;
    v9.super_class = (Class)CKTextBalloonView;
    -[CKBalloonView tapGestureRecognized:](&v9, sel_tapGestureRecognized_, v4);
  }
  else
  {
    -[CKTextBalloonView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textInRange:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonView delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "balloonViewTapped:withModifierFlags:selectedText:", self, objc_msgSend(v4, "modifierFlags"), v7);

  }
}

- (void)interactionTextView:(id)a3 userDidDragOutsideViewWithPoint:(CGPoint)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  CGPoint v10;
  CGRect v11;

  -[CKTextBalloonView convertPoint:fromView:](self, "convertPoint:fromView:", a3, a4.x, a4.y);
  v6 = v5;
  v8 = v7;
  -[CKTextBalloonView bounds](self, "bounds");
  v10.x = v6;
  v10.y = v8;
  if (!CGRectContainsPoint(v11, v10))
  {
    -[CKBalloonView delegate](self, "delegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "balloonView:userDidDragOutsideBalloonWithPoint:", self, v6, v8);

  }
}

- (void)setAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *v5;
  NSAttributedString *v6;

  v4 = (NSAttributedString *)a3;
  if (self->_attributedText != v4)
  {
    v6 = v4;
    v5 = (NSAttributedString *)-[NSAttributedString copy](v4, "copy");

    objc_storeStrong((id *)&self->_attributedText, v5);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    v4 = v5;
  }

}

- (double)textViewWidthForWidth:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  -[CKTextBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:", 0.0, 0.0, a3, 0.0);
  v5 = v4;
  -[CKBalloonView textAlignmentInsets](self, "textAlignmentInsets");
  return v5 + v6 + v7;
}

- (void)cullSubviewsWithVisibleBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKTextBalloonView convertRect:toView:](self, "convertRect:toView:", v9, x, y, width, height);
    objc_msgSend(v9, "cullSubviewsWithVisibleBounds:");
  }

}

- (Class)invisibleInkEffectViewClass
{
  return (Class)objc_opt_class();
}

- (void)invisibleInkEffectViewWasUncovered
{
  void *v3;
  void *v4;
  id v5;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspendForTimeInterval:", 5.0);

  -[CKTextBalloonView textEffectsDelegate](self, "textEffectsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKTextBalloonView textEffectsDelegate](self, "textEffectsDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textBalloonViewTextView:didChangeTextEffectPlaybackCandidateStatus:", self, -[CKTextBalloonView isCandidateForTextEffectPlayback](self, "isCandidateForTextEffectPlayback"));

  }
}

- (void)invisibleInkEffectViewWasSuspended
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKTextBalloonView;
  -[CKBalloonView invisibleInkEffectViewWasSuspended](&v5, sel_invisibleInkEffectViewWasSuspended);
  -[CKTextBalloonView textEffectsDelegate](self, "textEffectsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKTextBalloonView textEffectsDelegate](self, "textEffectsDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textBalloonViewTextView:didChangeTextEffectPlaybackCandidateStatus:", self, -[CKTextBalloonView isCandidateForTextEffectPlayback](self, "isCandidateForTextEffectPlayback"));

  }
}

- (void)invisibleInkEffectViewWasResumed
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKTextBalloonView;
  -[CKBalloonView invisibleInkEffectViewWasResumed](&v5, sel_invisibleInkEffectViewWasResumed);
  -[CKTextBalloonView textEffectsDelegate](self, "textEffectsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKTextBalloonView textEffectsDelegate](self, "textEffectsDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textBalloonViewTextView:didChangeTextEffectPlaybackCandidateStatus:", self, -[CKTextBalloonView isCandidateForTextEffectPlayback](self, "isCandidateForTextEffectPlayback"));

  }
}

- (void)attachInvisibleInkEffectView
{
  void *v3;
  void *v4;
  id v5;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CKTextBalloonView invisibleInkEffectViewClass](self, "invisibleInkEffectViewClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "attachToBalloonView:", self);
  -[CKTextBalloonView textView](self, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTextBalloonView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v5, v4);

}

- (void)detachInvisibleInkEffectView
{
  void *v3;
  id v4;

  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[CKTextBalloonView invisibleInkEffectViewClass](self, "invisibleInkEffectViewClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "detachFromBalloonView");
  objc_msgSend(v4, "removeFromSuperview");

}

- (void)truncateForLargeText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKTextBalloonView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumNumberOfLines:", 3);

  -[CKTextBalloonView textView](self, "textView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineBreakMode:", 4);

}

- (void)restoreFromLargeTextTruncation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CKTextBalloonView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumNumberOfLines:", 0);

  -[CKTextBalloonView textView](self, "textView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineBreakMode:", 0);

}

- (BOOL)isSelected
{
  void *v2;
  BOOL v3;
  uint64_t v4;

  -[CKTextBalloonView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isFakeSelected") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "selectedRange");
    v3 = v4 != 0;
  }

  return v3;
}

- (void)vibrantContainerWillReparentNonVibrantSubviews:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setUserInteractionEnabled:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)updateTextSelectionState:(id)a3 forTextSelectionArea:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v6 = a3;
  -[CKTextBalloonView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 1)
  {
    objc_msgSend(v7, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    v13 = objc_msgSend(v6, "textSelectionRange");
    objc_msgSend(v6, "textSelectionRange");
    if (v14 + v13 >= v12)
    {
LABEL_9:
      v20 = v6;
      goto LABEL_10;
    }
    v15 = objc_msgSend(v6, "textSelectionRange");
    objc_msgSend(v6, "textSelectionRange");
    v10 = v16 + v15;
    v17 = objc_msgSend(v6, "textSelectionRange");
    objc_msgSend(v6, "textSelectionRange");
    v9 = v12 - (v17 + v18);
  }
  else
  {
    if (a4 || !objc_msgSend(v6, "textSelectionRange"))
      goto LABEL_9;
    v9 = objc_msgSend(v6, "textSelectionRange");
    v10 = 0;
  }
  +[CKBalloonSelectionState balloonSelectionState:textSelectionRange:](CKBalloonSelectionState, "balloonSelectionState:textSelectionRange:", objc_msgSend(v6, "style"), v10, v9);
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19)
    goto LABEL_9;
  v20 = (id)v19;
  -[CKTextBalloonView setSelected:withSelectionState:](self, "setSelected:withSelectionState:", 1, v19);
LABEL_10:

  return v20;
}

- (void)addOverlaySubview:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKTextBalloonView textView](self, "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKTextBalloonView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v4, v5);

}

- (CKTextBalloonViewTextEffectsDelegate)textEffectsDelegate
{
  return (CKTextBalloonViewTextEffectsDelegate *)objc_loadWeakRetained((id *)&self->_textEffectsDelegate);
}

- (void)setTextEffectsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textEffectsDelegate, a3);
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (BOOL)containsExcessiveLineHeightCharacters
{
  return self->_containsExcessiveLineHeightCharacters;
}

- (BOOL)ignoreSelectionEvent
{
  return self->_ignoreSelectionEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_destroyWeak((id *)&self->_textEffectsDelegate);
}

@end
