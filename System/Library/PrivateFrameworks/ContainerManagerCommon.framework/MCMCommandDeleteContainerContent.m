@implementation MCMCommandDeleteContainerContent

- (MCMCommandDeleteContainerContent)initWithContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  id v9;
  MCMCommandDeleteContainerContent *v10;
  MCMCommandDeleteContainerContent *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandDeleteContainerContent;
  v10 = -[MCMCommand initWithContext:resultPromise:](&v13, sel_initWithContext_resultPromise_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_containerIdentity, a3);

  return v11;
}

- (MCMCommandDeleteContainerContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandDeleteContainerContent *v9;
  uint64_t v10;
  MCMContainerIdentity *containerIdentity;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandDeleteContainerContent;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "containerIdentity");
    v10 = objc_claimAutoreleasedReturnValue();
    containerIdentity = v9->_containerIdentity;
    v9->_containerIdentity = (MCMContainerIdentity *)v10;

  }
  return v9;
}

- (BOOL)preflightClientAllowed
{
  void *v2;
  void *v3;
  char v4;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToWipeAnyDataContainer");

  return v4;
}

- (void)execute
{
  MCMCommandDeleteContainerContent *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  MCMError *v11;
  void *v12;
  MCMError *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  MCMError *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  MCMError *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  MCMError *v44;
  NSObject *v45;
  MCMResultBase *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  char v50;
  id v51;
  char v52;
  MCMError *v53;
  MCMError *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  MCMError *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  NSObject *v66;
  MCMCommandOperationReclaimDiskSpace *v67;
  void *v68;
  MCMCommandOperationReclaimDiskSpace *v69;
  void *v70;
  void *v71;
  MCMError *v72;
  void *v73;
  MCMError *v74;
  void *v75;
  MCMError *v76;
  MCMError *v77;
  MCMCommandDeleteContainerContent *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  MCMError *v89;
  MCMError *v90;
  id v91;
  id v92;
  MCMError *v93;
  id v94;
  MCMError *v95;
  id v96;
  char v97;
  uint8_t buf[4];
  unint64_t v99;
  __int16 v100;
  MCMError *v101;
  __int16 v102;
  MCMError *v103;
  uint64_t v104;

  v2 = self;
  v104 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1D17D7010](self, a2);
  v97 = 0;
  -[MCMCommandDeleteContainerContent containerIdentity](v2, "containerIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containerClass");
  objc_msgSend(v4, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v5 > 0xB || ((1 << v5) & 0xED4) == 0;
  v82 = (void *)v6;
  v84 = v4;
  if (v7)
  {
    v42 = v6;
    container_log_handle_for_category();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v99 = v5;
      v100 = 2112;
      v101 = (MCMError *)v42;
      _os_log_error_impl(&dword_1CF807000, v43, OS_LOG_TYPE_ERROR, "Can't wipe container non-data container of type: %llu, identifier: %@", buf, 0x16u);
    }
    v18 = (void *)v3;

    v11 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 11, 3);
    goto LABEL_26;
  }
  -[MCMCommand context](v2, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = 0;
  objc_msgSend(v9, "entryForContainerIdentity:error:", v4, &v96);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (MCMError *)v96;

  if (!v10)
  {
    container_log_handle_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v99 = (unint64_t)v4;
      v100 = 2112;
      v101 = v11;
      _os_log_error_impl(&dword_1CF807000, v17, OS_LOG_TYPE_ERROR, "Failed to lookup existing container during wipe; identity: %@, error: %@",
        buf,
        0x16u);
    }
    v18 = (void *)v3;

LABEL_26:
    v10 = 0;
    v83 = 0;
    v20 = 0;
    v80 = 0;
    v81 = 0;
    goto LABEL_27;
  }
  v95 = v11;
  objc_msgSend(v10, "metadataWithError:", &v95);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v95;

  if (v12)
  {
    objc_msgSend(v12, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.ContentProtectionClass"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = v10;
    v81 = v15;
    if (v15)
      v16 = objc_msgSend(v15, "intValue");
    else
      v16 = 0xFFFFFFFFLL;
    objc_msgSend(v12, "containerPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](v2, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "containerFactory");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v12;
    v28 = (void *)v26;
    v83 = v27;
    objc_msgSend(v27, "containerIdentity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v13;
    v94 = v24;
    objc_msgSend(v28, "createStagedContainerForContainerIdentity:finalContainerPath:dataProtectionClass:error:", v29, &v94, v16, &v93);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (MCMError *)v94;

    v11 = v93;
    if (v30)
    {
      v85 = v30;
      objc_msgSend(v30, "containerPath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v20;
      -[MCMError containerRootURL](v20, "containerRootURL");
      v32 = objc_claimAutoreleasedReturnValue();
      v87 = v31;
      objc_msgSend(v31, "containerRootURL");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = +[MCMContainerCacheEntry birthtimeForURL:](MCMContainerCacheEntry, "birthtimeForURL:", v32);
      if (v33 | v34)
      {
        v38 = v33;
        v40 = v34;
      }
      else
      {
        +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = 0;
        objc_msgSend(v35, "fsNodeOfURL:followSymlinks:error:", v32, 0, &v92);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (MCMError *)v92;

        if (v36)
        {
          v38 = objc_msgSend(v36, "birthtime");
          v40 = v39;
        }
        else
        {
          container_log_handle_for_category();
          v48 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v99 = v32;
            v100 = 2112;
            v101 = v37;
            _os_log_error_impl(&dword_1CF807000, v48, OS_LOG_TYPE_ERROR, "Could not read fs node for old container at [%@] (non-fatal); error = %@",
              buf,
              0x16u);
          }

          v38 = 0;
          v40 = 0;
        }

      }
      if (v38 | v40)
        +[MCMContainerCacheEntry setBirthtime:forURL:](MCMContainerCacheEntry, "setBirthtime:forURL:", v38, v40, v86);
      v78 = v2;
      +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = 0;
      v80 = (void *)v32;
      v50 = objc_msgSend(v49, "replaceItemAtDestinationURL:withSourceURL:swapped:error:", v32, v86, &v97, &v91);
      v51 = v91;

      if ((v50 & 1) == 0)
      {
        container_log_handle_for_category();
        v57 = objc_claimAutoreleasedReturnValue();
        v20 = v77;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v99 = (unint64_t)v51;
          _os_log_error_impl(&dword_1CF807000, v57, OS_LOG_TYPE_ERROR, "Failed to swap containers during wipe; error: %@",
            buf,
            0xCu);
        }

        v58 = [MCMError alloc];
        -[MCMError containerRootURL](v77, "containerRootURL");
        v59 = objc_claimAutoreleasedReturnValue();
        v53 = -[MCMError initWithNSError:url:defaultErrorType:](v58, "initWithNSError:url:defaultErrorType:", v51, v59, 15);

        v22 = 0;
        goto LABEL_48;
      }
      v20 = v77;
      objc_msgSend(v85, "metadataByChangingContainerPath:", v77);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v11;
      v52 = objc_msgSend(v22, "verifyWithError:", &v90);
      v53 = v90;

      if ((v52 & 1) != 0)
      {
        -[MCMCommand context](v2, "context");
        v54 = v53;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "containerCache");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v54;
        objc_msgSend(v56, "addContainerMetadata:error:", v22, &v89);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v89;

        if (v23)
        {
          v10 = v79;
          goto LABEL_49;
        }
        v53 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 45);

        container_log_handle_for_category();
        v59 = objc_claimAutoreleasedReturnValue();
        v10 = v79;
        if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
LABEL_48:

          v23 = 0;
          v11 = v53;
LABEL_49:
          if (v87)
          {
            v21 = v51;
            if (v97)
            {
              v75 = (void *)v3;
              -[MCMCommand context](v2, "context");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "containerFactory");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "containerRootURL");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "userIdentity");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              v88 = 0;
              v65 = objc_msgSend(v62, "deleteURL:forUserIdentity:error:", v63, v64, &v88);
              v76 = (MCMError *)v88;

              v10 = v79;
              if ((v65 & 1) == 0)
              {
                container_log_handle_for_category();
                v66 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v87, "containerRootURL");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v70, "path");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v99 = (unint64_t)v71;
                  v100 = 2112;
                  v101 = v76;
                  _os_log_error_impl(&dword_1CF807000, v66, OS_LOG_TYPE_ERROR, "Failed to remove staging container during wipe: %@; error = %@",
                    buf,
                    0x16u);

                }
              }
              v67 = [MCMCommandOperationReclaimDiskSpace alloc];
              v2 = v78;
              -[MCMCommand context](v78, "context");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:](v67, "initWithAsynchronously:context:resultPromise:", 1, v68, 0);

              -[MCMCommandOperationReclaimDiskSpace execute](v69, "execute");
              v18 = v75;
              v20 = v77;
              goto LABEL_28;
            }
          }
          else
          {
            v21 = v51;
          }
          v18 = (void *)v3;
          goto LABEL_28;
        }
        objc_msgSend(v22, "containerPath");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "containerRootURL");
        v72 = v53;
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "path");
        v74 = (MCMError *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v99 = (unint64_t)v22;
        v100 = 2112;
        v101 = v74;
        v102 = 2112;
        v103 = v72;
        _os_log_error_impl(&dword_1CF807000, v59, OS_LOG_TYPE_ERROR, "Failed to add to cache: %@, url: %@; error = %@",
          buf,
          0x20u);

        v53 = v72;
        v10 = v79;
      }
      else
      {
        container_log_handle_for_category();
        v59 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          goto LABEL_48;
        objc_msgSend(v22, "shortDescription");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v99 = (unint64_t)v60;
        v100 = 2112;
        v101 = v53;
        _os_log_error_impl(&dword_1CF807000, v59, OS_LOG_TYPE_ERROR, "Failed to verify new metadata; metadata = %@, error = %@",
          buf,
          0x16u);
      }

      goto LABEL_48;
    }
    v18 = (void *)v3;
    container_log_handle_for_category();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v99 = (unint64_t)v83;
      v100 = 2112;
      v101 = v20;
      v102 = 2112;
      v103 = v11;
      _os_log_error_impl(&dword_1CF807000, v41, OS_LOG_TYPE_ERROR, "Failed to create staging container during wipe; metadata: %@, existingContainerPath: %@, error: %@",
        buf,
        0x20u);
    }

    v80 = 0;
LABEL_27:
    v21 = 0;
    v85 = 0;
    v86 = 0;
    v87 = 0;
    v22 = 0;
    v23 = 0;
    goto LABEL_28;
  }
  v18 = (void *)v3;
  container_log_handle_for_category();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v99 = (unint64_t)v84;
    v100 = 2112;
    v101 = v13;
    _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Failed to read existing container metadata during wipe; identity: %@, error: %@",
      buf,
      0x16u);
  }

  v83 = 0;
  v20 = 0;
  v80 = 0;
  v81 = 0;
  v21 = 0;
  v85 = 0;
  v86 = 0;
  v87 = 0;
  v22 = 0;
  v23 = 0;
  v11 = v13;
LABEL_28:
  v44 = v20;
  container_log_handle_for_category();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v99 = (unint64_t)v11;
    _os_log_impl(&dword_1CF807000, v45, OS_LOG_TYPE_DEFAULT, "Delete content result; error = %@", buf, 0xCu);
  }

  v46 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v11);
  -[MCMCommand resultPromise](v2, "resultPromise");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "completeWithResult:", v46);

  objc_autoreleasePoolPop(v18);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentity, 0);
}

+ (unint64_t)command
{
  return 12;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
