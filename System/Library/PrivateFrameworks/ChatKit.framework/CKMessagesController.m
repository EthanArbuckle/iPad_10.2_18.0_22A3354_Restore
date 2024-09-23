@implementation CKMessagesController

- (void)performResumeDeferredSetup
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD block[5];
  uint8_t buf[8];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "performResumeDeferredSetup", buf, 2u);
    }

  }
  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__CKMessagesController_performResumeDeferredSetup__block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  v4 = (id)objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
  if (CKIsRunningInMessages())
    CKPrewarmResumeDeferredSetup();
  -[CKMessagesController chatController](self, "chatController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performResumeDeferredSetup");

  -[CKMessagesController composeChatController](self, "composeChatController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performResumeDeferredSetup");

  -[CKMessagesController conversationListController](self, "conversationListController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performResumeDeferredSetup");

  if (CKDeviceSupportsPerseus())
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[CKMessagesController conversationList](self, "conversationList", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conversations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v10)
    {
      v11 = 0;
      v12 = *(_QWORD *)v20;
LABEL_12:
      v13 = 0;
      if (v11 <= 50)
        v14 = 50;
      else
        v14 = v11;
      v15 = (v14 - v11);
      while (1)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        if ((unint64_t)objc_msgSend(v16, "recipientCount") >= 2)
          v17 = (id)objc_msgSend(v16, "orderedContactsForAvatarView");
        if ((objc_msgSend(v16, "hasDisplayName") & 1) == 0)
          v18 = (id)objc_msgSend(v16, "name");
        if (v15 == v13)
          break;
        if (v10 == ++v13)
        {
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
          v11 += v13;
          if (v10)
            goto LABEL_12;
          break;
        }
      }
    }

  }
}

- (id)conversationList
{
  return +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
}

- (id)childViewControllerForStatusBarHidden
{
  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
    -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  else
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (UINavigationController)conversationListNavigationController
{
  UINavigationController *conversationListNavigationController;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  UINavigationController *v9;
  UINavigationController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  conversationListNavigationController = self->_conversationListNavigationController;
  if (!conversationListNavigationController)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_msgSend(v4, "conversationListNavigationControllerClass");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "navigationBarClass");

    if (CKIsRunningInMacCatalyst())
      v8 = objc_opt_class();
    else
      v8 = 0;
    v9 = (UINavigationController *)objc_msgSend([v5 alloc], "initWithNavigationBarClass:toolbarClass:", v7, v8);
    v10 = self->_conversationListNavigationController;
    self->_conversationListNavigationController = v9;

    -[UINavigationController navigationBar](self->_conversationListNavigationController, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "theme");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBarStyle:", objc_msgSend(v13, "navBarStyle"));

    -[UINavigationController navigationBar](self->_conversationListNavigationController, "navigationBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslucent:", 1);

    -[UINavigationController navigationBar](self->_conversationListNavigationController, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPrefersLargeTitles:", CKIsRunningInMacCatalyst() == 0);

    -[UINavigationController _setClipUnderlapWhileTransitioning:](self->_conversationListNavigationController, "_setClipUnderlapWhileTransitioning:", 1);
    -[UINavigationController setDelegate:](self->_conversationListNavigationController, "setDelegate:", self);
    -[CKMessagesController updateInboxAndConversationList](self, "updateInboxAndConversationList");
    conversationListNavigationController = self->_conversationListNavigationController;
  }
  return conversationListNavigationController;
}

- (UINavigationController)chatNavigationController
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  UINavigationController *v7;
  UINavigationController *chatNavigationController;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  if (!self->_chatNavigationController)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_class *)objc_msgSend(v3, "conversationListNavigationControllerClass");

    v5 = [v4 alloc];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UINavigationController *)objc_msgSend(v5, "initWithNavigationBarClass:toolbarClass:", objc_msgSend(v6, "navigationBarClass"), 0);
    chatNavigationController = self->_chatNavigationController;
    self->_chatNavigationController = v7;

    -[UINavigationController setDelegate:](self->_chatNavigationController, "setDelegate:", self);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v9, "useMacToolbar");

    if ((_DWORD)v6)
    {
      -[UINavigationController setNavigationBarHidden:](self->_chatNavigationController, "setNavigationBarHidden:", 1);
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "theme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "navBarStyle");
      -[UINavigationController navigationBar](self->_chatNavigationController, "navigationBar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBarStyle:", v12);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "shouldUseTranslucentBars");
      -[UINavigationController navigationBar](self->_chatNavigationController, "navigationBar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTranslucent:", v15);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setupNavBarAppearanceWithNavigationController:", v18);

    }
  }
  return self->_chatNavigationController;
}

- (void)dismissPhotosGridIfNeeded
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  id v24;

  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = v6;
    objc_msgSend(v6, "visibleViewController");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "visibleViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "visibleViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v13 = objc_opt_isKindOfClass();

  if ((v13 & 1) != 0)
  {
    -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "visibleViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v17 = objc_opt_isKindOfClass();

    if ((v17 & 1) == 0)
      return;
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v14;
  objc_msgSend(v14, "visibleViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "presentingViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) != 0)
  {
    objc_msgSend(v10, "presentingViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "topViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v23 = objc_opt_isKindOfClass();

    if ((v23 & 1) != 0)
    {
      objc_msgSend(v21, "topViewController");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 0, 0);
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }
LABEL_6:

  if (v24)
  {
    objc_msgSend(v24, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

- (void)performVisibleAppPluginIconPrefetch:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  v4 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CKMessagesController_performVisibleAppPluginIconPrefetch___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E0C80D38], block);
}

- (id)_sharedBalloonPluginManager
{
  return +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
}

- (BOOL)splitViewController:(id)a3 collapseSecondaryViewController:(id)a4 ontoPrimaryViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  CKNavigationController *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id location;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CKMessagesController dismissPhotosGridIfNeeded](self, "dismissPhotosGridIfNeeded");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "shouldSuppressRotationInNewCompose") & 1) != 0)
  {

LABEL_7:
    if (-[CKMessagesController _hasCurrentConversations](self, "_hasCurrentConversations"))
    {
      -[CKMessagesController selectionViewController](self, "selectionViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "window");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        -[CKMessagesController conversationListController](self, "conversationListController");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setEditing:", 0);

        goto LABEL_10;
      }
    }
LABEL_13:
    v24 = 1;
    goto LABEL_14;
  }
  v12 = -[CKMessagesController isComposingMessage](self, "isComposingMessage");

  if (!v12)
    goto LABEL_7;
  if (!-[CKMessagesController isInitialLoad](self, "isInitialLoad"))
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "proposedRecipients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByApplyingSelector:", sel_rawAddress);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "composition");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v14, "composeChatControllerClass")), "initWithRecipientAddresses:composition:bizIntent:", v33, v32, 0);

    objc_msgSend(v15, "setDelegate:", self);
    v16 = -[CKNavigationController initWithNavigationBarClass:toolbarClass:]([CKNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
    v38[0] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavigationController setViewControllers:](v16, "setViewControllers:", v17);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "useMacToolbar");

    if (v19)
    {
      -[CKNavigationController setNavigationBarHidden:](v16, "setNavigationBarHidden:", 1);
    }
    else
    {
      -[CKNavigationController navigationBar](v16, "navigationBar");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "theme");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setBarStyle:", objc_msgSend(v27, "navBarStyle"));

    }
    -[CKMessagesController cancelAndDestroyComposition](self, "cancelAndDestroyComposition");
    -[CKMessagesController setComposeChatController:](self, "setComposeChatController:", v15);
    -[CKMessagesController setComposeChatNavigationController:](self, "setComposeChatNavigationController:", v16);
    location = 0;
    -[CKMessagesController composeChatController](self, "composeChatController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v28);

    -[CKMessagesController composeChatController](self, "composeChatController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "beginPinningInputViewsForReason:", CFSTR("SplitViewFromExpandedToCollapsedTransition"));

    -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __102__CKMessagesController_splitViewController_collapseSecondaryViewController_ontoPrimaryViewController___block_invoke;
    v35[3] = &unk_1E274B548;
    objc_copyWeak(&v36, &location);
    -[CKMessagesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v30, 0, v35);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

    goto LABEL_13;
  }
LABEL_10:
  v24 = 0;
LABEL_14:

  return v24;
}

- (void)setCurrentConversation:(id)a3 keepAllCurrentlyLoadedMessages:(BOOL)a4
{
  _BOOL8 v4;
  CKConversation *v7;
  NSObject *v8;
  CKConversation *currentConversation;
  CKConversation **p_currentConversation;
  CKConversation *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  CKConversation *v18;
  __int16 v19;
  CKConversation *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = (CKConversation *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      currentConversation = self->_currentConversation;
      v17 = 138412546;
      v18 = v7;
      v19 = 2112;
      v20 = currentConversation;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "setCurrentConversation: %@   old: %@", (uint8_t *)&v17, 0x16u);
    }

  }
  p_currentConversation = &self->_currentConversation;
  v11 = self->_currentConversation;
  if (v11 != v7)
  {
    if (-[CKConversation hasLoadedFromSpotlight](v11, "hasLoadedFromSpotlight"))
      -[CKConversation reloadIfNeeded](*p_currentConversation, "reloadIfNeeded");
    +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeConversation:", *p_currentConversation);

    objc_storeStrong((id *)p_currentConversation, a3);
    if (v7)
    {
      +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addConversation:", v7);

    }
    -[CKMessagesController messagesControllerDelegate](self, "messagesControllerDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messagesController:didUpdateCurrentConversation:", self, v7);

  }
  +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "loadHistoryForConversation:keepAllCurrentlyLoadedMessages:", *p_currentConversation, v4);

  -[CKConversation resortMessagesIfNecessary](*p_currentConversation, "resortMessagesIfNecessary");
  -[CKMessagesController _setIsShowingNoSelectionUI:](self, "_setIsShowingNoSelectionUI:", v7 == 0);
  if (v7)
  {
    -[CKConversation updateUserActivity](v7, "updateUserActivity");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserActivityForChat:orHandles:", 0, 0);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *v8;
  const __CFString *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(34);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 136315394;
      v12 = "-[CKMessagesController viewWillAppear:]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "%s, animated:%@", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = "-[CKMessagesController viewWillAppear:]";
    v9 = v7;
    _CKLog();
  }
  -[CKMessagesController _setIsShowingNoSelectionUI:](self, "_setIsShowingNoSelectionUI:", -[CKMessagesController _hasCurrentConversations](self, "_hasCurrentConversations", v8, v9) ^ 1);
  v10.receiver = self;
  v10.super_class = (Class)CKMessagesController;
  -[CKMessagesController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  char *v8;
  CKCoreChatController *v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  CKCoreChatController *chatController;
  int v14;
  const __CFString *v15;
  NSObject *v16;
  CKCoreChatController *composeChatController;
  int v18;
  const __CFString *v19;
  double v20;
  void *v21;
  CKCoreChatController *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  CKCoreChatController *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v5 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a3;
  v9 = (CKCoreChatController *)a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      v27 = 138412802;
      v28 = v8;
      v29 = 2112;
      if (v5)
        v11 = CFSTR("YES");
      v30 = v9;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Navigation controller: %@ willShowViewController: %@ animated: %@", (uint8_t *)&v27, 0x20u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      chatController = self->_chatController;
      v14 = -[CKCoreChatController _shouldLoadInputAccessoryViewsOnAppearance](chatController, "_shouldLoadInputAccessoryViewsOnAppearance");
      v15 = CFSTR("NO");
      v27 = 136315650;
      v28 = "-[CKMessagesController navigationController:willShowViewController:animated:]";
      v29 = 2112;
      v30 = chatController;
      if (v14)
        v15 = CFSTR("YES");
      v31 = 2112;
      v32 = v15;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "%s (chatController) %@ _shouldLoadInputAccessoryViewsOnAppearance: %@", (uint8_t *)&v27, 0x20u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      composeChatController = self->_composeChatController;
      v18 = -[CKCoreChatController _shouldLoadInputAccessoryViewsOnAppearance](composeChatController, "_shouldLoadInputAccessoryViewsOnAppearance");
      v19 = CFSTR("NO");
      v27 = 136315650;
      v28 = "-[CKMessagesController navigationController:willShowViewController:animated:]";
      v29 = 2112;
      v30 = composeChatController;
      if (v18)
        v19 = CFSTR("YES");
      v31 = 2112;
      v32 = v19;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "%s (composeChatController) %@ _shouldLoadInputAccessoryViewsOnAppearance: %@", (uint8_t *)&v27, 0x20u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->timeViewDidBeginAppearing = v20;
    self->hasBegunShowingConversationList = 1;
  }
  if (!CKIsRunningInMacCatalyst())
  {
    if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
    {
      -[CKMessagesController currentConversation](self, "currentConversation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "isBusinessConversation"))
      {
        -[CKMessagesController conversationListController](self, "conversationListController");
        v22 = (CKCoreChatController *)objc_claimAutoreleasedReturnValue();
        v23 = v22 != v9;

      }
      else
      {
        v23 = 0;
      }

      -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "navigationBar");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAccessibilityIgnoresInvertColors:", v23);
    }
    else
    {
      -[CKMessagesController chatNavigationController](self, "chatNavigationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "navigationBar");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController currentConversation](self, "currentConversation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAccessibilityIgnoresInvertColors:", objc_msgSend(v26, "isBusinessConversation"));

    }
  }

}

- (BOOL)_hasCurrentConversations
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConversations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    -[CKMessagesController currentConversation](self, "currentConversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  return v5;
}

- (CKConversation)currentConversation
{
  return self->_currentConversation;
}

- (void)_populateChatNavigationControllerWithSelection
{
  BOOL v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _WORD v11[8];
  _QWORD v12[8];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = -[CKMessagesController isCollapsed](self, "isCollapsed");
  v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v11[0] = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "CKMessagesController: was asked to show the selection view controller but we're collapsed so this shouldn't happen in the first place.", (uint8_t *)v11, 2u);
      }

    }
  }
  else
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v11[0] = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "multi-select: Populating chatNavigationController with selectionViewController", (uint8_t *)v11, 2u);
      }

    }
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController selectionViewController](self, "selectionViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setViewControllers:", v9);

    -[CKMessagesController macToolbarController](self, "macToolbarController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadToolbarItems");

  }
}

- (void)_setIsShowingNoSelectionUI:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "usesUncollapsedSplitview"))
  {
    v5 = -[CKMessagesController isCollapsed](self, "isCollapsed");

    if (!v5)
    {
      -[CKMessagesController selectionViewController](self, "selectionViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v3)
      {
        if (v6)
        {
          -[CKMessagesController chatNavigationController](self, "chatNavigationController");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "topViewController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKMessagesController selectionViewController](self, "selectionViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9 != v10)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
              {
                -[CKMessagesController selectionViewController](self, "selectionViewController");
                v12 = (id)objc_claimAutoreleasedReturnValue();
                -[CKMessagesController chatNavigationController](self, "chatNavigationController");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "viewControllers");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v34 = v12;
                v35 = 2112;
                v36 = v14;
                _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "No selection, setting chat navigation controller view controllers to selectVC: %@, VCs before: %@", buf, 0x16u);

              }
            }
            -[CKMessagesController _populateChatNavigationControllerWithSelection](self, "_populateChatNavigationControllerWithSelection");
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                -[CKMessagesController chatNavigationController](self, "chatNavigationController");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "viewControllers");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v34 = v17;
                _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "chatNavigationController (_setIsShowingNoSelectionUI) children:%@", buf, 0xCu);

              }
            }
            objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "firstResponder");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "resignFirstResponder");

            -[CKMessagesController chatController](self, "chatController");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "reloadInputViews");

          }
        }
      }
      else
      {

        if (v7)
          -[CKMessagesController setSelectionViewController:](self, "setSelectionViewController:", 0);
        -[CKMessagesController chatController](self, "chatController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          -[CKMessagesController chatNavigationController](self, "chatNavigationController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "viewControllers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKMessagesController chatController](self, "chatController");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v23, "containsObject:", v24);

          if ((v25 & 1) == 0)
          {
            -[CKMessagesController chatNavigationController](self, "chatNavigationController");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)MEMORY[0x1E0C99D20];
            -[CKMessagesController chatController](self, "chatController");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "arrayWithObjects:", v28, 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setViewControllers:", v29);

            -[CKMessagesController chatController](self, "chatController");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "becomeFirstResponder");

            -[CKMessagesController chatController](self, "chatController");
            v32 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "reloadInputViews");

          }
        }
      }
    }
  }
  else
  {

  }
}

- (CKSelectionViewController)selectionViewController
{
  CKSelectionViewController *selectionViewController;
  CKSelectionViewController *v4;
  CKSelectionViewController *v5;

  selectionViewController = self->_selectionViewController;
  if (!selectionViewController)
  {
    v4 = objc_alloc_init(CKSelectionViewController);
    v5 = self->_selectionViewController;
    self->_selectionViewController = v4;

    -[CKSelectionViewController setDelegate:](self->_selectionViewController, "setDelegate:", self);
    selectionViewController = self->_selectionViewController;
  }
  return selectionViewController;
}

- (CKMacToolbarController)macToolbarController
{
  return self->_macToolbarController;
}

- (void)parentControllerDidBecomeActive
{
  void *v3;
  id v4;

  -[CKMessagesController chatController](self, "chatController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentControllerDidBecomeActive");

  -[CKMessagesController composeChatController](self, "composeChatController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentControllerDidBecomeActive");

}

- (CKCoreChatController)composeChatController
{
  return self->_composeChatController;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  NSObject *v50;
  uint8_t v51[16];
  objc_super v52;

  v52.receiver = self;
  v52.super_class = (Class)CKMessagesController;
  -[CKMessagesController viewDidLayoutSubviews](&v52, sel_viewDidLayoutSubviews);
  -[CKMessagesController _handleInitialLoad](self, "_handleInitialLoad");
  -[CKSendMenuPresentation layout](self->_sendMenuPresentation, "layout");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useMacToolbar");

  if (v4)
  {
    -[CKMessagesController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "macAppKitToolbarHeight");
    v15 = v14;

    -[CKMessagesController macToolbarController](self, "macToolbarController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateWithFrame:", v8, v10, v12, v15);

    if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
    {
      -[CKMessagesController supplementaryColumnWidth](self, "supplementaryColumnWidth");
      v18 = v17;
      if (-[CKMessagesController displayMode](self, "displayMode") == 4)
      {
        -[CKMessagesController primaryColumnWidth](self, "primaryColumnWidth");
        v18 = v18 + v19;
      }
    }
    else
    {
      -[CKMessagesController primaryColumnWidth](self, "primaryColumnWidth");
      v18 = v20;
    }
    -[CKMessagesController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "_shouldReverseLayoutDirection");

    if (v22)
    {
      -[CKMessagesController view](self, "view");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "frame");
      v25 = v24 - v18;
      -[CKMessagesController macToolbarController](self, "macToolbarController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setSplitViewDividerXPosition:", v25);

    }
    else
    {
      -[CKMessagesController macToolbarController](self, "macToolbarController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setSplitViewDividerXPosition:", v18);
    }

  }
  if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout")
    && -[CKMessagesController splitBehavior](self, "splitBehavior") == 3
    && -[CKMessagesController displayMode](self, "displayMode") != 2)
  {
    -[CKMessagesController chatController](self, "chatController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "presentedViewController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "presentedViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "childViewControllers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v31)
    {
      -[CKMessagesController chatController](self, "chatController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "presentedViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "presentedViewController");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "childViewControllers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndex:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
        goto LABEL_17;
    }
    -[CKMessagesController chatController](self, "chatController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36
      || (-[CKMessagesController composeChatController](self, "composeChatController"),
          (v36 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_17:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "entryViewFollowsKeyboardLayoutGuide");

      if ((v38 & 1) == 0)
      {
        objc_msgSend(v36, "entryView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "frame");
        v41 = v40;
        v43 = v42;
        v45 = v44;
        -[CKMessagesController chatNavigationController](self, "chatNavigationController");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "view");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "frame");
        v49 = v48;

        objc_msgSend(v39, "setFrame:", v49, v41, v43, v45);
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v51 = 0;
          _os_log_impl(&dword_18DFCD000, v50, OS_LOG_TYPE_INFO, "Could not find a chatController to pull entryView from", v51, 2u);
        }

      }
      v36 = 0;
    }

  }
}

- (void)_handleInitialLoad
{
  void *v3;
  char v4;

  if (-[CKMessagesController isInitialLoad](self, "isInitialLoad"))
  {
    -[CKMessagesController setIsInitialLoad:](self, "setIsInitialLoad:", 0);
    -[CKMessagesController onboardingControllerCreatingIfNecessary](self, "onboardingControllerCreatingIfNecessary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldPresentOnboarding");

    if ((v4 & 1) == 0)
    {
      -[CKMessagesController setOnboardingController:](self, "setOnboardingController:", 0);
      -[CKMessagesController executeDeferredTasks](self, "executeDeferredTasks");
    }
  }
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (BOOL)shouldPresentOnboarding
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  char v8;

  -[CKMessagesController onboardingController](self, "onboardingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKMessagesController onboardingController](self, "onboardingController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldPresentOnboarding");

    return v5;
  }
  else
  {
    -[CKMessagesController onboardingControllerCreatingIfNecessary](self, "onboardingControllerCreatingIfNecessary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "shouldPresentOnboarding");

    -[CKMessagesController setOnboardingController:](self, "setOnboardingController:", 0);
    return v8;
  }
}

- (void)setOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingController, a3);
}

- (CKOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (id)onboardingControllerCreatingIfNecessary
{
  CKOnboardingController *onboardingController;
  CKOnboardingController *v4;
  CKOnboardingController *v5;

  onboardingController = self->_onboardingController;
  if (!onboardingController)
  {
    v4 = objc_alloc_init(CKOnboardingController);
    v5 = self->_onboardingController;
    self->_onboardingController = v4;

    -[CKOnboardingController setDelegate:](self->_onboardingController, "setDelegate:", self);
    onboardingController = self->_onboardingController;
  }
  return onboardingController;
}

- (void)setIsInitialLoad:(BOOL)a3
{
  self->_isInitialLoad = a3;
}

- (void)presentFocusStatusAuthorizationAlertIfNecessary
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  id v6;
  uint8_t buf[2];
  __int16 v8;

  if (-[CKMessagesController onboardingControllerIsActive](self, "onboardingControllerIsActive"))
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v8 = 0;
    v4 = "Not presenting focus status authorization alert, onboarding controller is active";
    v5 = (uint8_t *)&v8;
    goto LABEL_10;
  }
  if ((objc_msgSend(MEMORY[0x1E0D397F8], "supportsFocus") & 1) != 0)
  {
    +[CKFocusStatusAuthorizationManager sharedInstance](CKFocusStatusAuthorizationManager, "sharedInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentFocusStatusAuthorizationAlertIfNecessaryFromViewController:", self);

    return;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
LABEL_11:

      return;
    }
    *(_WORD *)buf = 0;
    v4 = "Not presenting focus status authorization alert as it is not supported";
    v5 = buf;
LABEL_10:
    _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
    goto LABEL_11;
  }
}

- (BOOL)onboardingControllerIsActive
{
  void *v2;
  BOOL v3;

  -[CKMessagesController onboardingController](self, "onboardingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)executeDeferredTasks
{
  -[CKMessagesController executeDeferredHandleURLBlock](self, "executeDeferredHandleURLBlock");
  -[CKMessagesController notifyThatKeepMessagesSettingWasResetIfNeeded](self, "notifyThatKeepMessagesSettingWasResetIfNeeded");
  -[CKMessagesController presentFocusStatusAuthorizationAlertIfNecessary](self, "presentFocusStatusAuthorizationAlertIfNecessary");
}

- (void)notifyThatKeepMessagesSettingWasResetIfNeeded
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  char v20;

  if (IMShouldDisplayKeepMessagesSetting())
  {
    IMClearDisplayKeepMessagesSetting();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "canPresentOverKeyboard");

    v5 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("RESET_KEEP_MESSAGES_SETTING_ALERT_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceLayoutDirection");

    if (v12 == 1)
      v13 = CFSTR("\u200F");
    else
      v13 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v14, 0, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __69__CKMessagesController_notifyThatKeepMessagesSettingWasResetIfNeeded__block_invoke;
    v19[3] = &unk_1E274C898;
    v20 = v4;
    v19[4] = self;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v17, 0, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v18);

    if ((v4 & 1) == 0)
      -[CKMessagesController becomeFirstResponder](self, "becomeFirstResponder");
    objc_msgSend(v15, "presentFromViewController:animated:completion:", self, 1, 0);

  }
}

- (void)executeDeferredHandleURLBlock
{
  void (**deferredHandleURLBlock)(id, SEL);
  id v4;

  deferredHandleURLBlock = (void (**)(id, SEL))self->_deferredHandleURLBlock;
  if (deferredHandleURLBlock)
  {
    deferredHandleURLBlock[2](deferredHandleURLBlock, a2);
    v4 = self->_deferredHandleURLBlock;
    self->_deferredHandleURLBlock = 0;

  }
}

- (BOOL)_wantsThreeColumnLayout
{
  void *v3;
  char v4;

  if (-[CKMessagesController isOscarModal](self, "isOscarModal"))
    return 0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsUniversalThreeColumn");

  return v4;
}

- (BOOL)isOscarModal
{
  return self->_oscarModal;
}

- (void)viewWillLayoutSubviews
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKMessagesController;
  -[CKMessagesController viewWillLayoutSubviews](&v2, sel_viewWillLayoutSubviews);
}

- (void)_updateConversationListWidth
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  double v12;
  NSObject *v13;
  int v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CKMessagesController preferredPrimaryColumnWidth](self, "preferredPrimaryColumnWidth");
  v4 = v3;
  if (-[CKMessagesController isViewLoaded](self, "isViewLoaded"))
  {
    if (CKIsRunningInMacCatalyst())
    {
      v5 = CKGetConversationListPersistedWidth(0.0);
      v6 = v5;
      if (v5 == 0.0)
      {
        if (CKGetLegacyAppMigratedSidebarPersistedWidth(0.0) == 0.0)
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "defaultConversationListWidth");
          v6 = v8;

        }
        else
        {
          -[CKMessagesController _macConvertLegacySidebarWidthToModernWidth:](self, "_macConvertLegacySidebarWidthToModernWidth:");
          v6 = v10;
        }
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v14 = 134217984;
          v15 = v5;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "lastPersistedWidth: %f", (uint8_t *)&v14, 0xCu);
        }

      }
    }
    else
    {
      -[CKMessagesController _calculateConversationListColumnWidth](self, "_calculateConversationListColumnWidth");
      v6 = v9;
    }
    -[CKMessagesController _sanitizeProposedConversationListWidth:](self, "_sanitizeProposedConversationListWidth:", v6);
    v4 = v12;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = 134217984;
      v15 = v4;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "setting conversationListWidth: %f", (uint8_t *)&v14, 0xCu);
    }

  }
  -[CKMessagesController _setPreferredPrimaryColumnWidth:](self, "_setPreferredPrimaryColumnWidth:", v4);
}

