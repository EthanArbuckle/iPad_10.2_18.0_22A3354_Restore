@implementation CKNotificationChatController

- (void)registerForTextInputPayloadHandling
{
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEAAE0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("com.apple.messages.currentLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSupportedPayloadIds:", v4);

  objc_msgSend(v3, "setPayloadDelegate:", self);
}

- (void)unregisterForTextInputPayloadHandling
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CEAAE0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPayloadDelegate:", 0);
  objc_msgSend(v2, "setSupportedPayloadIds:", MEMORY[0x1E0C9AA60]);

}

- (void)handlePayload:(id)a3 withPayloadId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.messages.currentLocation")))
    {
      CKSendCurrentLocation(self);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Unhandled text input payload ID: %@", (uint8_t *)&v10, 0xCu);
      }

    }
  }

}

- (CKNotificationChatController)initWithConversation:(id)a3 entryViewTraitCollection:(id)a4
{
  id v6;
  id v7;
  CKNotificationChatController *v8;
  CKNotificationChatController *v9;
  CGSize v10;
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
  _BOOL4 AddressedHandle;
  void *v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  id v48;
  void *v49;
  char v50;
  CKMessageEntryView *v51;
  CKMentionsController *v52;
  void *v53;
  void *v54;
  void *v55;
  CKMentionsController *v56;
  void *v57;
  NSObject *v58;
  uint64_t v60;
  CKScheduledUpdater *v61;
  id v62;
  objc_super v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v62 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v7, "startTimingForKey:", CFSTR("longlook-init"));
  v63.receiver = self;
  v63.super_class = (Class)CKNotificationChatController;
  v8 = -[CKCoreChatController initWithConversation:](&v63, sel_initWithConversation_, v6);
  v9 = v8;
  if (v8)
  {
    v10 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v8->_lastKnownKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v8->_lastKnownKeyboardFrame.size = v10;
    -[CKNotificationChatController setAllowedByScreenTime:](v8, "setAllowedByScreenTime:", objc_msgSend(v6, "isBlockedByCommunicationLimits") ^ 1);
    v61 = -[CKScheduledUpdater initWithTarget:action:]([CKScheduledUpdater alloc], "initWithTarget:action:", v9, sel_updateTyping);
    -[CKNotificationChatController setTypingUpdater:](v9, "setTypingUpdater:", v61);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v9, sel__raiseToListenSettingChanged_, CKPreferenceRaiseToListenDidChangeNotification, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController conversation](v9, "conversation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__messageReceivedInCurrentTranscript_, *MEMORY[0x1E0D353F8], v14);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController conversation](v9, "conversation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "chat");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v9, sel__allowedByScreenTimeChanged_, *MEMORY[0x1E0D352D8], v17);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v9, sel__handleKeyboardDidChangeFrameNotification_, *MEMORY[0x1E0CEB818], 0);

    objc_msgSend(v6, "lastAddressedHandle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastAddressedSIMID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    AddressedHandle = CKShowSubjectEnabledForLastAddressedHandle(v19, v20);

    objc_msgSend(v6, "chat");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isStewieChat");

    -[CKNotificationChatController systemMinimumLayoutMargins](v9, "systemMinimumLayoutMargins");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    -[CKNotificationChatController view](v9, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "effectiveUserInterfaceLayoutDirection");
    if (v33)
      v34 = v31;
    else
      v34 = v27;
    if (!v33)
      v27 = v31;

    -[CKNotificationChatController view](v9, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bounds");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;

    -[CKNotificationChatController traitCollection](v9, "traitCollection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "windowScene");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "_enhancedWindowingEnabled");

    if (v47)
    {
      v48 = v62;

      v44 = v48;
    }
    objc_msgSend(v6, "chat");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "supportsCapabilities:", 0x8000);

    BYTE3(v60) = v50 ^ 1;
    BYTE2(v60) = 0;
    BYTE1(v60) = v23;
    LOBYTE(v60) = v23;
    v51 = -[CKMessageEntryView initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:]([CKMessageEntryView alloc], "initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:", 0, 1, AddressedHandle & ~v23, -[CKNotificationChatController pluginButtonsEnabled](v9, "pluginButtonsEnabled"), CKShowCharacterCountEnabled(v23) != 0, v44, v37, v39, v41, v43, v25, v34, v29, v27, v60);
    v52 = [CKMentionsController alloc];
    -[CKMessageEntryView contentView](v51, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "textView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController conversation](v9, "conversation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[CKMentionsController initWithEntryTextView:conversation:](v52, "initWithEntryTextView:conversation:", v54, v55);
    -[CKNotificationChatController setMentionsController:](v9, "setMentionsController:", v56);

    -[CKMessageEntryView setAutoresizingMask:](v51, "setAutoresizingMask:", 2);
    -[CKMessageEntryView setDelegate:](v51, "setDelegate:", v9);
    -[CKMessageEntryView setInputDelegate:](v51, "setInputDelegate:", v9);
    -[CKCoreChatController conversation](v9, "conversation");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryView setConversation:](v51, "setConversation:", v57);

    -[CKMessageEntryView setSendingMessage:](v51, "setSendingMessage:", -[CKCoreChatController isSendingMessage](v9, "isSendingMessage"));
    -[CKMessageEntryView layoutIfNeeded](v51, "layoutIfNeeded");
    -[CKNotificationChatController setEntryView:](v9, "setEntryView:", v51);
    -[CKNotificationChatController _updateEntryViewFrameIfNeeded:](v9, "_updateEntryViewFrameIfNeeded:", 0);
    -[CKNotificationChatController _setupShouldShowReplyFromLockScreen](v9, "_setupShouldShowReplyFromLockScreen");

  }
  objc_msgSend(v7, "stopTimingForKey:", CFSTR("longlook-init"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v65 = v7;
      v66 = 2112;
      v67 = v6;
      _os_log_impl(&dword_18DFCD000, v58, OS_LOG_TYPE_INFO, "Initialized long look notification chatController: %@, with conversation: %@", buf, 0x16u);
    }

  }
  return v9;
}

