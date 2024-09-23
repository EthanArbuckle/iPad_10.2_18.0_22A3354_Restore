@implementation MCMCommandCreateOrLookupWithBundle

- (MCMCommandCreateOrLookupWithBundle)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  MCMCommandCreateOrLookupWithBundle *v10;
  id v11;
  char *v12;
  uint64_t v13;
  NSURL *bundleURL;
  uint64_t v15;
  NSURL *executableURL;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MCMCommandCreateOrLookupWithBundle;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v18, sel_initWithMessage_context_reply_, v8, v9, a5);
  if (v10)
  {
    v10->_createIfNecessary = objc_msgSend(v8, "createIfNecessary");
    v10->_transient = objc_msgSend(v8, "transient");
    v10->_issueSandboxExtension = objc_msgSend(v8, "issueSandboxExtension");
    v11 = objc_retainAutorelease(v8);
    v12 = (char *)objc_msgSend(v11, "sandboxToken");
    if (v12)
      v12 = strndup(v12, 0x800uLL);
    v10->_sandboxToken = v12;
    objc_msgSend(v11, "bundleURL");
    v13 = objc_claimAutoreleasedReturnValue();
    bundleURL = v10->_bundleURL;
    v10->_bundleURL = (NSURL *)v13;

    objc_msgSend(v11, "executableURL");
    v15 = objc_claimAutoreleasedReturnValue();
    executableURL = v10->_executableURL;
    v10->_executableURL = (NSURL *)v15;

    -[MCMCommandCreateOrLookupWithBundle _commonInit:](v10, "_commonInit:", v9);
  }

  return v10;
}

- (void)_commonInit:(id)a3
{
  id v4;
  uint64_t v5;
  MCMError *v6;
  MCMError *error;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MCMCodeSignInfo *v16;
  MCMCodeSignInfo *info;
  MCMCodeSignInfo *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  MCMError *v24;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  MCMUserIdentity *v30;
  MCMUserIdentity *userIdentity;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  MCMUserIdentity *v37;
  MCMUserIdentity *v38;
  MCMUserIdentity *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  MCMContainerIdentity *v44;
  MCMContainerIdentity *containerIdentity;
  MCMError *v46;
  MCMError *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  unint64_t containerClass;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  unint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59 = 1;
  if (self->_sandboxToken)
  {
    v5 = sandbox_extension_consume();
    if (v5 < 0)
    {
      v6 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 57);
      error = self->_error;
      self->_error = v6;

      v8 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    v5 = -1;
  }
  self->_containerClass = 2;
  -[NSURL path](self->_bundleURL, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasSuffix:", CFSTR(".appex"));

  if (v10)
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[NSURL path](self->_bundleURL, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v61 = v12;
      _os_log_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] is a plugin", buf, 0xCu);

    }
    self->_containerClass = 4;
  }
  -[MCMCommand context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "globalConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "staticConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "configForContainerClass:", self->_containerClass);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[MCMCodeSignInfo initWithURL:error:]([MCMCodeSignInfo alloc], "initWithURL:error:", self->_executableURL, &v59);
  info = self->_info;
  self->_info = v16;

  v18 = self->_info;
  if (!v18)
    goto LABEL_33;
  v19 = -[MCMCodeSignInfo platform](v18, "platform");
  -[MCMCodeSignInfo entitlements](self->_info, "entitlements");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 != 2)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("com.apple.security.app-sandbox"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLValue");

    if ((v27 & 1) == 0)
      goto LABEL_12;
    goto LABEL_14;
  }
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("com.apple.private.security.no-container"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  if (!v23)
  {
LABEL_14:
    -[MCMCodeSignInfo identifier](self->_info, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientIdentity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMXPCMessageBase userIdentityForContainerIdentifier:clientIdentity:containerClass:error:](MCMXPCMessageBase, "userIdentityForContainerIdentifier:clientIdentity:containerClass:error:", v28, v29, self->_containerClass, &v59);
    v30 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
    userIdentity = self->_userIdentity;
    self->_userIdentity = v30;

    if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
    if (MCMRequirePersonaTelemetryOnly_result
      && v59 != 1
      && -[MCMUserIdentity isNoSpecificPersona](self->_userIdentity, "isNoSpecificPersona"))
    {
      container_log_handle_for_category();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v4, "clientIdentity");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "codeSignInfo");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "identifier");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        containerClass = self->_containerClass;
        -[MCMCodeSignInfo identifier](self->_info, "identifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "clientIdentity");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v61 = v48;
        v62 = 2048;
        v63 = containerClass;
        v64 = 2114;
        v65 = v49;
        v66 = 2114;
        v67 = v50;
        _os_log_fault_impl(&dword_1CF807000, v32, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);

      }
      v59 = 1;
      goto LABEL_32;
    }
    if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1)
      dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_16);
    v33 = v59;
    if (MCMRequirePersonaAndConvertSystemToPersonal_result && v59 != 1)
    {
      if (-[MCMUserIdentity isNoSpecificPersona](self->_userIdentity, "isNoSpecificPersona"))
      {
        container_log_handle_for_category();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v4, "clientIdentity");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "codeSignInfo");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "identifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = self->_containerClass;
          -[MCMCodeSignInfo identifier](self->_info, "identifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v61 = v51;
          v62 = 2048;
          v63 = v52;
          v64 = 2114;
          v65 = v53;
          _os_log_fault_impl(&dword_1CF807000, v34, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona - converting to Personal", buf, 0x20u);

        }
        v59 = 1;
        objc_msgSend(v4, "userIdentityCache");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMUserIdentity posixUser](self->_userIdentity, "posixUser");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "userIdentityForPersonalPersonaWithPOSIXUser:", v36);
        v37 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
        v38 = self->_userIdentity;
        self->_userIdentity = v37;

      }
      v33 = v59;
    }
    if (v33 == 1)
    {
LABEL_32:
      v39 = self->_userIdentity;
      -[MCMCodeSignInfo identifier](self->_info, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[MCMCodeSignInfo platform](self->_info, "platform");
      -[MCMCommand context](self, "context");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "userIdentityCache");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v39, v40, v8, v41, v43, &v59);
      v44 = (MCMContainerIdentity *)objc_claimAutoreleasedReturnValue();
      containerIdentity = self->_containerIdentity;
      self->_containerIdentity = v44;

      if (self->_containerIdentity)
        goto LABEL_35;
    }
