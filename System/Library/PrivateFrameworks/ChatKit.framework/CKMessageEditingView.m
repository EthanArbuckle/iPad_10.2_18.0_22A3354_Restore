@implementation CKMessageEditingView

- (void)modifySelectedTextByTogglingTextEffectType:(int64_t)a3
{
  id v4;

  -[CKMessageEditingView messageEditingBalloonView](self, "messageEditingBalloonView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifySelectedTextByTogglingTextEffectType:", a3);

}

- (void)modifySelectedTextByTogglingTextStyle:(unint64_t)a3
{
  id v4;

  -[CKMessageEditingView messageEditingBalloonView](self, "messageEditingBalloonView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifySelectedTextByTogglingTextStyle:", a3);

}

- (CKMessageEditingView)initWithMessageEditingViewDelegate:(id)a3
{
  id v4;
  CKMessageEditingView *v5;
  CKMessageEditingView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CKMessageEditingView;
  v5 = -[CKMessageEditingView init](&v32, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_messageEditingViewState = 0;
    -[CKMessageEditingView setMessageEditingViewDelegate:](v5, "setMessageEditingViewDelegate:", v4);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageEditingRejectButtonBaseConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageEditingRejectButtonImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v10);

    location = 0;
    objc_initWeak(&location, v6);
    v11 = (void *)MEMORY[0x1E0CEA2A8];
    v12 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __59__CKMessageEditingView_initWithMessageEditingViewDelegate___block_invoke;
    v29[3] = &unk_1E274A4C0;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v11, "actionWithHandler:", v29);
    v13 = objc_claimAutoreleasedReturnValue();
    +[CKCustomButton buttonWithConfiguration:primaryAction:](CKCustomButton, "buttonWithConfiguration:primaryAction:", v8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_rejectButton, v14);
    -[CKMessageEditingView addSubview:](v6, "addSubview:", v6->_rejectButton);
    v26 = (void *)v13;
    -[CKMessageEditingView messageEditingViewDelegate](v6, "messageEditingViewDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "messageEditingColor");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "messageEditingConfirmButtonBaseConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updateMessageEditingConfirmButtonConfiguration:forButtonColor:isEnabled:", v18, v16, 1);

    v20 = (void *)MEMORY[0x1E0CEA2A8];
    v27[0] = v12;
    v27[1] = 3221225472;
    v27[2] = __59__CKMessageEditingView_initWithMessageEditingViewDelegate___block_invoke_2;
    v27[3] = &unk_1E274A4C0;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v20, "actionWithHandler:", v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKCustomButton buttonWithConfiguration:primaryAction:](CKCustomButton, "buttonWithConfiguration:primaryAction:", v18, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_confirmButton, v22);
    -[CKMessageEditingView addSubview:](v6, "addSubview:", v6->_confirmButton);
    v23 = (objc_class *)objc_opt_class();
    CKBalloonViewForClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setEditingBalloonViewDelegate:", v6);
    objc_msgSend(v24, "setHasTail:", 1);
    objc_msgSend(v24, "setOrientation:", 1);
    objc_msgSend(v24, "setBalloonShape:", 0);
    objc_msgSend(v24, "setCanUseOpaqueMask:", 0);
    objc_storeStrong((id *)&v6->_messageEditingBalloonView, v24);
    -[CKMessageEditingView addSubview:](v6, "addSubview:", v6->_messageEditingBalloonView);
    -[CKMessageEditingView updateKeyboardActionButtonIfNeeded](v6, "updateKeyboardActionButtonIfNeeded");

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
  return v6;
}

void __59__CKMessageEditingView_initWithMessageEditingViewDelegate___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_rejectButtonSelected:", v4);
}

void __59__CKMessageEditingView_initWithMessageEditingViewDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_confirmButtonSelected:", v4);
}

- (UIView)balloonViewForAlignment
{
  return (UIView *)self->_messageEditingBalloonView;
}

- (void)setOriginalComposition:(id)a3
{
  objc_storeStrong((id *)&self->_originalComposition, a3);
  -[CKMessageEditingView _updateTextFieldWithOriginalComposition](self, "_updateTextFieldWithOriginalComposition");
}

