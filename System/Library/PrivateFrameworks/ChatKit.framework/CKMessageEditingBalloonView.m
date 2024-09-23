@implementation CKMessageEditingBalloonView

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)CKMessageEditingBalloonView;
  -[CKTextBalloonView textView](&v9, sel_textView);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CKMessageEditingBalloonView;
  -[CKTextBalloonView description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CKMessageEditingBalloonView textView:%@ %@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSAttributedString)currentCompositionText
{
  return -[CKMessageEntryTextView compositionText](self->_messageEditingBalloonTextView, "compositionText");
}

- (CKMessageEditingBalloonView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  int v9;
  CKMessageEditingBalloonTextView *v10;
  uint64_t v11;
  void *v12;
  CKMessageEditingBalloonView *v13;
  CKMessageEditingBalloonView *v14;
  void *v15;
  int v16;
  void *v17;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isTextKit2Enabled");

  v10 = [CKMessageEditingBalloonTextView alloc];
  if (v9)
    v11 = -[CKMessageEntryTextView initUsingTextLayoutManagerWithFrame:](v10, "initUsingTextLayoutManagerWithFrame:", x, y, width, height);
  else
    v11 = -[CKMessageEntryTextView initWithFrame:textContainer:](v10, "initWithFrame:textContainer:", 0, x, y, width, height);
  v12 = (void *)v11;
  +[CKMessageEntryContentView configureMessageBodyEntryTextView:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:](CKMessageEntryContentView, "configureMessageBodyEntryTextView:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:", v11, 0, 0);
  v19.receiver = self;
  v19.super_class = (Class)CKMessageEditingBalloonView;
  v13 = -[CKTextBalloonView initWithFrame:textView:](&v19, sel_initWithFrame_textView_, v12, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_messageEditingBalloonTextView, v12);
    -[CKTextBalloonView targetTextContainerInsets](v14, "targetTextContainerInsets");
    objc_msgSend(v12, "setTextContainerInset:");
    objc_msgSend(v12, "setEditable:", 1);
    objc_msgSend(v12, "setScrollEnabled:", 1);
    objc_msgSend(v12, "setUserInteractionEnabled:", 1);
    objc_msgSend(v12, "setAlwaysBounceVertical:", 0);
    objc_msgSend(v12, "setSupportsBigEmojiTextStyles:", 1);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isExpressiveTextEnabled");

    if (v16)
    {
      objc_msgSend(v12, "setAllowsTextAnimations:", 1);
      -[CKMessageEntryTextView setTextFormattingDelegate:](v14->_messageEditingBalloonTextView, "setTextFormattingDelegate:", v14);
      objc_msgSend(v12, "textLayoutManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setRequiresCTLineRef:", 1);

    }
  }

  return v14;
}

- (void)layoutSubviews
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
  void *v19;
  double v20;
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
  void *v34;
  double v35;
  objc_super v36;
  CGRect v37;

  v36.receiver = self;
  v36.super_class = (Class)CKMessageEditingBalloonView;
  -[CKTextBalloonView layoutSubviews](&v36, sel_layoutSubviews);
  -[CKMessageEditingBalloonView customTextViewLayoutBounds](self, "customTextViewLayoutBounds");
  if (CGRectIsEmpty(v37))
    -[CKMessageEditingBalloonView bounds](self, "bounds");
  else
    -[CKMessageEditingBalloonView customTextViewLayoutBounds](self, "customTextViewLayoutBounds");
  -[CKMessageEditingBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKBalloonView textAlignmentInsets](self, "textAlignmentInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v10 + v11 + v17;
  if (-[CKTextBalloonView containsExcessiveLineHeightCharacters](self, "containsExcessiveLineHeightCharacters"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "transcriptTextFontLanguageAwareOutsets");
    v21 = v20;
    v35 = v16;
    v22 = v6;
    v23 = v8;
    v24 = v4;
    v26 = v25;

    v27 = v21 + v26;
    v4 = v24;
    v8 = v23;
    v6 = v22;
    v16 = v35;
    v18 = v18 + v27;
  }
  if (CKMainScreenScale_once_33 != -1)
    dispatch_once(&CKMainScreenScale_once_33, &__block_literal_global_75);
  v28 = v8 + v14 + v16;
  v29 = *(double *)&CKMainScreenScale_sMainScreenScale_33;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_33 == 0.0)
    v29 = 1.0;
  v30 = floor((v4 - v14) * v29) / v29;
  v31 = ceil(v28 * v29) / v29;
  v32 = floor((v6 - v12) * v29) / v29;
  v33 = ceil(v18 * v29) / v29;
  -[CKTextBalloonView textView](self, "textView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v30, v32, v31, v33);

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessageEditingBalloonView;
  -[CKTextBalloonView prepareForReuse](&v3, sel_prepareForReuse);
  -[CKTextBalloonView setContainsExcessiveLineHeightCharacters:](self, "setContainsExcessiveLineHeightCharacters:", 0);
}

