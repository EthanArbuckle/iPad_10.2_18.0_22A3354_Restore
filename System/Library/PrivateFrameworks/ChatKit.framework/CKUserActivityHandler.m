@implementation CKUserActivityHandler

+ (void)messagesScene:(id)a3 willConnectToSession:(id)a4 userActivities:(id)a5 stateRestorationActivity:(id)a6 windowSceneDelegate:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  id v16;

  v16 = a3;
  v10 = a5;
  v11 = a6;
  v12 = a7;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scene:continueUserActivity:", v16, v13);

  }
  else
  {
    objc_msgSend(v11, "activityType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.Messages.StateRestoration"));

    if (v15)
      objc_msgSend(v12, "scene:continueUserActivity:", v16, v11);
  }

}

void __77__CKUserActivityHandler_restoreStateFromUserActivity_withNavigationProvider___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id WeakRetained;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Messages controller deferredHandleURLBlock called, restoring state", v6, 2u);
    }

  }
  v3 = (void *)objc_opt_class();
  v4 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "restoreState:navigationProvider:", v4, WeakRetained);

}

void __109__CKUserActivityHandler_messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___block_invoke()
{
  void **v0;
  void *v1;
  void **v2;
  void *v3;
  void **v4;
  void *v5;

  if (!messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___kCSSearchableItemActivityIdentifier)
  {
    v0 = (void **)MEMORY[0x193FF3C24]("CSSearchableItemActivityIdentifier", CFSTR("CoreSpotlight"));
    if (v0)
      v1 = *v0;
    else
      v1 = 0;
    objc_storeStrong((id *)&messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___kCSSearchableItemActivityIdentifier, v1);
  }
  if (!messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSQueryContinuationActionType)
  {
    v2 = (void **)MEMORY[0x193FF3C24]("CSQueryContinuationActionType", CFSTR("CoreSpotlight"));
    if (v2)
      v3 = *v2;
    else
      v3 = 0;
    objc_storeStrong((id *)&messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSQueryContinuationActionType, v3);
  }
  if (!messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSSearchQueryString)
  {
    v4 = (void **)MEMORY[0x193FF3C24]("CSSearchQueryString", CFSTR("CoreSpotlight"));
    if (v4)
      v5 = *v4;
    else
      v5 = 0;
    objc_storeStrong((id *)&messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSSearchQueryString, v5);
  }
}

+ (BOOL)restoreStateFromUserActivity:(id)a3 withNavigationProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15[2];
  _BYTE buf[12];
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSceneDelegate stateFromUserInfoDictionary:](CKSceneDelegate, "stateFromUserInfoDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v6;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Restoring messages scene state from user activity: %@, with state: %@", buf, 0x16u);
    }

  }
  if (v9)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v7);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__CKUserActivityHandler_restoreStateFromUserActivity_withNavigationProvider___block_invoke;
    v13[3] = &unk_1E274F7E0;
    v15[1] = a1;
    v14 = v9;
    objc_copyWeak(v15, (id *)buf);
    objc_msgSend(v7, "setDeferredHandleURLBlock:", v13);
    objc_destroyWeak(v15);

    objc_destroyWeak((id *)buf);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "State is nil, no state to restore to.", buf, 2u);
    }

  }
  return v9 != 0;
}

+ (BOOL)restoreState:(id)a3 navigationProvider:(id)a4
{
  __CFString *v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  char v10;
  BOOL v11;
  int v13;
  __CFString *v14;
  __CFString *v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  const __CFString *v31;
  const __CFString *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  __CFString *v41;
  id v42;
  NSObject *v43;
  __CFString *v44;
  void *v45;
  NSObject *v46;
  __CFString *v47;
  NSObject *v48;
  NSObject *v49;
  int v50;
  const __CFString *v51;
  NSObject *v52;
  int v53;
  const __CFString *v54;
  NSObject *v55;
  char v56;
  NSObject *v57;
  id v58;
  uint8_t buf[4];
  const __CFString *v60;
  __int16 v61;
  __CFString *v62;
  __int16 v63;
  __CFString *v64;
  __int16 v65;
  const __CFString *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v5;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Restoring state: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "integerForKey:", CFSTR("BypassStateRestore")))
  {
    v9 = objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldMakeUIForDefaultPNG");
    v10 = v5 ? v9 : 1;
    if ((v10 & 1) == 0)
    {
      v13 = -[__CFString composingNewMessage](v5, "composingNewMessage");
      -[__CFString groupID](v5, "groupID");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString unreadLastMessages](v5, "unreadLastMessages");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          if (v13)
            v17 = CFSTR("YES");
          v60 = v17;
          v61 = 2112;
          v62 = v14;
          v63 = 2112;
          v64 = v15;
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Restoring application state. isComposingNew=%@  groupID=%@ unreadLastMessages=%@", buf, 0x20u);
        }

      }
      objc_msgSend(v6, "conversationListController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFilterMode:", -[__CFString filterMode](v5, "filterMode"));

      if (objc_msgSend((id)objc_opt_class(), "_messageUnknownFilteringEnabled"))
      {
        objc_msgSend(v6, "conversationListController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "updateConversationList");

      }
      if (+[CKStarkManager isCarPlayConnected](CKStarkManager, "isCarPlayConnected"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "  => CarPlay screen connected, restoring to converation list to ensure no messages are unintentionally marked as read.", buf, 2u);
          }

        }
        objc_msgSend(v6, "showConversationListWithAnimation:", 0);
LABEL_26:
        v21 = 0;
        goto LABEL_27;
      }
      if (v13)
      {
        if (objc_msgSend(v6, "currentCompositionHasContent"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "  => Already showing transcript or new composition", buf, 2u);
            }

          }
          goto LABEL_26;
        }
        if ((objc_msgSend(v6, "isComposingMessage") & 1) == 0)
        {
          +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0;
          objc_msgSend(v40, "draftForPendingConversationWithRecipients:", &v58);
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v42 = v58;

          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v42, "componentsJoinedByString:", CFSTR(", "));
              v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v60 = v44;
              v61 = 2112;
              v62 = v41;
              _os_log_impl(&dword_18DFCD000, v43, OS_LOG_TYPE_INFO, "  => Showing new message composition panel, recipients=%@   composition=%@", buf, 0x16u);

            }
          }
          objc_msgSend(v6, "showNewMessageCompositionPanelWithRecipients:composition:animated:", v42, v41, 1);

          goto LABEL_26;
        }
      }
      objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "isConnected"))
      {
        +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v24, "loadedConversations"))
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "showsCompositionPanel");

          if (v38)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "  => Showing empty new message composition panel", buf, 2u);
              }

            }
            if ((objc_msgSend(v6, "isComposingMessage") & 1) == 0)
              objc_msgSend(v6, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 1);
            goto LABEL_26;
          }
LABEL_40:
          if (!v14)
            goto LABEL_46;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v60 = v14;
              _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "  => Looking up conversation with group ID: %@", buf, 0xCu);
            }

          }
          if ((-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("-1")) & 1) != 0)
            goto LABEL_46;
          if (CKiMessageSupported())
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "    => Ensuring we have a connection to the daemon before looking up any conversations", buf, 2u);
              }

            }
            objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "blockUntilConnected");

          }
          +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "conversationForExistingChatWithChatIdentifier:", v14);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {

          }
          else
          {
            +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "conversationForExistingChatWithGroupID:", v14);
            v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (!v21)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v57 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v60 = v14;
                  _os_log_impl(&dword_18DFCD000, v57, OS_LOG_TYPE_INFO, "  => No conversation found for ID %@", buf, 0xCu);
                }

              }
LABEL_46:
              v21 = 0;
