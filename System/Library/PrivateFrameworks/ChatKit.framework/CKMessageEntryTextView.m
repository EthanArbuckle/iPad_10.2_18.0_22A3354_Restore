@implementation CKMessageEntryTextView

- (void)setPlaceholderText:(id)a3
{
  NSString *v4;
  NSString *placeholderText;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_placeholderText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    placeholderText = self->_placeholderText;
    self->_placeholderText = v4;

    -[CKMessageEntryTextView _updateAttributedPlaceholder](self, "_updateAttributedPlaceholder");
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UITapGestureRecognizer setDelegate:](self->_immediateTapGestureRecognizer, "setDelegate:", 0);
  -[UITapGestureRecognizer setDelegate:](self->_tapGestureRecognizer, "setDelegate:", 0);
  -[UILongPressGestureRecognizer setDelegate:](self->_longPressGestureRecognizer, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryTextView;
  -[EMKTextView dealloc](&v4, sel_dealloc);
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryTextView;
  v3 = -[CKMessageEntryTextView resignFirstResponder](&v5, sel_resignFirstResponder);
  if (v3)
  {
    -[CKMessageEntryTextView setSavedKeyboardInputMode:](self, "setSavedKeyboardInputMode:", 0);
    -[CKMessageEntryTextView setInPencilMode:](self, "setInPencilMode:", 0);
    -[CKMessageEntryTextView setPencilWriting:](self, "setPencilWriting:", 0);
  }
  return v3;
}

- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  void *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)CKMessageEntryTextView;
  v7 = -[EMKTextView initUsingTextLayoutManagerWithFrame:](&v10, sel_initUsingTextLayoutManagerWithFrame_);
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "setupTextViewFromInitWithTextLayoutManagerWithFrame:", x, y, width, height);
  return v8;
}

- (void)setupScribbleInteraction
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA960]), "initWithDelegate:", self);
  -[CKMessageEntryTextView setScribbleInteraction:](self, "setScribbleInteraction:", v4);
  -[CKMessageEntryTextView addInteraction:](self, "addInteraction:", v4);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", self, sel_handleHoverGesture_);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setAllowedTouchTypes:", &unk_1E286FBE0);
  -[CKMessageEntryTextView addGestureRecognizer:](self, "addGestureRecognizer:", v3);
  -[CKMessageEntryTextView setInPencilMode:](self, "setInPencilMode:", objc_msgSend(MEMORY[0x1E0CEA960], "isPencilInputExpected"));

}

- (void)setScribbleInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_scribbleInteraction, a3);
}

- (void)setInPencilMode:(BOOL)a3
{
  id v4;

  if (self->_inPencilMode != a3)
  {
    self->_inPencilMode = a3;
    -[CKMessageEntryTextView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageEntryTextViewDidChangePencilMode:", self);

  }
}

- (void)setupTextViewFromInitWithTextLayoutManagerWithFrame:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CKEntryRichTextViewEffectsPickerAssistant *v13;

  self->_fontType = 0;
  self->_supportsBigEmojiTextStyles = 1;
  self->_expressiveTextEnabled = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_textViewDidChange_, *MEMORY[0x1E0CEBD90], self);

  -[CKMessageEntryTextView textContainer](self, "textContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balloonLineFragmentPadding");
  objc_msgSend(v5, "setLineFragmentPadding:");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entryViewVerticalTextFieldInsets");
  -[CKMessageEntryTextView setTextContainerInset:](self, "setTextContainerInset:");

  -[CKMessageEntryTextView setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[CKMessageEntryTextView setOpaque:](self, "setOpaque:", 0);
  -[CKMessageEntryTextView setScrollEnabled:](self, "setScrollEnabled:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entryFieldGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView setPlaceholderColor:](self, "setPlaceholderColor:", v10);

  -[CKMessageEntryTextView _placeholderLabel](self, "_placeholderLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNumberOfLines:", 1);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__localeChanged, *MEMORY[0x1E0CEBD58], 0);

  -[CKMessageEntryTextView _setupTapOrLongPressGestureRecognizers](self, "_setupTapOrLongPressGestureRecognizers");
  -[CKMessageEntryTextView setupScribbleInteraction](self, "setupScribbleInteraction");
  v13 = -[CKEntryRichTextViewEffectsPickerAssistant initWithTextView:]([CKEntryRichTextViewEffectsPickerAssistant alloc], "initWithTextView:", self);
  -[CKMessageEntryTextView setEffectsPickerAssistant:](self, "setEffectsPickerAssistant:", v13);

  -[CKMessageEntryTextView _updatedAllowedTypingAttributesWithKeys:](self, "_updatedAllowedTypingAttributesWithKeys:", MEMORY[0x1E0C9AA60]);
}

- (void)setPlaceholderColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_placeholderColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_placeholderColor, a3);
    -[CKMessageEntryTextView _updateAttributedPlaceholder](self, "_updateAttributedPlaceholder");
  }

}

- (void)setFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  -[CKMessageEntryTextView font](self, "font");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", v4) & 1) != 0)
  {
    -[CKMessageEntryTextView _placeholderLabel](self, "_placeholderLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v4);

    if ((v8 & 1) != 0)
      goto LABEL_8;
  }
  else
  {

  }
  v12.receiver = self;
  v12.super_class = (Class)CKMessageEntryTextView;
  -[CKMessageEntryTextView setFont:](&v12, sel_setFont_, v4);
  -[CKMessageEntryTextView _updateAttributedPlaceholder](self, "_updateAttributedPlaceholder");
  -[CKMessageEntryTextView font](self, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v4);

  if ((v10 & 1) == 0)
    -[CKMessageEntryTextView setNeedsLayout](self, "setNeedsLayout");
  -[CKMessageEntryTextView font](self, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView _updateTextContainerInsetUsingFont:](self, "_updateTextContainerInsetUsingFont:", v11);

LABEL_8:
}

- (void)_updateAttributedPlaceholder
{
  __CFString *placeholderText;
  UIColor *placeholderColor;
  UIColor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  __CFString *v13;

  placeholderText = (__CFString *)self->_placeholderText;
  if (!placeholderText)
    placeholderText = &stru_1E276D870;
  v13 = placeholderText;
  placeholderColor = self->_placeholderColor;
  if (placeholderColor)
  {
    v5 = placeholderColor;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "theme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entryFieldGrayColor");
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();

  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DC1140]);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isExpressiveTextEnabled");

  if (v10)
    objc_msgSend(MEMORY[0x1E0DC1350], "ck_fontWithMessageEntryTextViewFontType:", -[CKMessageEntryTextView fontType](self, "fontType"));
  else
    -[CKMessageEntryTextView font](self, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0DC1138]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v13, v8);
  -[CKMessageEntryTextView setAttributedPlaceholder:](self, "setAttributedPlaceholder:", v12);

  -[CKMessageEntryTextView setNeedsLayout](self, "setNeedsLayout");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_immediateTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_scribbleInteraction, 0);
  objc_storeStrong((id *)&self->_savedKeyboardInputMode, 0);
  objc_destroyWeak((id *)&self->_textFormattingDelegate);
  objc_storeStrong((id *)&self->_showTextEffectsPickerEditMenuAction, 0);
  objc_storeStrong((id *)&self->_effectsPickerAssistant, 0);
  objc_storeStrong((id *)&self->_proofreadingInfo, 0);
  objc_destroyWeak((id *)&self->_mentionsDelegate);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_placeholderText, 0);
}

- (void)didEndEditing:(id)a3
{
  if (CKIsRunningInMessagesNotificationExtension())
    -[CKMessageEntryTextView checkForMentions](self, "checkForMentions");
}

- (BOOL)_canSuggestSupplementalItemsForCurrentSelection
{
  void *v2;
  char v3;

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canSuggestSupplementalItemsForCurrentSelection");

  return v3;
}

- (void)_insertSupplementalItem:(id)a3 forString:(id)a4 replacementRange:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSupplementalItem:forString:replacementRange:", v10, v9, v8);

}

- (void)_insertionPointEnteredRange:(id)a3 string:(id)a4 supplementalItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertionPointEnteredRange:string:supplementalItems:", v10, v9, v8);

}

- (void)_insertionPointExitedRangeWithSupplementalItems
{
  id v2;

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertionPointExitedRangeWithSupplementalItems");

}

