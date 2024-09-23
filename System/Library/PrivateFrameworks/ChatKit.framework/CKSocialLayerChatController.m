@implementation CKSocialLayerChatController

- (void)dealloc
{
  objc_super v3;

  +[CKApplicationState setActive:](CKApplicationState, "setActive:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CKSocialLayerChatController;
  -[CKChatController dealloc](&v3, sel_dealloc);
}

- (CKSocialLayerChatController)initWithConversation:(id)a3
{
  CKSocialLayerChatController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSocialLayerChatController;
  v3 = -[CKChatController initWithConversation:](&v5, sel_initWithConversation_, a3);
  if (v3)
    +[CKApplicationState setActive:](CKApplicationState, "setActive:", 1);
  return v3;
}

- (BOOL)_controllerEligibleForSetConversation
{
  double v2;
  double v3;
  double v4;
  BOOL v5;
  double v6;

  -[CKCoreChatController calculateTranscriptMarginInsets](self, "calculateTranscriptMarginInsets");
  v5 = v4 != *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  if (v6 != *MEMORY[0x1E0CEB4B0])
    v5 = 1;
  if (v3 != *(double *)(MEMORY[0x1E0CEB4B0] + 24))
    v5 = 1;
  return v2 != *(double *)(MEMORY[0x1E0CEB4B0] + 16) || v5;
}

- (void)_setConversationDeferredSetup
{
  dispatch_time_t v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSocialLayerChatController;
  -[CKChatController _setConversationDeferredSetup](&v5, sel__setConversationDeferredSetup);
  -[CKSocialLayerChatController prewarmAttachmentChatItemSize](self, "prewarmAttachmentChatItemSize");
  v3 = dispatch_time(0, 50000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CKSocialLayerChatController__setConversationDeferredSetup__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __60__CKSocialLayerChatController__setConversationDeferredSetup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scrollToAndHighlightMessage");
}

- (void)setMessageGUID:(id)a3
{
  objc_storeStrong((id *)&self->_messageGUID, a3);
}

- (void)setAttachmentGUID:(id)a3
{
  objc_storeStrong((id *)&self->_attachmentGUID, a3);
}

+ (id)chatIdentifierForMessageWithGUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)IMDMessageRecordChatForMessageGUID();
  if (v4)
  {
    v5 = (void *)IMDChatRecordCopyChatIdentifier();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Couldn't find chat for message identifier: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    v5 = 0;
  }

  return v5;
}

+ (id)chatItemForMessageGUID:(id)a3 messagePartIndex:(int64_t)a4 chatItems:(id)a5
{
  id v7;
  id v8;
  uint64_t (**v9)(void *, void *);
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  int64_t v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD aBlock[4];
  id v39;
  int64_t v40;
  _BYTE v41[128];
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__CKSocialLayerChatController_chatItemForMessageGUID_messagePartIndex_chatItems___block_invoke;
  aBlock[3] = &unk_1E274A380;
  v29 = v7;
  v39 = v29;
  v40 = a4;
  v9 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v10 = v8;
  v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v35;
    v27 = a4;
    v28 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v35 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "aggregateChatItems");
        }
        else
        {
          v42 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v30 = 0u;
        v31 = 0u;
        v17 = v16;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v31;
          while (2)
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v31 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              if (objc_msgSend(v22, "canInlineReply") && (v9[2](v9, v22) & 1) != 0)
              {
                v25 = v15;

                v23 = v10;
                goto LABEL_27;
              }
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
            if (v19)
              continue;
            break;
          }
        }

        v13 = v28;
      }
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      a4 = v27;
    }
    while (v12);
  }

  IMLogHandleForCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v24)
      +[CKSocialLayerChatController chatItemForMessageGUID:messagePartIndex:chatItems:].cold.1((uint64_t)v29, v23);
  }
  else if (v24)
  {
    +[CKSocialLayerChatController chatItemForMessageGUID:messagePartIndex:chatItems:].cold.2((uint64_t)v29, a4, v23);
  }
  v25 = 0;
LABEL_27:

  return v25;
}

