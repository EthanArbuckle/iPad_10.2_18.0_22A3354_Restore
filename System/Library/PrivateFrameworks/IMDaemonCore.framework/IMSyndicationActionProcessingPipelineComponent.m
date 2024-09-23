@implementation IMSyndicationActionProcessingPipelineComponent

- (IMSyndicationActionProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5;
  IMSyndicationActionProcessingPipelineComponent *v6;
  IMSyndicationActionProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMSyndicationActionProcessingPipelineComponent;
  v6 = -[IMSyndicationActionProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pipelineResources, a3);

  return v7;
}

- (id)_account
{
  void *v2;
  void *v3;

  -[IMSyndicationActionProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imdAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_messageStore
{
  void *v2;
  void *v3;

  -[IMSyndicationActionProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_chatRegistry
{
  void *v2;
  void *v3;

  -[IMSyndicationActionProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chatRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_broadcaster
{
  void *v2;
  void *v3;

  -[IMSyndicationActionProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "broadcaster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)handleMessageSyndicationAction:(id)a3 chat:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMSyndicationActionProcessingPipelineComponent _messageStore](self, "_messageStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateSyndicatedMessageWithSyndicationMessageAction:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "guid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412546;
        v29 = v12;
        v30 = 2112;
        v31 = v6;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Updated message: %@ with SyndicationAction: %@", (uint8_t *)&v28, 0x16u);

      }
    }
    -[IMSyndicationActionProcessingPipelineComponent _broadcaster](self, "_broadcaster");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accountID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chatIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v7, "style");
    objc_msgSend(v7, "properties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "account:chat:style:chatProperties:messageUpdated:", v14, v15, v16, v17, v9);

    v18 = 0;
  }
  else
  {
    IMLogHandleForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1D1667B28((uint64_t)v6, v19, v20, v21, v22, v23, v24, v25);

    v26 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v18 = (void *)objc_msgSend(v26, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 5, 0);
  }

  return v18;
}

- (id)handleChatSyndicationAction:(id)a3 chat:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "updateDonationStateWithSyndicationAction:", v5);
  v8 = v7;
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      if (v8)
        v10 = CFSTR("YES");
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Did update chat: %@. with SyndicationAction: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  return 0;
}

- (id)findSMSChatForInput:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[16];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "SyndicationAction: trying to find chat using SMS chat fallback search.", buf, 2u);
    }

  }
  +[IMDServiceController sharedController](IMDServiceController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceWithName:", *MEMORY[0x1E0D38F58]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeAccountsForService:", v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "participantIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1D149CA48;
  v31[3] = &unk_1E92294F8;
  v26 = v4;
  v32 = v26;
  objc_msgSend(v9, "__imArrayByFilteringWithBlock:", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_IDsFromURIs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "count");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16);
        -[IMSyndicationActionProcessingPipelineComponent _chatRegistry](self, "_chatRegistry");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v12 <= 1)
        {
          objc_msgSend(v26, "fromDisplayID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "existingChatForID:account:", v21, v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v18, "existingChatForIDs:account:style:", v11, v17, 43);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }

        if (v20)
        {

          goto LABEL_22;
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      if (v14)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled(v22))
  {
    OSLogHandleForIMFoundationCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "SyndicationAction: SMS chat fallback search did not find a chat.", buf, 2u);
    }

  }
  v20 = 0;
LABEL_22:

  return v20;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  id v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[IMSyndicationActionProcessingPipelineComponent findSMSChatForInput:](self, "findSMSChatForInput:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 8, 0);
      v7 = 0;
      if (v12)
        goto LABEL_12;
    }
  }
  objc_msgSend(v4, "createSyndicationActionWithChat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "syndicatedItemType");
    if (v8 == 2)
    {
      -[IMSyndicationActionProcessingPipelineComponent handleChatSyndicationAction:chat:](self, "handleChatSyndicationAction:chat:", v7, v5);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else if (v8 == 1)
    {
      -[IMSyndicationActionProcessingPipelineComponent handleMessageSyndicationAction:chat:](self, "handleMessageSyndicationAction:chat:", v7, v5);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v9 = objc_msgSend(v13, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 11, 0);
    }
    v12 = (void *)v9;
    if (v9)
    {
LABEL_12:
      IMLogHandleForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1D1667B90((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);

      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v12);
      goto LABEL_21;
    }
    v11 = objc_msgSend(v4, "setSyndicationAction:", v7);
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = objc_msgSend(v10, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 11, 0);
    if (v11)
    {
      v12 = (void *)v11;
      v7 = 0;
      goto LABEL_12;
    }
  }
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v25 = 138412290;
      v26 = v7;
      _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Processed SyndicationAction ok: %@", (uint8_t *)&v25, 0xCu);
    }

  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
LABEL_21:

  return v21;
}

- (IMDiMessagePipelineResources)pipelineResources
{
  return self->_pipelineResources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineResources, 0);
}

@end
