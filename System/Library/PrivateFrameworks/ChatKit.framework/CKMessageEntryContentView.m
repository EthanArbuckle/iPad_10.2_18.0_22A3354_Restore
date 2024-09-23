@implementation CKMessageEntryContentView

+ (void)prewarmTextView
{
  id v2;

  v2 = (id)objc_msgSend((id)objc_opt_class(), "_createTextView:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:", 0, 0, 0, 0);
}

- (BOOL)canApplyTextEffectFromKeyCommand
{
  void *v2;
  char v3;

  -[CKMessageEntryContentView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExpressiveTextEnabled");

  return v3;
}

- (BOOL)canApplyTextStyleFromKeyCommand
{
  void *v2;
  char v3;

  -[CKMessageEntryContentView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExpressiveTextEnabled");

  return v3;
}

- (int64_t)activeTextEffectTypeInSelectedRange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int64_t v8;

  -[CKMessageEntryContentView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRange");
  v6 = v5;

  -[CKMessageEntryContentView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ck_activeTextEffectTypeInRange:", v4, v6);

  return v8;
}

- (unint64_t)activeTextStylesInSelectedRange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[CKMessageEntryContentView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRange");
  v6 = v5;

  -[CKMessageEntryContentView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "ck_activeTextStylesInRange:", v4, v6);

  return v8;
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
    -[CKMessageEntryContentView textView](self, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "ck_activeTextStylesInRange:", v4, length);

    -[CKMessageEntryContentView textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "ck_activeTextEffectTypeInRange:", v4, length);

    v12 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __76__CKMessageEntryContentView_TextEffects__textEffectsEditMenuForTextInRange___block_invoke;
    v26[3] = &unk_1E274FB20;
    objc_copyWeak(v27, &location);
    v27[1] = v4;
    v27[2] = length;
    +[CKTextEffectsMenuFactory textStylePaletteMenuWithHandler:activeTextStyles:](CKTextEffectsMenuFactory, "textStylePaletteMenuWithHandler:activeTextStyles:", v26, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v12;
    v22 = 3221225472;
    v23 = __76__CKMessageEntryContentView_TextEffects__textEffectsEditMenuForTextInRange___block_invoke_2;
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

void __76__CKMessageEntryContentView_TextEffects__textEffectsEditMenuForTextInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applyTextStyle:toTextRange:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __76__CKMessageEntryContentView_TextEffects__textEffectsEditMenuForTextInRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "applyTextEffect:toTextRange:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)applyTextStyle:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  -[CKMessageEntryContentView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  v8 = v7;

  -[CKMessageEntryContentView applyTextStyle:toTextRange:](self, "applyTextStyle:toTextRange:", a3, v6, v8);
}

- (void)applyTextStyle:(unint64_t)a3 toTextRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger v5;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  length = a4.length;
  v5 = a4.location;
  -[CKMessageEntryContentView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "balloonTextFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  location = 0;
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __69__CKMessageEntryContentView_TextEffects__applyTextStyle_toTextRange___block_invoke;
  v14 = &unk_1E274B548;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v8, "ck_applyWithTextStyle:toRange:baseFont:undo:", a3, v5, length, v10, &v11);
  -[CKMessageEntryContentView invalidateComposition](self, "invalidateComposition", v11, v12, v13, v14);
  -[CKMessageEntryContentView _didChangeAttributesAffectingTextSize](self, "_didChangeAttributesAffectingTextSize");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __69__CKMessageEntryContentView_TextEffects__applyTextStyle_toTextRange___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateComposition");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_didChangeAttributesAffectingTextSize");

}

- (void)applyTextEffect:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  -[CKMessageEntryContentView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "selectedRange");
  v8 = v7;

  -[CKMessageEntryContentView composition](self, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "string");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8 || v6 >= objc_msgSend(v11, "length") || v6 + v8 > objc_msgSend(v11, "length"))
  {
    v8 = objc_msgSend(v11, "length");
    v6 = 0;
  }
  -[CKMessageEntryContentView applyTextEffect:toTextRange:](self, "applyTextEffect:toTextRange:", a3, v6, v8);

}

- (void)applyTextEffect:(int64_t)a3 toTextRange:(_NSRange)a4
{
  void *length;
  void *v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14[4];
  id location;
  NSRange v16;

  length = (void *)a4.length;
  v5 = (void *)a4.location;
  location = 0;
  objc_initWeak(&location, self);
  -[CKMessageEntryContentView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__CKMessageEntryContentView_TextEffects__applyTextEffect_toTextRange___block_invoke;
  v13[3] = &unk_1E274FB70;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a3;
  v14[2] = v5;
  v14[3] = length;
  objc_msgSend(v8, "ck_toggleTextEffect:inRange:getAdded:undo:", a3, v5, length, 0, v13);

  -[CKMessageEntryContentView invalidateComposition](self, "invalidateComposition");
  v9 = (void *)MEMORY[0x1E0CB3940];
  v16.location = (NSUInteger)v5;
  v16.length = (NSUInteger)length;
  NSStringFromRange(v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("did apply text effect of type: %lu to range: %@"), a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEntryContentView textEffectCoordinator](self, "textEffectCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateWithReason:", v11);

  -[CKMessageEntryContentView _didChangeAttributesAffectingTextSize](self, "_didChangeAttributesAffectingTextSize");
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __70__CKMessageEntryContentView_TextEffects__applyTextEffect_toTextRange___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidateComposition");

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(_QWORD *)(a1 + 40);
  NSStringFromRange(*(NSRange *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("(undo) did apply text effect of type: %lu to range: %@"), v5, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "textEffectCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithReason:", v10);

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "_didChangeAttributesAffectingTextSize");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKMessageEntryTextView setDelegate:](self->_subjectView, "setDelegate:", 0);
  -[CKMessageEntryRichTextView setDelegate:](self->_textView, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryContentView;
  -[CKMessageEntryContentView dealloc](&v4, sel_dealloc);
}

- (CGRect)computedPluginViewFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect slice;
  CGRect v37;
  CGRect result;

  -[CKMessageEntryContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKMessageEntryContentView maxPluginShelfViewWidth](self, "maxPluginShelfViewWidth");
  v12 = v11;
  -[CKMessageEntryContentView _pluginMargins](self, "_pluginMargins");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  memset(&slice, 0, sizeof(slice));
  memset(&v35, 0, sizeof(v35));
  v37.origin.x = v4;
  v37.origin.y = v6;
  v37.size.width = v8;
  v37.size.height = v10;
  CGRectDivide(v37, &slice, &v35, v12, CGRectMinXEdge);
  v19 = -[CKMessageEntryContentView _currentPluginPayloadHasPhotosExtensionMediaPayload](self, "_currentPluginPayloadHasPhotosExtensionMediaPayload");
  if (-[CKMessageEntryContentView _currentPluginIsPhotosPlugin](self, "_currentPluginIsPhotosPlugin") || v19)
  {
    v22 = slice.size.width - (v16 + v18);
    -[CKMessageEntryContentView _calcuateIdealMaxPluginHeight:](self, "_calcuateIdealMaxPluginHeight:", 0);
    v24 = v25;
  }
  else
  {
    -[CKMessageEntryContentView delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "messageEntryContentViewMaxShelfPluginViewSize:", self);
    v22 = v21;
    v24 = v23;

  }
  -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ck_constrainedSizeThatFits:", v22, v24);
  v28 = v27;
  v30 = v29;

  v31 = CGRectGetMidX(slice) + v28 * -0.5;
  v32 = v14;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

+ (void)getClearButtonOffsetTop:(double *)a3 clearButtonOffsetTrailing:(double *)a4 forPluginWithBundleID:(id)a5
{
  char v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a5;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKMessageEntryContentView.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offsetTopOut"));

    if (a4)
      goto LABEL_3;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CKMessageEntryContentView.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offsetTrailingOut"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_9;
LABEL_3:
  v9 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0D375C0]);
  v10 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:com.apple.Stickers.UserGenerated.MessagesExtension"));
  if ((v9 & 1) != 0 || v10)
  {
    *a3 = 0.0;
    *a4 = 0.0;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messageEntryContentViewClearOffsetFromTop");
    *(_QWORD *)a3 = v12;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageEntryContentViewClearOffsetFromRight");
    *(_QWORD *)a4 = v14;

  }
}

- (CGRect)computedClearPluginButtonFrame
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  v3 = -[CKMessageEntryContentView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0.0;
  v31 = 0.0;
  objc_msgSend((id)objc_opt_class(), "getClearButtonOffsetTop:clearButtonOffsetTrailing:forPluginWithBundleID:", &v31, &v30, v5);
  -[CKMessageEntryContentView computedPluginViewFrame](self, "computedPluginViewFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CKMessageEntryContentView clearPluginButton](self, "clearPluginButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;

  -[CKMessageEntryContentView clearPluginButton](self, "clearPluginButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;

  v20 = v31;
  v21 = v7;
  v22 = v9;
  v23 = v11;
  v24 = v13;
  if (v3)
    v25 = CGRectGetMinX(*(CGRect *)&v21) + v30;
  else
    v25 = CGRectGetMaxX(*(CGRect *)&v21) - v16 - v30;

  v26 = v25;
  v27 = v9 + v20;
  v28 = v16;
  v29 = v19;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (BOOL)_currentPluginPayloadHasPhotosExtensionMediaPayload
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "photoShelfViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_currentPluginIsPhotosPlugin
{
  void *v2;
  void *v3;
  char v4;

  -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D375E0]);

  return v4;
}

- (UIEdgeInsets)_pluginMargins
{
  void *v3;
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
  UIEdgeInsets result;

  if (-[CKMessageEntryContentView _currentPluginIsPhotosPlugin](self, "_currentPluginIsPhotosPlugin")
    || -[CKMessageEntryContentView _currentPluginPayloadHasPhotosExtensionMediaPayload](self, "_currentPluginPayloadHasPhotosExtensionMediaPayload"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageEntryContentViewPhotoPluginInsets");
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageEntryContentViewPluginInsets");
  }
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;

  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
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
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  void *v85;
  void *v86;
  double MaxY;
  double v88;
  CGRect remainder;
  CGRect slice;
  double v91;
  objc_super v92;
  CGRect v93;
  CGRect v94;

  v92.receiver = self;
  v92.super_class = (Class)CKMessageEntryContentView;
  -[CKMessageEntryContentView layoutSubviews](&v92, sel_layoutSubviews);
  v91 = 0.0;
  -[CKMessageEntryContentView bounds](self, "bounds");
  v4 = v3;
  -[CKMessageEntryContentView sendLaterView](self, "sendLaterView");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[CKMessageEntryContentView sendLaterView](self, "sendLaterView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alpha");
    v9 = v8;

    if (v9 > 0.0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageEntryContentViewSendLaterInsets");
      v12 = v11;
      v14 = v13;
      v88 = v15;
      v17 = v16;

      -[CKMessageEntryContentView bounds](self, "bounds");
      v19 = v18;
      v21 = v20;
      v22 = v4;
      v24 = v23;
      v26 = v25;
      -[CKMessageEntryContentView maxPluginShelfViewWidth](self, "maxPluginShelfViewWidth");
      v28 = v27;
      memset(&slice, 0, sizeof(slice));
      memset(&remainder, 0, sizeof(remainder));
      v93.origin.x = v19;
      v93.origin.y = v21;
      v93.size.width = v24;
      v4 = v22;
      v93.size.height = v26;
      CGRectDivide(v93, &slice, &remainder, v28, CGRectMinXEdge);
      v29 = slice.size.width - (v14 + v17);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "entryViewMaxSendLaterHeight");
      v32 = v31;

      -[CKMessageEntryContentView sendLaterView](self, "sendLaterView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setFrame:", v14, v12, v29, v32);

      v91 = v88 * 0.5 + v12 + v32 + 0.0;
    }
  }
  if (-[CKMessageEntryContentView shouldShowPlugin](self, "shouldShowPlugin"))
  {
    -[CKMessageEntryContentView _pluginMargins](self, "_pluginMargins");
    v35 = v34;
    v37 = v36;
    -[CKMessageEntryContentView computedPluginViewFrame](self, "computedPluginViewFrame");
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v91 + v44;
    -[CKMessageEntryContentView pluginView](self, "pluginView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setFrame:", v39, v45, v41, v43);

    -[CKMessageEntryContentView clearPluginButton](self, "clearPluginButton");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView bringSubviewToFront:](self, "bringSubviewToFront:", v47);

    v48 = (double)-[CKMessageEntryContentView shouldShowClearButton](self, "shouldShowClearButton");
    -[CKMessageEntryContentView clearPluginButton](self, "clearPluginButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setAlpha:", v48);

    -[CKMessageEntryContentView computedClearPluginButtonFrame](self, "computedClearPluginButtonFrame");
    v51 = v50;
    v53 = v52;
    v55 = v54;
    v57 = v91 + v56;
    -[CKMessageEntryContentView clearPluginButton](self, "clearPluginButton");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setFrame:", v51, v57, v53, v55);

    v91 = v37 + v35 + v43 + v91;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "shouldShowPluginDividerLineWithPluginShelf") ^ 1;
    -[CKMessageEntryContentView pluginDividerLine](self, "pluginDividerLine");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setHidden:", v60);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "pluginDividerLineInsetsWithPluginShelf");
    v64 = v63;

    -[CKMessageEntryContentView pluginDividerLine](self, "pluginDividerLine");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v60) = objc_msgSend(v65, "isHidden");

    if ((v60 & 1) != 0)
      goto LABEL_11;
    -[CKMessageEntryContentView pluginDividerLine](self, "pluginDividerLine");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView _layoutDividerLine:leftInset:widthInset:currentYOffset:](self, "_layoutDividerLine:leftInset:widthInset:currentYOffset:", v66, &v91, v64, v64 + v64);
  }
  else
  {
    -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      -[CKMessageEntryContentView delegate](self, "delegate");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "messageEntryContentViewMaxShelfPluginViewSize:", self);
      v70 = v69;
      v72 = v71;

      -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "ck_constrainedSizeThatFits:", v70, v72);
    }
    else
    {
      -[CKMessageEntryContentView clearPluginButton](self, "clearPluginButton");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setAlpha:", 0.0);

      -[CKMessageEntryContentView pluginDividerLine](self, "pluginDividerLine");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setHidden:", 1);
    }
  }

