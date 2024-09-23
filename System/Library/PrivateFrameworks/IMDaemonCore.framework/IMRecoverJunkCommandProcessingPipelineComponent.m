@implementation IMRecoverJunkCommandProcessingPipelineComponent

- (IMRecoverJunkCommandProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5;
  IMRecoverJunkCommandProcessingPipelineComponent *v6;
  IMRecoverJunkCommandProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMRecoverJunkCommandProcessingPipelineComponent;
  v6 = -[IMRecoverJunkCommandProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pipelineResources, a3);

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  int v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  objc_msgSend(v26, "GUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = IMOSLoggingEnabled(v27);
  if (!v27)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "Ignoring recover junk chat command, no message guid received", buf, 2u);
      }

    }
    goto LABEL_38;
  }
  if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = (uint64_t)v27;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<IMRecoverJunkCommandProcessingPipelineComponent> Started processing recover junk command for message GUID: %@", buf, 0xCu);
    }

  }
  v6 = objc_msgSend(v26, "isFromMe");
  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v33 = (uint64_t)v27;
        _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "Ignoring recover junk command not from me for message: %@", buf, 0xCu);
      }

    }
LABEL_38:
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v26);
    goto LABEL_39;
  }
  -[IMRecoverJunkCommandProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chatsForMessageGUID:", v27);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = IMOSLoggingEnabled(v10);
  if ((_DWORD)v11)
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = (uint64_t)v27;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Found chats for message guid: %@", buf, 0xCu);
    }

  }
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = (uint64_t)v9;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "Found chats: %@", buf, 0xCu);
    }

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "isFiltered");
        if (v19 == 2)
        {
          objc_msgSend(v18, "updateIsRecovered:", 1);
          objc_msgSend(v18, "updateIsFiltered:", 1);
        }
        else if (IMOSLoggingEnabled(v19))
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = objc_msgSend(v18, "isFiltered");
            *(_DWORD *)buf = 134218242;
            v33 = v21;
            v34 = 2112;
            v35 = v18;
            _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "Chat is already out of Junk: %lld, not recovering: %@", buf, 0x16u);
          }

        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v15);
  }

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v26);
LABEL_39:

  return v22;
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
