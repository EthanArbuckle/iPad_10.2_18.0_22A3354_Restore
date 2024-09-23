@implementation MCMCommandDeleteUserManagedAsset

- (MCMCommandDeleteUserManagedAsset)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  MCMCommandDeleteUserManagedAsset *v10;
  uint64_t v11;
  MCMContainerIdentity *containerIdentity;
  void *v13;
  NSObject *p_super;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString *sourceRelativePath;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)MCMCommandDeleteUserManagedAsset;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v36, sel_initWithMessage_context_reply_, v8, v9, a5);
  if (v10)
  {
    objc_msgSend(v8, "containerIdentity");
    v11 = objc_claimAutoreleasedReturnValue();
    containerIdentity = v10->_containerIdentity;
    v10->_containerIdentity = (MCMContainerIdentity *)v11;

    -[MCMContainerIdentityMinimal userIdentity](v10->_containerIdentity, "userIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
    if (MCMRequirePersonaTelemetryOnly_result && objc_msgSend(v13, "isNoSpecificPersona"))
    {
      container_log_handle_for_category();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        -[MCMCommand context](v10, "context");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "clientIdentity");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "codeSignInfo");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "clientIdentity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v38 = v15;
        v39 = 2048;
        v40 = v16;
        v41 = 2114;
        v42 = v17;
        v43 = 2114;
        v44 = v18;
        _os_log_fault_impl(&dword_1CF807000, p_super, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)", buf, 0x2Au);

      }
    }
    else
    {
      if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1)
        dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_16);
      if (!MCMRequirePersonaAndConvertSystemToPersonal_result
        || !objc_msgSend(v13, "isNoSpecificPersona"))
      {
        goto LABEL_16;
      }
      container_log_handle_for_category();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        -[MCMCommand context](v10, "context");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "clientIdentity");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "codeSignInfo");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v38 = v28;
        v39 = 2048;
        v40 = v29;
        v41 = 2114;
        v42 = v30;
        _os_log_fault_impl(&dword_1CF807000, v19, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona - converting to Personal", buf, 0x20u);

      }
      objc_msgSend(v9, "userIdentityCache");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "posixUser");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "userIdentityForPersonalPersonaWithPOSIXUser:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      -[MCMContainerIdentity identityByChangingUserIdentity:](v10->_containerIdentity, "identityByChangingUserIdentity:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      p_super = &v10->_containerIdentity->super.super;
      v10->_containerIdentity = (MCMContainerIdentity *)v23;
      v13 = (void *)v22;
    }

LABEL_16:
    objc_msgSend(v8, "sourceRelativePath");
    v24 = objc_claimAutoreleasedReturnValue();
    sourceRelativePath = v10->_sourceRelativePath;
    v10->_sourceRelativePath = (NSString *)v24;

  }
  return v10;
}

- (BOOL)preflightClientAllowed
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[MCMCommand context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAllowedToAccessUserAssets");

  if (!v5)
    return 0;
  if (MCMRequirePersona_onceToken != -1)
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
  if (MCMRequirePersona_result)
  {
    -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containerClass");
    if (v7 <= 0xE && ((1 << v7) & 0x4ED4) != 0)
    {
      -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "userIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isNoSpecificPersona");

      if (v10)
      {
        container_log_handle_for_category();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          -[MCMCommand context](self, "context");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "clientIdentity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "codeSignInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containerClass");
          -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543874;
          v22 = v16;
          v23 = 2048;
          v24 = v18;
          v25 = 2114;
          v26 = v20;
          _os_log_fault_impl(&dword_1CF807000, v11, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona", (uint8_t *)&v21, 0x20u);

        }
        if (MCMRequirePersonaTelemetryOnly_onceToken != -1)
          dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_18);
        if (!MCMRequirePersonaTelemetryOnly_result)
          return 0;
      }
    }
    else
    {

    }
  }
  return 1;
}