- (double)_calculateConversationListColumnWidth
{
  uint64_t (*v2)(void);
  void *v3;
  double v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  int v15;
  double v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  int v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = CKNonFlatDeviceOrientation();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationListWidthForInterfaceOrientation:", v2);
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "__ck_isFullscreen");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minConversationListWidth");
  v10 = v9;

  if (v7)
    v11 = v5;
  else
    v11 = v10;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134219010;
      v16 = v11;
      v17 = 2112;
      v18 = v13;
      v19 = 2048;
      v20 = v5;
      v21 = 1024;
      v22 = v7;
      v23 = 2048;
      v24 = v10;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "_calculateConversationListColumnWidth columnWidth: %f, orientation: %@, widthForCurrentOrientation: %f, isFullScreen: %{BOOL}d, minConversationListWidth: %f", (uint8_t *)&v15, 0x30u);

    }
  }
  return v11;
}

- (double)_sanitizeProposedConversationListWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minConversationListWidth");
  v6 = v5;

  if (v6 <= a3)
    v6 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxConversationListWidth");
  v9 = v8;

  if (v6 < v9)
    v9 = v6;
  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "snapToMinConversationListWidth");
    if (v9 < v11)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "minConversationListWidth");
      v9 = v13;

    }
  }
  return v9;
}

- (void)viewDidLoad
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CKMessagesController;
  -[CKMessagesController viewDidLoad](&v17, sel_viewDidLoad);
  -[CKMessagesController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
  v3 = -[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout");
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minConversationListWidth");
  if (v3)
  {
    -[CKMessagesController setMinimumSupplementaryColumnWidth:](self, "setMinimumSupplementaryColumnWidth:");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maxConversationListWidth");
    -[CKMessagesController setMaximumSupplementaryColumnWidth:](self, "setMaximumSupplementaryColumnWidth:");
  }
  else
  {
    -[CKMessagesController setMinimumPrimaryColumnWidth:](self, "setMinimumPrimaryColumnWidth:");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "maxConversationListWidth");
    -[CKMessagesController setMaximumPrimaryColumnWidth:](self, "setMaximumPrimaryColumnWidth:");
  }

  -[CKMessagesController updateColumnWidths](self, "updateColumnWidths");
  +[CKMenuBarManager sharedInstance](CKMenuBarManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeyboardShortcutKeyCommands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[CKMessagesController addKeyCommand:](self, "addKeyCommand:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v10);
  }

}

- (void)updateColumnWidths
{
  -[CKMessagesController _updateInboxWidth](self, "_updateInboxWidth");
  -[CKMessagesController _updateConversationListWidth](self, "_updateConversationListWidth");
}

- (void)_updateInboxWidth
{
  double v3;
  double v4;
  double v5;

  -[CKMessagesController preferredPrimaryColumnWidth](self, "preferredPrimaryColumnWidth");
  v4 = v3;
  if (-[CKMessagesController isViewLoaded](self, "isViewLoaded"))
  {
    if (CKIsRunningInMacCatalyst())
    {
      v5 = CKGetInboxPersistedWidth(0.0);
      if (v5 != 0.0)
        v4 = v5;
    }
  }
  -[CKMessagesController _setPreferredPrimaryColumnWidth:](self, "_setPreferredPrimaryColumnWidth:", v4);
}

- (void)splitViewControllerDidCollapse:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;

  -[CKMessagesController chatController](self, "chatController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKMessagesController chatController](self, "chatController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navbarCanvasViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateAvatarPickerDelegate");

  }
  -[CKMessagesController inboxModel](self, "inboxModel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIsCollapsed:", 1);

}

- (CKInboxModel)inboxModel
{
  return (CKInboxModel *)objc_loadWeakRetained((id *)&self->_inboxModel);
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  UINavigationController *chatNavigationController;
  unsigned __int8 v7;
  BOOL v8;
  objc_super v10;

  -[CKMessagesController chatController](self, "chatController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !objc_msgSend(v5, "allowedToShowConversation"))
  {
    v8 = 0;
  }
  else
  {
    chatNavigationController = self->_chatNavigationController;
    if (chatNavigationController)
    {
      v7 = -[UINavigationController becomeFirstResponder](chatNavigationController, "becomeFirstResponder");
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)CKMessagesController;
      v7 = -[CKMessagesController becomeFirstResponder](&v10, sel_becomeFirstResponder);
    }
    v8 = v7;
  }

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  int isKindOfClass;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  const char *v17;
  const __CFString *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(34);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 136315394;
      v21 = "-[CKMessagesController viewDidAppear:]";
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "%s, animated:%@", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v17 = "-[CKMessagesController viewDidAppear:]";
    v18 = v7;
    _CKLog();
  }
  v19.receiver = self;
  v19.super_class = (Class)CKMessagesController;
  -[CKMessagesController viewDidAppear:](&v19, sel_viewDidAppear_, v3, v17, v18);
  -[CKMessagesController _installTickerIfNeeded](self, "_installTickerIfNeeded");
  if (-[CKMessagesController isOscarModal](self, "isOscarModal"))
  {
    -[CKMessagesController showConversationListWithAnimation:](self, "showConversationListWithAnimation:", 0);
    -[CKMessagesController changeFilterMode:](self, "changeFilterMode:", 9);
  }
  else if (!-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
  {
    v8 = -[CKMessagesController isCollapsed](self, "isCollapsed");
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "childViewControllers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if (((v8 & isKindOfClass ^ 1 | -[CKMessagesController isComposingMessage](self, "isComposingMessage")) & 1) == 0)
      -[CKMessagesController showConversationListWithAnimation:](self, "showConversationListWithAnimation:", 1);
  }
  -[CKMessagesController _updateAlertSuppressionContext](self, "_updateAlertSuppressionContext");
  kdebug_trace();
  IMClientTelemetryLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ClientLaunchToViewAppears", " enableTelemetry=YES ", buf, 2u);
  }

  if (CKIsRunningInMacCatalyst() && -[CKMessagesController daemonIsConnected](self, "daemonIsConnected"))
  {
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasActiveConversations");

    if ((v15 & 1) == 0)
    {
      -[CKMessagesController conversationListController](self, "conversationListController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "composeButtonClicked:", self);

    }
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  __CFString *v21;
  NSObject *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  _BOOL4 v30;
  __CFString *v31;
  _BOOL4 v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  _BOOL4 v36;
  const __CFString *v37;
  const __CFString *v38;
  void (**v39)(_QWORD);
  __CFString *v40;
  BOOL v41;
  __CFString *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  char v46;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  const __CFString *v53;
  uint64_t v54;

  v5 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v49 = v8;
      v50 = 2112;
      if (v5)
        v11 = CFSTR("YES");
      v51 = v9;
      v52 = 2112;
      v53 = v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Navigation controller: %@ didShowViewController: %@ animated: %@", buf, 0x20u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[__CFString topViewController](v8, "topViewController");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v49 = v13;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Navigation controller top view controller: %@", buf, 0xCu);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
      v15 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "viewControllers");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v15;
      v50 = 2112;
      v51 = v17;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Conv list nav controller %@ VCs: %@", buf, 0x16u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      -[CKMessagesController chatNavigationController](self, "chatNavigationController");
      v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController chatNavigationController](self, "chatNavigationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "viewControllers");
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v49 = v19;
      v50 = 2112;
      v51 = v21;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Chat nav controller %@ VCs: %@", buf, 0x16u);

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      -[CKMessagesController chatController](self, "chatController");
      v23 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController chatController](self, "chatController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "conversation");
      v25 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController chatController](self, "chatController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "parentViewController");
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = v23;
      v50 = 2112;
      v51 = v25;
      v52 = 2112;
      v53 = v27;
      _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Chat controller: %@, conv: %@,  parent: %@", buf, 0x20u);

    }
  }
  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
  {
    -[CKMessagesController conversationListController](self, "conversationListController");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == v9;

  }
  else
  {
    v30 = 0;
  }
  if (v28 != v8 && !v30)
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = v31 == v9;

    if (v32
      && objc_msgSend((id)__CurrentTestName, "rangeOfString:", CFSTR("ShowNewCompose")) != 0x7FFFFFFFFFFFFFFFLL
      && !-[CKMessagesController isCollapsed](self, "isCollapsed"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "postNotificationName:object:userInfo:", CFSTR("PPTDidShowNewComposeEvent"), 0, 0);

    }
    goto LABEL_52;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      v35 = -[CKMessagesController isCollapsed](self, "isCollapsed");
      v36 = -[CKMessagesController isShowingChatController](self, "isShowingChatController");
      v37 = CFSTR("NO");
      if (v35)
        v38 = CFSTR("YES");
      else
        v38 = CFSTR("NO");
      if (v36)
        v37 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v49 = v38;
      v50 = 2112;
      v51 = v37;
      _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Split controller collapsed: %@ showingChatController: %@", buf, 0x16u);
    }

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__CKMessagesController_navigationController_didShowViewController_animated___block_invoke;
  aBlock[3] = &unk_1E274A208;
  aBlock[4] = self;
  v39 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[CKMessagesController conversationListController](self, "conversationListController");
  v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v40 != v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_46;
  }
  if (!-[CKMessagesController isCollapsed](self, "isCollapsed"))
    goto LABEL_46;
  v41 = -[CKMessagesController isShowingChatController](self, "isShowingChatController");

  if (!v41)
  {
    -[CKMessagesController chatController](self, "chatController");
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString forciblyUnloadChatInputController](v40, "forciblyUnloadChatInputController");
    v39[2](v39);
LABEL_46:

  }
  -[__CFString __ck_callDelegateBlocks](v8, "__ck_callDelegateBlocks");
  -[CKMessagesController _updateAlertSuppressionContext](self, "_updateAlertSuppressionContext");
  -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v43 = v42 == v9;

  if (v43)
  {
    -[CKMessagesController conversationListController](self, "conversationListController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString viewControllers](v8, "viewControllers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "containsObject:", v44);

    if ((v46 & 1) == 0)
      -[CKMessagesController updateInboxAndConversationList](self, "updateInboxAndConversationList");

  }
LABEL_52:
  self->hasBegunShowingConversationList = 0;

}

- (void)_updateAlertSuppressionContext
{
  NSObject *v3;
  uint8_t v4[16];

  if ((IMSharedHelperTurnOnUNUserNotificationsInIMDPersistence() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Requested deferred update of alert suppression contexts", v4, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel___updateAlertSuppressionContext, 0);
    -[CKMessagesController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel___updateAlertSuppressionContext, 0, 0.2);
  }
}

uint64_t __76__CKMessagesController_navigationController_didShowViewController_animated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  id *v14;
  void *v15;
  void *v16;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isCollapsed");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "chatNavigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    objc_msgSend(*(id *)(a1 + 32), "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "chatNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v18[0] = 67109376;
        v18[1] = v6 != 0;
        v19 = 1024;
        v20 = v9;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "removing stale transcript: chatNavigationControllerHadViewControllers: %{BOOL}d, isChatNavigationControllerChildViewController: %{BOOL}d", (uint8_t *)v18, 0xEu);
      }

    }
    v11 = v6 != 0;
    objc_msgSend(*(id *)(a1 + 32), "chatNavigationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setViewControllers:", MEMORY[0x1E0C9AA60]);

    if ((v11 & v9) == 1)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18[0]) = 0;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Updating viewControllers because chatNav is in the stack but has no child viewControllers", (uint8_t *)v18, 2u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "updateInboxAndConversationList");
    }
  }
  else
  {
    objc_msgSend(v3, "_populateChatNavigationControllerWithSelection");
  }
  v15 = *(void **)(a1 + 32);
  v14 = (id *)(a1 + 32);
  objc_msgSend(v15, "chatController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", 0);

  objc_msgSend(*v14, "setChatController:", 0);
  return objc_msgSend(*v14, "setCurrentConversation:", 0);
}

- (void)setCurrentConversation:(id)a3
{
  -[CKMessagesController setCurrentConversation:keepAllCurrentlyLoadedMessages:](self, "setCurrentConversation:keepAllCurrentlyLoadedMessages:", a3, 0);
}

- (void)setChatController:(id)a3
{
  CKCoreChatController *v4;
  CKCoreChatController *v5;
  CKCoreChatController *chatController;
  BOOL v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  CKCoreChatController *v12;
  CKCoreChatController *v13;
  CKCoreChatController *v14;
  void *v15;
  int v16;
  CKCoreChatController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (CKCoreChatController *)a3;
  v5 = v4;
  chatController = self->_chatController;
  if (chatController)
    v7 = chatController == v4;
  else
    v7 = 1;
  if (!v7)
  {
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", self->_chatController);

    if (v10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = self->_chatController;
          v16 = 138412290;
          v17 = v12;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKMessagesController: Old chatController (%@) is still in chatNavigationController.viewControllers", (uint8_t *)&v16, 0xCu);
        }

      }
    }
  }
  v13 = self->_chatController;
  self->_chatController = v5;
  v14 = v5;

  +[CKLinkIntentsManager sharedManager](CKLinkIntentsManager, "sharedManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerChatController:", v14);

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)CKMessagesController;
  -[CKMessagesController loadView](&v23, sel_loadView);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messagesControllerBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKMessagesController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

  }
  -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    -[CKMessagesController _populateChatNavigationControllerWithSelection](self, "_populateChatNavigationControllerWithSelection");
  if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minConversationListWidth");
    -[CKMessagesController setMinimumSupplementaryColumnWidth:](self, "setMinimumSupplementaryColumnWidth:");

    if (CKIsRunningInMacCatalyst())
    {
      -[CKMessagesController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setOpaque:", 0);

      v12 = 1;
      -[CKMessagesController setPrimaryBackgroundStyle:](self, "setPrimaryBackgroundStyle:", 1);
      v13 = 4;
      v14 = 1;
    }
    else
    {
      v14 = 0;
      v12 = 3;
      v13 = 2;
    }
    -[CKMessagesController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", v13);
    -[CKMessagesController setPreferredSplitBehavior:](self, "setPreferredSplitBehavior:", v12);
    -[CKMessagesController setDisplayModeButtonVisibility:](self, "setDisplayModeButtonVisibility:", v14);
    -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController setViewController:forColumn:](self, "setViewController:forColumn:", v21, 1);

    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController setViewController:forColumn:](self, "setViewController:forColumn:", v22, 2);

  }
  else
  {
    if (CKIsRunningInMacCatalyst())
    {
      -[CKMessagesController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setOpaque:", 0);

      -[CKMessagesController setPrimaryBackgroundStyle:](self, "setPrimaryBackgroundStyle:", 1);
    }
    v16 = -[CKMessagesController isOscarModal](self, "isOscarModal");
    -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v16)
    {
      v25[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController setViewControllers:](self, "setViewControllers:", v19);
    }
    else
    {
      v24[0] = v17;
      -[CKMessagesController chatNavigationController](self, "chatNavigationController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController setViewControllers:](self, "setViewControllers:", v20);

    }
    -[CKMessagesController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", 2);
  }
  -[CKMessagesController updateInboxAndConversationList](self, "updateInboxAndConversationList");
  -[CKMessagesController setDelegate:](self, "setDelegate:", self);

}

- (void)updateInboxAndConversationList
{
  NSObject *v3;
  void *v4;
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
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "updateInboxAndConversationList", (uint8_t *)&v24, 2u);
    }

  }
  -[CKMessagesController baseViewControllersForConversationListNavigationController](self, "baseViewControllersForConversationListNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
  {
    if (-[CKMessagesController _shouldShowInboxView](self, "_shouldShowInboxView"))
    {
      -[CKMessagesController inboxViewController](self, "inboxViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "navigationItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FILTERS_BACK_BUTTON"), &stru_1E276D870, CFSTR("ChatKit"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackButtonTitle:", v8);

      -[CKMessagesController setPresentsWithGesture:](self, "setPresentsWithGesture:", CKIsRunningInMacCatalyst() == 0);
      -[CKMessagesController inboxViewController](self, "inboxViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController setViewController:forColumn:](self, "setViewController:forColumn:", v9, 0);

      -[CKMessagesController inboxViewController](self, "inboxViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navigationBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPrefersLargeTitles:", 1);

      -[CKMessagesController navigationItem](self, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLargeTitleDisplayMode:", 1);

    }
    else
    {
      -[CKMessagesController setInboxViewController:](self, "setInboxViewController:", 0);
      -[CKMessagesController setPresentsWithGesture:](self, "setPresentsWithGesture:", 0);
      -[CKMessagesController setViewController:forColumn:](self, "setViewController:forColumn:", 0, 0);
    }
    if (CKWantsInboxVisible())
      -[CKMessagesController showColumn:](self, "showColumn:", 0);
    else
      -[CKMessagesController hideColumn:](self, "hideColumn:", 0);
  }
  -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewControllers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewControllers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "containsObject:", v18);

    if (!v19)
      goto LABEL_21;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        -[CKMessagesController chatNavigationController](self, "chatNavigationController");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138412546;
        v25 = v21;
        v26 = 2112;
        v27 = v4;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "updateInboxAndConversationList, adding chatNavigationController: %@ to updatedConversationListNavStack: %@", (uint8_t *)&v24, 0x16u);

      }
    }
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v14);
  }
  else
  {

  }
LABEL_21:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = v4;
      _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "updateInboxAndConversationList, setting conversationListNavigationController viewControllers to: %@", (uint8_t *)&v24, 0xCu);
    }

  }
  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setViewControllers:", v4);

}

- (id)baseViewControllersForConversationListNavigationController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
  {
    if (-[CKMessagesController _shouldShowInboxView](self, "_shouldShowInboxView"))
    {
      -[CKMessagesController inboxViewController](self, "inboxViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        -[CKMessagesController inboxViewController](self, "inboxViewController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v5);

      }
    }
  }
  -[CKMessagesController conversationListController](self, "conversationListController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateNavigationItems");

  -[CKMessagesController conversationListController](self, "conversationListController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  return v3;
}

- (CKConversationListControllerProtocol)conversationListController
{
  CKConversationListControllerProtocol *conversationListController;
  void *v4;
  uint64_t v5;
  CKConversationListControllerProtocol *v6;
  CKConversationListControllerProtocol *v7;

  conversationListController = self->_conversationListController;
  if (!conversationListController)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conversationListControllerClass");

    if (IMIsOscarEnabled()
      && -[CKMessagesController isOscarModal](self, "isOscarModal")
      && v5 == objc_opt_class())
    {
      v6 = -[CKConversationListCollectionViewController initForOscarModal]([CKConversationListCollectionViewController alloc], "initForOscarModal");
    }
    else
    {
      v6 = (CKConversationListControllerProtocol *)objc_opt_new();
    }
    v7 = self->_conversationListController;
    self->_conversationListController = v6;

    -[CKConversationListControllerProtocol setDelegate:](self->_conversationListController, "setDelegate:", self);
    conversationListController = self->_conversationListController;
  }
  return conversationListController;
}

- (BOOL)_shouldShowInboxView
{
  return CKShouldShowInboxView() != 0;
}

- (BOOL)isShowingChatController
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[CKMessagesController chatController](self, "chatController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  unint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMessagesController;
  v3 = -[CKMessagesController preferredScreenEdgesDeferringSystemGestures](&v7, sel_preferredScreenEdgesDeferringSystemGestures);
  -[CKMessagesController chatController](self, "chatController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v3 |= objc_msgSend(v4, "preferredScreenEdgesDeferringSystemGestures");

  return v3;
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t supportedInterfaceOrientations;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  objc_super v22;

  if (!self->_forceOrientation || (supportedInterfaceOrientations = self->_supportedInterfaceOrientations) == 0)
  {
    -[CKMessagesController chatController](self, "chatController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHandwritingLandscape");

    if ((v5 & 1) != 0)
      return 2;
    -[CKMessagesController chatController](self, "chatController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isStewieConversation") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isStewieActive");

      if ((v9 & 1) != 0)
        return 2;
    }
    else
    {

    }
    -[CKMessagesController presentedViewController](self, "presentedViewController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10
      && (v11 = (void *)v10,
          -[CKMessagesController presentedViewController](self, "presentedViewController"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v12,
          v11,
          (isKindOfClass & 1) == 0))
    {
      -[CKMessagesController presentedViewController](self, "presentedViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      supportedInterfaceOrientations = objc_msgSend(v14, "supportedInterfaceOrientations");

    }
    else
    {
      v22.receiver = self;
      v22.super_class = (Class)CKMessagesController;
      supportedInterfaceOrientations = -[CKMessagesController supportedInterfaceOrientations](&v22, sel_supportedInterfaceOrientations);
    }
    if (!CKIsRunningInMacCatalyst())
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_referenceBounds");
      if (v16 <= 320.0)
      {
        -[CKMessagesController viewIfLoaded](self, "viewIfLoaded");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "window");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "safeAreaInsets");
        v20 = v19;

        if (v20 > 0.0)
          return supportedInterfaceOrientations & 0xFFFFFFFFFFFFFFE7;
      }
      else
      {

      }
    }
  }
  return supportedInterfaceOrientations;
}

- (CKCoreChatController)chatController
{
  return self->_chatController;
}

- (BOOL)isComposingMessage
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;

  -[CKMessagesController composeChatController](self, "composeChatController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[CKMessagesController presentedViewController](self, "presentedViewController");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v2 == (void *)v8)
      {

        goto LABEL_11;
      }
      v3 = (void *)v8;
    }
    objc_msgSend(v6, "topViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController composeChatController](self, "composeChatController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {

    }
    if (v10 != v11)
    {
      LOBYTE(v9) = 0;
LABEL_12:

      return v9;
    }
LABEL_11:
    -[CKMessagesController composeChatController](self, "composeChatController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "isSendingMessage") ^ 1;

    goto LABEL_12;
  }
  LOBYTE(v9) = 0;
  return v9;
}

- (void)focusStateDidChange
{
  if (-[CKMessagesController isShowingInboxViewController](self, "isShowingInboxViewController")
    && !-[CKMessagesController _shouldShowInboxView](self, "_shouldShowInboxView"))
  {
    -[CKMessagesController showConversationListWithAnimation:](self, "showConversationListWithAnimation:", 1);
  }
  -[CKMessagesController updateInboxAndConversationList](self, "updateInboxAndConversationList");
}

- (BOOL)isShowingInboxViewController
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[CKMessagesController inboxViewController](self, "inboxViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (UIViewController)inboxViewController
{
  CKInboxViewController *v3;
  void *v4;
  UIViewController *v5;
  UIViewController *inboxViewController;

  if (!self->_inboxViewController && -[CKMessagesController _shouldShowInboxView](self, "_shouldShowInboxView"))
  {
    v3 = [CKInboxViewController alloc];
    -[CKMessagesController conversationListController](self, "conversationListController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CKInboxViewController initWithConversationListController:](v3, "initWithConversationListController:", v4);

    -[UIViewController setDelegate:](v5, "setDelegate:", self);
    inboxViewController = self->_inboxViewController;
    self->_inboxViewController = v5;

  }
  return self->_inboxViewController;
}

void __50__CKMessagesController_performResumeDeferredSetup__block_invoke(uint64_t a1)
{
  void *v2;
  CKAlertUtilities *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = objc_alloc_init(CKAlertUtilities);
  objc_msgSend(v2, "setAlertUtilities:", v3);

  objc_msgSend(*(id *)(a1 + 32), "alertUtilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "alertUtilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkFirstTimeRCS");

  objc_msgSend(*(id *)(a1 + 32), "alertUtilities");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "checkMissingCarrierSetting");

}

- (CKAlertUtilities)alertUtilities
{
  return self->_alertUtilities;
}

- (void)setAlertUtilities:(id)a3
{
  objc_storeStrong((id *)&self->_alertUtilities, a3);
}

- (void)didFinishCheckingMissingCarrierSetting
{
  -[CKMessagesController setAlertUtilities:](self, "setAlertUtilities:", 0);
}

- (void)setMessagesControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_messagesControllerDelegate, a3);
}

- (CKMessagesController)init
{
  CKMessagesController *v3;
  CKMessagesController *v4;
  objc_super v6;
  objc_super v7;

  if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
  {
    v7.receiver = self;
    v7.super_class = (Class)CKMessagesController;
    v3 = -[CKMessagesController initWithStyle:](&v7, sel_initWithStyle_, 2);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CKMessagesController;
    v3 = -[CKMessagesController init](&v6, sel_init);
  }
  v4 = v3;
  if (v3)
    -[CKMessagesController initialize](v3, "initialize");
  -[CKMessagesController setOscarModal:](v4, "setOscarModal:", 0);
  return v4;
}

- (void)setOscarModal:(BOOL)a3
{
  self->_oscarModal = a3;
}

- (void)initialize
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v5;

  -[CKMessagesController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  self->_isInitialLoad = 1;
  self->_attachmentPreviewQosClass = 17;
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addDelegate:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__conversationLeft_, CFSTR("CKConversationListConversationLeftNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__conversationListFinishedMerging_, CFSTR("CKConversationListFinishedMergingChatsNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__chatRegistryDidLoad_, *MEMORY[0x1E0D35470], 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__appStateChange_, *MEMORY[0x1E0CEB288], 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__appStateChange_, *MEMORY[0x1E0CEB350], 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__appStateChange_, *MEMORY[0x1E0CEB290], 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__appStateDidResumeFromInactive_, CFSTR("__kCKApplicationStateResumeFromInActiveNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__conversationFilteringStateChangedNotification_, CKMessageFilteringChangedNotification[0], 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_performVisibleAppPluginIconPrefetch_, CFSTR("CKBrowserSelectionControllerVisibleSwitcherPluginsChangedNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_performVisibleAppPluginIconPrefetch_, CFSTR("com.apple.messages.CKPluginPrewarmForLaunchCompleteNotification"), 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__unreadCountDidChange_, *MEMORY[0x1E0D354E0], 0);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__junkConversationsRecovered_, CFSTR("CKConversationListDidRecoverJunkConversationsNotification"), 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleSIMSubcriptionUpdateNotification, (CFStringRef)*MEMORY[0x1E0D38CF0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);

}

- (void)_appStateChange:(id)a3
{
  unsigned int v4;
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(a3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB290]) & 1) != 0
    || (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB350]) & 1) != 0)
  {
    v4 = 25;
    v5 = v7;
  }
  else
  {
    v6 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEB288]);
    v5 = v7;
    if (!v6)
      goto LABEL_5;
    v4 = 9;
  }
  self->_attachmentPreviewQosClass = v4;