- (void)_chooseSupplementalItemToInsert:(id)a3 replacementRange:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "chooseSupplementalItemToInsert:replacementRange:completionHandler:", v10, v9, v8);

}

- (void)_cancelChooseSupplementalItemToInsert
{
  id v2;

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelChooseSupplementalItemToInsert");

}

- (void)didTapMentionForTextView:(id)a3 atCharacterIndex:(double)a4
{
  id v5;

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didTapMentionAtCharacterIndex:", a4);

}

- (void)didLongPressMentionForTextView:(id)a3 characterIndex:(unint64_t)a4 isLongPress:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a5;
  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didLongPressMentionAtCharacterIndex:isLongPress:", a4, v5);

}

- (void)updateMentionAssociationsForInputModeChange:(id)a3
{
  id v3;

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateMentionsAssociations");

}

- (void)acceptAutomaticMentionConfirmation
{
  id v2;

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptAutomaticMentionConfirmation");

}

- (void)updateMentionsAssociations
{
  id v2;

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateMentionsAssociations");

}

- (void)reloadMentionsData
{
  id v2;

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadMentionsData");

}

- (void)checkForMentions
{
  id v2;

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "checkForMentions");

}

- (void)insertMentionByName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertMentionByName:", v4);

}

- (BOOL)shouldUpdateMentionsInRange:(_NSRange *)a3 replacementText:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentTappedCharacterIndex:", 0x7FFFFFFFFFFFFFFFLL);

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v8, "shouldUpdateMentionsInRange:withReplacementText:", a3->location, a3->length, v6);

  return (char)a3;
}

- (BOOL)allowsMentions
{
  void *v2;
  char v3;

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsMentions");

  return v3;
}

- (void)_setAnimatingMentionsHidden:(BOOL)a3
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  CKMessageEntryTextView *v12;
  BOOL v13;

  -[CKMessageEntryTextView textLayoutManager](self, "textLayoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKMessageEntryTextView+CKMentionsController.m"), 21, CFSTR("TextKit 2 expected"));

  }
  -[CKMessageEntryTextView attributedText](self, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__CKMessageEntryTextView_CKMentionsController___setAnimatingMentionsHidden___block_invoke;
  v10[3] = &unk_1E2755538;
  v13 = a3;
  v11 = v6;
  v12 = self;
  v8 = v6;
  objc_msgSend(v7, "ck_enumerateAllMentionAnimationIdentifiersUsingBlock:", v10);

  objc_msgSend((id)objc_opt_class(), "setNeedsDisplayCurrentRenderAttributesForView:", self);
}

void __76__CKMessageEntryTextView_CKMentionsController___setAnimatingMentionsHidden___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "documentRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v18 = v7;
  objc_msgSend(v7, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationFromLocation:withOffset:", v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "locationFromLocation:withOffset:", v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v10, v11);
  v13 = *(unsigned __int8 *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "textLayoutManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = *MEMORY[0x1E0DC1140];
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addRenderingAttribute:value:forTextRange:", v16, v17, v12);

  }
  else
  {
    objc_msgSend(v14, "removeRenderingAttribute:forTextRange:", *MEMORY[0x1E0DC1140], v12);
  }

}

- (void)setNeedsDisplayCurrentRenderAttributes
{
  objc_msgSend((id)objc_opt_class(), "setNeedsDisplayCurrentRenderAttributesForView:", self);
}

+ (void)setNeedsDisplayCurrentRenderAttributesForView:(id)a3
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
        objc_msgSend(a1, "setNeedsDisplayCurrentRenderAttributesForView:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGSize v13;
  CGPoint v14;
  CGRect v15;
  UIEdgeInsets v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CKMessageEntryTextView frame](self, "frame");
  NSStringFromCGRect(v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  -[CKMessageEntryTextView contentSize](self, "contentSize");
  NSStringFromCGSize(v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView contentOffset](self, "contentOffset");
  NSStringFromCGPoint(v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView adjustedContentInset](self, "adjustedContentInset");
  NSStringFromUIEdgeInsets(v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> {frame: %@, text length: %lu, contentSize: %@, contentOffset: %@, adjustedContentInset: %@"), v4, self, v5, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKMessageEntryTextView;
  -[EMKTextView layoutSubviews](&v8, sel_layoutSubviews);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAccessibilityPreferredContentSizeCategory");

  if (v4)
  {
    -[CKMessageEntryTextView _placeholderLabel](self, "_placeholderLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);

    -[CKMessageEntryTextView _placeholderLabel](self, "_placeholderLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBaselineAdjustment:", 1);

    -[CKMessageEntryTextView _placeholderLabel](self, "_placeholderLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMinimumScaleFactor:", 0.01);

  }
}

- (CKMessageEntryTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  CKMessageEntryTextView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  CKEntryRichTextViewEffectsPickerAssistant *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CKMessageEntryTextView;
  v4 = -[EMKTextView initWithFrame:textContainer:](&v20, sel_initWithFrame_textContainer_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_textViewDidChange_, *MEMORY[0x1E0CEBD90], v4);
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_keyboardWillShow_, *MEMORY[0x1E0CEB978], v4);
    -[CKMessageEntryTextView textContainer](v4, "textContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "balloonLineFragmentPadding");
    objc_msgSend(v6, "setLineFragmentPadding:");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "entryViewVerticalTextFieldInsets");
    -[CKMessageEntryTextView setTextContainerInset:](v4, "setTextContainerInset:");

    -[CKMessageEntryTextView setBackgroundColor:](v4, "setBackgroundColor:", 0);
    -[CKMessageEntryTextView setOpaque:](v4, "setOpaque:", 0);
    -[CKMessageEntryTextView setScrollEnabled:](v4, "setScrollEnabled:", 0);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "entryFieldGrayColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryTextView setPlaceholderColor:](v4, "setPlaceholderColor:", v11);

    -[CKMessageEntryTextView _placeholderLabel](v4, "_placeholderLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", 1);

    -[CKMessageEntryTextView setupScribbleInteraction](v4, "setupScribbleInteraction");
    v4->_supportsBigEmojiTextStyles = 1;
    -[CKMessageEntryTextView _setupTapOrLongPressGestureRecognizers](v4, "_setupTapOrLongPressGestureRecognizers");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CEBD58];
    objc_msgSend(v13, "addObserver:selector:name:object:", v4, sel__localeChanged, *MEMORY[0x1E0CEBD58], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v4, sel_updateMentionAssociationsForInputModeChange_, v14, 0);

    -[CKMessageEntryTextView _localeChanged](v4, "_localeChanged");
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = objc_msgSend(v16, "isTextKit2Enabled");

    if ((v14 & 1) == 0)
    {
      -[CKMessageEntryTextView layoutManager](v4, "layoutManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setMentionsDelegate:", v4);

    }
    v18 = -[CKEntryRichTextViewEffectsPickerAssistant initWithTextView:]([CKEntryRichTextViewEffectsPickerAssistant alloc], "initWithTextView:", v4);
    -[CKMessageEntryTextView setEffectsPickerAssistant:](v4, "setEffectsPickerAssistant:", v18);

    -[CKMessageEntryTextView _updatedAllowedTypingAttributesWithKeys:](v4, "_updatedAllowedTypingAttributesWithKeys:", MEMORY[0x1E0C9AA60]);
  }
  return v4;
}

- (void)_setupTapOrLongPressGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_handleTapImmediately_);
  objc_msgSend(v6, "setAllowableMovement:", 10.0);
  objc_msgSend(v6, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v6, "setDelegate:", self);
  -[CKMessageEntryTextView addGestureRecognizer:](self, "addGestureRecognizer:", v6);
  -[CKMessageEntryTextView setImmediateTapGestureRecognizer:](self, "setImmediateTapGestureRecognizer:", v6);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_handleTapOrLongPress_);
  objc_msgSend(v3, "setAllowableMovement:", 10.0);
  objc_msgSend(v3, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v3, "setDelegate:", self);
  -[CKMessageEntryTextView addGestureRecognizer:](self, "addGestureRecognizer:", v3);
  -[CKMessageEntryTextView setTapGestureRecognizer:](self, "setTapGestureRecognizer:", v3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", self, sel_handleTapOrLongPress_);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v3, "requireGestureRecognizerToFail:", v4);
  -[CKMessageEntryTextView addGestureRecognizer:](self, "addGestureRecognizer:", v4);
  -[CKMessageEntryTextView setLongPressGestureRecognizer:](self, "setLongPressGestureRecognizer:", v4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_handleDoubleTap_);
  objc_msgSend(v5, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v5, "setNumberOfTapsRequired:", 2);
  objc_msgSend(v3, "requireGestureRecognizerToFail:", v5);
  -[CKMessageEntryTextView setDoubleTapGestureRecognizer:](self, "setDoubleTapGestureRecognizer:", v5);
  -[CKMessageEntryTextView addGestureRecognizer:](self, "addGestureRecognizer:", v5);

}

- (id)initUsingTextLayoutManagerWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CKMessageEntryTextView;
  v8 = -[EMKTextView initUsingTextLayoutManagerWithFrame:textContainer:](&v11, sel_initUsingTextLayoutManagerWithFrame_textContainer_, a4);
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "setupTextViewFromInitWithTextLayoutManagerWithFrame:", x, y, width, height);
  return v9;
}

- (void)_localeChanged
{
  id v2;

  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeChanged");

}

- (void)_updatedAllowedTypingAttributesWithKeys:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0DC1178];
  v22 = *MEMORY[0x1E0DC1138];
  v23 = v4;
  v5 = *MEMORY[0x1E0DC1100];
  v24 = *MEMORY[0x1E0DC1140];
  v25 = v5;
  v6 = *MEMORY[0x1E0DC1150];
  v26 = *MEMORY[0x1E0DC1158];
  v27 = v6;
  v7 = *MEMORY[0x1E0DC1248];
  v28 = *MEMORY[0x1E0DC11A8];
  v29 = v7;
  v8 = *MEMORY[0x1E0DC11B8];
  v30 = *MEMORY[0x1E0DC11B0];
  v31 = v8;
  v9 = *MEMORY[0x1E0DC11D8];
  v32 = *MEMORY[0x1E0DC1198];
  v33 = v9;
  v10 = *MEMORY[0x1E0DC1108];
  v34 = *MEMORY[0x1E0DC1160];
  v35 = v10;
  v11 = *MEMORY[0x1E0DC11A0];
  v36 = *MEMORY[0x1E0DC1240];
  v37 = v11;
  v12 = *MEMORY[0x1E0DC1130];
  v38 = *MEMORY[0x1E0DC1168];
  v39 = v12;
  v13 = *MEMORY[0x1E0DC1250];
  v40 = *MEMORY[0x1E0DC1258];
  v41 = v13;
  v14 = *MEMORY[0x1E0D381F0];
  v42 = *MEMORY[0x1E0D381C0];
  v43 = v14;
  v44 = *MEMORY[0x1E0D381D0];
  v15 = (void *)MEMORY[0x1E0C99D20];
  v16 = a3;
  objc_msgSend(v15, "arrayWithObjects:count:", &v22, 23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy", v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38,
                  v39,
                  v40,
                  v41,
                  v42,
                  v43,
                  v44,
                  v45);

  objc_msgSend(v18, "addObjectsFromArray:", v16);
  v19 = (void *)MEMORY[0x1E0C99E60];
  v20 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView _setAllowedTypingAttributes:](self, "_setAllowedTypingAttributes:", v21);

}

- (void)setMentionsDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mentionsDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_mentionsDelegate, obj);
    -[CKMessageEntryTextView _localeChanged](self, "_localeChanged");
    v5 = obj;
  }

}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4;
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
  objc_super v17;
  CGRect result;

  v4 = a3;
  if (*(_WORD *)&self->_hideCaret)
  {
    v10 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CKMessageEntryTextView;
    -[CKMessageEntryTextView caretRectForPosition:](&v17, sel_caretRectForPosition_, v4);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }

  v5 = v10;
  v6 = v12;
  v7 = v14;
  v8 = v16;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)_updateTextContainerInsetUsingFont:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryViewVerticalTextFieldInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entryViewCoverMinHeight");
  v16 = v15;

  objc_msgSend(v4, "lineHeight");
  v18 = v17;

  v19 = v11 + v7 + v18;
  if (v19 >= v16)
    v20 = v11;
  else
    v20 = (v16 - v18) * 0.5;
  if (v19 >= v16)
    v21 = v7;
  else
    v21 = (v16 - v18) * 0.5;
  -[CKMessageEntryTextView setTextContainerInset:](self, "setTextContainerInset:", v21, v9, v20, v13);
}

- (void)setFontType:(unint64_t)a3
{
  id v4;

  if (self->_fontType != a3)
  {
    self->_fontType = a3;
    -[CKMessageEntryTextView _updateAttributedPlaceholder](self, "_updateAttributedPlaceholder");
    objc_msgSend(MEMORY[0x1E0DC1350], "ck_fontWithMessageEntryTextViewFontType:", self->_fontType);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryTextView _updateTextContainerInsetUsingFont:](self, "_updateTextContainerInsetUsingFont:", v4);

  }
}

- (void)setAttributedText:(id)a3
{
  -[CKMessageEntryTextView setAttributedText:checkForMentions:](self, "setAttributedText:checkForMentions:", a3, 1);
}

- (void)setAttributedText:(id)a3 checkForMentions:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;
  objc_super v17;

  v4 = a4;
  v6 = a3;
  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didSetAttributedTextOfTextView");

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isExpressiveTextEnabled");

  if (v9)
  {
    v10 = (void *)objc_msgSend(v6, "mutableCopy");

    if (self->_supportsBigEmojiTextStyles)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "entryViewSupportsSingleBigEmojiFont");
      -[CKMessageEntryTextView mediaObjects](self, "mediaObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ck_adjustFontsForBigEmojisIfNeededWithSingleBigEmojiSupported:mediaObjects:", v12, v14);

    }
    v17.receiver = self;
    v17.super_class = (Class)CKMessageEntryTextView;
    -[CKMessageEntryTextView setAttributedText:](&v17, sel_setAttributedText_, v10);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CKMessageEntryTextView;
    -[CKMessageEntryTextView setAttributedText:](&v16, sel_setAttributedText_, v6);
    v10 = v6;
  }

  -[CKMessageEntryTextView updateTextViewAndCheckForMentions:](self, "updateTextViewAndCheckForMentions:", v4);
  -[CKMessageEntryTextView delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textViewDidChange:", self);

}

- (void)handleTapImmediately:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isExpressiveTextEnabled");

  if (v5)
    -[CKMessageEntryTextView hideTextEffectsPickerIfNeeded](self, "hideTextEffectsPickerIfNeeded");
}

- (void)handleTapOrLongPress:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char isKindOfClass;
  dispatch_time_t v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint8_t v30[8];
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  double v35;
  double v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD block[6];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExpressiveTextEnabled");

  if (v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0 || objc_msgSend(v4, "state") == 3)
    {
      if (-[CKMessageEntryTextView hideCaret](self, "hideCaret"))
      {
        -[CKMessageEntryTextView setAllowCalloutActions:](self, "setAllowCalloutActions:", 0);
        v8 = dispatch_time(0, 500000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke;
        block[3] = &unk_1E274A208;
        block[4] = self;
        dispatch_after(v8, MEMORY[0x1E0C80D38], block);
      }
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isTextKit2Enabled");

      if (v10)
      {
        objc_msgSend(v4, "locationInView:", self);
        v12 = v11;
        v14 = v13;
        -[CKMessageEntryTextView textLayoutManager](self, "textLayoutManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "documentRange");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ensureLayoutForRange:", v16);
        objc_msgSend(v16, "location");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "lineFragmentRangeForPoint:inContainerAtLocation:", v17, v12, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v43 = 0;
          v44 = &v43;
          v45 = 0x3032000000;
          v46 = __Block_byref_object_copy__63;
          v47 = __Block_byref_object_dispose__63;
          v48 = 0;
          v37 = 0;
          v38 = (double *)&v37;
          v39 = 0x4010000000;
          v40 = &unk_18E8EEE6F;
          v19 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
          v41 = *MEMORY[0x1E0C9D648];
          v42 = v19;
          objc_msgSend(v18, "location");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke_115;
          v31[3] = &unk_1E2758C30;
          v21 = v15;
          v35 = v12;
          v36 = v14;
          v32 = v21;
          v33 = &v43;
          v34 = &v37;
          objc_msgSend(v21, "enumerateSubstringsFromLocation:options:usingBlock:", v20, 2, v31);

          if (v44[5])
          {
            objc_msgSend(v16, "location");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v44[5], "location");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v21, "offsetFromLocation:toLocation:", v22, v23);

            -[CKMessageEntryTextView attributedText](self, "attributedText");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "attribute:atIndex:effectiveRange:", CFSTR("CKFileTransferGUIDAttributeName"), v24, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (-[CKMessageEntryTextView handleTapOrLongPressOnMediaObjectForTransferGUID:characterIndex:location:touchedCharacterFrame:](self, "handleTapOrLongPressOnMediaObjectForTransferGUID:characterIndex:location:touchedCharacterFrame:", v26, v24, v12, v14, v38[4], v38[5], v38[6], v38[7]))
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)v30 = 0;
                  _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "handleTapOrLongPress didProcessMediaObject", v30, 2u);
                }

              }
            }
            else
            {
              -[CKMessageEntryTextView attributedText](self, "attributedText");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D381C0], v24, 0);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
                -[CKMessageEntryTextView didTapMentionForTextView:atCharacterIndex:](self, "didTapMentionForTextView:atCharacterIndex:", self, (double)v24);
            }
            if (+[CKMentionsUtilities supportsSupplementalLexiconMentions](CKMentionsUtilities, "supportsSupplementalLexiconMentions"))
            {
              -[CKMessageEntryTextView didLongPressMentionForTextView:characterIndex:isLongPress:](self, "didLongPressMentionForTextView:characterIndex:isLongPress:", self, v24, isKindOfClass & 1);
            }

          }
          _Block_object_dispose(&v37, 8);
          _Block_object_dispose(&v43, 8);

        }
      }
    }
  }

}