BOOL __81__CKSocialLayerChatController_chatItemForMessageGUID_messagePartIndex_chatItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "messageItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32))
      && (*(_QWORD *)(a1 + 40) == 0x7FFFFFFFFFFFFFFFLL || *(_QWORD *)(a1 + 40) == objc_msgSend(v4, "index"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)selectedChatItems
{
  void *v2;
  void *v3;

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedChatItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)messagePartIndexMatchingAttachementGUID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CKSocialLayerChatController attachmentGUID](self, "attachmentGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[CKCoreChatController conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSocialLayerChatController messageGUID](self, "messageGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v4;
    objc_msgSend(v4, "ensureMessageWithGUIDIsLoaded:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageParts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "transferGUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:", v3))
            v11 = objc_msgSend(v13, "messagePartIndex");

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (void)scrollToAndHighlightMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

  -[CKCoreChatController conversation](self, "conversation");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKSocialLayerChatController messageGUID](self, "messageGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ensureMessageWithGUIDIsLoaded:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatController scrollToMessage:atSpecificMessagePartIndex:highlight:withInlineReplyOverlay:](self, "scrollToMessage:atSpecificMessagePartIndex:highlight:withInlineReplyOverlay:", v6, -[CKSocialLayerChatController messagePartIndexMatchingAttachementGUID](self, "messagePartIndexMatchingAttachementGUID"), 0, 1);

}

- (void)prewarmAttachmentChatItemSize
{
  NSObject *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[CKSocialLayerChatController attachmentGUID](self, "attachmentGUID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "prewarm chat item size for attachment guid: %@", (uint8_t *)&v16, 0xCu);

    }
  }
  -[CKSocialLayerChatController messageGUID](self, "messageGUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKSocialLayerChatController messagePartIndexMatchingAttachementGUID](self, "messagePartIndexMatchingAttachementGUID");
  if (objc_msgSend(v5, "length"))
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chatItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKSocialLayerChatController chatItemForMessageGUID:messagePartIndex:chatItems:](CKSocialLayerChatController, "chatItemForMessageGUID:messagePartIndex:chatItems:", v5, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      objc_msgSend(v10, "mediaObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "forceInlinePreviewGeneration");

      objc_msgSend(v10, "mediaObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setForceInlinePreviewGeneration:", 1);

      objc_msgSend(v10, "size");
      objc_msgSend(v10, "mediaObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setForceInlinePreviewGeneration:", v12);
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Attempting to prewarm a message without a GUID", (uint8_t *)&v16, 2u);
    }

  }
}

- (void)showTapBackPicker
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKSocialLayerChatController messageGUID](self, "messageGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKSocialLayerChatController messagePartIndexMatchingAttachementGUID](self, "messagePartIndexMatchingAttachementGUID");
  objc_msgSend(v7, "chatItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSocialLayerChatController chatItemForMessageGUID:messagePartIndex:chatItems:](CKSocialLayerChatController, "chatItemForMessageGUID:messagePartIndex:chatItems:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSocialLayerChatController showFullScreenAcknowledgmentPickerForChatItem:](self, "showFullScreenAcknowledgmentPickerForChatItem:", v6);
}

- (void)showFullScreenAcknowledgmentPickerForChatItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "showFullScreenAcknowledgmentPickerForChatItem", buf, 2u);
    }

  }
  -[CKCoreChatController chat](self, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginHoldingChatItemsUpdatesForReason:", *MEMORY[0x1E0D35380]);
  -[CKScrollViewController beginHoldingScrollGeometryUpdatesForReason:](self, "beginHoldingScrollGeometryUpdatesForReason:", CFSTR("FullscreenBalloonMenuVisible"));
  -[CKSocialLayerChatController socialLayerFullScreenBalloonController](self, "socialLayerFullScreenBalloonController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Dismissing fullscreen balloon", v18, 2u);
      }

    }
    -[CKChatController _dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:](self, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:", 1, 0, 0);
  }
  -[CKSocialLayerChatController _fullScreenBalloonViewControllerWithChatItem:](self, "_fullScreenBalloonViewControllerWithChatItem:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Created fullscreen balloon", v17, 2u);
    }

  }
  -[CKSocialLayerChatController addChildViewController:](self, "addChildViewController:", v9);
  -[CKSocialLayerChatController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  objc_msgSend(v9, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  objc_msgSend(v13, "setFrame:");

  objc_msgSend(v9, "didMoveToParentViewController:", self);
  -[CKSocialLayerChatController setSocialLayerFullScreenBalloonController:](self, "setSocialLayerFullScreenBalloonController:", v9);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Setup fullscreen balloon", v16, 2u);
    }

  }
}

- (id)_fullScreenBalloonViewControllerWithChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  CKFullScreenBalloonViewControllerPhone *v10;
  void *v11;
  void *v12;
  CKFullScreenBalloonViewControllerPhone *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonViewForChatItem:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "canUseOpaqueMask");
    if (v7)
    {
      objc_msgSend(v6, "setCanUseOpaqueMask:", 0);
      objc_msgSend(v6, "prepareForDisplayIfNeeded");
      objc_msgSend(v6, "layoutIfNeeded");
      objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
    }
    objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "setCanUseOpaqueMask:", 1);
      objc_msgSend(v6, "prepareForDisplayIfNeeded");
      objc_msgSend(v6, "layoutIfNeeded");
    }
  }
  else
  {
    v8 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Created balloon view for fullscreen; balloonView = %@, chatItem: %@",
        (uint8_t *)&v15,
        0x16u);
    }

  }
  v10 = [CKFullScreenBalloonViewControllerPhone alloc];
  objc_msgSend(v4, "menuTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSocialLayerChatController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CKFullScreenBalloonViewControllerPhone initWithChatItem:title:interfaceActions:gradientReferenceView:pluginBalloonSnapshot:delegate:](v10, "initWithChatItem:title:interfaceActions:gradientReferenceView:pluginBalloonSnapshot:delegate:", v4, v11, 0, v12, v8, self);

  return v13;
}

