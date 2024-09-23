@implementation MCMCommandRecreateContainerStructure

- (MCMCommandRecreateContainerStructure)initWithConcreteContainerIdentity:(id)a3 context:(id)a4 resultPromise:(id)a5
{
  id v9;
  MCMCommandRecreateContainerStructure *v10;
  MCMCommandRecreateContainerStructure *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandRecreateContainerStructure;
  v10 = -[MCMCommand initWithContext:resultPromise:](&v13, sel_initWithContext_resultPromise_, a4, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_concreteContainerIdentity, a3);

  return v11;
}

- (MCMCommandRecreateContainerStructure)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandRecreateContainerStructure *v9;
  uint64_t v10;
  MCMConcreteContainerIdentity *concreteContainerIdentity;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandRecreateContainerStructure;
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
  char v4;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToRecreateContainerStructure");

  return v4;
}

- (void)execute
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  MCMError *v8;
  void *v9;
  void *v10;
  char v11;
  MCMError *v12;
  NSObject *v13;
  NSObject *p_super;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  MCMError *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  MCMCommandRecreateContainerStructure *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  int v42;
  MCMError *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  MCMError *v47;
  MCMError *v48;
  NSObject *v49;
  MCMError *v50;
  void *v51;
  void *v52;
  id v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  char v58;
  id v59;
  MCMError *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  MCMResultBase *v64;
  void *v65;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  void *v70;
  MCMCommandRecreateContainerStructure *v71;
  NSObject *v72;
  id v73;
  MCMError *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  MCMError *v79;
  id v80;
  uint8_t buf[4];
  NSObject *v82;
  __int16 v83;
  MCMError *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  -[MCMCommandRecreateContainerStructure concreteContainerIdentity](self, "concreteContainerIdentity");
  v4 = objc_claimAutoreleasedReturnValue();
  -[MCMCommand context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  objc_msgSend(v6, "entryForContainerIdentity:error:", v4, &v80);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (MCMError *)v80;

  v72 = v4;
  if (v7)
  {
    objc_msgSend(v7, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject uuid](v4, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if ((v11 & 1) == 0)
    {

      v12 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 21);
      v7 = 0;
      v8 = v12;
    }
  }
  v79 = v8;
  objc_msgSend(v7, "metadataWithError:", &v79);
  v13 = objc_claimAutoreleasedReturnValue();
  p_super = v79;

  v71 = self;
  if (!v13)
  {
    v21 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 21);

    container_log_handle_for_category();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v82 = v4;
      _os_log_error_impl(&dword_1CF807000, p_super, OS_LOG_TYPE_ERROR, "No Container with identity: %@", buf, 0xCu);
    }
    v22 = 0;
    v70 = 0;
    v23 = 0;
    v13 = 0;
    v20 = 0;
    goto LABEL_32;
  }
  -[NSObject containerClass](v13, "containerClass");
  v69 = v3;
  if (container_class_supports_data_subdirectory())
  {
    +[MCMDataProtectionManager defaultManager](MCMDataProtectionManager, "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommand context](self, "context");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "clientIdentity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "desiredDataProtectionClassForMetadata:clientIdentity:", v13, v17);

    -[NSObject containerPath](v13, "containerPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    LOBYTE(v16) = objc_msgSend(v19, "createDataURLIfNecessaryWithDataProtectionClass:error:", v18, &v78);
    v20 = v78;

    if ((v16 & 1) == 0)
    {
      v50 = [MCMError alloc];
      -[NSObject containerPath](v13, "containerPath");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "containerDataURL");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[MCMError initWithNSError:url:defaultErrorType:](v50, "initWithNSError:url:defaultErrorType:", v20, v52, 106);

      container_log_handle_for_category();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v82 = v4;
        v83 = 2112;
        v84 = v21;
        _os_log_error_impl(&dword_1CF807000, p_super, OS_LOG_TYPE_ERROR, "Could not create container data subdir for %@; error = %@",
          buf,
          0x16u);
      }
      v22 = 0;
      v70 = 0;
      v23 = 0;
      v3 = v69;
      goto LABEL_32;
    }
    v68 = v7;
  }
  else
  {
    v68 = v7;
    v20 = 0;
  }
  v24 = v20;
  -[MCMCommand context](self, "context");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "userIdentityCache");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject userIdentity](v13, "userIdentity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "libraryRepairForUserIdentity:", v27);
  v28 = objc_claimAutoreleasedReturnValue();

  -[NSObject identifier](v13, "identifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[NSObject containerClass](v13, "containerClass");
  -[NSObject schemaVersion](v13, "schemaVersion");
  v31 = self;
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0;
  v67 = +[MCMContainerSchema schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:](MCMContainerSchema, "schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:", v29, v30, v32, &v77);
  v33 = v77;

  +[MCMDataProtectionManager defaultManager](MCMDataProtectionManager, "defaultManager");
  v34 = objc_claimAutoreleasedReturnValue();
  -[MCMCommand context](v31, "context");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "clientIdentity");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend((id)v34, "desiredDataProtectionClassForMetadata:clientIdentity:", v13, v36);

  -[NSObject containerPath](v13, "containerPath");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v37;
  v22 = (void *)v28;
  +[MCMContainerSchema containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:](MCMContainerSchema, "containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:", v13, v38, v39, v28);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = v24;
  LOBYTE(v34) = objc_msgSend(v23, "writeSchemaFromVersion:toTargetVersion:error:", &unk_1E8CD6990, v33, &v76);
  v20 = v76;

  v70 = v33;
  if ((v34 & 1) != 0)
  {
    -[NSObject metadataByChangingSchemaVersion:](v13, "metadataByChangingSchemaVersion:", v33);
    v40 = objc_claimAutoreleasedReturnValue();

    v3 = v69;
    v41 = v72;
    v7 = v68;
    v66 = v22;
    if (!v67)
    {
      v75 = 0;
      v42 = -[NSObject writeMetadataToDiskWithError:](v40, "writeMetadataToDiskWithError:", &v75);
      v43 = (MCMError *)v75;
      if (v42)
      {
        -[MCMCommand context](v71, "context");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "containerCache");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v43;
        objc_msgSend(v45, "addContainerMetadata:error:", v40, &v74);
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = v74;
        v48 = v43;
        v43 = v47;

        if (!v46)
        {
          container_log_handle_for_category();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v82 = v40;
            v83 = 2112;
            v84 = v43;
            _os_log_error_impl(&dword_1CF807000, v49, OS_LOG_TYPE_ERROR, "Could not update cache for container schema version in metadata for %@: %@", buf, 0x16u);
          }

          v46 = 0;
        }
        v41 = v72;
        v7 = v68;
      }
      else
      {
        container_log_handle_for_category();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v82 = v40;
          v83 = 2112;
          v84 = v43;
          _os_log_error_impl(&dword_1CF807000, v46, OS_LOG_TYPE_ERROR, "Could not update container schema version in metadata for %@: %@", buf, 0x16u);
        }
      }

    }
    v53 = containermanager_copy_global_configuration();
    v54 = objc_msgSend(v53, "isGlobalSystemContainerWithContainerClass:", -[NSObject containerClass](v41, "containerClass"));

    if (!v54)
      goto LABEL_30;
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject containerPath](v40, "containerPath");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "containerRootURL");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v20;
    v58 = objc_msgSend(v55, "standardizeACLsForSystemContainerAtURL:error:", v57, &v73);
    v59 = v73;

    if ((v58 & 1) != 0)
    {
      v20 = v59;
      v3 = v69;
      v41 = v72;
LABEL_30:
      v22 = v66;
      goto LABEL_33;
    }
    v60 = [MCMError alloc];
    -[NSObject containerPath](v40, "containerPath");
    v61 = objc_claimAutoreleasedReturnValue();
    -[NSObject containerRootURL](v61, "containerRootURL");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MCMError initWithNSError:url:defaultErrorType:](v60, "initWithNSError:url:defaultErrorType:", v59, v62, 63);

    p_super = v61;
    v13 = v40;
    v20 = v59;
    v3 = v69;
    v22 = v66;
  }
  else
  {
    v21 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v20, 0, 109);
    v3 = v69;
    v7 = v68;
  }
LABEL_32:

  v40 = v13;
  p_super = &v21->super;
  v41 = v72;
LABEL_33:
  container_log_handle_for_category();
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v82 = p_super;
    _os_log_impl(&dword_1CF807000, v63, OS_LOG_TYPE_DEFAULT, "Recreate container structure; error = %@", buf, 0xCu);
  }

  v64 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", p_super);
  -[MCMCommand resultPromise](v71, "resultPromise");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "completeWithResult:", v64);

  objc_autoreleasePoolPop(v3);
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
  return 8;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