- (void)backgroundViewTapGestureRecognized:(id)a3
{
  id v4;

  -[CKCoreChatController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptBackgroundTapped:", self);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKNotificationChatController typingUpdater](self, "typingUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CKNotificationChatController setTypingUpdater:](self, "setTypingUpdater:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController dealloc](&v4, sel_dealloc);
}

- (double)balloonMaxWidth
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
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;

  -[CKNotificationChatController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[CKNotificationChatController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CKNotificationChatController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "effectiveUserInterfaceLayoutDirection");
  if (v15)
    v16 = v13;
  else
    v16 = v9;
  if (!v15)
    v9 = v13;

  -[CKCoreChatController chat](self, "chat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isStewieChat");

  -[CKCoreChatController conversation](self, "conversation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendingService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18 | objc_msgSend(v20, "__ck_isiMessageLite");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "balloonMaxWidthForTranscriptWidth:marginInsets:shouldShowPluginButtons:shouldShowCharacterCount:shouldCoverSendButton:isStewieMode:", -[CKNotificationChatController pluginButtonsEnabled](self, "pluginButtonsEnabled"), CKShowCharacterCountEnabled(v21) != 0, 0, v21, v5, v7, v16, v11, v9);
  v24 = v23;

  return v24;
}

- (id)launchURLForInputMode:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNotificationChatController entryView](self, "entryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messagesURLWithChat:orHandles:withMessageText:", v7, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v13, "queryItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("inputmode"), v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

    objc_msgSend(v13, "setQueryItems:", v16);
    objc_msgSend(v13, "URL");
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v18;
  }

  return v12;
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
  -[CKNotificationChatController notificationFullScreenBalloonController](self, "notificationFullScreenBalloonController");
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
    -[CKNotificationChatController _dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:](self, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:", 1, 0, 0);
  }
  -[CKNotificationChatController _fullScreenBalloonViewControllerWithChatItem:](self, "_fullScreenBalloonViewControllerWithChatItem:", v4);
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
  -[CKNotificationChatController addChildViewController:](self, "addChildViewController:", v9);
  -[CKNotificationChatController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  objc_msgSend(v9, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController collectionView](self, "collectionView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  objc_msgSend(v13, "setFrame:");

  objc_msgSend(v9, "didMoveToParentViewController:", self);
  -[CKNotificationChatController setNotificationFullScreenBalloonController:](self, "setNotificationFullScreenBalloonController:", v9);
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

- (BOOL)wantsWindowedPresentation
{
  return 0;
}

- (BOOL)preserveModalPresentationStyle
{
  return 1;
}

- (BOOL)constrainToPresentingVCBounds
{
  return 1;
}

- (BOOL)forceWindowedPresentation
{
  return 0;
}

- (BOOL)messageEntryViewShouldVerticallyInsetForPresentedAppCard:(id)a3
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_fullScreenBalloonViewControllerWithChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  CKFullScreenBalloonViewControllerNotification *v10;
  void *v11;
  void *v12;
  CKFullScreenBalloonViewControllerNotification *v13;
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
  v10 = [CKFullScreenBalloonViewControllerNotification alloc];
  -[CKNotificationChatController _menuTitleForChatItem:](self, "_menuTitleForChatItem:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNotificationChatController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CKFullScreenBalloonViewControllerPhone initWithChatItem:title:interfaceActions:gradientReferenceView:pluginBalloonSnapshot:delegate:](v10, "initWithChatItem:title:interfaceActions:gradientReferenceView:pluginBalloonSnapshot:delegate:", v4, v11, 0, v12, v8, self);

  return v13;
}

- (id)_menuTitleForChatItem:(id)a3
{
  return (id)objc_msgSend(a3, "menuTitle");
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 tappedForChatItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v28 = 138412546;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "chatItemTapped balloonView = %@, chatItem = %@", (uint8_t *)&v28, 0x16u);
    }

  }
  v12 = (void *)objc_opt_class();
  if (objc_msgSend(v12, "isEqual:", objc_opt_class()))
  {
    v13 = v10;
    objc_msgSend(v13, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D375F8]);

    if (!v15)
    {
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(v13, "IMChatItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "dataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v17, "dataSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLToOpenOnTapAction");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dataSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v20)
          objc_msgSend(v21, "URLToOpenOnTapAction");
        else
          objc_msgSend(v21, "url");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          -[CKNotificationChatController urlOpenContext](self, "urlOpenContext");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "openURL:completionHandler:", v24, &__block_literal_global_230);

        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v17, "dataSource");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 138412290;
            v29 = v27;
            _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "URLToOpenOnTapAction was nil %@", (uint8_t *)&v28, 0xCu);

          }
        }

        goto LABEL_27;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v28) = 0;
          _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "dataSource was nil", (uint8_t *)&v28, 2u);
        }
LABEL_14:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "imChatItem was nil", (uint8_t *)&v28, 2u);
      }
      goto LABEL_14;
    }
LABEL_27:

    goto LABEL_28;
  }
LABEL_29:

}

- (void)viewDidLayoutSubviewsForTranscriptCollectionViewController:(id)a3
{
  void *v4;
  id v5;

  -[CKNotificationChatController notificationFullScreenBalloonController](self, "notificationFullScreenBalloonController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKNotificationChatController notificationFullScreenBalloonController](self, "notificationFullScreenBalloonController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateBalloonViewFrame");

  }
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 longPressedForItemWithIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "longPressedForItemWithIndexPath", buf, 2u);
    }

  }
  v12.receiver = self;
  v12.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController transcriptCollectionViewController:balloonView:longPressedForItemWithIndexPath:](&v12, sel_transcriptCollectionViewController_balloonView_longPressedForItemWithIndexPath_, v8, v9, v10);

}

- (void)_setConversationDeferredSetup
{
  CKRaiseGesture *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController _setConversationDeferredSetup](&v6, sel__setConversationDeferredSetup);
  if (+[CKRaiseGesture isRaiseGestureSupported](CKRaiseGesture, "isRaiseGestureSupported"))
  {
    v3 = -[CKRaiseGesture initWithTarget:action:]([CKRaiseGesture alloc], "initWithTarget:action:", self, sel_raiseGestureRecognized_);
    -[CKNotificationChatController setRaiseGesture:](self, "setRaiseGesture:", v3);
    -[CKNotificationChatController updateRaiseGesture](self, "updateRaiseGesture");

  }
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_backgroundViewTapGestureRecognized_);
  -[CKCoreChatController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addGestureRecognizer:", v4);

}