- (void)execute
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  MCMError *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  MCMError *v26;
  void *v27;
  void *v28;
  void *v29;
  MCMError *v30;
  void *v31;
  void *v32;
  int v33;
  MCMError *v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint32_t v44;
  NSObject *v45;
  void *v46;
  MCMResultBase *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  void *v54;
  void *context;
  void *v56;
  void *v57;
  MCMError *v58;
  MCMError *v59;
  id v60;
  id v61;
  id v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  MCMError *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = objc_claimAutoreleasedReturnValue();

  -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userIdentity");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMCommand context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0;
  objc_msgSend(v7, "entryForContainerIdentity:error:", v8, &v62);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v62;

  v61 = v10;
  v53 = v9;
  objc_msgSend(v9, "metadataWithError:", &v61);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (MCMError *)v61;

  v54 = (void *)v4;
  if (!v11)
  {
    container_log_handle_for_category();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v64 = v4;
      v65 = 2112;
      v66 = v12;
      _os_log_error_impl(&dword_1CF807000, v35, OS_LOG_TYPE_ERROR, "Failed to create app data container for user managed assets path for %@: %@", buf, 0x16u);
    }
    v29 = 0;
    v25 = 0;
    v20 = 0;
    v52 = 0;
    v56 = 0;
    v26 = 0;
    goto LABEL_28;
  }
  objc_msgSend(v11, "containerPath");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13
    || (v14 = (void *)v13,
        objc_msgSend(v11, "userManagedAssetsDirName"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    v34 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 11);

    container_log_handle_for_category();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v64 = (uint64_t)v11;
      _os_log_error_impl(&dword_1CF807000, v35, OS_LOG_TYPE_ERROR, "No userManagedAssetsDirName or URL in container metadata object: %@", buf, 0xCu);
    }
    v29 = 0;
    v25 = 0;
    v20 = 0;
    v52 = 0;
    v56 = 0;
    v26 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v11, "containerPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "containerDataURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "userManagedAssetsDirName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v18;
  objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v19, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMCommandDeleteUserManagedAsset sourceRelativePath](self, "sourceRelativePath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "URLByAppendingPathComponent:isDirectory:", v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "absoluteURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  objc_msgSend(v24, "realPathForURL:isDirectory:error:", v23, 0, &v60);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (MCMError *)v60;

  v56 = v23;
  if (!v25)
  {
    v34 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 10);

    container_log_handle_for_category();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v23, "path");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v64 = (uint64_t)v49;
      v65 = 2112;
      v66 = v26;
      _os_log_error_impl(&dword_1CF807000, v35, OS_LOG_TYPE_ERROR, "Unable to get realpath for resource %@; error = %@",
        buf,
        0x16u);

    }
    v29 = 0;
    v25 = 0;
    goto LABEL_27;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "absoluteURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v26;
  objc_msgSend(v27, "realPathForURL:isDirectory:error:", v28, 1, &v59);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v59;

  if (!v29)
  {
    v34 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 10);

    container_log_handle_for_category();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v56, "path");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v64 = (uint64_t)v50;
      v65 = 2112;
      v66 = v30;
      _os_log_error_impl(&dword_1CF807000, v35, OS_LOG_TYPE_ERROR, "Unable to get realpath for resource %@; error = %@",
        buf,
        0x16u);

    }
    v29 = 0;
    goto LABEL_26;
  }
  objc_msgSend(v29, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "path");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v31, "isEqualToString:", v32);

  if (v33)
  {
    v34 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 10);

    container_log_handle_for_category();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v29, "path");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v64 = (uint64_t)v36;
      v37 = "Illegal attempt to delete user managed assets directory at %@";
LABEL_33:
      v43 = v35;
      v44 = 12;
LABEL_34:
      _os_log_error_impl(&dword_1CF807000, v43, OS_LOG_TYPE_ERROR, v37, buf, v44);

    }
  }
  else
  {
    objc_msgSend(v25, "path");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "path");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "hasPrefix:", v39);

    if ((v40 & 1) != 0)
    {
      -[MCMCommand context](self, "context");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "containerFactory");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v12;
      v51 = objc_msgSend(v42, "deleteURL:forUserIdentity:error:", v25, v57, &v58);
      v34 = v58;

      if ((v51 & 1) != 0)
        goto LABEL_29;
      container_log_handle_for_category();
      v35 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      objc_msgSend(v25, "path");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v64 = (uint64_t)v36;
      v65 = 2112;
      v66 = v34;
      v37 = "Failed to remove asset at %@; error = %@";
      v43 = v35;
      v44 = 22;
      goto LABEL_34;
    }
    v34 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 10);

    container_log_handle_for_category();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v25, "path");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v64 = (uint64_t)v36;
      v37 = "Illegal attempt to delete asset not residing in user managed assets directory %@";
      goto LABEL_33;
    }
  }
LABEL_26:
  v26 = v30;
LABEL_27:
  v12 = v34;
LABEL_28:

  v30 = v26;
  v34 = v12;
LABEL_29:
  container_log_handle_for_category();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMCommandDeleteUserManagedAsset sourceRelativePath](self, "sourceRelativePath");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v64 = (uint64_t)v46;
    v65 = 2112;
    v66 = v34;
    _os_log_impl(&dword_1CF807000, v45, OS_LOG_TYPE_DEFAULT, "Delete user managed asset [%@], error = %@", buf, 0x16u);

  }
  v47 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v34);
  -[MCMCommand resultPromise](self, "resultPromise");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "completeWithResult:", v47);

  objc_autoreleasePoolPop(context);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceRelativePath, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

+ (unint64_t)command
{
  return 29;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