LABEL_5:

}

uint64_t __85__CKMessagesController_showUnreadConversationsWithLastConversation_ignoringMessages___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showConversationListWithAnimation:", 0);
}

- (void)updatedFilterMode:(unint64_t)a3 previousFilterMode:(unint64_t)a4
{
  id v4;

  -[CKMessagesController selectionViewController](self, "selectionViewController", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setNeedsUpdateContentUnavailableConfiguration");

}

- (BOOL)showUnreadConversationsWithLastConversation:(id)a3 ignoringMessages:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  _QWORD v15[5];
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "showing conversation list", buf, 2u);
      }

    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__CKMessagesController_showUnreadConversationsWithLastConversation_ignoringMessages___block_invoke;
    v15[3] = &unk_1E274A208;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB8], "_performWithoutDeferringTransitions:", v15);
    LOBYTE(v9) = 1;
  }
  else
  {
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstUnreadFilteredConversationIgnoringMessages:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 0;
    if (v6 && v11 == v6)
      v9 = -[CKMessagesController resumeToConversation:](self, "resumeToConversation:", v6);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = CFSTR("NO");
        *(_DWORD *)buf = 138412802;
        if (v9)
          v13 = CFSTR("YES");
        v17 = v13;
        v18 = 2112;
        v19 = v6;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "didShow: %@ unread conversations with last conversation: %@ firstUnreadConversation: %@", buf, 0x20u);
      }

    }
  }

  return v9;
}

- (void)showConversationListWithAnimation:(BOOL)a3
{
  -[CKMessagesController showConversationListWithAnimation:didDismissController:](self, "showConversationListWithAnimation:didDismissController:", a3, 0);
}

- (BOOL)shouldRestoreToConversationListForState:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  NSObject *v8;
  BOOL v9;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  NSObject *v25;
  const char *v26;
  uint8_t *v27;
  uint8_t v28[16];
  __int16 v29;
  uint8_t v30[2];
  uint8_t v31[16];
  uint8_t buf[16];
  uint8_t v33[2];
  __int16 v34;

  v4 = a3;
  if (-[CKMessagesController _isTimedOutForState:](self, "_isTimedOutForState:", v4))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v34 = 0;
        v6 = "Should restore to conversation list because time suspended exceeded timeOut period. Returning YES";
        v7 = (uint8_t *)&v34;
LABEL_15:
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (!-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v33 = 0;
        v6 = "Should restore to conversation list because we're expanded. Returning YES.";
        v7 = v33;
        goto LABEL_15;
      }
LABEL_16:

    }
LABEL_17:
    v9 = 1;
    goto LABEL_18;
  }
  if (!objc_msgSend(v4, "showingInbox"))
  {
    objc_msgSend(v4, "unreadLastMessages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unreadFilteredConversationCountIgnoringMessages:", v11);

    if (v13 >= 2)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Should restore to conversation list because multiple conversations are newly unread. Returning YES", v31, 2u);
        }

      }
      v9 = 1;
      goto LABEL_44;
    }
    if (v13 != 1)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Should not restore to conversation list because there are no new unread conversations", v28, 2u);
        }

      }
      v9 = 0;
      goto LABEL_44;
    }
    objc_msgSend(v4, "groupID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "conversationForExistingChatWithChatIdentifier:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = v17;
    }
    else
    {
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "conversationForExistingChatWithGroupID:", v15);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstUnreadFilteredConversationIgnoringMessages:", v11);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    v24 = IMOSLoggingEnabled();
    v9 = v19 != v23;
    if (v19 == v23)
    {
      if (v24)
      {
        OSLogHandleForIMFoundationCategory();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v30 = 0;
          v26 = "Should not return to conversation list because last conversation is the newly unread conversation. Returning NO";
          v27 = v30;
          goto LABEL_41;
        }
LABEL_42:

      }
    }
    else if (v24)
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v29 = 0;
        v26 = "Should return to conversation list because there is a newly unread conversation. Returning YES";
        v27 = (uint8_t *)&v29;
LABEL_41:
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, v26, v27, 2u);
        goto LABEL_42;
      }
      goto LABEL_42;
    }

LABEL_44:
    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Should not restore to conversation list because should restore to inbox. Returning NO", buf, 2u);
    }

  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (void)setDeferredHandleURLBlock:(id)a3
{
  void *v4;
  id deferredHandleURLBlock;
  void *v6;
  void (**v7)(void);

  v7 = (void (**)(void))a3;
  -[CKMessagesController onboardingController](self, "onboardingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKMessagesController isInitialLoad](self, "isInitialLoad") || v4)
  {
    v6 = (void *)objc_msgSend(v7, "copy");

    deferredHandleURLBlock = self->_deferredHandleURLBlock;
    self->_deferredHandleURLBlock = v6;
  }
  else
  {
    v7[2]();
    deferredHandleURLBlock = v7;
  }

}

- (void)popToConversationListIfNecessaryAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  id v13;

  v3 = a3;
  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visibleViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0 || (v10 & 1) != 0)
  {
    -[CKMessagesController updateInboxAndConversationList](self, "updateInboxAndConversationList");
    -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController conversationListController](self, "conversationListController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v13, "popToViewController:animated:", v11, v3);

  }
}

- (void)dismissChatControllerIfVisibleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];

  v3 = a3;
  if (-[CKMessagesController isComposingMessage](self, "isComposingMessage"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__CKMessagesController_dismissChatControllerIfVisibleAnimated___block_invoke;
    v5[3] = &unk_1E274A208;
    v5[4] = self;
    -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, v5);
  }
  else
  {
    -[CKMessagesController popToConversationListIfNecessaryAnimated:](self, "popToConversationListIfNecessaryAnimated:", v3);
  }
}

- (void)cleanUpBizNavBarForConversation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    -[CKMessagesController conversationListController](self, "conversationListController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enableBranding:forBusinessChat:", 0, v7);

  }
}

- (BOOL)_isTimedOutForState:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  BOOL v9;

  objc_msgSend(a3, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resumeToConversationListTimeInterval");
    v9 = v6 > v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CKCoreChatController setDelegate:](self->_chatController, "setDelegate:", 0);
  -[CKCoreChatController setDelegate:](self->_composeChatController, "setDelegate:", 0);
  -[UINavigationController setDelegate:](self->_conversationListNavigationController, "setDelegate:", 0);
  -[CKConversationListControllerProtocol setDelegate:](self->_conversationListController, "setDelegate:", 0);
  -[CKInteractionNotificationView setDelegate:](self->_dismissOnInteractionView, "setDelegate:", 0);
  -[UINavigationController setDelegate:](self->_chatNavigationController, "setDelegate:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0D38CF0], 0);
  v5.receiver = self;
  v5.super_class = (Class)CKMessagesController;
  -[CKMessagesController dealloc](&v5, sel_dealloc);
}

- (id)initAsOscarModal
{
  CKMessagesController *v2;
  CKMessagesController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessagesController;
  v2 = -[CKMessagesController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CKMessagesController initialize](v2, "initialize");
    -[CKMessagesController setOscarModal:](v3, "setOscarModal:", 1);
  }
  return v3;
}

- (CKMessagesController)initWithStyle:(int64_t)a3
{
  CKMessagesController *v3;
  CKMessagesController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKMessagesController;
  v3 = -[CKMessagesController initWithStyle:](&v6, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
    -[CKMessagesController initialize](v3, "initialize");
  return v4;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  objc_super v13;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[CKMessagesController chatController](self, "chatController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKMessagesController chatController](self, "chatController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissTipIfPresented");

  }
  v13.receiver = self;
  v13.super_class = (Class)CKMessagesController;
  -[CKMessagesController presentViewController:animated:completion:](&v13, sel_presentViewController_animated_completion_, v8, v6, v9);

}

- (id)conversationListControllerIfInitialized
{
  return self->_conversationListController;
}

- (void)conversationListControllerTappedDeleteNewMessage:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v7 = a3;
  -[CKMessagesController composeChatController](self, "composeChatController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelCompose");

  }
  else
  {
    -[CKMessagesController composeChatControllerDidCancelComposition:](self, "composeChatControllerDidCancelComposition:", 0);
    objc_msgSend(v7, "reloadData");
  }

}

- (void)_installTickerIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("showTickerHUD"));

    if (v6)
    {
      -[CKMessagesController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "window");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "windowScene");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        +[CKDebugTicker sharedTicker](_TtC7ChatKit13CKDebugTicker, "sharedTicker");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMessagesController view](self, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "window");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "installUIWithWindowScene:parentWindow:", v12, v11);

      }
    }
  }
}

- (BOOL)daemonIsConnected
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  return v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *v8;
  const __CFString *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(34);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 136315394;
      v12 = "-[CKMessagesController viewWillDisappear:]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "%s, animated:%@", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = "-[CKMessagesController viewWillDisappear:]";
    v9 = v7;
    _CKLog();
  }
  v10.receiver = self;
  v10.super_class = (Class)CKMessagesController;
  -[CKMessagesController viewWillDisappear:](&v10, sel_viewWillDisappear_, v3, v8, v9);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *v8;
  const __CFString *v9;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(34);
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 136315394;
      v12 = "-[CKMessagesController viewDidDisappear:]";
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_DEBUG, "%s, animated:%@", buf, 0x16u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v7 = CFSTR("NO");
    if (v3)
      v7 = CFSTR("YES");
    v8 = "-[CKMessagesController viewDidDisappear:]";
    v9 = v7;
    _CKLog();
  }
  -[CKMessagesController _updateAlertSuppressionContext](self, "_updateAlertSuppressionContext", v8, v9);
  v10.receiver = self;
  v10.super_class = (Class)CKMessagesController;
  -[CKMessagesController viewDidDisappear:](&v10, sel_viewDidDisappear_, v3);
}

- (BOOL)shouldAutorotate
{
  void *v3;
  char v4;

  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
    -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  else
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldAutorotate");

  return v4;
}

- (void)didReceiveMemoryWarning
{
  void *v3;
  objc_super v4;

  +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pruneCache");

  v4.receiver = self;
  v4.super_class = (Class)CKMessagesController;
  -[CKMessagesController didReceiveMemoryWarning](&v4, sel_didReceiveMemoryWarning);
}

void __60__CKMessagesController_performVisibleAppPluginIconPrefetch___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "appIconPrefetchLimit");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_sharedBalloonPluginManager", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleDrawerPlugins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    v11 = v8 + 1;
    v8 += v7;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v5);
      if (v11 + v10 > v3)
        break;
      v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
      objc_msgSend(*(id *)(a1 + 32), "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "__ck_prefetchBrowserImageForInterfaceStyle:", objc_msgSend(v13, "userInterfaceStyle"));

      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)dismissKeyboardIfVisible
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  -[CKMessagesController chatController](self, "chatController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v5;

  objc_msgSend(v10, "entryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFirstResponder");

  if (v9)
    objc_msgSend(v10, "dismissKeyboard");

}

- (void)performSearchForQuery:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD aBlock[5];
  id v13;
  char v14;

  v4 = a3;
  v14 = 0;
  -[CKMessagesController showConversationListWithAnimation:didDismissController:](self, "showConversationListWithAnimation:didDismissController:", 1, &v14);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__CKMessagesController_performSearchForQuery___block_invoke;
  aBlock[3] = &unk_1E274A108;
  aBlock[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = _Block_copy(aBlock);
  v8 = v7;
  if (v14)
  {
    v9 = dispatch_time(0, 250000000);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __46__CKMessagesController_performSearchForQuery___block_invoke_160;
    v10[3] = &unk_1E274AED0;
    v11 = v8;
    dispatch_after(v9, MEMORY[0x1E0C80D38], v10);

  }
  else
  {
    (*((void (**)(void *))v7 + 2))(v7);
  }

}

void __46__CKMessagesController_performSearchForQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "conversationListController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "conversationListController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__CKMessagesController_performSearchForQuery___block_invoke_2;
    v8[3] = &unk_1E274A208;
    v9 = v5;
    objc_msgSend(v4, "performSearch:completion:", v9, v8);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "conversationListController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDeferredSearchQuery:", v6);

  }
}

void __46__CKMessagesController_performSearchForQuery___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Performed search with query:%@", (uint8_t *)&v4, 0xCu);
    }

  }
}

uint64_t __46__CKMessagesController_performSearchForQuery___block_invoke_160(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)prepareForSuspend
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "prepareForSuspend", v12, 2u);
    }

  }
  -[CKMessagesController setStatusBarStyleViewController:](self, "setStatusBarStyleViewController:", 0);
  -[CKMessagesController inboxViewController](self, "inboxViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKMessagesController inboxViewController](self, "inboxViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepareForSuspend");

  }
  -[CKMessagesController onboardingController](self, "onboardingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareForSuspend");

  -[CKMessagesController setOnboardingController:](self, "setOnboardingController:", 0);
  -[CKMessagesController conversationListController](self, "conversationListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareForSuspend");

  -[CKMessagesController chatController](self, "chatController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prepareForSuspend");

  -[CKMessagesController composeChatController](self, "composeChatController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "prepareForSuspend");

  -[CKMessagesController teardownCamera](self, "teardownCamera");
  if (!CKIsRunningInMacCatalyst())
  {
    -[CKMessagesController _sharedBalloonPluginManager](self, "_sharedBalloonPluginManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateAllActivePluginsSkippingCameraApp:", 1);

  }
}

- (void)prepareForResume
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKMessagesController inboxViewController](self, "inboxViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[CKMessagesController inboxViewController](self, "inboxViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prepareForResume");

  }
  -[CKMessagesController conversationListController](self, "conversationListController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareForResume");

  -[CKMessagesController chatController](self, "chatController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareForResume");

  -[CKMessagesController composeChatController](self, "composeChatController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareForResume");

  if (!CKIsRunningInMacCatalyst())
    -[CKMessagesController presentOnboardingViewControllerIfNeeded](self, "presentOnboardingViewControllerIfNeeded");
}

- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;

  v4 = a4;
  v5 = a3;
  -[CKMessagesController chatController](self, "chatController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentControllerDidResume:animating:", v5, v4);

  -[CKMessagesController composeChatController](self, "composeChatController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentControllerDidResume:animating:", v5, v4);

}

- (BOOL)_shouldShowSMSRelayPromptOnLaunch
{
  return (CKSMSRelaySettingsConfirmed() & 1) == 0
      && -[CKMessagesController _shouldShowSMSRelayPrompt](self, "_shouldShowSMSRelayPrompt");
}

- (BOOL)_shouldShowSMSRelayPrompt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35918], "smsService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccountsForService:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_7;
  if ((objc_msgSend(v6, "isSMSRelayCapable") & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CKMessagesController__shouldShowSMSRelayPrompt__block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    if (_shouldShowSMSRelayPrompt_onceToken != -1)
      dispatch_once(&_shouldShowSMSRelayPrompt_onceToken, block);
  }
  if (objc_msgSend(v6, "isSMSRelayCapable") && (objc_msgSend(v6, "allowsSMSRelay") & 1) == 0)
    v7 = objc_msgSend(v6, "registrationStatus") == 5 || objc_msgSend(v6, "registrationStatus") == 0;
  else
LABEL_7:
    v7 = 0;

  return v7;
}

void __49__CKMessagesController__shouldShowSMSRelayPrompt__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *MEMORY[0x1E0D35708];
  objc_msgSend(MEMORY[0x1E0D35918], "smsService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__showSMSRelayPromptIfNeeded, v3, v4);

}

- (void)_showSMSRelayPromptOnLaunchIfNeeded
{
  if (-[CKMessagesController _shouldShowSMSRelayPromptOnLaunch](self, "_shouldShowSMSRelayPromptOnLaunch"))
    -[CKMessagesController _showSMSRelayPromptIfNeeded](self, "_showSMSRelayPromptIfNeeded");
}

- (void)_showSMSRelayPromptIfNeeded
{
  _BOOL4 v3;
  int v4;
  NSObject *v5;
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
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  CKMessagesController *v21;
  uint8_t buf[16];

  v3 = -[CKMessagesController _shouldShowSMSRelayPrompt](self, "_shouldShowSMSRelayPrompt");
  v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Show SMS Relay Prompt", buf, 2u);
      }

    }
    CKSetSMSRelaySettingsConfirmed(1);
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_ALERT_TITLE_MAC"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_ALERT_BODY"), &stru_1E276D870, CFSTR("ChatKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_TURN_ON"), &stru_1E276D870, CFSTR("ChatKit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v12, 0, &__block_literal_global_269);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_NOT_NOW"), &stru_1E276D870, CFSTR("ChatKit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v15, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addAction:", v16);
    objc_msgSend(v10, "addAction:", v13);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __51__CKMessagesController__showSMSRelayPromptIfNeeded__block_invoke_2;
    v19[3] = &unk_1E274A108;
    v20 = v10;
    v21 = self;
    v17 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
  else if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "NOT showing SMS Relay Prompt", buf, 2u);
    }

  }
}

void __51__CKMessagesController__showSMSRelayPromptIfNeeded__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35918], "smsService");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "activeAccountsForService:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "enrollSelfDeviceInSMSRelay");
}

uint64_t __51__CKMessagesController__showSMSRelayPromptIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentFromViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_showNextSMSRelayPINPrompt
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  CKMessagesController *v15;
  id v16;

  -[CKMessagesController pendingSMSRelayPINPrompts](self, "pendingSMSRelayPINPrompts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CKMessagesController pendingSMSRelayPINPrompts](self, "pendingSMSRelayPINPrompts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMessagesController pendingSMSRelayPINPrompts](self, "pendingSMSRelayPINPrompts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v6);

    -[CKMessagesController pendingSMSRelayPINPrompts](self, "pendingSMSRelayPINPrompts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
      -[CKMessagesController setPendingSMSRelayPINPrompts:](self, "setPendingSMSRelayPINPrompts:", 0);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __50__CKMessagesController__showNextSMSRelayPINPrompt__block_invoke;
    v14 = &unk_1E274A108;
    v15 = self;
    v16 = v6;
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], &v11);
    -[CKMessagesController _showNextSMSRelayPINPrompt](self, "_showNextSMSRelayPINPrompt", v11, v12, v13, v14, v15);

  }
}

uint64_t __50__CKMessagesController__showNextSMSRelayPINPrompt__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentSMSRelayPinAlert:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "presentFromViewController:animated:completion:", *(_QWORD *)(a1 + 32), 1, 0);
}

- (void)_smsRelayPINReceived:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKMessagesController _shouldShowSMSRelayPrompt](self, "_shouldShowSMSRelayPrompt"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v4;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Received notification for SMS Relay PIN %@", buf, 0xCu);
      }

    }
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("pinCode"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("phoneNumber"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && v9)
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_PIN_PROMPT_MAC"), &stru_1E276D870, CFSTR("ChatKit"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v12, v9, v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v14, "userInterfaceLayoutDirection") == 1;

      if ((_DWORD)v12)
        v15 = CFSTR("\u200F");
      else
        v15 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_WAITING"), &stru_1E276D870, CFSTR("ChatKit"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v16, v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v21, 1, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "addAction:", v22);
      -[CKMessagesController pendingSMSRelayPINPrompts](self, "pendingSMSRelayPINPrompts");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = v23 == 0;

      if ((_DWORD)v20)
      {
        v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[CKMessagesController setPendingSMSRelayPINPrompts:](self, "setPendingSMSRelayPINPrompts:", v24);

      }
      -[CKMessagesController pendingSMSRelayPINPrompts](self, "pendingSMSRelayPINPrompts");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v19);

      -[CKMessagesController _showNextSMSRelayPINPrompt](self, "_showNextSMSRelayPINPrompt");
    }

  }
}

- (void)_pinVerificationShouldDismiss:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
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
  id v22;
  _QWORD v23[4];
  id v24;
  CKMessagesController *v25;
  _QWORD v26[5];
  _QWORD block[5];

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("wasCancelled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", CFSTR("responseFromDevice"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v9, "BOOLValue");

  v10 = MEMORY[0x1E0C809B0];
  if (!(_DWORD)v6)
    goto LABEL_5;
  -[CKMessagesController currentSMSRelayPinAlert](self, "currentSMSRelayPinAlert");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  if (v7)
  {
LABEL_5:
    -[CKMessagesController setPendingSMSRelayPINPrompts:](self, "setPendingSMSRelayPINPrompts:", 0);
    -[CKMessagesController presentedViewController](self, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v26[0] = v10;
      v26[1] = 3221225472;
      v26[2] = __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke_2;
      v26[3] = &unk_1E274A208;
      v26[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], v26);
    }
    CKFrameworkBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_CANCELLED_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_CANCELLED_BODY"), &stru_1E276D870, CFSTR("ChatKit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v14, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v19, 1, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "addAction:", v20);
    objc_msgSend(v17, "preferredAction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
      objc_msgSend(v17, "setPreferredAction:", v20);
    v23[0] = v10;
    v23[1] = 3221225472;
    v23[2] = __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke_3;
    v23[3] = &unk_1E274A108;
    v24 = v17;
    v25 = self;
    v22 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], v23);

  }
}

uint64_t __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "currentSMSRelayPinAlert");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

  return objc_msgSend(*(id *)(a1 + 32), "setCurrentSMSRelayPinAlert:", 0);
}

uint64_t __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __54__CKMessagesController__pinVerificationShouldDismiss___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentFromViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (id)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKMessagesController isComposingMessage](self, "isComposingMessage")
    && (-[CKMessagesController composeChatController](self, "composeChatController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKMessagesController chatController](self, "chatController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_7;
    -[CKMessagesController chatController](self, "chatController");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v5;
  objc_msgSend(v3, "addObject:", v5);

LABEL_7:
  -[CKMessagesController conversationListController](self, "conversationListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CKMessagesController conversationListController](self, "conversationListController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  return v3;
}

- (void)chatController:(id)a3 willSendComposition:(id)a4 inConversation:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v7, "shouldDismissAfterSend"))
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __74__CKMessagesController_chatController_willSendComposition_inConversation___block_invoke;
      v10[3] = &unk_1E274A208;
      v10[4] = self;
      -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10);
    }
    -[CKMessagesController setupBizNavBarForConversation:](self, "setupBizNavBarForConversation:", v8);
  }
  -[CKMessagesController conversationListController](self, "conversationListController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "compositionSent");

}

void __74__CKMessagesController_chatController_willSendComposition_inConversation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cancelAndDestroyComposition");
  objc_msgSend(*(id *)(a1 + 32), "chatController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endHoldingScrollGeometryUpdatesForReason:", CFSTR("TransitionFromForwarding"));

}

- (void)chatController:(id)a3 didSendCompositionInConversation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v6, "shouldDismissAfterSend"))
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __72__CKMessagesController_chatController_didSendCompositionInConversation___block_invoke;
      v9[3] = &unk_1E274A208;
      v9[4] = self;
      -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);
    }
    else
    {
      -[CKMessagesController showConversation:animate:](self, "showConversation:animate:", v7, 1);
    }
  }
  -[CKMessagesController conversationListController](self, "conversationListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateConversationListForMessageSentToConversation:", v7);

}

void __72__CKMessagesController_chatController_didSendCompositionInConversation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cancelAndDestroyComposition");
  objc_msgSend(*(id *)(a1 + 32), "chatController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endHoldingScrollGeometryUpdatesForReason:", CFSTR("TransitionFromForwarding"));

}

- (void)chatController:(id)a3 didReportSpamForConversation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  BOOL IsModified;
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
  id v22;

  v5 = a4;
  -[CKMessagesController showConversationListWithAnimation:](self, "showConversationListWithAnimation:", 1);
  +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "purgeConversation:", v5);

  -[CKMessagesController deleteConversation:](self, "deleteConversation:", v5);
  -[CKMessagesController conversationListController](self, "conversationListController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateConversationList");

  if (!CKIsForceUnknownFilteringEnabled()
    || (objc_msgSend(MEMORY[0x1E0D397F8], "IMDeviceRegionIsEligibleToBeForcedIntoFilteringUnknownSender") & 1) == 0)
  {
    v8 = -[CKMessagesController _isMessageFilteringEnabled](self, "_isMessageFilteringEnabled");
    IsModified = CKMessageFilteringIsModified();
    if (v8)
    {
      if (!IsModified && CKMessageForceFilteringIsExpected())
        CKSetMessageFilteringSettingsConfirmed(1);
    }
    else if (!IsModified && CKMessageForceFilteringIsExpected())
    {
      CKSetMessageFilteringSettingsConfirmed(1);
      v10 = (void *)MEMORY[0x1E0CEA2E8];
      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MESSAGE_FILTERING_PROMPT_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("MESSAGE_FILTERING_PROMPT_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v12, v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("MESSAGE_FILTERING_TURN_ON"), &stru_1E276D870, CFSTR("ChatKit"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v17, 0, &__block_literal_global_216_3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAction:", v18);

      CKFrameworkBundle();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("MESSAGE_FILTERING_NOT_NOW"), &stru_1E276D870, CFSTR("ChatKit"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v20, 0, &__block_literal_global_219_2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAction:", v21);

      -[CKMessagesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
    }
  }
  if (!-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    -[CKMessagesController conversationListController](self, "conversationListController");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "selectDefaultConversationAnimated:", 1);

  }
}

void __68__CKMessagesController_chatController_didReportSpamForConversation___block_invoke()
{
  CKSetMessageFilteringEnabled(1);
}

- (void)chatController:(id)a3 requestDeleteJunkConversation:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deleteConversation:", v5);

  -[CKMessagesController conversationListController](self, "conversationListController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userDeletedJunkConversationFromTranscript");

}

