@implementation CKShareSheetChatController

- (void)keyboardDidChangeFrame:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKShareSheetChatController;
  -[CKChatController keyboardDidChangeFrame:](&v4, sel_keyboardDidChangeFrame_, a3);
  -[CKChatController _updateEntryViewFrameIfNeeded:](self, "_updateEntryViewFrameIfNeeded:", 0);
}

- (void)_beginInteractionSignPost
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  if (!self->_interactionSignPost)
  {
    _chatControllerTelemetryLogHandle();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_make_with_pointer(v3, self);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v6 = 0;
        _os_signpost_emit_with_name_impl(&dword_18DFCD000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "ShareSheetInteraction", " enableTelemetry=YES ", v6, 2u);
      }
    }

    self->_interactionSignPost = 1;
  }
}

- (void)_endInteractionSignPost
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  if (self->_interactionSignPost == 1)
  {
    _chatControllerTelemetryLogHandle();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_make_with_pointer(v3, self);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v6 = 0;
        _os_signpost_emit_with_name_impl(&dword_18DFCD000, v3, OS_SIGNPOST_INTERVAL_END, v5, "ShareSheetInteraction", " enableTelemetry=YES ", v6, 2u);
      }
    }

    self->_interactionSignPost = 2;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[CKShareSheetChatController _beginInteractionSignPost](self, "_beginInteractionSignPost");
  v6.receiver = self;
  v6.super_class = (Class)CKShareSheetChatController;
  -[CKChatController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  -[CKChatController entryView](self, "entryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDisablePluginButtons:", 1);

}

- (void)insertInitialCompositionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  -[CKChatController initialComposition](self, "initialComposition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v8 = v3;
    -[CKChatController setInitialComposition:](self, "setInitialComposition:", 0);
    -[CKChatController setComposition:](self, "setComposition:", v8);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__CKShareSheetChatController_insertInitialCompositionIfNeeded__block_invoke;
    v9[3] = &unk_1E274A208;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v9);
    -[CKChatController entryView](self, "entryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CKCoreChatController delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        -[CKCoreChatController delegate](self, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "composeChatController:didLoadEntryViewContentWithCompletion:", self, &__block_literal_global_20);

      }
    }
    v3 = v8;
  }

}

void __62__CKShareSheetChatController_insertInitialCompositionIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)sendComposition:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[CKCoreChatController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKCoreChatController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__CKShareSheetChatController_sendComposition___block_invoke;
    v10[3] = &unk_1E274BE58;
    v10[4] = self;
    v11 = v4;
    objc_msgSend(v7, "composeChatController:shouldSendComposition:inConversation:completion:", self, v11, v8, v10);

  }
  else
  {
    -[CKShareSheetChatController _endInteractionSignPost](self, "_endInteractionSignPost");
    v9.receiver = self;
    v9.super_class = (Class)CKShareSheetChatController;
    -[CKComposeChatController sendComposition:](&v9, sel_sendComposition_, v4);
  }

}

id *__46__CKShareSheetChatController_sendComposition___block_invoke(id *result, int a2)
{
  id *v2;
  id v3;
  objc_super v4;

  if (a2)
  {
    v2 = result;
    objc_msgSend(result[4], "_endInteractionSignPost");
    v3 = v2[5];
    v4.receiver = v2[4];
    v4.super_class = (Class)CKShareSheetChatController;
    return (id *)objc_msgSendSuper2(&v4, sel_sendComposition_, v3);
  }
  return result;
}

- (BOOL)shouldDismissAfterSend
{
  return 1;
}

- (BOOL)alreadySetUp
{
  return self->_alreadySetUp;
}

- (void)setAlreadySetUp:(BOOL)a3
{
  self->_alreadySetUp = a3;
}

@end
