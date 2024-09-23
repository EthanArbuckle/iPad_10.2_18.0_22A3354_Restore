@implementation UnifiedField

- (UnifiedField)initWithFrame:(CGRect)a3
{
  UnifiedField *v3;
  UnifiedField *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  UITextCursorAssertionController *v9;
  UITextCursorAssertionController *textCursorAssertionController;
  UnifiedField *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UnifiedField;
  v3 = -[UnifiedField initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UnifiedField addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__endEditingWithCurrentText, 0x80000);
    -[UnifiedField addTarget:action:forControlEvents:](v4, "addTarget:action:forControlEvents:", v4, sel__textDidChangeFromTyping, 0x20000);
    -[UnifiedField setTextDragOptions:](v4, "setTextDragOptions:", 1);
    v5 = objc_msgSend(MEMORY[0x1E0DC3750], "isEnabledByDefault");
    -[UnifiedField textDragInteraction](v4, "textDragInteraction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", v5);

    -[UnifiedField setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[UnifiedField setEnablesReturnKeyAutomatically:](v4, "setEnablesReturnKeyAutomatically:", 0);
    -[UnifiedField setUseAutomaticEndpointing:](v4, "setUseAutomaticEndpointing:", 1);
    -[UnifiedField _clearButton](v4, "_clearButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("ClearTextButton"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v4, sel_dictationDidFinish_, *MEMORY[0x1E0DC4968], 0);

    v9 = (UITextCursorAssertionController *)objc_alloc_init(MEMORY[0x1E0DC3DA0]);
    textCursorAssertionController = v4->_textCursorAssertionController;
    v4->_textCursorAssertionController = v9;

    v11 = v4;
  }

  return v4;
}

- (void)paste:(id)a3
{
  objc_super v3;

  self->_pastingText = 1;
  v3.receiver = self;
  v3.super_class = (Class)UnifiedField;
  -[UnifiedField paste:](&v3, sel_paste_, a3);
}

- (BOOL)supportsImagePaste
{
  return 0;
}

- (void)buildMenuWithBuilder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UnifiedField;
  -[UnifiedField buildMenuWithBuilder:](&v12, sel_buildMenuWithBuilder_, v4);
  objc_msgSend(v4, "system");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39F0], "contextSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_pasteAndNavigateCommand");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *MEMORY[0x1E0DC5120];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __37__UnifiedField_buildMenuWithBuilder___block_invoke;
      v10[3] = &unk_1E9CF6588;
      v11 = v8;
      objc_msgSend(v4, "replaceChildrenOfMenuForIdentifier:fromChildrenBlock:", v9, v10);

    }
  }

}

id __37__UnifiedField_buildMenuWithBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_40);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v6, "insertObject:atIndex:", *(_QWORD *)(a1 + 32), v5 + 1);
  }
  else
  {
    objc_msgSend(v3, "arrayByAddingObject:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

BOOL __37__UnifiedField_buildMenuWithBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "action") == (_QWORD)sel_paste_;

  return v3;
}

