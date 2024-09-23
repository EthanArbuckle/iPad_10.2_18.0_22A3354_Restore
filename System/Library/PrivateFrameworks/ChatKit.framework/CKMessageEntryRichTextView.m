@implementation CKMessageEntryRichTextView

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryRichTextView;
  -[CKMessageEntryTextView dealloc](&v4, sel_dealloc);
}

- (void)setPluginDisplayContainers:(id)a3
{
  objc_storeStrong((id *)&self->_pluginDisplayContainers, a3);
}

- (void)setMediaObjects:(id)a3
{
  objc_storeStrong((id *)&self->_mediaObjects, a3);
}

- (void)setDisableAttachments:(BOOL)a3
{
  self->_disableAttachments = a3;
}

- (void)setComposeImages:(id)a3
{
  objc_storeStrong((id *)&self->_composeImages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeImages, 0);
  objc_storeStrong((id *)&self->_embeddedRichLinkConfigurations, 0);
  objc_storeStrong((id *)&self->_pluginDisplayContainers, 0);
  objc_storeStrong((id *)&self->_mediaObjects, 0);
}

- (id)pasteConfiguration
{
  void *v3;
  void *v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pasteConfigurationDisablingKeyboardStickers:", -[CKMessageEntryRichTextView disableKeyboardStickers](self, "disableKeyboardStickers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  id v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;
  objc_super v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!-[CKMessageEntryTextView allowCalloutActions](self, "allowCalloutActions"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v22 = "-[CKMessageEntryRichTextView canPerformAction:withSender:]";
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "%s callouts disabled", buf, 0xCu);
      }

    }
    goto LABEL_9;
  }
  if (sel_paste_ != a3)
  {
    if (sel_delete_ == a3)
    {
      -[CKMessageEntryRichTextView selectedTextRange](self, "selectedTextRange");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "isEmpty") & 1) != 0)
      {
        LOBYTE(v7) = 0;
      }
      else
      {
        v20.receiver = self;
        v20.super_class = (Class)CKMessageEntryRichTextView;
        LOBYTE(v7) = -[CKMessageEntryRichTextView canPerformAction:withSender:](&v20, sel_canPerformAction_withSender_, a3, v6);
      }

    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)CKMessageEntryRichTextView;
      LOBYTE(v7) = -[CKMessageEntryRichTextView canPerformAction:withSender:](&v19, sel_canPerformAction_withSender_, a3, v6);
    }
    goto LABEL_10;
  }
  if (-[CKMessageEntryRichTextView disableAttachments](self, "disableAttachments"))
  {
    -[CKMessageEntryRichTextView pasteboard](self, "pasteboard");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasImages");

    if ((v11 & 1) != 0)
    {
LABEL_9:
      LOBYTE(v7) = 0;
      goto LABEL_10;
    }
  }
  -[CKMessageEntryRichTextView pasteboard](self, "pasteboard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v12, "__ck_canCreateComposition");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a3);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v7)
        v15 = CFSTR("YES");
      else
        v15 = CFSTR("NO");
      -[CKMessageEntryRichTextView pasteboard](self, "pasteboard");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "itemProviders");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v22 = "-[CKMessageEntryRichTextView canPerformAction:withSender:]";
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v15;
      v27 = 2112;
      v28 = v17;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "%s %@ - %@ - %@", buf, 0x2Au);

    }
  }
LABEL_10:

  return v7;
}

- (void)validateCommand:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if ((char *)objc_msgSend(v4, "action") == sel_paste_)
  {
    objc_msgSend(v4, "setAttributes:", objc_msgSend(v4, "attributes") & 0xFFFFFFFFFFFFFFFELL);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CKMessageEntryRichTextView;
    -[CKMessageEntryRichTextView validateCommand:](&v5, sel_validateCommand_, v4);
  }

}

