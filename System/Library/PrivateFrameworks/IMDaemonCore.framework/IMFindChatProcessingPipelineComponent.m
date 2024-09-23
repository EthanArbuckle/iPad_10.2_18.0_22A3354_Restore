@implementation IMFindChatProcessingPipelineComponent

- (IMFindChatProcessingPipelineComponent)initWithChatRegistry:(id)a3
{
  id v5;
  IMFindChatProcessingPipelineComponent *v6;
  IMFindChatProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMFindChatProcessingPipelineComponent;
  v6 = -[IMFindChatProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_chatRegistry, a3);

  return v7;
}

+ (id)findGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 groupName:(id)a5 participants:(id)a6 groupID:(id)a7 serviceName:(id)a8 chatRegistry:(id)a9
{
  return (id)objc_msgSend(a9, "bestCandidateGroupChatWithFromIdentifier:toIdentifier:displayName:participants:groupID:serviceName:", a3, a4, a5, a6, a7, a8);
}

- (BOOL)shouldDropDueToGroupSize:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("md-max-chat-participants-incoming"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
    if (!v6)
    {
LABEL_11:
      v11 = 0;
      goto LABEL_12;
    }
    v7 = v6 + 1;
  }
  else
  {
    v7 = 51;
  }
  v8 = objc_msgSend(v3, "count");
  if (v8 <= v7)
    goto LABEL_11;
  v9 = v8;
  if (IMOSLoggingEnabled(v8))
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v13 = 134218240;
      v14 = v9;
      v15 = 2048;
      v16 = v7;
      _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Incoming Group message has too many participants (%lu, max = %lu), should drop message", (uint8_t *)&v13, 0x16u);
    }

  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)_participantsContainBizID:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (MEMORY[0x1D17EA338](v7) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (BOOL)_shouldDropMessageGroupID:(id)a3 participants:(id)a4 fromIdentifier:(id)a5 toIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL8 v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) != 0)
    goto LABEL_2;
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D39868], "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isGroupInBlocklist:", v10);

    if (v16)
    {
      if (!IMOSLoggingEnabled(v17))
      {
LABEL_10:
        v14 = 1;
        goto LABEL_11;
      }
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v21 = 138412290;
        v22 = v10;
        _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "GroupID %@ was found in blocklist, dropping message", (uint8_t *)&v21, 0xCu);
      }
LABEL_8:

      goto LABEL_10;
    }
  }
  if (-[IMFindChatProcessingPipelineComponent shouldDropDueToGroupSize:](self, "shouldDropDueToGroupSize:", v11))
    goto LABEL_10;
  v20 = -[IMFindChatProcessingPipelineComponent _participantsContainBizID:](self, "_participantsContainBizID:", v11);
  if (v20)
  {
    if (!IMOSLoggingEnabled(v20))
      goto LABEL_10;
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v11;
      _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "Dropping message because participant list contains biz id. participants: %@", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_8;
  }
LABEL_2:
  v14 = 0;
LABEL_11:

  return v14;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  IMDChatRegistry *chatRegistry;
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
  uint64_t v36;
  int v37;
  NSObject *v38;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<IMFindChatProcessingPipelineComponent> Started processing", buf, 2u);
    }

  }
  objc_msgSend(v4, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "participantIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (unint64_t)objc_msgSend(v11, "count") > 2;

    if (v12)
    {
      objc_msgSend(v4, "groupID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "participantIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fromIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "toIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[IMFindChatProcessingPipelineComponent _shouldDropMessageGroupID:participants:fromIdentifier:toIdentifier:](self, "_shouldDropMessageGroupID:participants:fromIdentifier:toIdentifier:", v13, v14, v15, v16);

      if (v17)
      {
        if (IMOSLoggingEnabled(v18))
        {
          OSLogHandleForIMFoundationCategory();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v4, "groupID");
            v20 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "participantIdentifiers");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v41 = v20;
            v42 = 2112;
            v43 = v21;
            _os_log_impl(&dword_1D1413000, v19, OS_LOG_TYPE_INFO, "Dropping message from MessageGroupController. groupID: %@ participants: %@", buf, 0x16u);

          }
        }
        v22 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v23 = (void *)objc_msgSend(v22, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 6, 0);
        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v23);
        goto LABEL_30;
      }
      objc_msgSend(v4, "account");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "service");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "internalName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)objc_opt_class();
      objc_msgSend(v4, "fromIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "toIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentGroupName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "participantIdentifiers");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "_IDsFromURIs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "groupID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "findGroupChatWithFromIdentifier:toIdentifier:groupName:participants:groupID:serviceName:chatRegistry:", v27, v31, v32, v34, v35, v26, self->_chatRegistry);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      chatRegistry = self->_chatRegistry;
      objc_msgSend(v4, "fromDisplayID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "account");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDChatRegistry existingChatForID:account:](chatRegistry, "existingChatForID:account:", v26, v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v37 = IMOSLoggingEnabled(v36);
    if (v23)
    {
      if (v37)
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v23;
          _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "<IMFindChatProcessingPipelineComponent> Found chat: %@", buf, 0xCu);
        }
LABEL_28:

      }
    }
    else if (v37)
    {
      OSLogHandleForIMFoundationCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v38, OS_LOG_TYPE_INFO, "<IMFindChatProcessingPipelineComponent> Chat not found. IMMessageLegacyProcessingPipelineComponent will create it.", buf, 2u);
      }
      goto LABEL_28;
    }
    objc_msgSend(v4, "setChat:", v23);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
LABEL_30:
    v10 = (void *)v24;

    goto LABEL_31;
  }
  if (IMOSLoggingEnabled(v7))
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "chat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = v9;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "<IMFindChatProcessingPipelineComponent> Found pre-supplied chat: %@", buf, 0xCu);

    }
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
LABEL_31:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
}

@end