- (BOOL)shouldShowEntryView
{
  NSObject *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  _BOOL4 v18;
  uint8_t buf[4];
  _BOOL4 v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v18 = -[CKNotificationChatController shouldAllowReplyFromLockScreen](self, "shouldAllowReplyFromLockScreen");
      -[CKCoreChatController conversation](self, "conversation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "hasLeftGroupChat"))
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      -[CKCoreChatController conversation](self, "conversation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isReadOnlyChat"))
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      -[CKCoreChatController conversation](self, "conversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isBusinessChatDisabled");
      v10 = -[CKCoreChatController shouldDisplayTextEntry](self, "shouldDisplayTextEntry");
      if (v9)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      *(_DWORD *)buf = 67110146;
      v20 = v18;
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v11;
      v27 = 1024;
      v28 = v10;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "allow reply: %d has left: %@, read only: %@, isBusinessChatDisabled: %@, should display text entry: %d", buf, 0x2Cu);

    }
  }
  if (!-[CKNotificationChatController shouldAllowReplyFromLockScreen](self, "shouldAllowReplyFromLockScreen"))
    return 0;
  -[CKCoreChatController conversation](self, "conversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "hasLeftGroupChat") & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    -[CKCoreChatController conversation](self, "conversation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isReadOnlyChat") & 1) != 0
      || !-[CKCoreChatController shouldDisplayTextEntry](self, "shouldDisplayTextEntry"))
    {
      v13 = 0;
    }
    else
    {
      -[CKCoreChatController conversation](self, "conversation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isBusinessChatDisabled");

      v13 = v16 ^ 1;
    }

  }
  return v13;
}

- (BOOL)inputAccessoryViewControllerEnabled
{
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4[0] = 67109120;
      v4[1] = CKInputAccessoryViewControllerEnabled();
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "input accessory view enabled: %d", (uint8_t *)v4, 8u);
    }

  }
  return CKInputAccessoryViewControllerEnabled() != 0;
}

- (id)inputAccessoryViewController
{
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[CKNotificationChatController shouldShowEntryView](self, "shouldShowEntryView")
    && -[CKNotificationChatController inputAccessoryViewControllerEnabled](self, "inputAccessoryViewControllerEnabled"))
  {
    -[CKNotificationChatController entryViewController](self, "entryViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "input accessory view controller: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

- (id)inputAccessoryView
{
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[CKNotificationChatController shouldShowEntryView](self, "shouldShowEntryView")
    && !-[CKNotificationChatController inputAccessoryViewControllerEnabled](self, "inputAccessoryViewControllerEnabled"))
  {
    -[CKNotificationChatController entryView](self, "entryView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "input accessory view: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

- (void)setSendingMessage:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController setSendingMessage:](&v6, sel_setSendingMessage_);
  -[CKNotificationChatController entryView](self, "entryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSendingMessage:", v3);

}

- (void)setEntryView:(id)a3
{
  id v4;
  CKMessageEntryViewController *v5;
  NSObject *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = -[CKMessageEntryViewController initWithEntryView:]([CKMessageEntryViewController alloc], "initWithEntryView:", v4);
    -[CKNotificationChatController setEntryViewController:](self, "setEntryViewController:", v5);

  }
  else
  {
    -[CKNotificationChatController setEntryViewController:](self, "setEntryViewController:", 0);
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[CKNotificationChatController entryViewController](self, "entryViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Setting the entry view: entryview = %@, entryViewController = %@", (uint8_t *)&v10, 0x16u);

    }
  }
  v8 = -[CKNotificationChatController inputAccessoryViewControllerEnabled](self, "inputAccessoryViewControllerEnabled");
  -[CKNotificationChatController entryViewController](self, "entryViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInputAccessoryViewControllerEnabled:", v8);

}

- (CKMessageEntryView)entryView
{
  void *v2;
  void *v3;

  -[CKNotificationChatController entryViewController](self, "entryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKMessageEntryView *)v3;
}

- (void)_handleKeyboardDidChangeFrameNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEB890]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(v6, "CGRectValue");
    -[CKNotificationChatController setLastKnownKeyboardFrame:](self, "setLastKnownKeyboardFrame:");
    v5 = v6;
  }

}

- (double)_maxEntryViewHeight
{
  void *v3;
  void *v4;
  int v5;
  double height;
  uint64_t NonFlatDeviceOrientation;
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  -[CKNotificationChatController entryView](self, "entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasContent");

  height = 0.0;
  if (v5)
  {
    if (_maxEntryViewHeight__pred_BKHIDServicesGetNonFlatDeviceOrientationBackBoardServices != -1)
      dispatch_once(&_maxEntryViewHeight__pred_BKHIDServicesGetNonFlatDeviceOrientationBackBoardServices, &__block_literal_global_97_1);
    NonFlatDeviceOrientation = _maxEntryViewHeight__BKHIDServicesGetNonFlatDeviceOrientation();
    objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "windowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_enhancedWindowingEnabled");

    if (v10)
    {
      height = self->_lastKnownKeyboardFrame.size.height;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA6C8], "sizeForInterfaceOrientation:ignoreInputView:", NonFlatDeviceOrientation, 1);
      height = v11;
    }
  }
  objc_msgSend(v3, "placeholderHeight");
  v13 = v12;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entryViewlayoutMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "defaultEntryContentViewHeight");
  v17 = v16;
  objc_msgSend(v15, "entryViewContentInsets");
  v19 = v17 - v18;
  objc_msgSend(v15, "entryViewContentInsets");
  v21 = v19 - v20;
  -[CKNotificationChatController entryView](self, "entryView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "window");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "bounds");
  v25 = v24;
  v27 = v26;

  objc_msgSend(v3, "sizeThatFits:", v25, 1.79769313e308);
  v29 = v13 + v21;
  if (v28 < v13 + v21)
    v29 = v28;
  v30 = height + v29;
  if (v30 >= v27)
    v30 = v27;
  v31 = v30 - height;

  return v31;
}

void *__51__CKNotificationChatController__maxEntryViewHeight__block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("BKHIDServicesGetNonFlatDeviceOrientation", CFSTR("BackBoardServices"));
  _maxEntryViewHeight__BKHIDServicesGetNonFlatDeviceOrientation = result;
  return result;
}