- (BOOL)canResignFirstResponder
{
  CKMessageEntryRichTextView *v2;
  void *v3;

  v2 = self;
  -[CKMessageEntryRichTextView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "messageEntryRichTextViewShouldResignFirstResponder:", v2);

  return (char)v2;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_super v10;
  objc_super v11;

  v6 = a4;
  if (-[CKMessageEntryTextView preventShowingCalloutMenu](self, "preventShowingCalloutMenu"))
  {
    v7 = 0;
  }
  else if (sel_delete_ == a3)
  {
    -[CKMessageEntryRichTextView selectedTextRange](self, "selectedTextRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEmpty") & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)CKMessageEntryRichTextView;
      -[CKMessageEntryRichTextView targetForAction:withSender:](&v11, sel_targetForAction_withSender_, a3, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CKMessageEntryRichTextView;
    -[CKMessageEntryRichTextView targetForAction:withSender:](&v10, sel_targetForAction_withSender_, a3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)pasteboard
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
}

- (BOOL)isSingleLineDocument
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryRichTextView;
  return -[CKMessageEntryRichTextView isSingleLineDocument](&v3, sel_isSingleLineDocument);
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryRichTextView;
  -[CKMessageEntryRichTextView copy:](&v7, sel_copy_, a3);
  -[CKMessageEntryRichTextView _compositionFromSelection](self, "_compositionFromSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRichTextView pasteboard](self, "pasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pasteboardItemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemProviders:", v6);

}

- (void)cut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[CKMessageEntryRichTextView _compositionFromSelection](self, "_compositionFromSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pasteboardItemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)CKMessageEntryRichTextView;
  -[CKMessageEntryRichTextView cut:](&v8, sel_cut_, v4);

  -[CKMessageEntryRichTextView pasteboard](self, "pasteboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItemProviders:", v6);

}

- (id)_compositionFromSelection
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CKComposition *v7;

  -[CKMessageEntryRichTextView compositionText](self, "compositionText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKMessageEntryRichTextView selectedRange](self, "selectedRange");
  objc_msgSend(v3, "attributedSubstringFromRange:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CKComposition initWithText:subject:]([CKComposition alloc], "initWithText:subject:", v6, 0);
  return v7;
}

- (void)handlePastedString:(id)a3 toRange:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v6 = a3;
  if (v6)
  {
    v7 = -[CKMessageEntryRichTextView _rangeFromUITextRange:](self, "_rangeFromUITextRange:", a4);
    v9 = v8;
    -[CKMessageEntryRichTextView unmarkText](self, "unmarkText");
    if (!CKIsRunningInMacCatalyst())
    {
      CKFrameworkBundle();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PASTE"), &stru_1E276D870, CFSTR("ChatKit"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryRichTextView _registerUndoOperationForReplacementWithActionName:replacementText:](self, "_registerUndoOperationForReplacementWithActionName:replacementText:", v11, v6);

    }
    -[CKMessageEntryRichTextView attributedText](self, "attributedText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v7, v9, v6);
    v15[0] = v7;
    v15[1] = v9;
    CKSeparatedTextForTextInView(v13, (uint64_t)v15, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryRichTextView setAttributedText:](self, "setAttributedText:", v14);

    -[CKMessageEntryRichTextView setSelectedRange:](self, "setSelectedRange:", objc_msgSend(v6, "length") + v15[0], 0);
  }

}

- (void)paste:(id)a3
{
  id v4;
  NSObject *v5;
  _TtC7ChatKit27CKCompositionBuilderContext *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[CKMessageEntryRichTextView paste:]";
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }

  }
  v6 = objc_alloc_init(_TtC7ChatKit27CKCompositionBuilderContext);
  -[CKCompositionBuilderContext setIsInLockdownMode:](v6, "setIsInLockdownMode:", objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown"));
  -[CKCompositionBuilderContext setIsPastingAfterBracketCharacter:](v6, "setIsPastingAfterBracketCharacter:", -[UITextView ck_isCursorDirectlyAfterBracketCharacter](self, "ck_isCursorDirectlyAfterBracketCharacter"));
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isExpressiveTextEnabled");

  if (v8)
    -[CKCompositionBuilderContext setSupportsExpressiveText:](v6, "setSupportsExpressiveText:", -[CKMessageEntryTextView isExpressiveTextEnabled](self, "isExpressiveTextEnabled"));
  -[CKMessageEntryRichTextView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "messageEntryRichTextViewSupportsInlineAdaptiveImageGlyphs:", self);

  -[CKCompositionBuilderContext setConversationSupportsInlineAdaptiveImageGlyphs:](v6, "setConversationSupportsInlineAdaptiveImageGlyphs:", v10);
  -[CKMessageEntryRichTextView pasteboard](self, "pasteboard");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__CKMessageEntryRichTextView_paste___block_invoke;
  v12[3] = &unk_1E274BA68;
  v12[4] = self;
  objc_msgSend(v11, "__ck_compositionWithContext:completionHandler:", v6, v12);

}

void __36__CKMessageEntryRichTextView_paste___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageEntryRichTextView:didPasteComposition:", *(_QWORD *)(a1 + 32), v5);

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v5, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributedTextForCompositionText:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __36__CKMessageEntryRichTextView_paste___block_invoke_2;
      v15[3] = &unk_1E274A108;
      v11 = v10;
      v12 = *(_QWORD *)(a1 + 32);
      v16 = v11;
      v17 = v12;
      dispatch_async(MEMORY[0x1E0C80D38], v15);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "-[CKMessageEntryRichTextView paste:]_block_invoke";
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "%s Got nil attributed text for pasteboard composition", buf, 0xCu);
      }

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[CKMessageEntryRichTextView paste:]_block_invoke";
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "%s - got nil pasteboard composition", buf, 0xCu);
    }

  }
}

void __36__CKMessageEntryRichTextView_paste___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CKMessageEntryRichTextView paste:]_block_invoke_2";
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "%s - Pasting rich text", buf, 0xCu);
    }

  }
  v3 = *(_QWORD *)(a1 + 32);
  v7.receiver = *(id *)(a1 + 40);
  v7.super_class = (Class)CKMessageEntryRichTextView;
  objc_msgSendSuper2(&v7, sel__pasteAttributedString_pasteAsRichText_, v3, 1);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isExpressiveTextEnabled");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "textStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ck_repairTextEffects");

  }
}

- (id)cachedPluginDisplayContainerForGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[CKMessageEntryRichTextView pluginDisplayContainers](self, "pluginDisplayContainers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)cachedMediaObjectForTransferGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_showCustomInputView
{
  id v3;

  -[CKMessageEntryTextView resignFirstResponder](self, "resignFirstResponder");
  -[CKMessageEntryRichTextView delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageEntryRichTextViewDidTapHandwritingKey:", self);

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
        objc_msgSend(v12, "key");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "keyCode") == 75)
          goto LABEL_9;
        objc_msgSend(v12, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "keyCode") == 78)
        {

LABEL_9:
LABEL_10:
          -[CKMessageEntryTextView resignFirstResponder](self, "resignFirstResponder");
          goto LABEL_11;
        }
        objc_msgSend(v12, "key");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "keyCode");

        if (v16 == 77)
          goto LABEL_10;
LABEL_11:
        ++v11;
      }
      while (v9 != v11);
      v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v9 = v17;
    }
    while (v17);
  }
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEntryRichTextView;
  -[CKMessageEntryRichTextView pressesBegan:withEvent:](&v18, sel_pressesBegan_withEvent_, v6, v7);

}