LABEL_47:
              if (!objc_msgSend(v6, "shouldRestoreToConversationListForState:", v5))
                goto LABEL_69;
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "  => Showing unread conversations", buf, 2u);
                }

              }
              if ((objc_msgSend(v6, "showUnreadConversationsWithLastConversation:ignoringMessages:", v21, v15) & 1) == 0)
              {
LABEL_69:
                -[__CFString chat](v21, "chat");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "lastMessage");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = v28 != 0;

                if (!v21)
                  v29 = 0;
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                  {
                    v31 = CFSTR("NO");
                    *(_DWORD *)buf = 138413058;
                    if (v29)
                      v32 = CFSTR("YES");
                    else
                      v32 = CFSTR("NO");
                    v60 = v32;
                    v61 = 2112;
                    v62 = v21;
                    if (!v28)
                      v31 = CFSTR("YES");
                    v63 = 2112;
                    v64 = v14;
                    v65 = 2112;
                    v66 = v31;
                    _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "  => canRestoreToLastConversation: %@, lastConversation: %@, groupID: %@, isConversationEmpty: %@", buf, 0x2Au);
                  }

                }
                if (!v29)
                  goto LABEL_70;
                if (IMOSLoggingEnabled())
                {
                  OSLogHandleForIMFoundationCategory();
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_18DFCD000, v33, OS_LOG_TYPE_INFO, "  => Restoring to last conversation", buf, 2u);
                  }

                }
                if ((objc_msgSend(v6, "resumeToConversation:", v21) & 1) == 0)
                {
LABEL_70:
                  if (!-[__CFString showingInbox](v5, "showingInbox"))
                  {
                    v11 = 0;
                    goto LABEL_28;
                  }
                  objc_msgSend(v6, "showInboxViewControllerAnimated:", 0);
                }
              }
LABEL_27:
              v11 = 1;
LABEL_28:

              goto LABEL_11;
            }
          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v60 = v21;
              _os_log_impl(&dword_18DFCD000, v46, OS_LOG_TYPE_INFO, "  => Found conversation: %@", buf, 0xCu);
            }

          }
          -[__CFString unsentComposition](v21, "unsentComposition");
          v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v60 = v47;
              _os_log_impl(&dword_18DFCD000, v48, OS_LOG_TYPE_INFO, "  => Found composition: %@", buf, 0xCu);
            }

          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v49 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              v50 = -[__CFString hasNonwhiteSpaceContent](v47, "hasNonwhiteSpaceContent");
              v51 = CFSTR("NO");
              if (v50)
                v51 = CFSTR("YES");
              *(_DWORD *)buf = 138412290;
              v60 = v51;
              _os_log_impl(&dword_18DFCD000, v49, OS_LOG_TYPE_INFO, "    => Found composition has non-whitespace: %@", buf, 0xCu);
            }

          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              v53 = -[__CFString hasContent](v47, "hasContent");
              v54 = CFSTR("NO");
              if (v53)
                v54 = CFSTR("YES");
              *(_DWORD *)buf = 138412290;
              v60 = v54;
              _os_log_impl(&dword_18DFCD000, v52, OS_LOG_TYPE_INFO, "    => Found composition has content: %@", buf, 0xCu);
            }

          }
          if ((-[__CFString hasContent](v47, "hasContent") & 1) != 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v60 = v21;
                _os_log_impl(&dword_18DFCD000, v55, OS_LOG_TYPE_INFO, "  => Conversation has unsent content, restoring to it: %@", buf, 0xCu);
              }

            }
            v56 = objc_msgSend(v6, "resumeToConversation:", v21);

            if ((v56 & 1) != 0)
              goto LABEL_27;
          }
          else
          {

          }
          goto LABEL_47;
        }

      }
      goto LABEL_40;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

+ (void)messagesScene:(id)a3 continueUserActivity:(id)a4 withNavigationProvider:(id)a5 chatController:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  uint64_t v68;
  void *v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  _QWORD aBlock[4];
  id v75;
  uint8_t buf[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v12, "activityType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.Messages.StateRestoration"));

  if (v17)
  {
    objc_msgSend((id)objc_opt_class(), "restoreStateFromUserActivity:withNavigationProvider:", v12, v13);
    goto LABEL_3;
  }
  objc_msgSend(v12, "activityType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB3418]);

  if (!v23)
  {
    objc_msgSend(v12, "activityType");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("com.apple.Messages.BackgroundCollaboration"));

    if (v42)
    {
      objc_msgSend((id)objc_opt_class(), "sendBackgroundCollaborationForUserActivity:withNavigationProvider:chatController:completion:", v12, v13, v14, v15);
    }
    else
    {
      objc_msgSend(v12, "activityType");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("StagedActivityData"));

      if (v44)
      {
        v45 = (void *)MEMORY[0x1E0CB3710];
        v46 = objc_opt_class();
        objc_msgSend(v12, "userInfo");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x1E0DBD770]);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "unarchivedObjectOfClass:fromData:error:", v46, v48, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = (void *)MEMORY[0x1E0CB3710];
        v50 = objc_opt_class();
        objc_msgSend(v12, "userInfo");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("currentMembers"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "unarchivedObjectOfClass:fromData:error:", v50, v52, 0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          +[CKComposition compositionForTUConversationActivity:](CKComposition, "compositionForTUConversationActivity:", v21);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "showNewMessageCompositionPanelWithRecipients:composition:animated:", v53, v54, 0);

        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            CKLogCStringForType(33);
            OSLogHandleForIMFoundationCategory();
            v63 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18DFCD000, v63, OS_LOG_TYPE_INFO, "Failed to unarchive activity.", buf, 2u);
            }

          }
          if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
            _CKLogExternal();
        }

        goto LABEL_52;
      }
    }
LABEL_3:
    v18 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v12, "userInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0D35460]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "URLWithString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend((id)objc_opt_class(), "openURL:animate:sourceApplication:originatingProcess:navigationProvider:chatController:completion:", v21, objc_msgSend(v11, "activationState") == 0, 0, 0, v13, v14, v15);
LABEL_52:

      goto LABEL_53;
    }
    if (messagesScene_continueUserActivity_withNavigationProvider_chatController_completion__onceToken != -1)
      dispatch_once(&messagesScene_continueUserActivity_withNavigationProvider_chatController_completion__onceToken, &__block_literal_global_216);
    v70 = v11;
    if (messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___kCSSearchableItemActivityIdentifier)
    {
      objc_msgSend(v12, "userInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKey:", messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___kCSSearchableItemActivityIdentifier);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v33 = v32;
        if (objc_msgSend(v33, "hasPrefix:", CFSTR("at_")))
        {
          objc_msgSend(v33, "componentsSeparatedByString:", CFSTR("_"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "lastObject");
          v35 = objc_claimAutoreleasedReturnValue();

          v33 = (id)v35;
        }
        v36 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __109__CKUserActivityHandler_messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___block_invoke_2;
        aBlock[3] = &unk_1E2758CA8;
        v75 = v13;
        v37 = _Block_copy(aBlock);
        objc_msgSend(MEMORY[0x1E0D35788], "sharedInstance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = v36;
        v71[1] = 3221225472;
        v71[2] = __109__CKUserActivityHandler_messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___block_invoke_3;
        v71[3] = &unk_1E2758CD0;
        v72 = v33;
        v73 = v37;
        v39 = v33;
        v40 = v37;
        objc_msgSend(v38, "loadMessageWithGUID:completionBlock:", v39, v71);

        goto LABEL_51;
      }
      if (messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSQueryContinuationActionType
        && messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSSearchQueryString)
      {
        objc_msgSend(v12, "activityType");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSQueryContinuationActionType, "isEqualToString:", v56))
        {
          objc_msgSend(v12, "userInfo");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectForKey:", messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___CSSearchQueryString);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "performSearchForQuery:", v58);
          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "testPerformSearchDelegate");
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (v60)
          {
            objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "testPerformSearchDelegate");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "testPerformSearch:", v58);

          }
          goto LABEL_50;
        }

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(33);
        OSLogHandleForIMFoundationCategory();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v55, OS_LOG_TYPE_INFO, "Couldn't find CoreSpotlight symbols", buf, 2u);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
        _CKLogExternal();
    }
    objc_msgSend(v12, "interaction");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "intent");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "interaction");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SMSApplicationIntentsHelper isSendMessageInteraction:](SMSApplicationIntentsHelper, "isSendMessageInteraction:", v56))
    {
      objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      +[SMSApplicationIntentsHelper continueWithSendMessageInteraction:chatRegistry:navigationProvider:conversationList:chatController:](SMSApplicationIntentsHelper, "continueWithSendMessageInteraction:chatRegistry:navigationProvider:conversationList:chatController:", v56, v65, v13, v66, v14);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v69 = v32;
        v67 = v32;
        objc_msgSend(v67, "payee");
        v68 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_50:

LABEL_51:
          v11 = v70;
          goto LABEL_52;
        }
        v69 = v32;
        v67 = v32;
        objc_msgSend(v67, "payer");
        v68 = objc_claimAutoreleasedReturnValue();
      }
      v65 = (void *)v68;
      objc_msgSend(v67, "currencyAmount");
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = v69;
      objc_msgSend((id)objc_opt_class(), "_showPeerPaymentUIForPerson:amount:navigationProvider:chatController:", v65, v66, v13, v14);
    }

    goto LABEL_50;
  }
  v24 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v12, "webpageURL");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "ckSMSURLFromBusinessChatURL:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
    goto LABEL_3;
  v27 = objc_msgSend(v11, "activationState") == 0;
  v28 = (void *)objc_opt_class();
  objc_msgSend(v12, "_sourceApplication");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_originatingProcess");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "openURL:animate:sourceApplication:originatingProcess:navigationProvider:chatController:completion:", v26, v27, v29, v30, v13, v14, v15);