LABEL_11:
  if (-[CKMessageEntryContentView needsTextLayout](self, "needsTextLayout"))
  {
    -[CKMessageEntryContentView _maxWidthForTextView](self, "_maxWidthForTextView");
    v75 = v74;
    -[CKMessageEntryContentView entryContentViewTextLeftOffset](self, "entryContentViewTextLeftOffset");
    v77 = v76;
    if (-[CKMessageEntryContentView shouldShowSubject](self, "shouldShowSubject"))
    {
      -[CKMessageEntryContentView subjectView](self, "subjectView");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryContentView _layoutTextView:currentYOffset:originX:maxWidth:](self, "_layoutTextView:currentYOffset:originX:maxWidth:", v78, &v91, v77, v75);

      -[CKMessageEntryContentView textAndSubjectDividerLine](self, "textAndSubjectDividerLine");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setHidden:", 0);

      -[CKMessageEntryContentView textAndSubjectDividerLine](self, "textAndSubjectDividerLine");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryContentView sendButtonTextInsetWidth](self, "sendButtonTextInsetWidth");
      v82 = v81;
      -[CKMessageEntryContentView subjectView](self, "subjectView");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "contentInset");
      -[CKMessageEntryContentView _layoutDividerLine:leftInset:widthInset:currentYOffset:](self, "_layoutDividerLine:leftInset:widthInset:currentYOffset:", v80, &v91, v77, v82 + v84);

    }
    else
    {
      -[UIView setHidden:](self->_textAndSubjectDividerLine, "setHidden:", 1);
    }
    -[CKMessageEntryContentView textView](self, "textView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView _layoutTextView:currentYOffset:originX:maxWidth:](self, "_layoutTextView:currentYOffset:originX:maxWidth:", v85, &v91, v77, v75);

    -[CKMessageEntryContentView textView](self, "textView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "frame");
    MaxY = CGRectGetMaxY(v94);

    -[CKMessageEntryContentView setContentSize:](self, "setContentSize:", v4, MaxY);
    -[CKMessageEntryContentView ensureSelectionVisibleIfNeeded](self, "ensureSelectionVisibleIfNeeded");
    -[CKMessageEntryContentView setNeedsTextLayout:](self, "setNeedsTextLayout:", 0);
  }
  -[CKMessageEntryContentView ensureTextViewVisibleIfNeeded](self, "ensureTextViewVisibleIfNeeded");
}

- (double)entryContentViewTextLeftOffset
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryContentViewTextLeftOffset");
  v4 = v3;

  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  CGSize result;

  width = a3.width;
  -[CKMessageEntryContentView sendLaterView](self, "sendLaterView", a3.width, a3.height);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 0.0;
  if (v5)
  {
    v7 = (void *)v5;
    -[CKMessageEntryContentView sendLaterView](self, "sendLaterView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "alpha");
    v10 = v9;

    if (v10 > 0.0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageEntryContentViewSendLaterInsets");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;

      v20 = width - (v15 + v19);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "entryViewMaxSendLaterHeight");
      v23 = v22;

      -[CKMessageEntryContentView sendLaterView](self, "sendLaterView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "ck_constrainedSizeThatFits:", v20, v23);
      v26 = v25;

      v6 = v17 + v13 + 0.0 + v26;
    }
  }
  if (-[CKMessageEntryContentView shouldShowPlugin](self, "shouldShowPlugin"))
  {
    -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pluginBundleID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0D375E0]);
    IMBalloonExtensionIDWithSuffix();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "isEqualToString:", v30)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v27, "photoShelfViewController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31 != 0;

    }
    else
    {
      v32 = 0;
    }

    -[CKMessageEntryContentView _pluginMargins](self, "_pluginMargins");
    v36 = v35;
    v38 = v37;
    if ((v29 | v32) == 1)
    {
      v39 = width - (v33 + v34);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "entryViewMaxPluginShelfHeight");
      v42 = v41;
    }
    else
    {
      -[CKMessageEntryContentView delegate](self, "delegate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "messageEntryContentViewMaxShelfPluginViewSize:", self);
      v39 = v43;
      v42 = v44;
    }

    -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "ck_constrainedSizeThatFits:", v39, v42);
    v47 = v46;

    v48 = v38 + v6 + v36 + v47;
    if (CKPixelWidth_once_11 != -1)
      dispatch_once(&CKPixelWidth_once_11, &__block_literal_global_716_0);
    v6 = v48 + *(double *)&CKPixelWidth_sPixel_11;

  }
  -[CKMessageEntryContentView containerViewLineWidth](self, "containerViewLineWidth");
  v50 = width + v49 * -2.0;
  -[CKMessageEntryContentView entryContentViewTextLeftOffset](self, "entryContentViewTextLeftOffset");
  v52 = v50 - v51;
  -[CKMessageEntryContentView sendButtonTextInsetWidth](self, "sendButtonTextInsetWidth");
  v54 = v52 - v53;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "entryViewCoverMinHeight");
  v57 = v56;

  if (-[CKMessageEntryContentView shouldShowSubject](self, "shouldShowSubject"))
  {
    -[CKMessageEntryContentView subjectView](self, "subjectView");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "sizeThatFits:", v54, 1.79769313e308);
    v60 = fmax(v59, v57);
    if (CKPixelWidth_once_11 != -1)
      dispatch_once(&CKPixelWidth_once_11, &__block_literal_global_716_0);
    v6 = v6 + v60 + *(double *)&CKPixelWidth_sPixel_11;

  }
  -[CKMessageEntryContentView textView](self, "textView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "sizeThatFits:", v54, 1.79769313e308);
  v63 = v62;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "entryViewMaxHeight");
  v66 = fmin(v63, v65);

  v67 = width;
  v68 = v6 + fmax(v66, v57);
  result.height = v68;
  result.width = v67;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKMessageEntryContentView bounds](self, "bounds");
  if (v9 != width || v8 != height)
    -[CKMessageEntryContentView setNeedsTextLayout:](self, "setNeedsTextLayout:", 1);
  v11.receiver = self;
  v11.super_class = (Class)CKMessageEntryContentView;
  -[CKMessageEntryContentView setBounds:](&v11, sel_setBounds_, x, y, width, height);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKMessageEntryContentView frame](self, "frame");
  if (v9 != width || v8 != height)
    -[CKMessageEntryContentView setNeedsTextLayout:](self, "setNeedsTextLayout:", 1);
  v11.receiver = self;
  v11.super_class = (Class)CKMessageEntryContentView;
  -[CKMessageEntryContentView setFrame:](&v11, sel_setFrame_, x, y, width, height);
}

- (void)didMoveToSuperview
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKMessageEntryContentView;
  -[CKMessageEntryContentView didMoveToSuperview](&v2, sel_didMoveToSuperview);
}

- (CKMessageEntryContentView)initWithFrame:(CGRect)a3 shouldShowSubject:(BOOL)a4 shouldDisableAttachments:(BOOL)a5 shouldUseNonEmojiKeyboard:(BOOL)a6 shouldUseNonHandwritingKeyboard:(BOOL)a7 shouldDisableKeyboardStickers:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  CKMessageEntryContentView *v13;
  void *v14;
  int v15;
  CKTextEffectCoordinatorConfiguration *v16;
  _TtC7ChatKit23CKTextEffectCoordinator *v17;
  _TtC7ChatKit23CKTextEffectCoordinator *textEffectCoordinator;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v49;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v49.receiver = self;
  v49.super_class = (Class)CKMessageEntryContentView;
  v13 = -[CKMessageEntryContentView initWithFrame:](&v49, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isExpressiveTextEnabled");

    if (v15
      && !+[CKTextEffectCoordinator entryViewTextEffectCoordinationDisabled](_TtC7ChatKit23CKTextEffectCoordinator, "entryViewTextEffectCoordinationDisabled"))
    {
      v16 = -[CKTextEffectCoordinatorConfiguration initWithLogIdentifier:timeAfterLastAnimationInSeconds:]([CKTextEffectCoordinatorConfiguration alloc], "initWithLogIdentifier:timeAfterLastAnimationInSeconds:", CFSTR("entry_view"), 3.5);
      v17 = -[CKTextEffectCoordinator initWithConfiguration:]([_TtC7ChatKit23CKTextEffectCoordinator alloc], "initWithConfiguration:", v16);
      textEffectCoordinator = v13->_textEffectCoordinator;
      v13->_textEffectCoordinator = v17;

      -[CKTextEffectCoordinator setDelegate:](v13->_textEffectCoordinator, "setDelegate:", v13);
      -[CKTextEffectCoordinator setPaused:includingAnimators:](v13->_textEffectCoordinator, "setPaused:includingAnimators:", 0, 1);

    }
    v13->_isCompositionExpirable = 0;
    -[CKMessageEntryContentView setScrollsToTop:](v13, "setScrollsToTop:", 0);
    -[CKMessageEntryContentView setShouldShowSubject:](v13, "setShouldShowSubject:", v12);
    objc_msgSend((id)objc_opt_class(), "_createTextView:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:", v11, v10, v9, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", v13);
    objc_msgSend(v19, "setTextDragDelegate:", v13);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isExpressiveTextEnabled");

    if (v21)
    {
      objc_msgSend(v19, "textLayoutManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setRequiresCTLineRef:", 1);

      objc_msgSend(v19, "setTextFormattingDelegate:", v13);
    }
    -[CKMessageEntryContentView setTextView:](v13, "setTextView:", v19);
    -[CKMessageEntryContentView addSubview:](v13, "addSubview:", v19);
    -[CKMessageEntryContentView setStyle:](v13, "setStyle:", 4);
    if (v12)
    {
      objc_msgSend((id)objc_opt_class(), "_createSubjectView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDelegate:", v13);
      -[CKMessageEntryContentView setSubjectView:](v13, "setSubjectView:", v23);
      -[CKMessageEntryContentView addSubview:](v13, "addSubview:", v23);
      v24 = objc_alloc(MEMORY[0x1E0CEABB0]);
      v25 = *MEMORY[0x1E0C9D648];
      v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v29 = (void *)objc_msgSend(v24, "initWithFrame:", *MEMORY[0x1E0C9D648], v26, v27, v28);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "theme");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "entryFieldBorderColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setBackgroundColor:", v32);

      -[CKMessageEntryContentView setTextAndSubjectDividerLine:](v13, "setTextAndSubjectDividerLine:", v29);
      -[CKMessageEntryContentView addSubview:](v13, "addSubview:", v29);

    }
    else
    {
      v25 = *MEMORY[0x1E0C9D648];
      v26 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    v33 = (void *)MEMORY[0x1E0CEA3A0];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "clearPluginButtonConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "buttonWithConfiguration:primaryAction:", v35, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "accessibilitySetIdentification:", CFSTR("clearPluginButton"));
    objc_msgSend(v36, "setExclusiveTouch:", 0);
    v37 = *MEMORY[0x1E0C9D538];
    v38 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "clearPluginButtonSize");
    objc_msgSend(v36, "setBounds:", v37, v38, v40, v41);

    objc_msgSend(v36, "addTarget:action:forEvents:", v13, sel_clearPluginButtonTapped_, 64);
    objc_msgSend(v36, "setAlpha:", 0.0);
    -[CKMessageEntryContentView setClearPluginButton:](v13, "setClearPluginButton:", v36);
    -[CKMessageEntryContentView addSubview:](v13, "addSubview:", v36);
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v25, v26, v27, v28);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "theme");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "entryFieldBorderColor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setBackgroundColor:", v45);

    -[CKMessageEntryContentView setPluginDividerLine:](v13, "setPluginDividerLine:", v42);
    -[CKMessageEntryContentView addSubview:](v13, "addSubview:", v42);
    -[CKMessageEntryContentView setNeedsTextLayout:](v13, "setNeedsTextLayout:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObserver:selector:name:object:", v13, sel_pluginPayloadWantsResize_, *MEMORY[0x1E0D35608], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObserver:selector:name:object:", v13, sel_pluginPayloadDidLoad_, *MEMORY[0x1E0D35600], 0);

  }
  return v13;
}

- (void)setStyle:(int64_t)a3
{
  int v3;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  NSObject *v21;
  const __CFString *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  int v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_style != a3)
  {
    v3 = a3;
    self->_style = a3;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v35 = 67109120;
        LODWORD(v36) = v3;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Updating entry view style to %d", (uint8_t *)&v35, 8u);
      }

    }
    v6 = CKMessageEntryViewStyleIsForDarkAppearance(self->_style);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
      v10 = objc_msgSend(v8, "keyboardDarkAppearance");
    else
      v10 = objc_msgSend(v8, "keyboardAppearance");
    v11 = v10;

    -[CKMessageEntryContentView textView](self, "textView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "theme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entryFieldTextColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v15);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "theme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "entryFieldPlaceholderTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPlaceholderColor:", v18);

    v19 = objc_msgSend(v12, "keyboardAppearance");
    v20 = v19 != v11;
    if (v19 != v11)
      objc_msgSend(v12, "setKeyboardAppearance:", v11);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = CFSTR("NO");
        if (v19 != v11)
          v22 = CFSTR("YES");
        v35 = 138412290;
        v36 = v22;
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Keyboard appearance changed? {%@}", (uint8_t *)&v35, 0xCu);
      }

    }
    if (-[CKMessageEntryContentView shouldShowSubject](self, "shouldShowSubject"))
    {
      -[CKMessageEntryContentView subjectView](self, "subjectView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (!v24)
      {
        -[CKMessageEntryContentView subjectView](self, "subjectView");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "theme");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "entryFieldTextColor");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTextColor:", v28);

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "theme");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "entryFieldPlaceholderTextColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPlaceholderColor:", v31);

        if (objc_msgSend(v25, "keyboardAppearance") != v11)
        {
          objc_msgSend(v25, "setKeyboardAppearance:", v11);
          v20 = 1;
        }

      }
    }
    if ((v20 & -[CKMessageEntryContentView isActive](self, "isActive")) == 1)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "Needs to trigger a keyboard appearance change.", (uint8_t *)&v35, 2u);
        }

      }
      -[CKMessageEntryContentView activeView](self, "activeView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "reloadInputViews");

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Call to reloadInputViews returned.", (uint8_t *)&v35, 2u);
        }

      }
    }

  }
}

