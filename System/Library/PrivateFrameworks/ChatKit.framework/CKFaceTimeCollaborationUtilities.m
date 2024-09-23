@implementation CKFaceTimeCollaborationUtilities

+ (void)startCollaborationWithComposition:(id)a3 faceTimeConversation:(id)a4 imChat:(id)a5 chatController:(id)a6 backgroundTaskID:(unint64_t)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD aBlock[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  unint64_t v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "shelfPluginPayload");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMessageGUID:", v16);

  objc_msgSend(v15, "setPluginBundleID:", *MEMORY[0x1E0D375F8]);
  v17 = objc_alloc_init(MEMORY[0x1E0CD7398]);
  objc_msgSend(v15, "url");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke;
  aBlock[3] = &unk_1E275ACE8;
  v29 = v12;
  v30 = v13;
  v31 = v17;
  v32 = v11;
  v33 = v14;
  v34 = a7;
  v20 = v14;
  v21 = v11;
  v22 = v17;
  v23 = v13;
  v24 = v12;
  v26[0] = v19;
  v26[1] = 3221225472;
  v26[2] = __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke_3;
  v26[3] = &unk_1E275AD10;
  v27 = _Block_copy(aBlock);
  v25 = v27;
  objc_msgSend(v22, "getCollaborationHighlightForURL:completionHandler:", v18, v26);

}

void __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL4 v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v3 = a2;
  v4 = +[CKFaceTimeCollaborationUtilities shouldAddCollaboration:toFaceTimeConversation:forIMChat:](CKFaceTimeCollaborationUtilities, "shouldAddCollaboration:toFaceTimeConversation:forIMChat:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = _IMWillLog();
  if (v4)
  {
    if (v5)
    {
      v27 = *(_QWORD *)(a1 + 32);
      _IMAlwaysLog();
    }
    objc_msgSend(*(id *)(a1 + 48), "fetchAttributionsForHighlight:", v3, v27);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;

      v3 = v7;
    }
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "conversationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "conversationManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addCollaboration:forConversation:", v3, *(_QWORD *)(a1 + 32));

    }
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "endBackgroundTask:", *(_QWORD *)(a1 + 72));
  }
  else
  {
    if (v5)
      _IMAlwaysLog();
    objc_msgSend(*(id *)(a1 + 56), "shelfPluginPayload");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pluginBundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "balloonPluginForBundleID:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (objc_class *)objc_msgSend(v15, "dataSourceClass");
    if (!v16)
      v16 = (objc_class *)objc_opt_class();
    v17 = (void *)objc_msgSend([v16 alloc], "initWithPluginPayload:", v6);
    objc_msgSend(v6, "setDatasource:", v17);
    objc_msgSend(v17, "setPayloadInShelf:", 1);
    objc_msgSend(v17, "payloadWillEnterShelf");
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "associatedMessageGUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pluginBundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "existingDataSourceForMessageGUID:bundleID:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "beginShowingLastConsumedBreadcrumbForOutgoingPayload:", v6);
    v23 = *(_QWORD *)(a1 + 56);
    v22 = *(void **)(a1 + 64);
    v24 = objc_msgSend(v6, "payloadCollaborationType");
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke_2;
    v28[3] = &unk_1E274F528;
    v25 = *(_QWORD *)(a1 + 72);
    v29 = v17;
    v30 = v25;
    v26 = v17;
    objc_msgSend(v22, "sendCompositionForCollaboration:collaborationType:completion:", v23, v24, v28);

  }
}

void __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "pluginPayload");
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(a1 + 40));

}

void __130__CKFaceTimeCollaborationUtilities_startCollaborationWithComposition_faceTimeConversation_imChat_chatController_backgroundTaskID___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = _IMWillLog();
  if (v5)
  {
    if (v6)
      _IMAlwaysLog();
  }
  else if (v6)
  {
    _IMAlwaysLog();
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

}

+ (BOOL)shouldAddCollaboration:(id)a3 toFaceTimeConversation:(id)a4 forIMChat:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  BOOL v22;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "state");
  if (v7 && v10 == 3)
  {
    v24 = v8;
    v25 = v7;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v7, "attributions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "uniqueIdentifier");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            v18 = (void *)IMDMessageRecordChatForMessageGUID();
            objc_msgSend(v18, "groupID");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "groupID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqualToString:", v20);

            if (v21)
            {
              v8 = v24;
              v7 = v25;
              if (_IMWillLog())
                _IMAlwaysLog();

              v22 = 1;
              goto LABEL_20;
            }

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v13)
          continue;
        break;
      }
    }

    v8 = v24;
    v7 = v25;
  }
  if (_IMWillLog())
  {
    objc_msgSend(v7, "collaborationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();
    v22 = 0;
LABEL_20:

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
