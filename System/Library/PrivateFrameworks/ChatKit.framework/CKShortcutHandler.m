@implementation CKShortcutHandler

+ (void)performActionForShortcutItem:(id)a3 navigationProvider:(id)a4 chatController:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Performing action for shortcut item: %@", buf, 0xCu);
    }

  }
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __95__CKShortcutHandler_performActionForShortcutItem_navigationProvider_chatController_completion___block_invoke;
  v22 = &unk_1E2751308;
  v23 = v9;
  v24 = v10;
  v25 = v11;
  v26 = v12;
  v14 = v11;
  v15 = v12;
  v16 = v10;
  v17 = v9;
  v18 = _Block_copy(&v19);
  objc_msgSend(v16, "setDeferredHandleURLBlock:", v18, v19, v20, v21, v22);

}

void __95__CKShortcutHandler_performActionForShortcutItem_navigationProvider_chatController_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id obj;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilesms.newmessage"));

  if (v3)
  {
    +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDraftForPendingConversation:withRecipients:", 0, 0);

    +[CKDraftManager sharedInstance](CKDraftManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveCompositionAndFlushCache:", 0);

    objc_msgSend(*(id *)(a1 + 40), "showNewMessageCompositionPanelWithRecipients:composition:animated:", 0, 0, 0);
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilesms.conversation"));

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("CKSBActionUserInfoKeyChatGUID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = (void *)MEMORY[0x1E0CEABB8];
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __95__CKShortcutHandler_performActionForShortcutItem_navigationProvider_chatController_completion___block_invoke_2;
        v52[3] = &unk_1E274A0B8;
        v53 = *(id *)(a1 + 40);
        v54 = v9;
        v55 = *(id *)(a1 + 48);
        objc_msgSend(v10, "_performWithoutDeferringTransitions:", v52);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      v11 = MEMORY[0x193FF3C18](CFSTR("_CDInteractionFeedbackLogger"), CFSTR("CoreDuet"));
      v12 = MEMORY[0x193FF3C18](CFSTR("_CDContact"), CFSTR("CoreDuet"));
      if (v11)
      {
        v13 = (void *)v12;
        if (v12)
        {
          v14 = MEMORY[0x193FF3C24]("_CDInteractionAdviceSourceAutocomplete", CFSTR("CoreDuet"));
          v15 = MEMORY[0x193FF3C24]("_CDInteractionPresentationStyleUIShortcut", CFSTR("CoreDuet"));
          v45 = MEMORY[0x193FF3C24]("_CDPersonIdTypeCNContactId", CFSTR("CoreDuet"));
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          objc_msgSend((id)*MEMORY[0x1E0CEB258], "shortcutItems");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          if (v47)
          {
            v37 = v15;
            v38 = v14;
            v42 = v13;
            v43 = v16;
            v39 = (void *)v11;
            v40 = 0;
            v46 = *(_QWORD *)v49;
            v44 = v9;
            obj = v17;
            do
            {
              for (i = 0; i != v47; ++i)
              {
                if (*(_QWORD *)v49 != v46)
                  objc_enumerationMutation(obj);
                objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "userInfo");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "objectForKey:", CFSTR("CKSBActionUserInfoKeyChatGUID"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "conversationForExistingChatWithGUID:", v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22)
                {
                  objc_msgSend(v22, "recipient");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "defaultIMHandle");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "ID");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "_appearsToBePhoneNumber");

                  if (v26)
                    v27 = "_CDContactTypePhoneNumber";
                  else
                    v27 = "_CDContactTypeEmailAddress";
                  v28 = MEMORY[0x193FF3C24](v27, CFSTR("CoreDuet"));
                  objc_msgSend(v23, "defaultIMHandle");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "ID");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "cnContact");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "identifier");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = v28;
                  v16 = v43;
                  objc_msgSend(v42, "contactWithIdentifier:type:displayName:personId:personIdType:", v30, v33, 0, v32, v45);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  v9 = v44;
                  objc_msgSend(v43, "addObject:", v34);
                  if (v44 && objc_msgSend(v20, "isEqualToString:", v44))
                  {
                    v35 = v34;

                    v40 = v35;
                  }

                }
              }
              v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
            }
            while (v47);

            v36 = v40;
            if (v40)
              objc_msgSend(v39, "logFeedbackItemSelected:adviceSource:presentationStyle:itemsShown:bundleID:", v40, v38, v37, v16, CFSTR("com.apple.MobileSMS"));
          }
          else
          {

            v36 = 0;
          }

        }
      }

    }
  }
}

uint64_t __95__CKShortcutHandler_performActionForShortcutItem_navigationProvider_chatController_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "showConversationAndMessageForChatGUID:messageGUID:animate:", *(_QWORD *)(a1 + 40), 0, 0);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v4 = 136315138;
      v5 = "+[CKShortcutHandler performActionForShortcutItem:navigationProvider:chatController:completion:]_block_invoke_2";
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "reloadEntryViewIfNeeded called from %s", (uint8_t *)&v4, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "reloadEntryViewIfNeeded");
  return objc_msgSend(*(id *)(a1 + 48), "showKeyboardForReply");
}

@end
