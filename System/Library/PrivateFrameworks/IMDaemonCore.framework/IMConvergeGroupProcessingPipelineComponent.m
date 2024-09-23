@implementation IMConvergeGroupProcessingPipelineComponent

- (IMConvergeGroupProcessingPipelineComponent)initWithIDSTrustedData:(id)a3
{
  id v5;
  IMConvergeGroupProcessingPipelineComponent *v6;
  IMConvergeGroupProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMConvergeGroupProcessingPipelineComponent;
  v6 = -[IMConvergeGroupProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_idsTrustedData, a3);

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = IMOSLoggingEnabled(v4);
  if ((_DWORD)v5)
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "<IMConvergeGroupProcessingPipelineComponent> Started processing for chat: %@", buf, 0xCu);
    }

  }
  if (v4)
  {
    if (objc_msgSend(v4, "style") == 43)
    {
      objc_msgSend(v3, "GUID");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "messageWithGUID:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        +[IMDServiceController sharedController](IMDServiceController, "sharedController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "replicationSourceServiceName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "serviceWithName:", v11);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          if (IMOSLoggingEnabled(v12))
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "<IMConvergeGroupProcessingPipelineComponent> already have message - nothing to converge", buf, 2u);
            }

          }
        }
        else
        {
          objc_msgSend(v3, "serviceSession");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "account");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "groupID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "participantIdentifiers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "fromIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "toIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "groupParticipantVersion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "groupProtocolVersion");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "timestamp");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "groupPhotoCreationTime");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "_convergeGroupChatIfNeededWithServiceSession:account:replicationService:groupID:incomingParticipants:fromIdentifier:toIdentifier:receivedGroupParticipantVersion:receivedGroupProtocolVersion:messageTimeStamp:groupPhotoCreationTime:", v26, v25, v27, v24, v23, v15, v16, v17, v18, v19, v20);

        }
      }
      else if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "<IMConvergeGroupProcessingPipelineComponent> missing message guid", buf, 2u);
        }

      }
LABEL_23:

    }
  }
  else if (IMOSLoggingEnabled(v5))
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "<IMConvergeGroupProcessingPipelineComponent> No chat found, nothing to converge", buf, 2u);
    }
    goto LABEL_23;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v3);

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTrustedData, 0);
}

@end
