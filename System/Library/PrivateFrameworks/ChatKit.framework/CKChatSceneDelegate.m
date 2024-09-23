@implementation CKChatSceneDelegate

- (CKChatSceneDelegate)init
{
  CKChatSceneDelegate *v2;
  CKNavigationController *v3;
  CKNavigationController *navigationController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKChatSceneDelegate;
  v2 = -[CKSceneDelegate init](&v11, sel_init);
  if (v2)
  {
    v3 = -[CKNavigationController initWithRootViewController:]([CKNavigationController alloc], "initWithRootViewController:", v2->_chatController);
    navigationController = v2->_navigationController;
    v2->_navigationController = v3;

    -[CKSceneDelegate window](v2, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRootViewController:", v2->_navigationController);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__chatItemsDidChange_, *MEMORY[0x1E0D35328], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__handleRegistryWillUnregisterChatNotification_, *MEMORY[0x1E0D354C8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__handleChatDisplayNameChangedNotification_, *MEMORY[0x1E0D352F0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification_, *MEMORY[0x1E0D35478], 0);

  }
  return v2;
}

- (int64_t)type
{
  return 1;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(void *, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  CKMacToolbarController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  id v32;
  CKChatSceneDelegate *v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __58__CKChatSceneDelegate_scene_willConnectToSession_options___block_invoke;
  v29 = &unk_1E274B060;
  v11 = v8;
  v30 = v11;
  v12 = v9;
  v31 = v12;
  v13 = v10;
  v32 = v13;
  v33 = self;
  v14 = (void (**)(void *, uint64_t, uint64_t, uint64_t))_Block_copy(&v26);
  v14[2](v14, v15, v16, v17);
  -[CKChatSceneDelegate showConversation:](self, "showConversation:", 0, v26, v27, v28, v29);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "useMacToolbar");

  if (v19)
  {
    v20 = -[CKMacToolbarController initWithScene:connectingToSession:inStandaloneWindow:]([CKMacToolbarController alloc], "initWithScene:connectingToSession:inStandaloneWindow:", v11, v12, 1);
    -[CKSceneDelegate setToolbarController:](self, "setToolbarController:", v20);

    -[CKChatSceneDelegate chatController](self, "chatController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSceneDelegate toolbarController](self, "toolbarController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "configureWithToolbarController:", v22);

    -[CKChatSceneDelegate chatController](self, "chatController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "presentMacToolbarController");

  }
  objc_msgSend(v13, "userActivities");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLContexts");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUserActivityHandler chatScene:willConnectToSession:userActivities:urlContexts:windowSceneDelegate:](CKUserActivityHandler, "chatScene:willConnectToSession:userActivities:urlContexts:windowSceneDelegate:", v11, v12, v24, v25, self);

}

id __58__CKChatSceneDelegate_scene_willConnectToSession_options___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 56);
  v5.super_class = (Class)CKChatSceneDelegate;
  return objc_msgSendSuper2(&v5, sel_scene_willConnectToSession_options_, v1, v2, v3);
}

- (void)windowSceneDidBecomeVisible:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKChatSceneDelegate;
  -[CKSceneDelegate windowSceneDidBecomeVisible:](&v3, sel_windowSceneDidBecomeVisible_, a3);
}

- (void)sceneWillEnterForeground:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKChatSceneDelegate;
  -[CKSceneDelegate sceneWillEnterForeground:](&v5, sel_sceneWillEnterForeground_, a3);
  -[CKChatSceneDelegate chatController](self, "chatController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForResume");

  -[CKSceneDelegate updateSceneActivationConditions](self, "updateSceneActivationConditions");
}

- (void)sceneDidEnterBackground:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKChatSceneDelegate;
  -[CKSceneDelegate sceneDidEnterBackground:](&v5, sel_sceneDidEnterBackground_, a3);
  -[CKChatSceneDelegate chatController](self, "chatController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForSuspend");

}

