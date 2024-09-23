@implementation IMDeliveredQuietlyReceiptProcessingPipelineComponent

- (IMDeliveredQuietlyReceiptProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5;
  IMDeliveredQuietlyReceiptProcessingPipelineComponent *v6;
  IMDeliveredQuietlyReceiptProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMDeliveredQuietlyReceiptProcessingPipelineComponent;
  v6 = -[IMDeliveredQuietlyReceiptProcessingPipelineComponent init](&v9, sel_init);
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

  -[IMDeliveredQuietlyReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
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

  -[IMDeliveredQuietlyReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imdAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_messageStore
{
  void *v2;
  void *v3;

  -[IMDeliveredQuietlyReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
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
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  int v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
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
  uint8_t v48[128];
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
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
      v50 = v5;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "<IMDeliveredQuietlyReceiptProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);

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
        v50 = v8;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "    Ignoring delivered quietly receipt for message: %@", buf, 0xCu);

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
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[IMDeliveredQuietlyReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "messageStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "chatsForMessageGUID:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled(v16))
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v50 = v12;
          v51 = 2112;
          v52 = v15;
          _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "Found chats for messageID: %@   chats: %@", buf, 0x16u);
        }

      }
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v18 = v15;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v45;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v45 != v20)
              objc_enumerationMutation(v18);
            v22 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v21);
            -[IMDeliveredQuietlyReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources", v42);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "messageStore");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "messageWithGUID:", v12);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              objc_msgSend(v43, "addObject:", v25);
              -[IMDeliveredQuietlyReceiptProcessingPipelineComponent _account](self, "_account");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "session");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMDeliveredQuietlyReceiptProcessingPipelineComponent _markMessageAsDeliveredQuietlyAndNotify:session:chat:](self, "_markMessageAsDeliveredQuietlyAndNotify:session:chat:", v25, v27, v22);

            }
            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v19);
      }

      v28 = objc_msgSend(v43, "count");
      v29 = v28 == 0;
      v30 = IMOSLoggingEnabled(v28);
      if (v29)
      {
        if (v30)
        {
          OSLogHandleForIMFoundationCategory();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v42, "GUID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v38;
            _os_log_impl(&dword_1D1413000, v37, OS_LOG_TYPE_INFO, "Unable to mark message delivered quietly with GUID=%@: message not found", buf, 0xCu);

          }
        }
        v39 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v40 = (void *)objc_msgSend(v39, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 5, 0);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v40);

      }
      else
      {
        if (v30)
        {
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v42, "GUID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v50 = v32;
            _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "Marked message with GUID=%@ as delivered quietly", buf, 0xCu);

          }
        }
        objc_msgSend(v18, "firstObject", v42);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setChat:", v33);

        v34 = (void *)objc_msgSend(v43, "copy");
        objc_msgSend(v42, "setMessageItems:", v34);

        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v42);
      }

    }
    else
    {
      if (IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v35, OS_LOG_TYPE_INFO, "Unable to mark message delivered quietly with missing GUID", buf, 2u);
        }

      }
      v36 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v12 = (void *)objc_msgSend(v36, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 3, 0);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v12);
    }

  }
  return v9;
}

- (void)_markMessageAsDeliveredQuietlyAndNotify:(id)a3 session:(id)a4 chat:(id)a5
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
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Mark message as delivered quietly: %@", (uint8_t *)&v17, 0xCu);
    }

  }
  objc_msgSend(v8, "setFlags:", objc_msgSend(v8, "flags") | 0x400000000);
  if (objc_msgSend(v8, "errorCode"))
    objc_msgSend(v8, "setErrorCode:", 0);
  -[IMDeliveredQuietlyReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v8, 0, 1, 1, 0x400000000);

  -[IMDeliveredQuietlyReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
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
