@implementation IMFindAccountProcessingPipelineComponent

- (IMFindAccountProcessingPipelineComponent)initWithReceivingAccount:(id)a3
{
  id v5;
  IMFindAccountProcessingPipelineComponent *v6;
  IMFindAccountProcessingPipelineComponent *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMFindAccountProcessingPipelineComponent;
  v6 = -[IMFindAccountProcessingPipelineComponent init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_receivingAccount, a3);

  return v7;
}

- (id)runIndividuallyWithInput:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  __CFString *v45;
  uint64_t v46;
  void *v47;
  char v48;
  char v49;
  void *v50;
  BOOL v51;
  id v52;
  dispatch_time_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  id v59;
  void *v60;
  void *v61;
  int IsEmail;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  id v67;
  void *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  id v74;
  _QWORD v76[4];
  id v77;
  id v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  const __CFString *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled(v4))
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Started processing", buf, 2u);
    }

  }
  -[IMFindAccountProcessingPipelineComponent receivingAccount](self, "receivingAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMFindAccountProcessingPipelineComponent receivingAccount](self, "receivingAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v25 = objc_msgSend(v6, "isActive");
    v26 = v25;
    v27 = IMOSLoggingEnabled(v25);
    if ((v26 & 1) == 0)
    {
      if ((_DWORD)v27)
      {
        OSLogHandleForIMFoundationCategory();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v57, OS_LOG_TYPE_INFO, "No service session, and the account is not active - ignoring message", buf, 2u);
        }

      }
      if (IMOSLoggingEnabled(v27))
      {
        OSLogHandleForIMFoundationCategory();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v58, OS_LOG_TYPE_INFO, "<IMMessageLegacyProcessingPipelineComponent> Failed to find service session", buf, 2u);
        }

      }
      v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v17 = (void *)objc_msgSend(v59, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 22, 0);
      v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v17);
      goto LABEL_75;
    }
    if ((_DWORD)v27)
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1413000, v28, OS_LOG_TYPE_INFO, "No service session, and the account is active - try to create one", buf, 2u);
      }

    }
    objc_msgSend(v6, "createSessionIfNecessary");
    -[IMFindAccountProcessingPipelineComponent receivingAccount](self, "receivingAccount");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "session");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMOSLoggingEnabled(v30))
    {
      OSLogHandleForIMFoundationCategory();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v8;
        _os_log_impl(&dword_1D1413000, v31, OS_LOG_TYPE_INFO, "ServiceSession created: %@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v4, "replicationSourceServiceName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length") == 0;

  if (v10)
  {
    v17 = v8;
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isReplicationEnabled");

  if (v12)
  {
    +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "replicationSourceServiceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMFindAccountProcessingPipelineComponent receivingAccount](self, "receivingAccount");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionForReplicationSourceServiceName:replicatingAccount:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = objc_msgSend(v18, "isSOSAlertingEnabled");

    if ((_DWORD)v14)
    {
      v19 = -[IMFindAccountProcessingPipelineComponent _isSOSWithInput:](self, "_isSOSWithInput:", v4);
      if (!v17 && v19)
      {
        if (IMOSLoggingEnabled(v19))
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v4, "replicationSourceServiceName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMFindAccountProcessingPipelineComponent receivingAccount](self, "receivingAccount");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v80 = v22;
            v81 = 2112;
            v82 = (uint64_t)v23;
            _os_log_impl(&dword_1D1413000, v21, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Failed to find service session for replicated message with source service %@ replicating account %@, but is SOS, permitting on received iMessage account session instead", buf, 0x16u);

          }
        }
        -[IMFindAccountProcessingPipelineComponent receivingAccount](self, "receivingAccount");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "session");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          goto LABEL_58;
LABEL_36:
        objc_msgSend(v17, "account");
        v43 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v43;
LABEL_37:
        objc_msgSend(v4, "setAccount:", v6);
        if (IMOSLoggingEnabled(objc_msgSend(v4, "setServiceSession:", v17)))
        {
          OSLogHandleForIMFoundationCategory();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v4, "replicationSourceServiceName");
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v80 = v6;
            v81 = 2112;
            v82 = (uint64_t)v17;
            v83 = 2112;
            v84 = v45;
            _os_log_impl(&dword_1D1413000, v44, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Assigning account %@ service session %@ (replication source: %@)", buf, 0x20u);

          }
        }
        v46 = IMGetCachedDomainIntForKey();
        objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "isInternalInstall");
        if (v46 > 0)
          v49 = v48;
        else
          v49 = 0;
        if ((v49 & 1) != 0)
        {
          objc_msgSend(v4, "replicationSourceServiceName");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "length") == 0;

          if (!v51)
          {
            v52 = objc_alloc_init(MEMORY[0x1E0D35A10]);
            v53 = dispatch_time(0, 1000000000 * v46);
            v76[0] = MEMORY[0x1E0C809B0];
            v76[1] = 3221225472;
            v76[2] = sub_1D15DCC90;
            v76[3] = &unk_1E9228750;
            v54 = v52;
            v77 = v54;
            v78 = v4;
            dispatch_after(v53, MEMORY[0x1E0C80D38], v76);
            v55 = v78;
            v36 = v54;

            goto LABEL_76;
          }
        }
        else
        {

        }
        v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithValue:", v4);
LABEL_75:
        v36 = (id)v56;
        goto LABEL_76;
      }
    }
    if (!v17)
    {
LABEL_58:
      objc_msgSend(v4, "toIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v60, "length"))
      {
        objc_msgSend(v4, "toIdentifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        IsEmail = IMStringIsEmail();

        if (IsEmail)
          v64 = 17;
        else
          v64 = 16;
      }
      else
      {

        IsEmail = 0;
        v64 = 16;
      }
      if (IMOSLoggingEnabled(v63))
      {
        OSLogHandleForIMFoundationCategory();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v4, "replicationSourceServiceName");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMFindAccountProcessingPipelineComponent receivingAccount](self, "receivingAccount");
          v71 = objc_claimAutoreleasedReturnValue();
          v72 = (void *)v71;
          v73 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          v80 = v70;
          v81 = 2112;
          if (IsEmail)
            v73 = CFSTR("YES");
          v82 = v71;
          v83 = 2112;
          v84 = v73;
          _os_log_impl(&dword_1D1413000, v69, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Failed to find service session for replicated message with source service %@ replicating account %@ (email alias: %@)", buf, 0x20u);

        }
      }
      v74 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v17 = (void *)objc_msgSend(v74, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], v64, 0);
      v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v17);
      goto LABEL_75;
    }
    objc_msgSend(v17, "mainSession");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMFindAccountProcessingPipelineComponent receivingAccount](self, "receivingAccount");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "toIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_stripFZIDPrefix");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v37, "acceptsIncomingReplicatedMessagesFromAccount:toIdentifier:isSOS:", v38, v40, -[IMFindAccountProcessingPipelineComponent _isSOSWithInput:](self, "_isSOSWithInput:", v4));

    if ((v41 & 1) != 0)
      goto LABEL_36;
    if (IMOSLoggingEnabled(v42))
    {
      OSLogHandleForIMFoundationCategory();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "replicationSourceServiceName");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v80 = v66;
        _os_log_impl(&dword_1D1413000, v65, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Has replication source %@ but service session rejected message, dropping", buf, 0xCu);

      }
    }
    v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v68 = (void *)objc_msgSend(v67, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 17, 0);
    v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v68);

  }
  else
  {
    if (IMOSLoggingEnabled(v13))
    {
      OSLogHandleForIMFoundationCategory();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "replicationSourceServiceName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v80 = v33;
        _os_log_impl(&dword_1D1413000, v32, OS_LOG_TYPE_INFO, "<IMFindAccountProcessingPipelineComponent> Has replication source %@ but feature flag disabled, dropping message", buf, 0xCu);

      }
    }
    v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v35 = (void *)objc_msgSend(v34, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D35A00], 17, 0);
    v36 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D35A10]), "initWithError:", v35);

    v17 = v8;
  }
LABEL_76:

  return v36;
}

- (BOOL)_isSOSWithInput:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "isSOS");
  else
    v4 = 0;

  return v4;
}

- (IMDAccount)receivingAccount
{
  return self->_receivingAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivingAccount, 0);
}

@end