- (void)_updateTextFieldWithOriginalComposition
{
  void *v3;
  id v4;

  -[CKComposition text](self->_originalComposition, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMessageEditingView styledAttributedStringFromString:](self, "styledAttributedStringFromString:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTextBalloonView setAttributedText:](self->_messageEditingBalloonView, "setAttributedText:", v3);
  -[CKTextBalloonView prepareForDisplay](self->_messageEditingBalloonView, "prepareForDisplay");
  -[CKMessageEditingView setNeedsLayout](self, "setNeedsLayout");

}

- (id)styledAttributedStringFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balloonParagraphStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v7, 0, objc_msgSend(v5, "length"));
  v8 = objc_msgSend(v5, "length");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "balloonTextFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CKBalloonView color](self->_messageEditingBalloonView, "color");
  v12 = objc_msgSend(v5, "__ck_bigEmojiStyle");
  if ((unint64_t)(v12 - 1) >= 3)
  {
    v16 = 0;
    if (v12)
      goto LABEL_8;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "theme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "balloonTextColorForColorType:", v11);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "theme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transcriptBigEmojiColor");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;

LABEL_8:
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v16, 0, v8);
  objc_msgSend(v5, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v10, 0, v8);
  -[CKMessageEditingView _insertAdaptiveImageGlyphs:](self, "_insertAdaptiveImageGlyphs:", v5);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isExpressiveTextEnabled");

  if (v18)
    -[CKMessageEditingView _applyExpressiveTextFormattingToAttributedText:forCompositionText:](self, "_applyExpressiveTextFormattingToAttributedText:forCompositionText:", v5, v4);
  v19 = (void *)objc_msgSend(v5, "copy");

  return v19;
}

- (void)_applyExpressiveTextFormattingToAttributedText:(id)a3 forCompositionText:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "length");
  v8 = *MEMORY[0x1E0D393F0];
  v9 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke;
  v36[3] = &unk_1E274EF20;
  v10 = v5;
  v37 = v10;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v36);
  v11 = *MEMORY[0x1E0D39428];
  v12 = objc_msgSend(v6, "length");
  v34[0] = v9;
  v34[1] = 3221225472;
  v34[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_2;
  v34[3] = &unk_1E274EF20;
  v13 = v10;
  v35 = v13;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v34);
  v14 = *MEMORY[0x1E0D39440];
  v15 = objc_msgSend(v6, "length");
  v32[0] = v9;
  v32[1] = 3221225472;
  v32[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_3;
  v32[3] = &unk_1E274EF20;
  v16 = v13;
  v33 = v16;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v14, 0, v15, 0, v32);
  v17 = *MEMORY[0x1E0D393E8];
  v18 = objc_msgSend(v6, "length");
  v30[0] = v9;
  v30[1] = 3221225472;
  v30[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_4;
  v30[3] = &unk_1E274EF20;
  v19 = v16;
  v31 = v19;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v17, 0, v18, 0, v30);
  v20 = *MEMORY[0x1E0D39420];
  v21 = objc_msgSend(v6, "length");
  v28[0] = v9;
  v28[1] = 3221225472;
  v28[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_5;
  v28[3] = &unk_1E274EF20;
  v22 = v19;
  v29 = v22;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v20, 0, v21, 0, v28);
  v23 = *MEMORY[0x1E0D381F0];
  v24 = objc_msgSend(v6, "length");
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_6;
  v26[3] = &unk_1E274EF20;
  v27 = v22;
  v25 = v22;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v23, 0, v24, 0, v26);

}

void __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "ck_applyTextEffectType:range:", objc_msgSend(v7, "integerValue"), a3, a4);
  }

}

void __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
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
      v9 = objc_msgSend(v10, "unsignedIntegerValue");
      v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 8, 3, a3, a4);
        v7 = v10;
      }
    }
  }

}

void __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
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
      v9 = objc_msgSend(v10, "unsignedIntegerValue");
      v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 4, 3, a3, a4);
        v7 = v10;
      }
    }
  }

}

void __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
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
      v9 = objc_msgSend(v10, "unsignedIntegerValue");
      v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 1, 3, a3, a4);
        v7 = v10;
      }
    }
  }

}

void __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
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
      v9 = objc_msgSend(v10, "unsignedIntegerValue");
      v7 = v10;
      if (v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "ck_addTextStyle:options:range:", 2, 3, a3, a4);
        v7 = v10;
      }
    }
  }

}