- (void)chatController:(id)a3 requestRecoverJunkConversation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "recoverJunkMessagesInConversations:", v7);
  -[CKMessagesController conversationListController](self, "conversationListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userRecoveredJunkConversationFromTranscript");

}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
{
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
  UIEdgeInsets result;

  -[CKMessagesController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKMessagesController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "effectiveUserInterfaceLayoutDirection");

  if (v13)
    v14 = v11;
  else
    v14 = v7;
  if (v13)
    v15 = v7;
  else
    v15 = v11;
  v16 = v5;
  v17 = v9;
  result.right = v15;
  result.bottom = v17;
  result.left = v14;
  result.top = v16;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
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

  -[CKMessagesController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
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

- (void)chatController:(id)a3 forwardComposition:(id)a4
{
  CKShareSheetChatController *v5;
  CKNavigationController *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    v5 = -[CKComposeChatController initWithRecipientAddresses:composition:bizIntent:]([CKShareSheetChatController alloc], "initWithRecipientAddresses:composition:bizIntent:", 0, v15, 0);
    -[CKCoreChatController setDelegate:](v5, "setDelegate:", self);
    -[CKChatController setSendMenuDelegate:](v5, "setSendMenuDelegate:", self);
    v6 = -[CKNavigationController initWithRootViewController:]([CKNavigationController alloc], "initWithRootViewController:", v5);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "useMacToolbar");

    if (v8)
    {
      -[CKNavigationController setNavigationBarHidden:](v6, "setNavigationBarHidden:", 1);
    }
    else
    {
      -[CKNavigationController navigationBar](v6, "navigationBar");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "theme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBarStyle:", objc_msgSend(v11, "navBarStyle"));

    }
    -[CKMessagesController setComposeChatNavigationController:](self, "setComposeChatNavigationController:", v6);
    -[CKMessagesController setComposeChatController:](self, "setComposeChatController:", v5);
    -[CKMessagesController chatController](self, "chatController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "beginHoldingScrollGeometryUpdatesForReason:", CFSTR("TransitionFromForwarding"));

    -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);

  }
  else
  {
    -[CKMessagesController showNewMessageCompositionPanelAppendingToExistingDraft:animated:](self, "showNewMessageCompositionPanelAppendingToExistingDraft:animated:", v15, 1);
  }
  -[CKMessagesController conversationListController](self, "conversationListController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateConversationList");

}

- (void)chatController:(id)a3 shouldComposeConversationWithRecipientAddresses:(id)a4
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:animated:](self, "showNewMessageCompositionPanelWithRecipients:composition:animated:", a4, 0, 1);
}

- (void)chatController:(id)a3 shouldComposeConversationWithRecipientAddresses:(id)a4 composition:(id)a5
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:animated:](self, "showNewMessageCompositionPanelWithRecipients:composition:animated:", a4, a5, 1);
}

- (void)chatController:(id)a3 shouldComposeAudioMessageWithRecipientAddresses:(id)a4
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:startAudioRecording:simID:sendMessageHandler:](self, "showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:startAudioRecording:simID:sendMessageHandler:", a4, 0, 0, 0, 1, 0, 0, 0, v4, 0, 0);
}

- (void)chatController:(id)a3 shouldComposeVideoMessageWithRecipientAddresses:(id)a4
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:](self, "showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:", a4, 0, 0, 0, 1, 0, *MEMORY[0x1E0D375A0], 0, 0);
}

- (void)chatController:(id)a3 requestPresentSendMenu:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CKMessagesController *v11;
  CKMessagesController *v12;
  CKMessagesController *v13;
  CKSendMenuPresentation *v14;
  CKSendMenuPresentation *sendMenuPresentation;
  CKSendMenuPresentation *v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = a4;
  -[CKSendMenuPresentation sendMenuViewController](self->_sendMenuPresentation, "sendMenuViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = self;
    if (-[CKMessagesController isComposingMessage](v11, "isComposingMessage"))
    {
      -[CKMessagesController composeChatController](v11, "composeChatController");
      v12 = (CKMessagesController *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v11;
      if (!objc_msgSend(v6, "isModal"))
      {
LABEL_8:
        v14 = (CKSendMenuPresentation *)objc_msgSend(v7, "newSendMenuPresentationWithPresentingViewController:delegate:", v13, v11);
        sendMenuPresentation = self->_sendMenuPresentation;
        self->_sendMenuPresentation = v14;

        v16 = self->_sendMenuPresentation;
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __62__CKMessagesController_chatController_requestPresentSendMenu___block_invoke;
        v17[3] = &unk_1E274A208;
        v18 = v7;
        -[CKSendMenuPresentation beginPresentationWithCompletion:](v16, "beginPresentationWithCompletion:", v17);

        goto LABEL_9;
      }
      v12 = (CKMessagesController *)v6;
    }
    v13 = v12;

    goto LABEL_8;
  }
  -[CKSendMenuPresentation rePresentSendMenu](self->_sendMenuPresentation, "rePresentSendMenu");
  objc_msgSend(v7, "didFinishPresentTransition");
LABEL_9:

}

uint64_t __62__CKMessagesController_chatController_requestPresentSendMenu___block_invoke(uint64_t a1)
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

- (void)chatControllerDidChangeDeferringSystemNavigationPopGestureForPlusButton:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_msgSend(a3, "isDeferringSystemNavigationPopGestureForPlusButton") ^ 1;
  -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interactivePopGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelaysTouchesBegan:", v4);

  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interactivePopGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelaysTouchesBegan:", v4);

  -[CKMessagesController setNeedsUpdateOfScreenEdgesDeferringSystemGestures](self, "setNeedsUpdateOfScreenEdgesDeferringSystemGestures");
}

- (id)navigationBarBackdropLayerGroupNameForChatController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
      -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
    else
      -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_backdropViewLayerGroupName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)unreadCountForCurrentFilterModeForChatController:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[CKMessagesController conversationList](self, "conversationList", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController conversationListController](self, "conversationListController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "unreadCountForFilterMode:", objc_msgSend(v5, "filterMode"));

  return v6;
}

- (BOOL)hasRecentlyDeletedFilterSelected
{
  void *v2;
  BOOL v3;

  -[CKMessagesController conversationListController](self, "conversationListController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "filterMode") == 7;

  return v3;
}

- (void)didSelectFilterFromViewMenu:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "propertyList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "propertyList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController catalystFilterModeSelected:](self, "catalystFilterModeSelected:", (int)objc_msgSend(v5, "intValue"));

  }
}

- (void)catalystFilterModeSelected:(unint64_t)a3
{
  void *v4;
  id v5;

  -[CKMessagesController inboxViewController:didSelectFilterMode:](self, "inboxViewController:didSelectFilterMode:", 0, a3);
  -[CKMessagesController macToolbarController](self, "macToolbarController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadToolbarItems");

  -[CKMessagesController conversationListController](self, "conversationListController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissCatalystSearch");

}

- (unint64_t)currentConversationListFilterMode
{
  void *v2;
  unint64_t v3;

  -[CKMessagesController conversationListController](self, "conversationListController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "filterMode");

  return v3;
}

- (BOOL)_isApplyingJunkFilter
{
  return -[CKMessagesController currentConversationListFilterMode](self, "currentConversationListFilterMode") == 9;
}

- (void)updateSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
  self->_forceOrientation = 1;
  -[CKMessagesController updateInterfaceOrientationsAnimated:](self, "updateInterfaceOrientationsAnimated:", 0);
}

- (void)stopForcingOrientation
{
  self->_supportedInterfaceOrientations = 30;
  self->_forceOrientation = 0;
  -[CKMessagesController updateInterfaceOrientationsAnimated:](self, "updateInterfaceOrientationsAnimated:", 1);
}

- (void)updateInterfaceOrientationsAnimated:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[7];

  if (a3)
  {
    -[CKMessagesController _setNeedsUpdateOfSupportedInterfaceOrientations](self, "_setNeedsUpdateOfSupportedInterfaceOrientations");
  }
  else
  {
    v5[5] = v3;
    v5[6] = v4;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__CKMessagesController_updateInterfaceOrientationsAnimated___block_invoke;
    v5[3] = &unk_1E274A208;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v5);
  }
}

uint64_t __60__CKMessagesController_updateInterfaceOrientationsAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdateOfSupportedInterfaceOrientations");
}

- (BOOL)shouldClearSecondaryItemsFromToolbarController:(id)a3
{
  return -[CKMessagesController _isApplyingJunkFilter](self, "_isApplyingJunkFilter", a3)
      || -[CKMessagesController isShowingSelectionView](self, "isShowingSelectionView");
}

- (void)splitViewControllerDidExpand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[CKMessagesController inboxModel](self, "inboxModel", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsCollapsed:", 0);

  -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[CKMessagesController _populateChatNavigationControllerWithSelection](self, "_populateChatNavigationControllerWithSelection");
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  void *v6;
  void *v7;
  char isKindOfClass;

  -[CKMessagesController dismissPhotosGridIfNeeded](self, "dismissPhotosGridIfNeeded", a3);
  if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
  {
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && !-[CKMessagesController isComposingMessage](self, "isComposingMessage"))
      return 1;
  }
  return a4;
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  -[CKMessagesController dismissPhotosGridIfNeeded](self, "dismissPhotosGridIfNeeded", a3);
  return a4;
}

void __102__CKMessagesController_splitViewController_collapseSecondaryViewController_ontoPrimaryViewController___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__CKMessagesController_splitViewController_collapseSecondaryViewController_ontoPrimaryViewController___block_invoke_2;
  block[3] = &unk_1E274B548;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __102__CKMessagesController_splitViewController_collapseSecondaryViewController_ontoPrimaryViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endPinningInputViewsForReason:", CFSTR("SplitViewFromExpandedToCollapsedTransition"));

}

- (id)splitViewController:(id)a3 separateSecondaryViewControllerFromPrimaryViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  CKMessagesController *v46;
  id v47;
  id location[2];

  v6 = a3;
  v7 = a4;
  -[CKMessagesController dismissPhotosGridIfNeeded](self, "dismissPhotosGridIfNeeded");
  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDarkEffectStyle:", 0);

  -[CKMessagesController popToConversationListIfNecessaryAnimated:](self, "popToConversationListIfNecessaryAnimated:", 1);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "shouldSuppressRotationInNewCompose") & 1) != 0)
  {

  }
  else
  {
    v11 = -[CKMessagesController isComposingMessage](self, "isComposingMessage");

    if (v11)
    {
      -[CKMessagesController composeChatController](self, "composeChatController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "proposedRecipients");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "arrayByApplyingSelector:", sel_rawAddress);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "composition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController cancelAndDestroyComposition](self, "cancelAndDestroyComposition");
      -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:animated:](self, "showNewMessageCompositionPanelWithRecipients:composition:animated:", v14, v15, 0);
      location[0] = 0;
      -[CKMessagesController composeChatController](self, "composeChatController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(location, v16);

      WeakRetained = objc_loadWeakRetained(location);
      objc_msgSend(WeakRetained, "beginPinningInputViewsForReason:", CFSTR("SplitViewFromCollapsedToExpandedTransition"));

      v42 = MEMORY[0x1E0C809B0];
      v43 = 3221225472;
      v44 = __101__CKMessagesController_splitViewController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke;
      v45 = &unk_1E274D388;
      v46 = self;
      objc_copyWeak(&v47, location);
      -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, &v42);
      -[CKMessagesController chatNavigationController](self, "chatNavigationController", v42, v43, v44, v45, v46);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_destroyWeak(&v47);
      objc_destroyWeak(location);

      goto LABEL_26;
    }
  }
  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 == v7)
  {
    -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "viewControllers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22 <= 2)
    {
      -[CKMessagesController chatNavigationController](self, "chatNavigationController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "parentViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {

      }
      else
      {
        -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "viewControllers");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMessagesController chatNavigationController](self, "chatNavigationController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "indexOfObjectIdenticalTo:", v27);

        if (v28 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_23;
        -[CKMessagesController viewIfLoaded](self, "viewIfLoaded");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "window");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKMessagesController chatNavigationController](self, "chatNavigationController");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "viewIfLoaded");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "viewIfLoaded");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v31, "window");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (v34 == v23)
          {
            objc_msgSend(v33, "window");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35 == v23)
            {
              objc_msgSend(v31, "superview");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "superview");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "superview");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38 == v33)
              {
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                  {
                    LOWORD(location[0]) = 0;
                    _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "ChatNavigationController's view is in the view hirearchy, but chatNaviationController is not in the VC hirearchy! Unexpected state, attempting to fix", (uint8_t *)location, 2u);
                  }

                }
                objc_msgSend(v31, "removeFromSuperview");
              }
            }
          }
          else
          {

          }
        }

      }
    }
  }
  else
  {

  }
LABEL_23:
  -[CKMessagesController chatController](self, "chatController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
    -[CKMessagesController _populateChatNavigationControllerWithSelection](self, "_populateChatNavigationControllerWithSelection");
  -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v18;
}

void __101__CKMessagesController_splitViewController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setComposeChatNavigationController:", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__CKMessagesController_splitViewController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke_2;
  block[3] = &unk_1E274B548;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v3);
}

void __101__CKMessagesController_splitViewController_separateSecondaryViewControllerFromPrimaryViewController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endPinningInputViewsForReason:", CFSTR("SplitViewFromCollapsedToExpandedTransition"));

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  void *v6;
  _BOOL4 v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKMessagesController;
  -[CKMessagesController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a3, a4);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "shouldSuppressRotationInNewCompose") & 1) == 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "usesUncollapsedSplitview") & 1) != 0)
    {
      v7 = -[CKMessagesController isComposingMessage](self, "isComposingMessage");

      if (!v7)
        return;
      +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 0, 0);
    }
    else
    {

    }
  }

}

- (BOOL)_splitViewControllerShouldRestoreResponderAfterTraitCollectionTransition:(id)a3
{
  return !-[CKMessagesController isComposingMessage](self, "isComposingMessage", a3);
}

- (double)_splitViewController:(id)a3 constrainPrimaryColumnWidthForResizeWidth:(double)a4
{
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  int v17;
  BOOL v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v36;
  double v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;

  if (CKIsRunningInMacCatalyst())
  {
    v40 = 0uLL;
    v41 = 0;
    -[CKMessagesController columnResizeParams](self, "columnResizeParams");
    -[CKMessagesController primaryColumnWidth](self, "primaryColumnWidth");
    v7 = v6;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minConversationListWidth");
    v10 = v9;
    v11 = v7 == v9;

    -[CKMessagesController primaryColumnWidth](self, "primaryColumnWidth");
    v13 = v12;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "snapToMinConversationListWidth");
    v16 = v15;
    v17 = v13 == v15;

    if (!v11 && (BYTE1(v41) == v17 ? (v18 = v41 == a4 >= 0.0) : (v18 = 0), v18))
      v19 = *(double *)&v40 + vabdd_f64(a4, *((double *)&v40 + 1));
    else
      v19 = vabdd_f64(a4, *((double *)&v40 + 1));
    *(double *)&v40 = v19;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "conversationListDragDistanceThreshold");
    v22 = v21;

    if (v7 == v10)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 < *(double *)&v40 && a4 >= 0.0)
        goto LABEL_12;
    }
    else
    {
      if (v13 != v16)
      {
        if (a4 >= 0.0
          || v22 >= *(double *)&v40
          || (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
              v31 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v31, "snapToMinConversationListWidth"),
              v33 = v32,
              v31,
              v33 <= a4))
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "snapToMinConversationListWidth");
          v30 = v37;

          if (v30 <= a4)
            v30 = a4;
          goto LABEL_26;
        }
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v34;
        goto LABEL_24;
      }
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v26;
      if (a4 >= 0.0)
      {
        objc_msgSend(v26, "snapToMinConversationListWidth");
        v28 = v27;

        v29 = v28 <= a4;
        v30 = a4;
        if (v29)
        {
LABEL_26:
          *((double *)&v40 + 1) = a4;
          LOBYTE(v41) = a4 >= 0.0;
          BYTE1(v41) = v17;
          BYTE2(v41) = v11;
          v38 = v40;
          v39 = v41;
          -[CKMessagesController setColumnResizeParams:](self, "setColumnResizeParams:", &v38);
          return v30;
        }
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v24;
        goto LABEL_13;
      }
      if (v22 >= *(double *)&v40)
      {
LABEL_12:
        v24 = v23;
LABEL_13:
        objc_msgSend(v24, "snapToMinConversationListWidth");
LABEL_25:
        v30 = v25;

        goto LABEL_26;
      }
    }
    v34 = v23;
LABEL_24:
    objc_msgSend(v34, "minConversationListWidth");
    goto LABEL_25;
  }
  return a4;
}

- (void)_splitViewController:(id)a3 willBeginResizingColumn:(int64_t)a4
{
  void *v5;
  char isKindOfClass;
  id v7;

  -[CKMessagesController chatController](self, "chatController", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKMessagesController chatController](self, "chatController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chatControllerWillBeginResizing");

  }
}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
  BOOL v6;

  if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout", a3))
  {
    v6 = -[CKMessagesController isCollapsed](self, "isCollapsed");
    if (!a4 && !v6)
    {
      CKSetInboxVisibility(1);
      -[CKMessagesController dismissKeyboardIfVisible](self, "dismissKeyboardIfVisible");
    }
  }
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
  BOOL v6;

  if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout", a3))
  {
    v6 = -[CKMessagesController isCollapsed](self, "isCollapsed");
    if (!a4 && !v6)
      CKSetInboxVisibility(0);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CKMessagesController;
  -[CKMessagesController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (__CurrentTestName)
    objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_239_0, &__block_literal_global_240_0);
  if (!CKIsRunningInMacCatalyst())
    -[CKMessagesController updateColumnWidths](self, "updateColumnWidths");

}

void __75__CKMessagesController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PPTDidTransitionToSize"), 0);

}

uint64_t __63__CKMessagesController_dismissChatControllerIfVisibleAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAndDestroyComposition");
}

- (void)escButtonPressed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKMessagesController chatController](self, "chatController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController conversationListController](self, "conversationListController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissCatalystSearch");
  objc_msgSend(v6, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathsForSelectedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if (v9 < 2)
        v11 = CFSTR("YES");
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "esc button pressed. will pass onto chat controller: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  if (v9 >= 2)
    v12 = v6;
  else
    v12 = v5;
  objc_msgSend(v12, "escButtonPressed:", v4);

}

- (void)keyCommandOpenConversationInNewWindow:(id)a3
{
  id v4;

  -[CKMessagesController currentConversation](self, "currentConversation", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController showConversationInNewWindow:](self, "showConversationInNewWindow:", v4);

}

- (void)keyCommandNextConversation:(id)a3
{
  -[CKMessagesController _keyCommandChangeConversation:](self, "_keyCommandChangeConversation:", 1);
}

- (void)keyCommandPreviousConversation:(id)a3
{
  -[CKMessagesController _keyCommandChangeConversation:](self, "_keyCommandChangeConversation:", 0);
}

- (void)_keyCommandChangeConversation:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (!-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    -[CKMessagesController conversationListController](self, "conversationListController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectNextSequentialConversation:", v3);

  }
}

- (void)keyCommandSelectPinnedConversation:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    objc_msgSend(v7, "input");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    -[CKMessagesController conversationListController](self, "conversationListController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectPinnedConversationForItem:", v5);

  }
}

- (void)keyCommandSelectFirstActiveConversation
{
  id v3;

  if (!-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    -[CKMessagesController conversationListController](self, "conversationListController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "selectFirstActiveConversation");

  }
}

- (void)keyCommandDeleteConversation:(id)a3
{
  id v3;

  -[CKMessagesController conversationListController](self, "conversationListController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recoverableDeleteSelectedConversations");

}

- (void)keyCommandFind:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKMessagesController conversationListController](self, "conversationListController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v8 = v3;
    v5 = objc_msgSend(v3, "isEditing");
    v4 = v8;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(v8, "searchController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "searchBar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "becomeFirstResponder");

      v4 = v8;
    }
  }

}

- (void)keyCommandCompose:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMessagesController conversationListController](self, "conversationListController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "composeButtonClicked:", v4);

}

- (void)showDebugMenu
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[CKMessagesController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "showDebugMenu");

}

- (void)toggleSensitiveUI
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  char v8;

  v3 = IMGetDomainBoolForKey();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", CFSTR("End Messages?"), CFSTR("Messages needs to be restarted for sensitiveUI changes to take effect."), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__CKMessagesController_toggleSensitiveUI__block_invoke;
  v7[3] = &__block_descriptor_33_e23_v16__0__UIAlertAction_8l;
  v8 = v3;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", CFSTR("End Messages"), 2, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v5);

  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, &__block_literal_global_259_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v6);

  -[CKMessagesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, &__block_literal_global_260_1);
}

void __41__CKMessagesController_toggleSensitiveUI__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  IMSetDomainBoolForKey();
  exit(0);
}

- (BOOL)_isShowingFullscreenController
{
  void *v2;
  BOOL v3;

  -[CKMessagesController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_isShowingModalChatController
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  -[CKMessagesController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }

  return -[CKMessagesController _isShowingFullscreenController](self, "_isShowingFullscreenController") & isKindOfClass;
}

- (BOOL)_isShowingExpandedAppViewController
{
  void *v2;
  void *v3;
  char isKindOfClass;

  -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visibleViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSSet)alertSuppressionContexts
{
  __CFString *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  char isKindOfClass;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKMessagesController _isShowingModalChatController](self, "_isShowingModalChatController");
  v5 = -[CKMessagesController _isShowingFullscreenController](self, "_isShowingFullscreenController");
  v6 = -[CKMessagesController _isShowingExpandedAppViewController](self, "_isShowingExpandedAppViewController");
  -[CKMessagesController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (!v5 || v4 || v6 || (isKindOfClass & 1) != 0)
  {
    v10 = -[CKMessagesController isShowingConversationListController](self, "isShowingConversationListController");
    -[CKMessagesController presentedViewController](self, "presentedViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[CKMessagesController isEditing](self, "isEditing");
    if (v10 && !v11 && (v12 & 1) == 0)
    {
      -[CKMessagesController conversationListController](self, "conversationListController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKConversationList conversationListAlertSuppressionContextForFilterMode:](CKConversationList, "conversationListAlertSuppressionContextForFilterMode:", objc_msgSend(v13, "filterMode"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[__CFString addObject:](v3, "addObject:", v14);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v26 = 138412290;
          v27 = v3;
          _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Adding alert suppression contexts for conversation list: %@", (uint8_t *)&v26, 0xCu);
        }

      }
    }
    v16 = -[CKMessagesController isShowingChatController](self, "isShowingChatController");
    if ((v16 | -[CKMessagesController isComposingMessage](self, "isComposingMessage") | v6) == 1)
    {
      -[CKMessagesController currentConversation](self, "currentConversation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 == 0;

      -[CKMessagesController conversationList](self, "conversationList");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pendingConversation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        v21 = 0;
      else
        v21 = v18;
      if (!v21)
      {
        -[CKMessagesController currentConversation](self, "currentConversation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKAlertSuppressionContextHelper alertSuppressionContextsForVisibleChatControllerWithConversation:](CKAlertSuppressionContextHelper, "alertSuppressionContextsForVisibleChatControllerWithConversation:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        -[__CFString addObjectsFromArray:](v3, "addObjectsFromArray:", v23);
        goto LABEL_29;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Not adding alert suppression contexts for conversation: no conversation is currently presented for this scene", (uint8_t *)&v26, 2u);
        }
        goto LABEL_27;
      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Not adding alert suppression contexts for conversation: chat controller is not being shown for this scene", (uint8_t *)&v26, 2u);
      }
      goto LABEL_27;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v26 = 138412802;
      v27 = CFSTR("YES");
      v28 = 2112;
      v29 = CFSTR("NO");
      v30 = 2112;
      v31 = CFSTR("NO");
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Not adding suppression contexts: isShowingFullscreenController (%@), modalChatControllerIsVisible (%@), isShowingExpandedAppViewController (%@)", (uint8_t *)&v26, 0x20u);
    }
LABEL_27:

  }
LABEL_29:
  v24 = (void *)-[__CFString copy](v3, "copy");

  return (NSSet *)v24;
}

- (void)__updateAlertSuppressionContext
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CKMessagesController___updateAlertSuppressionContext__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __55__CKMessagesController___updateAlertSuppressionContext__block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "alertSuppressionContexts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = 138412290;
      v4 = v1;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Updating alert suppression contexts with SpringBoard: %@", (uint8_t *)&v3, 0xCu);
    }

  }
  SBSSetAlertSuppressionContexts();

}

- (void)setupBizNavBarForConversation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[CKMessagesController isCollapsed](self, "isCollapsed")
    && objc_msgSend(v8, "isBusinessConversation"))
  {
    -[CKMessagesController conversationListController](self, "conversationListController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enableBranding:forBusinessChat:", 1, v7);

  }
}

- (void)_conversationLeft:(id)a3
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
  char *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  id v30;
  const char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
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
        v36 = "-[CKMessagesController _conversationLeft:]";
        v37 = 2112;
        v38 = v9;
        v39 = 2112;
        v40 = v11;
        v12 = v11;

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v13 = objc_opt_class();
      objc_msgSend(v4, "object");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v13;
      v34 = objc_opt_class();
      v31 = "-[CKMessagesController _conversationLeft:]";
      _CKLog();

    }
    if (_CKShouldLog())
      _CKLogBacktrace();
  }
  objc_msgSend(v4, "object", v31, v33, v34);
  v15 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("CKConversationListWasPendingKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(34);
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v15;
      _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_DEBUG, "Conversation left: %@", buf, 0xCu);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v32 = v15;
    _CKLog();
  }
  -[CKMessagesController conversationList](self, "conversationList", v32);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "remergingConversations");

  if ((v21 & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Not acting on conversationLeft:, remerge in process", buf, 2u);
      }

    }
  }
  else if (v18)
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[CKMessagesController composeChatController](self, "composeChatController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "conversationLeft");

    }
  }
  else
  {
    -[CKMessagesController chatController](self, "chatController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "conversation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqual:", v15);

    if (v27)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v36 = "-[CKMessagesController _conversationLeft:]";
          _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "%s popping to conversation list", buf, 0xCu);
        }

      }
      -[CKMessagesController showConversationListWithAnimation:](self, "showConversationListWithAnimation:", 1);
      -[CKMessagesController chatController](self, "chatController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setDelegate:", 0);

      -[CKMessagesController setChatController:](self, "setChatController:", 0);
      -[CKMessagesController setCurrentConversation:](self, "setCurrentConversation:", 0);
      v30 = objc_alloc_init(MEMORY[0x1E0DAAD88]);
      objc_msgSend(v30, "deleteSnapshotsForApplicationIdentifier:", CFSTR("com.apple.MobileSMS"));
      objc_msgSend(v30, "invalidate");

    }
  }

}

- (void)_conversationListFinishedMerging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKMessagesController currentConversation](self, "currentConversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController conversationList](self, "conversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationForExistingChatWithGUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v5 != v9)
    {
      -[CKMessagesController setCurrentConversation:](self, "setCurrentConversation:", v9);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = 138412546;
          v12 = v9;
          v13 = 2112;
          v14 = v5;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Conversation list performed re-merge, updating current conversation to %@ from %@", (uint8_t *)&v11, 0x16u);
        }
LABEL_11:

      }
    }
  }
  else if (v5 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "CKMessagesController attempted to replace conversation after re-merge, but couldn't find a new conversation to replace %@", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_11;
  }

}

- (void)_chatRegistryDidLoad:(id)a3
{
  void *v4;

  +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pruneCache");

  -[CKMessagesController _setIsShowingNoSelectionUI:](self, "_setIsShowingNoSelectionUI:", -[CKMessagesController _hasCurrentConversations](self, "_hasCurrentConversations") ^ 1);
}