- (void)_updateEntryViewFrameIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double v18;
  void *v19;
  id v20;

  v3 = a3;
  -[CKNotificationChatController entryView](self, "entryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v20;
  if (v20)
  {
    objc_msgSend(v20, "bounds");
    v8 = v7;
    -[CKNotificationChatController _maxEntryViewHeight](self, "_maxEntryViewHeight");
    v10 = v9;
    -[CKNotificationChatController entryView](self, "entryView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;

    v6 = v20;
    if (v13 != v8 || v15 != v10)
    {
      v17 = *MEMORY[0x1E0C9D648];
      v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      -[CKCoreChatController collectionViewController](self, "collectionViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "scrollTranscriptToEntryViewInsertionTimeWithAnimation:", 0);

      -[CKNotificationChatController _setEntryViewFrame:animated:](self, "_setEntryViewFrame:animated:", v3, v17, v18, v8, v10);
      v6 = v20;
    }
  }

}

- (void)_setEntryViewFrame:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  _QWORD aBlock[5];
  CGRect v11;

  v4 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CKNotificationChatController__setEntryViewFrame_animated___block_invoke;
  aBlock[3] = &unk_1E274B8B8;
  aBlock[4] = self;
  v11 = a3;
  v5 = _Block_copy(aBlock);
  v6 = v5;
  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resizeMessageEntryViewAnimationDuration");
    v9 = v8;

    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, v9, 0.0);
  }
  else
  {
    (*((void (**)(void *))v5 + 2))(v5);
  }

}

void __60__CKNotificationChatController__setEntryViewFrame_animated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  if (v3 != *(double *)(a1 + 56) || v2 != *(double *)(a1 + 64))
  {
    objc_msgSend(v6, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48));
    objc_msgSend(v6, "layoutIfNeeded");
    objc_msgSend(v6, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

  }
}

- (void)setConversation:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController setConversation:](&v3, sel_setConversation_, a3);
}

- (BOOL)pluginButtonsEnabled
{
  void *v2;
  char v3;

  -[CKCoreChatController chat](self, "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStewieChat");

  return v3 ^ 1;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  objc_super v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)CKNotificationChatController;
  -[CKNotificationChatController becomeFirstResponder](&v10, sel_becomeFirstResponder);
  -[CKNotificationChatController entryView](self, "entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "becomeFirstResponder");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v6)
        v8 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Entry View became FR with success %@", buf, 0xCu);
    }

  }
  return v6;
}

- (void)setLocalUserIsComposing:(BOOL)a3 withPluginBundleID:(id)a4 typingIndicatorData:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  v11 = a4;
  v8 = a5;
  -[CKCoreChatController conversation](self, "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "setLocalUserIsComposing:typingIndicatorIcon:", v11, v8);
  else
    objc_msgSend(v9, "setLocalUserIsComposing:", 0);

}

- (void)sendComposition:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint8_t buf[16];
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[CKCoreChatController isSendingMessage](self, "isSendingMessage"))
  {
    -[CKCoreChatController conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resetCaches");
    if ((objc_msgSend(v4, "hasContent") & 1) != 0)
    {
      objc_msgSend(v6, "recipients");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "canSendToRecipients:alertIfUnable:", v7, 1);

      if (v8)
      {
        v32 = 0;
        v9 = objc_msgSend(v6, "canSendComposition:error:", v4, &v32);
        v10 = v32;
        v11 = v10;
        if ((v9 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeAutocorrectPrompt");

          -[CKNotificationChatController setSendingMessage:](self, "setSendingMessage:", 1);
          objc_msgSend(v6, "messageWithComposition:", v4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setUnsentComposition:", 0);
          objc_msgSend(v6, "sendMessage:newComposition:", v13, 0);
          -[CKNotificationChatController entryView](self, "entryView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "composition");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", v4);

          if (v16)
          {
            -[CKNotificationChatController entryView](self, "entryView");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setComposition:", 0);

          }
          -[CKNotificationChatController setSendingMessage:](self, "setSendingMessage:", 0);
          objc_msgSend(v4, "expressiveSendStyleID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = +[CKImpactEffectManager identifierIsAnimatedImpactEffect:](CKImpactEffectManager, "identifierIsAnimatedImpactEffect:", v18);

          if (v19)
          {
            -[CKCoreChatController collectionViewController](self, "collectionViewController");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "impactEffectManager");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v34[0] = v13;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "animateMessages:", v22);

          }
          objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isExpressiveTextEnabled");

          if (!v24)
            goto LABEL_21;
          -[CKNotificationChatController entryView](self, "entryView");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "contentView");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "textView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "hideTextEffectsPickerIfNeededAndResetTypingAttributes");
        }
        else
        {
          if (!v10)
          {
LABEL_22:

            goto LABEL_23;
          }
          CKFrameworkBundle();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CANNOT_SEND_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          CKFrameworkBundle();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          CKCreateAlertControllerWithError(v11, v13, 0, v27, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            -[CKCoreChatController delegate](self, "delegate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "presentFromViewController:animated:completion:", v31, 1, 0);

          }
        }

LABEL_21:
        goto LABEL_22;
      }
    }
    else
    {
      -[CKNotificationChatController messageEntryViewDidChange:isTextChange:isShelfChange:](self, "messageEntryViewDidChange:isTextChange:isShelfChange:", 0, 1, 0);
    }
LABEL_23:

    goto LABEL_24;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Tried sending a message with another send in flight", buf, 2u);
    }

  }
LABEL_24:

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSDate *v6;
  NSDate *notificationViewWillAppearDate;
  void *v8;
  NSTimer *v9;
  NSTimer *notificationViewDismissalTimer;
  _QWORD v11[4];
  id v12;
  uint8_t buf[8];
  objc_super v14;

  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "viewWillAppear: ", buf, 2u);
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController viewWillAppear:](&v14, sel_viewWillAppear_, v3);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
  notificationViewWillAppearDate = self->_notificationViewWillAppearDate;
  self->_notificationViewWillAppearDate = v6;

  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v8 = (void *)MEMORY[0x1E0C99E88];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__CKNotificationChatController_viewWillAppear___block_invoke;
  v11[3] = &unk_1E2757590;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 0, v11, 3600.0);
  v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  notificationViewDismissalTimer = self->_notificationViewDismissalTimer;
  self->_notificationViewDismissalTimer = v9;

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __47__CKNotificationChatController_viewWillAppear___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __47__CKNotificationChatController_viewWillAppear___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationChatControllerRequestDismissNotificationContentExtension:", WeakRetained);

}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[CKNotificationChatController updateRaiseGesture](self, "updateRaiseGesture");
  -[CKNotificationChatController registerForTextInputPayloadHandling](self, "registerForTextInputPayloadHandling");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "viewDidAppear: ", v5, 2u);
    }

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  objc_super v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D353F8];
  -[CKCoreChatController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v6, v8);

  v12.receiver = self;
  v12.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController viewWillDisappear:](&v12, sel_viewWillDisappear_, v3);
  -[CKNotificationChatController updateRaiseGesture](self, "updateRaiseGesture");
  -[CKNotificationChatController unregisterForTextInputPayloadHandling](self, "unregisterForTextInputPayloadHandling");
  -[CKNotificationChatController notificationFullScreenBalloonController](self, "notificationFullScreenBalloonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[CKNotificationChatController _dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:](self, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:", 1, 0, 0);
  -[NSTimer invalidate](self->_notificationViewDismissalTimer, "invalidate");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "viewWillDisappear: ", v11, 2u);
    }

  }
}

