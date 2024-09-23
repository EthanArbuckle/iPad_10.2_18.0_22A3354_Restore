@implementation IMPlayedReceiptProcessingPipelineComponent

- (IMPlayedReceiptProcessingPipelineComponent)initWithPipelineResources:(id)a3
{
  id v5;
  IMPlayedReceiptProcessingPipelineComponent *v6;
  IMPlayedReceiptProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMPlayedReceiptProcessingPipelineComponent;
  v6 = -[IMPlayedReceiptProcessingPipelineComponent init](&v9, sel_init);
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

  -[IMPlayedReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
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

  -[IMPlayedReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imdAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_messageStore
{
  void *v2;
  void *v3;

  -[IMPlayedReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
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
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
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
  void *v36;
  void *v37;
  uint64_t v38;
  BOOL v39;
  int v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  id obj;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t v61[128];
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  if (IMOSLoggingEnabled(v56))
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v56, "GUID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v63 = v5;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "<IMPlayedReceiptProcessingPipelineComponent> Started processing for Message GUID: %@", buf, 0xCu);

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
        objc_msgSend(v56, "GUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = v8;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "    Ignoring played receipt for message: %@", buf, 0xCu);

      }
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v56);
  }
  else
  {
    objc_msgSend(v56, "GUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v56, "GUID");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[IMPlayedReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "chatsForMessageGUID:", v54);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled(v14))
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v63 = v54;
          v64 = 2112;
          v65 = v13;
          _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Found chats for messageID: %@   chats: %@", buf, 0x16u);
        }

      }
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      obj = v13;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v16)
      {
        v53 = *(_QWORD *)v58;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v58 != v53)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * v17);
            v19 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v56, "timestamp");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "__im_iMessageDateFromTimeStamp:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            -[IMPlayedReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "messageStore");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "messageWithGUID:", v54);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v52, "addObject:", v24);
              -[IMPlayedReceiptProcessingPipelineComponent _account](self, "_account");
              v25 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v25, "session");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[IMPlayedReceiptProcessingPipelineComponent _markMessageAsPlayedAndNotify:session:chat:date:](self, "_markMessageAsPlayedAndNotify:session:chat:date:", v24, v26, v18, v21);

              objc_msgSend(v56, "idsTrustedData");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v25) = objc_msgSend(v27, "isFromMe");

              if ((v25 & 1) == 0)
              {
                objc_msgSend(v56, "idsTrustedData");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "fromPushID");
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v56, "idsTrustedData");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "fromIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29 && v31)
                {
                  -[IMPlayedReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "recentsController");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "_stripFZIDPrefix");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "updateLatestActiveDestination:ForHandle:incomingType:", v29, v34, 1);

                  -[IMPlayedReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "recentsController");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  IMSingleObjectArray();
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "noteRecentMessageForPeople:", v37);

                }
              }
            }

            ++v17;
          }
          while (v16 != v17);
          v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        }
        while (v16);
      }

      v38 = objc_msgSend(v52, "count");
      v39 = v38 == 0;
      v40 = IMOSLoggingEnabled(v38);
      if (v39)
      {
        if (v40)
        {
          OSLogHandleForIMFoundationCategory();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v56, "GUID");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v63 = v47;
            _os_log_impl(&dword_1D1413000, v46, OS_LOG_TYPE_INFO, "Unable to mark message with GUID=%@: message not found", buf, 0xCu);

          }
        }
        v48 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v49 = (void *)objc_msgSend(v48, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 5, 0);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v49);

      }
      else
      {
        if (v40)
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v56, "GUID");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v63 = v42;
            _os_log_impl(&dword_1D1413000, v41, OS_LOG_TYPE_INFO, "Marked message with GUID=%@ as played", buf, 0xCu);

          }
        }
        objc_msgSend(obj, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setChat:", v43);

        v44 = (void *)objc_msgSend(v52, "copy");
        objc_msgSend(v56, "setMessageItems:", v44);

        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v56);
      }

    }
    else
    {
      v45 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v55 = (void *)objc_msgSend(v45, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 3, 0);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v55);

    }
  }

  return v9;
}