- (CKMessageEntryRichTextView)initWithFrame:(CGRect)a3 usingTextLayoutManager:(BOOL)a4 shouldDisableAttachments:(BOOL)a5 shouldDisableKeyboardStickers:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  CKMessageEntryRichTextView *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  CKTextEntryLayoutManager *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v26;
  objc_super v27;

  v6 = a6;
  v7 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    v26.receiver = self;
    v26.super_class = (Class)CKMessageEntryRichTextView;
    v13 = -[CKMessageEntryTextView initUsingTextLayoutManagerWithFrame:](&v26, sel_initUsingTextLayoutManagerWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[CKMessageEntryRichTextView textContainer](v13, "textContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSize:", width, 1.79769313e308);

    -[CKMessageEntryRichTextView textContainer](v13, "textContainer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWidthTracksTextView:", 1);

    if ((-[CKMessageEntryRichTextView isScrollEnabled](v13, "isScrollEnabled") & 1) != 0)
      goto LABEL_8;
    -[CKMessageEntryRichTextView textContainer](v13, "textContainer");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHeightTracksTextView:", 1);
  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0DC1320]);
    v17 = objc_alloc_init(MEMORY[0x1E0DC12C0]);
    objc_msgSend(v17, "setSize:", width, 1.79769313e308);
    objc_msgSend(v17, "setWidthTracksTextView:", 1);
    if ((-[CKMessageEntryRichTextView isScrollEnabled](self, "isScrollEnabled") & 1) == 0)
      objc_msgSend(v17, "setHeightTracksTextView:", 1);
    v18 = objc_alloc_init(CKTextEntryLayoutManager);
    -[CKTextEntryLayoutManager setAllowsNonContiguousLayout:](v18, "setAllowsNonContiguousLayout:", 1);
    -[CKTextEntryLayoutManager addTextContainer:](v18, "addTextContainer:", v17);
    objc_msgSend(v16, "addLayoutManager:", v18);
    v27.receiver = self;
    v27.super_class = (Class)CKMessageEntryRichTextView;
    v13 = -[CKMessageEntryTextView initWithFrame:textContainer:](&v27, sel_initWithFrame_textContainer_, v17, x, y, width, height);

  }
LABEL_8:
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v13, sel_previewDidChange_, CFSTR("CKPreviewDidChangeNotification"), 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v13, sel_previewDidChange_, CFSTR("CKRichIconDidChangeNotification"), 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v13, sel__adaptiveImageGlyphWasGeneratedNotification_, CFSTR("CKAdaptiveImageGlyphGeneratedNotification"), 0);
    -[CKMessageEntryRichTextView textStorage](v13, "textStorage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", v13);

    v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKMessageEntryRichTextView setMediaObjects:](v13, "setMediaObjects:", v21);
    v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKMessageEntryRichTextView setPluginDisplayContainers:](v13, "setPluginDisplayContainers:", v22);
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKMessageEntryRichTextView setEmbeddedRichLinkConfigurations:](v13, "setEmbeddedRichLinkConfigurations:", v23);
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKMessageEntryRichTextView setComposeImages:](v13, "setComposeImages:", v24);
    -[CKMessageEntryTextView setAllowCalloutActions:](v13, "setAllowCalloutActions:", 1);
    -[CKMessageEntryRichTextView setDisableAttachments:](v13, "setDisableAttachments:", v7);
    -[CKMessageEntryRichTextView setDisableKeyboardStickers:](v13, "setDisableKeyboardStickers:", v6);

  }
  return v13;
}

- (void)correctedTypedText:(id)a3 rangeOfReplacement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v7, "end");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryRichTextView endOfDocument](self, "endOfDocument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[CKMessageEntryRichTextView comparePosition:toPosition:](self, "comparePosition:toPosition:", v9, v10);

      if (!v11)
      {
        v16 = v6;
        v17[0] = CFSTR("TextCorrections");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v17[1] = CFSTR("UnderlineRanges");
        v18[0] = v12;
        v15 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKMessageEntryTextView setProofreadingInfo:](self, "setProofreadingInfo:", v14);
      }
    }
  }

}

- (void)setAttributedText:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryRichTextView;
  -[CKMessageEntryTextView setAttributedText:](&v3, sel_setAttributedText_, a3);
}

- (void)setCompositionText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");
  -[CKMessageEntryRichTextView embeddedRichLinkConfigurations](self, "embeddedRichLinkConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[CKMessageEntryRichTextView composeImages](self, "composeImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[CKMessageEntryRichTextView undoManager](self, "undoManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllActions");

  -[CKMessageEntryRichTextView attributedTextForCompositionText:](self, "attributedTextForCompositionText:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEntryRichTextView setAttributedText:](self, "setAttributedText:", v8);
}

- (void)replaceRange:(id)a3 withAttributedText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[16];

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isExpressiveTextEnabled");

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "User accepted a suggested effect.", v18, 2u);
      }

    }
    -[CKMessageEntryRichTextView beginningOfDocument](self, "beginningOfDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "start");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CKMessageEntryRichTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v11, v12);

    objc_msgSend(v6, "start");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "end");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CKMessageEntryRichTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v14, v15);

    -[CKMessageEntryRichTextView delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "messageEntryRichTextView:replaceRange:withAttributedText:", self, v13, v16, v7);

  }
}

- (id)compositionText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  CKMessageEntryRichTextView *v17;
  void *v18;

  -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRichTextView pluginDisplayContainers](self, "pluginDisplayContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRichTextView attributedText](self, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "setAttributes:range:", 0, 0, objc_msgSend(v5, "length"));
  v7 = objc_msgSend(v5, "length");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__CKMessageEntryRichTextView_compositionText__block_invoke;
  v14[3] = &unk_1E274F840;
  v15 = v3;
  v8 = v6;
  v16 = v8;
  v17 = self;
  v18 = v4;
  v9 = v4;
  v10 = v3;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v14);
  v11 = v18;
  v12 = v8;

  return v12;
}