- (void)applicationWillResume:(id)a3
{
  id v4;

  if (CKIsRunningInMacCatalyst())
  {
    -[CKMessagesController chatController](self, "chatController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_markAsReadIfNecessary");

  }
}

- (void)_appStateDidResumeFromInactive:(id)a3
{
  id v3;

  -[CKMessagesController presentFocusStatusAuthorizationAlertIfNecessary](self, "presentFocusStatusAuthorizationAlertIfNecessary", a3);
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateFocusStateForCurrentFocusFilterActionAsync");

}

- (id)nonConversationListControllersInNavigationStack
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[CKMessagesController inboxViewController](self, "inboxViewController");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v10 == (void *)v11)
        {

        }
        else
        {
          v12 = (void *)v11;
          -[CKMessagesController conversationListControllerIfInitialized](self, "conversationListControllerIfInitialized");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 != v13)
            objc_msgSend(v3, "addObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)showInboxViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = a3;
  if (-[CKMessagesController _shouldShowInboxView](self, "_shouldShowInboxView"))
  {
    -[CKMessagesController updateInboxAndConversationList](self, "updateInboxAndConversationList");
    if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
    {
      -[CKMessagesController showColumn:](self, "showColumn:", 0);
LABEL_10:
      -[CKMessagesController dismissKeyboardIfVisible](self, "dismissKeyboardIfVisible");
      return;
    }
    -[CKMessagesController inboxViewController](self, "inboxViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController inboxViewController](self, "inboxViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)objc_msgSend(v7, "popToViewController:animated:", v8, v3);

      goto LABEL_10;
    }
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CKMessagesController showInboxViewControllerAnimated:].cold.1(self, v10);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Attempted to pop the inbox view when the inbox view should not be available. No change to conversationListNavigationController", v11, 2u);
    }

  }
}

- (void)changeFilterMode:(unint64_t)a3
{
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
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  -[CKMessagesController conversationList](self, "conversationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "releaseWasKnownSenderHold");

  -[CKMessagesController conversationList](self, "conversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateConversationsWasKnownSender");

  -[CKMessagesController conversationList](self, "conversationList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearHoldInUnreadFilter");

  -[CKMessagesController conversationListController](self, "conversationListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilterMode:", a3);

  -[CKMessagesController conversationListController](self, "conversationListController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentScrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__ck_scrollToTop:", 0);

  -[CKMessagesController conversationListController](self, "conversationListController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateConversationList");

  if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
  {
    if (!CKIsRunningInMacCatalyst())
      -[CKMessagesController hideColumn:](self, "hideColumn:", 0);
    -[CKMessagesController showColumn:](self, "showColumn:", 1);
  }
  else
  {
    -[CKMessagesController inboxViewController](self, "inboxViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController conversationListController](self, "conversationListController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pushViewController:animated:", v14, 1);

  }
  v15 = objc_msgSend(MEMORY[0x1E0D399F8], "conversationFilterModeForMessageFilter:", a3);
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0D385A8];
  v21[0] = CFSTR("ChoseFilter");
  v20[0] = CFSTR("actionType");
  v20[1] = CFSTR("filterType");
  CKConversationListFilterModeStringValue(v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = CFSTR("fromView");
  v21[1] = v18;
  v21[2] = CFSTR("InboxView");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "trackEvent:withDictionary:", v17, v19);

}

- (id)inboxItemForFilterMode:(unint64_t)a3 title:(id)a4 andSystemImage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", v9, &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessagesController inboxItemForFilterMode:localizedTitle:andSystemImage:](self, "inboxItemForFilterMode:localizedTitle:andSystemImage:", a3, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)inboxItemForFilterMode:(unint64_t)a3 localizedTitle:(id)a4 andSystemImage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[6];

  v8 = a5;
  v9 = a4;
  -[CKMessagesController _unreadCountStringForFilterMode:](self, "_unreadCountStringForFilterMode:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D4D8C8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__CKMessagesController_inboxItemForFilterMode_localizedTitle_andSystemImage___block_invoke;
  v15[3] = &unk_1E274C9C0;
  v15[4] = self;
  v15[5] = a3;
  v13 = (void *)objc_msgSend(v11, "initWithTitle:subtitle:systemImage:accessoryText:filterMode:action:", v9, 0, v8, v10, v12, v15);

  return v13;
}

uint64_t __77__CKMessagesController_inboxItemForFilterMode_localizedTitle_andSystemImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeFilterMode:", *(_QWORD *)(a1 + 40));
}

- (id)newInboxModel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id obj;
  CKMessagesController *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _QWORD v59[5];

  v59[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKMessagesController inboxItemForFilterMode:title:andSystemImage:](self, "inboxItemForFilterMode:title:andSystemImage:", 1, CFSTR("ALL_MESSAGES"), CFSTR("message.and.message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);
  v53 = self;
  if (-[CKMessagesController _isMessageFilteringEnabled](self, "_isMessageFilteringEnabled"))
  {
    -[CKMessagesController inboxItemForFilterMode:title:andSystemImage:](self, "inboxItemForFilterMode:title:andSystemImage:", 2, CFSTR("KNOWN_SENDERS"), CFSTR("person.crop.circle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v5;
    -[CKMessagesController inboxItemForFilterMode:title:andSystemImage:](v53, "inboxItemForFilterMode:title:andSystemImage:", 3, CFSTR("UNKNOWN_SENDERS"), CFSTR("person.crop.circle.badge.questionmark"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v6;
    -[CKMessagesController inboxItemForFilterMode:title:andSystemImage:](v53, "inboxItemForFilterMode:title:andSystemImage:", 8, CFSTR("UNREAD_MESSAGES"), CFSTR("message.badge"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v8);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D4D8D8]);
  v11 = (void *)objc_msgSend(v3, "copy");
  v12 = (void *)objc_msgSend(v10, "initWithHeader:footer:items:", 0, 0, v11);

  objc_msgSend(v9, "addObject:", v12);
  MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("spamFiltrationExtensionName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    v48 = v12;
    v49 = v9;
    v50 = v4;
    v51 = v3;
    v14 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("FILTERED_BY_APP_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v13;
    objc_msgSend(v14, "stringWithFormat:", v16, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "userInterfaceLayoutDirection");

    if (v19 == 1)
      v20 = CFSTR("\u200F");
    else
      v20 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v20, "stringByAppendingString:", v17);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = CKIsBlackholeEnabled();
    CKFrameworkBundle();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
      v24 = CFSTR("JUNK_BLACKHOLE_SENDER_TITLE");
    else
      v24 = CFSTR("JUNK_SENDER_TITLE");
    objc_msgSend(v22, "localizedStringForKey:value:table:", v24, &stru_1E276D870, CFSTR("ChatKit"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "init");
    v26 = (void *)objc_msgSend(v25, "alloc");

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterExtensionParams");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v55 != v29)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          v32 = objc_msgSend(v31, "filterMode");
          IMSharedUtilitiesFrameworkBundle();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "folderName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "localizedStringForKey:value:table:", v34, &stru_1E276D870, CFSTR("IMSharedUtilities"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "iconName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKMessagesController inboxItemForFilterMode:title:andSystemImage:](v53, "inboxItemForFilterMode:title:andSystemImage:", v32, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v37);

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      }
      while (v28);
    }

    -[CKMessagesController inboxItemForFilterMode:title:andSystemImage:](v53, "inboxItemForFilterMode:title:andSystemImage:", 6, v45, CFSTR("xmark.bin"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v38);

    v39 = objc_alloc(MEMORY[0x1E0D4D8D8]);
    v40 = (void *)objc_msgSend(v26, "copy");
    v41 = (void *)objc_msgSend(v39, "initWithHeader:footer:items:", v46, 0, v40);

    v9 = v49;
    objc_msgSend(v49, "addObject:", v41);

    v4 = v50;
    v3 = v51;
    v13 = v47;
    v12 = v48;
  }
  if (CKIsBlackholeEnabled())
    v42 = &__block_literal_global_325_1;
  else
    v42 = 0;
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D8D0]), "initWithSections:footerAction:", v9, v42);
  objc_msgSend(v43, "setIsCollapsed:", -[CKMessagesController isCollapsed](v53, "isCollapsed"));
  objc_msgSend(v43, "setLogInboxViewedMetric:", &__block_literal_global_334_2);

  return v43;
}

void __37__CKMessagesController_newInboxModel__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("prefs:root=MESSAGES&path=JUNK_CONVERSATIONS_BUTTON"));
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "openSensitiveURL:withOptions:", v2, 0);

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "trackEvent:withDictionary:", *MEMORY[0x1E0D385A8], &unk_1E2871E20);

}

void __37__CKMessagesController_newInboxModel__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "trackEvent:withDictionary:", *MEMORY[0x1E0D385A8], &unk_1E2871E48);

}

- (id)_unreadCountStringForFilterMode:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;

  -[CKMessagesController conversationList](self, "conversationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unreadCountForFilterMode:", a3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "__ck_localizedString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E276D870;
  }

  return v8;
}

- (void)persistColumnWidths:(id)a3
{
  double v4;

  if (CKIsRunningInMacCatalyst())
  {
    -[CKMessagesController primaryColumnWidth](self, "primaryColumnWidth");
    -[CKMessagesController _sanitizeProposedConversationListWidth:](self, "_sanitizeProposedConversationListWidth:");
    CKSetConversationListPersistedWidth(v4);
  }
}

- (double)_macConvertLegacySidebarWidthToModernWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultConversationListWidth");
  v6 = v5;

  if (!CKIsRunningInMacCatalyst())
    return v6;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "legacyMacAppSnapToMinConversationListWidth");
  v9 = v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 > a3)
  {
    objc_msgSend(v10, "minConversationListWidth");
LABEL_10:
    v6 = v12;
    goto LABEL_11;
  }
  objc_msgSend(v10, "legacyMacAppSnapToMinConversationListWidth");
  v14 = v13;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "snapToMinConversationListWidth");
  v6 = v15;
  if (v14 != a3)
  {
    if (v15 >= a3)
    {

    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "maxConversationListWidth");
      v18 = v17;

      if (v18 > a3)
        return a3;
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maxConversationListWidth");
    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

- (void)conversationListControllerWillPresentSearchResultsController
{
  id v3;

  if (CKIsRunningInMacCatalyst())
  {
    -[CKMessagesController persistColumnWidths:](self, "persistColumnWidths:", self);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultConversationListWidth");
    -[CKMessagesController setMinimumPrimaryColumnWidth:](self, "setMinimumPrimaryColumnWidth:");

  }
}

- (void)conversationListControllerWillDismissSearchResultsController
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[CKMessagesController conversationListController](self, "conversationListController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSearchActive");

  if (!v4)
    goto LABEL_8;
  -[CKMessagesController chatController](self, "chatController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKMessagesController chatController](self, "chatController");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = (void *)v6;
    goto LABEL_7;
  }
  -[CKMessagesController composeChatController](self, "composeChatController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v7, "restoreInputAfterSearchPresentation");

LABEL_8:
  if (CKIsRunningInMacCatalyst())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minConversationListWidth");
    -[CKMessagesController setMinimumPrimaryColumnWidth:](self, "setMinimumPrimaryColumnWidth:");

    -[CKMessagesController updateColumnWidths](self, "updateColumnWidths");
  }
}

- (void)conversationListUpdatedSelectedIndexPathCount:(int64_t)a3
{
  id v5;

  -[CKMessagesController conversationListController](self, "conversationListController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 1
    && !-[CKMessagesController hasRecentlyDeletedFilterSelected](self, "hasRecentlyDeletedFilterSelected")
    && CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v5, "_performMultiSelectCleanUp");
  }
  else
  {
    -[CKMessagesController _updateSelectionViewWithCount:](self, "_updateSelectionViewWithCount:", a3);
  }

}

- (void)_updateSelectionViewWithCount:(int64_t)a3
{
  id v3;

  -[CKMessagesController selectionViewController](self, "selectionViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setNeedsUpdateContentUnavailableConfiguration");

}

- (id)_recentlyDeletedDisclosureText
{
  void *v2;
  void *v3;

  -[CKMessagesController conversationListController](self, "conversationListController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_recentlyDeletedDisclosureLabelText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)conversationListDidBeginMultipleSelectionWithInitialSelectedCount:(int64_t)a3
{
  -[CKMessagesController _populateChatNavigationControllerWithSelection](self, "_populateChatNavigationControllerWithSelection");
  -[CKMessagesController _updateSelectionViewWithCount:](self, "_updateSelectionViewWithCount:", a3);
}

- (id)currentlyShownConversation
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  void *v15;
  _QWORD v17[5];
  _BYTE buf[24];
  uint64_t (*v19)(uint64_t, uint64_t);
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[CKMessagesController junkModalMessagesController](self, "junkModalMessagesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v6 = -[CKMessagesController isCollapsed](self, "isCollapsed");
    if (v6)
    {
      if (-[CKMessagesController isTopVCChatNavigationController](self, "isTopVCChatNavigationController"))
      {
        -[CKMessagesController chatController](self, "chatController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "conversation");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v8 = 0;
    }
    else
    {
      if (-[CKMessagesController isShowingSelectionView](self, "isShowingSelectionView"))
      {
        v8 = 0;
LABEL_19:
        v5 = 0;
        goto LABEL_20;
      }
      -[CKMessagesController chatNavigationController](self, "chatNavigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v19 = __Block_byref_object_copy__81;
      *(_QWORD *)&v20 = __Block_byref_object_dispose__81;
      *((_QWORD *)&v20 + 1) = 0;
      objc_msgSend(v8, "viewControllers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __50__CKMessagesController_currentlyShownConversation__block_invoke;
      v17[3] = &unk_1E275A6C8;
      v17[4] = buf;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);

      v9 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      if (v9)
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "conversation");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      _Block_object_dispose(buf, 8);

      if (v9)
        goto LABEL_20;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[CKMessagesController viewControllers](self, "viewControllers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          v12 = CFSTR("YES");
        else
          v12 = CFSTR("NO");
        objc_msgSend(v8, "viewControllers");
        v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "viewControllers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2112;
        v19 = v13;
        LOWORD(v20) = 2112;
        *(_QWORD *)((char *)&v20 + 2) = v15;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "CKMessagesController warning: Was not able to determine the currently shown conversation in the current viewControllers configuration: %@, isCollapsed: %@, chatNavigation.viewControllers: %@, conversationNavigation.viewControllers: %@", buf, 0x2Au);

      }
    }
    goto LABEL_19;
  }
  objc_msgSend(v3, "currentlyShownConversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

  return v5;
}

void __50__CKMessagesController_currentlyShownConversation__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)catalystFiltersNavigationBackButtonTapped:(id)a3
{
  -[CKMessagesController catalystFilterModeSelected:](self, "catalystFilterModeSelected:", 1);
}

- (void)_conversationFilteringStateChangedNotification:(id)a3
{
  void *v4;
  void *v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setupNavBarAppearanceWithNavigationController:", v5);

  -[CKMessagesController updateInboxAndConversationList](self, "updateInboxAndConversationList");
}

- (void)screenTimeOKPressedForChatController:(id)a3
{
  void *v4;

  -[CKMessagesController setCurrentConversation:](self, "setCurrentConversation:", 0);
  -[CKMessagesController conversationListController](self, "conversationListController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateConversationSelection");

  -[CKMessagesController showConversationListWithAnimation:](self, "showConversationListWithAnimation:", 1);
}

- (void)conversationListFailedToSelectShownConversation
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  __int16 v7;

  if (-[CKMessagesController _isCollapsed](self, "_isCollapsed"))
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    v7 = 0;
    v4 = "Failed to select shown conversation called but shouldn't be showing conversaiton list + chat controller at the same time.";
    v5 = (uint8_t *)&v7;
    goto LABEL_9;
  }
  if (!-[CKMessagesController _isSendingNewComposeMessage](self, "_isSendingNewComposeMessage"))
  {
    -[CKMessagesController updateForNoConversationSelected](self, "updateForNoConversationSelected");
    return;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
LABEL_10:

      return;
    }
    v6 = 0;
    v4 = "Maintaining current conversation selection during New Compose transition.";
    v5 = (uint8_t *)&v6;
LABEL_9:
    _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
    goto LABEL_10;
  }
}

- (BOOL)_isSendingNewComposeMessage
{
  void *v2;
  char v3;

  -[CKMessagesController composeChatController](self, "composeChatController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSendingMessage");

  return v3;
}

- (void)chatController:(id)a3 didDetachDetailsNavigationController:(id)a4
{
  void *v5;

  -[CKMessagesController setDetailsNavigationController:](self, "setDetailsNavigationController:", a4);
  -[CKMessagesController detailsNavigationController](self, "detailsNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsDetached:", 1);

  -[CKMessagesController tearDownCKDismissOnInteractionView](self, "tearDownCKDismissOnInteractionView");
}

- (BOOL)hasDetailsNavigationController
{
  void *v2;
  BOOL v3;

  -[CKMessagesController detailsNavigationController](self, "detailsNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldUseMinimumSafeAreas
{
  void *v2;
  char v3;

  -[CKMessagesController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_usesMinimumSafeAreas");

  return v3;
}

- (BOOL)isDetailsNavigationControllerDetached
{
  void *v2;
  char v3;

  -[CKMessagesController detailsNavigationController](self, "detailsNavigationController");
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
  -[CKMessagesController detailsNavigationController](self, "detailsNavigationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[CKMessagesController setDetailsNavigationController:](self, "setDetailsNavigationController:", v6);
    v5 = v6;
  }

}

- (void)presentDetailsViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;
  id v7;

  v3 = a3;
  -[CKMessagesController chatController](self, "chatController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKMessagesController chatController](self, "chatController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentDetailsViewControllerAnimated:", v3);

  }
}

- (void)dismissDetailsControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;
  id v7;

  v3 = a3;
  -[CKMessagesController chatController](self, "chatController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKMessagesController chatController](self, "chatController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissDetailsControllerAnimated:", v3);

  }
}

- (void)dismissDetailsNavigationController
{
  void *v3;

  -[CKMessagesController detailsNavigationController](self, "detailsNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[CKMessagesController setDetailsNavigationController:](self, "setDetailsNavigationController:", 0);
  -[CKMessagesController tearDownCKDismissOnInteractionView](self, "tearDownCKDismissOnInteractionView");
}

- (void)dismissDetailsViewAndShowConversationList
{
  void *v3;
  _QWORD v4[5];

  -[CKMessagesController detailsNavigationController](self, "detailsNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__CKMessagesController_dismissDetailsViewAndShowConversationList__block_invoke;
  v4[3] = &unk_1E274A208;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

uint64_t __65__CKMessagesController_dismissDetailsViewAndShowConversationList__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDetailsNavigationController:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "showConversationListWithAnimation:", 1);
}

- (void)showConversationList
{
  -[CKMessagesController showConversationListWithAnimation:](self, "showConversationListWithAnimation:", 1);
}

- (void)dismissAndReopenDetailsNavigationController
{
  void *v3;
  _QWORD v4[5];

  -[CKMessagesController detailsNavigationController](self, "detailsNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__CKMessagesController_dismissAndReopenDetailsNavigationController__block_invoke;
  v4[3] = &unk_1E274A208;
  v4[4] = self;
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, v4);

}

void __67__CKMessagesController_dismissAndReopenDetailsNavigationController__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setDetailsNavigationController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "chatController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentDetailsViewController");

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
  -[CKMessagesController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[CKInteractionNotificationView initWithFrame:](v3, "initWithFrame:");
  -[CKMessagesController setDismissOnInteractionView:](self, "setDismissOnInteractionView:", v5);

  -[CKMessagesController dismissOnInteractionView](self, "dismissOnInteractionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[CKMessagesController dismissOnInteractionView](self, "dismissOnInteractionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  -[CKMessagesController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController dismissOnInteractionView](self, "dismissOnInteractionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

}

- (void)tearDownCKDismissOnInteractionView
{
  void *v3;

  -[CKMessagesController dismissOnInteractionView](self, "dismissOnInteractionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKMessagesController setDismissOnInteractionView:](self, "setDismissOnInteractionView:", 0);
}

- (void)showNewMessageCompositionPanel
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:animated:](self, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 animated:(BOOL)a5
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:](self, "showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:", a3, a4, 0, 0, a5, 0, 0, 0, 0);
}

- (void)showNewMessageCompositionPanelAppendingToExistingDraft:(id)a3 animated:(BOOL)a4
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:](self, "showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:", 0, a3, 1, 0, a4, 0, 0, 0, 0);
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:](self, "showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:", a3, a4, 1, a5, a6, 0, 0, 0, 0);
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6 sendMessageHandler:(id)a7
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:](self, "showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:", a3, a4, 1, a5, a6, 0, 0, 0, a7);
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 animated:(BOOL)a5 bizIntent:(id)a6 launchPluginWithBundleID:(id)a7 pluginLaunchPayload:(id)a8
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:](self, "showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:", a3, a4, 0, 0, a5, a6, a7, a8, 0);
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6 bizIntent:(id)a7 launchPluginWithBundleID:(id)a8 pluginLaunchPayload:(id)a9 sendMessageHandler:(id)a10
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:](self, "showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:sendMessageHandler:", a3, a4, 0, a5, a6, a7, a8, a9, a10);
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 appendToExistingDraft:(BOOL)a5 suggestedReplies:(id)a6 animated:(BOOL)a7 bizIntent:(id)a8 launchPluginWithBundleID:(id)a9 pluginLaunchPayload:(id)a10 sendMessageHandler:(id)a11
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:simID:sendMessageHandler:](self, "showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:simID:sendMessageHandler:", a3, a4, a5, a6, a7, a8, a9, a10, 0, a11);
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 suggestedReplies:(id)a5 animated:(BOOL)a6 bizIntent:(id)a7 launchPluginWithBundleID:(id)a8 pluginLaunchPayload:(id)a9 simID:(id)a10 sendMessageHandler:(id)a11
{
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:simID:sendMessageHandler:](self, "showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:simID:sendMessageHandler:", a3, a4, 0, a5, a6, a7, a8, a9, a10, a11);
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 appendToExistingDraft:(BOOL)a5 suggestedReplies:(id)a6 animated:(BOOL)a7 bizIntent:(id)a8 launchPluginWithBundleID:(id)a9 pluginLaunchPayload:(id)a10 simID:(id)a11 sendMessageHandler:(id)a12
{
  uint64_t v12;

  LOBYTE(v12) = 0;
  -[CKMessagesController showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:startAudioRecording:simID:sendMessageHandler:](self, "showNewMessageCompositionPanelWithRecipients:composition:appendToExistingDraft:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:startAudioRecording:simID:sendMessageHandler:", a3, a4, a5, a6, a7, a8, a9, a10, v12, a11, a12);
}

- (void)showNewMessageCompositionPanelWithRecipients:(id)a3 composition:(id)a4 appendToExistingDraft:(BOOL)a5 suggestedReplies:(id)a6 animated:(BOOL)a7 bizIntent:(id)a8 launchPluginWithBundleID:(id)a9 pluginLaunchPayload:(id)a10 startAudioRecording:(BOOL)a11 simID:(id)a12 sendMessageHandler:(id)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  _BOOL4 v32;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v32 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v35 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a12;
  v23 = a13;
  kdebug_trace();
  if (-[CKMessagesController shouldShowMakoIMessageAlert](self, "shouldShowMakoIMessageAlert"))
  {
    -[CKMessagesController showMakoIMessageAlert](self, "showMakoIMessageAlert");
  }
  else if ((objc_msgSend(MEMORY[0x1E0D35918], "smsEnabled") & 1) != 0 || CKiMessageSupported())
  {
    v34 = v17;
    if (v17 && v18)
    {
      v24 = v18;
    }
    else
    {
      +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v34)
      {
        objc_msgSend(v25, "draftForPendingConversationWithRecipients:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = 0;
        objc_msgSend(v25, "draftForPendingConversationWithRecipients:", &v36);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v36;
      }

      if (v32 && v27)
      {
        objc_msgSend(v27, "compositionByAppendingComposition:", v18);
        v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v18)
          v29 = v18;
        else
          v29 = v27;
        v28 = v29;
      }
      v24 = v28;

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v17;
        _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Showing new compose with recipients %@", buf, 0xCu);
      }

    }
    LOBYTE(v31) = a7;
    -[CKMessagesController _showNewComposeWithRecipients:composition:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:startAudioRecording:animated:simID:sendMessageHandler:](self, "_showNewComposeWithRecipients:composition:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:startAudioRecording:animated:simID:sendMessageHandler:", v34, v24, v19, v20, v21, a11, v31, v22, v23);

  }
}

- (void)_showNewComposeWithRecipients:(id)a3 composition:(id)a4 bizIntent:(id)a5 launchPluginWithBundleID:(id)a6 pluginLaunchPayload:(id)a7 animated:(BOOL)a8 sendMessageHandler:(id)a9
{
  -[CKMessagesController _showNewComposeWithRecipients:composition:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:animated:simID:sendMessageHandler:](self, "_showNewComposeWithRecipients:composition:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:animated:simID:sendMessageHandler:", a3, a4, a5, a6, a7, a8, 0, a9);
}

- (void)_showNewComposeWithRecipients:(id)a3 composition:(id)a4 bizIntent:(id)a5 launchPluginWithBundleID:(id)a6 pluginLaunchPayload:(id)a7 animated:(BOOL)a8 simID:(id)a9 sendMessageHandler:(id)a10
{
  uint64_t v10;

  LOBYTE(v10) = a8;
  -[CKMessagesController _showNewComposeWithRecipients:composition:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:startAudioRecording:animated:simID:sendMessageHandler:](self, "_showNewComposeWithRecipients:composition:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:startAudioRecording:animated:simID:sendMessageHandler:", a3, a4, a5, a6, a7, 0, v10, a9, a10);
}