- (BOOL)shouldShowPlugin
{
  void *v3;
  char v4;
  void *v5;

  -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "loadedContentView");
  }
  else
  {
    -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (CKComposition)composition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CKComposition *v8;
  void *composition;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  CKComposition *v19;
  CKComposition *v20;
  void *v21;
  void *v22;
  CKComposition *v23;
  CKComposition *v24;
  void *v25;
  int v26;
  void *v27;
  void *v29;
  void *v30;
  CKComposition *v31;
  void *v32;

  if (!self->_composition)
  {
    if (-[CKMessageEntryContentView isCompositionExpirable](self, "isCompositionExpirable"))
    {
      -[CKMessageEntryContentView textView](self, "textView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "compositionText");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryContentView subjectView](self, "subjectView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "compositionText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = +[CKComposition newExpirableCompositionWithText:subject:shelfPluginPayload:](CKComposition, "newExpirableCompositionWithText:subject:shelfPluginPayload:", v4, v6, v7);
      composition = self->_composition;
      self->_composition = v8;
    }
    else
    {
      -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "supportsCollaboration");

      v31 = [CKComposition alloc];
      -[CKMessageEntryContentView textView](self, "textView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "compositionText");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryContentView subjectView](self, "subjectView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "compositionText");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryContentView bizIntent](self, "bizIntent");
      composition = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryContentView shelfMediaObject](self, "shelfMediaObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        -[CKMessageEntryContentView collaborationShareOptions](self, "collaborationShareOptions");
        v29 = v12;
        v13 = v4;
        v14 = objc_claimAutoreleasedReturnValue();
        -[CKMessageEntryContentView textView](self, "textView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "proofreadingInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v12;
        v17 = v14;
        v18 = (void *)v14;
        v4 = v13;
        v19 = -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:collaborationShareOptions:proofreadingInfo:](v31, "initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:collaborationShareOptions:proofreadingInfo:", v13, v6, v7, composition, v16, v17, v15);
        v20 = self->_composition;
        self->_composition = v19;

      }
      else
      {
        -[CKMessageEntryContentView textView](self, "textView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "proofreadingInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:proofreadingInfo:](v31, "initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:proofreadingInfo:", v4, v6, v7, composition, v12, v22);
        v24 = self->_composition;
        self->_composition = v23;

      }
      v3 = v32;
    }

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isScheduledMessagesCoreEnabled");

  if (v26)
  {
    -[CKMessageEntryContentView sendLaterPluginInfo](self, "sendLaterPluginInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKComposition setSendLaterPluginInfo:](self->_composition, "setSendLaterPluginInfo:", v27);

  }
  return self->_composition;
}

- (void)setSendLaterPluginInfo:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  CKSendLaterPluginInfo *v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  CKSendLaterPluginInfo *v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  CKSendLaterPluginInfo *v19;
  CKMessageEntryContentView *v20;
  void (**v21)(_QWORD);
  _QWORD v22[5];
  void (**v23)(_QWORD);
  _QWORD aBlock[4];
  CKSendLaterPluginInfo *v25;
  CKMessageEntryContentView *v26;

  v6 = a4;
  v9 = (CKSendLaterPluginInfo *)a3;
  v10 = (void (**)(_QWORD))a5;
  if (self->_sendLaterPluginInfo != v9)
  {
    objc_storeStrong((id *)&self->_sendLaterPluginInfo, a3);
    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke;
    aBlock[3] = &unk_1E274A108;
    v12 = v9;
    v25 = v12;
    v26 = self;
    v13 = (void (**)(_QWORD))_Block_copy(aBlock);
    v14 = v13;
    if (v6)
    {
      v15 = (void *)MEMORY[0x1E0CEABB0];
      v22[0] = v11;
      v22[1] = 3221225472;
      v22[2] = __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke_2;
      v22[3] = &unk_1E274DA38;
      v22[4] = self;
      v23 = v13;
      v18[0] = v11;
      v18[1] = 3221225472;
      v18[2] = __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke_3;
      v18[3] = &unk_1E2754EB0;
      v19 = v12;
      v20 = self;
      v21 = v10;
      objc_msgSend(v15, "animateWithDuration:animations:completion:", v22, v18, 0.2);

    }
    else
    {
      v13[2](v13);
      if (!v12)
      {
        -[CKMessageEntryContentView sendLaterView](self, "sendLaterView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeFromSuperview");

        -[CKMessageEntryContentView setSendLaterView:](self, "setSendLaterView:", 0);
      }
      -[CKMessageEntryContentView layoutIfNeeded](self, "layoutIfNeeded");
      -[CKMessageEntryContentView delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "messageEntryContentViewSendLaterPluginInfoUpdated:", self);

      v10[2](v10);
    }

  }
}

void __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  CKSendLaterView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "sendLaterView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  if (v2)
  {
    objc_msgSend(v3, "removeFromSuperview");

    v4 = -[CKSendLaterView initWithPluginContext:]([CKSendLaterView alloc], "initWithPluginContext:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "setSendLaterView:", v4);

    v5 = *(void **)(a1 + 40);
    objc_msgSend(v5, "sendLaterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v6);

    objc_msgSend(*(id *)(a1 + 40), "sendLaterView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDelegate:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 40), "__ck_scrollToTop:", 1);
  }
  else
  {
    objc_msgSend(v3, "setAlpha:", 0.0);

  }
}

void __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageEntryContentViewSendLaterPluginInfoUpdated:", *(_QWORD *)(a1 + 32));

}

uint64_t __79__CKMessageEntryContentView_setSendLaterPluginInfo_animated_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;

  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "sendLaterView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 40), "setSendLaterView:", 0);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)setComposition:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  if ((CKIsEqual(self->_composition, v26) & 1) == 0)
  {
    -[CKMessageEntryContentView invalidateComposition](self, "invalidateComposition");
    objc_msgSend(v26, "shelfPluginPayload");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "skipConfigurePlugin");

    objc_msgSend(v26, "shelfPluginPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "setSkipConfigurePlugin:", 0);

      objc_msgSend(v26, "shelfPluginPayload");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v26, "shelfPluginPayload");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "datasource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setPluginDataSourceDelegate:", self);

      }
      objc_msgSend(v26, "shelfPluginPayload");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "datasource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "datasource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "shelfPluginPayload");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setDatasource:", v15);

      }
      objc_msgSend(v26, "shelfPluginPayload");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryContentView setShelfPluginPayload:](self, "setShelfPluginPayload:", v7);
    }
    else
    {
      -[CKMessageEntryContentView configureShelfForPluginPayload:](self, "configureShelfForPluginPayload:", v6);
    }

    objc_msgSend(v26, "bizIntent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView setBizIntent:](self, "setBizIntent:", v17);

    objc_msgSend(v26, "shelfMediaObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView setShelfMediaObject:](self, "setShelfMediaObject:", v18);

    objc_msgSend(v26, "collaborationShareOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView setCollaborationShareOptions:](self, "setCollaborationShareOptions:", v19);

    objc_msgSend(v26, "collaborationOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView setCollaborationOptions:](self, "setCollaborationOptions:", v20);

    objc_msgSend(v26, "sendLaterPluginInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView setSendLaterPluginInfo:animated:completionHandler:](self, "setSendLaterPluginInfo:animated:completionHandler:", v21, 0, &__block_literal_global_153);

    if (!-[CKMessageEntryContentView _shouldDeferUpdateUI](self, "_shouldDeferUpdateUI"))
    {
      -[CKMessageEntryContentView textView](self, "textView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "text");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCompositionText:", v23);

      -[CKMessageEntryContentView subjectView](self, "subjectView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "subject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setCompositionText:", v25);

      -[CKMessageEntryContentView setIsCompositionExpirable:](self, "setIsCompositionExpirable:", objc_msgSend(v26, "isExpirableComposition"));
      self->_shouldHideClearPluginButton = objc_msgSend(v26, "shouldHideClearPluginButton");
    }
  }

}

- (void)hideTextEffectsPickerIfNeededAndResetTypingAttributes
{
  id v2;

  -[CKMessageEntryContentView textView](self, "textView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hideTextEffectsPickerIfNeededAndResetTypingAttributes");

}

- (void)configureShelfForPluginPayload:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CKDefaultPluginEntryViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD block[4];
  CKDefaultPluginEntryViewController *v38;

  v4 = a3;
  if (!v4
    || (-[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v4, "isEqualToPluginPayload:", v5),
        v5,
        (v6 & 1) == 0))
  {
    -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v4;
      v11 = objc_msgSend(v10, "shouldSendAsMediaObject");
      if (v4)
        goto LABEL_7;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      if (v4)
      {
LABEL_7:
        objc_msgSend(v4, "pluginBundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        IMBalloonExtensionIDWithSuffix();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        objc_msgSend(v10, "photoShelfViewController");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14 && v15)
        {
          -[CKMessageEntryContentView setShelfPluginPayload:](self, "setShelfPluginPayload:", v4);
          -[CKMessageEntryContentView setPluginEntryViewController:](self, "setPluginEntryViewController:", v16);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "pluginBundleID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v17;
          objc_msgSend(v17, "balloonPluginForBundleID:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = v19;
          v20 = (objc_class *)objc_msgSend(v19, "dataSourceClass");
          if ((v11 & 1) != 0 || !v20)
            v20 = (objc_class *)objc_opt_class();
          v21 = (void *)objc_msgSend([v20 alloc], "initWithPluginPayload:", v4);
          objc_msgSend(v4, "setDatasource:", v21);
          -[CKMessageEntryContentView conversation](self, "conversation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "chat");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setChat:", v23);

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v21, "setPluginDataSourceDelegate:", self);
          objc_msgSend(MEMORY[0x1E0D358D0], "stagingContextWithIdentifier:isEmbeddedInTextView:", CFSTR("stagedShelfPlugin"), 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setPayloadInShelf:", 1);
          objc_msgSend(v21, "setStagingContext:", v24);
          objc_msgSend(v21, "payloadWillEnterShelf");
          objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "associatedMessageGUID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "pluginBundleID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "existingDataSourceForMessageGUID:bundleID:", v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "beginShowingLastConsumedBreadcrumbForOutgoingPayload:", v4);
          v29 = -[CKDefaultPluginEntryViewController initWithDataSource:entryViewDelegate:andPlugin:]([CKDefaultPluginEntryViewController alloc], "initWithDataSource:entryViewDelegate:andPlugin:", v21, 0, v36);
          objc_msgSend(v4, "pluginBundleID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          IMBalloonExtensionIDWithSuffix();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKMessageEntryContentView setShouldSkipRemovalFromParent:](self, "setShouldSkipRemovalFromParent:", objc_msgSend(v30, "isEqualToString:", v31));

          -[CKDefaultPluginEntryViewController view](v29, "view");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

          if (-[CKMessageEntryContentView pendingShelfPayloadWillAnimateIn](self, "pendingShelfPayloadWillAnimateIn"))
          {
            -[CKDefaultPluginEntryViewController view](v29, "view");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setAlpha:", 0.0);

            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __60__CKMessageEntryContentView_configureShelfForPluginPayload___block_invoke;
            block[3] = &unk_1E274A208;
            v38 = v29;
            dispatch_async(MEMORY[0x1E0C80D38], block);
            -[CKMessageEntryContentView setPendingShelfPayloadWillAnimateIn:](self, "setPendingShelfPayloadWillAnimateIn:", 0);

          }
          -[CKMessageEntryContentView setShelfPluginPayload:](self, "setShelfPluginPayload:", v4);
          -[CKMessageEntryContentView setPluginEntryViewController:](self, "setPluginEntryViewController:", v29);
          -[CKMessageEntryContentView delegate](self, "delegate");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "messageEntryContentView:didStagePluginPayload:", self, v4);

        }
        goto LABEL_21;
      }
    }
    -[CKMessageEntryContentView setShelfPluginPayload:](self, "setShelfPluginPayload:", 0);
    -[CKMessageEntryContentView setPluginEntryViewController:](self, "setPluginEntryViewController:", 0);
LABEL_21:

  }
}

void __60__CKMessageEntryContentView_configureShelfForPluginPayload___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x1E0CEABB0];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__CKMessageEntryContentView_configureShelfForPluginPayload___block_invoke_2;
  v2[3] = &unk_1E274A208;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:", v2, 0.5);

}

void __60__CKMessageEntryContentView_configureShelfForPluginPayload___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)prepareForShelfPayloadAnimation
{
  -[CKMessageEntryContentView setPendingShelfPayloadWillAnimateIn:](self, "setPendingShelfPayloadWillAnimateIn:", 1);
}

- (void)setPluginEntryViewController:(id)a3
{
  id v5;
  CKPluginEntryViewController **p_pluginEntryViewController;
  void *v7;
  CKPluginEntryViewController *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v5 = a3;
  p_pluginEntryViewController = &self->_pluginEntryViewController;
  if ((CKIsEqual(self->_pluginEntryViewController, v5) & 1) == 0)
  {
    if (*p_pluginEntryViewController
      && !-[CKMessageEntryContentView shouldSkipRemovalFromParent](self, "shouldSkipRemovalFromParent"))
    {
      -[CKPluginEntryViewController willMoveToParentViewController:](*p_pluginEntryViewController, "willMoveToParentViewController:", 0);
      -[CKPluginEntryViewController view](*p_pluginEntryViewController, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

      -[CKPluginEntryViewController removeFromParentViewController](*p_pluginEntryViewController, "removeFromParentViewController");
      v8 = *p_pluginEntryViewController;
      *p_pluginEntryViewController = 0;

    }
    if (v5)
    {
      objc_storeStrong((id *)&self->_pluginEntryViewController, a3);
      -[CKMessageEntryContentView setShouldSkipRemovalFromParent:](self, "setShouldSkipRemovalFromParent:", 0);
      -[CKMessageEntryContentView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Content view had no delegate when setPluginEntryViewController: was called. This will break the view controller containment.", v13, 2u);
        }

      }
      objc_msgSend(v9, "messageEntryContentView:willAddPluginEntryViewControllerToViewHierarchy:", self, *p_pluginEntryViewController);
      -[CKPluginEntryViewController view](*p_pluginEntryViewController, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryContentView addSubview:](self, "addSubview:", v11);

      objc_msgSend(v9, "messageEntryContentView:didAddPluginEntryViewControllerToViewHierarchy:", self, *p_pluginEntryViewController);
    }
    if (!-[CKMessageEntryContentView _shouldDeferUpdateUI](self, "_shouldDeferUpdateUI"))
    {
      -[CKMessageEntryContentView _updateUI](self, "_updateUI");
      -[CKMessageEntryContentView delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "messageEntryContentViewShelfDidChange:", self);

    }
  }

}