void __45__CKMessageEntryRichTextView_compositionText__block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __CFString **v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
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
  id v38;

  v38 = a2;
  objc_msgSend(v38, "objectForKey:", CFSTR("CKFileTransferGUIDAttributeName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKey:", *MEMORY[0x1E0DC10F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKey:", *MEMORY[0x1E0DC10F0]);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKey:", CFSTR("CKPluginPayloadGUIDAttributeName"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D381F0];
  objc_msgSend(v38, "objectForKey:", *MEMORY[0x1E0D381F0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)v10;
  v37 = (void *)v9;
  if (v7 && v8)
  {
    objc_msgSend(a1[4], "objectForKey:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = a1[5];
    v15 = CKCompositionMediaObjectForTextAttachmentAttributeName;
LABEL_8:
    objc_msgSend(v14, "addAttribute:value:range:", *v15, v13, a3, a4);
LABEL_9:

    goto LABEL_10;
  }
  if (v9)
  {
    objc_msgSend(a1[6], "mediaObjectForAdaptiveImageGlyph:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = a1[5];
    v15 = CKCompositionAdaptiveImageGlyphMediaObjectAttributeName;
    goto LABEL_8;
  }
  if (v10)
  {
    objc_msgSend(a1[7], "objectForKey:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = a1[5];
    v15 = CKCompositionPluginDisplayContainerAttributeName;
    goto LABEL_8;
  }
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "configuration");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "entryItemUUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[6], "embeddedRichLinkConfigurations");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKey:", v13);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[5], "addAttribute:value:range:", CFSTR("EmbeddedRichLinkConfiguration"), v34, a3, a4);
      goto LABEL_9;
    }
  }
LABEL_10:
  if (v12)
    objc_msgSend(a1[5], "addAttribute:value:range:", v11, v12, a3, a4);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isRichLinkImprovementsEnabled");

  if (v17)
  {
    v18 = *MEMORY[0x1E0D381A0];
    objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D381A0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(a1[5], "addAttribute:value:range:", v18, v19, a3, a4);

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isExpressiveTextEnabled");

  if (v21)
  {
    v35 = v8;
    v22 = *MEMORY[0x1E0D393F0];
    objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D393F0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(a1[5], "addAttribute:value:range:", v22, v23, a3, a4);
    objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D39440]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24 && objc_msgSend(v24, "unsignedIntegerValue") == 1)
      objc_msgSend(a1[5], "ck_addTextStyle:options:range:", 4, 1, a3, a4);
    objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D39428]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26 && objc_msgSend(v26, "unsignedIntegerValue") == 1)
      objc_msgSend(a1[5], "ck_addTextStyle:options:range:", 8, 1, a3, a4);
    objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D393E8]);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28 && objc_msgSend(v28, "unsignedIntegerValue") == 1)
      objc_msgSend(a1[5], "ck_addTextStyle:options:range:", 1, 1, a3, a4);
    objc_msgSend(v38, "objectForKeyedSubscript:", *MEMORY[0x1E0D39420]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30 && objc_msgSend(v30, "unsignedIntegerValue") == 1)
      objc_msgSend(a1[5], "ck_addTextStyle:options:range:", 2, 1, a3, a4);

    v8 = v35;
  }

}

- (BOOL)_reconfigureWithLayoutManager:(id)a3 triggeredByLayoutManagerAccess:(BOOL)a4 triggeringSelector:(SEL)a5
{
  _BOOL8 v6;
  id v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  void *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  id v17;
  objc_super v18;

  v6 = a4;
  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEntryRichTextView;
  v9 = -[CKMessageEntryRichTextView _reconfigureWithLayoutManager:triggeredByLayoutManagerAccess:triggeringSelector:](&v18, sel__reconfigureWithLayoutManager_triggeredByLayoutManagerAccess_triggeringSelector_, v8, v6, a5);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isTextKit2Enabled");

    if (v11)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ (%p) has been reconfigured to use TextKit 1 but TextKit 2 is enabled. This is not supported and indicates a programmer error."), v15, self);
      v16 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v16, 0);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v17);
    }
  }

  return v9;
}

- (void)setBalloonColor:(char)a3
{
  if (self->_balloonColor != a3)
  {
    self->_balloonColor = a3;
    -[CKMessageEntryRichTextView updateContentsOfFileTransferPreviews](self, "updateContentsOfFileTransferPreviews");
  }
}

- (void)replaceTextInRange:(_NSRange)a3 withLinks:(id)a4
{
  NSUInteger location;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CKMessageEntryRichTextView *v21;
  void *v22;
  id obj;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const __CFString *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  location = a3.location;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v21 = self;
  -[CKMessageEntryRichTextView compositionText](self, "compositionText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v22, "mutableCopy");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = -(uint64_t)location;
    v24 = *(_QWORD *)v27;
    v10 = *MEMORY[0x1E0D362F8];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "url");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKEmbeddedRichLinkConfiguration richLinkConfigurationWithURL:](CKEmbeddedRichLinkConfiguration, "richLinkConfigurationWithURL:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = CFSTR("EmbeddedRichLinkConfiguration");
        v31 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v10, v15);
        v17 = objc_msgSend(v12, "range") - v9;
        objc_msgSend(v12, "range");
        objc_msgSend(v25, "replaceCharactersInRange:withAttributedString:", v17, v18, v16);
        objc_msgSend(v12, "range");
        v9 += v19 - objc_msgSend(v16, "length");

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v8);
  }

  v20 = (void *)objc_msgSend(v25, "copy");
  -[CKMessageEntryRichTextView setCompositionText:](v21, "setCompositionText:", v20);

}

- (BOOL)canPerformDictationAction:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CKMessageEntryRichTextView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "messageEntryRichTextView:canPerformDictationAction:", self, v4);

  return (char)self;
}