- (BOOL)hasBackground
{
  return 0;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  void *v4;

  if (!self->_typingAttributes)
  {
    objc_msgSend(a3, "typingAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEditingBalloonView setTypingAttributes:](self, "setTypingAttributes:", v4);

  }
  return 1;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  id v7;
  id v8;
  id v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  BOOL v13;
  _NSRange v15;

  v15 = a4;
  v7 = a3;
  v8 = a5;
  -[CKTextBalloonView textView](self, "textView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 == v7)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0
      && !objc_msgSend(v7, "shouldUpdateMentionsInRange:replacementText:", &v15, v8))
    {
      v13 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  -[CKMessageEditingBalloonView messageEditingBalloonTextView](self, "messageEditingBalloonTextView", v15.location, v15.length);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "effectsPickerAssistant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjustTypingAttributesIfNeededForReplacement:inRange:", v8, v15.location, v15.length);

  v13 = 1;
LABEL_6:
  objc_msgSend(v7, "typingAttributes", v15.location, v15.length);

  return v13;
}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  length = a4.length;
  location = a4.location;
  v8 = (void *)objc_msgSend(a5, "mutableCopy", a3);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isExpressiveTextEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isSendingExpressiveTextEnabled");

    if (v11)
    {
      v12 = objc_msgSend(MEMORY[0x1E0CEA740], "ck_indexOfMenuWithMenuIdentifier:inMenuElementsArray:", *MEMORY[0x1E0CEB9B8], v8);
      if (v12 >= objc_msgSend(v8, "count"))
        v12 = 0;
      if (CKIsRunningInMacCatalyst())
      {
        -[CKMessageEditingBalloonView textEffectsEditMenuForTextInRange:](self, "textEffectsEditMenuForTextInRange:", location, length);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_13;
      }
      else
      {
        -[CKMessageEditingBalloonView messageEditingBalloonTextView](self, "messageEditingBalloonTextView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "showTextEffectsPickerEditMenuAction");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
LABEL_13:

          v14 = (void *)MEMORY[0x1E0CEA740];
          goto LABEL_14;
        }
        CKFrameworkBundle();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("TEXT_EFFECTS"), &stru_1E276D870, CFSTR("ChatKit"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTitle:", v17);

      }
      objc_msgSend(v8, "insertObject:atIndex:", v13, v12);
      goto LABEL_13;
    }
  }
  else
  {

  }
  v14 = (void *)MEMORY[0x1E0CEA740];
LABEL_14:
  v18 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v14, "menuWithChildren:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)textViewDidChange:(id)a3
{
  id v4;

  objc_msgSend(a3, "updateFontIfNeededAndGetWasUsingBigEmojiStyle:", 0);
  -[CKMessageEditingBalloonView editingBalloonViewDelegate](self, "editingBalloonViewDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEditingBalloonViewContentDidChange:", self);

}

+ (BOOL)supportsAllowsTextAnimationChanges
{
  return 0;
}

- (void)messageEntryTextView:(id)a3 didUpdateForRange:(_NSRange)a4 conversionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  id v10;
  void *v11;
  id v12;

  length = a4.length;
  location = a4.location;
  v12 = a5;
  if (length)
  {
    objc_msgSend(a3, "textStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "beginEditing");
    v10 = (id)objc_msgSend(v9, "ck_attributedStringByConverting:range:", v12, location, length);
    objc_msgSend(v9, "endEditing");
    -[CKMessageEditingBalloonView editingBalloonViewDelegate](self, "editingBalloonViewDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageEditingBalloonViewContentDidChange:", self);

  }
}

- (void)messageEntryTextView:(id)a3 didSetAnimationName:(id)a4 forRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  id v12;

  if (a5.length)
  {
    length = a5.length;
    location = a5.location;
    v9 = a4;
    objc_msgSend(a3, "textStorage");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "beginEditing");
    objc_msgSend(v12, "ck_toggleTextEffectNamed:range:getAdded:", v9, location, length, 0);

    objc_msgSend(v12, "endEditing");
    -[CKMessageEditingBalloonView editingBalloonViewDelegate](self, "editingBalloonViewDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "messageEditingBalloonViewContentDidChange:", self);

    -[CKMessageEditingBalloonView editingBalloonViewDelegate](self, "editingBalloonViewDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageEditingBalloonView:didChangeTextAnimationInRange:", self, location, length);

  }
}