- (UIView)pluginView
{
  void *v2;
  void *v3;

  -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)isActive
{
  void *v2;
  char v3;

  -[CKMessageEntryContentView activeView](self, "activeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (CKMessageEntryTextView)activeView
{
  void *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeView);
  if (!WeakRetained)
  {
    -[CKMessageEntryContentView textView](self, "textView");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (CKMessageEntryTextView *)WeakRetained;
}

- (BOOL)makeActive
{
  void *v2;
  char v3;

  -[CKMessageEntryContentView activeView](self, "activeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)_shouldDeferUpdateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  -[CKMessageEntryContentView composition](self, "composition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shelfPluginPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pluginBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "balloonPluginForBundleID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "dataSourceClass")), "initWithPluginPayload:", v4);
    if (objc_msgSend(v8, "supportsDynamicSize"))
    {
      -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 != 0;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isSingleLine
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  double v19;
  double v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTextKit2Enabled");

  if (v4)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    -[CKMessageEntryContentView textView](self, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textLayoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textLayoutManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __41__CKMessageEntryContentView_isSingleLine__block_invoke;
    v21[3] = &unk_1E274BA18;
    v21[4] = &v22;
    v11 = (id)objc_msgSend(v6, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v10, 4, v21);

    v12 = v23[3] == 1;
    _Block_object_dispose(&v22, 8);
  }
  else
  {
    if (-[CKMessageEntryContentView shouldShowSubject](self, "shouldShowSubject"))
      return 0;
    -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      return 0;
    }
    else
    {
      -[CKMessageEntryContentView textView](self, "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layoutManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_msgSend(v16, "numberOfGlyphs");
      if (v17)
      {
        v18 = (uint64_t *)v17;
        v22 = 0;
        v23 = 0;
        objc_msgSend(v16, "lineFragmentUsedRectForGlyphAtIndex:effectiveRange:", 0, &v22);
        if (v23 == v18)
        {
          objc_msgSend(v16, "extraLineFragmentUsedRect");
          v12 = v20 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v19 == *MEMORY[0x1E0C9D820];
        }
        else
        {
          v12 = 0;
        }
      }
      else
      {
        v12 = 1;
      }

    }
  }
  return v12;
}

BOOL __41__CKMessageEntryContentView_isSingleLine__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "textLineFragments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "count");

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) < 2uLL;
}

- (void)setPlaceholderText:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[CKMessageEntryContentView requestedPlaceholderText](self, "requestedPlaceholderText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v5 & 1) == 0)
  {
    -[CKMessageEntryContentView setRequestedPlaceholderText:](self, "setRequestedPlaceholderText:", v6);
    -[CKMessageEntryContentView _updateUI](self, "_updateUI");
  }

}

- (NSString)placeholderText
{
  void *v2;
  void *v3;

  -[CKMessageEntryContentView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isShowingDictationPlaceholder
{
  void *v3;
  char v4;
  void *v5;

  -[CKMessageEntryContentView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isShowingDictationPlaceholder") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[CKMessageEntryContentView subjectView](self, "subjectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isShowingDictationPlaceholder");

  }
  return v4;
}

- (void)setBalloonColor:(char)a3
{
  uint64_t v3;
  id v4;

  v3 = a3;
  -[CKMessageEntryContentView textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBalloonColor:", v3);

}

- (UIEdgeInsets)contentTextAlignmentInsets
{
  void *v2;
  void *v3;
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
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryViewlayoutMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "entryViewTextAlignmentInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (char)balloonColor
{
  void *v2;
  char v3;

  -[CKMessageEntryContentView textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "balloonColor");

  return v3;
}

- (void)setPlaceHolderWidth:(double)a3
{
  void *v5;
  id v6;

  self->_placeHolderWidth = a3;
  -[CKMessageEntryContentView textView](self, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceHolderWidth:", a3);

  -[CKMessageEntryContentView subjectView](self, "subjectView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPlaceHolderWidth:", a3);

}

- (void)setShouldStripEmojis:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_shouldStripEmojis = a3;
  -[CKMessageEntryContentView textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldStripEmojis:", v3);

}

- (void)acceptAutocorrectionForChat:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void (*v39)(void);
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  CKMessageEntryContentView *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[3];
  _QWORD v59[5];

  v59[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "proofreadingInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    objc_msgSend(v6, "setProofreadingInfo:", 0);
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isProofreadingEnabled");

    if (v11)
    {
      v12 = (void (*)(void))MEMORY[0x193FF3C24]("NSBridgedPerformPendingTextCheckingAndReturnInfo", CFSTR("AppKit"));
      if (v12)
      {
        v12();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("UnderlineRanges"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TextCorrections"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ReplacedStrings"));
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = 0x1E0C99000;
          v48 = (void *)v16;
          if (v14)
          {
            if (v15)
            {
              v18 = (void *)v16;
              if (v16)
              {
                objc_msgSend(v14, "lastObject");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "lastObject");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v18;
                v22 = v19;
                objc_msgSend(v21, "lastObject");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19 && v20 && v23)
                {
                  v46 = v20;
                  v47 = v23;
                  v43 = v15;
                  v44 = v14;
                  v24 = objc_msgSend(v19, "rangeValue");
                  v26 = v24 + v25;
                  -[CKMessageEntryContentView textView](self, "textView");
                  v27 = v22;
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  -[CKMessageEntryContentView textView](self, "textView");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "beginningOfDocument");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "positionFromPosition:offset:", v30, v26);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();

                  -[CKMessageEntryContentView textView](self, "textView");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "endOfDocument");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = v31;
                  LODWORD(v30) = objc_msgSend(v31, "isEqual:", v33);

                  if ((_DWORD)v30)
                  {
                    v58[0] = CFSTR("UnderlineRanges");
                    v34 = v27;
                    v57 = v27;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    v59[0] = v35;
                    v58[1] = CFSTR("TextCorrections");
                    v56 = v46;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    v59[1] = v36;
                    v58[2] = CFSTR("ReplacedStrings");
                    v55 = v47;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    v59[2] = v37;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 3);
                    v38 = objc_claimAutoreleasedReturnValue();

                    v13 = (void *)v38;
                  }
                  else
                  {
                    v34 = v27;
                  }
                  v15 = v43;
                  v14 = v44;

                  v22 = v34;
                  v20 = v46;
                  v23 = v47;
                }

                v17 = 0x1E0C99000uLL;
              }
            }
          }
          v53 = *MEMORY[0x1E0D35430];
          v54 = v13;
          objc_msgSend(*(id *)(v17 + 3456), "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setProofreadingInfo:", v40);

        }
      }
    }
    else
    {
      v39 = (void (*)(void))MEMORY[0x193FF3C24]("NSBridgedPerformPendingTextChecking", CFSTR("AppKit"));
      if (v39)
        v39();
    }
  }
  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __75__CKMessageEntryContentView_acceptAutocorrectionForChat_completionHandler___block_invoke;
    v49[3] = &unk_1E2754EB0;
    v50 = v41;
    v51 = self;
    v52 = v7;
    objc_msgSend(v50, "acceptAutocorrectionWithCompletionHandler:", v49);

  }
  else
  {
    -[CKMessageEntryContentView invalidateComposition](self, "invalidateComposition");
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __75__CKMessageEntryContentView_acceptAutocorrectionForChat_completionHandler___block_invoke(uint64_t a1, char a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__CKMessageEntryContentView_acceptAutocorrectionForChat_completionHandler___block_invoke_2;
  v7[3] = &unk_1E274D200;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __75__CKMessageEntryContentView_acceptAutocorrectionForChat_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "removeAutocorrectPrompt");
  objc_msgSend(*(id *)(a1 + 32), "updateLayout");
  objc_msgSend(*(id *)(a1 + 40), "invalidateComposition");
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 40), "textView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProofreadingInfo:", 0);

  }
}

- (void)willAnimateBoundsChange
{
  id v2;

  -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "willAnimateBoundsChange");

}

- (void)didFinishAnimatedBoundsChange
{
  id v2;

  -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "didFinishAnimatedBoundsChange");

}

- (void)collapseTextFieldsIfInPencilMode
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CKMessageEntryContentView textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInPencilMode"))
  {

  }
  else
  {
    -[CKMessageEntryContentView subjectView](self, "subjectView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInPencilMode");

    if (!v5)
      return;
  }
  -[CKMessageEntryContentView textView](self, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInPencilMode:", 0);

  -[CKMessageEntryContentView subjectView](self, "subjectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInPencilMode:", 0);

  -[CKMessageEntryContentView textView](self, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutSubviews");

  -[CKMessageEntryContentView subjectView](self, "subjectView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutSubviews");

}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  NSNumber *v33;
  NSNumber *textViewRespondsToShowTextFormattingAnimationOptions;
  void *v35;
  void *v36;
  void *v37;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = (void *)objc_msgSend(a5, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isExpressiveTextEnabled");

  v13 = 0x1E0CEA000uLL;
  if (v12)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CEA740], "ck_indexOfMenuWithMenuIdentifier:inMenuElementsArray:", *MEMORY[0x1E0CEB9A8], v10);
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = 0;
    }
    else
    {
      v15 = v14;
      objc_msgSend(v10, "removeObjectAtIndex:", v14);
    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isExpressiveTextEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v17, "isSendingExpressiveTextEnabled") & 1) != 0)
      {
        -[CKMessageEntryContentView textView](self, "textView");
        v18 = (id)objc_claimAutoreleasedReturnValue();

        v19 = v18 == v9;
        v13 = 0x1E0CEA000;
        if (!v19)
          goto LABEL_15;
        if (CKIsRunningInMacCatalyst())
        {
          -[CKMessageEntryContentView textView](self, "textView");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isExpressiveTextEnabled");

          if (!v21)
            goto LABEL_15;
          -[CKMessageEntryContentView textEffectsEditMenuForTextInRange:](self, "textEffectsEditMenuForTextInRange:", location, length);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v10, "insertObject:atIndex:", v16, v15);
        }
        else
        {
          if (!self->_textViewRespondsToShowTextFormattingAnimationOptions)
          {
            v31 = (void *)MEMORY[0x1E0CB37E8];
            -[CKMessageEntryContentView textView](self, "textView");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "numberWithBool:", objc_opt_respondsToSelector() & 1);
            v33 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            textViewRespondsToShowTextFormattingAnimationOptions = self->_textViewRespondsToShowTextFormattingAnimationOptions;
            self->_textViewRespondsToShowTextFormattingAnimationOptions = v33;

          }
          -[CKMessageEntryContentView textView](self, "textView");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "showTextEffectsPickerEditMenuAction");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            CKFrameworkBundle();
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("TEXT_EFFECTS"), &stru_1E276D870, CFSTR("ChatKit"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setTitle:", v37);

            objc_msgSend(v10, "insertObject:atIndex:", v16, v15);
          }
          v13 = 0x1E0CEA000;
        }
      }
      else
      {

      }
    }

  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isRichLinkImprovementsEnabled");

  if (v23)
  {
    objc_msgSend(v9, "attributedText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView richLinksEditMenuForAttributedText:inRange:](self, "richLinksEditMenuForAttributedText:inRange:", v24, location, length);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      objc_msgSend(v10, "insertObject:atIndex:", v25, objc_msgSend(*(id *)(v13 + 1856), "ck_menuInsertionIndexAfterIndex:inMenuElementsArray:", objc_msgSend(*(id *)(v13 + 1856), "ck_indexOfMenuWithMenuIdentifier:inMenuElementsArray:", *MEMORY[0x1E0CEB9D0], v10), v10));

  }
  v26 = 16 * (CKIsRunningInMacCatalyst() != 0);
  v27 = *(void **)(v13 + 1856);
  v28 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v27, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  void *v9;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeView);
  if (!WeakRetained
    || (v6 = WeakRetained,
        v7 = objc_loadWeakRetained((id *)&self->_activeView),
        v7,
        v6,
        v7 == v4))
  {
    -[CKMessageEntryContentView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "messageEntryContentViewShouldBeginEditing:", self);

  }
  else
  {
    v8 = 1;
    -[CKMessageEntryContentView setIgnoreEndEditing:](self, "setIgnoreEndEditing:", 1);
  }

  return v8;
}

- (void)textViewDidBeginEditing:(id)a3
{
  CKMessageEntryTextView **p_activeView;
  id v5;
  id WeakRetained;
  _BOOL8 v7;
  id v8;

  p_activeView = &self->_activeView;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_activeView);
  v7 = WeakRetained != 0;

  -[CKMessageEntryContentView setActiveView:](self, "setActiveView:", v5);
  -[CKMessageEntryContentView delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "messageEntryContentViewDidBeginEditing:wasAlreadyActive:", self, v7);

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;

  if (-[CKMessageEntryContentView ignoreEndEditing](self, "ignoreEndEditing", a3))
  {
    -[CKMessageEntryContentView setIgnoreEndEditing:](self, "setIgnoreEndEditing:", 0);
  }
  else
  {
    -[CKMessageEntryContentView setActiveView:](self, "setActiveView:", 0);
    -[CKMessageEntryContentView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageEntryContentViewDidEndEditing:", self);

  }
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  _QWORD block[5];
  uint8_t buf[8];
  uint64_t v15;

  v4 = a3;
  -[CKMessageEntryContentView invalidateComposition](self, "invalidateComposition");
  v15 = 0;
  objc_msgSend(v4, "updateFontIfNeededAndGetWasUsingBigEmojiStyle:", &v15);
  objc_msgSend(v4, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6 && (unint64_t)(v15 - 1) <= 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "didClearBigEmoji", buf, 2u);
      }

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__CKMessageEntryContentView_textViewDidChange___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  objc_msgSend(v4, "updatePlaceholderLabelIfNeeded");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isExpressiveTextEnabled");

  if (v9)
  {
    -[CKMessageEntryContentView textView](self, "textView");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10 == v4)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __47__CKMessageEntryContentView_textViewDidChange___block_invoke_2;
      v12[3] = &unk_1E274A208;
      v12[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v12);
    }
  }
  -[CKMessageEntryContentView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "messageEntryContentViewDidChange:isTextChange:isShelfChange:", self, 1, 0);

  -[CKMessageEntryContentView setNeedsTextLayout:](self, "setNeedsTextLayout:", 1);
  -[CKMessageEntryContentView setNeedsEnsureSelectionVisible:](self, "setNeedsEnsureSelectionVisible:", 1);
  -[CKMessageEntryContentView setNeedsLayout](self, "setNeedsLayout");

}