- (BOOL)isSafeToMarkAsRead
{
  NSDate *notificationViewWillAppearDate;
  BOOL v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKNotificationChatController;
  if (!-[CKCoreChatController isSafeToMarkAsRead](&v15, sel_isSafeToMarkAsRead))
    return 0;
  notificationViewWillAppearDate = self->_notificationViewWillAppearDate;
  v4 = notificationViewWillAppearDate == 0;
  if (notificationViewWillAppearDate)
  {
    -[NSDate timeIntervalSinceNow](notificationViewWillAppearDate, "timeIntervalSinceNow");
    if (v5 >= -3600.0)
      return 1;
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CKNotificationChatController isSafeToMarkAsRead].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  else
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CKNotificationChatController isSafeToMarkAsRead].cold.1(v6);
  }

  return v4;
}

- (void)viewLayoutMarginsDidChange
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
  void *v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)CKNotificationChatController;
  -[CKNotificationChatController viewLayoutMarginsDidChange](&v19, sel_viewLayoutMarginsDidChange);
  -[CKNotificationChatController balloonMaxWidth](self, "balloonMaxWidth");
  v4 = v3;
  -[CKNotificationChatController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CKNotificationChatController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "effectiveUserInterfaceLayoutDirection");
  if (v14)
    v15 = v12;
  else
    v15 = v8;
  if (!v14)
    v8 = v12;

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNotificationChatController traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "invalidateChatItemLayoutWithNewBalloonMaxWidth:marginInsets:traitCollection:", v17, v4, v6, v15, v10, v8);

  objc_msgSend(v16, "viewIfLoaded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNeedsLayout");

}

- (void)_setupShouldShowReplyFromLockScreen
{
  int AppBooleanValue;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[15];
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesSynchronize(CFSTR("com.apple.mobilephone"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("LockScreenMessaging"), CFSTR("com.apple.mobilephone"), &keyExistsAndHasValidFormat);
  v4 = keyExistsAndHasValidFormat;
  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUnderFirstDataProtectionLock");

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Under first unlock. Not allowing lock screen messaging", v9, 2u);
      }

    }
    goto LABEL_8;
  }
  v8 = 1;
  if (v4 && !AppBooleanValue)
LABEL_8:
    v8 = -[CKNotificationChatController _deviceIsPasscodeLocked](self, "_deviceIsPasscodeLocked") ^ 1;
  -[CKNotificationChatController setShouldAllowReplyFromLockScreen:](self, "setShouldAllowReplyFromLockScreen:", v8);
}

- (void)_allowedByScreenTimeChanged:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  void *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "allowedByScreenTime");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = CFSTR("NO");
        if ((_DWORD)v8)
          v10 = CFSTR("YES");
        v11 = 138412546;
        v12 = v7;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "chat: %@ allowedByScreenTime state changed to: %@", (uint8_t *)&v11, 0x16u);
      }

    }
    -[CKNotificationChatController setAllowedByScreenTime:](self, "setAllowedByScreenTime:", v8);

  }
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (self->_allowedByScreenTime != a3)
  {
    self->_allowedByScreenTime = a3;
    if (a3)
    {
      -[CKNotificationChatController lockoutViewController](self, "lockoutViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeFromSuperview");

      -[CKNotificationChatController setLockoutViewController:](self, "setLockoutViewController:", 0);
      -[CKNotificationChatController becomeFirstResponder](self, "becomeFirstResponder");
      -[CKNotificationChatController reloadInputViews](self, "reloadInputViews");
    }
    else
    {
      -[CKCoreChatController collectionView](self, "collectionView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resignFirstResponder");

      -[CKCoreChatController conversation](self, "conversation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "chat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "conversationContext");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v9 = -[CKNotificationChatController lockoutViewControllerClass](self, "lockoutViewControllerClass");
      if (v18)
      {
        -[CKCoreChatController conversation](self, "conversation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "contactNameByHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class lockoutViewControllerWithConversationContext:bundleIdentifier:contactStore:applicationName:contactNameByHandle:](v9, "lockoutViewControllerWithConversationContext:bundleIdentifier:contactStore:applicationName:contactNameByHandle:", v18, CFSTR("com.apple.MobileSMS"), 0, 0, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNotificationChatController setLockoutViewController:](self, "setLockoutViewController:", v12);
      }
      else
      {
        -[CKCoreChatController _handleIDsForCurrentConversation](self, "_handleIDsForCurrentConversation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKCoreChatController conversation](self, "conversation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contactNameByHandle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class lockoutViewControllerWithBundleIdentifier:contactsHandles:contactNameByHandle:](v9, "lockoutViewControllerWithBundleIdentifier:contactsHandles:contactNameByHandle:", CFSTR("com.apple.MobileSMS"), v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKNotificationChatController setLockoutViewController:](self, "setLockoutViewController:", v13);

      }
      -[CKNotificationChatController lockoutViewController](self, "lockoutViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKNotificationChatController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", v15);

      -[CKNotificationChatController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      objc_msgSend(v15, "setFrame:");

      objc_msgSend(v15, "setAutoresizingMask:", 18);
    }
  }
}