uint64_t __90__CKMessageEditingView__applyExpressiveTextFormattingToAttributedText_forCompositionText___block_invoke_6(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "ck_addTextStyle:options:range:", 1, 3, a3, a4);
  return result;
}

- (void)_insertAdaptiveImageGlyphs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  _QWORD aBlock[4];
  id v13;

  v4 = (void *)MEMORY[0x1E0D35820];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CKMessageEditingView__insertAdaptiveImageGlyphs___block_invoke;
  aBlock[3] = &unk_1E2750760;
  v13 = v6;
  v8 = v6;
  v9 = _Block_copy(aBlock);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __51__CKMessageEditingView__insertAdaptiveImageGlyphs___block_invoke_2;
  v11[3] = &unk_1E2750788;
  v11[4] = self;
  v10 = _Block_copy(v11);
  objc_msgSend(v5, "__im_insertAdaptiveImageGlyphsForFileTransfersUsingFileTransferProvider:adaptiveImageGlyphProvider:", v9, v10);

}

uint64_t __51__CKMessageEditingView__insertAdaptiveImageGlyphs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transferForGUID:", a2);
}

id __51__CKMessageEditingView__insertAdaptiveImageGlyphs___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v7[16];

  objc_msgSend(a2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "adaptiveImageGlyphForTransferGUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Do not have NSAdaptiveImageGlyph for transfer. Will display as blank space.", v7, 2u);
    }

  }
  return v4;
}

- (id)adaptiveImageGlyphForTransferGUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a3;
  +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaObjectWithTransferGUID:imMessage:chatContext:", v3, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "adaptiveImageGlyph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CKMessageEditingView adaptiveImageGlyphForTransferGUID:].cold.1((uint64_t)v3, v8);

    v7 = 0;
  }

  return v7;
}

- (CKComposition)currentComposition
{
  void *v2;
  CKComposition *v3;

  -[CKMessageEditingBalloonView currentCompositionText](self->_messageEditingBalloonView, "currentCompositionText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", v2, 0);

  return v3;
}

- (void)_rejectButtonSelected:(id)a3
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
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Reject button selected", v7, 2u);
    }

  }
  -[CKMessageEditingView messageEditingViewDelegate](self, "messageEditingViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEditingViewRejectButtonSelected:", self);

}

- (void)_confirmButtonSelected:(id)a3
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
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Confirm button selected", v7, 2u);
    }

  }
  -[CKMessageEditingView messageEditingViewDelegate](self, "messageEditingViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEditingViewConfirmButtonSelected:", self);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKMessageEditingView;
  -[CKMessageEditingView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, a3);
  -[CKMessageEditingView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonView setUserInterfaceStyle:](self->_messageEditingBalloonView, "setUserInterfaceStyle:", objc_msgSend(v4, "userInterfaceStyle"));

  -[CKMessageEditingView currentComposition](self, "currentComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEditingView styledAttributedStringFromString:](self, "styledAttributedStringFromString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTextBalloonView setAttributedText:](self->_messageEditingBalloonView, "setAttributedText:", v7);
  v8 = -[CKMessageEditingView balloonColorType](self, "balloonColorType");
  -[CKColoredBalloonView setColor:](self->_messageEditingBalloonView, "setColor:", v8);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unfilledBalloonColorForColorType:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ckColor");
  -[CKBalloonView setStrokeColor:](self->_messageEditingBalloonView, "setStrokeColor:");

  -[CKBalloonView setNeedsPrepareForDisplay](self->_messageEditingBalloonView, "setNeedsPrepareForDisplay");
  -[CKBalloonView prepareForDisplayIfNeeded](self->_messageEditingBalloonView, "prepareForDisplayIfNeeded");

}