- (void)messageEntryTextView:(id)a3 applyStyleChangeOfType:(unint64_t)a4 add:(BOOL)a5 forRange:(_NSRange)a6
{
  NSUInteger location;
  NSUInteger length;
  _BOOL4 v8;
  void *v11;
  id v12;

  if (a6.length)
  {
    location = a6.location;
    if (a6.location != 0x7FFFFFFFFFFFFFFFLL)
    {
      length = a6.length;
      v8 = a5;
      objc_msgSend(a3, "textStorage");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "beginEditing");
      if (v8)
        objc_msgSend(v12, "ck_addTextStyle:options:range:", a4, 3, location, length);
      else
        objc_msgSend(v12, "ck_removeTextStyle:options:range:", a4, 3, location, length);
      objc_msgSend(v12, "endEditing");
      -[CKMessageEditingBalloonView editingBalloonViewDelegate](self, "editingBalloonViewDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageEditingBalloonViewContentDidChange:", self);

    }
  }
}

- (void)messageEntryTextViewDidChangePencilMode:(id)a3
{
  id v4;

  -[CKMessageEditingBalloonView editingBalloonViewDelegate](self, "editingBalloonViewDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEditingBalloonViewDidChangePencilMode:", self);

}

- (id)textEffectsEditMenuForTextInRange:(_NSRange)a3
{
  void *length;
  void *v4;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25[3];
  _QWORD v26[4];
  id v27[3];
  id location;
  _QWORD v29[3];

  length = (void *)a3.length;
  v4 = (void *)a3.location;
  v29[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isExpressiveTextEnabled");

  if (v7)
  {
    location = 0;
    objc_initWeak(&location, self);
    -[CKTextBalloonView textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "ck_activeTextStylesInRange:", v4, length);

    -[CKTextBalloonView textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ck_activeTextEffectTypeInRange:", v4, length);

    v12 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __65__CKMessageEditingBalloonView_textEffectsEditMenuForTextInRange___block_invoke;
    v26[3] = &unk_1E274FB20;
    objc_copyWeak(v27, &location);
    v27[1] = v4;
    v27[2] = length;
    +[CKTextEffectsMenuFactory textStylePaletteMenuWithHandler:activeTextStyles:](CKTextEffectsMenuFactory, "textStylePaletteMenuWithHandler:activeTextStyles:", v26, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v12;
    v22 = 3221225472;
    v23 = __65__CKMessageEditingBalloonView_textEffectsEditMenuForTextInRange___block_invoke_2;
    v24 = &unk_1E274FB48;
    objc_copyWeak(v25, &location);
    v25[1] = v4;
    v25[2] = length;
    +[CKTextEffectsMenuFactory inlineEffectMenuWithHandler:activeTextEffectType:](CKTextEffectsMenuFactory, "inlineEffectMenuWithHandler:activeTextEffectType:", &v21, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CKIsRunningInMacCatalyst();
    v16 = (void *)MEMORY[0x1E0CEA740];
    v29[0] = v13;
    v29[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2, v21, v22, v23, v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v18 = 17;
    else
      v18 = 1;
    objc_msgSend(v16, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(v25);
    objc_destroyWeak(v27);
    objc_destroyWeak(&location);
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

void __65__CKMessageEditingBalloonView_textEffectsEditMenuForTextInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applyTextStyle:toTextRange:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __65__CKMessageEditingBalloonView_textEffectsEditMenuForTextInRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applyTextEffect:toTextRange:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)modifySelectedTextByTogglingTextStyle:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[CKMessageEditingBalloonView messageEditingBalloonTextView](self, "messageEditingBalloonTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  v8 = v7;

  -[CKMessageEditingBalloonView messageEditingBalloonTextView](self, "messageEditingBalloonTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8 || v6 >= objc_msgSend(v10, "length") || v6 + v8 > objc_msgSend(v10, "length"))
  {
    v8 = objc_msgSend(v10, "length");
    v6 = 0;
  }
  -[CKMessageEditingBalloonView applyTextStyle:toTextRange:](self, "applyTextStyle:toTextRange:", a3, v6, v8);

}

- (void)applyTextStyle:(unint64_t)a3 toTextRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  length = a4.length;
  location = a4.location;
  -[CKMessageEditingBalloonView messageEditingBalloonTextView](self, "messageEditingBalloonTextView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "balloonTextFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "ck_applyWithTextStyle:toRange:baseFont:", a3, location, length, v9);
  -[CKMessageEditingBalloonView editingBalloonViewDelegate](self, "editingBalloonViewDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageEditingBalloonViewContentDidChange:", self);

}

- (void)modifySelectedTextByTogglingTextEffectType:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[CKMessageEditingBalloonView messageEditingBalloonTextView](self, "messageEditingBalloonTextView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  v8 = v7;

  -[CKMessageEditingBalloonView messageEditingBalloonTextView](self, "messageEditingBalloonTextView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8 || v6 >= objc_msgSend(v10, "length") || v6 + v8 > objc_msgSend(v10, "length"))
  {
    v8 = objc_msgSend(v10, "length");
    v6 = 0;
  }
  -[CKMessageEditingBalloonView applyTextEffect:toTextRange:](self, "applyTextEffect:toTextRange:", a3, v6, v8);

}

- (void)applyTextEffect:(int64_t)a3 toTextRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  id v10;

  length = a4.length;
  location = a4.location;
  -[CKMessageEditingBalloonView messageEditingBalloonTextView](self, "messageEditingBalloonTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textStorage");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "beginEditing");
  objc_msgSend(v10, "ck_toggleTextEffectType:range:getAdded:", a3, location, length, 0);
  objc_msgSend(v10, "endEditing");
  -[CKMessageEditingBalloonView editingBalloonViewDelegate](self, "editingBalloonViewDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageEditingBalloonViewContentDidChange:", self);

}

- (CKMessageEditingBalloonViewDelegate)editingBalloonViewDelegate
{
  return (CKMessageEditingBalloonViewDelegate *)objc_loadWeakRetained((id *)&self->_editingBalloonViewDelegate);
}

- (void)setEditingBalloonViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editingBalloonViewDelegate, a3);
}

- (CKMessageEditingBalloonTextView)messageEditingBalloonTextView
{
  return self->_messageEditingBalloonTextView;
}

- (void)setMessageEditingBalloonTextView:(id)a3
{
  objc_storeStrong((id *)&self->_messageEditingBalloonTextView, a3);
}

- (CGRect)customTextViewLayoutBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_customTextViewLayoutBounds.origin.x;
  y = self->_customTextViewLayoutBounds.origin.y;
  width = self->_customTextViewLayoutBounds.size.width;
  height = self->_customTextViewLayoutBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCustomTextViewLayoutBounds:(CGRect)a3
{
  self->_customTextViewLayoutBounds = a3;
}

- (NSDictionary)typingAttributes
{
  return self->_typingAttributes;
}

- (void)setTypingAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_typingAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typingAttributes, 0);
  objc_storeStrong((id *)&self->_messageEditingBalloonTextView, 0);
  objc_destroyWeak((id *)&self->_editingBalloonViewDelegate);
}

@end