- (void)_messageReceivedInCurrentTranscript:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  CKEntity *v6;
  void *v7;
  CKEntity *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D354E8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [CKEntity alloc];
  objc_msgSend(v5, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKEntity initWithIMHandle:](v6, "initWithIMHandle:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF738]), "initWithType:", 3);
  -[CKEntity textToneIdentifier](v8, "textToneIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)*MEMORY[0x1E0DBF788];
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DBF788]))
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  -[CKEntity textVibrationIdentifier](v8, "textVibrationIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)*MEMORY[0x1E0DBF790];
  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DBF790]))
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_msgSend(v9, "setVibrationIdentifier:", v17);
  objc_msgSend(v9, "setToneIdentifier:", v13);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__70;
  v27 = __Block_byref_object_dispose__70;
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0DBF730], "alertWithConfiguration:", v9);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v24[5];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __68__CKNotificationChatController__messageReceivedInCurrentTranscript___block_invoke;
  v20[3] = &unk_1E27593D8;
  v22 = &v23;
  v19 = v5;
  v21 = v19;
  objc_msgSend(v18, "playWithCompletionHandler:", v20);

  _Block_object_dispose(&v23, 8);
}

void __68__CKNotificationChatController__messageReceivedInCurrentTranscript___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

  if (a2 == 5)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(48);
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "guid");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_msgSend(v5, "userInfo");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = &stru_1E276D870;
        }
        *(_DWORD *)buf = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Error playing alert for guid [%@]: [%@]", buf, 0x16u);
        if (v5)

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      objc_msgSend(*(id *)(a1 + 32), "guid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v5, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _CKLogExternal();

      }
      else
      {
        _CKLogExternal();
      }

    }
  }

}

- (id)progressBar
{
  return 0;
}

- (BOOL)transcriptCollectionViewControllerShouldPlayAudio:(id)a3
{
  return 1;
}

- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4
{
  id v5;

  -[CKCoreChatController delegate](self, "delegate", a3, a4.width, a4.height);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationChatControllerSizeUpdated:", self);

}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 didRequestReaderViewControllerForChatItem:(id)a5
{
  void *v6;
  id v7;

  -[CKCoreChatController conversation](self, "conversation", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CKNotificationChatController _openMessagesForChat:](self, "_openMessagesForChat:", v7);
}

- (CGRect)effectiveVisibleRectOfCollectionViewForTranscriptCollectionViewController:(id)a3
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[CKCoreChatController collectionView](self, "collectionView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "adjustedContentInset");
  v13 = v5 + v12;
  v15 = v7 + v14;
  v17 = v9 - (v12 + v16);
  v19 = v11 - (v14 + v18);

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)messageEntryViewActiveSendMenuPresentation:(id)a3
{
  return 0;
}

- (void)messageEntryViewDidChange:(id)a3 isTextChange:(BOOL)a4 isShelfChange:(BOOL)a5
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(v17, "composition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v18, "isAudioComposition") & 1) == 0)
  {
    objc_msgSend(v18, "mediaObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9), "transfer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isAdaptiveImageGlyph");
          IMLogHandleForCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
          if (v11)
          {
            if (v13)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Not launching app for inserted media object that is an adaptive image glyph.", buf, 2u);
            }
          }
          else
          {
            if (v13)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Launching app for inserted media object.", buf, 2u);
            }

            -[CKCoreChatController conversation](self, "conversation");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "chat");
            v12 = objc_claimAutoreleasedReturnValue();

            -[CKNotificationChatController _openMessagesForChat:](self, "_openMessagesForChat:", v12);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

  }
  -[CKNotificationChatController typingUpdater](self, "typingUpdater");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNeedsUpdate");

  -[CKNotificationChatController _updateEntryViewFrameIfNeeded:](self, "_updateEntryViewFrameIfNeeded:", 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "messageEntryViewDidChange:isTextChange:isShelfChange:", buf, 2u);
    }

  }
}

- (void)_openMessagesForChat:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "chatIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__im_URLForChatIdentifier:entryBody:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Launching messages with chat URL: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__CKNotificationChatController__openMessagesForChat___block_invoke;
  v9[3] = &unk_1E274A1B8;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "openURL:withCompletionHandler:", v8, v9);

}

void __53__CKNotificationChatController__openMessagesForChat___block_invoke(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  if ((a2 & 1) == 0)
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__CKNotificationChatController__openMessagesForChat___block_invoke_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("sms://"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__CKNotificationChatController__openMessagesForChat___block_invoke_151;
    v13[3] = &unk_1E274A1B8;
    v14 = v10;
    v12 = v10;
    objc_msgSend(v11, "openURL:withCompletionHandler:", v12, v13);

  }
}

void __53__CKNotificationChatController__openMessagesForChat___block_invoke_151(uint64_t a1, char a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __53__CKNotificationChatController__openMessagesForChat___block_invoke_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)messageEntryViewRecordingDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopPlayingAudio");

  -[CKNotificationChatController typingUpdater](self, "typingUpdater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsUpdate");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "messageEntryViewRecordingDidChange: ", v8, 2u);
    }

  }
}

- (id)inputContextHistoryForMessageEntryView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  -[CKCoreChatController conversation](self, "conversation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isKnownSender") & 1) != 0)
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputContextHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Not providing input context history because conversation is with an unknown sender.", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (BOOL)messageEntryViewShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)messageEntryViewDidBeginEditingNotAlreadyActive:(id)a3
{
  id v3;

  -[CKCoreChatController collectionViewController](self, "collectionViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollTranscriptToEntryViewInsertionTimeWithAnimation:", 1);

}

- (void)messageEntryViewDidEndEditing:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasContent");

  -[CKCoreChatController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v12, "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUnsentComposition:", v8);

    +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "saveCompositionAndFlushCache:", 1);

    objc_msgSend(v12, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "checkForMentions");

  }
  else
  {
    objc_msgSend(v6, "setUnsentComposition:", 0);

    +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "saveCompositionAndFlushCache:", 1);
  }

}

- (BOOL)messageEntryView:(id)a3 shouldInsertMediaObjects:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[CKCoreChatController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "composition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "compositionByAppendingMediaObjects:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "canSendComposition:error:", v10, 0);
  return (char)v6;
}

- (void)messageEntryViewSendButtonHit:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__CKNotificationChatController_messageEntryViewSendButtonHit___block_invoke;
  v3[3] = &unk_1E274C848;
  v3[4] = self;
  objc_msgSend(a3, "compositionWithAcceptedAutocorrection:", v3);
}

uint64_t __62__CKNotificationChatController_messageEntryViewSendButtonHit___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendComposition:", a2);
}

- (void)messageEntryViewPlusButtonHit:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  IMLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Plus button hit", v4, 2u);
  }

}