LABEL_53:
}

+ (void)loadConversationWithMessageGUID:(id)a3 withInlineReplyOverlay:(BOOL)a4 navigationProvider:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0D35788], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__CKUserActivityHandler_loadConversationWithMessageGUID_withInlineReplyOverlay_navigationProvider___block_invoke;
  v12[3] = &unk_1E274B380;
  v13 = v8;
  v14 = v7;
  v15 = a4;
  v10 = v7;
  v11 = v8;
  objc_msgSend(v9, "loadMessageWithGUID:completionBlock:", v10, v12);

}

+ (BOOL)_messageUnknownFilteringEnabled
{
  return CKMessageUnknownFilteringEnabled() != 0;
}

+ (void)chatScene:(id)a3 willConnectToSession:(id)a4 userActivities:(id)a5 urlContexts:(id)a6 windowSceneDelegate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v13, "anyObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    || (objc_msgSend(v12, "stateRestorationActivity"), (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v16;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Chat Scene - Found non-state restoration user activity in connection options: %@", (uint8_t *)&v19, 0xCu);
      }

    }
    objc_msgSend(v15, "scene:continueUserActivity:", v11, v16);
  }
  if (v14)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v14;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Chat Scene - Found non-state restoration url contexts in connection options: %@", (uint8_t *)&v19, 0xCu);
      }

    }
    objc_msgSend(v15, "scene:openURLContexts:", v11, v14);
  }

}

+ (void)chatScene:(id)a3 openURLContexts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unsigned __int8 v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Chat Scene - opening url: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v12, "chatForURL:outMessageText:outRecipientIDs:outService:outMessageGUID:presentOverlay:", v10, 0, 0, 0, &v19, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;

    objc_msgSend(v5, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "loadAndShowConversationWithMessageGUID:withInlineReplyOverlay:", v14, v20);
    }
    else
    {
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "conversationForExistingChat:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "showConversation:", v18);
    }

  }
}

uint64_t __109__CKUserActivityHandler_messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "showConversationAndMessageForChatGUID:messageGUID:animate:", a2, a3, 0);
}

void __109__CKUserActivityHandler_messagesScene_continueUserActivity_withNavigationProvider_chatController_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a3, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, *(_QWORD *)(a1 + 32));

}

+ (void)sendBackgroundCollaborationForUserActivity:(id)a3 withNavigationProvider:(id)a4 chatController:(id)a5 completion:(id)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  void *v38;
  id v39;
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v41 = a4;
  v39 = a5;
  v40 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Received user activity to send background collaboration with userInfo: %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "conversationManager");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend((id)v13, "activeConversations");

  objc_msgSend(v9, "_originatingProcess");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v15, "hasEntitlement:", CFSTR("com.apple.private.messages.collaboration-initiate-send"));

  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v16, "beginBackgroundTaskWithExpirationHandler:", &__block_literal_global_137_0);

    objc_msgSend(v9, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("shud"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)MEMORY[0x1E0CB3710];
      v19 = (void *)MEMORY[0x1E0C99E60];
      v20 = objc_opt_class();
      v21 = objc_opt_class();
      v22 = objc_opt_class();
      v23 = objc_opt_class();
      v24 = objc_opt_class();
      v25 = objc_opt_class();
      v26 = objc_opt_class();
      objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, v24, v25, v26, objc_opt_class(), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v27, v38, &v46);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v46;

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v28;
          _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Unarchived dictionary from user activity data: %@", buf, 0xCu);
        }

      }
      if (v28)
      {
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __117__CKUserActivityHandler_sendBackgroundCollaborationForUserActivity_withNavigationProvider_chatController_completion___block_invoke_148;
        v42[3] = &unk_1E2758CF8;
        v43 = v9;
        v45 = v36;
        v44 = v41;
        objc_msgSend(a1, "compositionFromDictionary:completion:", v28, v42);

        v31 = v43;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "No shud data so cannot send the collaboration", buf, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "endBackgroundTask:", v36);
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "Found no shud data on user activity so not able to share collaboration with FaceTime", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "endBackgroundTask:", v36);
    }

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "_originatingProcess");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v48 = v9;
      v49 = 2112;
      v50 = CFSTR("com.apple.private.messages.collaboration-initiate-send");
      v51 = 2112;
      v52 = v33;
      _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "received userActivity: (%@) to send collaboration but the originating process was missing the entitlement: %@ to do so: %@ ", buf, 0x20u);

    }
  }

}

void __117__CKUserActivityHandler_sendBackgroundCollaborationForUserActivity_withNavigationProvider_chatController_completion___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_18DFCD000, v0, OS_LOG_TYPE_INFO, "Background task expired for sending a background collaboration", v1, 2u);
    }

  }
}

void __117__CKUserActivityHandler_sendBackgroundCollaborationForUserActivity_withNavigationProvider_chatController_completion___block_invoke_148(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Created composition %@ from dictionary", (uint8_t *)&v17, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FaceTimeUUID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "existingConversationForFaceTimeConversationUUID:", v6),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v8;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Found FaceTime conversation for collaboration %@", (uint8_t *)&v17, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "chatForFaceTimeConversation:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11
      && (+[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v12, "conversationForExistingChat:", v11),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v12,
          v13))
    {
      objc_msgSend(*(id *)(a1 + 40), "showConversation:animate:", v13, 0);
      objc_msgSend(*(id *)(a1 + 40), "chatController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setSourceApplicationID:", CFSTR("com.apple.FaceTime"));
      +[CKFaceTimeCollaborationUtilities startCollaborationWithComposition:faceTimeConversation:imChat:chatController:backgroundTaskID:](CKFaceTimeCollaborationUtilities, "startCollaborationWithComposition:faceTimeConversation:imChat:chatController:backgroundTaskID:", v3, v8, v11, v14, *(_QWORD *)(a1 + 48));

    }
    else
    {
      IMLogHandleForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __117__CKUserActivityHandler_sendBackgroundCollaborationForUserActivity_withNavigationProvider_chatController_completion___block_invoke_148_cold_1((uint64_t *)(a1 + 32), v11 == 0, v16);

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "endBackgroundTask:", *(_QWORD *)(a1 + 48));
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v6;
        _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Did not find FaceTime conversation with UUID %@", (uint8_t *)&v17, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endBackgroundTask:", *(_QWORD *)(a1 + 48));
  }

}