- (void)pasteAndGo:(id)a3
{
  id v4;

  -[UnifiedField delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unifiedFieldShouldPasteAndNavigate:", self);

}

- (void)pasteAndSearch:(id)a3
{
  id v4;

  -[UnifiedField delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unifiedFieldShouldPasteAndNavigate:", self);

}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  v8.receiver = self;
  v8.super_class = (Class)UnifiedField;
  -[UnifiedField rightViewRectForBounds:](&v8, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6 + -2.5;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v7;
  return result;
}

- (BOOL)_hasContent
{
  objc_super v3;

  if (self->_topHitCompletionView)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)UnifiedField;
  return -[UnifiedField _hasContent](&v3, sel__hasContent);
}

- (void)setPlaceholderColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[UnifiedField placeholderColor](self, "placeholderColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v8)
  {
    -[UnifiedField _placeholderLabel](self, "_placeholderLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v8)
    {
      objc_msgSend(v5, "setTextColor:");
    }
    else
    {
      -[UnifiedField _placeholderColor](self, "_placeholderColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTextColor:", v7);

    }
  }

}

- (UIColor)placeholderColor
{
  void *v2;
  void *v3;

  -[UnifiedField _placeholderLabel](self, "_placeholderLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (id)_textWithoutWhitespace
{
  void *v2;
  void *v3;
  void *v4;

  -[UnifiedField text](self, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "safari_whitespaceAndNewlineCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_unifiedFieldInputType
{
  void *v3;
  unint64_t v4;

  if (self->_topHit)
  {
    objc_opt_class();
    return (objc_opt_isKindOfClass() & 1) == 0;
  }
  else
  {
    -[UnifiedField text](self, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = WBSUnifiedFieldInputTypeForString();

    return v4;
  }
}

- (void)_endEditingWithCurrentText
{
  void *v3;
  void *v4;
  id v5;

  -[UnifiedField delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "unifiedField:didEndEditingWithParsecTopHit:", self, self->_topHit);
LABEL_3:
    -[UnifiedField setVoiceSearchState:](self, "setVoiceSearchState:", 0);
  }
  else
  {
    switch(-[UnifiedField _unifiedFieldInputType](self, "_unifiedFieldInputType"))
    {
      case 0uLL:
      case 3uLL:
        if (self->_voiceSearchState == 2)
        {
          objc_msgSend(v5, "unifiedFieldVoiceSearchStateDidChange:", self);
        }
        else if (self->_performingExternalSearch)
        {
          objc_msgSend(v5, "unifiedFieldExternalSearchDidEnd:", self);
        }
        else
        {
          -[UnifiedField _textWithoutWhitespace](self, "_textWithoutWhitespace");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "unifiedField:didEndEditingWithSearch:", self, v3);
LABEL_10:

        }
        break;
      case 1uLL:
      case 2uLL:
        -[CompletionItem userVisibleURLString](self->_topHit, "userVisibleURLString");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (v3)
        {
          -[UnifiedField setText:](self, "setText:", v3);
          objc_storeStrong((id *)&self->_userTypedText, v3);
        }
        -[UnifiedField _textWithoutWhitespace](self, "_textWithoutWhitespace");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unifiedField:didEndEditingWithAddress:", self, v4);

        -[UnifiedField setVoiceSearchState:](self, "setVoiceSearchState:", 0);
        goto LABEL_10;
      case 4uLL:
        goto LABEL_3;
      default:
        break;
    }
  }

}

- (void)_updateReturnKey
{
  CompletionItem *reflectedItem;
  _BOOL8 v4;
  void *v5;
  id v6;

  if (!-[UnifiedField _waitingForTopHitForCurrentText](self, "_waitingForTopHitForCurrentText"))
  {
    reflectedItem = self->_reflectedItem;
    if (reflectedItem)
    {
      v4 = 1;
    }
    else
    {
      -[UnifiedField _textWithoutWhitespace](self, "_textWithoutWhitespace");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "length") != 0;
    }
    objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReturnKeyEnabled:", v4);

    if (!reflectedItem)
  }
}

- (void)_textDidChangeFromTyping
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  if (!self->_isResigningFirstResponder)
  {
    -[UnifiedField delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UnifiedField text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v3, "unifiedField:willUpdateUserTypedText:toText:", self, self->_userTypedText, v5);
    objc_storeStrong((id *)&self->_userTypedText, v5);
    -[UnifiedField _cancelPendingTopHitNavigation](self, "_cancelPendingTopHitNavigation");
    if (self->_reflectedItem == self->_topHit)
    {
      -[UnifiedField _topHitForCurrentText](self, "_topHitForCurrentText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UnifiedField _setTopHit:](self, "_setTopHit:", v6);

    }
    else
    {
      -[UnifiedField setReflectedItem:](self, "setReflectedItem:", 0);
    }
    -[UnifiedField _updateReturnKey](self, "_updateReturnKey");
    objc_msgSend(v3, "unifiedFieldDidUpdateUserTypedText:forQueryString:", self, self->_userTypedText);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__UnifiedField__textDidChangeFromTyping__block_invoke;
    block[3] = &unk_1E9CF1900;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __40__UnifiedField__textDidChangeFromTyping__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1128) = 0;
  return result;
}

- (BOOL)_waitingForTopHitForCurrentText
{
  void *v3;
  void *v4;
  char v5;

  if (self->_lastEditWasADeletion || !-[UnifiedField _allowsReflectedTopHit](self, "_allowsReflectedTopHit"))
    return 0;
  -[UnifiedField delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UnifiedField text](self, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "unifiedField:shouldWaitForTopHitForText:", self, v4);

  return v5;
}

- (id)_topHitForCurrentText
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_lastEditWasADeletion || !-[UnifiedField _allowsReflectedTopHit](self, "_allowsReflectedTopHit"))
  {
    v5 = 0;
  }
  else
  {
    -[UnifiedField delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UnifiedField text](self, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unifiedField:topHitForText:", self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_cancelPendingTopHitNavigation
{
  NSString *pendingTopHitNavigationText;

  pendingTopHitNavigationText = self->_pendingTopHitNavigationText;
  self->_pendingTopHitNavigationText = 0;

}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  NSString *v13;
  NSString *pendingTopHitNavigationText;
  BOOL v15;
  objc_super v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  self->_lastEditWasADeletion = 0;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("\n"))
    && -[UnifiedField _waitingForTopHitForCurrentText](self, "_waitingForTopHitForCurrentText"))
  {
    -[UnifiedField text](self, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", self->_pendingTopHitNavigationText);

    if ((v11 & 1) == 0)
    {
      -[UnifiedField sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
      -[UnifiedField text](self, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (NSString *)objc_msgSend(v12, "copy");
      pendingTopHitNavigationText = self->_pendingTopHitNavigationText;
      self->_pendingTopHitNavigationText = v13;

    }
    v15 = 0;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UnifiedField;
    v15 = -[UnifiedField keyboardInput:shouldInsertText:isMarkedText:](&v17, sel_keyboardInput_shouldInsertText_isMarkedText_, v8, v9, v5);
  }

  return v15;
}

- (BOOL)keyboardInputShouldDelete:(id)a3
{
  BOOL v4;
  TopHitCompletionView *topHitCompletionView;
  void *v6;
  NSString *v7;
  NSString *userTypedText;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)UnifiedField;
  if (!-[UnifiedField keyboardInputShouldDelete:](&v10, sel_keyboardInputShouldDelete_, a3))
    return 0;
  v4 = 1;
  if (!self->_lastEditWasADeletion)
  {
    self->_lastEditWasADeletion = 1;
    topHitCompletionView = self->_topHitCompletionView;
    v4 = topHitCompletionView == 0;
    -[UnifiedField _setTopHit:](self, "_setTopHit:", 0);
    if (topHitCompletionView)
    {
      -[UnifiedField text](self, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (NSString *)objc_msgSend(v6, "copy");
      userTypedText = self->_userTypedText;
      self->_userTypedText = v7;

      if (!-[NSString length](self->_userTypedText, "length"))
        -[UnifiedField sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
    }
    -[UnifiedField _updateReturnKey](self, "_updateReturnKey");
  }
  return v4;
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UnifiedField;
  -[UnifiedField setText:](&v4, sel_setText_, a3);
  -[UnifiedField _updateReturnKey](self, "_updateReturnKey");
}

- (void)setAttributedText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UnifiedField;
  -[UnifiedField setAttributedText:](&v4, sel_setAttributedText_, a3);
  -[UnifiedField _updateReturnKey](self, "_updateReturnKey");
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)UnifiedField;
  -[UnifiedField placeholderRectForBounds:](&v20, sel_placeholderRectForBounds_);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  v15 = CGRectGetMaxX(v21) + -8.0;
  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  v16 = v12 + v15 - CGRectGetMaxX(v22);
  v17 = v8;
  v18 = v10;
  v19 = v14;
  result.size.height = v19;
  result.size.width = v16;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)_textForPasteboard
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  -[UnifiedField selectedText](self, "selectedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[UnifiedField selectionRange](self, "selectionRange"))
    goto LABEL_4;
  v5 = v4;
  if (-[UnifiedField _unifiedFieldInputType](self, "_unifiedFieldInputType") != 2)
    goto LABEL_4;
  v6 = (void *)MEMORY[0x1E0C99E98];
  -[UnifiedField text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_4:
    v10 = v3;
  }
  else
  {
    -[UnifiedField text](self, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("http://"), "stringByAppendingString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "_web_rangeOfURLHost");
    if (v14 == 0x7FFFFFFFFFFFFFFFLL || v5 + 7 < (unint64_t)(v14 + v15))
    {
      v16 = v3;
    }
    else
    {
      objc_msgSend(CFSTR("http://"), "stringByAppendingString:", v3);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v16;

  }
  return v10;
}

- (void)copy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  -[UnifiedField delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "shouldPutMetadataOnPasteboardForUnifiedField:", self))
  {
    objc_msgSend(v5, "currentMetadataForUnifiedField:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v4, "safari_registerLinkMetadata:", v6);

  }
  -[UnifiedField _textForPasteboard](self, "_textForPasteboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObject:visibility:", v7, 0);

  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItemProviders:", v8);

}

- (void)cut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[UnifiedField _textForPasteboard](self, "_textForPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)UnifiedField;
  -[UnifiedField cut:](&v7, sel_cut_, v4);

  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setString:", v5);

}

- (void)_removeTopHitCompletionView
{
  TopHitCompletionView *topHitCompletionView;
  TopHitCompletionPromotionRecognizer *topHitCompletionPromotionRecognizer;
  void *v5;
  UITextCursorAssertion *textCursorHiddenAssertion;

  -[TopHitCompletionView removeFromSuperview](self->_topHitCompletionView, "removeFromSuperview");
  topHitCompletionView = self->_topHitCompletionView;
  self->_topHitCompletionView = 0;

  if (self->_topHitCompletionPromotionRecognizer)
  {
    -[UnifiedField removeGestureRecognizer:](self, "removeGestureRecognizer:");
    topHitCompletionPromotionRecognizer = self->_topHitCompletionPromotionRecognizer;
    self->_topHitCompletionPromotionRecognizer = 0;

  }
  -[UnifiedField _fieldEditor](self, "_fieldEditor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 0);

  -[UITextCursorAssertion invalidate](self->_textCursorHiddenAssertion, "invalidate");
  textCursorHiddenAssertion = self->_textCursorHiddenAssertion;
  self->_textCursorHiddenAssertion = 0;

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  char v4;
  void *v6;

  if (self->_topHitCompletionPromotionRecognizer == a3)
  {
    objc_msgSend(a4, "locationInView:", self);
    -[UnifiedField hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v4 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    v4 = 1;
  }
  return v4 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  char v4;
  id v5;
  char isKindOfClass;

  if (self->_topHitCompletionPromotionRecognizer == a3)
  {
    v5 = a4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v4 = isKindOfClass ^ 1;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (id)_reflectedItemCompletionString
{
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSString *v17;
  NSString *v18;

  -[CompletionItem reflectedStringForUserTypedString:](self->_reflectedItem, "reflectedStringForUserTypedString:", self->_userTypedText);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (self->_topHitInitiallySelected)
      v3 = self->_userTypedText;
    else
      v3 = 0;
  }
  v4 = -[NSString safari_caseAndDiacriticInsensitiveStandardRangeOfString:additionalOptions:](v3, "safari_caseAndDiacriticInsensitiveStandardRangeOfString:additionalOptions:", self->_userTypedText, 8);
  v6 = v5;
  if (!-[NSString length](self->_userTypedText, "length"))
  {
    v7 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[UnifiedField _reflectedItemCompletionString].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = -[NSString length](v3, "length");
  if (v15 < -[NSString length](self->_userTypedText, "length") || v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = v3;
  }
  else
  {
    -[NSString substringFromIndex:](v3, "substringFromIndex:", v6);
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  return v18;
}

- (void)_promoteCompletionToSelection
{
  -[UnifiedField _promoteCompletionToSelectionSelectingSuffix:andMoveForward:](self, "_promoteCompletionToSelectionSelectingSuffix:andMoveForward:", 1, 0);
}

- (void)_promoteCompletionToSelectionSelectingSuffix:(BOOL)a3 andMoveForward:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CompletionItem *v15;

  v4 = a4;
  v5 = a3;
  v15 = self->_reflectedItem;
  -[UnifiedField _setTopHit:](self, "_setTopHit:", 0);
  -[CompletionItem reflectedStringForUserTypedString:](v15, "reflectedStringForUserTypedString:", self->_userTypedText);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || !-[CompletionItem matchLocationIsInURL](v15, "matchLocationIsInURL"))
    {
      goto LABEL_14;
    }
    objc_msgSend(v7, "safari_bestURLForUserTypedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("/")) & 1) != 0)
    {
      v10 = objc_msgSend(v7, "hasSuffix:", CFSTR("/"));

      if ((v10 & 1) != 0)
      {
LABEL_14:
        -[UnifiedField setText:](self, "setText:", v7);
        goto LABEL_15;
      }
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("/"));
      v8 = v7;
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

    }
    goto LABEL_14;
  }
  -[UnifiedField setText:](self, "setText:", v7);
  -[UnifiedField beginningOfDocument](self, "beginningOfDocument");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UnifiedField positionFromPosition:inDirection:offset:](self, "positionFromPosition:inDirection:offset:", v11, 2, -[NSString length](self->_userTypedText, "length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  if (v5)
  {
    -[UnifiedField endOfDocument](self, "endOfDocument");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UnifiedField textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UnifiedField setSelectedTextRange:](self, "setSelectedTextRange:", v14);

  if (v5)
LABEL_15:

}

- (void)_setTopHit:(id)a3
{
  CompletionItem **p_topHit;
  char v6;
  CompletionItem *v7;
  CompletionItem *v8;

  p_topHit = &self->_topHit;
  v8 = (CompletionItem *)a3;
  if ((-[CompletionItem isEquivalentTo:](v8, "isEquivalentTo:", *p_topHit) & 1) != 0)
    v6 = 1;
  else
    v6 = -[CompletionItem isEquivalentTo:](v8, "isEquivalentTo:", self->_lastTopHit);
  self->_topHitInitiallySelected = v6;
  objc_storeStrong((id *)&self->_lastTopHit, a3);
  -[UnifiedField _setReflectedItem:updateUserTypedPrefix:](self, "_setReflectedItem:updateUserTypedPrefix:", v8, 0);
  v7 = v8;
  if (*p_topHit != v8)
  {
    objc_storeStrong((id *)&self->_topHit, a3);
    -[UnifiedField _cancelPendingTopHitNavigation](self, "_cancelPendingTopHitNavigation");
    -[UnifiedField _updateReturnKey](self, "_updateReturnKey");
    v7 = v8;
  }

}

- (void)_restoreUserTypedText
{
  void *v3;
  char v4;

  -[UnifiedField text](self, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", self->_userTypedText);

  if ((v4 & 1) == 0)
    -[UnifiedField setText:](self, "setText:", self->_userTypedText);
}

- (void)setReflectedItem:(id)a3
{
  -[UnifiedField _setReflectedItem:updateUserTypedPrefix:](self, "_setReflectedItem:updateUserTypedPrefix:", a3, 1);
}

- (void)_setReflectedItem:(id)a3 updateUserTypedPrefix:(BOOL)a4
{
  _BOOL4 v4;
  CompletionItem *v6;
  CompletionItem **p_reflectedItem;
  void *v8;
  TopHitCompletionView *v9;
  TopHitCompletionView *v10;
  TopHitCompletionView *topHitCompletionView;
  void *v12;
  void *v13;
  TopHitCompletionPromotionRecognizer *v14;
  TopHitCompletionPromotionRecognizer *topHitCompletionPromotionRecognizer;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  UITextCursorAssertion *v33;
  UITextCursorAssertion *textCursorHiddenAssertion;
  void *v35;

  v4 = a4;
  v6 = (CompletionItem *)a3;
  p_reflectedItem = &self->_reflectedItem;
  if (self->_reflectedItem != v6)
  {
    if (!-[UnifiedField _allowsReflectedTopHit](self, "_allowsReflectedTopHit"))
    {

      v6 = 0;
    }
    objc_storeStrong((id *)&self->_reflectedItem, v6);
    -[UnifiedField delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unifiedFieldReflectedItemDidChange:", self);

    if (*p_reflectedItem)
    {
      self->_lastEditWasADeletion = 0;
      if (*p_reflectedItem)
      {
        if (!self->_topHitCompletionView)
        {
          v9 = [TopHitCompletionView alloc];
          v10 = -[TopHitCompletionView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          topHitCompletionView = self->_topHitCompletionView;
          self->_topHitCompletionView = v10;

          objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[TopHitCompletionView setBackgroundColor:](self->_topHitCompletionView, "setBackgroundColor:", v12);

          -[TopHitCompletionView setContentMode:](self->_topHitCompletionView, "setContentMode:", 3);
          -[UnifiedField selectionHighlightColor](self, "selectionHighlightColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[TopHitCompletionView setHighlightColor:](self->_topHitCompletionView, "setHighlightColor:", v13);

        }
        if (!self->_topHitCompletionPromotionRecognizer)
        {
          v14 = -[TopHitCompletionPromotionRecognizer initWithTarget:action:]([TopHitCompletionPromotionRecognizer alloc], "initWithTarget:action:", self, sel__promoteCompletionToSelection);
          topHitCompletionPromotionRecognizer = self->_topHitCompletionPromotionRecognizer;
          self->_topHitCompletionPromotionRecognizer = v14;

          -[TopHitCompletionPromotionRecognizer setDelegate:](self->_topHitCompletionPromotionRecognizer, "setDelegate:", self);
          -[UnifiedField addGestureRecognizer:](self, "addGestureRecognizer:", self->_topHitCompletionPromotionRecognizer);
        }
        -[CompletionItem reflectedStringForUserTypedString:](*p_reflectedItem, "reflectedStringForUserTypedString:", self->_userTypedText);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 || self->_topHitInitiallySelected)
        {
          v18 = objc_msgSend(v16, "safari_caseAndDiacriticInsensitiveStandardRangeOfString:additionalOptions:", self->_userTypedText, 8);
          v20 = v19;
          if (!-[NSString length](self->_userTypedText, "length"))
          {
            v21 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[UnifiedField _setReflectedItem:updateUserTypedPrefix:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
          }
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v4)
              -[UnifiedField setText:](self, "setText:", &stru_1E9CFDBB0);
          }
          else
          {
            objc_msgSend(v17, "substringToIndex:", v20);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v4)
            {
              -[UnifiedField text](self, "text");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "isEqualToString:", v29);

              if ((v31 & 1) == 0)
                -[UnifiedField setText:](self, "setText:", v29);
            }
            v32 = objc_msgSend(v17, "length");
            if (v32 == -[NSString length](self->_userTypedText, "length"))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                -[UnifiedField _removeTopHitCompletionView](self, "_removeTopHitCompletionView");

                goto LABEL_26;
              }
            }

          }
          -[UITextCursorAssertionController nonVisibleAssertionWithReason:](self->_textCursorAssertionController, "nonVisibleAssertionWithReason:", CFSTR("UnifiedField is reflecting a Top Hit completion item"));
          v33 = (UITextCursorAssertion *)objc_claimAutoreleasedReturnValue();
          textCursorHiddenAssertion = self->_textCursorHiddenAssertion;
          self->_textCursorHiddenAssertion = v33;

          -[UnifiedField addSubview:](self, "addSubview:", self->_topHitCompletionView);
          -[UnifiedField _fieldEditor](self, "_fieldEditor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setHidden:", 1);

          -[UnifiedField setNeedsLayout](self, "setNeedsLayout");
        }
        else
        {
          -[UnifiedField _restoreUserTypedText](self, "_restoreUserTypedText");
          -[UnifiedField _removeTopHitCompletionView](self, "_removeTopHitCompletionView");
        }
LABEL_26:

        goto LABEL_27;
      }
    }
    -[UnifiedField _restoreUserTypedText](self, "_restoreUserTypedText");
    -[UnifiedField _removeTopHitCompletionView](self, "_removeTopHitCompletionView");
  }
LABEL_27:

}

- (void)topHitDidBecomeReady
{
  void *v3;
  void *v4;
  BOOL v5;
  NSString *v6;

  if (-[UnifiedField isFirstResponder](self, "isFirstResponder")
    && -[UnifiedField _allowsReflectedTopHit](self, "_allowsReflectedTopHit"))
  {
    v6 = self->_pendingTopHitNavigationText;
    -[UnifiedField _topHitForCurrentText](self, "_topHitForCurrentText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UnifiedField _setTopHit:](self, "_setTopHit:", v3);

    if (v6)
    {
      -[UnifiedField text](self, "text");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqualToString:](v6, "isEqualToString:", v4))
      {
        v5 = -[UnifiedField _waitingForTopHitForCurrentText](self, "_waitingForTopHitForCurrentText");

        if (!v5)
          -[UnifiedField _endEditingWithCurrentText](self, "_endEditingWithCurrentText");
      }
      else
      {

      }
    }
    -[UnifiedField _updateReturnKey](self, "_updateReturnKey");

  }
}

- (void)_layoutTopHitCompletionView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CompletionItem *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  const __CTLine *v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double width;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  float v43;
  CGFloat v44;
  float v45;
  float v46;
  float v47;
  double v48;
  double v49;
  double MaxX;
  double v51;
  void *v52;
  void *v53;
  uint64_t v54;
  _QWORD v55[9];
  _QWORD v56[2];
  _QWORD v57[2];
  uint64_t v58;
  _QWORD v59[3];
  CGRect BoundsWithOptions;
  CGRect v61;
  CGRect v62;

  v59[1] = *MEMORY[0x1E0C80C00];
  -[UnifiedField _reflectedItemCompletionString](self, "_reflectedItemCompletionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UnifiedField _removeTopHitCompletionView](self, "_removeTopHitCompletionView");
    goto LABEL_21;
  }
  v4 = *MEMORY[0x1E0DC1140];
  v58 = *MEMORY[0x1E0DC1140];
  -[UnifiedField textColor](self, "textColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v3, v6);
  -[UnifiedField attributedText](self, "attributedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertAttributedString:atIndex:", v8, 0);
  v9 = *MEMORY[0x1E0DC1138];
  -[UnifiedField font](self, "font");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:value:range:", v9, v10, 0, objc_msgSend(v7, "length"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = v4;
    v11 = self->_reflectedItem;
    v12 = -[CompletionItem matchLocation](v11, "matchLocation");
    -[CompletionItem title](v11, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13 || (unint64_t)(v12 - 11) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v52 = v6;
      -[CompletionItem alternativeDisplayTextForURL](v11, "alternativeDisplayTextForURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v15)
      {
        -[CompletionItem alternativeDisplayTextForURL](v11, "alternativeDisplayTextForURL");
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[CompletionItem userVisibleURLString](v11, "userVisibleURLString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 1, 0);
        v16 = objc_claimAutoreleasedReturnValue();

        v13 = v17;
      }

      v13 = (void *)v16;
      v6 = v52;
    }
    -[CompletionItem reflectedStringForUserTypedString:](self->_reflectedItem, "reflectedStringForUserTypedString:", self->_userTypedText);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      -[UnifiedField _restoreUserTypedText](self, "_restoreUserTypedText");
      -[CompletionItem userVisibleURLString](v11, "userVisibleURLString");
      v53 = v8;
      v19 = v6;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 1, 0);
      v21 = objc_claimAutoreleasedReturnValue();

      v6 = v19;
      v8 = v53;
      v13 = (void *)v21;
    }

    v4 = v54;
    if (!v13)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CompletionItem safari_titleForReflection](self->_reflectedItem, "safari_titleForReflection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
LABEL_16:
      v56[0] = v9;
      -[UnifiedField font](self, "font");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v56[1] = v4;
      v57[0] = v22;
      -[UnifiedField _inheritedInteractionTintColor](self, "_inheritedInteractionTintColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v57[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" %C %@"), 8212, v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(v25, "initWithString:attributes:", v26, v24);

      objc_msgSend(v7, "appendAttributedString:", v27);
    }
  }
LABEL_17:
  -[TopHitCompletionView setAttributedText:highlightStartIndex:](self->_topHitCompletionView, "setAttributedText:highlightStartIndex:", v7, objc_msgSend(v8, "length"));
  v28 = CTLineCreateWithAttributedString((CFAttributedStringRef)v7);
  -[UnifiedField attributedText](self, "attributedText");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = round(CTLineGetOffsetForStringIndex(v28, objc_msgSend(v29, "length"), 0));
  -[UnifiedField _fieldEditor](self, "_fieldEditor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v33 = fmax(v30 - v32, 0.0);

  BoundsWithOptions = CTLineGetBoundsWithOptions(v28, 0);
  width = BoundsWithOptions.size.width;
  CFRelease(v28);
  -[UnifiedField bounds](self, "bounds");
  -[UnifiedField editingRectForBounds:](self, "editingRectForBounds:");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  -[UnifiedField paddingLeft](self, "paddingLeft");
  v44 = v36 + v43;
  -[UnifiedField paddingLeft](self, "paddingLeft");
  v46 = v45;
  -[UnifiedField paddingRight](self, "paddingRight");
  v61.size.width = v40 - (float)(v46 + v47);
  v48 = v44 - v33;
  v49 = width + 3.0;
  v61.origin.x = v44;
  v61.origin.y = v38;
  v61.size.height = v42;
  MaxX = CGRectGetMaxX(v61);
  v62.origin.x = v48;
  v62.origin.y = v38;
  v62.size.width = v49;
  v62.size.height = v42;
  if (CGRectGetMaxX(v62) <= MaxX)
    v51 = v49;
  else
    v51 = MaxX - v48;
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __43__UnifiedField__layoutTopHitCompletionView__block_invoke;
  v55[3] = &unk_1E9CF6B60;
  v55[4] = self;
  *(double *)&v55[5] = v48;
  *(CGFloat *)&v55[6] = v38;
  *(double *)&v55[7] = v51;
  *(CGFloat *)&v55[8] = v42;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v55);

LABEL_21:
}

uint64_t __43__UnifiedField__layoutTopHitCompletionView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (double)placeholderHorizontalInset
{
  return 2.0;
}

- (CGRect)editRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect result;

  v16.receiver = self;
  v16.super_class = (Class)UnifiedField;
  -[UnifiedField editRect](&v16, sel_editRect);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TopHitCompletionView superview](self->_topHitCompletionView, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = v8 + -30.0;
  else
    v12 = v8;
  v13 = v4;
  v14 = v6;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v12;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  void *v5;
  NSString *v6;
  NSString *userTypedText;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UnifiedField;
  -[UnifiedField layoutSubviews](&v8, sel_layoutSubviews);
  -[UnifiedField _placeholderLabel](self, "_placeholderLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "setFrame:", v4 + 2.0);
  if (!self->_userTypedText)
  {
    -[UnifiedField text](self, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    userTypedText = self->_userTypedText;
    self->_userTypedText = v6;

  }
  if (self->_topHitCompletionView)
    -[UnifiedField _layoutTopHitCompletionView](self, "_layoutTopHitCompletionView");

}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UnifiedField;
  if (!-[UnifiedField canBecomeFirstResponder](&v6, sel_canBecomeFirstResponder))
    return 0;
  -[UnifiedField delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "unifiedFieldCanBecomeFirstResponder:", self);
  else
    v4 = 1;

  return v4;
}

- (BOOL)resignFirstResponder
{
  NSObject *v3;
  unsigned int v4;
  BOOL v5;
  void *v7;
  objc_super v9;
  uint8_t buf[16];

  self->_isResigningFirstResponder = 1;
  -[UnifiedField _setTopHit:](self, "_setTopHit:", 0);
  -[UnifiedField _cancelPendingTopHitNavigation](self, "_cancelPendingTopHitNavigation");
  self->_usingPencilInput = 0;
  v3 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_INFO, "Resigning first responder; allows reflected Top Hits: YES",
      buf,
      2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)UnifiedField;
  v4 = -[UnifiedField resignFirstResponder](&v9, sel_resignFirstResponder);
  v5 = v4;
  self->_isResigningFirstResponder = 0;
  if (self->_preserveSelectionOnResignFirstResponder && v4 != 0)
  {
    -[UnifiedField interactionAssistant](self, "interactionAssistant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateSelection");

  }
  return v5;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UnifiedField;
  v3 = -[UnifiedField becomeFirstResponder](&v8, sel_becomeFirstResponder);
  if (v3)
  {
    -[UnifiedField _updateReturnKey](self, "_updateReturnKey");
    self->_hasSelectedQuerySuggestion = 0;
    self->_usingPencilInput = 0;
    v4 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_INFO, "Becoming first responder; allows reflected Top Hits: YES",
        v7,
        2u);
    }
    -[UnifiedField delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unifiedFieldMakeWindowKey:", self);

  }
  return v3;
}

- (BOOL)endEditing:(BOOL)a3
{
  BOOL preserveSelectionOnResignFirstResponder;
  BOOL result;
  objc_super v6;

  preserveSelectionOnResignFirstResponder = self->_preserveSelectionOnResignFirstResponder;
  self->_preserveSelectionOnResignFirstResponder = 0;
  v6.receiver = self;
  v6.super_class = (Class)UnifiedField;
  result = -[UnifiedField endEditing:](&v6, sel_endEditing_, a3);
  self->_preserveSelectionOnResignFirstResponder = preserveSelectionOnResignFirstResponder;
  return result;
}

- (void)focusAndInsertCursorAtEnd
{
  void *v3;
  void *v4;
  id v5;

  -[UnifiedField becomeFirstResponder](self, "becomeFirstResponder");
  -[UnifiedField endOfDocument](self, "endOfDocument");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UnifiedField endOfDocument](self, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UnifiedField textRangeFromPosition:toPosition:](self, "textRangeFromPosition:toPosition:", v5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UnifiedField setSelectedTextRange:](self, "setSelectedTextRange:", v4);

}

- (void)clearUserTypedText
{
  void *v3;
  NSString *userTypedText;

  -[UnifiedField delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unifiedField:willUpdateUserTypedText:toText:", self, self->_userTypedText, 0);

  userTypedText = self->_userTypedText;
  self->_userTypedText = 0;

}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _QWORD v41[10];

  v41[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)keyCommands_commands;
  if (!keyCommands_commands)
  {
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E28], 0, sel_moveRightKeyPressed);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v3;
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E10], 0, sel_moveLeftKeyPressed);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v4;
    v5 = *MEMORY[0x1E0DC4D90];
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4D90], 0, sel_nextCompletionSelectionByRowKeyPressed);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v6;
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v5, 0x100000, sel_nextCompletionSelectionBySectionKeyPressed);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v7;
    v8 = *MEMORY[0x1E0DC4E30];
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E30], 0, sel_previousCompletionSelectionByRowKeyPressed);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v41[4] = v9;
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v8, 0x100000, sel_previousCompletionSelectionBySectionKeyPressed);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41[5] = v10;
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0, sel_focusNextKeyViewKeyPressed);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v41[6] = v11;
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0x20000, sel_focusPreviousKeyViewKeyPressed);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41[7] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 8);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)keyCommands_commands;
    keyCommands_commands = v13;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = (id)keyCommands_commands;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v19++), "setWantsPriorityOverSystemBehavior:", 1);
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v17);
    }

    -[UnifiedField _allCombinationsOfModifierKeys](self, "_allCombinationsOfModifierKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "safari_arrayByMappingObjectsUsingBlock:", &__block_literal_global_145_0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)keyCommands_commands, "arrayByAddingObjectsFromArray:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)keyCommands_commands;
    keyCommands_commands = v22;

    v2 = (void *)keyCommands_commands;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = v2;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v28++), "setWantsPriorityOverSystemBehavior:", 1);
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v26);
  }

  return (id)keyCommands_commands;
}