- (void)textStorage:(id)a3 willProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18[3];
  id location;
  uint64_t v20;
  uint64_t v21;

  v8 = a3;
  if (!-[CKMessageEntryTextView isShowingDictationPlaceholder](self, "isShowingDictationPlaceholder"))
  {
    v9 = -[CKMessageEntryRichTextView selectedRange](self, "selectedRange");
    v11 = v10;
    v20 = v9;
    v21 = v10;
    CKSeparatedTextForTextInView(v8, (uint64_t)&v20, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToAttributedString:", v12) & 1) == 0)
    {
      objc_msgSend(v8, "setAttributedString:", v12);
      if ((a6 & 0x8000000000000000) == 0 && (v9 != v20 || v11 != v21))
      {
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isTextKit2Enabled");

        if (v14)
        {
          v15 = (void *)(v20 - v9);
          v16 = (void *)(v21 - v11);
          location = 0;
          objc_initWeak(&location, self);
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __82__CKMessageEntryRichTextView_textStorage_willProcessEditing_range_changeInLength___block_invoke;
          v17[3] = &unk_1E274F868;
          objc_copyWeak(v18, &location);
          v18[1] = v15;
          v18[2] = v16;
          dispatch_async(MEMORY[0x1E0C80D38], v17);
          objc_destroyWeak(v18);
          objc_destroyWeak(&location);
        }
        else
        {
          -[CKMessageEntryRichTextView setSelectedRange:](self, "setSelectedRange:", v20, v21);
        }
      }
    }

  }
}

void __82__CKMessageEntryRichTextView_textStorage_willProcessEditing_range_changeInLength___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "selectedRange");
  v6 = v5;

  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 40) + v4;
  v9 = v7 + v6;
  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "setSelectedRange:", v8, v9);

}

- (BOOL)supportsAdaptiveImageGlyph
{
  return 0;
}

- (void)insertAdaptiveImageGlyph:(id)a3 replacementRange:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntryRichTextView;
  -[CKMessageEntryRichTextView insertAdaptiveImageGlyph:replacementRange:](&v6, sel_insertAdaptiveImageGlyph_replacementRange_, a3, a4);
  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Adaptive image glyph inserted", v5, 2u);
  }

}

- (void)insertAdaptiveImageGlyph:(id)a3 withMediaObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "transferGUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v6, v8);
  }
  else
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CKMessageEntryRichTextView insertAdaptiveImageGlyph:withMediaObject:].cold.1();
  }

  -[CKMessageEntryRichTextView selectedTextRange](self, "selectedTextRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRichTextView insertAdaptiveImageGlyph:replacementRange:](self, "insertAdaptiveImageGlyph:replacementRange:", v7, v10);

}

- (id)mediaObjectForAdaptiveImageGlyph:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  -[CKMessageEntryRichTextView existingMediaObjectMatchingAdaptiveImageGlyph:](self, "existingMediaObjectMatchingAdaptiveImageGlyph:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (id)v5;
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Found existing media object matching adaptive image glyph content identifier, e.g. repeated emoji in a message, reusing same transfer.", v13, 2u);
    }
  }
  else
  {
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39B18]), "initWithAdaptiveImageGlyphFromUnknownSource:", v4);
    -[NSObject mediaObjectWithSticker:stickerUserInfo:](v7, "mediaObjectWithSticker:stickerUserInfo:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v9;
      objc_msgSend(v6, "transferGUID");
      v10 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject length](v10, "length"))
      {
        -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
        v11 = objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v6, v10);
      }
      else
      {
        IMLogHandleForCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[CKMessageEntryRichTextView mediaObjectForAdaptiveImageGlyph:].cold.1();
      }

    }
    else
    {
      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CKMessageEntryRichTextView mediaObjectForAdaptiveImageGlyph:].cold.2();
      v6 = 0;
    }

  }
  return v6;
}

- (id)existingMediaObjectMatchingAdaptiveImageGlyph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__25;
    v16 = __Block_byref_object_dispose__25;
    v17 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__CKMessageEntryRichTextView_existingMediaObjectMatchingAdaptiveImageGlyph___block_invoke;
    v9[3] = &unk_1E274F890;
    v10 = v6;
    v11 = &v12;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __76__CKMessageEntryRichTextView_existingMediaObjectMatchingAdaptiveImageGlyph___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v7 = a3;
  objc_msgSend(v7, "transfer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adaptiveImageGlyphContentIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") && objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
      *a4 = 1;
    }
    else
    {
      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __76__CKMessageEntryRichTextView_existingMediaObjectMatchingAdaptiveImageGlyph___block_invoke_cold_1();

    }
  }

}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)inlineMediaViewTextAttachmentDidRequestGenerativeInteraction:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKMessageEntryRichTextView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "messageEntryRichTextView:didTapGenerativeButtonForImageURL:", self, v5);
}

- (void)linkPreviewTextAttachmentDidUpdateTextAttachmentSize:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMessageEntryRichTextView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageEntryRichTextView:didUpdateSizeForTextAttachment:", self, v4);

}

- (void)linkPreviewTextAttachment:(id)a3 didSelectInteractionType:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CKMessageEntryRichTextView *v11;
  uint64_t v12;
  id v13;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 0:
      v11 = self;
      v12 = 0;
LABEL_7:
      v13 = v7;
      -[CKMessageEntryRichTextView _updateTextContentForRichLinkInteractionType:onTextAttachment:](v11, "_updateTextContentForRichLinkInteractionType:onTextAttachment:", v12, v7);
      goto LABEL_8;
    case 2:
      v11 = self;
      v12 = 2;
      goto LABEL_7;
    case 1:
      v13 = v6;
      objc_msgSend(v6, "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setURL:", v9);

LABEL_8:
      v7 = v13;
      break;
  }

}

- (void)_updateTextContentForRichLinkInteractionType:(int64_t)a3 onTextAttachment:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v6 = a4;
  -[CKMessageEntryRichTextView attributedText](self, "attributedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ck_attributedStringByApplyingRichLinkInteraction:toLinkTextAttachments:stringDidChange:", a3, v8, &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[CKMessageEntryRichTextView setAttributedText:](self, "setAttributedText:", v9);

}

- (void)linkPreviewTextAttachment:(id)a3 willAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKMessageEntryRichTextView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryRichTextView:willAddPluginTextAttachmentViewControllerToViewHierarchy:", self, v5);

}

- (void)linkPreviewTextAttachment:(id)a3 didAddPluginEntryViewControllerToViewHierarchy:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKMessageEntryRichTextView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageEntryRichTextView:didAddPluginTextAttachmentViewControllerToViewHierarchy:", self, v5);

}