- (void)sceneDidDisconnect:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKChatSceneDelegate;
  -[CKSceneDelegate sceneDidDisconnect:](&v7, sel_sceneDidDisconnect_, a3);
  -[CKChatSceneDelegate conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatSceneDelegate conversation](self, "conversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeConversation:", v6);

  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKChatSceneDelegate;
  v5 = a4;
  v6 = a3;
  -[CKSceneDelegate scene:openURLContexts:](&v7, sel_scene_openURLContexts_, v6, v5);
  +[CKUserActivityHandler chatScene:openURLContexts:](CKUserActivityHandler, "chatScene:openURLContexts:", v6, v5, v7.receiver, v7.super_class);

}

- (void)_scene:(id)a3 openItemProviders:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKChatSceneDelegate;
  -[CKSceneDelegate _scene:openItemProviders:](&v4, sel__scene_openItemProviders_, a3, a4);
}

- (void)setChatController:(id)a3
{
  CKCoreChatController *v5;
  void *v6;
  void *v7;
  void *v8;
  CKCoreChatController *v9;

  v5 = (CKCoreChatController *)a3;
  if (self->_chatController != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_chatController, a3);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "useMacToolbar") & 1) == 0)
    {

      goto LABEL_6;
    }
    -[CKSceneDelegate toolbarController](self, "toolbarController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v9;
    if (v7)
    {
      -[CKSceneDelegate toolbarController](self, "toolbarController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKCoreChatController configureWithToolbarController:](v9, "configureWithToolbarController:", v8);

      -[CKCoreChatController presentMacToolbarController](v9, "presentMacToolbarController");
LABEL_6:
      v5 = v9;
    }
  }

}

- (id)conversation
{
  void *v2;
  void *v3;

  -[CKChatSceneDelegate chatController](self, "chatController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)loadAndShowConversationWithMessageGUID:(id)a3 withInlineReplyOverlay:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D35788], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__CKChatSceneDelegate_loadAndShowConversationWithMessageGUID_withInlineReplyOverlay___block_invoke;
  v9[3] = &unk_1E274B380;
  v9[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  objc_msgSend(v7, "loadMessageWithGUID:completionBlock:", v8, v9);

}

void __85__CKChatSceneDelegate_loadAndShowConversationWithMessageGUID_withInlineReplyOverlay___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v7 = v4;
    objc_msgSend(v4, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showConversationAndMessageForChatGUID:messageGUID:withInlineReplyOverlay:animate:", v6, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 1);

    v4 = v7;
  }

}

- (void)showConversationAndMessageForChatGUID:(id)a3 messageGUID:(id)a4 withInlineReplyOverlay:(BOOL)a5 animate:(BOOL)a6
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a3;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversationForExistingChatWithGUID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v13
      && (objc_msgSend(v10, "ensureMessageWithGUIDIsLoaded:", v13), (v11 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = (void *)v11;
      -[CKChatSceneDelegate showConversation:scrollToMessage:withInlineReplyOverlay:](self, "showConversation:scrollToMessage:withInlineReplyOverlay:", v10, v11, 1);

    }
    else
    {
      -[CKChatSceneDelegate showConversation:](self, "showConversation:", v10);
    }
  }

}

- (void)showConversation:(id)a3
{
  -[CKChatSceneDelegate showConversation:scrollToMessage:withInlineReplyOverlay:](self, "showConversation:scrollToMessage:withInlineReplyOverlay:", a3, 0, 0);
}