- (char)balloonColorType
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[CKMessageEditingView messageEditingViewDelegate](self, "messageEditingViewDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "messageEditingColor");

  -[CKMessageEditingView currentComposition](self, "currentComposition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "__ck_bigEmojiStyle");
  switch(-[CKMessageEditingView messageEditingViewState](self, "messageEditingViewState"))
  {
    case 1:
    case 3:
    case 4:
      if ((unint64_t)(v7 - 1) < 3)
        v4 = 13;
      break;
    case 2:
      v4 = 13;
      break;
    default:
      break;
  }

  return v4;
}

- (void)setMessageEditingViewState:(int64_t)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  double v8;
  unsigned int v9;
  BOOL v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if (self->_messageEditingViewState != a3)
  {
    self->_messageEditingViewState = a3;
    -[CKMessageEditingView messageEditingViewDelegate](self, "messageEditingViewDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "messageEditingViewBalloonHasTail");

    -[CKMessageEditingView currentComposition](self, "currentComposition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v25 = (id)objc_claimAutoreleasedReturnValue();

    v8 = 1.0;
    if (a3 == 2)
      v9 = 2;
    else
      v9 = 0;
    if (a3 != 2)
      v8 = 0.0;
    v10 = a3 == 3;
    v11 = a3 == 3 || a3 != 2;
    if (v10)
      v12 = 1;
    else
      v12 = v6;
    if (v10)
      v13 = 0;
    else
      v13 = v9;
    if (v10)
      v14 = 0.0;
    else
      v14 = v8;
    -[UIButton setAlpha:](self->_rejectButton, "setAlpha:", v14, v8);
    -[UIButton setAlpha:](self->_confirmButton, "setAlpha:", v14);
    v15 = -[CKMessageEditingView balloonColorType](self, "balloonColorType");
    -[CKColoredBalloonView setColor:](self->_messageEditingBalloonView, "setColor:", v15);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "theme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "unfilledBalloonColorForColorType:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "ckColor");
    -[CKBalloonView setStrokeColor:](self->_messageEditingBalloonView, "setStrokeColor:");

    -[CKBalloonView setBalloonStyle:](self->_messageEditingBalloonView, "setBalloonStyle:", v13);
    -[CKColoredBalloonView setHasTail:](self->_messageEditingBalloonView, "setHasTail:", v12);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "theme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "balloonTextColorForColorType:", -[CKBalloonView color](self->_messageEditingBalloonView, "color"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTextBalloonView textView](self->_messageEditingBalloonView, "textView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTextColor:", v21);

    -[CKTextBalloonView textView](self->_messageEditingBalloonView, "textView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShouldAdjustInsetsForMinimumSize:", v11);

    -[CKMessageEditingView styledAttributedStringFromString:](self, "styledAttributedStringFromString:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTextBalloonView setAttributedText:](self->_messageEditingBalloonView, "setAttributedText:", v24);
    -[CKBalloonView setNeedsPrepareForDisplay](self->_messageEditingBalloonView, "setNeedsPrepareForDisplay");
    -[CKBalloonView prepareForDisplayIfNeeded](self->_messageEditingBalloonView, "prepareForDisplayIfNeeded");

  }
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[CKTextBalloonView textView](self->_messageEditingBalloonView, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
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
  int v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
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
  void *v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  double *v54;
  double v55;
  double v56;
  double width;
  double v58;
  unint64_t messageEditingViewState;
  void *v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  __int128 v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  int v72;
  double v73;
  double height;
  double v75;
  CGSize v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  id WeakRetained;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  CGFloat v98;
  CGFloat v99;
  double v100;
  CGSize v101;
  double v102;
  CGPoint origin;
  double v104;
  CGRect v105;
  char v106;
  _OWORD v107[2];
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect slice;
  CGRect remainder;
  objc_super v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;

  v114.receiver = self;
  v114.super_class = (Class)CKMessageEditingView;
  -[CKMessageEditingView layoutSubviews](&v114, sel_layoutSubviews);
  -[CKMessageEditingView bounds](self, "bounds");
  v98 = v4;
  v99 = v3;
  v6 = v5;
  v8 = v7;
  -[CKMessageEditingBalloonView frame](self->_messageEditingBalloonView, "frame");
  v96 = v10;
  v97 = v9;
  v94 = v12;
  v95 = v11;
  v13 = -[CKMessageEditingView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[CKMessageEditingView messageEditingViewDelegate](self, "messageEditingViewDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "messageEditingViewDismissAnimationBalloonMaxWidth");
  v16 = v15;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "balloonMaskTailWidth");
  v19 = v18;

  v83 = v19;
  v20 = v16 - v19;
  -[UIButton sizeThatFits:](self->_rejectButton, "sizeThatFits:", v6, v8);
  v22 = v21;
  v24 = v23;
  -[UIButton sizeThatFits:](self->_confirmButton, "sizeThatFits:", v6, v8);
  if (v13)
    v27 = v26;
  else
    v27 = v24;
  if (v13)
    v28 = v25;
  else
    v28 = v22;
  v92 = v24;
  v93 = v22;
  v90 = v26;
  v91 = v25;
  if (v13)
    v26 = v24;
  v86 = v26;
  v87 = v27;
  if (v13)
    v29 = v22;
  else
    v29 = v25;
  -[CKMessageEditingView traitCollection](self, "traitCollection");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "horizontalSizeClass");

  v84 = v16;
  if (v31 == 1)
    goto LABEL_14;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "messageEditingNonCompactLeftEdgeToButtonMinimumPadding");
  v34 = v28 + v33;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "messageEditingNonCompactBalloonToLeftButtonPadding");
  v37 = v16 + v34 + v36;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "messageEditingNonCompactBalloonPillEdgeToRightButtonPadding");
  v40 = v29 + v37 + v39;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "messageEditingNonCompactRightEdgeToButtonPadding");
  v43 = v40 - v42;

  if (v6 < v43)
  {
LABEL_14:
    v44 = (v6 - v20 - v28 - v29) * 0.25;
    v45 = v44;
    v46 = v44;
    v47 = v44;
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "messageEditingNonCompactBalloonToLeftButtonPadding");
    v47 = v49;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "messageEditingNonCompactBalloonPillEdgeToRightButtonPadding");
    v46 = v51;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "messageEditingNonCompactRightEdgeToButtonPadding");
    v44 = v53;

    v45 = v6 - v28 - v47 - v20 - v46 - v29 - v44;
  }
  v115.origin.y = v98;
  v115.origin.x = v99;
  remainder.origin.x = v99;
  remainder.origin.y = v98;
  remainder.size.width = v6;
  remainder.size.height = v8;
  v54 = (double *)MEMORY[0x1E0C9D648];
  v101 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  origin = slice.origin;
  slice.size = v101;
  v115.size.width = v6;
  v115.size.height = v8;
  CGRectDivide(v115, &slice, &remainder, v45, CGRectMinXEdge);
  v111.origin = origin;
  v111.size = v101;
  CGRectDivide(remainder, &v111, &remainder, v28, CGRectMinXEdge);
  v88 = v111.origin.y + floor((v111.size.height - v87) * 0.5);
  v89 = v111.origin.x + floor((v111.size.width - v28) * 0.5);
  CGRectDivide(remainder, &slice, &remainder, v47, CGRectMinXEdge);
  CGRectDivide(remainder, &slice, &remainder, v44, CGRectMaxXEdge);
  v110.origin = origin;
  v110.size = v101;
  CGRectDivide(remainder, &v110, &remainder, v29, CGRectMaxXEdge);
  v85 = v110.origin.x + floor((v110.size.width - v29) * 0.5);
  v55 = v110.origin.y + floor((v110.size.height - v86) * 0.5);
  CGRectDivide(remainder, &slice, &remainder, v46, CGRectMaxXEdge);
  v56 = v54[1];
  width = v54[2];
  v58 = v54[3];
  messageEditingViewState = self->_messageEditingViewState;
  if (messageEditingViewState > 4)
  {
    v69 = v54[3];
    v67 = v54[2];
    v70 = v54[1];
    v102 = *v54;
    v104 = *v54;
  }
  else if (messageEditingViewState == 2)
  {
    v104 = *v54;
    height = remainder.size.height;
    v75 = remainder.origin.x + 0.0;
    v100 = remainder.origin.y + 0.0;
    v67 = remainder.size.width - (0.0 - v83);
    v76 = *(CGSize *)(MEMORY[0x1E0CEB4B0] + 16);
    v109.origin = (CGPoint)*MEMORY[0x1E0CEB4B0];
    v109.size = v76;
    LOBYTE(v108.origin.x) = 0;
    -[CKTextBalloonView sizeThatFits:textAlignmentInsets:isSingleLine:](self->_messageEditingBalloonView, "sizeThatFits:textAlignmentInsets:isSingleLine:", &v109, &v108, v67, remainder.size.height);
    if (v77 >= height)
      v69 = height;
    else
      v69 = v77;
    v102 = v75 + floor((v67 - v67) * 0.5);
    v70 = v100 + floor((height - v69) * 0.5);
  }
  else
  {
    v109.origin.x = v99;
    v109.origin.y = v98;
    v109.size.width = v6;
    v109.size.height = v8;
    v108.origin = origin;
    v108.size = v101;
    -[CKMessageEditingView messageEditingViewDelegate](self, "messageEditingViewDelegate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "messageEditingViewDismissAnimationContentInsets");
    v62 = v61;
    v64 = v63;

    v116.origin.x = v99;
    v116.origin.y = v98;
    v116.size.width = v6;
    v116.size.height = v8;
    CGRectDivide(v116, &v108, &v109, v62, CGRectMinXEdge);
    CGRectDivide(v109, &v108, &v109, v64, CGRectMaxXEdge);
    if (v84 >= v109.size.width)
      width = v109.size.width;
    else
      width = v84;
    v65 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    v107[0] = *MEMORY[0x1E0CEB4B0];
    v107[1] = v65;
    v106 = 0;
    -[CKTextBalloonView sizeThatFits:textAlignmentInsets:isSingleLine:](self->_messageEditingBalloonView, "sizeThatFits:textAlignmentInsets:isSingleLine:", v107, &v106, width, 1.79769313e308);
    v67 = v66;
    v69 = v68;
    memset(&v105, 0, sizeof(v105));
    CGRectDivide(v109, &v105, &v109, v66, CGRectMaxXEdge);
    v102 = v105.origin.x + floor((v105.size.width - v67) * 0.5);
    v70 = v105.origin.y + floor((v105.size.height - v69) * 0.5);
    -[CKMessageEditingBalloonView messageEditingBalloonTextView](self->_messageEditingBalloonView, "messageEditingBalloonTextView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "ck_isTextLayoutExclusivelyUsingRTLWritingDirection");
    v73 = -vabdd_f64(width, v67);
    v56 = 0.0;
    if (!v72)
      v73 = 0.0;
    v104 = v73;

    v58 = v69;
  }
  if (v13)
    v78 = v55;
  else
    v78 = v88;
  if (v13)
    v79 = v85;
  else
    v79 = v89;
  if (v13)
    v80 = v88;
  else
    v80 = v55;
  if (v13)
    v81 = v89;
  else
    v81 = v85;
  -[UIButton setFrame:](self->_rejectButton, "setFrame:", v79, v78, v93, v92);
  -[UIButton setFrame:](self->_confirmButton, "setFrame:", v81, v80, v91, v90);
  -[CKColoredBalloonView setFrame:](self->_messageEditingBalloonView, "setFrame:", v102, v70, v67, v69);
  -[CKMessageEditingBalloonView setCustomTextViewLayoutBounds:](self->_messageEditingBalloonView, "setCustomTextViewLayoutBounds:", v104, v56, width, v58);
  self->_firstLayoutPassCompleted = 1;
  -[CKMessageEditingBalloonView frame](self->_messageEditingBalloonView, "frame");
  v118.origin.y = v96;
  v118.origin.x = v97;
  v118.size.height = v94;
  v118.size.width = v95;
  if (!CGRectEqualToRect(v117, v118))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_messageEditingViewDelegate);
    objc_msgSend(WeakRetained, "messageEditingViewDidUpdateBalloonViewFrame:", self);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGSize result;

  height = a3.height;
  width = a3.width;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEditingNonCompactLeftEdgeToButtonMinimumPadding");
  v36 = v7;

  -[UIButton sizeThatFits:](self->_rejectButton, "sizeThatFits:", width, height);
  v9 = v8;
  v11 = v10;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageEditingNonCompactBalloonToLeftButtonPadding");
  v14 = v13;

  -[CKMessageEditingView messageEditingViewDelegate](self, "messageEditingViewDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "messageEditingViewDismissAnimationBalloonMaxWidth");
  v17 = v16;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "messageEditingNonCompactBalloonPillEdgeToRightButtonPadding");
  v20 = v19;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "balloonMaskTailWidth");
  v23 = v20 - v22;

  -[UIButton sizeThatFits:](self->_confirmButton, "sizeThatFits:", width, height);
  v25 = v24;
  v27 = v26;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "messageEditingNonCompactRightEdgeToButtonPadding");
  v30 = v29;

  v31 = v36 + v9 + v14 + v17 + v23 + v25 + v30;
  -[CKBalloonView sizeThatFits:](self->_messageEditingBalloonView, "sizeThatFits:", v17, 1.79769313e308);
  if (v32 >= v11)
    v33 = v32;
  else
    v33 = v11;
  if (v33 >= v27)
    v34 = v33;
  else
    v34 = v27;
  v35 = v31;
  result.height = v34;
  result.width = v35;
  return result;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CEA6B8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyCommandWithInput:modifierFlags:action:", v4, 0, sel__confirmButtonSelected_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v2, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, sel__confirmButtonSelected_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v2, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x10000, sel__confirmButtonSelected_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWantsPriorityOverSystemBehavior:", 1);
  objc_msgSend(v2, "addObject:", v7);
  v8 = (void *)objc_msgSend(v2, "copy");

  return v8;
}