void __47__CKMessageEntryContentView_textViewDidChange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateUI");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageEntryContentViewDidChange:isTextChange:isShelfChange:", *(_QWORD *)(a1 + 32), 1, 0);

}

void __47__CKMessageEntryContentView_textViewDidChange___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "textEffectCoordinator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateWithReason:", CFSTR("text changed"));

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  uint8_t v21[16];
  _NSRange v22;

  length = a4.length;
  location = a4.location;
  v22 = a4;
  v9 = a3;
  v10 = a5;
  -[CKMessageEntryContentView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(length) = objc_msgSend(v11, "messageEntryContentView:shouldChangeTextInRange:replacementText:", self, location, length, v10);

  if ((length & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "CKMessageEntryContentViewDelegate shouldChangeTextInRange returned NO. Rejecting text change.", v21, 2u);
      }

    }
    goto LABEL_10;
  }
  -[CKMessageEntryContentView textView](self, "textView");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v9)
  {
    -[CKMessageEntryContentView textView](self, "textView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "shouldUpdateMentionsInRange:replacementText:", &v22, v10);

    -[CKMessageEntryContentView _provideHapticFeedbackIfNecessaryForText:](self, "_provideHapticFeedbackIfNecessaryForText:", v10);
    if (v15)
      goto LABEL_9;
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  -[CKMessageEntryContentView _provideHapticFeedbackIfNecessaryForText:](self, "_provideHapticFeedbackIfNecessaryForText:", v10);
LABEL_9:
  -[CKMessageEntryContentView textView](self, "textView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setApplyDefaultTypingAttributesOnTextEffectPickerDismissal:", 0);

  -[CKMessageEntryContentView textView](self, "textView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "effectsPickerAssistant");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "adjustTypingAttributesIfNeededForReplacement:inRange:", v10, v22.location, v22.length);

  v19 = 1;
LABEL_11:

  return v19;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[CKMessageEntryContentView textView](self, "textView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4 == v7)
  {
    objc_msgSend(v7, "selectedRange");
    v5 = v7;
    if (!v6)
    {
      -[CKMessageEntryContentView setNeedsEnsureSelectionVisible:](self, "setNeedsEnsureSelectionVisible:", 1);
      -[CKMessageEntryContentView setNeedsTextLayout:](self, "setNeedsTextLayout:", 1);
      -[CKMessageEntryContentView setNeedsLayout](self, "setNeedsLayout");
      v5 = v7;
    }
  }

}

- (BOOL)textView:(id)a3 shouldInteractWithTextAttachment:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  return 0;
}

- (void)_provideHapticFeedbackIfNecessaryForText:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[CKMessageEntryContentView conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStewieConversation");

  if (v5)
  {
    -[CKMessageEntryContentView impactFeedbackGenerator](self, "impactFeedbackGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 2);
      -[CKMessageEntryContentView setImpactFeedbackGenerator:](self, "setImpactFeedbackGenerator:", v7);

      -[CKMessageEntryContentView impactFeedbackGenerator](self, "impactFeedbackGenerator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "prepare");

    }
    -[CKMessageEntryContentView textView](self, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v11, "lengthOfBytesUsingEncoding:", 4) <= 0x9F)
    {
      objc_msgSend(v11, "stringByAppendingString:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v12, "lengthOfBytesUsingEncoding:", 4) >= 0xA0)
      {
        -[CKMessageEntryContentView impactFeedbackGenerator](self, "impactFeedbackGenerator");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "impactOccurred");

      }
    }

  }
}

- (void)messageEntryRichTextView:(id)a3 replaceRange:(_NSRange)a4 withAttributedText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  length = a4.length;
  location = a4.location;
  v13 = (id)objc_msgSend(a5, "mutableCopy", a3);
  objc_msgSend(v13, "ck_replaceTextAnimationsWithIMTextEffects");
  objc_msgSend(v13, "ck_replaceBIUSWithIMTextStyles");
  -[CKMessageEntryContentView composition](self, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", location, length, v13);
  objc_msgSend(v8, "compositionByReplacingText:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryContentView setComposition:](self, "setComposition:", v11);

  -[CKMessageEntryContentView textEffectCoordinator](self, "textEffectCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateWithReason:", CFSTR("replaced text with a suggested effect/BIUS styles"));

}

- (double)maxWidthForPreviewImagesInMessageEntryRichTextView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[CKMessageEntryContentView maxPreviewContentWidthWhenExpanded](self, "maxPreviewContentWidthWhenExpanded", a3);
  v5 = v4;
  -[CKMessageEntryContentView containerViewLineWidth](self, "containerViewLineWidth");
  v7 = v5 + v6 * -2.0;
  -[CKMessageEntryContentView entryContentViewTextLeftOffset](self, "entryContentViewTextLeftOffset");
  v9 = v7 - v8;
  -[CKMessageEntryContentView sendButtonTextInsetWidth](self, "sendButtonTextInsetWidth");
  return v9 - v10;
}

- (double)_maxWidthForTextView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[CKMessageEntryContentView maxContentWidthWhenExpanded](self, "maxContentWidthWhenExpanded");
  v4 = v3;
  -[CKMessageEntryContentView containerViewLineWidth](self, "containerViewLineWidth");
  v6 = v4 + v5 * -2.0;
  -[CKMessageEntryContentView entryContentViewTextLeftOffset](self, "entryContentViewTextLeftOffset");
  v8 = v6 - v7;
  -[CKMessageEntryContentView sendButtonTextInsetWidth](self, "sendButtonTextInsetWidth");
  return v8 - v9;
}

- (void)messageEntryTextViewDidChangePencilMode:(id)a3
{
  id v4;

  -[CKMessageEntryContentView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryContentViewDidChangePencilMode:", self);

}

- (BOOL)messageEntryRichTextView:(id)a3 shouldPasteMediaObjects:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[CKMessageEntryContentView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "messageEntryContentView:shouldInsertMediaObjects:", self, v5);

  return (char)self;
}

- (void)messageEntryRichTextView:(id)a3 didTapMediaObject:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKMessageEntryContentView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryContentView:didTapMediaObject:", self, v5);

}

- (void)messageEntryRichTextViewWasTapped:(id)a3 isLongPress:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[CKMessageEntryContentView delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryContentViewWasTapped:isLongPress:", self, v4);

}

- (void)messageEntryRichTextView:(id)a3 pastedURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKMessageEntryContentView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryContentView:didPasteURL:", self, v5);

}

- (void)messageEntryRichTextViewDidTapHandwritingKey:(id)a3
{
  id v4;

  -[CKMessageEntryContentView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryContentViewDidTapHandwritingKey:", self);

}

- (BOOL)messageEntryRichTextViewSupportsInlineAdaptiveImageGlyphs:(id)a3
{
  void *v3;
  char v4;

  -[CKMessageEntryContentView conversation](self, "conversation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsInlineAdaptiveImageGlyphs");

  return v4;
}

- (BOOL)messageEntryRichTextView:(id)a3 shouldRecognizeGesture:(id)a4
{
  CKMessageEntryContentView *v4;
  void *v5;

  v4 = self;
  -[CKMessageEntryContentView delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "messageEntryContentViewShouldBeginEditing:", v4);

  return (char)v4;
}

- (BOOL)messageEntryRichTextViewShouldResignFirstResponder:(id)a3
{
  CKMessageEntryContentView *v3;
  void *v4;

  v3 = self;
  -[CKMessageEntryContentView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "messageEntryContentViewShouldResignFirstResponder:", v3);

  return (char)v3;
}

- (void)messageEntryRichTextView:(id)a3 didPasteComposition:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id obj;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "checksForSensitivityOnSend"))
  {
    v17 = v6;
    v18 = v5;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "mediaObjects");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
          objc_msgSend(MEMORY[0x1E0D39798], "sharedManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "fileURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKMessageEntryContentView conversation](self, "conversation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "chat");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "chatIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __74__CKMessageEntryContentView_messageEntryRichTextView_didPasteComposition___block_invoke;
          v20[3] = &unk_1E274B1A0;
          v20[4] = v11;
          objc_msgSend(v12, "isSensitiveContent:withChatID:completionHandler:", v13, v16, v20);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

    v6 = v17;
    v5 = v18;
  }

}

void __74__CKMessageEntryContentView_messageEntryRichTextView_didPasteComposition___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "filename");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("NO");
      if (a2)
        v9 = CFSTR("YES");
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Pasted asset %@ is sensitive: %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)messageEntryRichTextView:(id)a3 willAddPluginTextAttachmentViewControllerToViewHierarchy:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKMessageEntryContentView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryContentView:willAddPluginEntryViewControllerToViewHierarchy:", self, v5);

}

- (void)messageEntryRichTextView:(id)a3 didAddPluginTextAttachmentViewControllerToViewHierarchy:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKMessageEntryContentView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryContentView:didAddPluginEntryViewControllerToViewHierarchy:", self, v5);

}

- (double)balloonMaxWidthForMessageEntryRichTextView:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[CKMessageEntryContentView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonMaxWidthForMessageEntryRichTextView:", self);
  v6 = v5;

  return v6;
}

- (BOOL)messageEntryRichTextViewShouldAllowLinkCustomization:(id)a3
{
  CKMessageEntryContentView *v3;
  void *v4;

  v3 = self;
  -[CKMessageEntryContentView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "messageEntryContentViewShouldAllowLinkCustomization:", v3);

  return (char)v3;
}

- (void)messageEntryRichTextViewWillPresentCustomizationPicker:(id)a3
{
  id v4;

  -[CKMessageEntryContentView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryContentViewWillPresentCustomizationPicker:", self);

}

- (void)messageEntryRichTextViewDidPresentCustomizationPicker:(id)a3
{
  id v4;

  -[CKMessageEntryContentView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryContentViewDidPresentCustomizationPicker:", self);

}

- (void)messageEntryRichTextViewWillDismissCustomizationPicker:(id)a3
{
  id v4;

  -[CKMessageEntryContentView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryContentViewWillDismissCustomizationPicker:", self);

}

- (void)messageEntryRichTextViewDidDismissCustomizationPicker:(id)a3
{
  id v4;

  -[CKMessageEntryContentView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryContentViewDidDismissCustomizationPicker:", self);

}

- (BOOL)messageEntryRichTextView:(id)a3 canPerformDictationAction:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[CKMessageEntryContentView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v6, "messageEntryContentView:canPerformDictationAction:", self, v5);

  return (char)self;
}

- (void)messageEntryRichTextView:(id)a3 didTapGenerativeButtonForImageURL:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKMessageEntryContentView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryContentView:didRequestGenerativeContentForImageURL:", self, v5);

}

- (void)prepareTextEffectsForImmediateMessageSend
{
  id v2;

  -[CKMessageEntryContentView textEffectCoordinator](self, "textEffectCoordinator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (void)unpauseTextEffectsCoordinator
{
  void *v3;
  id v4;

  -[CKMessageEntryContentView textEffectCoordinator](self, "textEffectCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKMessageEntryContentView textEffectCoordinator](self, "textEffectCoordinator");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateWithReason:", CFSTR("unpausing"));

  }
}

- (void)messageEntryTextView:(id)a3 didSetAnimationName:(id)a4 forRange:(_NSRange)a5
{
  void *length;
  void *v6;
  id v9;
  id v10;
  id v11;
  CKTextEffectCoordinatorContinuationState *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24[3];
  unsigned __int8 v25;
  id location;
  NSRange v27;

  length = (void *)a5.length;
  v6 = (void *)a5.location;
  v9 = a3;
  v10 = a4;
  if (length)
  {
    location = 0;
    objc_initWeak(&location, self);
    v25 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __79__CKMessageEntryContentView_messageEntryTextView_didSetAnimationName_forRange___block_invoke;
    v21[3] = &unk_1E2756A88;
    objc_copyWeak(v24, &location);
    v11 = v9;
    v22 = v11;
    v23 = v10;
    v24[1] = v6;
    v24[2] = length;
    objc_msgSend(v11, "ck_toggleTextEffectNamed:inRange:getAdded:undo:", v23, v6, length, &v25, v21);
    -[CKMessageEntryContentView invalidateComposition](self, "invalidateComposition");
    if (v25)
    {
      v12 = -[CKTextEffectCoordinatorContinuationState initWithTextViewIdentifier:locationInAttributedText:ignoreTextViewEligibilityCheck:]([CKTextEffectCoordinatorContinuationState alloc], "initWithTextViewIdentifier:locationInAttributedText:ignoreTextViewEligibilityCheck:", CFSTR("textView"), objc_msgSend(v11, "selectedRange"), 0);
      -[CKMessageEntryContentView textEffectCoordinator](self, "textEffectCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "resetAndContinueFromState:", v12);

      v14 = v25;
    }
    else
    {
      v14 = 0;
    }
    v15 = (void *)MEMORY[0x1E0CB3940];
    v27.location = (NSUInteger)v6;
    v27.length = (NSUInteger)length;
    NSStringFromRange(v27);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = CFSTR("added");
    if (!v14)
      v18 = CFSTR("removed");
    objc_msgSend(v15, "stringWithFormat:", CFSTR("animation %@ for range: %@"), v18, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMessageEntryContentView textEffectCoordinator](self, "textEffectCoordinator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateWithReason:", v19);

    -[CKMessageEntryContentView _didChangeAttributesAffectingTextSize](self, "_didChangeAttributesAffectingTextSize");
    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }

}

void __79__CKMessageEntryContentView_messageEntryTextView_didSetAnimationName_forRange___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  CKTextEffectCoordinatorContinuationState *v13;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "invalidateComposition");

  v13 = -[CKTextEffectCoordinatorContinuationState initWithTextViewIdentifier:locationInAttributedText:ignoreTextViewEligibilityCheck:]([CKTextEffectCoordinatorContinuationState alloc], "initWithTextViewIdentifier:locationInAttributedText:ignoreTextViewEligibilityCheck:", CFSTR("textView"), objc_msgSend(*(id *)(a1 + 32), "selectedRange"), 0);
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "textEffectCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetAndContinueFromState:", v13);

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = *(_QWORD *)(a1 + 40);
  NSStringFromRange(*(NSRange *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("undo animation %@ for range: %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "textEffectCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateWithReason:", v9);

  v12 = objc_loadWeakRetained(v2);
  objc_msgSend(v12, "_didChangeAttributesAffectingTextSize");

}

- (void)messageEntryTextView:(id)a3 didUpdateForRange:(_NSRange)a4 conversionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];

  if (a4.length)
  {
    length = a4.length;
    location = a4.location;
    v8 = a5;
    -[CKMessageEntryContentView composition](self, "composition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ck_attributedStringByConverting:range:", v8, location, length);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "subject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shelfPluginPayload");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__CKMessageEntryContentView_messageEntryTextView_didUpdateForRange_conversionHandler___block_invoke;
    v14[3] = &unk_1E2756AB0;
    v14[4] = self;
    v14[5] = location;
    v14[6] = length;
    +[CKComposition compositionWithText:subject:shelfPluginPayload:completionHandler:](CKComposition, "compositionWithText:subject:shelfPluginPayload:completionHandler:", v11, v12, v13, v14);

  }
}

void __86__CKMessageEntryContentView_messageEntryTextView_didUpdateForRange_conversionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setComposition:", a2);
  v4 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "textView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectedRange:", v4, v3);

}