+ (void)compositionFromDictionary:(id)a3 completion:(id)a4
{
  void *v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  const __CFString *v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  _BYTE *v40;
  _QWORD *v41;
  __int128 *v42;
  uint64_t *v43;
  _QWORD v44[5];
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  __int128 v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  _BYTE v59[20];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "allKeys");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "All keys in collaborationDictionary = %@", buf, 0xCu);

    }
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("fileObjects"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("fileURLs"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("CKShare"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("CollaborationOptions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__64;
  v50 = __Block_byref_object_dispose__64;
  v51 = 0;
  objc_msgSend(v6, "objectForKey:", CFSTR("CollaborationShareOptions"));
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v47[5];
  if (v13)
    v14 = 1;
  else
    v14 = v12 == 0;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CD7420], "shareOptionsWithOptionsGroups:", v12);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v47[5];
    v47[5] = v15;

    v13 = v47[5];
  }
  if (!v13 && v12)
  {
    objc_msgSend(MEMORY[0x1E0CD7420], "shareOptionsWithOptionsGroups:", v12);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v47[5];
    v47[5] = v17;

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("CollaborationMetadata"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("CollaborationMode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = CFSTR("NO");
      v23 = (uint64_t (*)(uint64_t, uint64_t))v47[5];
      if (v20)
        v22 = CFSTR("YES");
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v11;
      *(_WORD *)&buf[22] = 2112;
      v58 = v23;
      *(_WORD *)v59 = 2112;
      *(_QWORD *)&v59[2] = v34;
      *(_WORD *)&v59[10] = 2112;
      *(_QWORD *)&v59[12] = v22;
      _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Data received from collaborationDictionary: fileObject: %@, cloudKitObjects: %@, share options: %@, metadata: %@, isCollaborative: %@", buf, 0x34u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v34;
      _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "CollaborationMetadata from collaborationDictionary %@", buf, 0xCu);
    }

  }
  if (objc_msgSend(v10, "count") && objc_msgSend(v35, "count"))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("fileURLs"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUserActivityHandler createPluginPayloadForFileProvider:sendCopyFileURLs:](CKUserActivityHandler, "createPluginPayloadForFileProvider:sendCopyFileURLs:", v25, MEMORY[0x1E0C9AA60]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v11, "count"))
  {
    +[CKUserActivityHandler createPluginPayloadForCloudKitPlusCollaborationMetadata:shareOptions:](CKUserActivityHandler, "createPluginPayloadForCloudKitPlusCollaborationMetadata:shareOptions:", v11, v47[5]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  objc_msgSend(v26, "setSendAsCopy:", v20 ^ 1u);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend((id)v47[5], "summary");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v27)
    {
      CKFrameworkBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DEFAULT_COLLABORATION_OPTIONS_SUMMARY"), &stru_1E276D870, CFSTR("ChatKit"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v26, "setCollaborationOptionsSummary:", v28);
    if (!v27)
    {

    }
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v58 = __Block_byref_object_copy__64;
  *(_QWORD *)v59 = __Block_byref_object_dispose__64;
  *(_QWORD *)&v59[8] = 0;
  objc_msgSend(v6, "objectForKey:", CFSTR("token"));
  *(_QWORD *)&v59[8] = objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      LODWORD(v52) = 138412290;
      *(_QWORD *)((char *)&v52 + 4) = v30;
      _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "kevin@@@ token %@", (uint8_t *)&v52, 0xCu);
    }

  }
  *(_QWORD *)&v52 = 0;
  *((_QWORD *)&v52 + 1) = &v52;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__64;
  v55 = __Block_byref_object_dispose__64;
  v56 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__64;
  v44[4] = __Block_byref_object_dispose__64;
  v45 = 0;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __62__CKUserActivityHandler_compositionFromDictionary_completion___block_invoke;
  v36[3] = &unk_1E2758D70;
  v31 = v26;
  v37 = v31;
  v32 = v35;
  v38 = v32;
  v40 = buf;
  v41 = v44;
  v42 = &v52;
  v43 = &v46;
  v33 = v7;
  v39 = v33;
  +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v31, v36);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v46, 8);

}

void __62__CKUserActivityHandler_compositionFromDictionary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "payloadCollaborationType") == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v7;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "FileProvider backed collaboration. Loading media object object from item at url: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v9)
    {
      objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      v10 = sandbox_extension_consume() == -1;
      v11 = IMOSLoggingEnabled();
      if (v10)
      {
        if (v11)
        {
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v17;
            _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Failed to consume sandbox token: %@", (uint8_t *)&buf, 0xCu);
          }
          goto LABEL_24;
        }
      }
      else if (v11)
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Succesfully consumed sandbox token", (uint8_t *)&buf, 2u);
        }
LABEL_24:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "No sandbox token", (uint8_t *)&buf, 2u);
      }
      goto LABEL_24;
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__64;
    v36 = __Block_byref_object_dispose__64;
    v37 = 0;
    objc_msgSend(*(id *)(a1 + 32), "url");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastPathComponent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringByRemovingPercentEncoding");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __62__CKUserActivityHandler_compositionFromDictionary_completion___block_invoke_178;
    v24[3] = &unk_1E2758D48;
    v29 = *(_QWORD *)(a1 + 64);
    v20 = v7;
    v21 = *(_QWORD *)(a1 + 72);
    v25 = v20;
    v30 = v21;
    v22 = v5;
    v23 = *(_QWORD *)(a1 + 80);
    v26 = v22;
    v31 = v23;
    v27 = *(id *)(a1 + 32);
    v28 = *(id *)(a1 + 48);
    p_buf = &buf;
    +[CKComposition mediaObjectFromItemAtURL:filename:completion:](CKComposition, "mediaObjectFromItemAtURL:filename:completion:", v20, v19, v24);

    _Block_object_dispose(&buf, 8);
    goto LABEL_26;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Collaboration is not backed by FP. Will not load media object.", (uint8_t *)&buf, 2u);
    }

  }
  objc_msgSend(v5, "compositionWithCollaborationShareOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_26:

}

void __62__CKUserActivityHandler_compositionFromDictionary_completion___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v26 = v6;
      v27 = 2112;
      v28 = v9;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Created mediaObject: %@ from url: %@. Error: %@", buf, 0x20u);
    }

  }
  +[CKComposition compositionWithShelfMediaObject:](CKComposition, "compositionWithShelfMediaObject:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "compositionByAppendingComposition:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "compositionWithCollaborationShareOptions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  objc_msgSend(*(id *)(a1 + 48), "collaborationMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = IMOSLoggingEnabled();
  if (v17)
  {
    if (v18)
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "PluginPayload already has collaboration metadata so not updating now", buf, 2u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (v18)
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v26 = v21;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Did not receive metadata for file URL %@ , fetching metadata", buf, 0xCu);
      }

    }
    v22 = *(id *)(a1 + 48);
    v23 = *(id *)(a1 + 32);
    v24 = *(id *)(a1 + 56);
    SWCollaborationMetadataForDocumentURL();

  }
}

void __62__CKUserActivityHandler_compositionFromDictionary_completion___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v11 = 138412546;
        v12 = v8;
        v13 = 2112;
        v14 = v6;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "error loading collaboration metadata for documentURL: %@ error:%@", (uint8_t *)&v11, 0x16u);
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCollaborationMetadata:", v5);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v11 = 138412546;
        v12 = v5;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Received updated collaborationMetadata: %@ for document url: %@", (uint8_t *)&v11, 0x16u);
      }

    }
    +[CKUserActivityHandler fileProviderCompositionFromPluginPayload:url:shareOptions:previousComposition:completion:](CKUserActivityHandler, "fileProviderCompositionFromPluginPayload:url:shareOptions:previousComposition:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 48));
  }

}

+ (void)fileProviderCompositionFromPluginPayload:(id)a3 url:(id)a4 shareOptions:(id)a5 previousComposition:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke;
  v21[3] = &unk_1E2758DC0;
  v22 = v12;
  v23 = v11;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v11;
  v20 = v12;
  +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v19, v21);

}

void __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke_2;
  v5[3] = &unk_1E274CE68;
  v6 = a1[4];
  v7 = v3;
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11 = a1[8];
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0D11690];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke_3;
  v4[3] = &unk_1E2758D98;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  objc_msgSend(v2, "userNameAndEmail:containerSetupInfo:completionHandler:", v3, 0, v4);

}