LABEL_33:
    v24 = [MCMError alloc];
    v25 = v59;
    goto LABEL_34;
  }
LABEL_12:
  v24 = [MCMError alloc];
  v25 = 96;
LABEL_34:
  v46 = -[MCMError initWithErrorType:](v24, "initWithErrorType:", v25);
  v47 = self->_error;
  self->_error = v46;

LABEL_35:
  if ((v5 & 0x8000000000000000) == 0)
    sandbox_extension_release();
LABEL_37:

}

- (void)dealloc
{
  const char **p_sandboxToken;
  char *sandboxToken;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = (char *)self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)MCMCommandCreateOrLookupWithBundle;
  -[MCMCommandCreateOrLookupWithBundle dealloc](&v5, sel_dealloc);
}

- (BOOL)preflightClientAllowed
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[MCMCommandCreateOrLookupWithBundle error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  -[MCMCommand context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandCreateOrLookupWithBundle containerIdentity](self, "containerIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isAllowedToLookupContainerIdentity:", v7);

  if (v8)
  {
    if (MCMRequirePersona_onceToken != -1)
      dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
    if (!MCMRequirePersona_result)
      return 1;
    -[MCMCommandCreateOrLookupWithBundle containerIdentity](self, "containerIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containerClass");
    if (v10 > 0xE || ((1 << v10) & 0x4ED4) == 0)
    {

      return 1;
    }
    -[MCMCommandCreateOrLookupWithBundle containerIdentity](self, "containerIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isNoSpecificPersona");

    if (!v13)
      return 1;
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      -[MCMCommand context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "clientIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "codeSignInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommandCreateOrLookupWithBundle containerIdentity](self, "containerIdentity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "containerClass");
      -[MCMCommandCreateOrLookupWithBundle containerIdentity](self, "containerIdentity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommand context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "clientIdentity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v17;
      v27 = 2048;
      v28 = v19;
      v29 = 2114;
      v30 = v21;
      v31 = 2114;
      v32 = v23;
      _os_log_fault_impl(&dword_1CF807000, v14, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);

    }
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
    if (MCMRequirePersonaTelemetryOnly_result)
      return 1;
  }
  return 0;
}

- (void)execute
{
  void *v3;
  void *v4;
  MCMError *v5;
  MCMError *v6;
  void *v7;
  void *v8;
  MCMResultWithContainerBase *v9;
  void *v10;
  MCMCommandCreateOrLookupWithBundle *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  MCMError *v25;
  void *v26;
  void *v27;
  MCMError *v28;
  id v29;
  _QWORD __s[2];

  __s[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  __s[0] = 0;
  -[MCMCommandCreateOrLookupWithBundle error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCMCommandCreateOrLookupWithBundle error](self, "error");
    v5 = (MCMError *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v6 = v5;
    v7 = 0;
    v8 = 0;
LABEL_4:
    v9 = -[MCMResultBase initWithError:]([MCMResultWithContainerBase alloc], "initWithError:", v6);
    goto LABEL_5;
  }
  v11 = objc_retainAutorelease(self);
  if (-[MCMCommandCreateOrLookupWithBundle sandboxToken](v11, "sandboxToken"))
  {
    -[MCMCommandCreateOrLookupWithBundle sandboxToken](objc_retainAutorelease(v11), "sandboxToken");
    v12 = sandbox_extension_consume();
    if (v12 < 0)
    {
      v5 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 57);
      goto LABEL_3;
    }
  }
  else
  {
    v12 = -1;
  }
  -[MCMCommand context](v11, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "containerFactory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandCreateOrLookupWithBundle containerIdentity](v11, "containerIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v14, "containerForContainerIdentity:createIfNecessary:error:", v15, -[MCMCommandCreateOrLookupWithBundle createIfNecessary](v11, "createIfNecessary"), &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (MCMError *)v29;

  objc_msgSend(v8, "metadataMinimal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_21;
  v27 = v3;
  if (-[MCMCommandCreateOrLookupWithBundle issueSandboxExtension](v11, "issueSandboxExtension"))
    goto LABEL_13;
  -[MCMCommand context](v11, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userIdentity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isDataSeparated");

  if (v19)
  {
LABEL_13:
    -[MCMCommand context](v11, "context");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "clientIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v6;
    v23 = (void *)objc_msgSend(v20, "issueSandboxExtensionWithIdentity:containerPath:legacyExtensionPolicy:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:error:", v21, v22, 1, 1, 1, &v28);
    v24 = v12;
    v25 = v28;

    __s[0] = v23;
    v6 = v25;
    v12 = v24;
  }
  else
  {
    v23 = 0;
  }
  v3 = v27;
  if (v23 || !v6 || -[MCMError type](v6, "type") == 1 || -[MCMError type](v6, "type") == 72)
  {
    v9 = -[MCMResultWithContainerBase initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:]([MCMResultWithContainerBase alloc], "initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:", v7, v23, 1, 0, 0, 0);
    if (v23)
    {
      free(v23);
      memset_s(__s, 8uLL, 0, 8uLL);
    }
  }
  else
  {
LABEL_21:
    v9 = 0;
  }
  if ((v12 & 0x8000000000000000) == 0)
    sandbox_extension_release();
  if (!v9)
    goto LABEL_4;
LABEL_5:
  -[MCMCommand resultPromise](self, "resultPromise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "completeWithResult:", v9);

  objc_autoreleasePoolPop(v3);
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (BOOL)transient
{
  return self->_transient;
}

- (BOOL)issueSandboxExtension
{
  return self->_issueSandboxExtension;
}

- (const)sandboxToken
{
  return self->_sandboxToken;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSURL)executableURL
{
  return self->_executableURL;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (MCMCodeSignInfo)info
{
  return self->_info;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (MCMError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_executableURL, 0);
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

+ (unint64_t)command
{
  return 36;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
