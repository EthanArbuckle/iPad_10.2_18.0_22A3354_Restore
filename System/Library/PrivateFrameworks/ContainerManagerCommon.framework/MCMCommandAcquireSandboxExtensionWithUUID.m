@implementation MCMCommandAcquireSandboxExtensionWithUUID

- (MCMCommandAcquireSandboxExtensionWithUUID)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandAcquireSandboxExtensionWithUUID *v9;
  uint64_t v10;
  MCMConcreteContainerIdentity *concreteContainerIdentity;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandAcquireSandboxExtensionWithUUID;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "concreteContainerIdentity");
    v10 = objc_claimAutoreleasedReturnValue();
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;

  }
  return v9;
}

- (BOOL)preflightClientAllowed
{
  MCMCommandAcquireSandboxExtensionWithUUID *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[MCMCommand context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMCommandAcquireSandboxExtensionWithUUID concreteContainerIdentity](v2, "concreteContainerIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v4, "isAllowedToLookupContainerIdentity:", v5);

  return (char)v2;
}

- (void)execute
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  MCMError *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  MCMError *v15;
  NSObject *v16;
  MCMResultAcquireSandboxExtensionWithUUID *v17;
  MCMResultAcquireSandboxExtensionWithUUID *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MCMResultAcquireSandboxExtensionWithUUID *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *context;
  MCMError *v29;
  id v30;
  void *__s;
  uint8_t buf[4];
  _BOOL4 v33;
  __int16 v34;
  MCMError *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommandAcquireSandboxExtensionWithUUID concreteContainerIdentity](self, "concreteContainerIdentity");
  v3 = objc_claimAutoreleasedReturnValue();
  __s = 0;
  -[MCMCommand context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v27 = (void *)v3;
  objc_msgSend(v5, "entryForContainerIdentity:error:", v3, &v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (MCMError *)v30;

  v26 = v6;
  if (v6)
  {
    objc_msgSend(v6, "metadataMinimal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](self, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v7;
    v13 = 1;
    v14 = (void *)objc_msgSend(v10, "issueSandboxExtensionWithIdentity:containerPath:legacyExtensionPolicy:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:error:", v11, v12, 0, 1, 1, &v29);
    v15 = v29;

    __s = v14;
    if (v14)
    {
LABEL_5:
      v7 = v15;
      goto LABEL_8;
    }
    if (v15)
    {
      v14 = 0;
      v13 = 0;
      goto LABEL_5;
    }
    v7 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 72, 3);
    v14 = 0;
  }
  else
  {
    v14 = 0;
    v8 = 0;
  }
  v13 = 0;
LABEL_8:
  container_log_handle_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v33 = v14 != 0;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1CF807000, v16, OS_LOG_TYPE_DEFAULT, "Acquire sandbox extension result: %d, error = %@", buf, 0x12u);
  }

  v17 = [MCMResultAcquireSandboxExtensionWithUUID alloc];
  v18 = v17;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v8, "userIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "personaUniqueString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerPath");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "containerDataURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MCMResultAcquireSandboxExtensionWithUUID initWithSandboxToken:personaUniqueString:url:](v18, "initWithSandboxToken:personaUniqueString:url:", v14, v20, v22);

  }
  else
  {
    v23 = -[MCMResultBase initWithError:](v17, "initWithError:", v7);
  }
  v24 = v26;
  if (v14)
  {
    free(v14);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  -[MCMCommand resultPromise](self, "resultPromise", v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "completeWithResult:", v23);

  objc_autoreleasePoolPop(context);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concreteContainerIdentity, 0);
}

+ (unint64_t)command
{
  return 35;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