- (void)_showNewComposeWithRecipients:(id)a3 composition:(id)a4 bizIntent:(id)a5 launchPluginWithBundleID:(id)a6 pluginLaunchPayload:(id)a7 startAudioRecording:(BOOL)a8 animated:(BOOL)a9 simID:(id)a10 sendMessageHandler:(id)a11
{
  _BOOL4 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  __objc2_class **v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  CKNavigationController *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  void *v69;
  _QWORD v70[2];

  v11 = a8;
  v70[1] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v68 = a7;
  v21 = a10;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc((Class)objc_msgSend(v22, "composeChatControllerClass"));
  v24 = v23;
  v66 = v17;
  v62 = v21;
  if (v19)
  {
    v25 = (void *)objc_msgSend(v23, "initWithRecipientAddresses:composition:bizIntent:simID:", v17, v18, v19, v21);
  }
  else
  {
    objc_msgSend(v18, "bizIntent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "initWithRecipientAddresses:composition:bizIntent:simID:", v17, v18, v26, v21);

  }
  objc_msgSend(v25, "setSendMenuDelegate:", self);
  v27 = -[CKMessagesController isComposingMessage](self, "isComposingMessage");
  v28 = off_1E2733000;
  if (v27)
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKMessagesController composeChatController](self, "composeChatController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "proposedRecipients");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "composeRecipientHandles");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "proposedRecipients");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "composeRecipientHandles");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v33, "equivalentToRecipients:", v35) & 1) == 0)
        -[CKMessagesController cancelAndDestroyComposition](self, "cancelAndDestroyComposition");

      v28 = off_1E2733000;
    }
  }
  objc_msgSend(v25, "conversation");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController setCurrentConversation:](self, "setCurrentConversation:", v36);
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setPendingConversation:", v36);

  +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "dismissViewControllerAnimated:completion:", 1, 0);

  -[__objc2_class sharedBehaviors](v28[421], "sharedBehaviors");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "shouldDismissSideMountedPanel");

  if (v40)
  {
    -[CKMessagesController chatController](self, "chatController");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v41, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  if (v27)
  {
    -[CKMessagesController setComposeChatNavigationController:](self, "setComposeChatNavigationController:", 0);
    -[CKMessagesController modalViewController](self, "modalViewController");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
      -[CKMessagesController dismissModalViewControllerWithTransition:](self, "dismissModalViewControllerWithTransition:", 9);
  }
  v43 = -[CKMessagesController isCollapsed](self, "isCollapsed");
  objc_msgSend(v25, "setDelegate:", self);
  -[CKMessagesController setComposeChatController:](self, "setComposeChatController:", v25);
  if (v20)
    objc_msgSend(v25, "setupStateForLaunchPluginWithBundleID:pluginPayload:", v20, v68);
  if (v11)
    objc_msgSend(v25, "setupStateForLaunchAudio");
  v64 = v19;
  if (v43)
  {
    -[CKMessagesController showConversationListWithAnimation:](self, "showConversationListWithAnimation:", 0, v20, v62, v19, v66);
    v44 = -[CKNavigationController initWithNavigationBarClass:toolbarClass:]([CKNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
    v70[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNavigationController setViewControllers:](v44, "setViewControllers:", v45);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "useMacToolbar");

    v48 = v18;
    if (v47)
    {
      -[CKMessagesController dismissDetailsNavigationController](self, "dismissDetailsNavigationController");
      -[CKNavigationController setNavigationBarHidden:](v44, "setNavigationBarHidden:", 1);
    }
    else
    {
      -[CKNavigationController navigationBar](v44, "navigationBar");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "theme");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setBarStyle:", objc_msgSend(v53, "navBarStyle"));

    }
    -[CKMessagesController setComposeChatNavigationController:](self, "setComposeChatNavigationController:", v44);
    -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v54, a9, &__block_literal_global_346_0);

  }
  else
  {
    v48 = v18;
    -[CKMessagesController chatNavigationController](self, "chatNavigationController", v20, v62, v64, v66);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setViewControllers:", v50);

    if (!CKIsRunningInMacCatalyst()
      && -[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
    {
      -[CKMessagesController hideColumn:](self, "hideColumn:", 0);
    }
  }
  -[CKMessagesController chatController](self, "chatController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setDelegate:", 0);

  -[CKMessagesController setChatController:](self, "setChatController:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "useMacToolbar");

  if (v57)
  {
    if (objc_msgSend(v25, "conformsToProtocol:", &unk_1EE1607D8))
    {
      -[CKMessagesController macToolbarController](self, "macToolbarController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "configureWithToolbarController:", v58);

    }
    -[CKMessagesController dismissDetailsNavigationController](self, "dismissDetailsNavigationController");
  }
  -[CKMessagesController conversationListController](self, "conversationListController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "updateConversationList");

  -[CKMessagesController _updateAlertSuppressionContext](self, "_updateAlertSuppressionContext");
  -[CKMessagesController messagesControllerDelegate](self, "messagesControllerDelegate");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "didShowNewComposeInMessagesController:", self);

}

void __175__CKMessagesController__showNewComposeWithRecipients_composition_bizIntent_launchPluginWithBundleID_pluginLaunchPayload_startAudioRecording_animated_simID_sendMessageHandler___block_invoke()
{
  id v0;

  if (objc_msgSend((id)__CurrentTestName, "rangeOfString:", CFSTR("ShowNewCompose")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("PPTDidShowNewComposeEvent"), 0, 0);

  }
}

- (void)cancelNewMessageCompositionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD v5[5];

  v3 = a3;
  if (-[CKMessagesController isComposingMessage](self, "isComposingMessage"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__CKMessagesController_cancelNewMessageCompositionAnimated___block_invoke;
    v5[3] = &unk_1E274A208;
    v5[4] = self;
    -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, v5);
  }
}

uint64_t __60__CKMessagesController_cancelNewMessageCompositionAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAndDestroyComposition");
}

- (BOOL)composeChatControllerCanEditRecipients
{
  return 1;
}

- (void)composeChatControllerDidCancelComposition:(id)a3
{
  id v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  CKMessagesController *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  CKMessagesController *v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __66__CKMessagesController_composeChatControllerDidCancelComposition___block_invoke;
    v29 = &unk_1E274A208;
    v30 = self;
    v5 = &v26;
LABEL_7:
    -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_13;
  }
  -[CKMessagesController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  -[CKMessagesController currentConversation](self, "currentConversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController conversationList](self, "conversationList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pendingConversation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v11)
    -[CKMessagesController setCurrentConversation:](self, "setCurrentConversation:", 0);
  -[CKMessagesController conversationList](self, "conversationList");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unpendConversation");

  +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController conversationList](self, "conversationList");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pendingConversation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unsentComposition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clearDraftForComposition:", v16);

  if (v8)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __66__CKMessagesController_composeChatControllerDidCancelComposition___block_invoke_2;
    v24 = &unk_1E274A208;
    v25 = self;
    v5 = &v21;
    goto LABEL_7;
  }
  if (-[CKMessagesController hasRecentlyDeletedFilterSelected](self, "hasRecentlyDeletedFilterSelected")
    || (+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v17, "conversations"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "count"),
        v18,
        v17,
        !v19))
  {
    -[CKMessagesController _setIsShowingNoSelectionUI:](self, "_setIsShowingNoSelectionUI:", 1);
    -[CKMessagesController conversationListController](self, "conversationListController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "removePendingConversationCell");
  }
  else
  {
    -[CKMessagesController conversationListController](self, "conversationListController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "selectDefaultConversationAnimated:removingPendingConversationCell:", 1, 1);
  }

LABEL_13:
}

void __66__CKMessagesController_composeChatControllerDidCancelComposition___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cancelAndDestroyComposition");
  objc_msgSend(*(id *)(a1 + 32), "chatController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endHoldingScrollGeometryUpdatesForReason:", CFSTR("TransitionFromForwarding"));

}

uint64_t __66__CKMessagesController_composeChatControllerDidCancelComposition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAndDestroyComposition");
}

- (void)cancelAndDestroyComposition
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDelegate:", 0);

  }
  if (-[CKMessagesController isComposingMessage](self, "isComposingMessage"))
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKMessagesController composeChatController](self, "composeChatController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cancelCompose");

    }
  }
  -[CKMessagesController setComposeChatController:](self, "setComposeChatController:", 0);
  +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController composeChatController](self, "composeChatController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unsentComposition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearDraftForComposition:", v10);

  -[CKMessagesController conversationList](self, "conversationList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unpendConversation");

  -[CKMessagesController setComposeChatNavigationController:](self, "setComposeChatNavigationController:", 0);
}

- (void)composeChatController:(id)a3 didSelectNewConversation:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[CKMessagesController conversationList](self, "conversationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPendingConversation:", v6);

  if (!-[CKMessagesController isDetailsNavigationControllerDetached](self, "isDetailsNavigationControllerDetached"))
    -[CKMessagesController dismissDetailsNavigationController](self, "dismissDetailsNavigationController");
  -[CKMessagesController setCurrentConversation:](self, "setCurrentConversation:", v6);
  -[CKMessagesController _updateAlertSuppressionContext](self, "_updateAlertSuppressionContext");

}

- (BOOL)hasBusinessRecipientWithRecipientIDs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((MEMORY[0x193FF3AEC](*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_checkPushToTranscriptTimingWithStartTime:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("PushToTranscriptTailspinLogging"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "BOOLValue"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("PushToTranscriptTailspinLoggingInterval"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "floatValue");
      v10 = v9;
    }
    else
    {
      v10 = 1.0;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v12 = v11;
    if (v11 - a3 > v10)
    {
      dispatch_get_global_queue(2, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __66__CKMessagesController__checkPushToTranscriptTimingWithStartTime___block_invoke;
      v19[3] = &unk_1E274C9C0;
      *(double *)&v19[5] = v12;
      v19[4] = self;
      dispatch_async(v13, v19);

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Dumping tailspin log (this may take up to a minute)..."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Push to transcript took too long"), v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v17, 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addAction:", v18);

      objc_msgSend(v15, "presentFromViewController:animated:completion:", self, 1, 0);
    }

  }
}

void __66__CKMessagesController__checkPushToTranscriptTimingWithStartTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/Messages/PushToTranscriptTailspin%f.tailspin"), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "createFileAtPath:contents:attributes:", v2, 0, 0);

  v5 = 0;
  if (!v4)
    goto LABEL_24;
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingAtPath:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_25;
  if (__tailspin_dump_output_sync_once != -1)
    dispatch_once(&__tailspin_dump_output_sync_once, &__block_literal_global_1214);
  if (__tailspin_dump_output_sync___tailspin_dump_output_sync
    && (v6 = ((uint64_t (*)(uint64_t))__tailspin_dump_output_sync___tailspin_dump_output_sync)(objc_msgSend(v5, "fileDescriptor")),
        objc_msgSend(v5, "closeFile"),
        v6))
  {
LABEL_25:
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(34);
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v2;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_DEBUG, "Pushing to transcript took longer than expected, logged tailspin dump to %@ ", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
LABEL_20:
      _CKLog();
  }
  else
  {
LABEL_24:
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(34);
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v2;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_DEBUG, "Pushing to transcript took longer than expected, failed to push tailspin dump to logfile at %@ ", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      goto LABEL_20;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CKMessagesController__checkPushToTranscriptTimingWithStartTime___block_invoke_419;
  block[3] = &unk_1E274A108;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v2;
  v13 = v9;
  v10 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __66__CKMessagesController__checkPushToTranscriptTimingWithStartTime___block_invoke_419(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Tailspin log dumped here:"), *(_QWORD *)(a1 + 32), 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v4);

  objc_msgSend(v5, "presentFromViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)showConversation:(id)a3 animate:(BOOL)a4 forceToTranscript:(BOOL)a5 keepAllCurrentlyLoadedMessages:(BOOL)a6
{
  -[CKMessagesController showConversation:animate:forceToTranscript:keepAllCurrentlyLoadedMessages:userInitiated:](self, "showConversation:animate:forceToTranscript:keepAllCurrentlyLoadedMessages:userInitiated:", a3, a4, a5, a6, 0);
}

- (void)showConversation:(id)a3 animate:(BOOL)a4 forceToTranscript:(BOOL)a5 keepAllCurrentlyLoadedMessages:(BOOL)a6 userInitiated:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  _BOOL4 v9;
  id v11;
  double v12;
  NSObject *v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  CKConversation *currentConversation;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  NSObject *v23;
  int v24;
  const __CFString *v25;
  NSObject *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  NSObject *v43;
  const __CFString *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  int v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  _BOOL4 v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  int v101;
  void *v102;
  BOOL v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id WeakRetained;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  void *v130;
  uint64_t v131;
  double v132;
  void *v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  id v143;
  NSObject *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  char v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  _BOOL4 v159;
  id v160;
  void *v161;
  void *v162;
  id v163;
  void *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  char v168;
  void *v169;
  CKDetailsControllerAdapter *v170;
  void *v171;
  CKDetailsControllerAdapter *v172;
  void *v173;
  void *v174;
  id v175;
  NSObject *v176;
  void *v177;
  void *v178;
  void *v179;
  _BOOL4 v180;
  void *v181;
  void *v182;
  NSObject *v183;
  void *v184;
  void *v185;
  void *v186;
  _BOOL4 v187;
  void *v188;
  int v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  id v196;
  id v197;
  NSObject *v198;
  id v199;
  const __CFString *v200;
  void *v201;
  __CFString *v202;
  void *v203;
  void *v204;
  void *v205;
  int v206;
  int v207;
  int isKindOfClass;
  void *v209;
  _BOOL4 v210;
  id v211;
  id v212;
  NSObject *v213;
  void *v214;
  void *v215;
  void *v216;
  _BOOL4 v217;
  _QWORD v218[5];
  _QWORD v219[5];
  _QWORD v220[4];
  id v221;
  CKMessagesController *v222;
  id v223;
  id v224;
  char v225;
  _QWORD aBlock[4];
  id v227;
  id v228;
  id location;
  _QWORD v230[5];
  id v231;
  void *v232;
  void *v233;
  void *v234;
  _BYTE buf[12];
  __int16 v236;
  void *v237;
  __int16 v238;
  const __CFString *v239;
  __int16 v240;
  const __CFString *v241;
  __int16 v242;
  const __CFString *v243;
  uint64_t v244;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v217 = a4;
  v244 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (self->hasBegunShowingConversationList)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    if (v12 - self->timeViewDidBeginAppearing < 0.5)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Bailing early because the conversation list is still in the process of being shown.", buf, 2u);
        }

      }
      goto LABEL_165;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v15 = v14;
  if (_messagesControllerTelemetryLogHandle_onceToken != -1)
    dispatch_once(&_messagesControllerTelemetryLogHandle_onceToken, &__block_literal_global_1218);
  v210 = v7;
  v16 = (id)_messagesControllerTelemetryLogHandle_telemetryLogHandle;
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PushTranscript", " enableTelemetry=YES ", buf, 2u);
  }
  v213 = v16;

  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKPushTranscriptTimingKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startTimingForKey:", CFSTR("showConversation:animate:"));

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      currentConversation = self->_currentConversation;
      v20 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      if (v9)
        v21 = CFSTR("YES");
      else
        v21 = CFSTR("NO");
      *(_QWORD *)&buf[4] = v11;
      if (v8)
        v22 = CFSTR("YES");
      else
        v22 = CFSTR("NO");
      v237 = currentConversation;
      v236 = 2112;
      if (v217)
        v20 = CFSTR("YES");
      v238 = 2112;
      v239 = v21;
      v240 = 2112;
      v241 = v22;
      v242 = 2112;
      v243 = v20;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "showConversation: %@ (_currentConversation = %@), forceToTranscript: %@, keepAllCurrentlyLoadedMessages: %@, animate: %@", buf, 0x34u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend(v11, "isPinned");
      v25 = CFSTR("NO");
      if (v24)
        v25 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v25;
      _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "> Beginning Flow to present conversation with pinned={%@}", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isFeatureEnabled");
      v29 = CFSTR("NO");
      if (v28)
        v29 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v29;
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "  CommSafety Enabled?: %@", buf, 0xCu);

    }
  }
  -[CKMessagesController conversationListController](self, "conversationListController");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasUnreadMessages"))
  {
    -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "topViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31 == v214;

    if (v32)
    {
      -[CKMessagesController conversationListController](self, "conversationListController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "conversationWillBeMarkedRead:", v11);

    }
  }
  -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "topViewController");
  v215 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessagesController chatController](self, "chatController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    -[CKMessagesController chatController](self, "chatController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36 == v215)
    {
      -[CKMessagesController chatController](self, "chatController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "conversation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "groupID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "groupID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "isEqual:", v41);

      v37 = v42 ^ 1;
    }
    else
    {
      v37 = 1;
    }

  }
  else
  {
    v37 = 1;
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = CFSTR("NO");
      if (v37)
        v44 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v44;
      _os_log_impl(&dword_18DFCD000, v43, OS_LOG_TYPE_INFO, "showConversation, shouldRestoreConversation: %@", buf, 0xCu);
    }

  }
  if (v37)
  {
    objc_msgSend(v11, "chat");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "watermarkInForScrutinyMode");

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "chat");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "guid");
        v48 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v48;
        _os_log_impl(&dword_18DFCD000, v46, OS_LOG_TYPE_INFO, "Incremented load attempt count for chat GUID %@", buf, 0xCu);

      }
    }
    objc_msgSend(v11, "chat");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "isInScrutinyMode");

    if (v50 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "chat");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "guid");
        v53 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v53;
        _os_log_impl(&dword_18DFCD000, v51, OS_LOG_TYPE_INFO, "We are in scrutiny mode for chat GUID %@", buf, 0xCu);

      }
    }
    -[CKMessagesController setCurrentConversation:keepAllCurrentlyLoadedMessages:](self, "setCurrentConversation:keepAllCurrentlyLoadedMessages:", v11, v8);
    -[CKMessagesController junkModalMessagesController](self, "junkModalMessagesController");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v209 = v54;
    if (v54)
    {
      objc_msgSend(v54, "chatController");
      v55 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CKMessagesController composeChatController](self, "composeChatController");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
        -[CKMessagesController composeChatController](self, "composeChatController");
      else
        -[CKMessagesController chatController](self, "chatController");
      v55 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v55, "entryView");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    if (v55)
    {
      objc_msgSend(v216, "contentView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v207 = objc_msgSend(v57, "isActive");

    }
    else
    {
      v207 = 0;
    }
    objc_msgSend(v216, "beginDeferringEntryFieldCollapsedStateChanges");
    objc_msgSend(v55, "beginPinningInputViewsForReason:");
    objc_msgSend(v55, "dismissViewControllerAnimated:completion:", 0, 0);
    if (v55)
    {
      -[CKMessagesController macToolbarController](self, "macToolbarController");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setSecondaryItemProvider:", 0);

    }
    +[CKBalloonPluginManager sharedInstanceIfInitialized](CKBalloonPluginManager, "sharedInstanceIfInitialized");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "invalidateAllActivePlugins");

    if (objc_msgSend(v11, "isBusinessConversation"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v60, "businessChatControllerClass")), "initWithConversation:", v11);

    }
    else
    {
      -[CKMessagesController chatNavigationController](self, "chatNavigationController");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "view");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "bounds");
      v65 = v64;
      v67 = v66;

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v68, "chatControllerClass")), "initWithConversation:", v11);

      objc_msgSend(v61, "setInitialViewSize:", v65, v67);
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(v61, "setTransitionedFromComposing:", isKindOfClass & 1);
    objc_msgSend(v55, "prepareToDismissForSecondInstance");
    objc_msgSend(v61, "setDelegate:", self);
    objc_msgSend(v61, "setSendMenuDelegate:", self);
    if (v210)
      objc_msgSend(v61, "setUserInitiatedTranscriptPush:", 1);
    -[CKMessagesController setChatController:](self, "setChatController:", v61);
    objc_msgSend(v61, "beginPinningInputViewsForReason:", CFSTR("SwitchingActiveConversations"));
    objc_msgSend(v61, "setNeedsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet:", 1);
    objc_msgSend(v61, "beginPinningInputViewsForReason:", CFSTR("NewComposeToChatTransition"));
    objc_msgSend(v55, "endPinningInputViewsForReason:", CFSTR("NewComposeToChatTransition"));
    -[CKMessagesController setupBizNavBarForConversation:](self, "setupBizNavBarForConversation:", v11);
    -[CKMessagesController chatController](self, "chatController");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = -[CKMessagesController isCollapsed](self, "isCollapsed");
    if (v70)
    {
      if (!-[CKMessagesController isTopVCChatNavigationController](self, "isTopVCChatNavigationController"))
      {
        -[CKMessagesController presentedViewController](self, "presentedViewController");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (v71)
        {
          -[CKMessagesController presentedViewController](self, "presentedViewController");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v72 == v73;

          if (v74)
          {
            v211 = v61;
            -[CKMessagesController composeChatController](self, "composeChatController");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "collectionViewController");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "collectionView");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "contentOffset");
            v79 = v78;
            v81 = v80;

            -[CKMessagesController composeChatController](self, "composeChatController");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "collectionViewController");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "collectionView");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "contentInset");
            v86 = v85;
            v88 = v87;
            v90 = v89;
            v92 = v91;

            objc_msgSend(v211, "primeTranscriptWithInitialOffset:inset:", v79, v81, v86, v88, v90, v92);
            objc_msgSend(v211, "conversation");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "chat");
            v94 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v94, "beginHoldingChatItemsUpdatesForReason:", *MEMORY[0x1E0D353C8]);
            objc_msgSend(v211, "beginHoldingScrollGeometryUpdatesForReason:", CFSTR("TransitionFromNewCompose"));

          }
        }
      }
    }
    v95 = (void *)MEMORY[0x1E0CEABB8];
    v230[0] = MEMORY[0x1E0C809B0];
    v230[1] = 3221225472;
    v230[2] = __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke;
    v230[3] = &unk_1E274A108;
    v230[4] = self;
    v212 = v69;
    v231 = v212;
    objc_msgSend(v95, "_performWithoutDeferringTransitions:", v230);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = objc_msgSend(v96, "useMacToolbar");

    if (v97)
    {
      -[CKMessagesController chatController](self, "chatController");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v98, "conformsToProtocol:", &unk_1EE1607D8))
      {
        -[CKMessagesController macToolbarController](self, "macToolbarController");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "configureWithToolbarController:", v99);

      }
    }
    -[CKMessagesController _setIsShowingNoSelectionUI:](self, "_setIsShowingNoSelectionUI:", v11 == 0);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = objc_msgSend(v100, "isFluidTransitioningEnabled");

    if (v101)
    {
      if (v70)
      {
        if (objc_msgSend(v11, "isPinned"))
        {
          -[CKMessagesController _sourceViewForFluidTransitionWithConversation:](self, "_sourceViewForFluidTransitionWithConversation:", v11);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = v102 == 0;

          if (!v103)
          {
            *(_QWORD *)buf = 0;
            objc_initWeak((id *)buf, self);
            location = 0;
            objc_initWeak(&location, v11);
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2;
            aBlock[3] = &unk_1E275A6F0;
            objc_copyWeak(&v227, (id *)buf);
            objc_copyWeak(&v228, &location);
            v204 = _Block_copy(aBlock);
            objc_msgSend(MEMORY[0x1E0CEAF58], "zoomWithSourceViewProvider:", v204);
            v205 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = (void *)objc_opt_new();
            -[CKMessagesController traitCollection](self, "traitCollection");
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "displayCornerRadius");

            -[CKMessagesController chatNavigationController](self, "chatNavigationController");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "view");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "bounds");

            UIRectCenteredRect();
            objc_msgSend(v104, "setFrameOfSourceInDestination:");
            objc_msgSend(v205, "_setOptions:", v104);
            objc_msgSend(MEMORY[0x1E0CEA478], "systemBackgroundColor");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKMessagesController chatNavigationController](self, "chatNavigationController");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "view");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v110, "setBackgroundColor:", v108);

            -[CKMessagesController chatNavigationController](self, "chatNavigationController");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "_setPreferredTransition:", v205);

            WeakRetained = objc_loadWeakRetained((id *)buf);
            objc_msgSend(WeakRetained, "conversationListController");
            v113 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v113, "itemIdentifierForConversation:inSection:", v11, 2);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "dataSource");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "indexPathForItemIdentifier:", v114);
            v116 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v113, "collectionView");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "deselectItemAtIndexPath:animated:", v116, 0);

            objc_destroyWeak(&v228);
            objc_destroyWeak(&v227);
            objc_destroyWeak(&location);
            objc_destroyWeak((id *)buf);
            goto LABEL_92;
          }
        }
      }
      -[CKMessagesController chatNavigationController](self, "chatNavigationController");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "_setPreferredTransition:", 0);

    }
    if (!v70)
    {
LABEL_94:
      v206 = 1;
      goto LABEL_95;
    }
LABEL_92:
    if (-[CKMessagesController isTopVCChatNavigationController](self, "isTopVCChatNavigationController"))
    {
      v70 = 0;
      goto LABEL_94;
    }
    -[CKMessagesController presentedViewController](self, "presentedViewController");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v177)
      goto LABEL_152;
    -[CKMessagesController presentedViewController](self, "presentedViewController");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v180 = v178 == v179;

    if (v180)
    {
      -[CKMessagesController composeChatController](self, "composeChatController");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController chatController](self, "chatController");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = objc_msgSend(v194, "isSendingMessage");
      v220[0] = MEMORY[0x1E0C809B0];
      v220[1] = 3221225472;
      v220[2] = __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_441;
      v220[3] = &unk_1E2755D50;
      v225 = v70;
      v196 = v195;
      v221 = v196;
      v222 = self;
      v197 = v194;
      v223 = v197;
      v224 = v61;
      -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v220);

      v206 = 0;
      v217 = 0;
    }
    else
    {
LABEL_152:
      v70 = 0;
      v206 = 1;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v198 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v198, OS_LOG_TYPE_INFO))
      {
        -[CKMessagesController chatNavigationController](self, "chatNavigationController");
        v199 = (id)objc_claimAutoreleasedReturnValue();
        if (v217)
          v200 = CFSTR("YES");
        else
          v200 = CFSTR("NO");
        -[CKMessagesController chatNavigationController](self, "chatNavigationController");
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v201, "viewControllers");
        v202 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v199;
        v236 = 2112;
        v237 = (void *)v200;
        v238 = 2112;
        v239 = v202;
        _os_log_impl(&dword_18DFCD000, v198, OS_LOG_TYPE_INFO, "Pushing to detail view controller: %@ animate: %@ with view controllers: %@", buf, 0x20u);

      }
    }
    if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
    {
      if (v217)
      {
        -[CKMessagesController showColumn:](self, "showColumn:", 2);
LABEL_179:
        v217 = 1;
        goto LABEL_95;
      }
      v219[0] = MEMORY[0x1E0C809B0];
      v219[1] = 3221225472;
      v219[2] = __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_442;
      v219[3] = &unk_1E274A208;
      v219[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v219);
    }
    else
    {
      if (v217)
      {
        -[CKMessagesController chatNavigationController](self, "chatNavigationController");
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMessagesController showDetailViewController:sender:](self, "showDetailViewController:sender:", v203, self);

        goto LABEL_179;
      }
      v218[0] = MEMORY[0x1E0C809B0];
      v218[1] = 3221225472;
      v218[2] = __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_443;
      v218[3] = &unk_1E274A208;
      v218[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v218);
    }
    v217 = 0;