- (void)showConversation:(id)a3 scrollToMessage:(id)a4 withInlineReplyOverlay:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CKBlankTranscriptController *v16;
  CKBlankTranscriptController *v17;
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
  id v28;
  _QWORD v29[2];

  v5 = a5;
  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CKChatSceneDelegate conversation](self, "conversation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatSceneDelegate conversation](self, "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeConversation:", v12);

  }
  if (v8)
  {
    +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addConversation:", v8);

    +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "loadHistoryForConversation:keepAllCurrentlyLoadedMessages:", v8, 0);

    objc_msgSend(v8, "isBusinessConversation");
    v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConversation:", v8);
    objc_msgSend(v15, "setDelegate:", self);
    objc_msgSend(v15, "setSendMenuDelegate:", self);
    objc_msgSend(v15, "setShouldShowDoneButton:", CKIsRunningInMacCatalyst() == 0);
    objc_msgSend(v15, "setShowingInStandAloneWindow:", 1);
    -[CKChatSceneDelegate setChatController:](self, "setChatController:", v15);
    v16 = v15;
    v17 = v16;
  }
  else
  {
    v17 = objc_alloc_init(CKBlankTranscriptController);
    -[CKChatSceneDelegate setChatController:](self, "setChatController:", 0);
    v16 = 0;
  }
  -[CKChatSceneDelegate navigationController](self, "navigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setViewControllers:", v19);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = objc_msgSend(v20, "useMacToolbar");

  if ((_DWORD)v19)
  {
    -[CKChatSceneDelegate navigationController](self, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNavigationBarHidden:", 1);

  }
  -[CKChatSceneDelegate navigationController](self, "navigationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNeedsLayout");

  -[CKChatSceneDelegate navigationController](self, "navigationController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "layoutIfNeeded");

  -[CKSceneDelegate updateSceneActivationConditions](self, "updateSceneActivationConditions");
  -[CKSceneDelegate updateSceneTitleForConversation:](self, "updateSceneTitleForConversation:", v8);
  if (v9 && v5)
  {
    -[CKBlankTranscriptController conversation](v16, "conversation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "guid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (id)objc_msgSend(v26, "ensureMessageWithGUIDIsLoaded:", v27);

    -[CKBlankTranscriptController scrollToMessage:highlight:withInlineReplyOverlay:](v16, "scrollToMessage:highlight:withInlineReplyOverlay:", v9, 1, 1);
  }

}

- (id)stateRestorationActivityForScene:(id)a3
{
  void *v4;
  CKSceneDelegateState *v5;
  void *v6;
  void *v7;
  CKSceneDelegateState *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKChatSceneDelegate;
  -[CKSceneDelegate stateRestorationActivityForScene:](&v11, sel_stateRestorationActivityForScene_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [CKSceneDelegateState alloc];
  -[CKChatSceneDelegate conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKSceneDelegateState initWithUnreadMessages:groupID:composingNewMessage:filterMode:showingInbox:](v5, "initWithUnreadMessages:groupID:composingNewMessage:filterMode:showingInbox:", 0, v7, 0, 0, 0);

  +[CKSceneDelegate userInfoDictionaryForState:](CKSceneDelegate, "userInfoDictionaryForState:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v4, "addUserInfoEntriesFromDictionary:", v9);

  return v4;
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKChatSceneDelegate;
  v6 = a4;
  -[CKSceneDelegate scene:continueUserActivity:](&v16, sel_scene_continueUserActivity_, a3, v6);
  objc_msgSend(v6, "userInfo", v16.receiver, v16.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKSceneDelegate stateFromUserInfoDictionary:](CKSceneDelegate, "stateFromUserInfoDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conversationForExistingChatWithChatIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "groupID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "conversationForExistingChatWithGroupID:", v15);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[CKChatSceneDelegate showConversation:](self, "showConversation:", v13);

  }
}

- (void)_chatItemsDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t v18[16];
  _QWORD v19[4];
  id v20;
  _BYTE *v21;
  _BYTE buf[24];
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKSceneDelegate scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "activationState");

  if (v6 == 2)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "object");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatSceneDelegate conversation](self, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v10)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v23 = 0;
      objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D35330]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __43__CKChatSceneDelegate__chatItemsDidChange___block_invoke;
      v19[3] = &unk_1E274B3A8;
      v20 = v8;
      v21 = buf;
      objc_msgSend(v16, "enumerateIndexesWithOptions:usingBlock:", 2, v19);
      if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v18 = 0;
            _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Not snapshotting, update includes typing item", v18, 2u);
          }

        }
      }
      else
      {
        -[CKChatSceneDelegate _updateAppSnapshot](self, "_updateAppSnapshot");
      }

      _Block_object_dispose(buf, 8);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[CKChatSceneDelegate conversation](self, "conversation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "chat");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Not snapshotting, updated chat items for chat: %@ is not current chat: %@", buf, 0x16u);

      }
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[CKSceneDelegate scene](self, "scene");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = objc_msgSend(v15, "activationState");
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Not snapshotting, updated chat items but scene state isn't background: %lu", buf, 0xCu);

    }
  }

}