uint64_t __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAllowCalloutActions:", 1);
}

uint64_t __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke_115(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  void *v7;
  __int128 v8;
  uint64_t result;
  _QWORD v10[4];
  __int128 v11;
  __int128 v12;

  v7 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke_2;
  v10[3] = &unk_1E2758C08;
  v8 = *(_OWORD *)(a1 + 56);
  v11 = *(_OWORD *)(a1 + 40);
  v12 = v8;
  result = objc_msgSend(v7, "enumerateTextSegmentsInRange:type:options:usingBlock:", a3, 0, 0, v10);
  *a5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
  return result;
}

BOOL __47__CKMessageEntryTextView_handleTapOrLongPress___block_invoke_2(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v12;
  _BOOL4 v13;
  double *v14;
  CGRect v16;

  v12 = a2;
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  v13 = CGRectContainsPoint(v16, *(CGPoint *)(a1 + 48));
  if (v13)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v14 = *(double **)(*(_QWORD *)(a1 + 40) + 8);
    v14[4] = a3;
    v14[5] = a4;
    v14[6] = a5;
    v14[7] = a6;
  }

  return !v13;
}

- (BOOL)handleTapOrLongPressOnMediaObjectForTransferGUID:(id)a3 characterIndex:(int64_t)a4 location:(CGPoint)a5 touchedCharacterFrame:(CGRect)a6
{
  return 0;
}

- (id)insertDictationResultPlaceholder
{
  objc_super v4;

  -[CKMessageEntryTextView setShowingDictationPlaceholder:](self, "setShowingDictationPlaceholder:", 1);
  -[CKMessageEntryTextView updateTextView](self, "updateTextView");
  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryTextView;
  -[CKMessageEntryTextView insertDictationResultPlaceholder](&v4, sel_insertDictationResultPlaceholder);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a4;
  v6 = a3;
  -[CKMessageEntryTextView setShowingDictationPlaceholder:](self, "setShowingDictationPlaceholder:", 0);
  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryTextView;
  -[CKMessageEntryTextView removeDictationResultPlaceholder:willInsertResult:](&v7, sel_removeDictationResultPlaceholder_willInsertResult_, v6, v4);

  -[CKMessageEntryTextView updateTextView](self, "updateTextView");
}

- (SEL)_sendCurrentLocationAction
{
  if (self->_sendCurrentLocationFromKeyboardEnabled)
    return sel_sendCurrentLocationMessage;
  else
    return 0;
}

- (void)setCompositionText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CKMessageEntryTextView undoManager](self, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllActions");

  v8 = (id)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "isExpressiveTextEnabled");

  if (!(_DWORD)v5 || !-[CKMessageEntryTextView isExpressiveTextEnabled](self, "isExpressiveTextEnabled"))
  {
    -[CKMessageEntryTextView typingAttributes](self, "typingAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttributes:range:", v7, 0, objc_msgSend(v8, "length"));

  }
  -[CKMessageEntryTextView setAttributedText:](self, "setAttributedText:", v8);

}

- (NSAttributedString)compositionText
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;
  _QWORD v17[4];
  id v18;

  -[CKMessageEntryTextView attributedText](self, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_msgSend(v4, "length");
  objc_msgSend(v4, "setAttributes:range:", 0, 0, v5);
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__CKMessageEntryTextView_compositionText__block_invoke;
  v17[3] = &unk_1E2750D68;
  v7 = v4;
  v18 = v7;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v17);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isExpressiveTextEnabled");

  if (v9)
  {
    objc_msgSend(v7, "ck_addAttribute:from:range:", *MEMORY[0x1E0D393F0], v3, 0, v5);
    objc_msgSend(v7, "ck_addAttribute:from:range:", *MEMORY[0x1E0D393E8], v3, 0, v5);
    objc_msgSend(v7, "ck_addAttribute:from:range:", *MEMORY[0x1E0D39420], v3, 0, v5);
    objc_msgSend(v7, "ck_addAttribute:from:range:", *MEMORY[0x1E0D39440], v3, 0, v5);
    objc_msgSend(v7, "ck_addAttribute:from:range:", *MEMORY[0x1E0D39428], v3, 0, v5);
  }
  if (-[CKMessageEntryTextView shouldPreserveAdaptiveImageGlyphsInCompositionText](self, "shouldPreserveAdaptiveImageGlyphsInCompositionText"))
  {
    objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
    aBlock[0] = v6;
    aBlock[1] = 3221225472;
    aBlock[2] = __41__CKMessageEntryTextView_compositionText__block_invoke_2;
    aBlock[3] = &unk_1E2750760;
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    v11 = _Block_copy(aBlock);
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __41__CKMessageEntryTextView_compositionText__block_invoke_3;
    v13[3] = &unk_1E2758C58;
    v14 = v7;
    objc_msgSend(v3, "__im_enumerateAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:block:", v11, v13);

  }
  return (NSAttributedString *)v7;
}

void __41__CKMessageEntryTextView_compositionText__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0D381F0];
  objc_msgSend(a2, "objectForKey:", *MEMORY[0x1E0D381F0]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    v10 = *(void **)(a1 + 32);
    v12 = v7;
    v13[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttributes:range:", v11, a3, a4);

  }
}

uint64_t __41__CKMessageEntryTextView_compositionText__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transferForGUID:", a2);
}

void __41__CKMessageEntryTextView_compositionText__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0D36430], v7, a3, a4);
    v7 = v8;
  }

}

- (BOOL)shouldPreserveAdaptiveImageGlyphsInCompositionText
{
  return 0;
}

- (NSString)placeholderText
{
  return (NSString *)(id)-[NSString copy](self->_placeholderText, "copy");
}