void __114__CKUserActivityHandler_fileProviderCompositionFromPluginPayload_url_shareOptions_previousComposition_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(id *)(a1 + 32);
  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v9;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Error while trying to get the user name and email : %@.", (uint8_t *)&v19, 0xCu);
      }

    }
    objc_msgSend(v10, "shelfPluginPayload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSendAsCopy:", 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "collaborationMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v13, "copy");

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v19 = 138412290;
        v20 = v8;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Setting initiatorHandle to: %@", (uint8_t *)&v19, 0xCu);
      }

    }
    objc_msgSend(v12, "setInitiatorHandle:", v8);
    v15 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    objc_msgSend(v15, "personNameComponentsFromString:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInitiatorNameComponents:", v16);
    objc_msgSend(*(id *)(a1 + 40), "setCollaborationMetadata:", v12);
    objc_msgSend(v10, "compositionByAppendingText:shelfPluginPayload:shelfMediaObject:collaborationShareOptions:", 0, *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "compositionByAppendingComposition:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    v10 = (id)v17;
  }

}

+ (void)processAppleEventDictionary:(id)a3 animate:(BOOL)a4 navigationProvider:(id)a5 chatController:(id)a6
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v8 = a3;
  v9 = a5;
  v10 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Processing Apple Event Dictionary", v12, 2u);
    }

  }
}

+ (id)conversationfromLaunchEventContext:(id)a3
{
  return 0;
}

+ (id)createPluginPayloadForFileProvider:(id)a3 sendCopyFileURLs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "FileURL = %@, sendCopyURLs = %@", (uint8_t *)&v12, 0x16u);
    }

  }
  +[CKBrowserItemPayload createBrowserItemPayloadWithURL:data:](CKBrowserItemPayload, "createBrowserItemPayloadWithURL:data:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPayloadCollaborationType:", 1);
  objc_msgSend(v10, "setSendAsCopyURL:", v8);

  return v10;
}

+ (id)createPluginPayloadForCloudKit:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("share"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v6 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Received error while unarchiving the ckshare. Error:%@", buf, 0xCu);
    }

  }
  objc_msgSend(v5, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBrowserItemPayload createBrowserItemPayloadWithURL:data:](CKBrowserItemPayload, "createBrowserItemPayloadWithURL:data:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPayloadCollaborationType:", 2);
  objc_msgSend(v9, "setCloudKitShare:", v5);

  return v9;
}

+ (id)createPluginPayloadForCloudKitPlusCollaborationMetadata:(id)a3 shareOptions:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void (**v16)(void *, void *);
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  __CFString *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD aBlock[6];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  id v54;
  uint8_t v55[4];
  id v56;
  uint8_t v57[128];
  __int128 buf;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v35 = a4;
  v36 = v5;
  objc_msgSend(v5, "objectForKey:", CFSTR("share"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0x1E0CB3000uLL;
  v54 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v39, &v54);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v54;
  if (v8 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Received error while unarchiving the ckshare. Error:%@", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(v7, "URL");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBrowserItemPayload createBrowserItemPayloadWithURL:data:](CKBrowserItemPayload, "createBrowserItemPayloadWithURL:data:", v40, 0);
  v41 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setPayloadCollaborationType:", 2);
  objc_msgSend(v41, "setCloudKitShare:", v7);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Creating metadata from CKShare", (uint8_t *)&buf, 2u);
    }

  }
  objc_msgSend(v40, "fragment");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%@"), v38);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "absoluteString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", v11, &stru_1E276D870);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v34 = &stru_1E276D870;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A88]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (!objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC528])
    || !objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC4A0])
    || !objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC4B8])
    || (objc_msgSend(v13, "conformsToType:", *MEMORY[0x1E0CEC5F8]) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Setting contentType to nil for a non file type. was: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    v13 = 0;
  }
  objc_msgSend(v7, "currentUserParticipant");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__64;
  v61 = __Block_byref_object_dispose__64;
  v62 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__64;
  v52 = __Block_byref_object_dispose__64;
  v53 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__CKUserActivityHandler_createPluginPayloadForCloudKitPlusCollaborationMetadata_shareOptions___block_invoke;
  aBlock[3] = &unk_1E2758DE8;
  aBlock[4] = &buf;
  aBlock[5] = &v48;
  v16 = (void (**)(void *, void *))_Block_copy(aBlock);
  v16[2](v16, v15);
  if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    v33 = v8;
    objc_msgSend(v7, "allParticipants");
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v44;
      while (2)
      {
        v20 = v6;
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (objc_msgSend(v22, "role") == 1)
          {
            v16[2](v16, v22);
            v6 = v20;
            goto LABEL_36;
          }
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
        v6 = v20;
        if (v18)
          continue;
        break;
      }
    }
LABEL_36:

    v8 = v33;
  }
  objc_msgSend(v36, "objectForKey:", CFSTR("setupInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = *(void **)(v6 + 1808);
  v42 = v8;
  objc_msgSend(v24, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v23, &v42);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v42;

  if (v26 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v55 = 138412290;
      v56 = v26;
      _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Received error while unarchiving the CKContainerSetupInfo. Error:%@", v55, 0xCu);
    }

  }
  v28 = objc_alloc(MEMORY[0x1E0CD7400]);
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0C94A80]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v28, "initWithCollaborationIdentifier:title:defaultShareOptions:creationDate:contentType:initiatorHandle:initiatorNameComponents:containerSetupInfo:sourceProcessData:", v34, v29, v35, v30, v13, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v49[5], v25, 0);

  objc_msgSend(v41, "setCollaborationMetadata:", v31);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&buf, 8);
  return v41;
}

void __94__CKUserActivityHandler_createPluginPayloadForCloudKitPlusCollaborationMetadata_shareOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "userIdentity");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lookupInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "phoneNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(v3, "emailAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);
  if (!v4)

  objc_msgSend(v9, "nameComponents");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

+ (id)createPluginPayloadForPendingCollaboration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "collaborationMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBrowserItemPayload createBrowserItemPayloadWithURL:data:](CKBrowserItemPayload, "createBrowserItemPayloadWithURL:data:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initiatorHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Initiator handle is nil. Defaulting to send as copy.", (uint8_t *)&v12, 2u);
      }

    }
    objc_msgSend(v7, "setSendAsCopy:", 1);
  }
  objc_msgSend(v7, "setCollaborationMetadata:", v4);
  objc_msgSend(v7, "setPayloadCollaborationType:", 3);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412802;
      v13 = v6;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Creating a pluginPayload with url: %@, metadata: %@, options: %@", (uint8_t *)&v12, 0x20u);
    }

  }
  return v7;
}

+ (id)createPluginPayloadForCloudKitWithLaunchContext:(id)a3
{
  id v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Calling createPluginPayloadForCloudKitWithLaunchContext: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return 0;
}