void __43__CKChatSceneDelegate__chatItemsDidChange___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "chatItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (void)_handleRegistryWillUnregisterChatNotification:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "++++ ChatKit Internal Consistency Error ++++", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = (id)objc_opt_class();
        objc_msgSend(v4, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315650;
        v27 = "-[CKChatSceneDelegate _handleRegistryWillUnregisterChatNotification:]";
        v28 = 2112;
        v29 = v9;
        v30 = 2112;
        v31 = v11;
        v12 = v11;

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v13 = objc_opt_class();
      objc_msgSend(v4, "object");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v13;
      v25 = objc_opt_class();
      v23 = "-[CKChatSceneDelegate _handleRegistryWillUnregisterChatNotification:]";
      _CKLog();

    }
    if (_CKShouldLog())
      _CKLogBacktrace();
  }
  objc_msgSend(v4, "object", v23, v24, v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatSceneDelegate conversation](self, "conversation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "chat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15 == v17;

  if (v18)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "The chat for this scene has been unregistered. Requesting scene destruction.", buf, 2u);
      }

    }
    -[CKChatSceneDelegate showConversation:](self, "showConversation:", 0);
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSceneDelegate scene](self, "scene");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "session");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "requestSceneSessionDestruction:options:errorHandler:", v22, 0, &__block_literal_global_6);

  }
}

void __69__CKChatSceneDelegate__handleRegistryWillUnregisterChatNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Error closing scene: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)_handleChatDisplayNameChangedNotification:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "++++ ChatKit Internal Consistency Error ++++", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      _CKLog();
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(43);
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v9 = (id)objc_opt_class();
        objc_msgSend(v4, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315650;
        v25 = "-[CKChatSceneDelegate _handleChatDisplayNameChangedNotification:]";
        v26 = 2112;
        v27 = v9;
        v28 = 2112;
        v29 = v11;
        v12 = v11;

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v13 = objc_opt_class();
      objc_msgSend(v4, "object");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v13;
      v23 = objc_opt_class();
      v21 = "-[CKChatSceneDelegate _handleChatDisplayNameChangedNotification:]";
      _CKLog();

    }
    if (_CKShouldLog())
      _CKLogBacktrace();
  }
  objc_msgSend(v4, "object", v21, v22, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatSceneDelegate conversation](self, "conversation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "chat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15 == v17;

  if (v18)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "The display name for the chat has been changed. Updating scene title", buf, 2u);
      }

    }
    -[CKChatSceneDelegate conversation](self, "conversation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSceneDelegate updateSceneTitleForConversation:](self, "updateSceneTitleForConversation:", v20);

  }
}