- (void)applyGrammarCheckingIndication
{
  void *v3;
  int v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProofreadingEnabled");

  if (v4)
  {
    -[CKTextBalloonView textView](self->_messageEditingBalloonView, "textView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyGrammarCheckingIndication");

  }
}

- (void)underlineWithProofreadingInfo:(id)a3
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
  int v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isProofreadingEnabled");

  if (v5)
  {
    -[CKTextBalloonView textView](self->_messageEditingBalloonView, "textView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("TextCorrections"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("UnderlineRanges"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "count"))
    {
      objc_msgSend(v10, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "end");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endOfDocument");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v14)
      {
        objc_msgSend(v6, "interactionAssistant");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "underlineCorrectedTextInRange:typedString:", v11, v8);

      }
    }

  }
}

- (void)messageEditingBalloonViewContentDidChange:(id)a3
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  id v10;

  -[CKMessageEditingBalloonView currentCompositionText](self->_messageEditingBalloonView, "currentCompositionText", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v10, "length") != 0;
  -[UIButton setEnabled:](self->_confirmButton, "setEnabled:", v4);
  -[UIButton configuration](self->_confirmButton, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEditingView messageEditingViewDelegate](self, "messageEditingViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "messageEditingColor");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateMessageEditingConfirmButtonConfiguration:forButtonColor:isEnabled:", v5, v7, v4);

  -[UIButton setConfiguration:](self->_confirmButton, "setConfiguration:", v5);
  -[CKMessageEditingView updateKeyboardActionButtonIfNeeded](self, "updateKeyboardActionButtonIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageEditingViewDelegate);
  objc_msgSend(WeakRetained, "messageEditingViewDidUpdateBalloonViewContent:", self);

}

