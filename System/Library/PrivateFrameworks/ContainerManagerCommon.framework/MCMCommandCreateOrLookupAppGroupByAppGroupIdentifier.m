@implementation MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  MCMError *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MCMResultWithContainerBase *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MCMError *v28;
  MCMError *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  MCMError *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  MCMResultWithContainerBase *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  MCMResultWithContainerBase *v71;
  void *v72;
  BOOL v73;
  void *v74;
  void *v75;
  int v76;
  uint64_t v77;
  MCMError *v78;
  MCMError *v79;
  id v80;
  void *__s;
  uint64_t v82;
  uint8_t buf[4];
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v77 = MEMORY[0x1D17D7010](self, a2);
  __s = 0;
  v82 = 1;
  -[MCMCommand context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "codeSignInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "negatesReferenceToAppGroupIdentifier:", v8);

  -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier error](self, "error");
    v11 = (MCMError *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
LABEL_4:
    v16 = (void *)v77;
LABEL_5:
    v17 = -[MCMResultBase initWithError:]([MCMResultWithContainerBase alloc], "initWithError:", v11);
    goto LABEL_6;
  }
  if (!-[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier clientIsAllowed](self, "clientIsAllowed"))
  {
    if (!-[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier alwaysReturnPath](self, "alwaysReturnPath"))
    {
      v11 = 0;
      goto LABEL_3;
    }
    v76 = v9;
    objc_msgSend(v4, "userIdentity");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "posixUser");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "userIdentityWithPOSIXUser:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      v12 = 0;
      v17 = 0;
      v11 = 0;
      v16 = (void *)v77;
LABEL_34:

      v15 = 0;
      if (v11 || v82 == 1)
      {
        v14 = 0;
        v13 = 0;
      }
      else
      {
        v54 = [MCMError alloc];
        v11 = -[MCMError initWithErrorType:](v54, "initWithErrorType:", v82);
        v15 = 0;
        v14 = 0;
        v13 = 0;
      }
      goto LABEL_38;
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v37 = objc_claimAutoreleasedReturnValue();
    -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier appGroupIdentifier](self, "appGroupIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "containerConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v4, "platform");
    -[MCMCommand context](self, "context");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "userIdentityCache");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)v37;
    v75 = v36;
    +[MCMConcreteContainerIdentity containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMConcreteContainerIdentity, "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v37, v36, v38, v40, v41, v43, &v82);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier appGroupIdentifier](self, "appGroupIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "fsSanitizedStringFromString:allowSpaces:", v46, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        +[MCMContainerPath containerPathForContainerIdentity:containerPathIdentifier:](MCMContainerPath, "containerPathForContainerIdentity:containerPathIdentifier:", v44, v47);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = [MCMResultWithContainerBase alloc];
        objc_msgSend(v12, "containerPathIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "identifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v44, "containerClass");
        objc_msgSend(v44, "userIdentity");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "posixUser");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "userIdentity");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "personaUniqueString");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "containerDataURL");
        v67 = v44;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v57) = 0;
        LOBYTE(v56) = 1;
        v17 = -[MCMResultWithContainerBase initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:](v65, "initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:", v72, v63, v59, v61, v48, v50, 0, v56, v51, 0, v57, 0, 0);

        v44 = v67;
        v52 = v72;

        v11 = 0;
LABEL_33:

        v16 = (void *)v77;
        v36 = v75;
        goto LABEL_34;
      }
      container_log_handle_for_category();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier appGroupIdentifier](self, "appGroupIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v84 = v55;
        _os_log_error_impl(&dword_1CF807000, v53, OS_LOG_TYPE_ERROR, "Invalid app group identifier [%{public}@]", buf, 0xCu);

      }
      v11 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 138, 3);
      v12 = 0;
      v17 = 0;
    }
    else
    {
      v12 = 0;
      v17 = 0;
      v11 = 0;
    }
    v52 = v72;
    goto LABEL_33;
  }
  -[MCMCommand context](self, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "containerFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  objc_msgSend(v20, "containerForContainerIdentity:createIfNecessary:error:", v21, v9 ^ 1u, &v80);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (MCMError *)v80;

  objc_msgSend(v15, "metadataMinimal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_25;
  -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerConfig](self, "containerConfig");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "supportsProtectedContainerWithRestrictedEntitlement");

  v76 = v9;
  if (v23)
  {
    -[MCMCommand context](self, "context");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "clientIdentity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "codeSignInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "entitlements");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v11;
    v73 = +[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier secureRestrictedContainerIfNeededWithMetadata:entitlements:error:](MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier, "secureRestrictedContainerIfNeededWithMetadata:entitlements:error:", v14, v27, &v79);
    v28 = v79;

    if (!v73)
    {
      v12 = 0;
      v13 = 0;
      v11 = v28;
      goto LABEL_4;
    }
    v11 = v28;
  }
  v29 = v11;
  objc_msgSend(v14, "containerIdentity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerPath");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v11;
  v32 = (void *)objc_msgSend(v4, "issueSandboxExtensionWithIdentity:containerPath:legacyExtensionPolicy:extensionsUseProxiedClient:extensionsPolicyUsesProxiedClient:error:", v30, v31, 1, 1, 1, &v78);
  v11 = v78;

  __s = v32;
  if (!v32 && v11 && -[MCMError type](v11, "type") != 1 && -[MCMError type](v11, "type") != 72)
  {
LABEL_25:
    v12 = 0;
    v13 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v14, "containerPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containerDataURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = [MCMResultWithContainerBase alloc];
  objc_msgSend(v14, "uuid");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerPath");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "containerPathIdentifier");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v14, "containerClass");
  objc_msgSend(v14, "userIdentity");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "posixUser");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userIdentity");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "personaUniqueString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v57) = 0;
  LOBYTE(v56) = objc_msgSend(v14, "existed");
  v17 = -[MCMResultWithContainerBase initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:](v71, "initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:", v74, v66, v64, v62, v58, v33, v32, v56, v13, 0, v57, 0, 0);

  v16 = (void *)v77;