- (void)_handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification:(id)a3
{
  char *v4;
  NSObject *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "_handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification with notification: %@", buf, 0xCu);
    }

  }
  if (v4)
  {
    objc_msgSend(v4, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(43);
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_DEBUG, "++++ ChatKit Internal Consistency Error ++++", buf, 2u);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        _CKLog();
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(43);
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v10 = (id)objc_opt_class();
          objc_msgSend(v4, "object");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_opt_class();
          *(_DWORD *)buf = 136315650;
          v29 = "-[CKChatSceneDelegate _handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification:]";
          v30 = 2112;
          v31 = v10;
          v32 = 2112;
          v33 = v12;
          v13 = v12;

        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        v14 = objc_opt_class();
        objc_msgSend(v4, "object");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v14;
        v27 = objc_opt_class();
        v25 = "-[CKChatSceneDelegate _handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification:]";
        _CKLog();

      }
      if (_CKShouldLog())
        _CKLogBacktrace();
    }
    -[CKChatSceneDelegate conversation](self, "conversation", v25, v26, v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "chat");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "guid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "object");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v19, "containsObject:", v18) & 1) != 0)
    {
      -[CKChatSceneDelegate showConversation:](self, "showConversation:", 0);
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSceneDelegate scene](self, "scene");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "session");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "requestSceneSessionDestruction:options:errorHandler:", v22, 0, &__block_literal_global_107_0);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v4;
        _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Currently shown conversation is not deleted as apart of notification: %@", buf, 0xCu);
      }

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "CKChatSceneDelegate: Warning - nil notification for _handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification", buf, 2u);
    }

  }
}

void __89__CKChatSceneDelegate__handleMovedMessagesInChatsWithGUIDsToRecentlyDeletedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Error closing scene: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)_updateAppSnapshot
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Scheduling snapshot generation", v4, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___updateAppSnapshot, 0);
  -[CKChatSceneDelegate performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel___updateAppSnapshot, 0, 2.0);
}

- (void)__updateAppSnapshot
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[CKSceneDelegate scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activationState");

  if (v4 == 2)
  {
    if (CKIsScreenLocked())
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          LOWORD(v8) = 0;
          _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Not snapshotting, iOS device is locked", (uint8_t *)&v8, 2u);
        }

      }
    }
    else
    {
      im_main_thread();
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[CKSceneDelegate scene](self, "scene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134217984;
      v9 = objc_msgSend(v7, "activationState");
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Not snapshotting, scene state isn't background: %lu", (uint8_t *)&v8, 0xCu);

    }
  }
}

void __42__CKChatSceneDelegate___updateAppSnapshot__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Telling UIKit to update our scene snapshot", v6, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestSceneSessionRefresh:", v5);

}

- (NSSet)alertSuppressionContexts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatSceneDelegate conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKChatSceneDelegate conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertSuppressionContextHelper alertSuppressionContextsForVisibleChatControllerWithConversation:](CKAlertSuppressionContextHelper, "alertSuppressionContextsForVisibleChatControllerWithConversation:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObjectsFromArray:", v6);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Not adding alert suppression contexts for conversation: no conversation found", v10, 2u);
    }

  }
  v8 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v8;
}

- (void)chatController:(id)a3 requestPresentSendMenu:(id)a4
{
  id v5;
  CKSendMenuPresentation *sendMenuPresentation;
  CKSendMenuPresentation *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  sendMenuPresentation = self->_sendMenuPresentation;
  if (sendMenuPresentation)
  {
    -[CKSendMenuPresentation dismissAnimated:completion:](sendMenuPresentation, "dismissAnimated:completion:", 0, 0);
    v7 = self->_sendMenuPresentation;
    self->_sendMenuPresentation = 0;

  }
  -[CKSceneDelegate window](self, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "newSendMenuPresentationWithPresentingViewController:delegate:", v9, self);
  -[CKChatSceneDelegate setSendMenuPresentation:](self, "setSendMenuPresentation:", v10);

  -[CKChatSceneDelegate sendMenuPresentation](self, "sendMenuPresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__CKChatSceneDelegate_chatController_requestPresentSendMenu___block_invoke;
  v13[3] = &unk_1E274A208;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v11, "beginPresentationWithCompletion:", v13);

}

uint64_t __61__CKChatSceneDelegate_chatController_requestPresentSendMenu___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFinishPresentTransition");
}