- (void)_layoutPlaceholder
{
  double v3;
  double v4;
  void *v5;
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
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKMessageEntryTextView;
  -[CKMessageEntryTextView _layoutPlaceholder](&v17, sel__layoutPlaceholder);
  -[CKMessageEntryTextView bounds](self, "bounds");
  -[CKMessageEntryTextView placeHolderWidth](self, "placeHolderWidth");
  v4 = v3;
  -[CKMessageEntryTextView _placeholderLabel](self, "_placeholderLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView bounds](self, "bounds");
  objc_msgSend(v5, "sizeThatFits:", v6, v7);
  v9 = v8;

  -[CKMessageEntryTextView textContainer](self, "textContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lineFragmentPadding");
  v12 = v11;

  if (-[CKMessageEntryTextView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
    v13 = -v12;
  else
    v13 = v12;
  -[CKMessageEntryTextView textContainerInset](self, "textContainerInset");
  v15 = v14;
  if (CKIsRunningInMacCatalyst())
    v13 = v13 + 2.0;
  -[CKMessageEntryTextView _placeholderLabel](self, "_placeholderLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v13, v15, v4, v9);

}

- (void)setPlaceHolderWidth:(double)a3
{
  if (!CKFloatApproximatelyEqualToFloatWithTolerance(self->_placeHolderWidth, a3, 0.00000999999975))
  {
    self->_placeHolderWidth = a3;
    -[CKMessageEntryTextView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)isSingleLine
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTextKit2Enabled");

  if (v4)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    -[CKMessageEntryTextView textLayoutManager](self, "textLayoutManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryTextView textLayoutManager](self, "textLayoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "documentRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __38__CKMessageEntryTextView_isSingleLine__block_invoke;
    v15[3] = &unk_1E274BA18;
    v15[4] = &v16;
    v9 = (id)objc_msgSend(v5, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v8, 4, v15);

    v10 = v17[3] == 1;
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    -[CKMessageEntryTextView layoutManager](self, "layoutManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "numberOfGlyphs");
    if (v12)
    {
      v13 = (uint64_t *)v12;
      v16 = 0;
      v17 = 0;
      objc_msgSend(v11, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", v12 - 1, &v16);
      v10 = v17 == v13;
    }
    else
    {
      v10 = 1;
    }

  }
  return v10;
}

BOOL __38__CKMessageEntryTextView_isSingleLine__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "textLineFragments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "count");

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) < 2uLL;
}

- (BOOL)shouldIncludeDictationPadding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[CKMessageEntryTextView textLayoutManager](self, "textLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView textLayoutManager](self, "textLayoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__CKMessageEntryTextView_shouldIncludeDictationPadding__block_invoke;
  v9[3] = &unk_1E274BA18;
  v9[4] = &v10;
  v7 = (id)objc_msgSend(v3, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v6, 12, v9);

  LOBYTE(v3) = (unint64_t)v11[3] > 1;
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

BOOL __55__CKMessageEntryTextView_shouldIncludeDictationPadding__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "textLineFragments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "count");

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) < 3uLL;
}

- (void)updateFontIfNeededAndGetWasUsingBigEmojiStyle:(int64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  int64_t v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  int64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "singleBigEmojiFont");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "singleBigAssetFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "multipleBigEmojiFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonTextFont");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_supportsBigEmojiTextStyles)
  {
    v8 = objc_msgSend(v5, "entryViewSupportsSingleBigEmojiFont");
    -[CKMessageEntryTextView attributedText](self, "attributedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryTextView mediaObjects](self, "mediaObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allValues");
    v11 = a3;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "__ck_bigEmojiStyleWithSingleBigEmojiSupported:mediaObjects:", v8, v12);

    a3 = v11;
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isExpressiveTextEnabled");

  if (v15)
  {
    v16 = -[CKMessageEntryTextView fontType](self, "fontType");
    if ((unint64_t)(v13 - 1) >= 3)
      v13 = 0;
    -[CKMessageEntryTextView setFontType:](self, "setFontType:", v13);
    -[CKMessageEntryTextView attributedText](self, "attributedText");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");

    if (!v18)
    {
      objc_msgSend(MEMORY[0x1E0DC1350], "ck_fontWithMessageEntryTextViewFontType:", -[CKMessageEntryTextView fontType](self, "fontType"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryTextView setFont:](self, "setFont:", v42);
      -[CKMessageEntryTextView effectsPickerAssistant](self, "effectsPickerAssistant");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeTypingAttributesAdjustments");

      -[CKMessageEntryTextView typingAttributes](self, "typingAttributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "mutableCopy");

      objc_msgSend(v21, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0DC1138]);
      objc_msgSend(v5, "theme");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "entryFieldTextColor");
      v23 = a3;
      v24 = v7;
      v25 = v16;
      v26 = v6;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0DC1140]);

      v6 = v26;
      v16 = v25;
      v7 = v24;
      a3 = v23;

      objc_msgSend(v21, "removeObjectForKey:", *MEMORY[0x1E0D393F0]);
      -[CKMessageEntryTextView setTypingAttributes:](self, "setTypingAttributes:", v21);

    }
    if (a3 && v16 != v13)
    {
      switch(v16)
      {
        case 0uLL:
          *a3 = 0;
          break;
        case 1uLL:
          v40 = 1;
          goto LABEL_37;
        case 2uLL:
          v40 = 2;
          goto LABEL_37;
        case 3uLL:
          v40 = 3;
LABEL_37:
          *a3 = v40;
          break;
        default:
          break;
      }
    }
  }
  else
  {
    -[CKMessageEntryTextView font](self, "font");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v29 = v45;
    switch(v13)
    {
      case 0:
        v29 = v44;
        goto LABEL_19;
      case 1:
        goto LABEL_19;
      case 2:
        v29 = v7;
        goto LABEL_19;
      case 3:
        v29 = v6;
LABEL_19:
        v30 = v29;
        if (a3)
          goto LABEL_20;
        goto LABEL_28;
      default:
        v30 = 0;
        if (!a3)
          goto LABEL_28;
LABEL_20:
        if (v28 != v30)
        {
          if ((objc_msgSend(v28, "isEqual:", v45) & 1) != 0)
          {
            v31 = 1;
          }
          else if ((objc_msgSend(v28, "isEqual:", v6) & 1) != 0)
          {
            v31 = 3;
          }
          else
          {
            v32 = objc_msgSend(v28, "isEqual:", v7);
            v31 = 2;
            if (!v32)
              v31 = 0;
          }
          *a3 = v31;
        }
LABEL_28:
        v43 = v6;
        -[CKMessageEntryTextView attributedText](self, "attributedText");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "length");

        if (v34)
        {
          v41 = v7;
          v52 = 0;
          v53 = &v52;
          v54 = 0x2020000000;
          v55 = 0;
          -[CKMessageEntryTextView attributedText](self, "attributedText");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKMessageEntryTextView attributedText](self, "attributedText");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "length");
          v38 = *MEMORY[0x1E0DC1138];
          v46[0] = MEMORY[0x1E0C809B0];
          v46[1] = 3221225472;
          v46[2] = __72__CKMessageEntryTextView_updateFontIfNeededAndGetWasUsingBigEmojiStyle___block_invoke;
          v46[3] = &unk_1E2758C80;
          v47 = v45;
          v48 = v41;
          v49 = v44;
          v51 = &v52;
          v39 = v30;
          v50 = v39;
          objc_msgSend(v35, "enumerateAttribute:inRange:options:usingBlock:", v38, 0, v37, 0, v46);

          if (*((_BYTE *)v53 + 24))
            -[CKMessageEntryTextView setFont:](self, "setFont:", v39);

          _Block_object_dispose(&v52, 8);
          v7 = v41;
        }
        else
        {
          -[CKMessageEntryTextView setFont:](self, "setFont:", v30);
        }

        v6 = v43;
        break;
    }
  }

}

void __72__CKMessageEntryTextView_updateFontIfNeededAndGetWasUsingBigEmojiStyle___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  char isKindOfClass;
  id v9;
  void *v10;

  v7 = a2;
  if (v7)
  {
    v10 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v10;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = v10;
      if ((objc_msgSend(v9, "isEqual:", a1[4]) & 1) != 0
        || (objc_msgSend(v9, "isEqual:", a1[5]) & 1) != 0
        || objc_msgSend(v9, "isEqual:", a1[6]))
      {
        *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v9, "isEqual:", a1[7]) ^ 1;
        *a5 = *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24);
      }

      v7 = v10;
    }
  }

}

- (id)mediaObjects
{
  return 0;
}

- (void)saveKeyboardInputMode
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView setSavedKeyboardInputMode:](self, "setSavedKeyboardInputMode:", v3);

}

- (void)restoreKeyboardInputMode
{
  void *v3;
  id v4;

  -[CKMessageEntryTextView savedKeyboardInputMode](self, "savedKeyboardInputMode");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCurrentInputMode:", v4);

    -[CKMessageEntryTextView setSavedKeyboardInputMode:](self, "setSavedKeyboardInputMode:", 0);
  }

}

- (void)setShouldStripEmojis:(BOOL)a3
{
  if (self->_shouldStripEmojis != a3)
    self->_shouldStripEmojis = a3;
}