LABEL_38:
  if (!v17)
    goto LABEL_5;
  if (v76)
    -[MCMResultBase setCacheable:](v17, "setCacheable:", 0);
LABEL_6:
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  -[MCMCommand resultPromise](self, "resultPromise");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "completeWithResult:", v17);

  objc_autoreleasePoolPop(v16);
}

- (BOOL)preflightClientAllowed
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_2;
  if (-[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier alwaysReturnPath](self, "alwaysReturnPath")
    || (v4 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier clientIsAllowed](self, "clientIsAllowed")))
  {
    if (MCMRequirePersona_onceToken != -1)
      dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
    if (!MCMRequirePersona_result)
      goto LABEL_2;
    -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containerClass");
    if (v6 > 0xE || ((1 << v6) & 0x4ED4) == 0)
    {

LABEL_2:
      LOBYTE(v4) = 1;
      return v4;
    }
    -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isNoSpecificPersona");

    if (!v9)
      goto LABEL_2;
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      -[MCMCommand context](self, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "clientIdentity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "codeSignInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containerClass");
      -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommand context](self, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clientIdentity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v13;
      v24 = 2048;
      v25 = v15;
      v26 = 2114;
      v27 = v17;
      v28 = 2114;
      v29 = v19;
      _os_log_fault_impl(&dword_1CF807000, v10, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);

    }
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
    if (MCMRequirePersonaTelemetryOnly_result)
      goto LABEL_2;
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (MCMError)error
{
  return self->_error;
}

- (BOOL)clientIsAllowed
{
  return self->_clientIsAllowed;
}

- (BOOL)alwaysReturnPath
{
  return self->_alwaysReturnPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerConfig, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_appGroupIdentifier, 0);
}

- (MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier *v10;
  uint64_t v11;
  NSString *appGroupIdentifier;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v14, sel_initWithMessage_context_reply_, v8, v9, a5);
  if (v10)
  {
    objc_msgSend(v8, "appGroupIdentifier");
    v11 = objc_claimAutoreleasedReturnValue();
    appGroupIdentifier = v10->_appGroupIdentifier;
    v10->_appGroupIdentifier = (NSString *)v11;

    -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier _commonInit:](v10, "_commonInit:", v9);
  }

  return v10;
}