- (void)chatController:(id)a3 didFinishDismissAnimationForSendMenuViewController:(id)a4
{
  CKSendMenuPresentation *sendMenuPresentation;

  -[CKSendMenuPresentation removeSendMenuFromViewHierarchy](self->_sendMenuPresentation, "removeSendMenuFromViewHierarchy", a3, a4);
  sendMenuPresentation = self->_sendMenuPresentation;
  self->_sendMenuPresentation = 0;

}

- (BOOL)shouldConfigureChatControllerAsCollapsed
{
  return 0;
}

- (void)chatController:(id)a3 requestDeleteJunkConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteConversation:", v7);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[CKSceneDelegate scene](self, "scene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "session");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "persistentIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v12;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Junk conversation deleted, closing scene: %@", (uint8_t *)&v16, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSceneDelegate scene](self, "scene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestSceneSessionDestruction:options:errorHandler:", v15, 0, &__block_literal_global_114);

}

void __68__CKChatSceneDelegate_chatController_requestDeleteJunkConversation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Error closing scene: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)chatController:(id)a3 requestRecoverJunkConversation:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a4;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "recoverJunkMessagesInConversations:", v6);
}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
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
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[CKChatSceneDelegate navigationController](self, "navigationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemMinimumLayoutMargins");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "effectiveUserInterfaceLayoutDirection");

  if (v13)
    v14 = v11;
  else
    v14 = v7;
  if (!v13)
    v7 = v11;

  v15 = v5;
  v16 = v14;
  v17 = v9;
  v18 = v7;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
{
  void *v3;
  void *v4;
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
  UIEdgeInsets result;

  -[CKChatSceneDelegate navigationController](self, "navigationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)doneButtonPressedForChatController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[CKSceneDelegate scene](self, "scene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "session");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "persistentIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Closing scene for doneButtonPressedForChatController: %@", (uint8_t *)&v12, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSceneDelegate scene](self, "scene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestSceneSessionDestruction:options:errorHandler:", v11, 0, &__block_literal_global_115_0);

}

void __58__CKChatSceneDelegate_doneButtonPressedForChatController___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Error closing scene for doneButtonPressedForChatController: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)dismissDetailsViewAndShowConversationList
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[CKSceneDelegate scene](self, "scene");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "session");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "persistentIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Closing scene for dismissDetailsViewAndShowConversationList: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSceneDelegate scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestSceneSessionDestruction:options:errorHandler:", v9, 0, &__block_literal_global_116);

}

void __64__CKChatSceneDelegate_dismissDetailsViewAndShowConversationList__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Error closing scene for dismissDetailsViewAndShowConversationList: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)chatController:(id)a3 didDetachDetailsNavigationController:(id)a4
{
  id v5;

  -[CKChatSceneDelegate setDetailsNavigationController:](self, "setDetailsNavigationController:", a4);
  -[CKChatSceneDelegate detailsNavigationController](self, "detailsNavigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsDetached:", 1);

}

- (BOOL)hasDetailsNavigationController
{
  void *v2;
  BOOL v3;

  -[CKChatSceneDelegate detailsNavigationController](self, "detailsNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isDetailsNavigationControllerDetached
{
  void *v2;
  char v3;

  -[CKChatSceneDelegate detailsNavigationController](self, "detailsNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDetached");

  return v3;
}

- (void)presentDetailsNavigationController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKChatSceneDelegate detailsNavigationController](self, "detailsNavigationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[CKChatSceneDelegate setDetailsNavigationController:](self, "setDetailsNavigationController:", v6);
    v5 = v6;
  }

}