- (void)messageEntryTextView:(id)a3 applyStyleChangeOfType:(unint64_t)a4 add:(BOOL)a5 forRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v8;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  CKMessageEntryContentView *v26;
  unint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  BOOL v30;
  NSRange v31;

  length = a6.length;
  location = a6.location;
  v8 = a5;
  v11 = a3;
  v12 = v11;
  if (length && location != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v11, "undoManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __86__CKMessageEntryContentView_messageEntryTextView_applyStyleChangeOfType_add_forRange___block_invoke;
    v24 = &unk_1E2756AD8;
    v14 = v12;
    v30 = v8;
    v27 = a4;
    v28 = location;
    v29 = length;
    v25 = v14;
    v26 = self;
    objc_msgSend(v13, "registerUndoWithTarget:handler:", self, &v21);

    objc_msgSend(v14, "textStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "beginEditing");
    if (v8)
    {
      objc_msgSend(v15, "ck_addTextStyle:options:range:", a4, 3, location, length);
      v16 = CFSTR("added");
    }
    else
    {
      objc_msgSend(v15, "ck_removeTextStyle:options:range:", a4, 3, location, length);
      v16 = CFSTR("removed");
    }
    objc_msgSend(v15, "endEditing");
    -[CKMessageEntryContentView invalidateComposition](self, "invalidateComposition");
    v17 = (void *)MEMORY[0x1E0CB3940];
    v31.location = location;
    v31.length = length;
    NSStringFromRange(v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("animation %@ for range: %@"), v16, v18, v21, v22, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMessageEntryContentView textEffectCoordinator](self, "textEffectCoordinator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateWithReason:", v19);

    -[CKMessageEntryContentView _didChangeAttributesAffectingTextSize](self, "_didChangeAttributesAffectingTextSize");
  }

}

void __86__CKMessageEntryContentView_messageEntryTextView_applyStyleChangeOfType_add_forRange___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "textStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginEditing");
  objc_msgSend(v2, "ck_removeTextStyle:options:range:", *(_QWORD *)(a1 + 48), 3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_msgSend(v2, "endEditing");
  objc_msgSend(*(id *)(a1 + 40), "invalidateComposition");

}

- (void)_didChangeAttributesAffectingTextSize
{
  void *v3;

  -[CKMessageEntryContentView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageEntryContentViewDidChange:isTextChange:isShelfChange:", self, 1, 0);

  -[CKMessageEntryContentView setNeedsTextLayout:](self, "setNeedsTextLayout:", 1);
  -[CKMessageEntryContentView setNeedsEnsureSelectionVisible:](self, "setNeedsEnsureSelectionVisible:", 1);
  -[CKMessageEntryContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)pluginPayloadWantsResize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D35648]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("stagedShelfPlugin")) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v28 = 138412290;
          v29 = v7;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "A plugin that is NOT the shelf identifier {%@} was asked to reload. Bailing.", (uint8_t *)&v28, 0xCu);
        }

      }
      goto LABEL_22;
    }
  }
  else
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CKMessageEntryContentView pluginPayloadWantsResize:].cold.1(v9);

  }
  -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CKMessageEntryContentView setNeedsEnsureTextViewVisible:](self, "setNeedsEnsureTextViewVisible:", 1);
    -[CKMessageEntryContentView conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unsentComposition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "text");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMessageEntryContentView composition](self, "composition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "length") || !objc_msgSend(v13, "length"))
    {
      -[CKMessageEntryContentView textView](self, "textView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCompositionText:", v15);
    }
    else
    {
      -[CKMessageEntryContentView textView](self, "textView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setCompositionText:", v13);
    }

    -[CKMessageEntryContentView conversation](self, "conversation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unsentComposition");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMessageEntryContentView composition](self, "composition");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "subject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "length") || !objc_msgSend(v19, "length"))
    {
      -[CKMessageEntryContentView subjectView](self, "subjectView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCompositionText:", v21);
    }
    else
    {
      -[CKMessageEntryContentView textView](self, "textView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCompositionText:", v19);
    }

    -[CKMessageEntryContentView composition](self, "composition");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView setIsCompositionExpirable:](self, "setIsCompositionExpirable:", objc_msgSend(v23, "isExpirableComposition"));

    -[CKMessageEntryContentView _updateUI](self, "_updateUI");
    -[CKMessageEntryContentView delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "messageEntryContentViewShelfDidChange:", self);

    -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_opt_respondsToSelector();

    if ((v26 & 1) != 0)
    {
      -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "didFinishAnimatedBoundsChange");

    }
  }
LABEL_22:

}

- (void)pluginPayloadDidLoad:(id)a3
{
  -[CKMessageEntryContentView setNeedsTextLayout:](self, "setNeedsTextLayout:", 1);
  -[CKMessageEntryContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)quicktationEnablementDidChange
{
  -[CKMessageEntryContentView setNeedsTextLayout:](self, "setNeedsTextLayout:", 1);
  -[CKMessageEntryContentView setNeedsLayout](self, "setNeedsLayout");
}

- (void)ckSendLaterViewWantsDatePickerPresented:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Received request to present SendLater's DatePicker.", v7, 2u);
    }

  }
  -[CKMessageEntryContentView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryContentViewWantsSendLaterPickerPresented:", self);

}

- (void)ckSendLaterViewCancelled:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Received signal that SendLater was cancelled by the user.", v6, 2u);
    }

  }
  -[CKMessageEntryContentView setSendLaterPluginInfo:animated:completionHandler:](self, "setSendLaterPluginInfo:animated:completionHandler:", 0, 1, &__block_literal_global_150_0);

}

- (id)textDraggableView:(id)a3 itemsForDrag:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  void *v19;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryContentView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dragRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedTextInRange:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "length");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke;
  v17[3] = &unk_1E2756B48;
  v17[4] = self;
  v11 = v6;
  v18 = v11;
  v19 = v9;
  v12 = v9;
  objc_msgSend(v12, "enumerateAttributesInRange:options:usingBlock:", 0, v10, 0, v17);
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v5, "dragSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLocalContext:", CFSTR("CKMessageEntryContentViewDragContext"));

  }
  v14 = v19;
  v15 = v11;

  return v15;
}

void __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  CKAttributedStringItemProviderWriter *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  void *v40;
  _QWORD v41[4];
  id v42;

  v7 = a2;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("CKFileTransferGUIDAttributeName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("CKPluginPayloadGUIDAttributeName"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9)
    {
      objc_msgSend(a1[4], "textView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cachedMediaObjectForTransferGUID:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v13, "pasteboardItemProvider");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
          goto LABEL_17;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "transferForGUID:", v9);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "localURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithContentsOfURL:", v24);
        objc_msgSend(v24, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSuggestedName:", v25);

        if (!v14)
        {
LABEL_17:

          goto LABEL_18;
        }
      }
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v14);
      objc_msgSend(a1[4], "textView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setLocalObject:", v27);

      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0DC10F8]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        objc_msgSend(v28, "image");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v30);
          objc_msgSend(v31, "sizeToFit");
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_2;
          v41[3] = &unk_1E2756B20;
          v42 = v31;
          v32 = v31;
          objc_msgSend(v26, "setPreviewProvider:", v41);

        }
        objc_msgSend(a1[5], "addObject:", v26);

      }
      goto LABEL_17;
    }
    if (v10)
    {
      objc_msgSend(a1[4], "textView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "cachedPluginDisplayContainerForGUID:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "pasteboardItemProvider");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v17);
      objc_msgSend(a1[4], "textView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLocalObject:", v19);

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_3;
      v39[3] = &unk_1E2756B20;
      v40 = v16;
      v20 = v16;
      objc_msgSend(v18, "setPreviewProvider:", v39);
      objc_msgSend(a1[5], "addObject:", v18);
      v21 = v40;
    }
    else
    {
      objc_msgSend(a1[6], "attributedSubstringFromRange:", a3, a4);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "length") == 1)
      {
        objc_msgSend(v17, "string");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "characterAtIndex:", 0) == 10)
          goto LABEL_9;
        v33 = objc_msgSend(v17, "length");

        if (!v33)
          goto LABEL_10;
      }
      else if (!objc_msgSend(v17, "length"))
      {
        goto LABEL_10;
      }
      if (!v17)
        goto LABEL_18;
      v34 = objc_alloc(MEMORY[0x1E0CB36C8]);
      v35 = -[CKAttributedStringItemProviderWriter initWithAttributedString:]([CKAttributedStringItemProviderWriter alloc], "initWithAttributedString:", v17);
      v18 = (void *)objc_msgSend(v34, "initWithObject:", v35);

      v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA558]), "initWithItemProvider:", v18);
      objc_msgSend(a1[4], "textView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLocalObject:", v36);

      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_4;
      v37[3] = &unk_1E2756B20;
      v38 = v17;
      v17 = v17;
      objc_msgSend(v20, "setPreviewProvider:", v37);
      objc_msgSend(a1[5], "addObject:", v20);
      v21 = v38;
    }

LABEL_9:
LABEL_10:

LABEL_18:
  }

}

id __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CEA560]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = objc_alloc_init(MEMORY[0x1E0CEA568]);
  v5 = (void *)objc_msgSend(v2, "initWithView:parameters:", v3, v4);

  return v5;
}

id __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "composeImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v1);
  objc_msgSend(v2, "sizeToFit");
  objc_msgSend(v2, "frame");
  objc_msgSend(v2, "setFrame:");
  v3 = objc_alloc(MEMORY[0x1E0CEA560]);
  v4 = objc_alloc_init(MEMORY[0x1E0CEA568]);
  v5 = (void *)objc_msgSend(v3, "initWithView:parameters:", v2, v4);

  return v5;
}

id __60__CKMessageEntryContentView_textDraggableView_itemsForDrag___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x1E0CEAAD0]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setAttributedText:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "sizeToFit");
  v4 = objc_alloc(MEMORY[0x1E0CEA560]);
  v5 = objc_alloc_init(MEMORY[0x1E0CEA568]);
  v6 = (void *)objc_msgSend(v4, "initWithView:parameters:", v3, v5);

  return v6;
}

- (double)_calcuateIdealMaxPluginHeight:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;

  v3 = a3;
  -[CKMessageEntryContentView bounds](self, "bounds");
  v6 = v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entryViewlayoutMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEntryContentView _pluginMargins](self, "_pluginMargins");
  v10 = v9;
  v12 = v11;
  if (CKPixelWidth_once_11 != -1)
    dispatch_once(&CKPixelWidth_once_11, &__block_literal_global_716_0);
  v13 = *(double *)&CKPixelWidth_sPixel_11;
  objc_msgSend(v8, "defaultEntryContentViewHeight");
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pluginBundleID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "balloonPluginForBundleID:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "entryViewMaxExtensionShelfHeight");
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "entryViewMaxPluginShelfHeight");
  }
  v22 = fmin(v6 - v13 - v15 - v10 - v12, v21);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "entryViewMinPluginShelfHeight");
  v25 = fmax(v22, v24);

  return v25;
}

- (void)ensureSelectionVisibleIfNeeded
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double x;
  double v8;
  double y;
  double v10;
  double width;
  double v12;
  double height;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  CGFloat v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  CGFloat v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v37;
  id v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  if (-[CKMessageEntryContentView needsEnsureSelectionVisible](self, "needsEnsureSelectionVisible"))
  {
    -[CKMessageEntryContentView activeView](self, "activeView");
    v38 = (id)objc_claimAutoreleasedReturnValue();
    if (v38)
    {
      v4 = objc_msgSend(v38, "selectedRange");
      if (v3 <= 1)
        v5 = 1;
      else
        v5 = v3;
      objc_msgSend(v38, "_rectForScrollToVisible:", v4, v5);
      x = v6;
      y = v8;
      width = v10;
      height = v12;
      objc_msgSend(v38, "textStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");

      if (v4 == v15)
      {
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isTextKit2Enabled");

        if (v17)
        {
          v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
          v37 = *MEMORY[0x1E0C9D648];
          v19 = *(double *)(MEMORY[0x1E0C9D648] + 16);
          v20 = *(double *)(MEMORY[0x1E0C9D648] + 24);
          -[CKMessageEntryContentView textView](self, "textView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "textLayoutManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "textViewportLayoutController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "documentRange");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "endLocation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "relocateViewportToTextLocation:", v25);
          v27 = v26;

          objc_msgSend(v22, "textViewportLayoutController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v27;
          v30 = v37;
          objc_msgSend(v28, "adjustViewportByVerticalOffset:", v29);

          objc_msgSend(v22, "textViewportLayoutController");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "layoutViewport");

        }
        else
        {
          objc_msgSend(v38, "layoutManager");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "extraLineFragmentUsedRect");
          v30 = v32;
          v18 = v33;
          v19 = v34;
          v20 = v35;
        }

        if (v19 != *MEMORY[0x1E0C9D820] || v20 != *(double *)(MEMORY[0x1E0C9D820] + 8))
        {
          v39.origin.x = x;
          v39.origin.y = y;
          v39.size.width = width;
          v39.size.height = height;
          v41.origin.x = v30;
          v41.origin.y = v18;
          v41.size.width = v19;
          v41.size.height = v20;
          v40 = CGRectUnion(v39, v41);
          x = v40.origin.x;
          y = v40.origin.y;
          width = v40.size.width;
          height = v40.size.height;
        }
      }
      -[CKMessageEntryContentView convertRect:fromView:](self, "convertRect:fromView:", v38, x, y, width, height);
      -[CKMessageEntryContentView scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", 0);
    }
    -[CKMessageEntryContentView setNeedsEnsureSelectionVisible:](self, "setNeedsEnsureSelectionVisible:", 0);

  }
}

