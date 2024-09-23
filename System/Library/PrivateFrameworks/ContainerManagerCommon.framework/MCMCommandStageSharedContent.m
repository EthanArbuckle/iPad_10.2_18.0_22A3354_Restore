@implementation MCMCommandStageSharedContent

- (MCMCommandStageSharedContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandStageSharedContent *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSString *sourceRelativePath;
  uint64_t v14;
  NSString *destinationRelativePath;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCMCommandStageSharedContent;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v17, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "identifier");
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    objc_msgSend(v8, "sourceRelativePath");
    v12 = objc_claimAutoreleasedReturnValue();
    sourceRelativePath = v9->_sourceRelativePath;
    v9->_sourceRelativePath = (NSString *)v12;

    objc_msgSend(v8, "destinationRelativePath");
    v14 = objc_claimAutoreleasedReturnValue();
    destinationRelativePath = v9->_destinationRelativePath;
    v9->_destinationRelativePath = (NSString *)v14;

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
  v4 = objc_msgSend(v3, "isAllowedToStageSharedContent");

  return v4;
}

- (void)execute
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  MCMError *v17;
  MCMError *v18;
  NSObject *v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  MCMResultWithURLBase *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  MCMError *v41;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  char v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  const char *v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  MCMError *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *context;
  id v87;
  id v88;
  id v89;
  uint64_t v90;
  uint8_t buf[4];
  id v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  id v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommand context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userIdentityCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultUserIdentity");
  v5 = objc_claimAutoreleasedReturnValue();

  v90 = 1;
  -[MCMCommand context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "globalConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "staticConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configForContainerClass:", 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMCommandStageSharedContent identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand context](self, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userIdentityCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = (void *)v5;
  +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v5, v10, v9, 0, v12, &v90);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v17 = [MCMError alloc];
    v18 = -[MCMError initWithErrorType:](v17, "initWithErrorType:", v90);
LABEL_12:
    v22 = 0;
    v23 = 0;
    v84 = 0;
LABEL_13:
    v24 = 0;
    v25 = 0;
    v83 = 0;
LABEL_14:
    v26 = 0;
    goto LABEL_15;
  }
  v14 = containermanager_copy_global_configuration();
  v15 = objc_msgSend(v14, "systemContainerMode");

  if (!v15)
  {
    v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 72);
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "System containers are not supported", buf, 2u);
    }
    goto LABEL_11;
  }
  -[MCMCommandStageSharedContent sourceRelativePath](self, "sourceRelativePath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "containsDotDotPathComponents"))
  {

    goto LABEL_9;
  }
  -[MCMCommandStageSharedContent destinationRelativePath](self, "destinationRelativePath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsDotDotPathComponents");

  if (v21)
  {
LABEL_9:
    v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 38);
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[MCMCommandStageSharedContent sourceRelativePath](self, "sourceRelativePath");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommandStageSharedContent destinationRelativePath](self, "destinationRelativePath");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v92 = v64;
      v93 = 2112;
      v94 = (uint64_t)v65;
      _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Paths can't contain dots. source: %@, dest: %@", buf, 0x16u);

    }