- (void)_commonInit:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  MCMContainerConfiguration *v9;
  MCMContainerConfiguration *containerConfig;
  void *v11;
  MCMUserIdentity *v12;
  MCMUserIdentity *userIdentity;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  MCMUserIdentity *v19;
  MCMUserIdentity *v20;
  MCMUserIdentity *v21;
  MCMContainerConfiguration *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  MCMContainerIdentity *v26;
  MCMContainerIdentity *containerIdentity;
  void *error;
  MCMError *v29;
  MCMError *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  NSString *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_appGroupIdentifier;
  v38 = 1;
  -[MCMCommand context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "globalConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "staticConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configForContainerClass:", 7);
  v9 = (MCMContainerConfiguration *)objc_claimAutoreleasedReturnValue();
  containerConfig = self->_containerConfig;
  self->_containerConfig = v9;

  self->_clientIsAllowed = 0;
  objc_msgSend(v4, "clientIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMXPCMessageBase userIdentityForContainerIdentifier:clientIdentity:containerClass:error:](MCMXPCMessageBase, "userIdentityForContainerIdentifier:clientIdentity:containerClass:error:", v5, v11, 7, &v38);
  v12 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
  userIdentity = self->_userIdentity;
  self->_userIdentity = v12;

  if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
    dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
  if (MCMRequirePersonaTelemetryOnly_result
    && v38 != 1
    && -[MCMUserIdentity isNoSpecificPersona](self->_userIdentity, "isNoSpecificPersona"))
  {
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v4, "clientIdentity");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "codeSignInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "clientIdentity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = v32;
      v41 = 2048;
      v42 = 7;
      v43 = 2114;
      v44 = v5;
      v45 = 2114;
      v46 = v33;
      _os_log_fault_impl(&dword_1CF807000, v14, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);

    }
    v38 = 1;
  }
  else
  {
    if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1)
      dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_16);
    v15 = v38;
    if (MCMRequirePersonaAndConvertSystemToPersonal_result && v38 != 1)
    {
      if (-[MCMUserIdentity isNoSpecificPersona](self->_userIdentity, "isNoSpecificPersona"))
      {
        container_log_handle_for_category();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v4, "clientIdentity");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "codeSignInfo");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v36;
          v41 = 2048;
          v42 = 7;
          v43 = 2114;
          v44 = v5;
          _os_log_fault_impl(&dword_1CF807000, v16, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona - converting to Personal", buf, 0x20u);

        }
        v38 = 1;
        objc_msgSend(v4, "userIdentityCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMUserIdentity posixUser](self->_userIdentity, "posixUser");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "userIdentityForPersonalPersonaWithPOSIXUser:", v18);
        v19 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
        v20 = self->_userIdentity;
        self->_userIdentity = v19;

      }
      v15 = v38;
    }
    if (v15 != 1)
      goto LABEL_22;
  }
  self->_alwaysReturnPath = 0;
  v21 = self->_userIdentity;
  v22 = self->_containerConfig;
  objc_msgSend(v4, "clientIdentity");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "platform");
  objc_msgSend(v4, "userIdentityCache");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v21, v5, v22, v24, v25, &v38);
  v26 = (MCMContainerIdentity *)objc_claimAutoreleasedReturnValue();
  containerIdentity = self->_containerIdentity;
  self->_containerIdentity = v26;

  if (!self->_containerIdentity && !self->_alwaysReturnPath)
  {
LABEL_22:
    v29 = [MCMError alloc];
    v30 = -[MCMError initWithErrorType:](v29, "initWithErrorType:", v38);
    error = self->_error;
    self->_error = v30;
    goto LABEL_23;
  }
  objc_msgSend(v4, "clientIdentity");
  error = (void *)objc_claimAutoreleasedReturnValue();
  self->_clientIsAllowed = objc_msgSend(error, "isAllowedToLookupContainerIdentity:", self->_containerIdentity);
LABEL_23:

}

- (NSString)appGroupIdentifier
{
  return self->_appGroupIdentifier;
}

- (unsigned)expectedPersonaKernelID
{
  return self->_expectedPersonaKernelID;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

+ (unint64_t)command
{
  return 38;
}

+ (BOOL)secureRestrictedContainerIfNeededWithMetadata:(id)a3 entitlements:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  MCMFileHandle *v12;
  void *v13;
  MCMFileHandle *v14;
  int v15;
  id v16;
  BOOL v17;
  id v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  MCMError *v24;
  BOOL v25;
  NSObject *v26;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "containerRootURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [MCMFileHandle alloc];
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = 0;
  v14 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:](v12, "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:", v13, 0, 10, 1, 0, 0, v30);

  v15 = objc_msgSend(v7, "isOwnerOfProtectedAppGroupContainerWithIdentifier:", v9);
  v16 = 0;
  if (!v15)
  {
LABEL_7:
    -[MCMFileHandle close](v14, "close");
    v24 = 0;
    v25 = 1;
    v19 = v16;
    goto LABEL_17;
  }
  v32 = 0;
  v17 = -[MCMFileHandle openWithError:](v14, "openWithError:", &v32);
  v18 = v32;
  v19 = v18;
  if (v17)
  {
    v31 = v18;
    v20 = -[MCMFileHandle registerAppContainerForProtectionWithError:](v14, "registerAppContainerForProtectionWithError:", &v31);
    v16 = v31;

    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v9;
        v35 = 2112;
        v36 = v23;
        _os_log_impl(&dword_1CF807000, v22, OS_LOG_TYPE_DEFAULT, "[%@] Registered app group container at [%@] for protection", buf, 0x16u);

      }
      goto LABEL_7;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v9;
      v35 = 2112;
      v36 = v29;
      v37 = 2112;
      v38 = v16;
      _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "[%@] Failed to register app group container at [%@] for protection; error = %@",
        buf,
        0x20u);

    }
    v24 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v16, v11, 145);
    v19 = v16;
  }
  else
  {
    container_log_handle_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v9;
      v35 = 2112;
      v36 = v28;
      v37 = 2112;
      v38 = v19;
      _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, "[%@] Failed to open %@ during app group protection check; error = %@",
        buf,
        0x20u);

    }
    v24 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v19, v11, 144);
  }
  -[MCMFileHandle close](v14, "close");
  if (a5)
  {
    v24 = objc_retainAutorelease(v24);
    v25 = 0;
    *a5 = v24;
  }
  else
  {
    v25 = 0;
  }
LABEL_17:

  return v25;
}

@end
