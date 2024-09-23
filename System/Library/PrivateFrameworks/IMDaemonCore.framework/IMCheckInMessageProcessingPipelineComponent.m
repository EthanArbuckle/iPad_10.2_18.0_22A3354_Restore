@implementation IMCheckInMessageProcessingPipelineComponent

- (IMCheckInMessageProcessingPipelineComponent)initWithAccount:(id)a3
{
  id v5;
  IMCheckInMessageProcessingPipelineComponent *v6;
  IMCheckInMessageProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMCheckInMessageProcessingPipelineComponent;
  v6 = -[IMCheckInMessageProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t v28[16];
  uint8_t v29[16];
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<IMCheckInMessageProcessingPipelineComponent> Started processing", buf, 2u);
    }

  }
  v6 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EFC8D600);
  if ((v6 & 1) != 0)
  {
    v7 = v4;
    objc_msgSend(v7, "balloonPluginBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMBalloonExtensionIDWithSuffix();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      -[IMCheckInMessageProcessingPipelineComponent _getURL:](self, "_getURL:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v7, "fromIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_stripFZIDPrefix");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "shouldDropIncomingCheckInMessageWithURL:senderHandle:isFromMe:", v12, v14, objc_msgSend(v7, "isFromMe"));

        if (v16)
        {
          if (IMOSLoggingEnabled(v17))
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v26 = 0;
              _os_log_impl(&dword_1D1413000, v18, OS_LOG_TYPE_INFO, "<IMCheckInMessageProcessingPipelineComponent> Message should be dropped", v26, 2u);
            }

          }
          v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v20 = (void *)objc_msgSend(v19, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 20, 0);
          v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v20);

        }
        else
        {
          v21 = objc_alloc_init(MEMORY[0x1E0D35A10]);
          objc_msgSend(v21, "fullfillWithValue:", v7);
        }

      }
      else
      {
        if (IMOSLoggingEnabled(0))
        {
          OSLogHandleForIMFoundationCategory();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v27 = 0;
            _os_log_impl(&dword_1D1413000, v24, OS_LOG_TYPE_INFO, "<IMCheckInMessageProcessingPipelineComponent> Unable to extract payload URL", v27, 2u);
          }

        }
        v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v7);
      }

    }
    else
    {
      if (IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v28 = 0;
          _os_log_impl(&dword_1D1413000, v23, OS_LOG_TYPE_INFO, "<IMCheckInMessageProcessingPipelineComponent> Message is not a Check In message", v28, 2u);
        }

      }
      v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v7);
    }

  }
  else
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "<IMCheckInMessageProcessingPipelineComponent> Message is not a balloon plugin", v29, 2u);
      }

    }
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
  }

  return v21;
}

- (id)_getURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = a3;
  IMExtensionPayloadUnarchivingClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonPluginPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v5, v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  v9 = 0;
  if (!v8 && v7)
  {
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D37E68]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (IMDAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

@end