- (CGSize)messageEntryViewMaxShelfPluginViewSize:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (Class)lockoutViewControllerClass
{
  void *v2;

  v2 = (void *)CKSTLockoutViewControllerClass;
  if (!CKSTLockoutViewControllerClass)
  {
    v2 = (void *)MEMORY[0x193FF3C18](CFSTR("STLockoutViewController"), CFSTR("ScreenTimeUI"));
    CKSTLockoutViewControllerClass = (uint64_t)v2;
  }
  return (Class)v2;
}

- (void)messageEntryViewSafeAreaInsetsDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CKNotificationChatController_messageEntryViewSafeAreaInsetsDidChange___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __72__CKNotificationChatController_messageEntryViewSafeAreaInsetsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEntryViewFrameIfNeeded:", 0);
}

- (void)messageEntryView:(id)a3 didMoveToWindow:(id)a4
{
  -[CKNotificationChatController _updateEntryViewFrameIfNeeded:](self, "_updateEntryViewFrameIfNeeded:", 0, a4);
}

- (void)messageEntryViewWantsGenerativePlaygroundPluginPresented:(id)a3 presentationStyle:(unint64_t)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  IMLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CKNotificationChatController messageEntryViewWantsGenerativePlaygroundPluginPresented:presentationStyle:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

}

- (void)_launchMessagesForInputMode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Launching Messages with InputMode=%{public}@", (uint8_t *)&v8, 0xCu);
  }

  -[CKNotificationChatController urlOpenContext](self, "urlOpenContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNotificationChatController launchURLForInputMode:](self, "launchURLForInputMode:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openURL:completionHandler:", v7, &__block_literal_global_158_1);

}

void __60__CKNotificationChatController__launchMessagesForInputMode___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  IMLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "_launchMessagesForInputMode returned %{BOOL}d", (uint8_t *)v4, 8u);
  }

}

- (void)messageEntryView:(id)a3 didSelectPlusButton:(id)a4
{
  -[CKNotificationChatController _launchMessagesForInputMode:](self, "_launchMessagesForInputMode:", CFSTR("apps"), a4);
}

- (void)messageEntryView:(id)a3 didLongPressPlusButton:(id)a4
{
  -[CKNotificationChatController _launchMessagesForInputMode:](self, "_launchMessagesForInputMode:", CFSTR("photos"), a4);
}

- (void)launchAppFromExtensionWith:(id)a3
{
  -[CKNotificationChatController _launchMessagesForInputMode:](self, "_launchMessagesForInputMode:", CFSTR("chatbot"));
}

- (BOOL)shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:(id)a3
{
  return 1;
}

- (int64_t)messageEntryViewHighLightInputButton:(id)a3
{
  return 0;
}

- (void)messageEntryViewPhotoButtonHit:(id)a3
{
  -[CKNotificationChatController _launchMessagesForInputMode:](self, "_launchMessagesForInputMode:", CFSTR("camera"));
}

- (void)messageEntryViewBrowserButtonHit:(id)a3
{
  -[CKNotificationChatController _launchMessagesForInputMode:](self, "_launchMessagesForInputMode:", CFSTR("apps"));
}

- (void)messageEntryViewHandwritingButtonHit:(id)a3
{
  -[CKNotificationChatController _launchMessagesForInputMode:](self, "_launchMessagesForInputMode:", CFSTR("handwriting"));
}

- (BOOL)messageEntryShouldHideCaret:(id)a3
{
  return 0;
}

- (BOOL)messageEntryViewWidth:(double *)a3 andOffset:(double *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;

  -[CKNotificationChatController entryView](self, "entryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "bounds");
    *(_QWORD *)a3 = v8;
    *a4 = 0.0;
  }

  return v7 != 0;
}

- (void)updateTyping
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKNotificationChatController entryView](self, "entryView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v7, "isRecording");
  -[CKCoreChatController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setLocalUserIsRecording:", 1);
  }
  else
  {
    objc_msgSend(v7, "composition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalUserIsTyping:", objc_msgSend(v6, "hasContent"));

  }
}

- (BOOL)wantsReplyButton
{
  return 0;
}

- (void)raiseGestureRecognized:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  -[CKCoreChatController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBlockedByCommunicationLimits");

  if ((v5 & 1) == 0)
    -[CKNotificationChatController __raiseGestureRecognized:](self, "__raiseGestureRecognized:", v6);

}

- (void)__raiseGestureRecognized:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAudioMessagesEntryViewRecordingEnabled");

  if ((v5 & 1) == 0)
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canRaiseToListen");

    if (v7)
    {
      -[CKCoreChatController collectionViewController](self, "collectionViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raiseGestureRecognized:", v10);
    }
    else if (objc_msgSend(v10, "isRecognized"))
    {
      -[CKNotificationChatController entryView](self, "entryView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "startRecordingForRaiseGesture");
    }
    else
    {
      v9 = objc_msgSend(v10, "gestureState");
      -[CKNotificationChatController entryView](self, "entryView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stopRecordingForRaiseGestureWithFailure:", v9 == 2);
    }

  }
}

- (void)_dismissFullScreenBubbleViewControllerAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  CKNotificationChatController *v20;
  id v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v5 = a4;
  v6 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v6)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v11 = _Block_copy(v8);
      *(_DWORD *)buf = 138412802;
      v23 = v10;
      v24 = 1024;
      v25 = v5;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated: %@, withSendAnimation: %d, completion %@", buf, 0x1Cu);

    }
  }
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __108__CKNotificationChatController__dismissFullScreenBubbleViewControllerAnimated_withSendAnimation_completion___block_invoke;
  v19 = &unk_1E274C2E0;
  v20 = self;
  v21 = v8;
  v12 = v8;
  v13 = _Block_copy(&v16);
  -[CKNotificationChatController notificationFullScreenBalloonController](self, "notificationFullScreenBalloonController", v16, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v5)
    objc_msgSend(v14, "performSendAndCloseAnimationWithCompletion:", v13);
  else
    objc_msgSend(v14, "performCancelAnimationWithCompletion:", v13);

}

