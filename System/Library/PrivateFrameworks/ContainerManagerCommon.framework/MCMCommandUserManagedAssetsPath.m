@implementation MCMCommandUserManagedAssetsPath

- (BOOL)preflightClientAllowed
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand context](self, "context");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "clientIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "codeSignInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqualToString:", v8);

  -[MCMCommand context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v11, "isAllowedToAccessUserAssets");

  if ((v5 & 1) == 0 && !v9)
    return 0;
  if (MCMRequirePersona_onceToken != -1)
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_13);
  if (MCMRequirePersona_result)
  {
    -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containerClass");
    if (v14 <= 0xE && ((1 << v14) & 0x4ED4) != 0)
    {
      -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isNoSpecificPersona");

      if (v17)
      {
        container_log_handle_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          -[MCMCommand context](self, "context");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "clientIdentity");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "codeSignInfo");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "containerClass");
          -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543874;
          v28 = v22;
          v29 = 2048;
          v30 = v24;
          v31 = 2114;
          v32 = v26;
          _os_log_fault_impl(&dword_1CF807000, v18, OS_LOG_TYPE_FAULT, "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona", (uint8_t *)&v27, 0x20u);

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

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

- (void)execute
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MCMError *v11;
  void *v12;
  MCMError *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  MCMFileHandle *v31;
  uint64_t v32;
  MCMFileHandle *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  MCMError *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  NSObject *v46;
  uint32_t v47;
  void *v48;
  NSObject *v49;
  MCMResultWithURLBase *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  int v63;
  void *v64;
  int v65;
  uint64_t v66;
  id v67;
  MCMError *v68;
  void *v69;
  void *v70;
  void *v71;
  void *context;
  void *v73;
  MCMError *v74;
  MCMError *v75;
  id v76;
  id v77;
  MCMError *v78;
  id v79;
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  int v85;
  __int16 v86;
  MCMError *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentity");
  v4 = objc_claimAutoreleasedReturnValue();

  -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();

  -[MCMCommand context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0;
  objc_msgSend(v8, "entryForContainerIdentity:error:", v9, &v79);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (MCMError *)v79;

  v70 = (void *)v6;
  v71 = (void *)v4;
  v69 = v10;
  if (!v10)
    goto LABEL_14;
  v78 = v11;
  objc_msgSend(v10, "metadataWithError:", &v78);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v78;

  if (!v12)
  {
    v11 = v13;
LABEL_14:
    container_log_handle_for_category();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v81 = v6;
      v82 = 2112;
      v83 = (uint64_t)v11;
      _os_log_error_impl(&dword_1CF807000, v43, OS_LOG_TYPE_ERROR, "Failed to create app data container for user managed assets path for %@: %@", buf, 0x16u);
    }

    v33 = 0;
    v30 = 0;
    v25 = 0;
    v73 = 0;
    v12 = 0;
    goto LABEL_21;
  }
  objc_msgSend(v12, "containerPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v11 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 11);

    container_log_handle_for_category();
    v44 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
LABEL_20:

      v33 = 0;
      v30 = 0;
      v25 = 0;
      v73 = 0;
LABEL_21:
      v26 = 0;
LABEL_22:
      v48 = 0;
      v41 = 0;
      goto LABEL_23;
    }
    *(_DWORD *)buf = 138412290;
    v81 = (uint64_t)v12;
    v45 = "No URL in container metadata object: %@";
    v46 = v44;
    v47 = 12;