- (void)ensureTextViewVisibleIfNeeded
{
  if (-[CKMessageEntryContentView needsEnsureTextViewVisible](self, "needsEnsureTextViewVisible")
    || -[CKMessageEntryContentView forceEnsureTextViewVisble](self, "forceEnsureTextViewVisble"))
  {
    -[UIScrollView __ck_scrollToBottom:](self, "__ck_scrollToBottom:", 0);
    -[CKMessageEntryContentView setNeedsEnsureTextViewVisible:](self, "setNeedsEnsureTextViewVisible:", 0);
  }
}

- (void)invalidateComposition
{
  NSObject *v3;
  CKComposition *composition;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "invalidating composition", v5, 2u);
    }

  }
  composition = self->_composition;
  self->_composition = 0;

}

- (CGSize)_computedSizeForTextView:(id)a3 maxWidth:(double)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v5 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryViewCoverMinHeight");
  v8 = v7;

  objc_msgSend(v5, "sizeThatFits:", a4, 1.79769313e308);
  v10 = v9;

  v11 = fmax(v10, v8);
  v12 = a4;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)_layoutTextView:(id)a3 currentYOffset:(double *)a4 originX:(double)a5 maxWidth:(double)a6
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v10 = a3;
  -[CKMessageEntryContentView _computedSizeForTextView:maxWidth:](self, "_computedSizeForTextView:maxWidth:", v10, a6);
  v12 = v11;
  v14 = v13;
  objc_msgSend(v10, "textContainerInset");
  v16 = a5 - v15;
  v17 = *a4;
  -[CKMessageEntryContentView placeHolderWidth](self, "placeHolderWidth");
  objc_msgSend(v10, "setPlaceHolderWidth:");
  objc_msgSend(v10, "setFrame:", v16, v17, v12, v14);

  *a4 = v14 + *a4;
}

- (void)_layoutDividerLine:(id)a3 leftInset:(double)a4 widthInset:(double)a5 currentYOffset:(double *)a6
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v10 = a3;
  -[CKMessageEntryContentView containerViewLineWidth](self, "containerViewLineWidth");
  v12 = v11 + a4;
  v13 = *a6;
  -[CKMessageEntryContentView bounds](self, "bounds");
  v15 = v14 - a5;
  -[CKMessageEntryContentView containerViewLineWidth](self, "containerViewLineWidth");
  v17 = v15 + v16 * -2.0;
  if (CKPixelWidth_once_11 != -1)
    dispatch_once(&CKPixelWidth_once_11, &__block_literal_global_716_0);
  objc_msgSend(v10, "setFrame:", v12, v13, v17, *(double *)&CKPixelWidth_sPixel_11);

  v18 = *a6;
  if (CKPixelWidth_once_11 != -1)
    dispatch_once(&CKPixelWidth_once_11, &__block_literal_global_716_0);
  *a6 = v18 + *(double *)&CKPixelWidth_sPixel_11;
}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (self->_pluginEntryViewController)
  {
    CKFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ADD_COMMENT_OR_SEND"), &stru_1E276D870, CFSTR("ChatKit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView setOverridePlaceholderText:](self, "setOverridePlaceholderText:", v4);

  }
  else
  {
    -[CKMessageEntryContentView setOverridePlaceholderText:](self, "setOverridePlaceholderText:", 0);
  }
  -[CKMessageEntryContentView overridePlaceholderText](self, "overridePlaceholderText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[CKMessageEntryContentView overridePlaceholderText](self, "overridePlaceholderText");
  else
    -[CKMessageEntryContentView requestedPlaceholderText](self, "requestedPlaceholderText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryContentView textView](self, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlaceholderText:", v6);

  -[CKMessageEntryContentView containerViewLineWidth](self, "containerViewLineWidth");
  v9 = v8 + 17.0;
  -[CKMessageEntryContentView containerViewLineWidth](self, "containerViewLineWidth");
  v11 = v10 + 17.0;
  -[CKMessageEntryContentView containerViewLineWidth](self, "containerViewLineWidth");
  -[CKMessageEntryContentView setScrollIndicatorInsets:](self, "setScrollIndicatorInsets:", v9, 0.0, v11, v12 + 5.0);
  -[CKMessageEntryContentView setNeedsTextLayout:](self, "setNeedsTextLayout:", 1);
  -[CKMessageEntryContentView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)shouldShowClearButton
{
  char v2;
  void *v4;
  void *v5;

  if (self->_shouldHideClearPluginButton)
    return 0;
  -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v5, "wantsClearButton");

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)shouldShowGenerationButton
{
  return 0;
}

- (BOOL)_currentPluginIsGPPlugin
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)clearPluginButtonTapped:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  -[CKMessageEntryContentView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKMessageEntryContentView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEntryContentViewCancelWasTapped:shelfPluginPayload:", self, v7);

  }
  -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CKMessageEntryContentView pluginEntryViewController](self, "pluginEntryViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "payloadWillClear");

  }
  -[CKComposition cleanupCKShareFromComposition](self->_composition, "cleanupCKShareFromComposition");
  -[CKMessageEntryContentView setShelfPluginPayload:](self, "setShelfPluginPayload:", 0);
  -[CKMessageEntryContentView invalidateComposition](self, "invalidateComposition");
  -[CKMessageEntryContentView setPluginEntryViewController:](self, "setPluginEntryViewController:", 0);
}

- (void)setContainerViewLineWidth:(double)a3
{
  if (self->_containerViewLineWidth != a3)
  {
    self->_containerViewLineWidth = a3;
    -[CKMessageEntryContentView _updateUI](self, "_updateUI");
  }
}

- (void)setClearPluginButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKMessageEntryContentView clearPluginButton](self, "clearPluginButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setSendButtonTextInsetWidth:(double)a3
{
  if (self->_sendButtonTextInsetWidth != a3)
  {
    self->_sendButtonTextInsetWidth = a3;
    -[CKMessageEntryContentView setNeedsTextLayout:](self, "setNeedsTextLayout:", 1);
    -[CKMessageEntryContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMaxPluginShelfViewWidth:(double)a3
{
  if (self->_maxPluginShelfViewWidth != a3)
  {
    self->_maxPluginShelfViewWidth = a3;
    -[CKMessageEntryContentView setNeedsTextLayout:](self, "setNeedsTextLayout:", 1);
    -[CKMessageEntryContentView setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (id)_createTextView:(BOOL)a3 shouldUseNonEmojiKeyboard:(BOOL)a4 shouldUseNonHandwritingKeyboard:(BOOL)a5 shouldDisableKeyboardStickers:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v11;
  uint64_t v12;
  CKMessageEntryRichTextView *v13;
  CKMessageEntryRichTextView *v14;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isTextKit2Enabled");

  v13 = [CKMessageEntryRichTextView alloc];
  v14 = -[CKMessageEntryRichTextView initWithFrame:usingTextLayoutManager:shouldDisableAttachments:shouldDisableKeyboardStickers:](v13, "initWithFrame:usingTextLayoutManager:shouldDisableAttachments:shouldDisableKeyboardStickers:", v12, v9, v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(a1, "configureMessageBodyEntryTextView:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:", v14, v8, v7);
  return v14;
}

+ (void)configureMessageBodyEntryTextView:(id)a3 shouldUseNonEmojiKeyboard:(BOOL)a4 shouldUseNonHandwritingKeyboard:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v5 = a5;
  v6 = a4;
  v18 = a3;
  objc_msgSend(v18, "setShowsHorizontalScrollIndicator:", 1);
  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MADRID"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPlaceholderText:", v8);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "balloonTextFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v10);

  objc_msgSend(v18, "setSupportsBigEmojiTextStyles:", 1);
  objc_msgSend(v18, "setBackgroundColor:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "theme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entryFieldTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v13);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "theme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setKeyboardAppearance:", objc_msgSend(v15, "keyboardAppearance"));

  if (!CKIsRunningInMessagesNotificationExtension())
  {
    v16 = 126;
    if (v5)
      v16 = 0;
    if (v6)
      v17 = 13;
    else
      v17 = v16;
    objc_msgSend(v18, "setKeyboardType:", v17);
  }
  objc_msgSend(v18, "setOpaque:", 0);

}

+ (id)_createSubjectView
{
  void *v2;
  int v3;
  CKMessageEntryTextView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CKMessageEntryTextView *v9;
  CKMessageEntryTextView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isTextKit2Enabled");

  v4 = [CKMessageEntryTextView alloc];
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (v3)
    v9 = -[CKMessageEntryTextView initUsingTextLayoutManagerWithFrame:](v4, "initUsingTextLayoutManagerWithFrame:", v5, v6, v7, v8);
  else
    v9 = -[CKMessageEntryTextView initWithFrame:textContainer:](v4, "initWithFrame:textContainer:", 0, v5, v6, v7, v8);
  v10 = v9;
  -[CKMessageEntryTextView setShowsHorizontalScrollIndicator:](v9, "setShowsHorizontalScrollIndicator:", 1);
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SUBJECT"), &stru_1E276D870, CFSTR("ChatKit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView setPlaceholderText:](v10, "setPlaceholderText:", v12);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "balloonSubjectFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView setFont:](v10, "setFont:", v14);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "theme");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "entryFieldTextColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView setTextColor:](v10, "setTextColor:", v17);

  -[CKMessageEntryTextView setSupportsBigEmojiTextStyles:](v10, "setSupportsBigEmojiTextStyles:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "theme");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextView setKeyboardAppearance:](v10, "setKeyboardAppearance:", objc_msgSend(v19, "keyboardAppearance"));

  -[CKMessageEntryTextView setBackgroundColor:](v10, "setBackgroundColor:", 0);
  -[CKMessageEntryTextView setOpaque:](v10, "setOpaque:", 0);
  return v10;
}

- (id)pluginSnapshotViewForPluginAtIndex:(unint64_t)a3 isFromTextAttachment:(BOOL *)a4 startingScaleMultiplier:(double *)a5
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v16;
  void *v17;
  _QWORD v18[9];
  _QWORD v19[4];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  -[CKMessageEntryContentView pluginView](self, "pluginView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_4;
  if (a3)
  {
    --a3;
LABEL_4:
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__48;
    v24 = __Block_byref_object_dispose__48;
    v25 = 0;
    -[CKMessageEntryContentView textView](self, "textView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributedText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    v12 = objc_msgSend(v11, "length");
    v13 = *MEMORY[0x1E0DC10F8];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __109__CKMessageEntryContentView_pluginSnapshotViewForPluginAtIndex_isFromTextAttachment_startingScaleMultiplier___block_invoke;
    v18[3] = &unk_1E2756B70;
    v18[6] = a3;
    v18[7] = a4;
    v18[8] = a5;
    v18[4] = v19;
    v18[5] = &v20;
    objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v13, 0, v12, 0, v18);
    v14 = (id)v21[5];
    _Block_object_dispose(v19, 8);

    _Block_object_dispose(&v20, 8);
    return v14;
  }
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 1.0;
  -[CKMessageEntryContentView pluginView](self, "pluginView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "snapshotViewAfterScreenUpdates:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __109__CKMessageEntryContentView_pluginSnapshotViewForPluginAtIndex_isFromTextAttachment_startingScaleMultiplier___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;
  char isKindOfClass;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v7 = a2;
  if (v7)
  {
    v18 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v18;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = v18;
      v10 = v9;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(_QWORD *)(v11 + 24);
      if (v12 == *(_QWORD *)(a1 + 48))
      {
        v13 = *(_BYTE **)(a1 + 56);
        if (v13)
          *v13 = 1;
        if (*(_QWORD *)(a1 + 64))
        {
          objc_msgSend(v9, "downscaleMultiplier");
          **(_QWORD **)(a1 + 64) = v14;
        }
        objc_msgSend(v10, "makeThrowAnimationSnapshotView");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v17 = *(void **)(v16 + 40);
        *(_QWORD *)(v16 + 40) = v15;

        *a5 = 1;
      }
      else
      {
        *(_QWORD *)(v11 + 24) = v12 + 1;
      }

      v7 = v18;
    }
  }

}

- (void)balloonPluginDataSource:(id)a3 shouldSendAsCopy:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;
  id v20;
  CKMessageEntryContentView *v21;

  v4 = a4;
  v6 = a3;
  -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSendAsCopy:", v4);

  -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendAsCopyURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CKMessageEntryContentView shelfPluginPayload](self, "shelfPluginPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendAsCopyURL");
    v13 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
  }
  if (v9)
  {
    objc_msgSend(v9, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByRemovingPercentEncoding");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__CKMessageEntryContentView_balloonPluginDataSource_shouldSendAsCopy___block_invoke;
    v18[3] = &unk_1E2756B98;
    v19 = v9;
    v20 = v15;
    v21 = self;
    v16 = v15;
    +[CKComposition mediaObjectFromItemAtURL:filename:completion:](CKComposition, "mediaObjectFromItemAtURL:filename:completion:", v19, v16, v18);

  }
  else
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_6;
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "URL is nil so we don't create a composition", v17, 2u);
    }
  }