- (void)messageEditingBalloonView:(id)a3 didChangeTextAnimationInRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  int v8;
  id WeakRetained;

  length = a4.length;
  location = a4.location;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isExpressiveTextEnabled");

  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_messageEditingViewDelegate);
    objc_msgSend(WeakRetained, "messageEditingView:didChangeTextAnimationInRange:", self, location, length);

  }
}

- (int64_t)messageEditingViewState
{
  return self->_messageEditingViewState;
}

- (CKComposition)originalComposition
{
  return self->_originalComposition;
}

- (BOOL)firstLayoutPassCompleted
{
  return self->_firstLayoutPassCompleted;
}

- (CKMessageEditingBalloonView)messageEditingBalloonView
{
  return self->_messageEditingBalloonView;
}

- (void)setMessageEditingBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_messageEditingBalloonView, a3);
}

- (CKMessageEditingViewDelegate)messageEditingViewDelegate
{
  return (CKMessageEditingViewDelegate *)objc_loadWeakRetained((id *)&self->_messageEditingViewDelegate);
}

- (void)setMessageEditingViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_messageEditingViewDelegate, a3);
}

- (UIButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (UIButton)rejectButton
{
  return self->_rejectButton;
}

- (void)setRejectButton:(id)a3
{
  objc_storeStrong((id *)&self->_rejectButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rejectButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_destroyWeak((id *)&self->_messageEditingViewDelegate);
  objc_storeStrong((id *)&self->_messageEditingBalloonView, 0);
  objc_storeStrong((id *)&self->_originalComposition, 0);
}

- (void)adaptiveImageGlyphForTransferGUID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Could not create adaptive image glyph because could not find media object for transfer guid: %@", (uint8_t *)&v2, 0xCu);
}

@end