uint64_t __27__UnifiedField_keyCommands__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), objc_msgSend(a2, "integerValue"), sel_selectCompletionKeyPressed);
}

- (id)_allCombinationsOfModifierKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E9D62928);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v8;
  char v9;
  objc_super v11;

  v6 = a4;
  if (NSSelectorFromString((NSString *)CFSTR("_define:")) == a3
    || NSSelectorFromString((NSString *)CFSTR("_share:")) == a3)
  {
    goto LABEL_23;
  }
  if (sel_pasteAndGo_ == a3 || sel_pasteAndSearch_ == a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "safari_canPasteAndNavigate");
    goto LABEL_9;
  }
  if (sel_moveRightKeyPressed == a3 || sel_moveLeftKeyPressed == a3)
  {
    if ((-[UnifiedField hasMarkedText](self, "hasMarkedText") & 1) == 0)
    {
      LOBYTE(self) = self->_topHitCompletionView != 0;
      goto LABEL_24;
    }
LABEL_23:
    LOBYTE(self) = 0;
    goto LABEL_24;
  }
  if (sel_nextCompletionSelectionByRowKeyPressed == a3
    || sel_nextCompletionSelectionBySectionKeyPressed == a3
    || sel_previousCompletionSelectionByRowKeyPressed == a3
    || sel_previousCompletionSelectionBySectionKeyPressed == a3)
  {
    if ((-[UnifiedField hasMarkedText](self, "hasMarkedText") & 1) != 0)
      goto LABEL_23;
    -[UnifiedField delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unifiedFieldShouldMoveCompletionSelection:", self);
LABEL_9:
    LOBYTE(self) = v9;

    goto LABEL_24;
  }
  if (sel_focusNextKeyViewKeyPressed == a3
    || sel_focusPreviousKeyViewKeyPressed == a3
    || sel_selectCompletionKeyPressed == a3)
  {
    LODWORD(self) = -[UnifiedField hasMarkedText](self, "hasMarkedText") ^ 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UnifiedField;
    LOBYTE(self) = -[UnifiedField canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, v6);
  }
LABEL_24:

  return (char)self;
}