- (void)setExpressiveTextEnabled:(BOOL)a3
{
  void *v5;
  char v6;

  if (self->_expressiveTextEnabled != a3)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isExpressiveTextEnabled");

    if ((v6 & 1) != 0)
    {
      self->_expressiveTextEnabled = a3;
      -[CKMessageEntryTextView _updateTextEffectsPickerEditMenuAction](self, "_updateTextEffectsPickerEditMenuAction");
    }
    else
    {
      self->_expressiveTextEnabled = 0;
    }
  }
}

- (void)_updateTextEffectsPickerEditMenuAction
{
  _BOOL4 expressiveTextEnabled;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  _BOOL8 v14;
  _QWORD v15[5];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  expressiveTextEnabled = self->_expressiveTextEnabled;
  if (self->_expressiveTextEnabled
    && (objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isSendingExpressiveTextEnabled"),
        v4,
        v5))
  {
    v6 = *MEMORY[0x1E0D393F0];
    v16[0] = *MEMORY[0x1E0DC11D0];
    v16[1] = v6;
    v7 = *MEMORY[0x1E0D39420];
    v16[2] = *MEMORY[0x1E0D393E8];
    v16[3] = v7;
    v8 = *MEMORY[0x1E0D39428];
    v16[4] = *MEMORY[0x1E0D39440];
    v16[5] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryTextView _updatedAllowedTypingAttributesWithKeys:](self, "_updatedAllowedTypingAttributesWithKeys:", v9);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", CFSTR("character.motion"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode"))
      {
        CKFrameworkBundle();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TEXT_EFFECTS"), &stru_1E276D870, CFSTR("ChatKit"));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = &stru_1E276D870;
      }
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __64__CKMessageEntryTextView__updateTextEffectsPickerEditMenuAction__block_invoke;
      v15[3] = &unk_1E274B178;
      v15[4] = self;
      objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithTitle:image:identifier:handler:", v12, v10, 0, v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    v14 = 1;
  }
  else
  {
    -[CKMessageEntryTextView _updatedAllowedTypingAttributesWithKeys:](self, "_updatedAllowedTypingAttributesWithKeys:", MEMORY[0x1E0C9AA60]);
    v13 = 0;
    v14 = expressiveTextEnabled;
  }
  -[CKMessageEntryTextView setAllowsTextAnimations:](self, "setAllowsTextAnimations:", v14);
  -[CKMessageEntryTextView setShowTextEffectsPickerEditMenuAction:](self, "setShowTextEffectsPickerEditMenuAction:", v13);

}

uint64_t __64__CKMessageEntryTextView__updateTextEffectsPickerEditMenuAction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showTextFormattingAnimationOptions:", 0);
}

- (void)scribbleInteractionWillBeginWriting:(id)a3
{
  -[CKMessageEntryTextView setPencilWriting:](self, "setPencilWriting:", 1);
  -[CKMessageEntryTextView setInPencilMode:](self, "setInPencilMode:", 1);
  -[CKMessageEntryTextView updateTextView](self, "updateTextView");
}

- (void)scribbleInteractionDidFinishWriting:(id)a3
{
  -[CKMessageEntryTextView setPencilWriting:](self, "setPencilWriting:", 0);
  -[CKMessageEntryTextView setInPencilMode:](self, "setInPencilMode:", 1);
  -[CKMessageEntryTextView updateTextView](self, "updateTextView");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  objc_super v17;
  CGSize result;

  v17.receiver = self;
  v17.super_class = (Class)CKMessageEntryTextView;
  -[CKMessageEntryTextView sizeThatFits:](&v17, sel_sizeThatFits_, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  if (-[CKMessageEntryTextView isInPencilMode](self, "isInPencilMode"))
  {
    objc_msgSend(MEMORY[0x1E0CEA960], "_recommendedBlankSpaceHeight");
    v7 = v7 + v8;
  }
  else if (objc_msgSend(MEMORY[0x1E0CEA510], "isRunning")
         && -[CKMessageEntryTextView shouldIncludeDictationPadding](self, "shouldIncludeDictationPadding"))
  {
    -[CKMessageEntryTextView font](self, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pointSize");
    v7 = v7 + v10 * 0.65;

  }
  -[CKMessageEntryTextView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  if (v13 == 0.0)
  {
    if (CKMainScreenScale_once_89 != -1)
      dispatch_once(&CKMainScreenScale_once_89, &__block_literal_global_214);
    v14 = *(double *)&CKMainScreenScale_sMainScreenScale_89;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_89 == 0.0)
      v14 = 1.0;
    v15 = ceil(v5 * v14) / v14;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_89 == 0.0)
      v13 = 1.0;
    else
      v13 = *(double *)&CKMainScreenScale_sMainScreenScale_89;
  }
  else
  {
    v15 = ceil(v5 * v13) / v13;
  }
  v16 = ceil(v7 * v13) / v13;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)handleHoverGesture:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[CKMessageEntryTextView setInPencilMode:](self, "setInPencilMode:", 1);
    -[CKMessageEntryTextView updateTextView](self, "updateTextView");
    -[CKMessageEntryTextView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textViewDidChange:", self);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)_stripEmojisIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  uint64_t (*v6)(uint64_t);
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "stewieEnabled");

  if (v4 && -[CKMessageEntryTextView shouldStripEmojis](self, "shouldStripEmojis"))
  {
    -[CKMessageEntryTextView attributedText](self, "attributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v5, "mutableCopy");

    v6 = (uint64_t (*)(uint64_t))MEMORY[0x193FF3C24]("CEMCreateStringByStrippingEmojiCharacters", CFSTR("CoreEmoji"));
    v7 = (id)v6(objc_msgSend(v12, "string"));
    objc_msgSend(v12, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v12, "mutableString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setString:", v7);

      -[CKMessageEntryTextView textStorage](self, "textStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAttributedString:", v12);

    }
  }
}

- (void)updateTextView
{
  -[CKMessageEntryTextView updateTextViewAndCheckForMentions:](self, "updateTextViewAndCheckForMentions:", 1);
}

- (void)updateTextViewAndCheckForMentions:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  -[CKMessageEntryTextView textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length")
    || -[CKMessageEntryTextView isShowingDictationPlaceholder](self, "isShowingDictationPlaceholder")
    || -[CKMessageEntryTextView isPencilWriting](self, "isPencilWriting");

  -[CKMessageEntryTextView _placeholderLabel](self, "_placeholderLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  -[CKMessageEntryTextView _stripEmojisIfNecessary](self, "_stripEmojisIfNecessary");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isExpressiveTextEnabled");

  if (v9 && self->_supportsBigEmojiTextStyles)
  {
    -[CKMessageEntryTextView textStorage](self, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginEditing");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "entryViewSupportsSingleBigEmojiFont");
    -[CKMessageEntryTextView textStorage](self, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryTextView mediaObjects](self, "mediaObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ck_adjustFontsForBigEmojisIfNeededWithSingleBigEmojiSupported:mediaObjects:", v12, v15);

    -[CKMessageEntryTextView textStorage](self, "textStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endEditing");

  }
  if (v3)
    -[CKMessageEntryTextView checkForMentions](self, "checkForMentions");
}

- (void)textViewDidChange:(id)a3
{
  -[CKMessageEntryTextView updateTextView](self, "updateTextView", a3);
  -[CKMessageEntryTextView setHideCaretUntilUserTypes:](self, "setHideCaretUntilUserTypes:", 0);
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKMessageEntryTextView showTextEffectsPickerEditMenuAction](self, "showTextEffectsPickerEditMenuAction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E0CEA6C8], "isInHardwareKeyboardMode"))
    {
      CKFrameworkBundle();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TEXT_EFFECTS"), &stru_1E276D870, CFSTR("ChatKit"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryTextView showTextEffectsPickerEditMenuAction](self, "showTextEffectsPickerEditMenuAction");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitle:", v5);

    }
    else
    {
      -[CKMessageEntryTextView showTextEffectsPickerEditMenuAction](self, "showTextEffectsPickerEditMenuAction");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:", &stru_1E276D870);
    }

  }
  else
  {
    -[CKMessageEntryTextView _updateTextEffectsPickerEditMenuAction](self, "_updateTextEffectsPickerEditMenuAction");
  }
}

- (void)layoutManagerDidFinishAnimatingMentionWithAnimationIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMessageEntryTextView mentionsDelegate](self, "mentionsDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didFinishAnimatingMentionWithAnimationIdentifier:", v4);

}