- (double)maxWidthForLinkPreviewTextAttachment:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[CKMessageEntryRichTextView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonMaxWidthForMessageEntryRichTextView:", self);
  v6 = v5;

  return v6;
}

- (BOOL)supportsCustomizationForLinkPreviewTextAttachment:(id)a3
{
  CKMessageEntryRichTextView *v3;
  void *v4;

  v3 = self;
  -[CKMessageEntryRichTextView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "messageEntryRichTextViewShouldAllowLinkCustomization:", v3);

  return (char)v3;
}

- (void)linkPreviewTextAttachmentWillPresentCustomizationPicker:(id)a3
{
  id v4;

  -[CKMessageEntryRichTextView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryRichTextViewWillPresentCustomizationPicker:", self);

}

- (void)linkPreviewTextAttachmentDidPresentCustomizationPicker:(id)a3
{
  id v4;

  -[CKMessageEntryRichTextView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryRichTextViewDidPresentCustomizationPicker:", self);

}

- (void)linkPreviewTextAttachmentWillDismissCustomizationPicker:(id)a3
{
  id v4;

  -[CKMessageEntryRichTextView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryRichTextViewWillDismissCustomizationPicker:", self);

}

- (void)linkPreviewTextAttachmentDidDismissCustomizationPicker:(id)a3
{
  id v4;

  -[CKMessageEntryRichTextView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEntryRichTextViewDidDismissCustomizationPicker:", self);

}

- (void)updateContentsOfFileTransferPreviews
{
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[CKMessageEntryRichTextView textStorage](self, "textStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__CKMessageEntryRichTextView_updateContentsOfFileTransferPreviews__block_invoke;
  v6[3] = &unk_1E274F8B8;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("CKFileTransferGUIDAttributeName"), 0, v4, 0, v6);

}

void __66__CKMessageEntryRichTextView_updateContentsOfFileTransferPreviews__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;

  v7 = a2;
  if (v7)
  {
    v28 = v7;
    objc_msgSend(*(id *)(a1 + 32), "mediaObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "transfer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isAdaptiveImageGlyph");

    v12 = *(void **)(a1 + 40);
    if (v11)
    {
      v13 = *MEMORY[0x1E0DC10F0];
      objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F0], a3, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "adaptiveImageGlyphForTransferGUID:", v28);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14 == v15)
      {
LABEL_11:

        v7 = v28;
        goto LABEL_12;
      }
      v16 = *(void **)(a1 + 40);
      v17 = v13;
      v18 = v15;
    }
    else
    {
      v19 = *MEMORY[0x1E0DC10F8];
      objc_msgSend(v12, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], a3, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 32);
      objc_msgSend(v20, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "composeImageForTransferGUID:traitCollection:", v28, v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "image");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 == v15 || v14 == 0)
        goto LABEL_11;
      objc_msgSend(v14, "setImage:", v15);
      v24 = *MEMORY[0x1E0C9D538];
      v25 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      objc_msgSend(v15, "size");
      objc_msgSend(v14, "setBounds:", v24, v25, v26, v27);
      v16 = *(void **)(a1 + 40);
      v17 = v19;
      v18 = v14;
    }
    objc_msgSend(v16, "addAttribute:value:range:", v17, v18, a3, a4);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_adaptiveImageGlyphWasGeneratedNotification:(id)a3
{
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "object");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "transferGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[CKMessageEntryRichTextView updateContentsOfFileTransferPreviews](self, "updateContentsOfFileTransferPreviews");

    v5 = v9;
  }

}

- (void)previewDidChange:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = v12;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v12, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transferGUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CKMessageEntryRichTextView composeImages](self, "composeImages");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectForKey:", v8);

      -[CKMessageEntryRichTextView updateContentsOfFileTransferPreviews](self, "updateContentsOfFileTransferPreviews");
    }

    v6 = v12;
  }

}

- (id)adaptiveImageGlyphForTransferGUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "adaptiveImageGlyph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldPreserveAdaptiveImageGlyphsInCompositionText
{
  return 1;
}