uint64_t __108__CKNotificationChatController__dismissFullScreenBubbleViewControllerAnimated_withSendAnimation_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t result;
  uint8_t v11[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:dismissViewController", v11, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "notificationFullScreenBalloonController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "notificationFullScreenBalloonController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willMoveToParentViewController:", 0);

    objc_msgSend(*(id *)(a1 + 32), "notificationFullScreenBalloonController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "notificationFullScreenBalloonController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didMoveToParentViewController:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setNotificationFullScreenBalloonController:", 0);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "notificationFullScreenBalloonController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeChildViewController:", v9);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateRaiseGesture
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  int v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  _BYTE v12[12];
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKViewController appeared](self, "appeared"))
  {
    if ((objc_msgSend(v3, "canRaiseToListen") & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "canRaiseToTalk");
  }
  else
  {
    v4 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (-[CKViewController appeared](self, "appeared"))
        v6 = CFSTR("YES");
      else
        v6 = CFSTR("NO");
      v7 = objc_msgSend(v3, "canRaiseToListen");
      v8 = objc_msgSend(v3, "canRaiseToTalk");
      if (v7)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      *(_DWORD *)v12 = 138412802;
      if (v8)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      *(_QWORD *)&v12[4] = v6;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Updating raise gesture, appeared %@, canRaiseToListen %@, canRaiseToTalk %@", v12, 0x20u);
    }

  }
  -[CKNotificationChatController raiseGesture](self, "raiseGesture", *(_QWORD *)v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEnabled:", v4);

}

- (NSExtensionContext)urlOpenContext
{
  return (NSExtensionContext *)objc_loadWeakRetained((id *)&self->_urlOpenContext);
}

- (void)setUrlOpenContext:(id)a3
{
  objc_storeWeak((id *)&self->_urlOpenContext, a3);
}

- (CKFullScreenBalloonViewControllerNotification)notificationFullScreenBalloonController
{
  return (CKFullScreenBalloonViewControllerNotification *)objc_loadWeakRetained((id *)&self->_notificationFullScreenBalloonController);
}

- (void)setNotificationFullScreenBalloonController:(id)a3
{
  objc_storeWeak((id *)&self->_notificationFullScreenBalloonController, a3);
}

- (CKMessageEntryViewController)entryViewController
{
  return self->_entryViewController;
}

- (void)setEntryViewController:(id)a3
{
  objc_storeStrong((id *)&self->_entryViewController, a3);
}

- (CKScheduledUpdater)typingUpdater
{
  return self->_typingUpdater;
}

- (void)setTypingUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_typingUpdater, a3);
}

- (CKRaiseGesture)raiseGesture
{
  return self->_raiseGesture;
}

- (void)setRaiseGesture:(id)a3
{
  objc_storeStrong((id *)&self->_raiseGesture, a3);
}

- (BOOL)shouldAllowReplyFromLockScreen
{
  return self->_shouldAllowReplyFromLockScreen;
}

- (void)setShouldAllowReplyFromLockScreen:(BOOL)a3
{
  self->_shouldAllowReplyFromLockScreen = a3;
}

- (NSDate)notificationViewWillAppearDate
{
  return self->_notificationViewWillAppearDate;
}

- (void)setNotificationViewWillAppearDate:(id)a3
{
  objc_storeStrong((id *)&self->_notificationViewWillAppearDate, a3);
}

- (NSTimer)notificationViewDismissalTimer
{
  return self->_notificationViewDismissalTimer;
}

- (void)setNotificationViewDismissalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_notificationViewDismissalTimer, a3);
}

- (CGRect)lastKnownKeyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lastKnownKeyboardFrame.origin.x;
  y = self->_lastKnownKeyboardFrame.origin.y;
  width = self->_lastKnownKeyboardFrame.size.width;
  height = self->_lastKnownKeyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLastKnownKeyboardFrame:(CGRect)a3
{
  self->_lastKnownKeyboardFrame = a3;
}

- (BOOL)allowedByScreenTime
{
  return self->_allowedByScreenTime;
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
  objc_storeStrong((id *)&self->_lockoutViewController, a3);
}

- (CKMentionsController)mentionsController
{
  return self->_mentionsController;
}

- (void)setMentionsController:(id)a3
{
  objc_storeStrong((id *)&self->_mentionsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionsController, 0);
  objc_storeStrong((id *)&self->_lockoutViewController, 0);
  objc_storeStrong((id *)&self->_notificationViewDismissalTimer, 0);
  objc_storeStrong((id *)&self->_notificationViewWillAppearDate, 0);
  objc_storeStrong((id *)&self->_raiseGesture, 0);
  objc_storeStrong((id *)&self->_typingUpdater, 0);
  objc_storeStrong((id *)&self->_entryViewController, 0);
  objc_destroyWeak((id *)&self->_notificationFullScreenBalloonController);
  objc_destroyWeak((id *)&self->_urlOpenContext);
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
  v11.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController fullScreenBalloonViewController:sendMessageAcknowledgment:forChatItem:](&v11, sel_fullScreenBalloonViewController_sendMessageAcknowledgment_forChatItem_, v8, a4, v9);

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
  v8.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController fullScreenBalloonViewController:didAppearAnimated:](&v8, sel_fullScreenBalloonViewController_didAppearAnimated_, v6, v4);

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
  v6.super_class = (Class)CKNotificationChatController;
  -[CKCoreChatController fullScreenBalloonViewControllerDidDisappear:](&v6, sel_fullScreenBalloonViewControllerDidDisappear_, v4);

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
  aBlock[2] = __121__CKNotificationChatController_FullScreenBalloonViewControllerDelegate__fullScreenBalloonViewControllerHandleDismissTap___block_invoke;
  aBlock[3] = &unk_1E274A208;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  -[CKNotificationChatController notificationFullScreenBalloonController](self, "notificationFullScreenBalloonController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performCancelAnimationWithCompletion:", v6);

}

void __121__CKNotificationChatController_FullScreenBalloonViewControllerDelegate__fullScreenBalloonViewControllerHandleDismissTap___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "notificationFullScreenBalloonController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "notificationFullScreenBalloonController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "willMoveToParentViewController:", 0);

    objc_msgSend(*(id *)(a1 + 32), "notificationFullScreenBalloonController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "notificationFullScreenBalloonController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didMoveToParentViewController:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setNotificationFullScreenBalloonController:", 0);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "notificationFullScreenBalloonController");
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

void __47__CKNotificationChatController_viewWillAppear___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_18DFCD000, a1, a3, "Notification view appeared more than %ld seconds ago. Dismissing notification view.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)isSafeToMarkAsRead
{
  OUTLINED_FUNCTION_2_1(&dword_18DFCD000, a1, a3, "Notification view appeared more than %ld seconds ago. Not allowing message to be marked as read.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __53__CKNotificationChatController__openMessagesForChat___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Failed to open messages for URL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)messageEntryViewWantsGenerativePlaygroundPluginPresented:(uint64_t)a3 presentationStyle:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a1, a3, "%s - this should not be called in here", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