- (void)hideTextEffectsPickerIfNeeded
{
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExpressiveTextEnabled");

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKMessageEntryTextView performSelector:withObject:](self, "performSelector:withObject:", sel__hideTextFormattingOptions_, self);
    if (-[CKMessageEntryTextView applyDefaultTypingAttributesOnTextEffectPickerDismissal](self, "applyDefaultTypingAttributesOnTextEffectPickerDismissal"))
    {
      -[CKMessageEntryTextView effectsPickerAssistant](self, "effectsPickerAssistant");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeTypingAttributesAdjustments");

      -[CKMessageEntryTextView setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:](self, "setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:", 0);
    }
  }
}

- (void)hideTextEffectsPickerIfNeededAndResetTypingAttributes
{
  id v3;

  -[CKMessageEntryTextView hideTextEffectsPickerIfNeeded](self, "hideTextEffectsPickerIfNeeded");
  -[CKMessageEntryTextView effectsPickerAssistant](self, "effectsPickerAssistant");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTypingAttributesAdjustments");

}

- (void)_showTextFormattingAnimationOptions:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[CKMessageEntryTextView effectsPickerAssistant](self, "effectsPickerAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectSentenceAtCaretIfPossible");

  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntryTextView;
  -[CKMessageEntryTextView _showTextFormattingAnimationOptions:](&v6, sel__showTextFormattingAnimationOptions_, v4);

}

- (BOOL)_shouldHandleTextFormattingChangeValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _BOOL8 v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  CKMessageEntryTextView *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;

  v4 = a3;
  objc_msgSend(v4, "changeType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:](self, "setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:", 0);
  -[CKMessageEntryTextView typingAttributes](self, "typingAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[CKMessageEntryTextView selectedRange](self, "selectedRange");
  v9 = v8;
  -[CKMessageEntryTextView selectedRange](self, "selectedRange");
  v11 = v10;
  v12 = objc_msgSend(v5, "isEqualToString:", CFSTR("UITextFormattingViewControllerRemoveUnderlineChange"));
  v13 = objc_msgSend(v5, "isEqualToString:", CFSTR("UITextFormattingViewControllerSetUnderlineChange"));
  v14 = v13;
  if ((v12 & 1) != 0 || (_DWORD)v13)
  {
    if (v12)
    {
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0DC1248]);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D39440]);
    }
    if ((_DWORD)v14)
    {
      objc_msgSend(v7, "setObject:forKey:", &unk_1E2870D68, *MEMORY[0x1E0DC1248]);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E2870D80, *MEMORY[0x1E0D39440]);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0DC11D0]);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D393F0]);
    }
    v24 = v11 != 0;
    -[CKMessageEntryTextView effectsPickerAssistant](self, "effectsPickerAssistant");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setShouldSkipNextAdjustingOfTypingAttributes:", v9 == 0);

    -[CKMessageEntryTextView setTypingAttributes:](self, "setTypingAttributes:", v7);
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryTextView selectedRange](self, "selectedRange");
    objc_msgSend(v26, "trackDidSelectTextStyle:styleLength:", 4, v27);

    -[CKMessageEntryTextView textFormattingDelegate](self, "textFormattingDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[CKMessageEntryTextView selectedRange](self, "selectedRange");
    v31 = v28;
    v32 = self;
    v33 = 4;
    goto LABEL_36;
  }
  v14 = objc_msgSend(v5, "isEqualToString:", CFSTR("UITextFormattingViewControllerSetStrikethroughChange"));
  v15 = objc_msgSend(v5, "isEqualToString:", CFSTR("UITextFormattingViewControllerRemoveStrikethroughChange"));
  if ((v14 & 1) != 0 || v15)
  {
    if (v15)
    {
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0DC11A8]);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D39428]);
    }
    if ((_DWORD)v14)
    {
      objc_msgSend(v7, "setObject:forKey:", &unk_1E2870D68, *MEMORY[0x1E0DC11A8]);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E2870D80, *MEMORY[0x1E0D39428]);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0DC11D0]);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D393F0]);
    }
    v24 = v11 != 0;
    -[CKMessageEntryTextView effectsPickerAssistant](self, "effectsPickerAssistant");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setShouldSkipNextAdjustingOfTypingAttributes:", v9 == 0);

    -[CKMessageEntryTextView setTypingAttributes:](self, "setTypingAttributes:", v7);
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryTextView selectedRange](self, "selectedRange");
    objc_msgSend(v35, "trackDidSelectTextStyle:styleLength:", 8, v36);

    -[CKMessageEntryTextView textFormattingDelegate](self, "textFormattingDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[CKMessageEntryTextView selectedRange](self, "selectedRange");
    v31 = v28;
    v32 = self;
    v33 = 8;
    goto LABEL_36;
  }
  v14 = objc_msgSend(v5, "isEqualToString:", CFSTR("UITextFormattingViewControllerSetBoldChange"));
  v16 = objc_msgSend(v5, "isEqualToString:", CFSTR("UITextFormattingViewControllerRemoveBoldChange"));
  if ((v14 & 1) != 0 || v16)
  {
    if (v16)
    {
      objc_msgSend(v7, "ck_removeTypingAttributeFontTrait:", 2);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D393E8]);
    }
    if ((_DWORD)v14)
    {
      objc_msgSend(v7, "ck_addTypingAttributeFontTrait:", 2);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E2870D80, *MEMORY[0x1E0D393E8]);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0DC11D0]);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D393F0]);
    }
    v24 = v11 != 0;
    -[CKMessageEntryTextView effectsPickerAssistant](self, "effectsPickerAssistant");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setShouldSkipNextAdjustingOfTypingAttributes:", v9 == 0);

    -[CKMessageEntryTextView setTypingAttributes:](self, "setTypingAttributes:", v7);
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryTextView selectedRange](self, "selectedRange");
    objc_msgSend(v38, "trackDidSelectTextStyle:styleLength:", 1, v39);

    -[CKMessageEntryTextView textFormattingDelegate](self, "textFormattingDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[CKMessageEntryTextView selectedRange](self, "selectedRange");
    v31 = v28;
    v32 = self;
    v33 = 1;
    goto LABEL_36;
  }
  v14 = objc_msgSend(v5, "isEqualToString:", CFSTR("UITextFormattingViewControllerSetItalicChange"));
  v17 = objc_msgSend(v5, "isEqualToString:", CFSTR("UITextFormattingViewControllerRemoveItalicChange"));
  if ((v14 & 1) != 0 || v17)
  {
    if (v17)
    {
      objc_msgSend(v7, "ck_removeTypingAttributeFontTrait:", 1);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D39420]);
    }
    if ((_DWORD)v14)
    {
      objc_msgSend(v7, "ck_addTypingAttributeFontTrait:", 1);
      objc_msgSend(v7, "setObject:forKey:", &unk_1E2870D80, *MEMORY[0x1E0D39420]);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0DC11D0]);
      objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D393F0]);
    }
    v24 = v11 != 0;
    -[CKMessageEntryTextView effectsPickerAssistant](self, "effectsPickerAssistant");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setShouldSkipNextAdjustingOfTypingAttributes:", v9 == 0);

    -[CKMessageEntryTextView setTypingAttributes:](self, "setTypingAttributes:", v7);
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryTextView selectedRange](self, "selectedRange");
    objc_msgSend(v41, "trackDidSelectTextStyle:styleLength:", 2, v42);

    -[CKMessageEntryTextView textFormattingDelegate](self, "textFormattingDelegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[CKMessageEntryTextView selectedRange](self, "selectedRange");
    v31 = v28;
    v32 = self;
    v33 = 2;
LABEL_36:
    objc_msgSend(v31, "messageEntryTextView:applyStyleChangeOfType:add:forRange:", v32, v33, v14, v30, v29);

    -[CKMessageEntryTextView setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:](self, "setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:", v24);
    v19 = 0;
    goto LABEL_37;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("UITextFormattingViewControllerCustomComponentSelectedChange"))&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "performSelector:", sel__textAnimationName);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18 == 0;
    if (v18)
    {
      v20 = *MEMORY[0x1E0D393F0];
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D393F0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v52 = v20;
      if (v21)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v22, "unsignedIntegerValue");

      }
      v23 = IMTextEffectTypeFromName();
      if (v21 == (void *)v23)
      {
        objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0DC11D0]);
        objc_msgSend(v7, "removeObjectForKey:", v52);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEAF28], "animationWithName:", v18);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v51, *MEMORY[0x1E0DC11D0]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v44, v52);

        objc_msgSend(v7, "ck_removeTypingAttributeFontTrait:", 2);
        objc_msgSend(v7, "ck_removeTypingAttributeFontTrait:", 1);
        objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0DC1248]);
        objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0DC11A8]);
        objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D393E8]);
        objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D39420]);
        objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D39440]);
        objc_msgSend(v7, "removeObjectForKey:", *MEMORY[0x1E0D39428]);

      }
      -[CKMessageEntryTextView effectsPickerAssistant](self, "effectsPickerAssistant");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setShouldSkipNextAdjustingOfTypingAttributes:", v9 == 0);

      -[CKMessageEntryTextView setTypingAttributes:](self, "setTypingAttributes:", v7);
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryTextView selectedRange](self, "selectedRange");
      objc_msgSend(v46, "trackDidSelectTextEffect:effectLength:", v23, v47);

      -[CKMessageEntryTextView textFormattingDelegate](self, "textFormattingDelegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[CKMessageEntryTextView selectedRange](self, "selectedRange");
      objc_msgSend(v48, "messageEntryTextView:didSetAnimationName:forRange:", self, v18, v49, v50);

      -[CKMessageEntryTextView setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:](self, "setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:", v11 != 0);
    }

  }
  else
  {
    v19 = 1;
  }
