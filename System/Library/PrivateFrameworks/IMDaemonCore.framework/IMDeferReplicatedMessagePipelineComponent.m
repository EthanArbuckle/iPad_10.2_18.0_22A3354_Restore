@implementation IMDeferReplicatedMessagePipelineComponent

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  dispatch_time_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v4 = a3;
  if (-[IMDeferReplicatedMessagePipelineComponent skipDeferral](self, "skipDeferral"))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isInternalInstall") & 1) == 0)
  {

    goto LABEL_6;
  }
  v6 = IMGetCachedDomainBoolForKey();

  if (!v6)
  {
LABEL_6:
    -[IMDeferReplicatedMessagePipelineComponent _runIndividuallyWithInput:](self, "_runIndividuallyWithInput:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v7 = objc_alloc_init(MEMORY[0x1E0D35A10]);
  v8 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D14A57B8;
  block[3] = &unk_1E9229280;
  block[4] = self;
  v14 = v4;
  v9 = v7;
  v15 = v9;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  v10 = v15;
  v11 = v9;

LABEL_7:
  return v11;
}

- (id)_runIndividuallyWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL8 v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Started processing", (uint8_t *)&v15, 2u);
    }

  }
  v6 = -[IMDeferReplicatedMessagePipelineComponent _shouldDeferDeliveryWithInput:](self, "_shouldDeferDeliveryWithInput:", v4);
  if (v6)
  {
    if (IMOSLoggingEnabled(v6))
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "GUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v8;
        _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Deferring message %@", (uint8_t *)&v15, 0xCu);

      }
    }
    v9 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v10 = (void *)objc_msgSend(v9, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 18, 0);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v10);

  }
  else
  {
    -[IMDeferReplicatedMessagePipelineComponent replicationSourceServiceNameOverride](self, "replicationSourceServiceNameOverride");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[IMDeferReplicatedMessagePipelineComponent replicationSourceServiceNameOverride](self, "replicationSourceServiceNameOverride");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setReplicationSourceServiceName:", v13);

    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
  }

  return v11;
}

- (BOOL)_shouldDeferDeliveryWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  BOOL v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "replicationSourceServiceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
  {
    if (IMOSLoggingEnabled(v7))
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "GUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412290;
        v30 = v13;
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Allowing instant delivery of %@, message is not replicated.", (uint8_t *)&v29, 0xCu);

      }
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isInternalInstall"))
  {
    v9 = IMGetCachedDomainBoolForKey();

    if (v9)
    {
      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "GUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138412290;
          v30 = v12;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Allowing instant delivery of %@, default set", (uint8_t *)&v29, 0xCu);

        }
LABEL_22:

        goto LABEL_23;
      }
      goto LABEL_23;
    }
  }
  else
  {

  }
  v14 = objc_msgSend(v4, "isSOS");
  if (!(_DWORD)v14)
  {
    v16 = -[IMDeferReplicatedMessagePipelineComponent skipDeferral](self, "skipDeferral");
    if (v16)
    {
      if (IMOSLoggingEnabled(v16))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "GUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138412290;
          v30 = v17;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Allowing instant delivery of %@, skipDeferral is set", (uint8_t *)&v29, 0xCu);

        }
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    +[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "GUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "messageWithGUID:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v22 == 0;
    if (!v22)
    {
LABEL_34:

      goto LABEL_24;
    }
    objc_msgSend(v4, "replicationSourceServiceName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0D38F58]))
    {
      objc_msgSend(v22, "service");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0D38F50]);

      if (!v25)
        goto LABEL_30;
      objc_msgSend(v22, "service");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setReplicationSourceServiceName:", v23);
    }

LABEL_30:
    if (IMOSLoggingEnabled(v26))
    {
      OSLogHandleForIMFoundationCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "GUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412546;
        v30 = v28;
        v31 = 2112;
        v32 = v22;
        _os_log_impl(&dword_1D1413000, v27, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Allowing instant delivery of %@, found existing item %@", (uint8_t *)&v29, 0x16u);

      }
    }
    goto LABEL_34;
  }
  if (IMOSLoggingEnabled(v14))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "GUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412290;
      v30 = v15;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "<IMDeferReplicatedMessagePipelineComponent> Allowing instant delivery of %@, message is SOS", (uint8_t *)&v29, 0xCu);

    }
    goto LABEL_22;
  }
LABEL_23:
  v18 = 0;
LABEL_24:

  return v18;
}

- (BOOL)skipDeferral
{
  return self->_skipDeferral;
}

- (void)setSkipDeferral:(BOOL)a3
{
  self->_skipDeferral = a3;
}

- (NSString)replicationSourceServiceNameOverride
{
  return self->_replicationSourceServiceNameOverride;
}

- (void)setReplicationSourceServiceNameOverride:(id)a3
{
  objc_storeStrong((id *)&self->_replicationSourceServiceNameOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replicationSourceServiceNameOverride, 0);
}

@end
