@implementation IMResolveFallbackHashesProcessingPipelineComponent

- (id)_associatedMessageGUIDForInput:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "associatedMessageGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "associatedMessageFallbackHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replicationSourceServiceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") && objc_msgSend(v7, "length"))
  {
    IMAssociatedMessageDecodeGUID();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMResolveFallbackHashesProcessingPipelineComponent _messageGUIDForInput:providedGUID:fallbackHash:](self, "_messageGUIDForInput:providedGUID:fallbackHash:", v6, v10, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      if ((void *)v11 == v10)
      {
        v16 = v7;
      }
      else
      {
        objc_msgSend(v6, "associatedMessageGUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = IMAssociatedMessageDecodePartIndex();

        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          v15 = 0;
        else
          v15 = v14;
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("p:%ld/%@"), v15, v12);
      }
      v17 = v16;
    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v22 = objc_msgSend(v8, "length");
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Found no source message GUID for fallback hash with length %llu, rejecting replicated message", buf, 0xCu);
        }

      }
      if (a4)
      {
        v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = 0;
        *a4 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 17, 0);
      }
      else
      {
        v17 = 0;
      }
    }

  }
  else
  {
    v17 = v7;
  }

  return v17;
}

- (id)_threadIdentifierForInput:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id ThreadIdentifierWithComponents;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "threadIdentifierGUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadOriginatorFallbackHash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replicationSourceServiceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length") && objc_msgSend(v7, "length"))
  {
    IMMessageThreadIdentifierGetComponents();
    v10 = 0;
    v11 = 0;
    v12 = v11;
    if (v10 && v11)
    {
      -[IMResolveFallbackHashesProcessingPipelineComponent _messageGUIDForInput:providedGUID:fallbackHash:](self, "_messageGUIDForInput:providedGUID:fallbackHash:", v6, v10, v8);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
      {
        if ((id)v13 == v10)
          ThreadIdentifierWithComponents = v7;
        else
          ThreadIdentifierWithComponents = (id)IMMessageCreateThreadIdentifierWithComponents();
        v16 = ThreadIdentifierWithComponents;
      }
      else
      {
        if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v21 = objc_msgSend(v8, "length");
            _os_log_impl(&dword_1D1413000, v17, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Found no source message GUID for fallback hash with length %llu, rejecting replicated message", buf, 0xCu);
          }

        }
        if (a4)
        {
          v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v16 = 0;
          *a4 = (id)objc_msgSend(v18, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 17, 0);
        }
        else
        {
          v16 = 0;
        }
      }

    }
    else
    {
      v16 = v7;
    }

  }
  else
  {
    v16 = v7;
  }

  return v16;
}

- (id)_messageGUIDForInput:(id)a3 providedGUID:(id)a4 fallbackHash:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  int v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "replicationSourceServiceName");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "messageWithGUID:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (IMOSLoggingEnabled(v15))
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v24 = 138412290;
          v25 = v9;
          _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Found existing message for GUID %@", (uint8_t *)&v24, 0xCu);
        }

      }
      v17 = v9;
LABEL_8:

      goto LABEL_23;
    }
    v11 = objc_msgSend(v10, "length");
    if (v11)
    {
      if (IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          v24 = 138412290;
          v25 = v9;
          _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Found no existing message for GUID %@, using fallback hash", (uint8_t *)&v24, 0xCu);
        }

      }
      objc_msgSend(v8, "chat");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMResolveFallbackHashesProcessingPipelineComponent _messageGUIDForMessageWithFallbackHash:chat:](self, "_messageGUIDForMessageWithFallbackHash:chat:", v10, v19);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      if (v17)
        goto LABEL_8;
    }
  }
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(v10, "length");
      v24 = 138412546;
      v25 = v9;
      v26 = 2048;
      v27 = v21;
      _os_log_impl(&dword_1D1413000, v20, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> No existing message found with provided GUID %@ or fallbackHash (len: %llu)", (uint8_t *)&v24, 0x16u);
    }

  }
  if (objc_msgSend(v8, "isFromMe"))
    v22 = v9;
  else
    v22 = 0;
  v17 = v22;
LABEL_23:

  return v17;
}

- (id)_messageGUIDForMessageWithFallbackHash:(id)a3 chat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedMessageItemsWithFallbackHash:inChat:limit:", v5, v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v10))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "guid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412546;
        v16 = v12;
        v17 = 2048;
        v18 = objc_msgSend(v5, "length");
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Found message %@ for fallback hash with length %llu", (uint8_t *)&v15, 0x16u);

      }
    }
    objc_msgSend(v9, "guid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<IMResolveFallbackHashesProcessingPipelineComponent> Started processing", buf, 2u);
    }

  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v13 = 0;
    -[IMResolveFallbackHashesProcessingPipelineComponent _associatedMessageGUIDForInput:error:](self, "_associatedMessageGUIDForInput:error:", v4, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (v7)
    {
      v8 = v7;
      goto LABEL_12;
    }
    objc_msgSend(v4, "setAssociatedMessageGUID:", v6);

  }
  v12 = 0;
  -[IMResolveFallbackHashesProcessingPipelineComponent _threadIdentifierForInput:error:](self, "_threadIdentifierForInput:error:", v4, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (!v8)
  {
    objc_msgSend(v4, "setThreadIdentifierGUID:", v6);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
    goto LABEL_14;
  }
LABEL_12:
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v8);
LABEL_14:
  v10 = (void *)v9;

  return v10;
}

@end