- (void)dismissDetailsNavigationController
{
  void *v3;

  -[CKChatSceneDelegate detailsNavigationController](self, "detailsNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[CKChatSceneDelegate setDetailsNavigationController:](self, "setDetailsNavigationController:", 0);
}

- (void)dismissAndReopenDetailsNavigationController
{
  void *v3;
  _QWORD v4[5];

  -[CKChatSceneDelegate detailsNavigationController](self, "detailsNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__CKChatSceneDelegate_dismissAndReopenDetailsNavigationController__block_invoke;
  v4[3] = &unk_1E274A208;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

void __66__CKChatSceneDelegate_dismissAndReopenDetailsNavigationController__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "chatController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentDetailsViewController");

}

- (void)setupCKDismissOnInteractionView
{
  CKInteractionNotificationView *v3;
  void *v4;
  CKInteractionNotificationView *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = [CKInteractionNotificationView alloc];
  -[CKSceneDelegate window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[CKInteractionNotificationView initWithFrame:](v3, "initWithFrame:");
  -[CKChatSceneDelegate setDismissOnInteractionView:](self, "setDismissOnInteractionView:", v5);

  -[CKChatSceneDelegate dismissOnInteractionView](self, "dismissOnInteractionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[CKChatSceneDelegate dismissOnInteractionView](self, "dismissOnInteractionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  -[CKSceneDelegate window](self, "window");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CKChatSceneDelegate dismissOnInteractionView](self, "dismissOnInteractionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

}

- (void)tearDownCKDismissOnInteractionView
{
  void *v3;

  -[CKChatSceneDelegate dismissOnInteractionView](self, "dismissOnInteractionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKChatSceneDelegate setDismissOnInteractionView:](self, "setDismissOnInteractionView:", 0);
}

- (id)prefersToActivatePredicate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CKChatSceneDelegate conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSceneDelegate predicateMatchingConversation:](self, "predicateMatchingConversation:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)activeSendMenuPresentationForChatController:(id)a3
{
  return self->_sendMenuPresentation;
}

- (void)didDismissSendMenu:(id)a3 usingPresentationContext:(id)a4
{
  -[CKChatSceneDelegate setSendMenuPresentation:](self, "setSendMenuPresentation:", 0, a4);
}

- (id)newInputSnapshotView
{
  if (self->_chatController && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return (id)-[CKCoreChatController newInputSnapshotView](self->_chatController, "newInputSnapshotView");
  else
    return 0;
}

- (void)requestShowKeyboardSnapshotForSendMenu
{
  void *v3;
  char isKindOfClass;

  -[CKChatSceneDelegate chatController](self, "chatController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[CKCoreChatController requestShowKeyboardSnapshotForSendMenu](self->_chatController, "requestShowKeyboardSnapshotForSendMenu");
}

- (void)requestDismissKeyboardSnapshotForSendMenu
{
  void *v3;
  char isKindOfClass;

  -[CKChatSceneDelegate chatController](self, "chatController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[CKCoreChatController requestDismissKeyboardSnapshotForSendMenu](self->_chatController, "requestDismissKeyboardSnapshotForSendMenu");
}

- (id)viewToSizeEffectPreviewOverlay
{
  void *v2;
  void *v3;
  void *v4;

  -[CKSceneDelegate window](self, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CKDetailsNavigationController)detailsNavigationController
{
  return (CKDetailsNavigationController *)objc_loadWeakRetained((id *)&self->_detailsNavigationController);
}

- (void)setDetailsNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_detailsNavigationController, a3);
}

- (CKNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (CKCoreChatController)chatController
{
  return self->_chatController;
}

- (CKInteractionNotificationView)dismissOnInteractionView
{
  return self->_dismissOnInteractionView;
}

- (void)setDismissOnInteractionView:(id)a3
{
  objc_storeStrong((id *)&self->_dismissOnInteractionView, a3);
}

- (CKSendMenuPresentation)sendMenuPresentation
{
  return self->_sendMenuPresentation;
}

- (void)setSendMenuPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_sendMenuPresentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendMenuPresentation, 0);
  objc_storeStrong((id *)&self->_dismissOnInteractionView, 0);
  objc_storeStrong((id *)&self->_chatController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_detailsNavigationController);
}

@end