- (void)moveRightKeyPressed
{
  if (self->_topHitCompletionView)
    -[UnifiedField _promoteCompletionToSelectionSelectingSuffix:andMoveForward:](self, "_promoteCompletionToSelectionSelectingSuffix:andMoveForward:", 0, 1);
}

- (void)moveLeftKeyPressed
{
  if (self->_topHitCompletionView)
    -[UnifiedField _promoteCompletionToSelectionSelectingSuffix:andMoveForward:](self, "_promoteCompletionToSelectionSelectingSuffix:andMoveForward:", 0, 0);
}

- (void)nextCompletionSelectionByRowKeyPressed
{
  id v3;

  -[UnifiedField delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unifiedField:moveCompletionSelectionByRowOffset:", self, 1);

}

- (void)nextCompletionSelectionBySectionKeyPressed
{
  id v3;

  -[UnifiedField delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unifiedField:moveCompletionSelectionBySectionOffset:", self, 1);

}

- (void)previousCompletionSelectionByRowKeyPressed
{
  id v3;

  -[UnifiedField delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unifiedField:moveCompletionSelectionByRowOffset:", self, -1);

}

- (void)previousCompletionSelectionBySectionKeyPressed
{
  id v3;

  -[UnifiedField delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unifiedField:moveCompletionSelectionBySectionOffset:", self, -1);

}

- (void)focusNextKeyViewKeyPressed
{
  id v3;

  -[UnifiedField delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unifiedField:focusNextKeyView:", self, 1);

}

- (void)focusPreviousKeyViewKeyPressed
{
  id v3;

  -[UnifiedField delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unifiedField:focusNextKeyView:", self, 0);

}

- (void)selectCompletionKeyPressed
{
  id v3;

  -[UnifiedField delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unifiedFieldSelectCompletionItemIfAvailable:", self);

}

- (void)insertTextSuggestion:(id)a3
{
  id v4;
  NSArray *querySuggestions;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  querySuggestions = self->_querySuggestions;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__UnifiedField_insertTextSuggestion___block_invoke;
  v10[3] = &unk_1E9CF6BC8;
  v11 = v4;
  v9 = v4;
  -[NSArray safari_firstObjectPassingTest:](querySuggestions, "safari_firstObjectPassingTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKContextCompleter logEngagement:forInput:](self->_contextCompleter, "logEngagement:forInput:", v6, self->_userTypedText);
  -[UnifiedField delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unifiedField:didEngageWithQuerySuggestion:forQueryString:", self, v6, self->_userTypedText);

  objc_msgSend(v9, "inputText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UnifiedField setText:](self, "setText:", v8);

  self->_lastInputWasQuerySuggestion = 1;
  self->_hasSelectedQuerySuggestion = 1;
  -[UnifiedField sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x20000);
  self->_lastInputWasQuerySuggestion = 0;

}

uint64_t __37__UnifiedField_insertTextSuggestion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inputText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)selectAll:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (self->_reflectedItem)
    -[UnifiedField _promoteCompletionToSelection](self, "_promoteCompletionToSelection");
  v5.receiver = self;
  v5.super_class = (Class)UnifiedField;
  -[UnifiedField selectAll:](&v5, sel_selectAll_, v4);

}

- (void)setContextCompleter:(id)a3
{
  objc_storeStrong((id *)&self->_contextCompleter, a3);
}

- (void)setVoiceSearchState:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (self->_voiceSearchState != a3)
  {
    self->_voiceSearchState = a3;
    objc_msgSend(MEMORY[0x1E0DC3968], "sharedInputModeController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (a3 == 1)
    {
      -[UnifiedField setText:](self, "setText:", 0);
      -[UnifiedField _voiceSearchInputModeForFirstResponder:](self, "_voiceSearchInputModeForFirstResponder:", -[UnifiedField isFirstResponder](self, "isFirstResponder"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "toggleDictationForResponder:withOption:firstResponderSetupCompletion:", self, v5, 0);

    }
    else if (!a3)
    {
      objc_msgSend(v7, "stopDictation");
    }
    -[UnifiedField delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unifiedFieldVoiceSearchStateDidChange:", self);

  }
}

- (void)completeDictation
{
  if (self->_voiceSearchState == 1)
  {
    self->_voiceSearchState = 2;
    -[UnifiedField _endEditingWithCurrentText](self, "_endEditingWithCurrentText");
  }
}

- (void)dictationRecordingDidEnd
{
  -[UnifiedField setVoiceSearchState:](self, "setVoiceSearchState:", 0);
}

- (void)dictationRecognitionFailed
{
  -[UnifiedField setVoiceSearchState:](self, "setVoiceSearchState:", 0);
}

- (id)_voiceSearchInputModeForFirstResponder:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  const __CFString *v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0DC3718]);
  v5 = v4;
  if (v3)
    v6 = CFSTR("UIDictationInputModeInvocationSourceMicButtonInFirstResponderSafariAddressBar");
  else
    v6 = CFSTR("UIDictationInputModeInvocationSourceMicButtonInSafariAddressBar");
  objc_msgSend(v4, "setInvocationSource:", v6);
  objc_msgSend(v5, "setShouldStayInDictationInputModeIfAutoEndpointed:", 0);
  objc_msgSend(v5, "setShouldSupressShowingAlternativesAutomatically:", 1);
  return v5;
}

- (BOOL)_allowsReflectedTopHit
{
  return !self->_usingPencilInput && self->_voiceSearchState == 0;
}

- (void)willBeginPencilTextInputEditing
{
  NSObject *v3;
  uint8_t v4[16];

  self->_usingPencilInput = 1;
  v3 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_INFO, "Beginning Pencil text input; allows reflected Top Hits: NO",
      v4,
      2u);
  }
  -[UnifiedField _removeTopHitCompletionView](self, "_removeTopHitCompletionView");
  -[UnifiedField _cancelPendingTopHitNavigation](self, "_cancelPendingTopHitNavigation");
}

- (CompletionItem)reflectedItem
{
  return self->_reflectedItem;
}

- (BOOL)isPastingText
{
  return self->_pastingText;
}

- (BOOL)isUsingPencilInput
{
  return self->_usingPencilInput;
}

- (BOOL)performingExternalSearch
{
  return self->_performingExternalSearch;
}

- (void)setPerformingExternalSearch:(BOOL)a3
{
  self->_performingExternalSearch = a3;
}

- (NSArray)querySuggestions
{
  return self->_querySuggestions;
}

- (BOOL)lastInputWasQuerySuggestion
{
  return self->_lastInputWasQuerySuggestion;
}

- (BOOL)hasSelectedQuerySuggestion
{
  return self->_hasSelectedQuerySuggestion;
}

- (CKContextCompleter)contextCompleter
{
  return self->_contextCompleter;
}

- (int64_t)voiceSearchState
{
  return self->_voiceSearchState;
}

- (BOOL)lastEditWasADeletion
{
  return self->_lastEditWasADeletion;
}

- (void)setLastEditWasADeletion:(BOOL)a3
{
  self->_lastEditWasADeletion = a3;
}

- (BOOL)isResigningFirstResponder
{
  return self->_isResigningFirstResponder;
}

- (void)setIsResigningFirstResponder:(BOOL)a3
{
  self->_isResigningFirstResponder = a3;
}

- (BOOL)preserveSelectionOnResignFirstResponder
{
  return self->_preserveSelectionOnResignFirstResponder;
}

- (void)setPreserveSelectionOnResignFirstResponder:(BOOL)a3
{
  self->_preserveSelectionOnResignFirstResponder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextCompleter, 0);
  objc_storeStrong((id *)&self->_querySuggestions, 0);
  objc_storeStrong((id *)&self->_reflectedItem, 0);
  objc_storeStrong((id *)&self->_lastTopHit, 0);
  objc_storeStrong((id *)&self->_textCursorHiddenAssertion, 0);
  objc_storeStrong((id *)&self->_textCursorAssertionController, 0);
  objc_storeStrong((id *)&self->_userTypedText, 0);
  objc_storeStrong((id *)&self->_topHitCompletionPromotionRecognizer, 0);
  objc_storeStrong((id *)&self->_topHitCompletionView, 0);
  objc_storeStrong((id *)&self->_topHit, 0);
  objc_storeStrong((id *)&self->_pendingTopHitNavigationText, 0);
}

- (void)_reflectedItemCompletionString
{
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, a1, a3, "User typed string is nil when getting completion string for reflected completion item", a5, a6, a7, a8, 0);
}

- (void)_setReflectedItem:(uint64_t)a3 updateUserTypedPrefix:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, a1, a3, "User typed string is nil with non-nil reflected completion item", a5, a6, a7, a8, 0);
}

@end