LABEL_37:

  return v19;
}

- (id)_supportedAnimationNamesForTextFormatting
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  IMTextEffectOrderedSupportedNames();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3 >= 8)
    v4 = 8;
  else
    v4 = v3;
  objc_msgSend(v2, "subarrayWithRange:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_supportedAnimationTitlesForTextFormatting
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[CKMessageEntryTextView _supportedAnimationNamesForTextFormatting](self, "_supportedAnimationNamesForTextFormatting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__CKMessageEntryTextView__supportedAnimationTitlesForTextFormatting__block_invoke;
    v6[3] = &unk_1E27501B0;
    v4 = v3;
    v7 = v4;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __68__CKMessageEntryTextView__supportedAnimationTitlesForTextFormatting__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  IMTextEffectTypeFromName();
  IMTextEffectLocalizationKeyFromType();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__ck_localizedString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v5, v3);
}

- (id)_supportedAnimationAccessibilityHintsForTextFormatting
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  -[CKMessageEntryTextView _supportedAnimationNamesForTextFormatting](self, "_supportedAnimationNamesForTextFormatting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__CKMessageEntryTextView__supportedAnimationAccessibilityHintsForTextFormatting__block_invoke;
    v6[3] = &unk_1E27501B0;
    v4 = v3;
    v7 = v4;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __80__CKMessageEntryTextView__supportedAnimationAccessibilityHintsForTextFormatting__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  IMTextEffectTypeFromName();
  IMTextEffectDiscoverabilityTitleLocalizationKeyFromType();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__ck_localizedString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v5, v3);
}

- (BOOL)_shouldReplaceKeyboardForTextFormattingKeyboardSessionIfApplicable
{
  return IMIsRunningInMessagesExtension() ^ 1;
}

- (void)updateTextAttributesWithConversionHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKMessageEntryTextView;
  v4 = a3;
  -[CKMessageEntryTextView updateTextAttributesWithConversionHandler:](&v8, sel_updateTextAttributesWithConversionHandler_, v4);
  -[CKMessageEntryTextView textFormattingDelegate](self, "textFormattingDelegate", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKMessageEntryTextView selectedRange](self, "selectedRange");
  objc_msgSend(v5, "messageEntryTextView:didUpdateForRange:conversionHandler:", self, v6, v7, v4);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CKMessageEntryTextView performSelector:withObject:](self, "performSelector:withObject:", sel__textFormattingOptionsNeedUpdate_, self);
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (unint64_t)fontType
{
  return self->_fontType;
}

- (CKMessageEntryTextViewMentionsDelegate)mentionsDelegate
{
  return (CKMessageEntryTextViewMentionsDelegate *)objc_loadWeakRetained((id *)&self->_mentionsDelegate);
}

- (double)placeHolderWidth
{
  return self->_placeHolderWidth;
}

- (BOOL)isShowingDictationPlaceholder
{
  return self->_showingDictationPlaceholder;
}

- (void)setShowingDictationPlaceholder:(BOOL)a3
{
  self->_showingDictationPlaceholder = a3;
}

- (BOOL)isInPencilMode
{
  return self->_inPencilMode;
}

- (BOOL)isPencilWriting
{
  return self->_pencilWriting;
}

- (void)setPencilWriting:(BOOL)a3
{
  self->_pencilWriting = a3;
}

- (BOOL)shouldStripEmojis
{
  return self->_shouldStripEmojis;
}

- (NSDictionary)proofreadingInfo
{
  return self->_proofreadingInfo;
}

- (void)setProofreadingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2944);
}

- (BOOL)sendCurrentLocationFromKeyboardEnabled
{
  return self->_sendCurrentLocationFromKeyboardEnabled;
}

- (void)setSendCurrentLocationFromKeyboardEnabled:(BOOL)a3
{
  self->_sendCurrentLocationFromKeyboardEnabled = a3;
}

- (BOOL)supportsBigEmojiTextStyles
{
  return self->_supportsBigEmojiTextStyles;
}

- (void)setSupportsBigEmojiTextStyles:(BOOL)a3
{
  self->_supportsBigEmojiTextStyles = a3;
}

- (BOOL)hideCaret
{
  return self->_hideCaret;
}

- (void)setHideCaret:(BOOL)a3
{
  self->_hideCaret = a3;
}

- (BOOL)hideCaretUntilUserTypes
{
  return self->_hideCaretUntilUserTypes;
}

- (void)setHideCaretUntilUserTypes:(BOOL)a3
{
  self->_hideCaretUntilUserTypes = a3;
}

- (BOOL)preventShowingCalloutMenu
{
  return self->_preventShowingCalloutMenu;
}

- (void)setPreventShowingCalloutMenu:(BOOL)a3
{
  self->_preventShowingCalloutMenu = a3;
}

- (double)adjustedLineFragmentPadding
{
  return self->_adjustedLineFragmentPadding;
}

- (void)setAdjustedLineFragmentPadding:(double)a3
{
  self->_adjustedLineFragmentPadding = a3;
}

- (CKEntryRichTextViewEffectsPickerAssistant)effectsPickerAssistant
{
  return self->_effectsPickerAssistant;
}

- (void)setEffectsPickerAssistant:(id)a3
{
  objc_storeStrong((id *)&self->_effectsPickerAssistant, a3);
}

- (UIAction)showTextEffectsPickerEditMenuAction
{
  return self->_showTextEffectsPickerEditMenuAction;
}

- (void)setShowTextEffectsPickerEditMenuAction:(id)a3
{
  objc_storeStrong((id *)&self->_showTextEffectsPickerEditMenuAction, a3);
}

- (CKMessageEntryTextViewTextFormattingDelegate)textFormattingDelegate
{
  return (CKMessageEntryTextViewTextFormattingDelegate *)objc_loadWeakRetained((id *)&self->_textFormattingDelegate);
}

- (void)setTextFormattingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textFormattingDelegate, a3);
}

- (BOOL)isExpressiveTextEnabled
{
  return self->_expressiveTextEnabled;
}

- (UIKeyboardInputMode)savedKeyboardInputMode
{
  return self->_savedKeyboardInputMode;
}

- (void)setSavedKeyboardInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_savedKeyboardInputMode, a3);
}

- (UIScribbleInteraction)scribbleInteraction
{
  return self->_scribbleInteraction;
}

- (UITapGestureRecognizer)immediateTapGestureRecognizer
{
  return self->_immediateTapGestureRecognizer;
}

- (void)setImmediateTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_immediateTapGestureRecognizer, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->_doubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapGestureRecognizer, a3);
}

- (BOOL)allowCalloutActions
{
  return self->_allowCalloutActions;
}

- (void)setAllowCalloutActions:(BOOL)a3
{
  self->_allowCalloutActions = a3;
}

- (BOOL)applyDefaultTypingAttributesOnTextEffectPickerDismissal
{
  return self->_applyDefaultTypingAttributesOnTextEffectPickerDismissal;
}

- (void)setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:(BOOL)a3
{
  self->_applyDefaultTypingAttributesOnTextEffectPickerDismissal = a3;
}

@end