LABEL_95:
    -[CKMessagesController chatController](self, "chatController");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController composeChatController](self, "composeChatController");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v120;
    if (v120)
    {
      objc_msgSend(v120, "systemMinimumLayoutMargins");
      v123 = v122;
      v125 = v124;
      v127 = v126;
      v129 = v128;
      objc_msgSend(v121, "view");
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = objc_msgSend(v130, "effectiveUserInterfaceLayoutDirection");
      if (v131)
        v132 = v129;
      else
        v132 = v125;
      if (!v131)
        v125 = v129;

      objc_msgSend(v119, "view");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "setLayoutMargins:", v123, v132, v127, v125);

      objc_msgSend(v121, "setIgnoreKeyboardNotifications:", v216 != 0);
    }
    objc_msgSend(v55, "keyboardFrame");
    v135 = v134;
    v137 = v136;
    v139 = v138;
    v141 = v140;
    if ((v70 & 1) != 0)
    {
      -[CKMessagesController chatController](self, "chatController");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "beginHoldingScrollGeometryUpdatesForReason:", CFSTR("TransitionFromNewCompose"));

      if (!v207)
      {
LABEL_117:
        objc_msgSend(v216, "endDeferringEntryFieldCollapsedStateChanges");
        objc_msgSend(v55, "forciblyUnloadChatInputController");
        if (v70)
        {
          -[CKMessagesController chatController](self, "chatController");
          v148 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "cleanupPostComposeTransitionWithKBFrame:", v135, v137, v139, v141);

          -[CKMessagesController chatController](self, "chatController");
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "endHoldingScrollGeometryUpdatesForReason:", CFSTR("TransitionFromNewCompose"));

        }
        if (v206)
          objc_msgSend(v61, "endPinningInputViewsForReason:", CFSTR("NewComposeToChatTransition"));

        v217 = v217;
        goto LABEL_122;
      }
      v143 = v216;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v144 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v144, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[CKMessagesController showConversation:animate:forceToTranscript:keepAllCurrentlyLoadedM"
                               "essages:userInitiated:]";
          _os_log_impl(&dword_18DFCD000, v144, OS_LOG_TYPE_INFO, "reloadEntryViewIfNeeded called from %s", buf, 0xCu);
        }

      }
      objc_msgSend(v119, "reloadEntryViewIfNeeded");
      if (v216)
      {
        objc_msgSend(v119, "entryView");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "setEntryFieldCollapsed:animated:", objc_msgSend(v216, "entryFieldCollapsed"), 0);

      }
      if ((v207 & 1) == 0)
        goto LABEL_117;
      objc_msgSend(v119, "entryView");
      v143 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (!(v70 & 1 | (((isKindOfClass | IMSharedHelperDeviceIsiPad()) & 1) == 0))
      && objc_msgSend(v119, "isFirstResponder"))
    {
      objc_msgSend(v119, "resignFirstResponder");
    }
    objc_msgSend(v143, "contentView");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v146, "activeView");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "becomeFirstResponder");

    goto LABEL_117;
  }
LABEL_122:
  -[CKMessagesController composeChatController](self, "composeChatController");
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  if (v150)
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "setDelegate:", 0);

    -[CKMessagesController setComposeChatController:](self, "setComposeChatController:", 0);
    -[CKMessagesController setComposeChatNavigationController:](self, "setComposeChatNavigationController:", 0);
  }
  +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v152, "presentedViewController");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v154 = objc_opt_isKindOfClass();

  if ((v154 & 1) != 0)
  {
    -[CKMessagesController chatController](self, "chatController");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:", v217, 0, 0);
  }
  else
  {
    +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "dismissViewControllerAnimated:completion:", 1, 0);
  }

  -[CKMessagesController chatNavigationController](self, "chatNavigationController");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "presentedViewController");
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  if (v157)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[CKMessagesController onboardingController](self, "onboardingController");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      v159 = v158 == 0;

      if (v159)
      {
        v160 = v157;
        objc_msgSend(v160, "presentedViewController");
        v161 = (void *)objc_claimAutoreleasedReturnValue();

        if (v161)
        {
          v162 = v160;
          do
          {
            objc_msgSend(v162, "presentedViewController");
            v163 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v163, "presentedViewController");
            v164 = (void *)objc_claimAutoreleasedReturnValue();

            v162 = v163;
          }
          while (v164);
          if (v163 != v160)
          {
            do
            {
              objc_msgSend(v163, "dismissViewControllerAnimated:completion:", 0, 0);
              objc_msgSend(v163, "presentingViewController");
              v165 = objc_claimAutoreleasedReturnValue();

              v163 = (id)v165;
            }
            while ((id)v165 != v160);
          }
        }
        objc_msgSend(v160, "dismissViewControllerAnimated:completion:", 1, 0);

      }
    }
  }
  if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout")
    && !-[CKMessagesController isCollapsed](self, "isCollapsed")
    && !CKIsRunningInMacCatalyst())
  {
    -[CKMessagesController hideColumn:](self, "hideColumn:", 0);
  }
  -[CKMessagesController detailsNavigationController](self, "detailsNavigationController");
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  if (v166)
  {
    -[CKMessagesController chatController](self, "chatController");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v168 = objc_opt_isKindOfClass();

    if ((v168 & 1) != 0)
    {
      -[CKMessagesController chatController](self, "chatController");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = [CKDetailsControllerAdapter alloc];
      objc_msgSend(v169, "conversation");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v172 = -[CKDetailsControllerAdapter initWithConversation:delegate:](v170, "initWithConversation:delegate:", v171, v169);

      -[CKDetailsControllerAdapter detailsController](v172, "detailsController");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      if (v173)
      {
        -[CKDetailsControllerAdapter detailsController](v172, "detailsController");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        v234 = v174;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v234, 1);
        v175 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v175 = (id)MEMORY[0x1E0C9AA60];
      }

      -[CKMessagesController detailsNavigationController](self, "detailsNavigationController");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "setViewControllers:animated:", v175, 0);

      -[CKMessagesController detailsNavigationController](self, "detailsNavigationController");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "setDetailsAdapter:", v172);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v176 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v176, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v176, OS_LOG_TYPE_INFO, "chatController is not class CKChatController.", buf, 2u);
      }

    }
  }
  -[CKMessagesController _updateAlertSuppressionContext](self, "_updateAlertSuppressionContext");
  v183 = v213;
  if (os_signpost_enabled(v183))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v183, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PushTranscript", " enableTelemetry=YES ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKPushTranscriptTimingKey"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v184, "stopTimingForKey:", CFSTR("showConversation:animate:"));

  kdebug_trace();
  -[CKMessagesController _checkPushToTranscriptTimingWithStartTime:](self, "_checkPushToTranscriptTimingWithStartTime:", v15);
  if (!-[CKMessagesController _changeFilterModeIfNeeded](self, "_changeFilterModeIfNeeded"))
  {
    -[CKMessagesController messagesControllerDelegate](self, "messagesControllerDelegate");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v185, "messagesController:didShowConversation:", self, v11);

  }
  objc_msgSend(v11, "chat");
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = objc_msgSend(v186, "isFiltered") == 2;

  if (v187)
  {
    objc_msgSend(v11, "chat");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = objc_msgSend(v188, "isSMS");

    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = v190;
    if (v189)
    {
      v232 = &unk_1E2871008;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", IMIsOscarEnabled());
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v233 = v192;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v233, &v232, 1);
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "trackiMessageJunkEvent:withDictionary:", 4, v193);

    }
    else
    {
      objc_msgSend(v190, "trackiMessageJunkEvent:", 5);
    }

  }
LABEL_165:

}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "chatNavigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setViewControllers:", v3);

}

NSObject *__112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      objc_msgSend(WeakRetained, "_sourceViewForFluidTransitionWithConversation:", v3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        v5 = v4;
        v6 = v5;
      }
      else
      {
        IMLogHandleForCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_3();

        v6 = 0;
      }
    }
    else
    {
      IMLogHandleForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_2();
      v6 = 0;
    }

  }
  else
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_1();
    v6 = 0;
  }

  return v6;
}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_441(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    if (v3)
    {
      objc_msgSend(v2, "chatNavigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setViewControllers:", v5);

      objc_msgSend(*(id *)(a1 + 32), "entryView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activeView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "becomeFirstResponder");

    }
    else
    {
      objc_msgSend(v2, "_populateChatNavigationControllerWithSelection");
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setComposeChatController:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setComposeChatNavigationController:", 0);
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unpendConversation");

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "endHoldingChatItemsUpdatesForReason:", *MEMORY[0x1E0D353C8]);
  objc_msgSend(*(id *)(a1 + 32), "endHoldingScrollGeometryUpdatesForReason:", CFSTR("TransitionFromNewCompose"));
  objc_msgSend(*(id *)(a1 + 56), "endPinningInputViewsForReason:", CFSTR("NewComposeToChatTransition"));

}

uint64_t __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_442(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showColumn:", 2);
}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_443(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "chatNavigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showDetailViewController:sender:", v3, *(_QWORD *)(a1 + 32));

}

- (id)_sourceViewForFluidTransitionWithConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;

  v4 = a3;
  if ((objc_msgSend(v4, "isPinned") & 1) == 0)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CKMessagesController _sourceViewForFluidTransitionWithConversation:].cold.6();
    goto LABEL_7;
  }
  -[CKMessagesController conversationListController](self, "conversationListController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CKMessagesController conversationListController](self, "conversationListController");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject itemIdentifierForConversation:inSection:](v7, "itemIdentifierForConversation:inSection:", v4, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject dataSource](v7, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPathForItemIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      IMLogHandleForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CKMessagesController _sourceViewForFluidTransitionWithConversation:].cold.1();
      v8 = 0;
      goto LABEL_27;
    }
    -[NSObject collectionView](v7, "collectionView");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject cellForItemAtIndexPath:](v13, "cellForItemAtIndexPath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "pinnedConversationView");
        v15 = objc_claimAutoreleasedReturnValue();
        -[NSObject avatarView](v15, "avatarView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v16;
        if (v16)
        {
          v17 = v16;
        }
        else
        {
          IMLogHandleForCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[CKMessagesController _sourceViewForFluidTransitionWithConversation:].cold.3();

        }
        goto LABEL_26;
      }
      IMLogHandleForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CKMessagesController _sourceViewForFluidTransitionWithConversation:].cold.4((uint64_t)v14, v15);
    }
    else
    {
      IMLogHandleForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CKMessagesController _sourceViewForFluidTransitionWithConversation:].cold.2();
    }
    v8 = 0;
LABEL_26:

LABEL_27:
    goto LABEL_8;
  }
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[CKMessagesController _sourceViewForFluidTransitionWithConversation:].cold.5();
LABEL_7:
  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)_changeFilterModeIfNeeded
{
  unint64_t v3;
  char v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
    return 0;
  v3 = -[CKMessagesController currentConversationListFilterMode](self, "currentConversationListFilterMode");
  if (v3 < 2)
    return 0;
  v5 = v3;
  -[CKMessagesController chatController](self, "chatController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "conversation:includedInFilterMode:", v7, v5);

    if ((v9 & 1) == 0)
      -[CKMessagesController inboxViewController:didSelectFilterMode:](self, "inboxViewController:didSelectFilterMode:", 0, 1);
    v4 = v9 ^ 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)junkModalMessagesController
{
  void *v2;
  id v3;
  id v4;

  -[CKMessagesController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
    if (objc_msgSend(v3, "isOscarModal"))
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isDownTimeActiveForCurrentChat
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  -[CKMessagesController chatController](self, "chatController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "allowedToShowConversation") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)showConversationInNewWindow:(id)a3
{
  id v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled")
    || (v4 = objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"), v3)
    && v4
    && (objc_msgSend(v3, "chat"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "allowedByScreenTime"),
        v5,
        v6))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activityForNewScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v8, 0, &__block_literal_global_456_1);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v3;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Not showing conversation in new window since conversation is blocked by ScreenTime: %@", (uint8_t *)&v10, 0xCu);
    }

  }
}

void __52__CKMessagesController_showConversationInNewWindow___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "error requesting scene: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)showConversation:(id)a3 animate:(BOOL)a4
{
  _BOOL8 v4;
  CKSendMenuPresentation *sendMenuPresentation;
  CKSendMenuPresentation *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  sendMenuPresentation = self->_sendMenuPresentation;
  if (sendMenuPresentation)
  {
    -[CKSendMenuPresentation dismissAnimated:completion:](sendMenuPresentation, "dismissAnimated:completion:", 0, 0);
    v7 = self->_sendMenuPresentation;
    self->_sendMenuPresentation = 0;

  }
  -[CKMessagesController showConversation:animate:keepAllCurrentlyLoadedMessages:](self, "showConversation:animate:keepAllCurrentlyLoadedMessages:", v8, v4, 0);

}

- (void)showConversation:(id)a3 animate:(BOOL)a4 userInitiated:(BOOL)a5
{
  -[CKMessagesController showConversation:animate:forceToTranscript:keepAllCurrentlyLoadedMessages:userInitiated:](self, "showConversation:animate:forceToTranscript:keepAllCurrentlyLoadedMessages:userInitiated:", a3, a4, 1, 0, a5);
}

- (void)showConversation:(id)a3 animate:(BOOL)a4 keepAllCurrentlyLoadedMessages:(BOOL)a5
{
  -[CKMessagesController showConversation:animate:forceToTranscript:keepAllCurrentlyLoadedMessages:](self, "showConversation:animate:forceToTranscript:keepAllCurrentlyLoadedMessages:", a3, a4, 1, a5);
}

- (void)showConversationAndMessageForChatGUID:(id)a3 messageGUID:(id)a4 animate:(BOOL)a5
{
  -[CKMessagesController showConversationAndMessageForChatGUID:messageGUID:withInlineReplyOverlay:animate:](self, "showConversationAndMessageForChatGUID:messageGUID:withInlineReplyOverlay:animate:", a3, a4, 0, a5);
}

- (void)chatControllerDidReselectConversation:(id)a3
{
  id v3;

  -[CKMessagesController chatController](self, "chatController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissInlineReplyIfNeededAndScrollToBottom");

}

- (void)showConversationAndMessageForChatGUID:(id)a3 messageGUID:(id)a4 withInlineReplyOverlay:(BOOL)a5 animate:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a6;
  v7 = a5;
  v19 = a4;
  v10 = a3;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "conversationForExistingChatWithGUID:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CKMessagesController showConversation:animate:keepAllCurrentlyLoadedMessages:](self, "showConversation:animate:keepAllCurrentlyLoadedMessages:", v12, v6, 1);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39930]), "initWithEncodedMessagePartGUID:", v19);
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "messageGUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ensureMessageWithGUIDIsLoaded:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      if (!v19)
        goto LABEL_11;
      objc_msgSend(v12, "ensureMessageWithGUIDIsLoaded:", v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
        goto LABEL_11;
    }
    -[CKMessagesController chatController](self, "chatController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14)
      objc_msgSend(v17, "scrollToMessage:atSpecificMessagePartIndex:highlight:withInlineReplyOverlay:", v16, objc_msgSend(v14, "partNumber"), 1, v7);
    else
      objc_msgSend(v17, "scrollToMessage:highlight:withInlineReplyOverlay:", v16, 1, v7);

    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)resumeToConversation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  NSObject *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "groupID");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[CKConversation groupID](self->_currentConversation, "groupID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "resumeToConversation: toConvo: %@ currentConversation: %@", (uint8_t *)&v13, 0x16u);

    }
  }
  if (v4)
  {
    objc_msgSend(v4, "groupID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("-1"));
    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "disableAnimation");
      -[CKMessagesController showConversation:animate:forceToTranscript:keepAllCurrentlyLoadedMessages:](self, "showConversation:animate:forceToTranscript:keepAllCurrentlyLoadedMessages:", v4, 0, 0, 0);
      objc_msgSend(MEMORY[0x1E0CEABB0], "enableAnimation");
    }

    v10 = v9 ^ 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKMessagesController - resumeToConversation: attempted to resume to nil conversation!", (uint8_t *)&v13, 2u);
      }

    }
    v10 = 0;
  }

  return v10;
}

- (void)deleteConversation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__CKMessagesController_deleteConversation___block_invoke;
  v8[3] = &unk_1E274A208;
  v8[4] = self;
  objc_msgSend(v5, "recoverableDeleteForConversations:deleteDate:synchronousQuery:completionHandler:", v6, v7, 0, v8);

}

void __43__CKMessagesController_deleteConversation___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "conversationList");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateRecoverableConversationList");

}

- (id)firstConversationExactlyMatchingDisplayName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0D35798];
  v4 = a3;
  objc_msgSend(v3, "sharedRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingChatWithDisplayName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "conversationForExistingChat:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)conversationMatchingGUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversationForExistingChatWithGUID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)showConversationListWithAnimation:(BOOL)a3 didDismissController:(BOOL *)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  CKSendMenuPresentation *sendMenuPresentation;
  CKSendMenuPresentation *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void (**v22)(_QWORD);
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  int isKindOfClass;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  _QWORD v33[4];
  void (**v34)(_QWORD);
  _QWORD v35[5];
  _QWORD aBlock[5];
  BOOL v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v5 = a3;
  v40 = *MEMORY[0x1E0C80C00];
  -[CKMessagesController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController conversationListController](self, "conversationListController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (a4 && (v10 & 1) == 0)
    *a4 = 1;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "dismissing fullscreen balloon view because conversation list is being shown", buf, 2u);
    }

  }
  -[CKMessagesController chatController](self, "chatController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:", v5, 0, 0);

  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    sendMenuPresentation = self->_sendMenuPresentation;
    if (sendMenuPresentation)
    {
      -[CKSendMenuPresentation dismissAnimated:completion:](sendMenuPresentation, "dismissAnimated:completion:", 0, 0);
      v14 = self->_sendMenuPresentation;
      self->_sendMenuPresentation = 0;

    }
    if (!v5)
    {
      -[CKMessagesController chatNavigationController](self, "chatNavigationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "viewControllers");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v39 = v17;
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Clearing chatController and chatNavigationController view controllers, chatNavigationController VCs before: %@", buf, 0xCu);

        }
      }
      -[CKMessagesController chatController](self, "chatController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDelegate:", 0);

      -[CKMessagesController setChatController:](self, "setChatController:", 0);
      -[CKMessagesController setCurrentConversation:](self, "setCurrentConversation:", 0);
      -[CKMessagesController _populateChatNavigationControllerWithSelection](self, "_populateChatNavigationControllerWithSelection");
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "viewControllers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v39 = v20;
          _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "chatNavigationController (showConversationListWithAnimation:) children:%@", buf, 0xCu);

        }
      }

    }
    v21 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke;
    aBlock[3] = &unk_1E274CA88;
    v37 = v5;
    aBlock[4] = self;
    v22 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[CKMessagesController presentedViewController](self, "presentedViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[CKMessagesController presentedViewController](self, "presentedViewController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v24 == v25;

      if (v26)
      {
        v35[0] = v21;
        v35[1] = 3221225472;
        v35[2] = __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke_460;
        v35[3] = &unk_1E274A208;
        v35[4] = self;
        -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v35);
      }
      else
      {
        -[CKMessagesController presentedViewController](self, "presentedViewController");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          -[CKMessagesController onboardingController](self, "onboardingController");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {

          }
          else
          {
            -[CKMessagesController presentedViewController](self, "presentedViewController");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v31 = objc_opt_isKindOfClass();

            if ((v31 & 1) == 0)
            {
              -[CKMessagesController presentedViewController](self, "presentedViewController");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33[0] = v21;
              v33[1] = 3221225472;
              v33[2] = __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke_2;
              v33[3] = &unk_1E274AED0;
              v34 = v22;
              objc_msgSend(v32, "dismissViewControllerAnimated:completion:", 0, v33);

              goto LABEL_28;
            }
          }
        }
      }
    }
    v22[2](v22);
LABEL_28:

  }
}

void __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      if (*(_BYTE *)(a1 + 40))
        v3 = CFSTR("YES");
      else
        v3 = CFSTR("NO");
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Popping conversationListNavigationController to root animated: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "updateInboxAndConversationList");
  if (objc_msgSend(*(id *)(a1 + 32), "_wantsThreeColumnLayout"))
  {
    if (!CKIsRunningInMacCatalyst())
      objc_msgSend(*(id *)(a1 + 32), "hideColumn:", 0);
    objc_msgSend(*(id *)(a1 + 32), "showColumn:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissChatControllerIfVisibleAnimated:", *(unsigned __int8 *)(a1 + 40));
  }
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "currentConversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cleanUpBizNavBarForConversation:", v5);

}

uint64_t __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke_460(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAndDestroyComposition");
}

uint64_t __79__CKMessagesController_showConversationListWithAnimation_didDismissController___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_hideConversationListForIPadPPTTest
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CKMessagesController chatController](self, "chatController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[CKMessagesController setChatController:](self, "setChatController:", 0);
  -[CKMessagesController setCurrentConversation:](self, "setCurrentConversation:", 0);
  -[CKMessagesController _populateChatNavigationControllerWithSelection](self, "_populateChatNavigationControllerWithSelection");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      -[CKMessagesController chatNavigationController](self, "chatNavigationController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "viewControllers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "chatNavigationController (_hideConversationListForIPadPPTTest) children:%@", buf, 0xCu);

    }
  }
  -[CKMessagesController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_7;
  -[CKMessagesController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 == v9;

  if (v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__CKMessagesController__hideConversationListForIPadPPTTest__block_invoke;
    v13[3] = &unk_1E274A208;
    v13[4] = self;
    -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, v13);
  }
  else
  {
LABEL_7:
    -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
  }
  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "popToRootViewControllerAnimated:", 0);

}

uint64_t __59__CKMessagesController__hideConversationListForIPadPPTTest__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAndDestroyComposition");
}

- (void)conversationListWillBeginEditing:(BOOL)a3
{
  id v3;

  if (a3)
  {
    -[CKMessagesController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endEditing:", 1);

  }
  else
  {
    -[CKMessagesController becomeFirstResponder](self, "becomeFirstResponder");
  }
}

- (void)conversationListIsDeletingConversations:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purgeConversations:", v3);

}

- (BOOL)isShowingSelectionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController conversationListController](self, "conversationListController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 == v5)
      return 0;
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController selectionViewController](self, "selectionViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);
  }
  else
  {
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController selectionViewController](self, "selectionViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7 == v8;
  }

  return v9;
}

- (BOOL)isAnimatingMessageSend
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
    {
      -[CKMessagesController presentedViewController](self, "presentedViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3 == v4)
      {
        -[CKMessagesController composeChatController](self, "composeChatController");
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v9 = (void *)v5;
        goto LABEL_9;
      }
    }
  }
  else
  {
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController chatController](self, "chatController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
    {
      -[CKMessagesController chatController](self, "chatController");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  v9 = 0;
LABEL_9:
  v10 = objc_msgSend(v9, "isAnimatingMessageSend");

  return v10;
}

- (BOOL)currentCompositionHasContent
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  char v10;
  BOOL v11;

  if (!-[CKMessagesController isComposingMessage](self, "isComposingMessage"))
    return 0;
  -[CKMessagesController composeChatController](self, "composeChatController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proposedRecipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  objc_msgSend(v3, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasContent");
  objc_msgSend(v3, "unatomizedRecipientText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v5)
    v10 = 1;
  else
    v10 = v7;
  if (v9)
    v11 = 1;
  else
    v11 = v10;

  return v11;
}

- (BOOL)isTopVCChatNavigationController
{
  CKMessagesController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[CKMessagesController conversationListNavigationController](self, "conversationListNavigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessagesController chatNavigationController](v2, "chatNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 == v5;

  return (char)v2;
}

- (BOOL)isShowingConversationListController
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[CKMessagesController conversationListControllerIfInitialized](self, "conversationListControllerIfInitialized");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isShowingComposeChatController
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[CKMessagesController composeChatController](self, "composeChatController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    -[CKMessagesController presentedViewController](self, "presentedViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController composeChatNavigationController](self, "composeChatNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4 == v5;
  }
  else
  {
    -[CKMessagesController chatNavigationController](self, "chatNavigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessagesController composeChatController](self, "composeChatController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == v8;

  }
  return v6;
}

- (BOOL)hasUnreadFilteredConversationsIgnoringMessages:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unreadFilteredConversationCountIgnoringMessages:", v3);

  return v5 > 0;
}

- (void)_unreadCountDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  const __CFString *v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedChats");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (objc_msgSend(v11, "unreadMessageCount", v21))
          {
            v27 = CFSTR("CKSBActionUserInfoKeyChatGUID");
            objc_msgSend(v11, "guid");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = v12;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v14 = objc_alloc(MEMORY[0x1E0CEA360]);
            objc_msgSend(v11, "localizedUnreadShortcutTitle");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v14, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:", CFSTR("com.apple.mobilesms.conversation"), v15, 0, 0, v13);

            objc_msgSend(v4, "addObject:", v16);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v8);
    }

    objc_msgSend(v21, "setShortcutItems:", v4);
  }
  else
  {
    -[CKMessagesController inboxModel](self, "inboxModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "itemsMap");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[CKMessagesController inboxModel](self, "inboxModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "itemsMap");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __46__CKMessagesController__unreadCountDidChange___block_invoke;
      v22[3] = &unk_1E275A718;
      v22[4] = self;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v22);

    }
  }
}

void __46__CKMessagesController__unreadCountDidChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  if (v5 <= 9)
  {
    objc_msgSend(*(id *)(a1 + 32), "_unreadCountStringForFilterMode:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateAccessory:", v6);

  }
}

- (void)_junkConversationsRecovered:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[CKMessagesController isOscarModal](self, "isOscarModal"))
  {
    -[CKMessagesController currentlyShownConversation](self, "currentlyShownConversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "primaryFilterModeForConversation:", v5);

      if (v7 != 9)
      {
        -[CKMessagesController chatController](self, "chatController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "updateChatControllerForRecoveredJunkConversation");
        if (CKIsRunningInMacCatalyst())
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              LOWORD(v15) = 0;
              _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "_junkConversationsRecovered: Moving back from catalyst filters.", (uint8_t *)&v15, 2u);
            }

          }
          -[CKMessagesController catalystFiltersNavigationBackButtonTapped:](self, "catalystFiltersNavigationBackButtonTapped:", 0);
        }
        else
        {
          -[CKMessagesController junkModalMessagesController](self, "junkModalMessagesController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                v15 = 138412290;
                v16 = v11;
                _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "_junkConversationsRecovered: Performing junk recovery for junk modal messages controller: %@.", (uint8_t *)&v15, 0xCu);
              }

            }
            -[CKMessagesController performJunkRecoveryForJunkModalMessagesController:](self, "performJunkRecoveryForJunkModalMessagesController:", v11);
          }
          else if (-[CKMessagesController _shouldShowInboxView](self, "_shouldShowInboxView"))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                CKConversationListFilterModeStringValue(1uLL);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = 138412290;
                v16 = v14;
                _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "_junkConversationsRecovered: Selecting filter mode: %@.", (uint8_t *)&v15, 0xCu);

              }
            }
            -[CKMessagesController inboxViewController:didSelectFilterMode:](self, "inboxViewController:didSelectFilterMode:", 0, 1);
          }

        }
        goto LABEL_32;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_32:

        goto LABEL_33;
      }
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "_junkConversationsRecovered: currently shown conversation is still junk. State not changed.", (uint8_t *)&v15, 2u);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_32;
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "_junkConversationsRecovered: Not showing any conversation. State not changed.", (uint8_t *)&v15, 2u);
      }
    }

    goto LABEL_32;
  }