LABEL_11:

    goto LABEL_12;
  }
  -[MCMCommand context](self, "context");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "clientIdentity");
  v33 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v33, "codeSignInfo");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "entitlements");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "systemGroupIdentifiers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v36;
  LOBYTE(v33) = objc_msgSend(v36, "containsObject:", v37);

  if ((v33 & 1) == 0)
  {
    v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 55);
    container_log_handle_for_category();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      -[MCMCommand context](self, "context");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "clientIdentity");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v92 = v74;
      v93 = 2112;
      v94 = (uint64_t)v75;
      _os_log_error_impl(&dword_1CF807000, v62, OS_LOG_TYPE_ERROR, "%@ not entitled for system group container %@", buf, 0x16u);

    }
    v22 = 0;
    v23 = 0;
    goto LABEL_13;
  }
  -[MCMCommand context](self, "context");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "containerCache");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0;
  objc_msgSend(v39, "entryForContainerIdentity:error:", v13, &v89);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (MCMError *)v89;

  v83 = v40;
  objc_msgSend(v40, "metadataMinimal");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 21);

    container_log_handle_for_category();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "identifier");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v92 = v76;
      v93 = 2112;
      v94 = (uint64_t)v18;
      _os_log_error_impl(&dword_1CF807000, v63, OS_LOG_TYPE_ERROR, "System group container with identifier %@ not found: %@", buf, 0x16u);

    }
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    goto LABEL_14;
  }
  v25 = v42;
  v80 = v41;
  objc_msgSend(v42, "containerPath");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "containerDataURL");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandStageSharedContent sourceRelativePath](self, "sourceRelativePath");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "URLByAppendingPathComponent:isDirectory:", v45, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "containerPath");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "containerDataURL");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandStageSharedContent destinationRelativePath](self, "destinationRelativePath");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "URLByAppendingPathComponent:isDirectory:", v48, 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "containerPath");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "containerDataURL");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "realPathForURL:ifChildOfURL:", v23, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52)
  {
    v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 10);

    container_log_handle_for_category();
    v66 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
    {
LABEL_37:

      v24 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v13, "identifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "containerPath");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "containerDataURL");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v92 = v23;
    v93 = 2112;
    v94 = (uint64_t)v67;
    v95 = 2112;
    v96 = (uint64_t)v68;
    v69 = "Invalid source URL %@ for %@ at %@";
LABEL_43:
    _os_log_error_impl(&dword_1CF807000, v66, OS_LOG_TYPE_ERROR, v69, buf, 0x20u);

    goto LABEL_37;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "containerPath");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "containerDataURL");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "realPathForURL:ifChildOfURL:", v22, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v56)
  {
    v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 10);

    container_log_handle_for_category();
    v66 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    objc_msgSend(v13, "identifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "containerPath");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "containerDataURL");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v92 = v22;
    v93 = 2112;
    v94 = (uint64_t)v67;
    v95 = 2112;
    v96 = (uint64_t)v68;
    v69 = "Invalid dest URL %@ for %@ at %@";
    goto LABEL_43;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0;
  v58 = objc_msgSend(v57, "standardizeACLsAtURL:isSystemContainer:error:", v23, 0, &v88);
  v26 = v88;

  if ((v58 & 1) == 0)
  {
    v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 63);

    container_log_handle_for_category();
    v70 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      goto LABEL_41;
    objc_msgSend(v13, "identifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v71 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v92 = v82;
    v93 = 2112;
    v94 = v71;
    v72 = (void *)v71;
    v95 = 2112;
    v96 = (uint64_t)v26;
    _os_log_error_impl(&dword_1CF807000, v70, OS_LOG_TYPE_ERROR, "Failed to standardize ACLs for %@ at %@: %@", buf, 0x20u);

LABEL_45:
    goto LABEL_41;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v26;
  v60 = objc_msgSend(v59, "moveItemAtURL:toURL:error:", v23, v22, &v87);
  v61 = v87;

  if ((v60 & 1) != 0)
  {
    v22 = v22;
    v24 = v22;
    v26 = v61;
    v18 = v80;
    goto LABEL_15;
  }
  v26 = v61;
  v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 64);

  container_log_handle_for_category();
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v13, "identifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "path");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "path");
    v77 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v92 = v82;
    v93 = 2112;
    v94 = (uint64_t)v79;
    v95 = 2112;
    v96 = v77;
    v78 = (void *)v77;
    v97 = 2112;
    v98 = v26;
    _os_log_error_impl(&dword_1CF807000, v70, OS_LOG_TYPE_ERROR, "Failed move for %@ from %@ to: %@: %@", buf, 0x2Au);

    goto LABEL_45;
  }
LABEL_41:

  v24 = 0;
LABEL_15:
  container_log_handle_for_category();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v92 = v24;
    v93 = 2112;
    v94 = (uint64_t)v18;
    _os_log_impl(&dword_1CF807000, v27, OS_LOG_TYPE_DEFAULT, "Stage shared content result: %@, error = %@", buf, 0x16u);
  }

  v28 = [MCMResultWithURLBase alloc];
  if (v24)
    v29 = -[MCMResultWithURLBase initWithURL:existed:sandboxToken:](v28, "initWithURL:existed:sandboxToken:", v24, 1, 0);
  else
    v29 = -[MCMResultBase initWithError:](v28, "initWithError:", v18);
  v30 = (void *)v29;
  -[MCMCommand resultPromise](self, "resultPromise");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "completeWithResult:", v30);

  objc_autoreleasePoolPop(context);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (NSString)destinationRelativePath
{
  return self->_destinationRelativePath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationRelativePath, 0);
  objc_storeStrong((id *)&self->_sourceRelativePath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (unint64_t)command
{
  return 26;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