- (NSString)attachmentGUID
{
  return self->_attachmentGUID;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (CKFullScreenBalloonViewControllerPhone)socialLayerFullScreenBalloonController
{
  return (CKFullScreenBalloonViewControllerPhone *)objc_loadWeakRetained((id *)&self->_socialLayerFullScreenBalloonController);
}

- (void)setSocialLayerFullScreenBalloonController:(id)a3
{
  objc_storeWeak((id *)&self->_socialLayerFullScreenBalloonController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_socialLayerFullScreenBalloonController);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_attachmentGUID, 0);
}

- (void)fullScreenBalloonViewController:(id)a3 sendMessageAcknowledgment:(int64_t)a4 forChatItem:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[16];

  v8 = a3;
  v9 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController:sendMessageAcknowledgment:forChatItem: ", buf, 2u);
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)CKSocialLayerChatController;
  -[CKChatController fullScreenBalloonViewController:sendMessageAcknowledgment:forChatItem:](&v11, sel_fullScreenBalloonViewController_sendMessageAcknowledgment_forChatItem_, v8, a4, v9);
  -[CKSocialLayerChatController fullScreenBalloonViewControllerHandleDismissTap:](self, "fullScreenBalloonViewControllerHandleDismissTap:", v8);

}

- (void)fullScreenBalloonViewController:(id)a3 replyButtonPressedForChatItem:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController:replyButtonPressedForChatItem: ", buf, 2u);
    }

  }
  if (v7)
  {
    v9.receiver = self;
    v9.super_class = (Class)CKSocialLayerChatController;
    -[CKChatController showInlineReplyControllerForChatItem:presentKeyboard:](&v9, sel_showInlineReplyControllerForChatItem_presentKeyboard_, v7, 1);
  }
  -[CKSocialLayerChatController fullScreenBalloonViewControllerHandleDismissTap:](self, "fullScreenBalloonViewControllerHandleDismissTap:", v6);

}

- (void)fullScreenBalloonViewController:(id)a3 willAppearAnimated:(BOOL)a4
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
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController:willAppearAnimated", v6, 2u);
    }

  }
}

- (void)fullScreenBalloonViewController:(id)a3 didAppearAnimated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[16];

  v4 = a4;
  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController:didAppearAnimated", buf, 2u);
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)CKSocialLayerChatController;
  -[CKChatController fullScreenBalloonViewController:didAppearAnimated:](&v8, sel_fullScreenBalloonViewController_didAppearAnimated_, v6, v4);

}

- (void)fullScreenBalloonViewControllerDidDisappear:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "fullScreenBalloonViewControllerDidDisappear", buf, 2u);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)CKSocialLayerChatController;
  -[CKChatController fullScreenBalloonViewControllerDidDisappear:](&v6, sel_fullScreenBalloonViewControllerDidDisappear_, v4);

}

- (void)fullScreenBalloonViewControllerHandleDismissTap:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "fullScreenBalloonViewControllerHandleDismissTap:", buf, 2u);
    }

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __120__CKSocialLayerChatController_FullScreenBalloonViewControllerDelegate__fullScreenBalloonViewControllerHandleDismissTap___block_invoke;
  aBlock[3] = &unk_1E274A208;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  -[CKSocialLayerChatController socialLayerFullScreenBalloonController](self, "socialLayerFullScreenBalloonController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performCancelAnimationWithCompletion:", v6);

}

void __120__CKSocialLayerChatController_FullScreenBalloonViewControllerDelegate__fullScreenBalloonViewControllerHandleDismissTap___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "socialLayerFullScreenBalloonController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "socialLayerFullScreenBalloonController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "willMoveToParentViewController:", 0);

    objc_msgSend(*(id *)(a1 + 32), "socialLayerFullScreenBalloonController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "socialLayerFullScreenBalloonController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didMoveToParentViewController:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setSocialLayerFullScreenBalloonController:", 0);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "socialLayerFullScreenBalloonController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeChildViewController:", v8);

  }
}

- (void)fullScreenBalloonViewController:(id)a3 verticallyScrollTranscriptByAmount:(double)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  _BYTE v16[22];
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v8 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = CFSTR("NO");
      *(_DWORD *)v16 = 138412802;
      *(_QWORD *)&v16[4] = v11;
      if (v8)
        v14 = CFSTR("YES");
      *(_WORD *)&v16[12] = 2048;
      *(double *)&v16[14] = a4;
      v17 = 2112;
      v18 = v14;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController: %@ verticallyScrollTranscriptByAmount: %.2f animated: %@ completion:", v16, 0x20u);
    }

  }
  -[CKCoreChatController collectionViewController](self, "collectionViewController", *(_OWORD *)v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "verticallyScrollTranscriptByAmount:animated:completion:", v8, v12, a4);

}

+ (void)chatItemForMessageGUID:(uint64_t)a1 messagePartIndex:(NSObject *)a2 chatItems:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Could not find chat item matching messageGUID: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)chatItemForMessageGUID:(uint64_t)a1 messagePartIndex:(uint64_t)a2 chatItems:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Could not find chat item matching messageGUID: %@ messagePartIndex: %ld", (uint8_t *)&v3, 0x16u);
}

@end