- (void)_markMessageAsPlayedAndNotify:(id)a3 session:(id)a4 chat:(id)a5 date:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  const __CFString *v28;
  int v29;
  uint64_t v30;
  const __CFString *v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t ShouldAutomaticallySave;
  int v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint8_t buf[4];
  id v53;
  __int16 v54;
  const __CFString *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v49 = a4;
  v51 = a5;
  v11 = a6;
  if (IMOSLoggingEnabled(v11))
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v10;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Mark message as played: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v10, "setFlags:", objc_msgSend(v10, "flags", v49) | 0x400000);
  v13 = v11;
  if (v13)
  {
    objc_msgSend(v10, "time");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "laterDate:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v10, "timeDelivered");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (v17)
  {
    if (v15)
    {
      objc_msgSend(v10, "setTimeDelivered:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTimeDelivered:", v18);

    }
  }
  objc_msgSend(v10, "timeRead");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v20)
  {
    if (v15)
    {
      objc_msgSend(v10, "setTimeRead:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "__im_dateWithCurrentServerTime");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTimeRead:", v21);

    }
  }
  objc_msgSend(v10, "timePlayed");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (v23)
  {
    if (v15)
    {
      objc_msgSend(v10, "setTimePlayed:", v15);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTimePlayed:", v24);

    }
  }
  v25 = objc_msgSend(v10, "errorCode");
  if ((_DWORD)v25)
    v25 = objc_msgSend(v10, "setErrorCode:", 0);
  if (IMOSLoggingEnabled(v25))
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "guid");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isExpirable"))
        v28 = CFSTR("YES");
      else
        v28 = CFSTR("NO");
      v29 = objc_msgSend(v10, "isFromMe");
      v30 = objc_msgSend(v10, "expireState");
      if (v29)
        v31 = CFSTR("YES");
      else
        v31 = CFSTR("NO");
      *(_DWORD *)buf = 138413058;
      v53 = v27;
      v54 = 2112;
      v55 = v28;
      v56 = 2112;
      v57 = v31;
      v58 = 2048;
      v59 = v30;
      _os_log_impl(&dword_1D1413000, v26, OS_LOG_TYPE_INFO, "message.GUID = %@; isExpirable = %@; isFromMe = %@; expireState = %lld",
        buf,
        0x2Au);

    }
  }
  if (objc_msgSend(v10, "isExpirable")
    && (objc_msgSend(v10, "isFromMe") & 1) == 0
    && objc_msgSend(v10, "expireState") <= 0)
  {
    ShouldAutomaticallySave = IMMessageItemShouldAutomaticallySave();
    v32 = ShouldAutomaticallySave;
    v43 = IMOSLoggingEnabled(ShouldAutomaticallySave);
    if (v32)
    {
      if (v43)
      {
        OSLogHandleForIMFoundationCategory();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "guid");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v53 = v45;
          _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "Automatically saving received message played on linked device: %@", buf, 0xCu);

        }
      }
      v46 = 3;
    }
    else
    {
      if (v43)
      {
        OSLogHandleForIMFoundationCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "guid");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v53 = v48;
          _os_log_impl(&dword_1D1413000, v47, OS_LOG_TYPE_INFO, "Expire received message played on linked device: %@", buf, 0xCu);

        }
      }
      v46 = 1;
    }
    objc_msgSend(v10, "setExpireState:", v46);
    v33 = v32 ^ 1;
  }
  else
  {
    v32 = 0;
    v33 = 0;
  }
  -[IMPlayedReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "messageStore");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v35, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v10, 0, 1, 1, 0x400000);

  -[IMPlayedReceiptProcessingPipelineComponent pipelineResources](self, "pipelineResources");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "chatRegistry");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "updateStateForChat:hintMessage:shouldRebuildFailedMessageDate:", v51, 0, 0);

  if (v33)
  {
    objc_msgSend(v10, "guid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "_updateExpireStateForMessageGUID:", v39);

  }
  if (v32)
  {
    objc_msgSend(v51, "roomName");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "style") == 45)
      v41 = 45;
    else
      v41 = 43;
    objc_msgSend(v50, "sendSavedReceiptForMessage:toChatID:identifier:style:", v10, 0, v40, v41);

  }
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
