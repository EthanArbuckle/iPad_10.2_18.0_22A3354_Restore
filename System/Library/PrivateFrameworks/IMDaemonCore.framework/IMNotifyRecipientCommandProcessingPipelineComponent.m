@implementation IMNotifyRecipientCommandProcessingPipelineComponent

- (IMNotifyRecipientCommandProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5;
  IMNotifyRecipientCommandProcessingPipelineComponent *v6;
  IMNotifyRecipientCommandProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMNotifyRecipientCommandProcessingPipelineComponent;
  v6 = -[IMNotifyRecipientCommandProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pipelineResources, a3);

  return v7;
}

- (id)_idsAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[IMNotifyRecipientCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imdAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "idsAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_account
{
  void *v2;
  void *v3;

  -[IMNotifyRecipientCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imdAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_messageStore
{
  void *v2;
  void *v3;

  -[IMNotifyRecipientCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)runIndividuallyWithInput:(id)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  void *v40;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  void *v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  if (IMOSLoggingEnabled(v42))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v42, "GUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v51 = v5;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "<IMNotifyRecipientCommandProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);

    }
  }
  v6 = IMGetCachedDomainBoolForKey();
  if ((_DWORD)v6)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v42, "GUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v51 = v8;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "    Ignoring notify recipient command for message: %@", buf, 0xCu);

      }
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v42);
  }
  else
  {
    objc_msgSend(v42, "GUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v42, "GUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[IMNotifyRecipientCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "messageStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "chatsForMessageGUID:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v51 = v11;
          v52 = 2112;
          v53 = v14;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "Found chats for messageID: %@   chats: %@", buf, 0x16u);
        }

      }
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v17 = v14;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v45;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v45 != v19)
              objc_enumerationMutation(v17);
            v21 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v20);
            -[IMNotifyRecipientCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources", v42);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "messageStore");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "messageWithGUID:", v11);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v43, "addObject:", v24);
              -[IMNotifyRecipientCommandProcessingPipelineComponent _account](self, "_account");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "session");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMNotifyRecipientCommandProcessingPipelineComponent _markMessageAsNotifiedRecipientAndNotify:session:chat:](self, "_markMessageAsNotifiedRecipientAndNotify:session:chat:", v24, v26, v21);

              if ((objc_msgSend(v24, "isFromMe") & 1) == 0)
              {
                -[IMNotifyRecipientCommandProcessingPipelineComponent _messageStore](self, "_messageStore");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = v11;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "postUrgentNotificationsForMessageGUIDs:", v28);

              }
            }

            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        }
        while (v18);
      }

      v29 = objc_msgSend(v43, "count");
      v30 = v29 == 0;
      v31 = IMOSLoggingEnabled(v29);
      if (v30)
      {
        if (v31)
        {
          OSLogHandleForIMFoundationCategory();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v42, "GUID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v51 = v38;
            _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Unable to mark message notified recipient with GUID=%@: message not found", buf, 0xCu);

          }
        }
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = (void *)objc_msgSend(v39, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 5, 0);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v40);

      }
      else
      {
        if (v31)
        {
          OSLogHandleForIMFoundationCategory();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v42, "GUID");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v51 = v33;
            _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "Marked message with GUID=%@ as notified recipient", buf, 0xCu);

          }
        }
        objc_msgSend(v17, "firstObject", v42);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setChat:", v34);

        v35 = (void *)objc_msgSend(v43, "copy");
        objc_msgSend(v42, "setMessageItems:", v35);

        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v42);
      }

    }
    else
    {
      v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v11 = (void *)objc_msgSend(v36, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 3, 0);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v11);
    }

  }
  return v9;
}

- (void)_markMessageAsNotifiedRecipientAndNotify:(id)a3 session:(id)a4 chat:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Mark message as notified recipient: %@", (uint8_t *)&v17, 0xCu);
    }

  }
  objc_msgSend(v8, "setFlags:", objc_msgSend(v8, "flags") | 0x800000000);
  if (objc_msgSend(v8, "errorCode"))
    objc_msgSend(v8, "setErrorCode:", 0);
  -[IMNotifyRecipientCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v8, 0, 1, 1, 0x800000000);

  -[IMNotifyRecipientCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "chatRegistry");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:", v10, 0, 0);

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