LABEL_6:
}

void __70__CKMessageEntryContentView_balloonPluginDataSource_shouldSendAsCopy___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  CKComposition *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = a1[4];
      v9 = a1[5];
      v17 = 138413058;
      v18 = v5;
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Created mediaObject:%@ from url:%@, filename:%@. Error: %@", (uint8_t *)&v17, 0x2Au);
    }

  }
  v10 = objc_alloc_init(CKComposition);
  v12 = (void *)a1[6];
  v11 = (id *)(a1 + 6);
  objc_msgSend(v12, "shelfPluginPayload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKComposition compositionByAppendingText:shelfPluginPayload:shelfMediaObject:collaborationShareOptions:](v10, "compositionByAppendingText:shelfPluginPayload:shelfMediaObject:collaborationShareOptions:", 0, v13, v5, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v11, "composition");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "compositionByAppendingCollaborativeComposition:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*v11, "setComposition:", v16);
}

- (BOOL)textEffectCoordinator:(id)a3 textViewIdentifierIsCandidateForTextEffectPlayback:(id)a4
{
  return 1;
}

- (id)visibleTextViewIdentifiersFor:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("textView");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)textEffectCoordinator:(id)a3 highPriorityTextViewIdentifiersForUnplayedVisibleTextViewIdentifiers:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)canStartNewTextAnimationsInTextEffectCoordinator:(id)a3
{
  return 1;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)shouldShowSubject
{
  return self->_shouldShowSubject;
}

- (void)setShouldShowSubject:(BOOL)a3
{
  self->_shouldShowSubject = a3;
}

- (BOOL)shouldHideClearPluginButton
{
  return self->_shouldHideClearPluginButton;
}

- (void)setShouldHideClearPluginButton:(BOOL)a3
{
  self->_shouldHideClearPluginButton = a3;
}

- (CKMessageEntryTextView)subjectView
{
  return self->_subjectView;
}

- (void)setSubjectView:(id)a3
{
  objc_storeStrong((id *)&self->_subjectView, a3);
}

- (CKMessageEntryRichTextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (CKSendLaterPluginInfo)sendLaterPluginInfo
{
  return self->_sendLaterPluginInfo;
}

- (CKSendLaterView)sendLaterView
{
  return self->_sendLaterView;
}

- (void)setSendLaterView:(id)a3
{
  objc_storeStrong((id *)&self->_sendLaterView, a3);
}

- (UIView)pluginDividerLine
{
  return self->_pluginDividerLine;
}

- (void)setPluginDividerLine:(id)a3
{
  objc_storeStrong((id *)&self->_pluginDividerLine, a3);
}

- (void)setActiveView:(id)a3
{
  objc_storeWeak((id *)&self->_activeView, a3);
}

- (IMPluginPayload)shelfPluginPayload
{
  return self->_shelfPluginPayload;
}

- (void)setShelfPluginPayload:(id)a3
{
  objc_storeStrong((id *)&self->_shelfPluginPayload, a3);
}

- (BOOL)ignoreEndEditing
{
  return self->_ignoreEndEditing;
}

- (void)setIgnoreEndEditing:(BOOL)a3
{
  self->_ignoreEndEditing = a3;
}

- (CKMentionsAnimationController)mentionsController
{
  return self->_mentionsController;
}

- (void)setMentionsController:(id)a3
{
  objc_storeStrong((id *)&self->_mentionsController, a3);
}

- (double)placeHolderWidth
{
  return self->_placeHolderWidth;
}

- (BOOL)shouldStripEmojis
{
  return self->_shouldStripEmojis;
}

- (BOOL)forceEnsureTextViewVisble
{
  return self->_forceEnsureTextViewVisble;
}

- (void)setForceEnsureTextViewVisble:(BOOL)a3
{
  self->_forceEnsureTextViewVisble = a3;
}

- (BOOL)needsEnsureTextViewVisible
{
  return self->_needsEnsureTextViewVisible;
}

- (void)setNeedsEnsureTextViewVisible:(BOOL)a3
{
  self->_needsEnsureTextViewVisible = a3;
}

- (double)maxContentWidthWhenExpanded
{
  return self->_maxContentWidthWhenExpanded;
}

- (void)setMaxContentWidthWhenExpanded:(double)a3
{
  self->_maxContentWidthWhenExpanded = a3;
}

- (double)maxPreviewContentWidthWhenExpanded
{
  return self->_maxPreviewContentWidthWhenExpanded;
}

- (void)setMaxPreviewContentWidthWhenExpanded:(double)a3
{
  self->_maxPreviewContentWidthWhenExpanded = a3;
}

- (double)containerViewLineWidth
{
  return self->_containerViewLineWidth;
}

- (double)sendButtonTextInsetWidth
{
  return self->_sendButtonTextInsetWidth;
}

- (double)maxPluginShelfViewWidth
{
  return self->_maxPluginShelfViewWidth;
}

- (CKPluginEntryViewController)pluginEntryViewController
{
  return self->_pluginEntryViewController;
}

- (CKConversation)conversation
{
  return (CKConversation *)objc_loadWeakRetained((id *)&self->_conversation);
}

- (void)setConversation:(id)a3
{
  objc_storeWeak((id *)&self->_conversation, a3);
}

- (_TtC7ChatKit23CKTextEffectCoordinator)textEffectCoordinator
{
  return self->_textEffectCoordinator;
}

- (void)setTextEffectCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_textEffectCoordinator, a3);
}

- (UIView)textAndSubjectDividerLine
{
  return self->_textAndSubjectDividerLine;
}

- (void)setTextAndSubjectDividerLine:(id)a3
{
  objc_storeStrong((id *)&self->_textAndSubjectDividerLine, a3);
}

- (BOOL)needsTextLayout
{
  return self->_needsTextLayout;
}

- (void)setNeedsTextLayout:(BOOL)a3
{
  self->_needsTextLayout = a3;
}

- (BOOL)needsEnsureSelectionVisible
{
  return self->_needsEnsureSelectionVisible;
}

- (void)setNeedsEnsureSelectionVisible:(BOOL)a3
{
  self->_needsEnsureSelectionVisible = a3;
}

- (BOOL)isCompositionExpirable
{
  return self->_isCompositionExpirable;
}

- (void)setIsCompositionExpirable:(BOOL)a3
{
  self->_isCompositionExpirable = a3;
}

- (BOOL)shouldSkipRemovalFromParent
{
  return self->_shouldSkipRemovalFromParent;
}

- (void)setShouldSkipRemovalFromParent:(BOOL)a3
{
  self->_shouldSkipRemovalFromParent = a3;
}

- (UIButton)clearPluginButton
{
  return self->_clearPluginButton;
}

- (void)setClearPluginButton:(id)a3
{
  objc_storeStrong((id *)&self->_clearPluginButton, a3);
}

- (NSString)requestedPlaceholderText
{
  return self->_requestedPlaceholderText;
}

- (void)setRequestedPlaceholderText:(id)a3
{
  objc_storeStrong((id *)&self->_requestedPlaceholderText, a3);
}

- (NSString)overridePlaceholderText
{
  return self->_overridePlaceholderText;
}

- (void)setOverridePlaceholderText:(id)a3
{
  objc_storeStrong((id *)&self->_overridePlaceholderText, a3);
}

- (BOOL)pendingShelfPayloadWillAnimateIn
{
  return self->_pendingShelfPayloadWillAnimateIn;
}

- (void)setPendingShelfPayloadWillAnimateIn:(BOOL)a3
{
  self->_pendingShelfPayloadWillAnimateIn = a3;
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (void)setBizIntent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2280);
}

- (CKMediaObject)shelfMediaObject
{
  return self->_shelfMediaObject;
}

- (void)setShelfMediaObject:(id)a3
{
  objc_storeStrong((id *)&self->_shelfMediaObject, a3);
}

- (_SWCollaborationShareOptions)collaborationShareOptions
{
  return self->_collaborationShareOptions;
}

- (void)setCollaborationShareOptions:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationShareOptions, a3);
}

- (NSArray)collaborationOptions
{
  return self->_collaborationOptions;
}

- (void)setCollaborationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationOptions, a3);
}

- (UIImpactFeedbackGenerator)impactFeedbackGenerator
{
  return self->_impactFeedbackGenerator;
}

- (void)setImpactFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impactFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_collaborationOptions, 0);
  objc_storeStrong((id *)&self->_collaborationShareOptions, 0);
  objc_storeStrong((id *)&self->_shelfMediaObject, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_overridePlaceholderText, 0);
  objc_storeStrong((id *)&self->_requestedPlaceholderText, 0);
  objc_storeStrong((id *)&self->_clearPluginButton, 0);
  objc_storeStrong((id *)&self->_textAndSubjectDividerLine, 0);
  objc_storeStrong((id *)&self->_textEffectCoordinator, 0);
  objc_destroyWeak((id *)&self->_conversation);
  objc_storeStrong((id *)&self->_pluginEntryViewController, 0);
  objc_storeStrong((id *)&self->_mentionsController, 0);
  objc_storeStrong((id *)&self->_shelfPluginPayload, 0);
  objc_destroyWeak((id *)&self->_activeView);
  objc_storeStrong((id *)&self->_pluginDividerLine, 0);
  objc_storeStrong((id *)&self->_sendLaterView, 0);
  objc_storeStrong((id *)&self->_sendLaterPluginInfo, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_subjectView, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_textViewRespondsToShowTextFormattingAnimationOptions, 0);
}

- (id)richLinksEditMenuForAttributedText:(id)a3 inRange:(_NSRange)a4
{
  void *length;
  void *v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, void *);
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38[3];
  _QWORD v39[4];
  id v40;
  id v41;
  id location[2];

  length = (void *)a4.length;
  v5 = (void *)a4.location;
  v7 = a3;
  if (length)
  {
    if ((objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown") & 1) != 0)
    {
      length = 0;
    }
    else
    {
      location[0] = 0;
      objc_initWeak(location, self);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKRichLinkUtilities validURLsInString:inRange:](_TtC7ChatKit19CKRichLinkUtilities, "validURLsInString:inRange:", v9, v5, length);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "count");
      v12 = MEMORY[0x1E0C809B0];
      if (v11)
      {
        if ((unint64_t)objc_msgSend(v10, "count") >= 2)
        {
          CKFrameworkBundle();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SHOW_LINK_PREVIEW_PLURAL"), &stru_1E276D870, CFSTR("ChatKit"));
        }
        else
        {
          CKFrameworkBundle();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SHOW_LINK_PREVIEW"), &stru_1E276D870, CFSTR("ChatKit"));
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0CEA2A8];
        v39[0] = v12;
        v39[1] = 3221225472;
        v39[2] = __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke;
        v39[3] = &unk_1E2757858;
        v40 = v10;
        objc_copyWeak(&v41, location);
        objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v14, 0, 0, v39);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        objc_destroyWeak(&v41);
      }
      objc_msgSend(v7, "ck_linkPreviewTextAttachmentsInRange:", v5, length);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count"))
      {
        if ((unint64_t)objc_msgSend(v17, "count") >= 2)
        {
          CKFrameworkBundle();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CONVERT_TO_TEXT_LINK_PLURAL"), &stru_1E276D870, CFSTR("ChatKit"));
        }
        else
        {
          CKFrameworkBundle();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CONVERT_TO_TEXT_LINK"), &stru_1E276D870, CFSTR("ChatKit"));
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = (void *)MEMORY[0x1E0CEA2A8];
        v35[0] = v12;
        v35[1] = 3221225472;
        v35[2] = __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke_66;
        v35[3] = &unk_1E275A8D8;
        v36 = v17;
        v38[1] = v5;
        v38[2] = length;
        objc_copyWeak(v38, location);
        v37 = v7;
        objc_msgSend(v20, "actionWithTitle:image:identifier:handler:", v19, 0, 0, v35);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v21);

        objc_destroyWeak(v38);
      }
      if (objc_msgSend(v17, "count") == 1)
      {
        objc_msgSend(v17, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "canPresentCustomizationPicker"))
        {
          CKFrameworkBundle();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("CUSTOMIZE_LINK"), &stru_1E276D870, CFSTR("ChatKit"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = (void *)MEMORY[0x1E0CEA2A8];
          v30 = v12;
          v31 = 3221225472;
          v32 = __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke_69;
          v33 = &unk_1E274B178;
          v34 = v22;
          objc_msgSend(v25, "actionWithTitle:image:identifier:handler:", v24, 0, 0, &v30);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v26, v30, v31, v32, v33);

        }
      }
      v27 = (void *)MEMORY[0x1E0CEA740];
      v28 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v27, "menuWithTitle:image:identifier:options:children:", &stru_1E276D870, 0, 0, 1, v28);
      length = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(location);
    }
  }

  return length;
}

void __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      v12 = 134217984;
      v13 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Will replace {%ld} detected URL(s) with rich links.", (uint8_t *)&v12, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "textView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  v10 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v10, "textView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "replaceTextInRange:withLinks:", 0, v9, *(_QWORD *)(a1 + 32));

}

void __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "count");
      NSStringFromRange(*(NSRange *)(a1 + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218242;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Converting a selection that includes {%ld} inlined rich links to text. In range={%@}}.", (uint8_t *)&v8, 0x16u);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_updateAttributedTextContent:byApplyingInteraction:toLinkTextAttachments:", *(_QWORD *)(a1 + 40), 2, *(_QWORD *)(a1 + 32));

}

void __83__CKMessageEntryContentView_RichLinks__richLinksEditMenuForAttributedText_inRange___block_invoke_69(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Invoking presentCustomizationPicker on a rich link text attachment via callout menu...", v5, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "presentCustomizationPicker");

}

- (void)_updateAttributedTextContent:(id)a3 byApplyingInteraction:(int64_t)a4 toLinkTextAttachments:(id)a5
{
  void *v6;
  void *v7;
  char v8;

  v8 = 0;
  objc_msgSend(a3, "ck_attributedStringByApplyingRichLinkInteraction:toLinkTextAttachments:stringDidChange:", a4, a5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CKMessageEntryContentView textView](self, "textView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v6);

  }
}

- (void)pluginPayloadWantsResize:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "A plugin was updated without a staging identifier! Programming error.", v1, 2u);
}

@end