LABEL_33:

}

- (void)performJunkRecoveryForJunkModalMessagesController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD *v7;
  id v8;
  _QWORD v9[6];
  _QWORD v10[6];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "performJunkRecoveryForJunkModalMessagesController: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v4, "chatController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    objc_msgSend(v6, "updateChatControllerForRecoveredJunkConversation");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__CKMessagesController_performJunkRecoveryForJunkModalMessagesController___block_invoke;
    v10[3] = &unk_1E274A108;
    v7 = v10;
    v10[4] = self;
    v10[5] = v6;
    objc_msgSend(v6, "performAnimatedJunkRecoveryTransition:", v10);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__CKMessagesController_performJunkRecoveryForJunkModalMessagesController___block_invoke_2;
    v9[3] = &unk_1E274A108;
    v7 = v9;
    v9[4] = self;
    v9[5] = v6;
    v8 = v6;
    -[CKMessagesController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);
  }

}

void __74__CKMessagesController_performJunkRecoveryForJunkModalMessagesController___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "conversation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showConversation:animate:", v2, 0);

}

void __74__CKMessagesController_performJunkRecoveryForJunkModalMessagesController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "conversationListController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateConversationList");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "showConversation:animate:", v3, 1);

}

- (BOOL)isShowingChatControllerWithUnsentText
{
  int v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  v3 = -[CKMessagesController isShowingChatController](self, "isShowingChatController");
  if (v3)
  {
    -[CKMessagesController chatController](self, "chatController");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "composition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasContent");

    -[CKMessagesController chatController](self, "chatController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v7, "isSendingMessage");

    LOBYTE(v3) = v6 & (v4 ^ 1);
  }
  return v3;
}

- (BOOL)shouldShowMakoIMessageAlert
{
  int v2;
  _BOOL4 v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  BOOL v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((IMSharedHelperDeviceIsiPad() & 1) != 0)
    v2 = 1;
  else
    v2 = IMSharedHelperDeviceIsiPod();
  v3 = CKIsBareMakoAccount();
  v4 = CKRegistrationBypassEnabled();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v2)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v11 = 138413058;
      v12 = v7;
      if (v3)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      if (!v4)
        v6 = CFSTR("YES");
      v16 = v6;
      v17 = 2112;
      v18 = CFSTR("YES");
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "shouldShowMakoIMessageAlert - isRightDevice: [%@], isMako: [%@], registrationBypassDisabled: [%@], !isSigningInCatalyst: [%@]", (uint8_t *)&v11, 0x2Au);
    }

  }
  if (v3)
    v9 = v2;
  else
    v9 = 0;
  return !v4 && v9;
}

- (void)showMakoIMessageAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v15[16];

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ADD_EMAIL_ALERT_BODY"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SETTINGS"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ADD_EMAIL_ALERT_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v6, 0, &__block_literal_global_474_1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v12, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v10);
  objc_msgSend(v9, "addAction:", v13);
  objc_msgSend(v9, "presentFromViewController:animated:completion:", self, 1, 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Mako account: show alert with deep link to settings", v15, 2u);
    }

  }
}

void __45__CKMessagesController_showMakoIMessageAlert__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=PASSWORD_AND_SECURITY"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

uint64_t __69__CKMessagesController_notifyThatKeepMessagesSettingWasResetIfNeeded__block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "becomeFirstResponder");
  return result;
}

- (void)showStoreForURL:(id)a3 fromSourceApplication:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedViewController");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_9;
  v9 = (void *)v8;
  +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_10:
    -[CKMessagesController _presentAppStoreWithLaunchURL:fromSourceApplication:](self, "_presentAppStoreWithLaunchURL:fromSourceApplication:", v22, v6);
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trackEvent:", *MEMORY[0x1E0D384A8]);
    goto LABEL_11;
  }
  +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "topViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v15 = objc_opt_isKindOfClass();

  if ((v15 & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v7, "topViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "balloonPlugin");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D37568]);

  if (!v20)
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v16, "contentViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v21, "setStoreLaunchURL:sourceApplication:", v22, v6);

LABEL_11:
}

- (void)_presentAppStoreWithLaunchURL:(id)a3 fromSourceApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[8];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppStoreEnabled");

  if ((v9 & 1) != 0)
  {
    -[CKMessagesController currentConversation](self, "currentConversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "unreadCount"))
    {

    }
    else
    {
      -[CKMessagesController currentConversation](self, "currentConversation");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
LABEL_24:
        -[CKMessagesController showConversation:animate:](self, "showConversation:animate:", v18, 0);
        -[CKMessagesController chatController](self, "chatController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[CKMessagesController chatController](self, "chatController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "presentAppStoreForURL:fromSourceApplication:", v6, v7);

        }
LABEL_26:

        goto LABEL_27;
      }
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[CKMessagesController conversationList](self, "conversationList", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "conversations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v24;
LABEL_6:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v15);
        if (!objc_msgSend(v16, "unreadCount"))
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v13)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      v18 = v16;

      if (v18)
        goto LABEL_24;
    }
    else
    {
LABEL_12:

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Asked to launch to app store via open URL, but there are no active conversations. Bailing.", buf, 2u);
      }

    }
    v18 = 0;
    goto LABEL_26;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Asked to launch to app store via open URL, but the app store is not enabled. Bailing.", buf, 2u);
    }

  }
LABEL_27:

}

- (void)dismiss
{
  id v3;

  -[CKMessagesController setStatusBarStyleViewController:](self, "setStatusBarStyleViewController:", 0);
  -[CKMessagesController _setEntryViewHidden:](self, "_setEntryViewHidden:", 0);
  +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_483_0);

}

- (void)_setEntryViewHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  _QWORD v16[4];
  id v17;
  double v18;

  v3 = a3;
  -[CKMessagesController chatController](self, "chatController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CKMessagesController chatController](self, "chatController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      v9 = 0.0;
    else
      v9 = 1.0;
    if (!v3)
      objc_msgSend(v8, "setHidden:", 0);
    v10 = (void *)MEMORY[0x1E0CEABB0];
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __44__CKMessagesController__setEntryViewHidden___block_invoke;
    v16[3] = &unk_1E274C9C0;
    v17 = v8;
    v18 = v9;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __44__CKMessagesController__setEntryViewHidden___block_invoke_2;
    v13[3] = &unk_1E2756068;
    v15 = v3;
    v14 = v17;
    v12 = v17;
    objc_msgSend(v10, "animateWithDuration:animations:completion:", v16, v13, 0.2);

  }
}

uint64_t __44__CKMessagesController__setEntryViewHidden___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __44__CKMessagesController__setEntryViewHidden___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "setHidden:", 1);
  return result;
}

- (void)didBeginInstallingAppWithBundleIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CKAppInstallationWatcher sharedInstance](CKAppInstallationWatcher, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startListeningForAppBundleIdentifier:", v3);

}

- (void)updateCompositionInEntryViewWithComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (-[CKMessagesController isComposingMessage](self, "isComposingMessage"))
    -[CKMessagesController composeChatController](self, "composeChatController");
  else
    -[CKMessagesController chatController](self, "chatController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "composition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "compositionByAppendingComposition:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setComposition:", v7);
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)presentOnboardingViewControllerIfNeeded
{
  void *v3;
  char v4;

  -[CKMessagesController onboardingControllerCreatingIfNecessary](self, "onboardingControllerCreatingIfNecessary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentOnboardingIfNeeded");

  if ((v4 & 1) == 0)
  {
    -[CKMessagesController setOnboardingController:](self, "setOnboardingController:", 0);
    -[CKMessagesController executeDeferredTasks](self, "executeDeferredTasks");
  }
}

- (void)presentOnboardingViewController:(id)a3
{
  id v3;

  -[CKMessagesController onboardingControllerCreatingIfNecessary](self, "onboardingControllerCreatingIfNecessary", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentNicknameSharingSetupFlowWithMemoji:forUserInitiatedEdit:", 0, 0);

}

- (id)presentingViewControllerForOnboardingController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  CKMessagesController *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKMessagesController onboardingController](self, "onboardingController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v7 = self;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Unexpected instance of onboardingController %@", (uint8_t *)&v9, 0xCu);
      }

    }
    v7 = 0;
  }

  return v7;
}

- (void)onboardingControllerDidFinish:(id)a3
{
  -[CKMessagesController setOnboardingController:](self, "setOnboardingController:", 0);
  -[CKMessagesController executeDeferredTasks](self, "executeDeferredTasks");
}

- (id)_fetchMeContactWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D397A8], "keysForNicknameHandling");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchMeContactWithKeys:withError:", v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)presentCKAlertController:(id)a3
{
  -[CKMessagesController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a3, 1, 0);
}

- (void)showBusinessChatNotSupportedAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CANNOT_USE_MESSAGES_FOR_BUSINESS"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BUSINESS_CHAT_IS_CURRENTLY_NOT_SUPPORTED"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v9);
  objc_msgSend(v10, "setPreferredAction:", v9);
  objc_msgSend(v10, "presentFromViewController:animated:completion:", self, 1, 0);

}

- (void)showLockdownAlertForBusinessChat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  IMSharedUtilitiesFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOCKDOWN_BIZ_CHAT_ALERT_TITLE"), &stru_1E276D870, CFSTR("IMSharedUtilities-Offramp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IMSharedUtilitiesFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LOCKDOWN_BIZ_CHAT_ALERT_TEXT"), &stru_1E276D870, CFSTR("IMSharedUtilities-Offramp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAction:", v9);
  objc_msgSend(v10, "setPreferredAction:", v9);
  objc_msgSend(v10, "presentFromViewController:animated:completion:", self, 1, 0);

}

- (id)_newCameraBrowser
{
  void *v2;
  void *v3;
  void *v4;

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForPluginIdentifier:dataSource:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)inboxViewController:(id)a3 didSelectFilterMode:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  void *v43;
  int v44;
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  void *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CKMessagesController conversationListController](self, "conversationListController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      CKConversationListFilterModeStringValue(a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 138412546;
      v45 = v6;
      v46 = 2112;
      v47 = v9;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "inboxViewController: %@ did select filter mode: %@", (uint8_t *)&v44, 0x16u);

    }
  }
  v10 = objc_msgSend(v7, "filterMode") == a4;
  objc_msgSend(v7, "setFilterMode:", a4);
  -[CKMessagesController conversationListController](self, "conversationListController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentScrollView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "__ck_scrollToTop:", 0);

  if (!v10)
  {
    -[CKMessagesController conversationList](self, "conversationList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "releaseWasKnownSenderHold");

    -[CKMessagesController conversationList](self, "conversationList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateConversationsWasKnownSender");

    -[CKMessagesController conversationList](self, "conversationList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clearHoldInUnreadFilter");

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        CKConversationListFilterModeStringValue(a4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138412290;
        v45 = v17;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Filter mode was changed to %@", (uint8_t *)&v44, 0xCu);

      }
    }
    if (a4 != 7 && a4 != 9)
      objc_msgSend(v7, "setEditingMode:", 0);
  }
  if (!-[CKMessagesController isCollapsed](self, "isCollapsed"))
  {
    -[CKMessagesController currentlyShownConversation](self, "currentlyShownConversation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a4 == 7)
    {
      -[CKMessagesController conversationList](self, "conversationList");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "pendingConversation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[CKMessagesController conversationListController](self, "conversationListController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMessagesController conversationListControllerTappedDeleteNewMessage:](self, "conversationListControllerTappedDeleteNewMessage:", v22);

      }
    }
    else if (v18)
    {
      if (objc_msgSend(v18, "isPending"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            -[CKMessagesController composeChatController](self, "composeChatController");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = 138412290;
            v45 = v24;
            _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "currentlyShownConversation is pending. Setting view controllers to %@", (uint8_t *)&v44, 0xCu);

          }
        }
        -[CKMessagesController chatNavigationController](self, "chatNavigationController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMessagesController composeChatController](self, "composeChatController");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v51[0] = v26;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setViewControllers:", v27);

      }
      else
      {
        -[CKMessagesController conversationList](self, "conversationList");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "conversation:includedInFilterMode:", v19, a4);

        if (v29)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              -[CKMessagesController chatController](self, "chatController");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = 138412290;
              v45 = v31;
              _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Should show selected conversation. Setting view controllers to %@", (uint8_t *)&v44, 0xCu);

            }
          }
          -[CKMessagesController chatNavigationController](self, "chatNavigationController");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKMessagesController chatController](self, "chatController");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setViewControllers:", v34);

        }
      }
      goto LABEL_32;
    }
    -[CKMessagesController _populateChatNavigationControllerWithSelection](self, "_populateChatNavigationControllerWithSelection");
LABEL_32:

  }
  if (-[CKMessagesController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout"))
  {
    objc_msgSend(v7, "updateConversationList");
    if (!CKIsRunningInMacCatalyst())
      -[CKMessagesController hideColumn:](self, "hideColumn:", 0);
    -[CKMessagesController showColumn:](self, "showColumn:", 1);
  }
  else if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v7, "updateConversationList");
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "navigationController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "navigationController");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "viewControllers");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 138412802;
        v45 = v7;
        v46 = 2112;
        v47 = v36;
        v48 = 2112;
        v49 = v38;
        _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "Pushing %@ onto %@. Current hierarchy: %@", (uint8_t *)&v44, 0x20u);

      }
    }
    objc_msgSend(v6, "navigationController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "viewControllers");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "containsObject:", v7);

    if ((v41 & 1) != 0)
    {
      IMLogHandleForCategory();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[CKMessagesController inboxViewController:didSelectFilterMode:].cold.1();

    }
    else
    {
      objc_msgSend(v6, "navigationController");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "pushViewController:animated:", v7, 1);

    }
  }

}

- (BOOL)inboxViewController:(id)a3 shouldShowFilterMode:(unint64_t)a4
{
  id v6;
  BOOL v7;
  char v8;

  v6 = a3;
  if (a4 == 9)
  {
    v8 = IMIsOscarEnabled();
LABEL_8:
    v7 = v8;
    goto LABEL_9;
  }
  if (a4 != 6)
  {
    v7 = 1;
    goto LABEL_9;
  }
  if ((IMIsOscarEnabled() & 1) == 0)
  {
    v8 = -[CKMessagesController _spamFilteringEnabled](self, "_spamFilteringEnabled");
    goto LABEL_8;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (BOOL)_spamFilteringEnabled
{
  return CKMessageSpamFilteringEnabled() != 0;
}

- (unint64_t)selectedCountForSelectionViewController:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[CKMessagesController conversationListController](self, "conversationListController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathsForSelectedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (BOOL)areSelectedConversationsBlocked
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[CKMessagesController conversationListController](self, "conversationListController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "chat", (_QWORD)v13);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "isDeletingIncomingMessages");

          if (!v10)
          {
            v11 = 0;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    v11 = 1;
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)secondaryTextForSelectionViewController:(id)a3
{
  void *v4;
  void *v5;

  if (-[CKMessagesController hasRecentlyDeletedFilterSelected](self, "hasRecentlyDeletedFilterSelected", a3))
  {
    -[CKMessagesController _recentlyDeletedDisclosureText](self, "_recentlyDeletedDisclosureText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[CKMessagesController _isApplyingJunkFilter](self, "_isApplyingJunkFilter"))
  {
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("OSCAR_DISCLOSURE_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)deleteButtonPressedOnSelectionViewController:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKMessagesController conversationListController](self, "conversationListController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKMessagesController hasRecentlyDeletedFilterSelected](self, "hasRecentlyDeletedFilterSelected"))
  {
    objc_msgSend(v5, "_permanentDeleteSelectedConversations");
  }
  else if (-[CKMessagesController _isApplyingJunkFilter](self, "_isApplyingJunkFilter"))
  {
    objc_msgSend(v5, "_permanentDeleteSelectedJunkButtonTapped:", 0);
  }
  else
  {
    v6 = -[CKMessagesController currentConversationListFilterMode](self, "currentConversationListFilterMode");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        CKConversationListFilterModeStringValue(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "CKMessagesController - deleteAllButtonPressedOnSelectionViewController: unsupported filterMode: %@. No action executing.", (uint8_t *)&v9, 0xCu);

      }
    }
  }

}

- (void)deleteAllButtonPressedOnSelectionViewController:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKMessagesController _isApplyingJunkFilter](self, "_isApplyingJunkFilter"))
  {
    -[CKMessagesController conversationListController](self, "conversationListController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_permanentDeleteAllJunkButtonTapped:", 0);

  }
  else
  {
    v6 = -[CKMessagesController currentConversationListFilterMode](self, "currentConversationListFilterMode");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        CKConversationListFilterModeStringValue(v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "CKMessagesController - deleteAllButtonPressedOnSelectionViewController: unsupported filterMode: %@. No action executing.", (uint8_t *)&v9, 0xCu);

      }
    }
  }

}

- (void)recoverButtonPressedOnSelectionViewController:(id)a3
{
  id v3;

  -[CKMessagesController conversationListController](self, "conversationListController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_recoverSelectedConversations");

}

- (BOOL)anyConversationsExistFor:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[CKMessagesController conversationList](self, "conversationList", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationsForFilterMode:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (void)selectionViewControllerSelectedCompose
{
  id v2;

  -[CKMessagesController conversationListController](self, "conversationListController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "composeButtonClicked:", 0);

}

- (BOOL)_isMessageFilteringEnabled
{
  return CKMessageFilteringEnabled();
}

- (void)didDismissSendMenu:(id)a3 usingPresentationContext:(id)a4
{
  -[CKMessagesController setSendMenuPresentation:](self, "setSendMenuPresentation:", 0, a4);
}

- (id)newInputSnapshotView
{
  CKCoreChatController *v3;
  CKCoreChatController *v4;
  void *v5;

  if (-[CKMessagesController isComposingMessage](self, "isComposingMessage"))
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v3 = (CKCoreChatController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_chatController;
  }
  v4 = v3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v5 = (void *)-[CKCoreChatController newInputSnapshotView](v4, "newInputSnapshotView");
  else
    v5 = 0;

  return v5;
}

- (void)requestDismissKeyboardSnapshotForSendMenu
{
  CKCoreChatController *v3;
  CKCoreChatController *v4;
  char isKindOfClass;
  CKCoreChatController *v6;

  if (-[CKMessagesController isComposingMessage](self, "isComposingMessage"))
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v3 = (CKCoreChatController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_chatController;
  }
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      -[CKCoreChatController requestDismissKeyboardSnapshotForSendMenu](v6, "requestDismissKeyboardSnapshotForSendMenu");
      v4 = v6;
    }
  }

}

- (void)requestShowKeyboardSnapshotForSendMenu
{
  CKCoreChatController *v3;
  CKCoreChatController *v4;
  char isKindOfClass;
  CKCoreChatController *v6;

  if (-[CKMessagesController isComposingMessage](self, "isComposingMessage"))
  {
    -[CKMessagesController composeChatController](self, "composeChatController");
    v3 = (CKCoreChatController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_chatController;
  }
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v6;
    if ((isKindOfClass & 1) != 0)
    {
      -[CKCoreChatController requestShowKeyboardSnapshotForSendMenu](v6, "requestShowKeyboardSnapshotForSendMenu");
      v4 = v6;
    }
  }

}

- (id)deferredHandleURLBlock
{
  return self->_deferredHandleURLBlock;
}

- (CKMessagesControllerDelegate)messagesControllerDelegate
{
  return (CKMessagesControllerDelegate *)objc_loadWeakRetained((id *)&self->_messagesControllerDelegate);
}

- (void)setConversationListController:(id)a3
{
  objc_storeStrong((id *)&self->_conversationListController, a3);
}

- (void)setComposeChatController:(id)a3
{
  objc_storeStrong((id *)&self->_composeChatController, a3);
}

- (void)setConversationListNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_conversationListNavigationController, a3);
}

- (void)setChatNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_chatNavigationController, a3);
}

- (CKDetailsNavigationController)detailsNavigationController
{
  return (CKDetailsNavigationController *)objc_loadWeakRetained((id *)&self->_detailsNavigationController);
}

- (void)setDetailsNavigationController:(id)a3
{
  objc_storeWeak((id *)&self->_detailsNavigationController, a3);
}

- (UINavigationController)composeChatNavigationController
{
  return self->_composeChatNavigationController;
}

- (void)setComposeChatNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_composeChatNavigationController, a3);
}

- (void)setSelectionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_selectionViewController, a3);
}

- (void)setInboxViewController:(id)a3
{
  objc_storeStrong((id *)&self->_inboxViewController, a3);
}

- (void)setMacToolbarController:(id)a3
{
  objc_storeStrong((id *)&self->_macToolbarController, a3);
}

- (CKSendMenuPresentation)sendMenuPresentation
{
  return self->_sendMenuPresentation;
}

- (void)setSendMenuPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_sendMenuPresentation, a3);
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (CKBrowserViewControllerProtocol)prewarmedCameraBrowser
{
  return self->_prewarmedCameraBrowser;
}

- (void)setPrewarmedCameraBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmedCameraBrowser, a3);
}

- (void)setInboxModel:(id)a3
{
  objc_storeWeak((id *)&self->_inboxModel, a3);
}

- (CKInteractionNotificationView)dismissOnInteractionView
{
  return self->_dismissOnInteractionView;
}

- (void)setDismissOnInteractionView:(id)a3
{
  objc_storeStrong((id *)&self->_dismissOnInteractionView, a3);
}

- (UIViewController)statusBarStyleViewController
{
  return self->_statusBarStyleViewController;
}

- (void)setStatusBarStyleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarStyleViewController, a3);
}

- (CKAlertController)currentSMSRelayPinAlert
{
  return (CKAlertController *)objc_loadWeakRetained((id *)&self->_currentSMSRelayPinAlert);
}

- (void)setCurrentSMSRelayPinAlert:(id)a3
{
  objc_storeWeak((id *)&self->_currentSMSRelayPinAlert, a3);
}

- (NSMutableArray)pendingSMSRelayPINPrompts
{
  return self->_pendingSMSRelayPINPrompts;
}

- (void)setPendingSMSRelayPINPrompts:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSMSRelayPINPrompts, a3);
}

- ($5E9189851FD2AFACF3F6099594984659)columnResizeParams
{
  *($950D5E962FFC93217365F7FF3E242C75 *)retstr = *($950D5E962FFC93217365F7FF3E242C75 *)((char *)self + 1208);
  return self;
}

- (void)setColumnResizeParams:(id *)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3->var2;
  *(_OWORD *)&self->_columnResizeParams.currentDragDistance = *(_OWORD *)&a3->var0;
  *(_QWORD *)&self->_columnResizeParams.proposedPreviouslyIncreasing = v3;
}

- (NSArray)windowToConversationListConstraints
{
  return self->_windowToConversationListConstraints;
}

- (void)setWindowToConversationListConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_windowToConversationListConstraints, a3);
}

- (BOOL)forceOrientation
{
  return self->_forceOrientation;
}

- (void)setForceOrientation:(BOOL)a3
{
  self->_forceOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowToConversationListConstraints, 0);
  objc_storeStrong((id *)&self->_pendingSMSRelayPINPrompts, 0);
  objc_destroyWeak((id *)&self->_currentSMSRelayPinAlert);
  objc_storeStrong((id *)&self->_statusBarStyleViewController, 0);
  objc_storeStrong((id *)&self->_alertUtilities, 0);
  objc_storeStrong((id *)&self->_dismissOnInteractionView, 0);
  objc_destroyWeak((id *)&self->_inboxModel);
  objc_storeStrong((id *)&self->_prewarmedCameraBrowser, 0);
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_sendMenuPresentation, 0);
  objc_storeStrong((id *)&self->_macToolbarController, 0);
  objc_storeStrong((id *)&self->_inboxViewController, 0);
  objc_storeStrong((id *)&self->_selectionViewController, 0);
  objc_storeStrong((id *)&self->_currentConversation, 0);
  objc_storeStrong((id *)&self->_composeChatNavigationController, 0);
  objc_destroyWeak((id *)&self->_detailsNavigationController);
  objc_storeStrong((id *)&self->_chatNavigationController, 0);
  objc_storeStrong((id *)&self->_conversationListNavigationController, 0);
  objc_storeStrong((id *)&self->_composeChatController, 0);
  objc_storeStrong((id *)&self->_chatController, 0);
  objc_storeStrong((id *)&self->_conversationListController, 0);
  objc_destroyWeak((id *)&self->_messagesControllerDelegate);
  objc_storeStrong(&self->_deferredHandleURLBlock, 0);
}

- (void)showInboxViewControllerAnimated:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  const __CFString *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "_shouldShowInboxView"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (objc_msgSend(a1, "_wantsThreeColumnLayout"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Tried to pop to Inbox view controller, but it doesn't exist. shouldShowInboxView:%@, wantsThreeColumnLayout:%@", (uint8_t *)&v6, 0x16u);
}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "weakSelf was unexpectedly nil for zoom transition source view provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "weakConversation was unexpectedly nil for zoom transition source view provider", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __112__CKMessagesController_showConversation_animate_forceToTranscript_keepAllCurrentlyLoadedMessages_userInitiated___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "SourceView was unexpectedly nil for zoom transition", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_sourceViewForFluidTransitionWithConversation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, v0, v1, "Could not find index path for pinned conversation with itemIdentifier: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_sourceViewForFluidTransitionWithConversation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, v0, v1, "Collection view cell for zoom transition was unexpectedly nil for indexPath: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_sourceViewForFluidTransitionWithConversation:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Avatar view for zoom transition was unexpectedly nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_sourceViewForFluidTransitionWithConversation:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, a2, v5, "Collection view cell for zoom transition was of unexpected type: %@", v6);

}

- (void)_sourceViewForFluidTransitionWithConversation:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Attempting to perform zoom transition while the conversation list has a presentedViewController.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_sourceViewForFluidTransitionWithConversation:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Attempting to perform zoom transition with a non pinned conversation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)inboxViewController:didSelectFilterMode:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_2(&dword_18DFCD000, v0, v1, "Tried to push %@, but it's already in the nav controller hierarchy. This shouldn't be possible. Dropping.", v2);
  OUTLINED_FUNCTION_2();
}

@end