+ (void)setChatControllerCompositionForConversation:(id)a3 navigationProvider:(id)a4 composition:(id)a5
{
  id v6;
  id v7;

  if (a3)
  {
    v6 = a5;
    objc_msgSend(a4, "chatController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    +[CKUserActivityHandler updateChatController:composition:](CKUserActivityHandler, "updateChatController:composition:");

  }
  else
  {
    v7 = a5;
    objc_msgSend(a4, "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0);
  }

}

+ (void)setupFinalCompositionWithExistingComposition:(id)a3 withPluginPayloadComposition:(id)a4 shareOptions:(id)a5 conversation:(id)a6 animated:(BOOL)a7 navigationProvider:(id)a8
{
  _BOOL8 v9;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;

  v9 = a7;
  v21 = a6;
  v13 = a8;
  +[CKUserActivityHandler finalCompositionFromExistingComposition:pluginPayloadComposition:shareOptions:](CKUserActivityHandler, "finalCompositionFromExistingComposition:pluginPayloadComposition:shareOptions:", a3, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 && (objc_msgSend(v21, "isPlaceholder") & 1) == 0)
  {
    +[CKUserActivityHandler showConversation:animated:navigationProvider:](CKUserActivityHandler, "showConversation:animated:navigationProvider:", v21, v9, v13);
    if (!v14)
      goto LABEL_5;
    goto LABEL_4;
  }
  v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v21, "recipients");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

  objc_msgSend(v21, "recipients");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __153__CKUserActivityHandler_setupFinalCompositionWithExistingComposition_withPluginPayloadComposition_shareOptions_conversation_animated_navigationProvider___block_invoke;
  v25 = &unk_1E2758E10;
  v26 = v17;
  v19 = v17;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", &v22);

  objc_msgSend(v13, "showNewMessageCompositionPanelWithRecipients:composition:animated:", v19, v14, 1);
  if (v14)
  {
LABEL_4:
    objc_msgSend(v13, "chatController", v21, v22, v23, v24, v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUserActivityHandler updateChatController:composition:](CKUserActivityHandler, "updateChatController:composition:", v20, v14);

  }
LABEL_5:

}

void __153__CKUserActivityHandler_setupFinalCompositionWithExistingComposition_withPluginPayloadComposition_shareOptions_conversation_animated_navigationProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "rawAddress");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (id)finalCompositionFromExistingComposition:(id)a3 pluginPayloadComposition:(id)a4 shareOptions:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  if (a3)
  {
    objc_msgSend(a3, "compositionByAppendingComposition:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;
  objc_msgSend(v9, "compositionWithCollaborationShareOptions:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)showConversation:(id)a3 animated:(BOOL)a4 navigationProvider:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  v7 = a5;
  objc_msgSend(v7, "showConversation:animate:", a3, v5);
  objc_msgSend(v7, "conversationListController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateConversationList");

  objc_msgSend(v7, "conversationListController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "conversationList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateConversationsWasKnownSender");

}

+ (void)updateChatController:(id)a3 composition:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = a3;
  objc_msgSend(v7, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUnsentComposition:", 0);

  objc_msgSend(v7, "setComposition:", v5);
}

+ (void)openURL:(id)a3 animate:(BOOL)a4 sourceApplication:(id)a5 originatingProcess:(id)a6 navigationProvider:(id)a7 chatController:(id)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  BOOL v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v40 = v15;
      v41 = 2112;
      v42 = v16;
      _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Opening url: %@ from source application: %@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v15, "ckIsUnitTestingURL"))
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_handleUnitTestInvocation:", v15);
  }
  else
  {
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __123__CKUserActivityHandler_openURL_animate_sourceApplication_originatingProcess_navigationProvider_chatController_completion___block_invoke;
    v30 = &unk_1E2758E38;
    v23 = v15;
    v31 = v23;
    v37 = a1;
    v38 = a4;
    v24 = v18;
    v32 = v24;
    v33 = v19;
    v34 = v17;
    v35 = v16;
    v36 = v20;
    v25 = (void (**)(_QWORD))_Block_copy(&v27);
    if (objc_msgSend(v23, "ckShouldSendImmediately", v27, v28, v29, v30))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v23;
          _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Not allowing deferral url handle block for url: %@", buf, 0xCu);
        }

      }
      v25[2](v25);
    }
    else
    {
      objc_msgSend(v24, "setDeferredHandleURLBlock:", v25);
    }

    v22 = v31;
  }

}

uint64_t __123__CKUserActivityHandler_openURL_animate_sourceApplication_originatingProcess_navigationProvider_chatController_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t result;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;

  objc_msgSend(*(id *)(a1 + 32), "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("sms")) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "scheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("sms-private")) & 1) != 0)
  {

LABEL_4:
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("imessage"));

  if ((v9 & 1) != 0)
  {
LABEL_5:
    if ((objc_msgSend((id)objc_opt_class(), "isPreferencesURL:", *(_QWORD *)(a1 + 32)) & 1) == 0)
      objc_msgSend((id)objc_opt_class(), "openSMSURL:animate:navigationProvider:chatController:originatingProcess:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 88), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("itms-messages")))
  {

LABEL_14:
    objc_msgSend(*(id *)(a1 + 40), "showStoreForURL:fromSourceApplication:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("itms-messagess"));

  if (v14)
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 32), "scheme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lowercaseString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("sms-surf"));

  if (v17)
    objc_msgSend((id)objc_opt_class(), "openSURFURL:navigationProvider:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
LABEL_7:
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (BOOL)isPreferencesURL:(id)a3
{
  return 0;
}

+ (void)openSMSURL:(id)a3 animate:(BOOL)a4 navigationProvider:(id)a5 chatController:(id)a6 originatingProcess:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  char v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  int v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  BOOL v52;
  CKComposition *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  unsigned __int8 v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  CKComposition *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v56 = a4;
  v73 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v58 = a6;
  v59 = a7;
  v66 = 0;
  objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v65 = 0;
  v62 = 0;
  v63 = 0;
  objc_msgSend(v13, "chatForURL:outMessageText:outRecipientIDs:outService:outMessageGUID:presentOverlay:outSIMID:", v11, &v65, &v64, 0, &v63, &v66, &v62);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v65;
  v16 = v64;
  v17 = v63;
  v60 = v62;

  if (!v14 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v11;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Did not find chat in ChatRegistry using URL %@", buf, 0xCu);
    }

  }
  if (objc_msgSend(a1, "hasBusinessRecipientWithRecipientIDs:", v16))
  {
    if (objc_msgSend(MEMORY[0x1E0D397F8], "deviceIsLockedDown"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v68 = v11;
          _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Cannot open new chat in lockdown mode for received biz chat URL: (%@)", buf, 0xCu);
        }

      }
      objc_msgSend(v12, "showLockdownAlertForBusinessChat");
      goto LABEL_73;
    }
    if ((objc_msgSend(MEMORY[0x1E0D397F8], "supportsBusinessChat") & 1) == 0)
    {
      objc_msgSend(v12, "showBusinessChatNotSupportedAlert");
      goto LABEL_73;
    }
  }
  if (v17)
  {
    objc_msgSend((id)objc_opt_class(), "loadConversationWithMessageGUID:withInlineReplyOverlay:navigationProvider:", v17, v66, v12);
    goto LABEL_73;
  }
  if (!v14 || (objc_msgSend(v14, "allowedToShowConversation") & 1) != 0)
  {
    if (objc_msgSend(v11, "ckAllowRetargeting"))
    {
      objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0;
      objc_msgSend(v20, "existingChatWithAddresses:allowAlternativeService:bestHandles:", v16, 1, &v61);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v61;

      if (v21)
      {
        v23 = v21;

        v14 = v23;
      }
      v24 = objc_msgSend(v22, "count");
      if (v24 == objc_msgSend(v16, "count"))
      {
        objc_msgSend(v22, "__imArrayByApplyingBlock:", &__block_literal_global_216_2);
        v25 = objc_claimAutoreleasedReturnValue();

        v16 = (id)v25;
      }

    }
    v52 = v14 == 0;
    if (v14)
    {
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "conversationForExistingChat:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
        goto LABEL_41;
LABEL_34:
      v54 = v27;
      if (objc_msgSend(v27, "isPlaceholder") && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v68 = v27;
          _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Conversation appears to be a placeholder to the client, may not have messages even after history query or messages may just be pending history query: %@", buf, 0xCu);
        }

      }
      v31 = 0;
      v52 = 0;
      goto LABEL_46;
    }
    if (objc_msgSend(v11, "ckIsLaunchAppURL"))
    {
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "topMostConversation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        goto LABEL_34;

      v16 = 0;
    }
LABEL_41:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v14;
        _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "Did not find conversation for chat %@", buf, 0xCu);
      }

    }
    v54 = 0;
    v31 = 1;
