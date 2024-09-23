@implementation MCMCommandRegenerateDirectoryUUID

- (MCMCommandRegenerateDirectoryUUID)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  id v9;
  MCMCommandRegenerateDirectoryUUID *v10;
  MCMCommandRegenerateDirectoryUUID *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandRegenerateDirectoryUUID;
  v10 = -[MCMCommand initWithContext:resultPromise:](&v13, sel_initWithContext_resultPromise_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_concreteContainerIdentity, a3);

  return v11;
}

- (MCMCommandRegenerateDirectoryUUID)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandRegenerateDirectoryUUID *v9;
  uint64_t v10;
  MCMConcreteContainerIdentity *concreteContainerIdentity;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandRegenerateDirectoryUUID;
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
  void *v2;
  void *v3;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isAllowedToRegenerateDirectoryUUIDs");
  return (char)v2;
}

- (void)execute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  MCMResultWithContainerBase *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommand context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandRegenerateDirectoryUUID concreteContainerIdentity](self, "concreteContainerIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v5, "entryForContainerIdentity:error:", v6, &v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v24;

  objc_msgSend(v7, "metadataMinimal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v23 = v8;
    -[MCMCommandRegenerateDirectoryUUID regenerateDirectoryUUIDNoCacheUpdateWithMetadata:error:](self, "regenerateDirectoryUUIDNoCacheUpdateWithMetadata:error:", v9, &v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v23;

    if (v10)
    {
      -[MCMCommand context](self, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "containerCache");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v13, "addContainerMetadata:error:", v10, &v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v22;

      if (!v14)
      {
        container_log_handle_for_category();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v15;
          _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "Failed to update container cache for regenerate: %@", buf, 0xCu);
        }

        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
      v15 = 0;
    }
  }
  else
  {
    v10 = 0;
    v14 = 0;
    v15 = 0;
    v11 = v8;
  }
  container_log_handle_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v10;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_1CF807000, v17, OS_LOG_TYPE_DEFAULT, "Roll UUID result: %@, error = %@", buf, 0x16u);
  }

  v18 = [MCMResultWithContainerBase alloc];
  if (v10)
    v19 = -[MCMResultWithContainerBase initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:](v18, "initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:", v10, 0, 1, 0, 0, 0);
  else
    v19 = -[MCMResultBase initWithError:](v18, "initWithError:", v11);
  v20 = (void *)v19;
  -[MCMCommand resultPromise](self, "resultPromise");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "completeWithResult:", v20);

  objc_autoreleasePoolPop(v3);
}

- (id)regenerateDirectoryUUIDNoCacheUpdateWithMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  uint64_t v27;
  void *v28;
  MCMError *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  _BYTE v47[18];
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCMCommand context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "platform");
  objc_msgSend(v6, "containerClass");
  objc_msgSend(v6, "transient");
  v9 = container_class_supports_randomized_path();

  if ((v9 & 1) == 0)
  {
    v29 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 72);
    container_log_handle_for_category();
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      v18 = 0;
      v13 = 0;
      v20 = 0;
      goto LABEL_13;
    }
    -[MCMCommand context](self, "context");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "clientIdentity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v47 = objc_msgSend(v32, "platform");
    *(_WORD *)&v47[4] = 2112;
    *(_QWORD *)&v47[6] = v6;
    v33 = "UUID container paths are unsupported on (%d) for: %@";
    v34 = v30;
    v35 = 18;
LABEL_26:
    _os_log_error_impl(&dword_1CF807000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);

    goto LABEL_12;
  }
  v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v6, "containerPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerPathIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithUUIDString:", v12);

  if (!v13)
  {
    v29 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 11);
    container_log_handle_for_category();
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    objc_msgSend(v6, "containerPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "containerPathIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v47 = v32;
    *(_WORD *)&v47[8] = 2112;
    *(_QWORD *)&v47[10] = v6;
    v33 = "Non-UUID last path component: %@ for %@";
    v34 = v30;
    v35 = 22;
    goto LABEL_26;
  }
  v14 = (void *)objc_opt_class();
  if (objc_msgSend(v6, "transient"))
    v14 = (void *)objc_opt_class();
  objc_msgSend(v6, "containerIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerPathForContainerIdentity:containerPathIdentifier:", v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "containerClassPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  LOBYTE(v16) = objc_msgSend(v19, "createIfNecessaryWithError:", &v45);
  v20 = v45;

  if ((v16 & 1) != 0)
  {
    v43 = a4;
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "containerRootURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "containerRootURL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v20;
    v25 = objc_msgSend(v21, "moveItemAtURL:toURL:error:", v23, v24, &v44);
    v26 = v44;

    if ((v25 & 1) != 0)
    {
      objc_msgSend(v6, "metadataByChangingContainerPath:", v18);
      v27 = objc_claimAutoreleasedReturnValue();
      a4 = v43;
      if (v27)
      {
        v28 = (void *)v27;
        v29 = 0;
        goto LABEL_17;
      }
      v29 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 73);
      container_log_handle_for_category();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v47 = v29;
        _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, "Failed to update metadata for regenerate: %@", buf, 0xCu);
      }
    }
    else
    {
      v29 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 48);
      container_log_handle_for_category();
      v30 = objc_claimAutoreleasedReturnValue();
      a4 = v43;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "containerPath");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "containerRootURL");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "path");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "containerRootURL");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "path");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v47 = v39;
        *(_WORD *)&v47[8] = 2112;
        *(_QWORD *)&v47[10] = v41;
        v48 = 2112;
        v49 = v26;
        _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, "Failed to move dir: %@ to new UUID dir: %@; error = %@",
          buf,
          0x20u);

        a4 = v43;
      }
    }
    v20 = v26;
  }
  else
  {
    v29 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 48);
    container_log_handle_for_category();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "containerClassPath");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v47 = v37;
      *(_WORD *)&v47[8] = 2112;
      *(_QWORD *)&v47[10] = v20;
      _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, "Failed to create class path at: %@; error = %@",
        buf,
        0x16u);

    }
  }
LABEL_13:

  if (a4)
  {
    v29 = objc_retainAutorelease(v29);
    v28 = 0;
    *a4 = v29;
  }
  else
  {
    v28 = 0;
  }
  v26 = v20;
LABEL_17:

  return v28;
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
  return 9;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
