@implementation IMMarkUnreadRequestProcessingPipelineComponent

- (IMMarkUnreadRequestProcessingPipelineComponent)initWithMessageStore:(id)a3 chatRegistry:(id)a4 recents:(id)a5 IDSService:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IMMarkUnreadRequestProcessingPipelineComponent *v15;
  IMMarkUnreadRequestProcessingPipelineComponent *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IMMarkUnreadRequestProcessingPipelineComponent;
  v15 = -[IMMarkUnreadRequestProcessingPipelineComponent init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_messageStore, a3);
    objc_storeStrong((id *)&v16->_chatRegistry, a4);
    objc_storeStrong((id *)&v16->_recents, a5);
    objc_storeStrong((id *)&v16->_service, a6);
  }

  return v16;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "GUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v5;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "<IMMarkUnreadRequestProcessingPipelineComponent> Started processing mark unread request for message GUID: %@", buf, 0xCu);
    }

  }
  v7 = objc_msgSend(v4, "isFromMe");
  if ((v7 & 1) != 0)
  {
    -[IMDMessageStore messageWithGUID:](self->_messageStore, "messageWithGUID:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") && v8)
    {
      v9 = -[IMDMessageStore markMessageGUIDUnread:](self->_messageStore, "markMessageGUIDUnread:", v5);
      if (v9)
      {
        if (IMOSLoggingEnabled(v9))
        {
          OSLogHandleForIMFoundationCategory();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v21 = v5;
            _os_log_impl(&dword_1D1413000, v10, OS_LOG_TYPE_INFO, "Successfully marked message (%@) as unread", buf, 0xCu);
          }

        }
        -[IMDMessageStore chatsForMessageGUID:](self->_messageStore, "chatsForMessageGUID:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setChat:", v12);

        v19 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setMessageItems:", v13);

      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
    }
    else
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v17 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 5, 0);
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v17);

    }
  }
  else
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v5;
        _os_log_impl(&dword_1D1413000, v15, OS_LOG_TYPE_INFO, "Ignoring mark unread request not from me for message: %@", buf, 0xCu);
      }

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
}

@end