LABEL_46:
    if (objc_msgSend(a1, "hasBusinessRecipientWithRecipientIDs:", v16))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "absoluteString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (id)ExtractURLQueries();

      objc_msgSend(a1, "validIntentDictionaryWithURLParameters:", v33);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v55 = 0;
    }
    if (objc_msgSend(v15, "length") || v55)
    {
      if (objc_msgSend(v15, "length"))
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v15);
      else
        v36 = 0;
      v53 = -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:]([CKComposition alloc], "initWithText:subject:shelfPluginPayload:bizIntent:", v36, 0, 0, v55);

    }
    else
    {
      v53 = 0;
    }
    if ((v31 & 1) != 0
      || (objc_msgSend(v54, "isPlaceholder") & 1) != 0
      || (objc_msgSend(v11, "ckShouldInitiateCollaborationWithSend") & 1) != 0)
    {
      if (objc_msgSend(v11, "ckShouldShowComposeUI"))
      {
        objc_msgSend(v11, "ckLaunchURLBalloonPluginBundleID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ckLaunchURLBalloonPluginPayload");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            v68 = v16;
            v69 = 2112;
            v70 = v53;
            v71 = 2112;
            v72 = v54;
            _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "showNewMessageCompositionPanelWithRecipients: (%@) with composition (%@), conversation: (%@)", buf, 0x20u);
          }

        }
        objc_msgSend(v12, "showNewMessageCompositionPanelWithRecipients:composition:suggestedReplies:animated:bizIntent:launchPluginWithBundleID:pluginLaunchPayload:simID:sendMessageHandler:", v16, v53, 0, 0, v55, v37, v38, v60, 0);

      }
      else if (objc_msgSend(v11, "ckShouldInitiateCollaborationWithSend"))
      {
        LOBYTE(v50) = v56;
        objc_msgSend(a1, "_sendCollaborationInitationForURL:originatingProcess:chat:conversation:recipientIDs:navigationProvider:animate:", v11, v59, v14, v54, v16, v12, v50);
      }
      v40 = 0;
    }
    else
    {
      if (v55)
      {
        objc_msgSend(v54, "chat");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setBizIntent:", v55);

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v68 = v54;
          _os_log_impl(&dword_18DFCD000, v43, OS_LOG_TYPE_INFO, "Showing existing conversation %@", buf, 0xCu);
        }

      }
      objc_msgSend(v12, "showConversation:animate:", v54, v56);
      objc_msgSend(v12, "chatController");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ckLaunchURLBalloonPluginBundleID");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v57, "isEqualToString:", *MEMORY[0x1E0D37620]) & 1) != 0
        || objc_msgSend(v57, "isEqualToString:", *MEMORY[0x1E0D37500]))
      {
        objc_msgSend(v11, "ckLaunchURLBalloonPluginPayload");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "inputController");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "presentPluginWithBundleID:appLaunchPayload:", v57, v44);

        v40 = 1;
      }
      else
      {
        objc_msgSend(v51, "inputController");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "dismissAppCardIfNecessaryAnimated:completion:", 0, 0);
        v40 = 0;
      }

      objc_msgSend((id)objc_opt_class(), "_setMessageFilterModeBy:navigationProvider:", v54, v12);
      objc_msgSend(v12, "conversationListController");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "updateConversationList");

      objc_msgSend(v12, "conversationListController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "conversationList");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "updateConversationsWasKnownSender");

      if (v53 && (objc_msgSend(v12, "isComposingMessage") & 1) == 0)
      {
        objc_msgSend(v12, "chatController");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKUserActivityHandler updateChatController:composition:](CKUserActivityHandler, "updateChatController:composition:", v49, v53);

      }
    }
    if (!v52)
    {
      objc_msgSend(v12, "chatController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (((v40 | objc_msgSend(v41, "isFunCamPresented")) & 1) == 0)
      {
        objc_msgSend(v41, "showKeyboardForReply");
        objc_msgSend(v41, "setupStateForLaunchURL:", v11);
      }

    }
    goto LABEL_73;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v11;
      _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, " received URL: (%@) to a chat which contained non-allowlisted handles during downtime, so aborting open url request.", buf, 0xCu);
    }

  }
LABEL_73:

}

uint64_t __97__CKUserActivityHandler_openSMSURL_animate_navigationProvider_chatController_originatingProcess___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ID");
}

+ (void)_sendCollaborationInitationForURL:(id)a3 originatingProcess:(id)a4 chat:(id)a5 conversation:(id)a6 recipientIDs:(id)a7 navigationProvider:(id)a8 animate:(BOOL)a9
{
  id v14;
  __CFString *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  const __CFString *v60;
  __int16 v61;
  const __CFString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = (__CFString *)a4;
  v16 = a5;
  v45 = a6;
  v44 = a7;
  v17 = a8;
  if ((-[__CFString hasEntitlement:](v15, "hasEntitlement:", CFSTR("com.apple.private.messages.collaboration-initiate-send")) & 1) != 0)
  {
    v42 = v17;
    objc_msgSend(v14, "ckCollaborationSceneIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "conversationManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (id)objc_msgSend(v19, "activeConversations");

      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "activeIMessageAccount");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v24 = v44;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        if (v25)
        {
          v26 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v53 != v26)
                objc_enumerationMutation(v24);
              v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35830]), "initWithAccount:ID:alreadyCanonical:", v22, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), 0);
              objc_msgSend(v23, "addObject:", v28);

            }
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
          }
          while (v25);
        }

        objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "chatWithHandles:", v23);
        v16 = (id)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "conversationForExistingChat:", v16);
          v31 = objc_claimAutoreleasedReturnValue();

          v45 = (id)v31;
        }

      }
      if (v16 && v45)
      {
        objc_msgSend(v42, "showConversation:animate:", v45, a9);
        objc_msgSend(v42, "chatController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "beginBackgroundTaskWithExpirationHandler:", 0);

        v35 = objc_alloc_init(MEMORY[0x1E0CD73A8]);
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __136__CKUserActivityHandler__sendCollaborationInitationForURL_originatingProcess_chat_conversation_recipientIDs_navigationProvider_animate___block_invoke;
        v46[3] = &unk_1E2758E88;
        v47 = v14;
        v51 = v34;
        v48 = v43;
        v16 = v16;
        v49 = v16;
        v50 = v32;
        v36 = v32;
        objc_msgSend(v35, "retrieveShareableContentWithCompletion:", v46);

      }
      else
      {
        IMLogHandleForCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = CFSTR("NO");
          if (v16)
            v41 = CFSTR("NO");
          else
            v41 = CFSTR("YES");
          *(_DWORD *)buf = 138412802;
          v58 = v14;
          v60 = v41;
          v59 = 2112;
          if (!v45)
            v40 = CFSTR("YES");
          v61 = 2112;
          v62 = v40;
          _os_log_error_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_ERROR, "received URL: (%@) to send composition for shareable content but could not construct chat %@ or conversation %@", buf, 0x20u);
        }

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v14;
        _os_log_impl(&dword_18DFCD000, v38, OS_LOG_TYPE_INFO, "received URL: (%@) to send composition for shareable content but it did not contain a collaboration scene identifier", buf, 0xCu);
      }

    }
    v17 = v42;
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v58 = v14;
      v59 = 2112;
      v60 = CFSTR("com.apple.private.messages.collaboration-initiate-send");
      v61 = 2112;
      v62 = v15;
      _os_log_impl(&dword_18DFCD000, v37, OS_LOG_TYPE_INFO, "received URL: (%@) to send composition for shareable content but originating process was not entitled to do so (missing %@): %@", buf, 0x20u);
    }

  }
}

void __136__CKUserActivityHandler__sendCollaborationInitationForURL_originatingProcess_chat_conversation_recipientIDs_navigationProvider_animate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v36 = v8;
        v37 = 2112;
        v38 = v6;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "received URL: (%@) to send composition for shareable content but did not find any shareable content to send, or an error was hit: %@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endBackgroundTask:", *(_QWORD *)(a1 + 64));
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v31;
LABEL_11:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
        objc_msgSend(v14, "sourceSceneIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) != 0)
          break;

        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          if (v11)
            goto LABEL_11;
          goto LABEL_17;
        }
      }
      v16 = v14;

      if (!v16)
        goto LABEL_20;
      objc_msgSend(*(id *)(a1 + 32), "ckCollaborationShareOptions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v16, "itemProvider");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayWithObject:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __136__CKUserActivityHandler__sendCollaborationInitationForURL_originatingProcess_chat_conversation_recipientIDs_navigationProvider_animate___block_invoke_222;
      v24[3] = &unk_1E2758E60;
      v25 = *(id *)(a1 + 32);
      v26 = v16;
      v29 = *(_QWORD *)(a1 + 64);
      v27 = *(id *)(a1 + 48);
      v28 = *(id *)(a1 + 56);
      v9 = v16;
      +[CKComposition compositionFromItemProviders:shareOptions:completionHandler:](CKComposition, "compositionFromItemProviders:shareOptions:completionHandler:", v20, v17, v24);

    }
    else
    {
LABEL_17:

LABEL_20:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = *(_QWORD *)(a1 + 32);
          v23 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v36 = v22;
          v37 = 2112;
          v38 = v23;
          _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "received URL: (%@) to send composition for shareable content but could not extract shareable content from app %@", buf, 0x16u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endBackgroundTask:", *(_QWORD *)(a1 + 64));
    }
  }

}