LABEL_48:
    _os_log_error_impl(&dword_1CF807000, v46, OS_LOG_TYPE_ERROR, v45, buf, v47);
    goto LABEL_20;
  }
  objc_msgSend(v12, "containerPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "containerDataURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v11 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 13);

    container_log_handle_for_category();
    v44 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v45 = "Could not get library URL";
    v46 = v44;
    v47 = 2;
    goto LABEL_48;
  }
  v68 = v13;
  objc_msgSend(v12, "userManagedAssetsDirName");
  v18 = objc_claimAutoreleasedReturnValue();
  v73 = v17;
  if (v18)
  {
    v19 = (void *)v18;
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userManagedAssetsDirName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v20, "itemDoesNotExistAtURL:", v22);

    if (!v23)
    {
      objc_msgSend(v12, "userManagedAssetsDirName");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 1;
      objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", v55, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0;
      v30 = 0;
      v42 = 0;
      v36 = v12;
      goto LABEL_33;
    }
  }
  if (!-[MCMCommandUserManagedAssetsPath createIfNecessary](self, "createIfNecessary"))
  {
    v11 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 71);

    container_log_handle_for_category();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v81 = v4;
      v82 = 2112;
      v83 = v6;
      _os_log_error_impl(&dword_1CF807000, v54, OS_LOG_TYPE_ERROR, "User managed path for %@:%@ Not Found", buf, 0x16u);
    }

    v33 = 0;
    v30 = 0;
    v25 = 0;
    goto LABEL_21;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  objc_msgSend(v24, "createTemporaryDirectoryInDirectoryURL:withNamePrefix:error:", v17, CFSTR("com.apple.UserManagedAssets."), &v77);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v77;

  if (!v25)
  {
    v11 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 6);

    container_log_handle_for_category();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v81 = (uint64_t)v73;
      v82 = 2112;
      v83 = (uint64_t)v26;
      _os_log_error_impl(&dword_1CF807000, v58, OS_LOG_TYPE_ERROR, "Failed to create user managed assets dir at %@: %@", buf, 0x16u);
    }

    v33 = 0;
    v30 = 0;
    v25 = 0;
    goto LABEL_22;
  }
  v27 = objc_msgSend(v12, "containerClass");
  objc_msgSend(v12, "userIdentity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "posixUser");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerClassPath posixOwnerForContainerClass:user:](MCMContainerClassPath, "posixOwnerForContainerClass:user:", v27, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = [MCMFileHandle alloc];
  objc_msgSend(v25, "path");
  v32 = objc_claimAutoreleasedReturnValue();
  LOBYTE(v66) = 1;
  v33 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:](v31, "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:", v32, 0, 9, 0, 0, 0, v66);

  v76 = v26;
  LOBYTE(v32) = -[MCMFileHandle setPermissions:andOwner:error:](v33, "setPermissions:andOwner:error:", 493, v30, &v76);
  v34 = v76;

  if ((v32 & 1) == 0)
  {
    v11 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v34, v25, 6);

    container_log_handle_for_category();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v81 = (uint64_t)v34;
      _os_log_error_impl(&dword_1CF807000, v59, OS_LOG_TYPE_ERROR, "Failed to set permissions on user managed assets dir; error = %@",
        buf,
        0xCu);
    }

    v48 = 0;
    v41 = 0;
    goto LABEL_43;
  }
  v67 = v34;
  objc_msgSend(v25, "lastPathComponent");
  v35 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "metadataBySettingUserManagedAssetsDirName:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = v68;
  LOBYTE(v35) = objc_msgSend(v36, "writeMetadataToDiskWithError:", &v75);
  v11 = v75;

  if ((v35 & 1) != 0)
  {
    -[MCMCommand context](self, "context");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "containerCache");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v11;
    objc_msgSend(v38, "addContainerMetadata:error:", v36, &v74);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v74;

    if (v39)
    {
      v68 = v40;
      v41 = 0;
      v42 = v67;
LABEL_33:
      if (-[MCMCommandUserManagedAssetsPath isRelative](self, "isRelative"))
      {
        objc_msgSend(v36, "userManagedAssetsDirName");
        v56 = v42;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("Library"), "stringByAppendingPathComponent:", v57);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v36;
        v26 = v56;
      }
      else
      {
        objc_msgSend(v25, "path");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v36;
        v26 = v42;
      }
      v11 = v68;
      goto LABEL_23;
    }
    v11 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 45);

    container_log_handle_for_category();
    v61 = objc_claimAutoreleasedReturnValue();
    v34 = v67;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v36, "containerPath");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend(v36, "transient");
      *(_DWORD *)buf = 138412802;
      v81 = (uint64_t)v36;
      v82 = 2112;
      v83 = (uint64_t)v64;
      v84 = 1024;
      v85 = v65;
      _os_log_error_impl(&dword_1CF807000, v61, OS_LOG_TYPE_ERROR, "Failed to add to cache: %@, container path: %@, transient: %d", buf, 0x1Cu);

      v34 = v67;
    }

    v48 = 0;
    v41 = 0;
    v12 = v36;
LABEL_43:
    v26 = v34;
    goto LABEL_23;
  }
  container_log_handle_for_category();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v36, "containerPath");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v36, "transient");
    *(_DWORD *)buf = 138413058;
    v81 = (uint64_t)v36;
    v82 = 2112;
    v83 = (uint64_t)v62;
    v84 = 1024;
    v85 = v63;
    v86 = 2112;
    v87 = v11;
    _os_log_error_impl(&dword_1CF807000, v60, OS_LOG_TYPE_ERROR, "Failed to write metadata: %@, container path: %@, transient: %d; error = %@",
      buf,
      0x26u);

  }
  v48 = 0;
  v41 = 0;
  v12 = v36;
  v26 = v67;
LABEL_23:
  container_log_handle_for_category();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v81 = (uint64_t)v48;
    v82 = 2112;
    v83 = (uint64_t)v11;
    _os_log_impl(&dword_1CF807000, v49, OS_LOG_TYPE_DEFAULT, "User managed assets path result: [%@], error = %@", buf, 0x16u);
  }

  v50 = [MCMResultWithURLBase alloc];
  if (v48)
    v51 = -[MCMResultWithURLBase initWithPath:existed:sandboxToken:](v50, "initWithPath:existed:sandboxToken:", v48, v41, 0);
  else
    v51 = -[MCMResultBase initWithError:](v50, "initWithError:", v11);
  v52 = (void *)v51;
  -[MCMCommand resultPromise](self, "resultPromise");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "completeWithResult:", v52);

  objc_autoreleasePoolPop(context);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

- (MCMCommandUserManagedAssetsPath)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  MCMCommandUserManagedAssetsPath *v10;
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
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MCMCommandUserManagedAssetsPath;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v34, sel_initWithMessage_context_reply_, v8, v9, a5);
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
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "clientIdentity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "codeSignInfo");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "clientIdentity");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v36 = v15;
        v37 = 2048;
        v38 = v16;
        v39 = 2114;
        v40 = v17;
        v41 = 2114;
        v42 = v18;
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
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "clientIdentity");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "codeSignInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v26;
        v37 = 2048;
        v38 = v27;
        v39 = 2114;
        v40 = v28;
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
    v10->_relative = objc_msgSend(v8, "isRelative");
    v10->_createIfNecessary = objc_msgSend(v8, "createIfNecessary");

  }
  return v10;
}

- (BOOL)isRelative
{
  return self->_relative;
}

+ (unint64_t)command
{
  return 28;
}

@end