- (id)composeImageForTransferGUID:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
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
  void *v31;
  void *v32;

  v6 = a3;
  v7 = a4;
  -[CKMessageEntryRichTextView composeImages](self, "composeImages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      IMLogHandleForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CKMessageEntryRichTextView composeImageForTransferGUID:traitCollection:].cold.1();

      v9 = 0;
    }
    else
    {
      -[CKMessageEntryRichTextView delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "maxWidthForPreviewImagesInMessageEntryRichTextView:", self);
      v15 = v14;

      objc_msgSend(v11, "transfer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isSticker");

      if (v17)
      {
        objc_msgSend(v11, "previewForWidth:orientation:", 0, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v18, "image");
          v19 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = v18;
        }
        v20 = v19;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "size");
        v23 = v22;
        v25 = v24;
        objc_msgSend(v20, "scale");
        v27 = v26;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stickerScreenScale");
        objc_msgSend(v21, "stickerSizeScaledWithInitialSize:imageScale:userScale:rectifiedScreenScale:maxWidth:", v23, v25, v27, 1.0, v29, 1.79769313e308);
        v15 = v30;

      }
      objc_msgSend(v11, "composeImagesForEntryContentViewWidth:traitCollection:", v7, v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v9, v6);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", -[CKMessageEntryRichTextView balloonColor](self, "balloonColor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)attributedTextForCompositionText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  _QWORD v40[4];
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  CKMessageEntryRichTextView *v53;
  id v54;

  v4 = a3;
  -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRichTextView pluginDisplayContainers](self, "pluginDisplayContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  v8 = objc_msgSend(v7, "length");
  v9 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke;
  v50[3] = &unk_1E274F840;
  v10 = v5;
  v51 = v10;
  v11 = v7;
  v52 = v11;
  v53 = self;
  v12 = v6;
  v54 = v12;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, v50);
  -[CKMessageEntryRichTextView typingAttributes](self, "typingAttributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isExpressiveTextEnabled");

  if (v16)
  {
    objc_msgSend(v14, "ck_removeBoldItalicUnderlineAndStrikethroughTypingAttributes");
    objc_msgSend(v14, "ck_removeTextAnimationsTypingAttributes");
  }
  objc_msgSend(v11, "addAttributes:range:", v14, 0, objc_msgSend(v11, "length"));
  objc_msgSend(v11, "attributesAtIndex:effectiveRange:", objc_msgSend(v11, "length") - 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0DC10F8];
  objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0DC10F8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v20, "removeObjectForKey:", CFSTR("CKFileTransferGUIDAttributeName"));
    objc_msgSend(v20, "removeObjectForKey:", v18);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR("\n"), v20);
    objc_msgSend(v11, "appendAttributedString:", v21);

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isExpressiveTextEnabled");

  if (v23)
  {
    v24 = objc_msgSend(v4, "length");
    v25 = *MEMORY[0x1E0D393F0];
    v48[0] = v9;
    v48[1] = 3221225472;
    v48[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_2;
    v48[3] = &unk_1E274EF20;
    v26 = v11;
    v49 = v26;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v25, 0, v24, 0, v48);
    v27 = *MEMORY[0x1E0D39428];
    v28 = objc_msgSend(v4, "length");
    v46[0] = v9;
    v46[1] = 3221225472;
    v46[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_3;
    v46[3] = &unk_1E274EF20;
    v29 = v26;
    v47 = v29;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v27, 0, v28, 0, v46);
    v30 = *MEMORY[0x1E0D39440];
    v31 = objc_msgSend(v4, "length");
    v44[0] = v9;
    v44[1] = 3221225472;
    v44[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_4;
    v44[3] = &unk_1E274EF20;
    v32 = v29;
    v45 = v32;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v30, 0, v31, 0, v44);
    v33 = *MEMORY[0x1E0D393E8];
    v34 = objc_msgSend(v4, "length");
    v42[0] = v9;
    v42[1] = 3221225472;
    v42[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_5;
    v42[3] = &unk_1E274EF20;
    v35 = v32;
    v43 = v35;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v33, 0, v34, 0, v42);
    v36 = *MEMORY[0x1E0D39420];
    v37 = objc_msgSend(v4, "length");
    v40[0] = v9;
    v40[1] = 3221225472;
    v40[2] = __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_6;
    v40[3] = &unk_1E274EF20;
    v41 = v35;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v36, 0, v37, 0, v40);

  }
  v38 = v11;

  return v38;
}

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void **v14;
  const __CFString **v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  _QWORD v50[2];
  _QWORD v51[2];
  uint64_t v52;
  _TtC7ChatKit27CKLinkPreviewTextAttachment *v53;
  _QWORD v54[2];
  _QWORD v55[2];
  const __CFString *v56;
  void *v57;
  _QWORD v58[2];
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PluginDisplayContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AdaptiveImageGlyphMediaObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MediaObjectForTextAttachment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v9;
  if (v8)
  {
    objc_msgSend(v8, "transferGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setObject:forKey:", v8, v10);
    objc_msgSend(v8, "adaptiveImageGlyph");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      v58[0] = *MEMORY[0x1E0DC10F0];
      v58[1] = CFSTR("CKFileTransferGUIDAttributeName");
      v59[0] = v11;
      v59[1] = v10;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = (void **)v59;
      v15 = (const __CFString **)v58;
      v16 = 2;
    }
    else
    {
      v56 = CFSTR("CKFileTransferGUIDAttributeName");
      v57 = v10;
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = &v57;
      v15 = &v56;
      v16 = 1;
    }
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setAttributes:range:", v19, a3, a4);
  }
  else
  {
    if (!v9)
      goto LABEL_9;
    objc_msgSend(v9, "transferGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "setObject:forKey:", v47, v10);
    v17 = a1[6];
    objc_msgSend(v17, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "composeImageForTransferGUID:traitCollection:", v10, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
    objc_msgSend(v19, "setImage:", v12);
    v20 = *MEMORY[0x1E0C9D538];
    v21 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v12, "size");
    objc_msgSend(v19, "setBounds:", v20, v21, v22, v23);
    v24 = a1[5];
    v54[0] = *MEMORY[0x1E0DC10F8];
    v54[1] = CFSTR("CKFileTransferGUIDAttributeName");
    v55[0] = v19;
    v55[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAttributes:range:", v25, a3, a4);

  }
LABEL_9:
  v48 = a4;
  objc_msgSend(a1[6], "embeddedRichLinkConfigurations");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EmbeddedRichLinkConfiguration"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "entryItemUUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKey:", v28, v29);
    v30 = -[CKLinkPreviewTextAttachment initWithDelegate:configuration:]([_TtC7ChatKit27CKLinkPreviewTextAttachment alloc], "initWithDelegate:configuration:", a1[6], v28);
    v31 = a1[5];
    v52 = *MEMORY[0x1E0DC10F8];
    v53 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAttributes:range:", v32, a3, v48);

  }
  if (v7)
  {
    objc_msgSend(v7, "pluginPayload");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "messageGUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[7], "setObject:forKey:", v7, v34);
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
    v46 = v7;
    objc_msgSend(v7, "composeImage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "previewMaxWidth");
    v39 = v38;

    objc_msgSend(v36, "size");
    v42 = v40;
    v43 = v41;
    if (v40 > v39 && v40 > 0.0)
    {
      v43 = v39 * (v41 / v40);
      v42 = v39;
    }
    objc_msgSend(v35, "setImage:", v36);
    objc_msgSend(v35, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v42, v43);
    v44 = a1[5];
    v50[0] = *MEMORY[0x1E0DC10F8];
    v50[1] = CFSTR("CKPluginPayloadGUIDAttributeName");
    v51[0] = v35;
    v51[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setAttributes:range:", v45, a3, v48);

    v7 = v46;
  }

}

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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

void __63__CKMessageEntryRichTextView_attributedTextForCompositionText___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CKMessageEntryRichTextView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "messageEntryRichTextView:shouldRecognizeGesture:", self, v4);

  return (char)self;
}