void __136__CKUserActivityHandler__sendCollaborationInitationForURL_originatingProcess_chat_conversation_recipientIDs_navigationProvider_animate___block_invoke_222(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5
    && !v6
    && (objc_msgSend(v5, "shelfPluginPayload"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v17 = 138412546;
        v18 = v10;
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "received URL: (%@) and created composition with collaboration: %@, sending...", (uint8_t *)&v17, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "ckFaceTimeConversationUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "existingConversationForFaceTimeConversationUUID:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v5, "setSourceApplicationID:", CFSTR("com.apple.FaceTime"));
    +[CKFaceTimeCollaborationUtilities startCollaborationWithComposition:faceTimeConversation:imChat:chatController:backgroundTaskID:](CKFaceTimeCollaborationUtilities, "startCollaborationWithComposition:faceTimeConversation:imChat:chatController:backgroundTaskID:", v5, v13, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(void **)(a1 + 40);
        v17 = 138412802;
        v18 = v15;
        v19 = 2112;
        v20 = v16;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "received URL: (%@) to send composition for shareable content but could not create composition from shareable content %@ with error: %@", (uint8_t *)&v17, 0x20u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endBackgroundTask:", *(_QWORD *)(a1 + 64));
  }

}

+ (void)openItemProviders:(id)a3 navigationProvider:(id)a4 chatController:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id obj;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v6;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        v15[0] = v11;
        v15[1] = 3221225472;
        v15[2] = __77__CKUserActivityHandler_openItemProviders_navigationProvider_chatController___block_invoke;
        v15[3] = &unk_1E274C848;
        v16 = v7;
        +[CKComposition requestCompositionFromItemProviders:completion:](CKComposition, "requestCompositionFromItemProviders:completion:", v13, v15);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

void __77__CKUserActivityHandler_openItemProviders_navigationProvider_chatController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__CKUserActivityHandler_openItemProviders_navigationProvider_chatController___block_invoke_2;
  v5[3] = &unk_1E274A108;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

uint64_t __77__CKUserActivityHandler_openItemProviders_navigationProvider_chatController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, *(_QWORD *)(a1 + 40), 1);
}

+ (void)_showPeerPaymentUIForPerson:(id)a3 amount:(id)a4 navigationProvider:(id)a5 chatController:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void (**v26)(void);
  void *v27;
  _QWORD v28[4];
  void (**v29)(void);
  uint8_t *v30;
  uint8_t buf[8];
  uint8_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  void *v40;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "handle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
    v41[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CKMakeHandlesFromRecipients(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "existingChatWithHandle:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v17, "conversationForExistingChat:", v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "showConversation:animate:", v27, 1);
      }
      else
      {
        v40 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "conversationForHandles:displayName:joinedChatsOnly:create:", v20, 0, 0, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "showConversation:animate:", v27, 1);
      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __94__CKUserActivityHandler__showPeerPaymentUIForPerson_amount_navigationProvider_chatController___block_invoke;
      aBlock[3] = &unk_1E274A108;
      v38 = v12;
      v39 = v10;
      v26 = (void (**)(void))_Block_copy(aBlock);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Waiting for extensions to load before showing SURF extension for intent", buf, 2u);
        }

      }
      if ((IMIsRunningInUnitTesting() & 1) != 0)
      {
        v26[2]();
      }
      else
      {
        *(_QWORD *)buf = 0;
        v32 = buf;
        v33 = 0x3032000000;
        v34 = __Block_byref_object_copy__64;
        v35 = __Block_byref_object_dispose__64;
        v36 = 0;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __94__CKUserActivityHandler__showPeerPaymentUIForPerson_amount_navigationProvider_chatController___block_invoke_232;
        v28[3] = &unk_1E2758928;
        v30 = buf;
        v29 = v26;
        objc_msgSend(v25, "addObserverForName:object:queue:usingBlock:", CFSTR("CKBrowserSelectionControllerDataSourceChangedNotification"), 0, v22, v28);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)*((_QWORD *)v32 + 5);
        *((_QWORD *)v32 + 5) = v23;

        _Block_object_dispose(buf, 8);
      }

    }
  }

}

void __94__CKUserActivityHandler__showPeerPaymentUIForPerson_amount_navigationProvider_chatController___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "inputController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v14 = CFSTR("Currency");
    objc_msgSend(v4, "currencyCode", CFSTR("CurrencyType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = CFSTR("CurrencyValue");
    v12[0] = v5;
    objc_msgSend(*(id *)(a1 + 40), "amount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v3, "presentPluginWithBundleID:appLaunchPayload:", *MEMORY[0x1E0D37620], v10);

}

void __94__CKUserActivityHandler__showPeerPaymentUIForPerson_amount_navigationProvider_chatController___block_invoke_232(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = a2;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Notified of plugin manager plugin changes", buf, 2u);
    }

  }
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "allPlugins");

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasLoadedExtensions");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Extensions loaded, showing SURF for intent", v11, 2u);
      }

    }
  }

}

void __99__CKUserActivityHandler_loadConversationWithMessageGUID_withInlineReplyOverlay_navigationProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

+ (void)openSURFURL:(id)a3 navigationProvider:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = a4;
  v21 = v5;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v5, 0);
  objc_msgSend(v20, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (!v7)
  {

    v8 = 0;
    goto LABEL_17;
  }
  v8 = 0;
  v9 = *(_QWORD *)v24;
  v10 = 0.0;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v24 != v9)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("amount"));

      if (v14)
      {
        objc_msgSend(v12, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v10 = v16;
      }
      else
      {
        objc_msgSend(v12, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("currency"));

        if (!v18)
          continue;
        objc_msgSend(v12, "value");
        v15 = v8;
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  }
  while (v7);

  if (v8 && v10 > 0.0)
  {
    objc_msgSend(v22, "showSurfAppForCurrentConversationWithAmount:currency:", v8, v10);
    goto LABEL_21;
  }
LABEL_17:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Recieved Surf URL but queryItems was invalid for URL: %@", buf, 0xCu);
    }

  }
LABEL_21:

}

+ (void)_setMessageFilterModeBy:(id)a3 navigationProvider:(id)a4
{
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  v6 = objc_msgSend((id)objc_opt_class(), "_messageUnknownFilteringEnabled");
  objc_msgSend(v5, "conversationListController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "filterMode");

  if (v6)
  {
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "primaryFilterModeForConversation:", v12);

    if (v8 == 8)
    {
      if (objc_msgSend(v12, "hasUnreadMessages"))
        v10 = 8;
      else
        v10 = 1;
    }
    else if (v8 != v10)
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }
  if (v8 != v10)
  {
    objc_msgSend(v5, "conversationListController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFilterMode:", v10);

  }
}

+ (BOOL)hasBusinessRecipientWithRecipientIDs:(id)a3
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

+ (id)validIntentDictionaryWithURLParameters:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v11 = objc_msgSend(&unk_1E286FBF8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(&unk_1E286FBF8);
              if (objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j)))
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", v10);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKey:", v15, v10);

                goto LABEL_16;
              }
            }
            v12 = objc_msgSend(&unk_1E286FBF8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v12)
              continue;
            break;
          }
        }
LABEL_16:
        ;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
    v18 = (void *)objc_msgSend(v4, "copy");
  else
    v18 = 0;

  return v18;
}

void __117__CKUserActivityHandler_sendBackgroundCollaborationForUserActivity_withNavigationProvider_chatController_completion___block_invoke_148_cold_1(uint64_t *a1, char a2, os_log_t log)
{
  uint64_t v3;
  const __CFString *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = CFSTR("NO");
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  if ((a2 & 1) != 0)
    v4 = CFSTR("YES");
  v8 = v4;
  v9 = 2112;
  v10 = CFSTR("YES");
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "received user activity: (%@) to send composition in the background but could not construct chat %@ or conversation %@", (uint8_t *)&v5, 0x20u);
}

@end