- (BOOL)handleTapOrLongPressOnMediaObjectForTransferGUID:(id)a3 characterIndex:(int64_t)a4 location:(CGPoint)a5 touchedCharacterFrame:(CGRect)a6
{
  double width;
  double x;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  int64_t v15;

  width = a6.size.width;
  x = a5.x;
  v10 = a3;
  -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[CKMessageEntryRichTextView delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messageEntryRichTextView:didTapMediaObject:", self, v12);

    if (x <= width * 0.5)
      v15 = a4;
    else
      v15 = a4 + 1;
    -[CKMessageEntryRichTextView setSelectedRange:](self, "setSelectedRange:", v15, 0);
    -[CKMessageEntryRichTextView becomeFirstResponder](self, "becomeFirstResponder");
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)handleTapOrLongPress:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  objc_super v34;
  CGPoint v35;
  CGRect v36;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKMessageEntryRichTextView;
  -[CKMessageEntryTextView handleTapOrLongPress:](&v34, sel_handleTapOrLongPress_, v4);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0 || objc_msgSend(v4, "state") == 3)
  {
    -[CKMessageEntryRichTextView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEntryRichTextViewWasTapped:isLongPress:", self, isKindOfClass & 1);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isTextKit2Enabled");

    if ((v8 & 1) == 0)
    {
      -[CKMessageEntryRichTextView layoutManager](self, "layoutManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryRichTextView textContainer](self, "textContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryRichTextView attributedText](self, "attributedText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageEntryRichTextView textContainerInset](self, "textContainerInset");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v4, "locationInView:", self);
      v17 = v16 - v15;
      v19 = v18 - v13;
      v20 = objc_msgSend(v9, "glyphIndexForPoint:inTextContainer:", v10, v17, v19);
      v21 = objc_msgSend(v9, "characterIndexForGlyphAtIndex:", v20);
      if (v21 < objc_msgSend(v11, "length"))
      {
        objc_msgSend(v11, "attribute:atIndex:effectiveRange:", CFSTR("CKFileTransferGUIDAttributeName"), v21, 0);
        v22 = objc_claimAutoreleasedReturnValue();
        -[CKMessageEntryRichTextView mediaObjects](self, "mediaObjects");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)v22;
        objc_msgSend(v23, "objectForKey:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v9, "boundingRectForGlyphRange:inTextContainer:", v20, 1, v10);
          v36.origin.x = v25 + 10.0;
          v36.origin.y = v26 + 10.0;
          v28 = v27 + -20.0;
          v36.size.height = v29 + -20.0;
          v36.size.width = v27 + -20.0;
          v35.x = v17;
          v35.y = v19;
          if (CGRectContainsPoint(v36, v35))
          {
            -[CKMessageEntryRichTextView delegate](self, "delegate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "messageEntryRichTextView:didTapMediaObject:", self, v24);

            if (v17 <= v28 * 0.5)
              v31 = v20;
            else
              v31 = v20 + 1;
            -[CKMessageEntryRichTextView setSelectedRange:](self, "setSelectedRange:", v31, 0);
            -[CKMessageEntryRichTextView becomeFirstResponder](self, "becomeFirstResponder");
          }
        }
        else
        {
          objc_msgSend(v11, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D381C0], v21, 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
            -[CKMessageEntryTextView didTapMentionForTextView:atCharacterIndex:](self, "didTapMentionForTextView:atCharacterIndex:", self, (double)v21);
        }
        if (+[CKMentionsUtilities supportsSupplementalLexiconMentions](CKMentionsUtilities, "supportsSupplementalLexiconMentions"))
        {
          -[CKMessageEntryTextView didLongPressMentionForTextView:characterIndex:isLongPress:](self, "didLongPressMentionForTextView:characterIndex:isLongPress:", self, v21, isKindOfClass & 1);
        }

      }
    }
  }

}

- (_NSRange)_rangeFromUITextRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v4 = a3;
  -[CKMessageEntryRichTextView beginningOfDocument](self, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKMessageEntryRichTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v5, v6);

  objc_msgSend(v4, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[CKMessageEntryRichTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v8, v9);
  v11 = v7;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (char)balloonColor
{
  return self->_balloonColor;
}

- (BOOL)disableKeyboardStickers
{
  return self->_disableKeyboardStickers;
}

- (void)setDisableKeyboardStickers:(BOOL)a3
{
  self->_disableKeyboardStickers = a3;
}

- (NSMutableDictionary)mediaObjects
{
  return self->_mediaObjects;
}

- (NSMutableDictionary)pluginDisplayContainers
{
  return self->_pluginDisplayContainers;
}

- (NSMutableDictionary)embeddedRichLinkConfigurations
{
  return self->_embeddedRichLinkConfigurations;
}

- (void)setEmbeddedRichLinkConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_embeddedRichLinkConfigurations, a3);
}

- (NSMutableDictionary)composeImages
{
  return self->_composeImages;
}

- (BOOL)disableAttachments
{
  return self->_disableAttachments;
}

- (void)insertAdaptiveImageGlyph:withMediaObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Failed to create media object for inserted adaptive image glyph.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)mediaObjectForAdaptiveImageGlyph:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Failed to get file transfer guid for created emoji image media object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)mediaObjectForAdaptiveImageGlyph:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Failed to create emoji image media object for adaptive image glyph.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __76__CKMessageEntryRichTextView_existingMediaObjectMatchingAdaptiveImageGlyph___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Found media object matching adaptive image glyph content identifier, but not of the correct media object class", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)composeImageForTransferGUID:traitCollection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Attempting to find an compse UIImage for an emoji image media object, instead of the NSEmojiImageTextAttachment", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
