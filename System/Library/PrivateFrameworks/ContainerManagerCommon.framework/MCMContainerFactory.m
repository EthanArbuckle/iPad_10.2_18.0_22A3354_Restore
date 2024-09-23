@implementation MCMContainerFactory

- (id)containerForContainerIdentity:(id)a3 createIfNecessary:(BOOL)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  char v16;
  __int128 v17;
  MCMError *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  MCMError *v23;
  void *v24;
  char v25;
  MCMContainerFactory *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  MCMError *v38;
  _BOOL4 v39;
  NSObject *v40;
  const char *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  MCMError *v47;
  void *v48;
  NSObject *v49;
  MCMError *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  void *v56;
  BOOL v57;
  NSObject *v58;
  MCMError *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  char *v64;
  char *v65;
  char *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  void *v73;
  uint64_t v74;
  _BOOL4 v76;
  int v77;
  void *v78;
  void *v79;
  MCMContainerFactory *v80;
  MCMError *v81;
  MCMError *v82;
  MCMError *v83;
  MCMError *v84;
  MCMError *v85;
  id v86;
  uint8_t buf[4];
  const char *v88;
  __int16 v89;
  _BYTE v90[10];
  _BYTE v91[6];
  MCMError *v92;
  void *v93;
  uint64_t v94;

  v76 = a4;
  v94 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v77 = objc_msgSend(v6, "transient");
  LODWORD(v7) = objc_msgSend(v6, "platform");
  -[MCMContainerFactory clientIdentity](self, "clientIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codeSignInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "userIdentity");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "containerClass");
  v80 = self;
  if (!(_DWORD)v7)
  {
    -[MCMContainerFactory clientIdentity](self, "clientIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v12, "platform");

    objc_msgSend(v6, "identityBySettingPlatform:", v7);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v13;
  }
  container_log_handle_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    -[MCMContainerFactory clientIdentity](self, "clientIdentity");
    v42 = v10;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "codeSignInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "entitlements");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v88 = (const char *)v6;
    v89 = 1024;
    *(_DWORD *)v90 = v76;
    *(_WORD *)&v90[4] = 1024;
    *(_DWORD *)&v90[6] = v7;
    *(_WORD *)v91 = 1024;
    *(_DWORD *)&v91[2] = v77;
    LOWORD(v92) = 1024;
    *(_DWORD *)((char *)&v92 + 2) = objc_msgSend(v45, "privileged");
    HIWORD(v92) = 2112;
    v93 = v42;
    _os_log_debug_impl(&dword_1CF807000, v14, OS_LOG_TYPE_DEBUG, "createOrLookup; identity: %@, createIfNecessary: %d, platform: %d, transient: %d, privileged: %d, clientBundleIdentifier: %@",
      buf,
      0x2Eu);

    v10 = v42;
  }

  if (!v6)
  {
    v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 38);
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v20 = "Cannot lookup a nil container identity.";
LABEL_62:
    _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, v20, buf, 2u);
LABEL_10:

    v21 = 0;
    v22 = 0;
LABEL_11:
    if (v18)
    {
      v23 = objc_retainAutorelease(v18);
      v24 = 0;
      *a5 = v23;
    }
    else
    {
      v23 = 0;
      v24 = 0;
    }
    goto LABEL_57;
  }
  v15 = containermanager_copy_global_configuration();
  v16 = objc_msgSend(v15, "isUnsupportedSystemContainerWithContainerClass:", v11);

  if ((v16 & 1) != 0)
  {
    v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 72);
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v20 = "System containers are unsupported on this platform.";
    goto LABEL_62;
  }
  v73 = v10;
  v74 = v11;
  v21 = 0;
  v18 = 0;
  v24 = 0;
  v25 = 0;
  *(_QWORD *)&v17 = 136315138;
  v72 = v17;
  v26 = v80;
  while (1)
  {
    v27 = v25;
    v28 = v21;

    -[MCMContainerFactory cache](v26, "cache");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "classCacheForContainerIdentity:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[MCMContainerFactory cache](v26, "cache");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0;
    objc_msgSend(v30, "entryForContainerIdentity:classCache:error:", v6, v21, &v86);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (MCMError *)v86;

    if (v24)
    {
      if (!v77 || (objc_opt_class(), ((objc_opt_isKindOfClass() | !v76) & 1) != 0))
      {
        v22 = 0;
        v10 = v73;
        goto LABEL_48;
      }
      v31 = objc_alloc(MEMORY[0x1E0C99E98]);
      v78 = v24;
      objc_msgSend(v24, "containerPath");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "containerRootURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "path");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v31, "initFileURLWithPath:isDirectory:", v34, 1);

      v36 = containermanager_copy_global_configuration();
      LOBYTE(v31) = objc_msgSend(v36, "isGlobalContainerClass:", v74);

      if ((v31 & 1) != 0)
        v37 = 0;
      else
        v37 = v79;
      v85 = v18;
      v39 = -[MCMContainerFactory deleteURL:forUserIdentity:reclaimSoon:error:](v80, "deleteURL:forUserIdentity:reclaimSoon:error:", v35, v37, 1, &v85, v72);
      v38 = v85;

      if (!v39)
      {
        v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 5);

        container_log_handle_for_category();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v35, "path");
          v65 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v88 = v65;
          v89 = 2112;
          *(_QWORD *)v90 = v18;
          _os_log_error_impl(&dword_1CF807000, v51, OS_LOG_TYPE_ERROR, "Failed to remove transient container at %@; error = %@",
            buf,
            0x16u);

        }
        v22 = 0;
        v10 = v73;
        v24 = v78;
        goto LABEL_48;
      }

      v26 = v80;
      v24 = v78;
    }
    else
    {
      if (-[MCMError type](v18, "type") != 21
        && -[MCMError type](v18, "type") != 44
        && -[MCMError type](v18, "type") != 108)
      {
        goto LABEL_60;
      }

      if (!v76)
      {
        v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 21);
LABEL_60:
        v22 = 0;
        v10 = v73;
        goto LABEL_11;
      }
      v38 = 0;
    }
    v84 = v38;
    -[MCMContainerFactory _createContainerForContainerIdentity:error:](v26, "_createContainerForContainerIdentity:error:", v6, &v84, v72);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v84;

    if (v22)
      break;
    if (-[MCMError type](v18, "type") == 130)
    {
      container_log_handle_for_category();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = " Retrying lookup.";
        if ((v27 & 1) != 0)
          v41 = "";
        *(_DWORD *)buf = v72;
        v88 = v41;
        _os_log_error_impl(&dword_1CF807000, v40, OS_LOG_TYPE_ERROR, "Container already exists when trying to create it.%s", buf, 0xCu);
      }

      v25 = 1;
      if ((v27 & 1) == 0)
        continue;
    }
    v22 = 0;
    v10 = v73;
    if (!v24)
      goto LABEL_11;
    goto LABEL_48;
  }
  v83 = v18;
  v46 = objc_msgSend(v22, "verifyWithError:", &v83);
  v47 = v83;

  v10 = v73;
  if ((v46 & 1) != 0)
  {
    -[MCMContainerFactory cache](v80, "cache");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v47;
    objc_msgSend(v48, "addContainerMetadata:error:", v22, &v82);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = v82;

    if (!v49)
    {
      v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 45);

      container_log_handle_for_category();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v22, "containerPath");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "containerRootURL");
        v68 = v6;
        v69 = v21;
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "path");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v88 = (const char *)v22;
        v89 = 2112;
        *(_QWORD *)v90 = v71;
        *(_WORD *)&v90[8] = 1024;
        *(_DWORD *)v91 = v77;
        *(_WORD *)&v91[4] = 2112;
        v92 = v18;
        _os_log_error_impl(&dword_1CF807000, v61, OS_LOG_TYPE_ERROR, "Failed to add to cache: %@, url: %@, transient: %d; error = %@",
          buf,
          0x26u);

        v21 = v69;
        v6 = v68;

      }
      goto LABEL_11;
    }
    v24 = (void *)-[NSObject copyWithZone:](v49, "copyWithZone:", 0);
    v47 = v50;
  }
  else
  {
    container_log_handle_for_category();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v22, "shortDescription");
      v66 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v88 = v66;
      v89 = 2112;
      *(_QWORD *)v90 = v47;
      _os_log_error_impl(&dword_1CF807000, v49, OS_LOG_TYPE_ERROR, "Failed to verify new metadata; metadata = %@, error = %@",
        buf,
        0x16u);

    }
  }

  v18 = v47;
  if (!v24)
    goto LABEL_11;
LABEL_48:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "uuid");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v52, "isEqual:", v53);

    if ((v54 & 1) == 0)
    {

      v60 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 21);
      v18 = v60;
      goto LABEL_11;
    }
  }
  if (v76)
  {
    v55 = v21;
    -[MCMContainerFactory clientIdentity](v80, "clientIdentity");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v18;
    v57 = -[MCMContainerFactory upgradeContainer:clientIdentity:error:](v80, "upgradeContainer:clientIdentity:error:", v24, v56, &v81);
    v23 = v81;

    if (!v57)
    {
      container_log_handle_for_category();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v24, "containerPath");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "containerRootURL");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "path");
        v64 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v88 = v64;
        v89 = 2112;
        *(_QWORD *)v90 = v23;
        _os_log_error_impl(&dword_1CF807000, v58, OS_LOG_TYPE_ERROR, "Failed to migrate container at [%@]; error = %@",
          buf,
          0x16u);

      }
    }
    v21 = v55;
  }
  else
  {
    v23 = v18;
  }
LABEL_57:

  return v24;
}

- (MCMClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (MCMContainerCache)cache
{
  return self->_cache;
}

- (MCMContainerFactory)initWithContainerCache:(id)a3 clientIdentity:(id)a4 userIdentityCache:(id)a5
{
  id v9;
  id v10;
  id v11;
  MCMContainerFactory *v12;
  MCMContainerFactory *v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCMContainerFactory;
  v12 = -[MCMContainerFactory init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_cache, a3);
    objc_storeStrong((id *)&v13->_clientIdentity, a4);
    objc_storeStrong((id *)&v13->_userIdentityCache, a5);
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

- (BOOL)upgradeContainer:(id)a3 clientIdentity:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  MCMError *v15;
  void *v16;
  void *v17;
  int v18;
  MCMError *v19;
  void *v20;
  void *v21;
  MCMError *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  BOOL v27;
  id v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  MCMError *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  int v41;
  MCMError *v42;
  MCMError *v43;
  void *v44;
  void *v45;
  void *v47;
  int v48;
  MCMError *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  MCMError *v55;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  MCMError *v61;
  MCMError *v62;
  id v63;
  MCMError *v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[6];
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  char v73;
  _BYTE buf[24];
  char v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v57 = a4;
  objc_msgSend(v7, "schemaVersion");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containerClass");
  -[MCMContainerFactory userIdentityCache](self, "userIdentityCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userIdentity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "libraryRepairForUserIdentity:", v11);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "containerClass");
  if (!container_class_supports_data_subdirectory())
  {
    v16 = 0;
    v15 = 0;
    goto LABEL_15;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v75 = 0;
  v70 = 0;
  v71 = &v70;
  v72 = 0x2020000000;
  v73 = 0;
  objc_msgSend(v8, "containerDataURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0;
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __71__MCMContainerFactory_Upgrades__upgradeContainer_clientIdentity_error___block_invoke;
  v68[3] = &unk_1E8CB62A8;
  v68[4] = buf;
  v68[5] = &v70;
  v13 = objc_msgSend(v58, "fixAndRetryIfPermissionsErrorWithURL:containerPath:containerIdentifier:error:duringBlock:", v12, v8, v60, &v69, v68);
  v14 = v69;

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v14, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

    if (!v18)
    {
      v15 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 105);
      goto LABEL_25;
    }
    v19 = [MCMError alloc];
    objc_msgSend(v8, "containerDataURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v19, "initWithErrorType:category:path:POSIXerrno:", 105, 1, v21, objc_msgSend(v14, "code"));
    goto LABEL_9;
  }
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24) || !*((_BYTE *)v71 + 24))
  {
    v67 = 0;
    objc_msgSend(v7, "metadataWithError:", &v67);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (MCMError *)v67;
    if (!v20)
      goto LABEL_23;
    +[MCMDataProtectionManager defaultManager](MCMDataProtectionManager, "defaultManager");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend((id)v23, "desiredDataProtectionClassForMetadata:clientIdentity:", v20, v57);

    v66 = v14;
    LOBYTE(v23) = objc_msgSend(v8, "createDataURLIfNecessaryWithDataProtectionClass:error:", v24, &v66);
    v25 = v66;

    if ((v23 & 1) != 0)
    {
      v26 = &unk_1E8CD6990;

      v59 = &unk_1E8CD6990;
      v14 = v25;
      goto LABEL_14;
    }
    objc_msgSend(v25, "domain");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

    if (v48)
    {
      v49 = [MCMError alloc];
      objc_msgSend(v8, "containerDataURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "path");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v49, "initWithErrorType:category:path:POSIXerrno:", 106, 1, v50, objc_msgSend(v25, "code"));

      v14 = v25;
      v15 = (MCMError *)v51;
      goto LABEL_10;
    }
    v22 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 106);
    v21 = v15;
    v14 = v25;
LABEL_9:
    v15 = v22;
LABEL_10:

LABEL_23:
LABEL_25:
    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(buf, 8);
    v28 = 0;
    goto LABEL_33;
  }
  v15 = 0;
LABEL_14:
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(buf, 8);
  v16 = v14;
LABEL_15:
  v65 = 0;
  v27 = +[MCMContainerSchema schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:](MCMContainerSchema, "schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:", v60, v9, v59, &v65);
  v28 = v65;
  if (!v27)
  {
    v64 = v15;
    objc_msgSend(v7, "metadataWithError:", &v64);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v64;

    if (v31)
    {
      +[MCMDataProtectionManager defaultManager](MCMDataProtectionManager, "defaultManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "desiredDataProtectionClassForMetadata:clientIdentity:", v31, v57);

      objc_msgSend(v31, "containerPath");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMContainerSchema containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:](MCMContainerSchema, "containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:", v31, v34, v33, v58);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = v16;
      LOBYTE(v33) = objc_msgSend(v54, "writeSchemaFromVersion:toTargetVersion:error:", v59, v28, &v63);
      v14 = v63;

      if ((v33 & 1) != 0)
      {
        objc_msgSend(v31, "metadataByChangingSchemaVersion:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v62 = v55;
          v35 = objc_msgSend(v29, "writeMetadataToDiskWithError:", &v62);
          v36 = v62;

          if (v35)
          {
            -[MCMContainerFactory cache](self, "cache");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v36;
            objc_msgSend(v37, "addContainerMetadata:error:", v29, &v61);
            v38 = objc_claimAutoreleasedReturnValue();
            v15 = v61;

            if (v38)
            {
              v30 = 1;
              v7 = (id)v38;
            }
            else
            {
              container_log_handle_for_category();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v15;
                _os_log_error_impl(&dword_1CF807000, v53, OS_LOG_TYPE_ERROR, "Failed to update cache with new metadata during schema update; error = %@",
                  buf,
                  0xCu);
              }

              v7 = 0;
              v15 = 0;
              v30 = 1;
            }
          }
          else
          {
            container_log_handle_for_category();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v29;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v36;
              _os_log_error_impl(&dword_1CF807000, v52, OS_LOG_TYPE_ERROR, "Could not update container schema version or data protection class in metadata for %@: %@", buf, 0x16u);
            }

            v30 = 1;
            v15 = v36;
          }
        }
        else
        {
          v30 = 1;
          v15 = v55;
        }
        goto LABEL_36;
      }
      container_log_handle_for_category();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v60;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v14;
        _os_log_error_impl(&dword_1CF807000, v39, OS_LOG_TYPE_ERROR, "Could not update container schema for %@: %@", buf, 0x16u);
      }

      objc_msgSend(v14, "domain");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

      v42 = [MCMError alloc];
      v43 = v42;
      if (v41)
      {
        objc_msgSend(v8, "containerDataURL");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "path");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v43, "initWithErrorType:category:path:POSIXerrno:", 104, 1, v45, objc_msgSend(v14, "code"));

      }
      else
      {
        v15 = -[MCMError initWithErrorType:](v42, "initWithErrorType:", 104);
        v44 = v55;
      }

    }
    else
    {
      v14 = v16;
      v15 = v55;
    }
LABEL_33:
    if (a5)
    {
      v15 = objc_retainAutorelease(v15);
      v30 = 0;
      v29 = 0;
      *a5 = v15;
    }
    else
    {
      v30 = 0;
      v29 = 0;
    }
LABEL_36:
    v16 = v14;
    goto LABEL_37;
  }
  v29 = 0;
  v30 = 1;
LABEL_37:

  return v30;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (id)createStagedContainerForContainerIdentity:(id)a3 finalContainerPath:(id *)a4 dataProtectionClass:(int)a5 error:(id *)a6
{
  uint64_t v7;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  MCMError *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  __objc2_class **v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  char v28;
  NSObject *v29;
  id *v30;
  uint64_t v31;
  char v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  MCMContainerFactory *v38;
  void *v39;
  id v40;
  MCMMetadata *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  MCMError *v46;
  id v47;
  int v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  MCMContainerFactory *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id *v58;
  id *v59;
  MCMError *v61;
  NSObject *v62;
  id v63;
  void *v64;
  char v65;
  void *v66;
  id *v67;
  MCMContainerFactory *v68;
  void *v69;
  id v70;
  id *v71;
  unint64_t v72;
  id *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  MCMError *v83;
  id v84;
  id v85;
  id v86;
  id v87;
  const __CFString *v88;
  void *v89;
  uint8_t buf[4];
  id *p_isa;
  __int16 v92;
  id v93;
  uint64_t v94;

  v7 = *(_QWORD *)&a5;
  v94 = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a3;
  objc_msgSend(v10, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = objc_claimAutoreleasedReturnValue();

  if (a4)
    v14 = *a4;
  else
    v14 = 0;
  v15 = v14;
  v87 = 0;
  -[MCMContainerFactory _generateConcreteContainerIdentityFromContainerIdentity:error:](self, "_generateConcreteContainerIdentityFromContainerIdentity:error:", v11, &v87);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (MCMError *)v87;
  v78 = (void *)v13;
  if (!v16)
  {
    v76 = 0;
    v77 = 0;
    v54 = 0;
    v26 = 0;
    v75 = 0;
    v79 = 0;
    v80 = 0;
    v55 = 0;
    if (a6)
    {
LABEL_28:
      v46 = objc_retainAutorelease(v17);
      v59 = a6;
      a6 = 0;
      *v59 = v46;
      goto LABEL_29;
    }
LABEL_20:
    v46 = v17;
LABEL_29:
    v50 = v80;
    goto LABEL_30;
  }
  v71 = a4;
  v73 = a6;
  v18 = objc_msgSend(v16, "containerClass");
  objc_msgSend(v16, "userIdentity");
  v74 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "containerPathIdentifier");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v16, "transient");
  objc_msgSend(v16, "identityByChangingContainerPathIdentifier:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v22 = off_1E8CB3AD8;
    if (!v20)
      v22 = off_1E8CB3AC8;
    -[__objc2_class containerPathForUserIdentity:containerClass:containerPathIdentifier:](*v22, "containerPathForUserIdentity:containerClass:containerPathIdentifier:", v74, v18, v19);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v72 = v18;
  +[MCMContainerStagingPath stagingContainerPathForDestinationContainerPath:stagingPathIdentifier:](MCMContainerStagingPath, "stagingContainerPathForDestinationContainerPath:stagingPathIdentifier:", v15, v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "containerClassPath");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0;
  v25 = objc_msgSend(v24, "createIfNecessaryWithError:", &v86);
  v26 = v86;

  v80 = v23;
  v76 = v21;
  v77 = (void *)v19;
  if ((v25 & 1) == 0)
  {
    v46 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 8);

    container_log_handle_for_category();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v23, "classURL");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "path");
      v58 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      p_isa = v58;
      v92 = 2112;
      v93 = v26;
      _os_log_error_impl(&dword_1CF807000, v56, OS_LOG_TYPE_ERROR, "Failed to create staging class dir at %@ : %@", buf, 0x16u);

    }
    goto LABEL_26;
  }
  objc_msgSend(v23, "containerClassPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "supportsDataProtection");

  if ((v28 & 1) == 0)
  {
    container_log_handle_for_category();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v23, "containerClassPath");
      v30 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      p_isa = v30;
      _os_log_impl(&dword_1CF807000, v29, OS_LOG_TYPE_DEFAULT, "DP not supported for [%@]", buf, 0xCu);

    }
    v7 = 0xFFFFFFFFLL;
  }
  v85 = v26;
  v31 = v7;
  v32 = objc_msgSend(v80, "createIfNecessaryWithDataProtectionClass:error:", v7, &v85);
  v33 = v85;

  if ((v32 & 1) == 0)
  {
    v46 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 7);

    container_log_handle_for_category();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v80, "containerRootURL");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "path");
      v67 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      p_isa = v67;
      v92 = 2112;
      v93 = v33;
      _os_log_error_impl(&dword_1CF807000, v56, OS_LOG_TYPE_ERROR, "Failed to create staging dir at %@ : %@", buf, 0x16u);

    }
    v26 = v33;
LABEL_26:
    v54 = (void *)v74;

    v75 = 0;
    v79 = 0;
    v55 = 0;
    v16 = 0;
    goto LABEL_27;
  }
  v69 = v33;
  v70 = v15;
  v88 = CFSTR("com.apple.MobileInstallation.ContentProtectionClass");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v89, &v88, 1);
  v35 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "identifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0;
  +[MCMContainerSchema schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:](MCMContainerSchema, "schemaIsUpToDateForIdentifier:containerClass:currentSchemaVersion:latestSchemaVersion:", v36, objc_msgSend(v21, "containerClass"), &unk_1E8CD6978, &v84);
  v37 = v21;
  v38 = self;
  v39 = (void *)v35;
  v40 = v84;

  v41 = [MCMMetadata alloc];
  -[MCMContainerFactory clientIdentity](v38, "clientIdentity");
  v42 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v42, "codeSignInfo");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "identifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v38;
  -[MCMContainerFactory userIdentityCache](v38, "userIdentityCache");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v39;
  v79 = v40;
  a6 = -[MCMMetadata initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:creator:userIdentityCache:](v41, "initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:creator:userIdentityCache:", v37, v39, v80, 0, v40, v31, v44, v45);

  v83 = v17;
  LOBYTE(v42) = objc_msgSend(a6, "writeMetadataToDiskWithError:", &v83);
  v46 = v83;

  if ((v42 & 1) == 0)
  {
    v61 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 34);

    container_log_handle_for_category();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      p_isa = (id *)&v61->super.isa;
      _os_log_error_impl(&dword_1CF807000, v62, OS_LOG_TYPE_ERROR, "Failed to write metadata: %@", buf, 0xCu);
    }
    v16 = 0;
    v55 = 0;
    v63 = v69;
    v15 = v70;
    v50 = v80;
LABEL_42:

    v26 = v63;
    v46 = v61;
    goto LABEL_43;
  }
  v47 = containermanager_copy_global_configuration();
  v48 = objc_msgSend(v47, "isGlobalSystemContainerWithContainerClass:", v72);

  if (!v48)
  {
    v26 = v69;
    v15 = v70;
    v50 = v80;
    v53 = v68;
LABEL_35:
    v16 = 0;
    if (v72 <= 0xB && ((1 << v72) & 0xED4) != 0)
    {
      -[MCMContainerFactory userIdentityCache](v53, "userIdentityCache");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "libraryRepairForUserIdentity:", v74);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    +[MCMContainerSchema containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:](MCMContainerSchema, "containerSchemaWithMetadata:finalContainerPath:dataProtectionClass:libraryRepair:", a6, v15, v31, v16);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v26;
    v65 = objc_msgSend(v55, "writeSchemaFromVersion:toTargetVersion:error:", &unk_1E8CD6990, v40, &v81);
    v63 = v81;

    if ((v65 & 1) != 0)
    {
      v26 = v63;
      goto LABEL_43;
    }
    v61 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 109);

    container_log_handle_for_category();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      p_isa = a6;
      v92 = 2112;
      v93 = v63;
      _os_log_error_impl(&dword_1CF807000, v62, OS_LOG_TYPE_ERROR, "Could not create container schema for %@: %@", buf, 0x16u);
    }
    goto LABEL_42;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v80;
  objc_msgSend(v80, "containerRootURL");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v69;
  v52 = objc_msgSend(v49, "setTopLevelSystemContainerACLAtURL:error:", v51, &v82);
  v26 = v82;

  v53 = v68;
  if (v52)
  {
    v15 = v70;
    goto LABEL_35;
  }
  v16 = 0;
  v55 = 0;
  v15 = v70;
LABEL_43:
  v54 = (void *)v74;
  if (!a6)
  {
LABEL_27:
    v17 = v46;
    a6 = v73;
    if (v73)
      goto LABEL_28;
    goto LABEL_20;
  }
  if (v71)
  {
    v15 = objc_retainAutorelease(v15);
    *v71 = v15;
  }
LABEL_30:

  return a6;
}

- (BOOL)deleteURL:(id)a3 forUserIdentity:(id)a4 error:(id *)a5
{
  return -[MCMContainerFactory deleteURL:forUserIdentity:reclaimSoon:error:](self, "deleteURL:forUserIdentity:reclaimSoon:error:", a3, a4, 0, a5);
}

- (BOOL)deleteURL:(id)a3 forUserIdentity:(id)a4 reclaimSoon:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  MCMCommandContext *v18;
  void *v19;
  void *v20;
  id v21;
  MCMCommandContext *v22;
  MCMCommandOperationReclaimDiskSpace *v23;
  BOOL v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  MCMContainerFactory *v32;
  id v33;
  uint64_t *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t *v38;
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v7 = a5;
  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__11270;
  v55 = __Block_byref_object_dispose__11271;
  v56 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__11270;
  v49[4] = __Block_byref_object_dispose__11271;
  v50 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__11270;
  v39[4] = __Block_byref_object_dispose__11271;
  v40 = 0;
  -[MCMContainerFactory userIdentityCache](self, "userIdentityCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "defaultUserIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MCMSharedDeathrowQueue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke;
  v29 = &unk_1E8CB6280;
  v15 = v11;
  v30 = v15;
  v34 = &v51;
  v35 = v39;
  v36 = v49;
  v16 = v10;
  v31 = v16;
  v32 = self;
  v17 = v13;
  v33 = v17;
  v37 = &v45;
  v38 = &v41;
  dispatch_sync(v14, &v26);

  if (*((_BYTE *)v46 + 24))
  {
    if (v7)
    {
      v18 = [MCMCommandContext alloc];
      -[MCMContainerFactory clientIdentity](self, "clientIdentity", v26, v27, v28, v29, v30, v31, v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerFactory userIdentityCache](self, "userIdentityCache");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = containermanager_copy_global_configuration();
      v22 = -[MCMCommandContext initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:](v18, "initWithClientIdentity:containerCache:containerFactory:userIdentityCache:kernelPersonaID:globalConfiguration:", v19, 0, self, v20, 0, v21);

      v23 = -[MCMCommandOperationReclaimDiskSpace initWithAsynchronously:context:resultPromise:]([MCMCommandOperationReclaimDiskSpace alloc], "initWithAsynchronously:context:resultPromise:", 1, v22, 0);
      -[MCMCommandOperationReclaimDiskSpace execute](v23, "execute");

    }
    goto LABEL_5;
  }
  if (*((_BYTE *)v42 + 24))
  {
LABEL_5:
    v24 = 1;
    goto LABEL_6;
  }
  v24 = 0;
  if (a6)
    *a6 = objc_retainAutorelease((id)v52[5]);
LABEL_6:

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v51, 8);
  return v24;
}

- (id)_createContainerForContainerIdentity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  MCMError *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  id v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  id v50;
  NSObject *v51;
  id v52;
  char v53;
  id v54;
  void *v55;
  BOOL v56;
  NSObject *v57;
  MCMError *v58;
  MCMError *v60;
  NSObject *v61;
  void *v62;
  MCMError *v63;
  NSObject *p_super;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  MCMContainerFactory *v72;
  void *v73;
  id *v74;
  id v75;
  void *v76;
  uint64_t v77;
  void *v78;
  MCMError *v79;
  void *v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  uint8_t buf[4];
  uint64_t v88;
  __int16 v89;
  id v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  const __CFString *v94;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containerClass");
  objc_msgSend(v6, "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "waitOnLock:", 7);

  +[MCMDataProtectionManager defaultManager](MCMDataProtectionManager, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerFactory clientIdentity](self, "clientIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "intendedDataProtectionClassBasedOnEntitlementsForIdentifier:clientIdentity:containerClass:info:", v7, v12, v8, 0);

  v85 = 0;
  v86 = 0;
  -[MCMContainerFactory createStagedContainerForContainerIdentity:finalContainerPath:dataProtectionClass:error:](self, "createStagedContainerForContainerIdentity:finalContainerPath:dataProtectionClass:error:", v6, &v86, v13, &v85);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v86;
  v16 = (MCMError *)v85;
  if (v14)
  {
    v77 = v8;
    v78 = v9;
    v79 = v16;
    v74 = a4;
    v75 = v6;
    objc_msgSend(v14, "containerIdentity");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "containerPathIdentifier");
    v17 = objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v18))
    {
      -[MCMContainerFactory clientIdentity](self, "clientIdentity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "codeSignInfo");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = CFSTR("<unknown>");
      *(_DWORD *)buf = 138478595;
      v88 = v17;
      if (v21)
        v23 = (const __CFString *)v21;
      v89 = 2113;
      v90 = v7;
      v91 = 2050;
      v92 = v77;
      v93 = 2113;
      v94 = v23;
      _os_signpost_emit_with_name_impl(&dword_1CF807000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CreatingContainer", " uuid=%{private, signpost.description:attribute}@  identifier=%{private, signpost.description:attribute}@  class=%{public, signpost.description:attribute}llu  clientIdentifier=%{private, signpost.description:attribute}@ ", buf, 0x2Au);

    }
    v72 = self;
    v80 = (void *)v17;
    v76 = v7;

    objc_msgSend(v14, "containerPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "containerClassPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = 0;
    v26 = objc_msgSend(v25, "createIfNecessaryWithError:", &v84);
    v27 = v84;

    if (v26)
    {
      v28 = 0;
      v29 = *MEMORY[0x1E0CB2FE0];
      while (1)
      {

        +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "containerRootURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "containerRootURL");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = 0;
        v33 = objc_msgSend(v30, "moveItemAtURL:toURL:error:", v31, v32, &v83);
        v34 = v83;

        if ((v33 & 1) != 0)
          break;
        container_log_handle_for_category();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v24, "containerRootURL");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "path");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "containerRootURL");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "path");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v88 = (uint64_t)v43;
          v89 = 2112;
          v90 = v45;
          v91 = 2112;
          v92 = (uint64_t)v34;
          _os_log_error_impl(&dword_1CF807000, v35, OS_LOG_TYPE_ERROR, "Failed to move staging dir: %@ to live dir: %@; error = %@",
            buf,
            0x20u);

        }
        objc_msgSend(v34, "domain");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "isEqualToString:", v29))
        {
          v37 = objc_msgSend(v34, "code");

          if (v37 == 66)
          {

            v60 = [MCMError alloc];
            objc_msgSend(v15, "containerRootURL");
            v61 = objc_claimAutoreleasedReturnValue();
            -[NSObject path](v61, "path");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v60, "initWithErrorType:category:path:POSIXerrno:", 130, 1, v62, 66);

            p_super = v61;
            goto LABEL_21;
          }
        }
        else
        {

        }
        objc_msgSend(v34, "domain");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v38, "isEqualToString:", v29))
        {

LABEL_32:
          v63 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 8);
          v7 = v76;
          p_super = &v79->super;
          goto LABEL_33;
        }
        v39 = objc_msgSend(v34, "code") != 2;

        if (((v28 | v39) & 1) != 0)
          goto LABEL_32;
        objc_msgSend(v15, "containerClassPath");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setExists:", 0);

        objc_msgSend(v15, "containerClassPath");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v34;
        v42 = objc_msgSend(v41, "createIfNecessaryWithError:", &v84);
        v27 = v84;

        v28 = 1;
        if ((v42 & 1) == 0)
          goto LABEL_18;
      }
      v7 = v76;
      if (_os_feature_enabled_impl())
      {
        +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "containerRootURL");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = 0;
        v49 = objc_msgSend(v47, "enableFastDiskUsageForURL:error:", v48, &v82);
        v50 = v82;

        if ((v49 & 1) == 0)
        {
          container_log_handle_for_category();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v15, "containerRootURL");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "path");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v88 = (uint64_t)v70;
            v89 = 2112;
            v90 = v50;
            _os_log_error_impl(&dword_1CF807000, v51, OS_LOG_TYPE_ERROR, "Failed to enable fast disk stats on new container [%@]; error = %@",
              buf,
              0x16u);

          }
        }

      }
      objc_msgSend(v14, "metadataByChangingContainerPath:", v15);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
    }
    else
    {
LABEL_18:

      v63 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 8);
      container_log_handle_for_category();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "classURL");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "path");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v88 = (uint64_t)v66;
        v89 = 2112;
        v90 = v27;
        _os_log_error_impl(&dword_1CF807000, p_super, OS_LOG_TYPE_ERROR, "Failed to create class dir at %@ : %@", buf, 0x16u);

      }
      v34 = v27;
LABEL_21:
      v7 = v76;
LABEL_33:

      v9 = v78;
      if (!v24)
      {
        v46 = 0;
        v16 = v63;
        a4 = v74;
        v6 = v75;
        goto LABEL_44;
      }
      v52 = containermanager_copy_global_configuration();
      v53 = objc_msgSend(v52, "isGlobalContainerClass:", v77);

      if ((v53 & 1) != 0)
        v54 = 0;
      else
        v54 = v78;
      objc_msgSend(v24, "containerRootURL");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = 0;
      v56 = -[MCMContainerFactory deleteURL:forUserIdentity:reclaimSoon:error:](v72, "deleteURL:forUserIdentity:reclaimSoon:error:", v55, v54, 1, &v81);
      v14 = v81;

      if (!v56)
      {
        container_log_handle_for_category();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v24, "containerRootURL");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "path");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v88 = (uint64_t)v68;
          v89 = 2112;
          v90 = v14;
          _os_log_fault_impl(&dword_1CF807000, v57, OS_LOG_TYPE_FAULT, "Failed to remove staging dir: %@; error = %@",
            buf,
            0x16u);

          v7 = v76;
        }

      }
      v46 = 0;
      v79 = v63;
    }

    a4 = v74;
    v6 = v75;
    v9 = v78;
    v16 = v79;
LABEL_44:
    v14 = v73;
    if (!a4)
      goto LABEL_47;
    goto LABEL_45;
  }
  v80 = 0;
  v24 = 0;
  v34 = 0;
  v46 = 0;
  if (!a4)
    goto LABEL_47;
LABEL_45:
  if (!v46)
  {
    v58 = v16;
    *a4 = objc_retainAutorelease(v16);
    v16 = v58;
  }
LABEL_47:

  return v46;
}

- (id)_generateConcreteContainerIdentityFromContainerIdentity:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  MCMError *v18;
  MCMError *v19;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "userIdentity");
    v23 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "platform");
    v10 = objc_msgSend(v6, "transient");
    v24[0] = 1;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerFactory _containerPathIdentifierForContainerIdentity:](self, "_containerPathIdentifierForContainerIdentity:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v22 = a4;
      v13 = v8;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "uuid");
        v14 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v14;
      }
      objc_msgSend(v6, "containerConfig");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerFactory userIdentityCache](self, "userIdentityCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE1(v21) = v10;
      LOBYTE(v21) = 0;
      v17 = (void *)v23;
      v8 = v13;
      +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:](MCMConcreteContainerIdentityForLibsystem, "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v11, v23, v13, v15, v9, v12, v21, v16, v24);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v18 = 0;
LABEL_12:

        goto LABEL_13;
      }
      v19 = [MCMError alloc];
      v18 = -[MCMError initWithErrorType:](v19, "initWithErrorType:", v24[0]);
      a4 = v22;
      if (!v22)
      {
LABEL_11:
        v7 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      v18 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 138);
      v17 = (void *)v23;
      if (!a4)
        goto LABEL_11;
    }
    v18 = objc_retainAutorelease(v18);
    v7 = 0;
    *a4 = v18;
    goto LABEL_12;
  }
  v7 = v6;
LABEL_13:

  return v7;
}

- (id)_containerPathIdentifierForContainerIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v3, "containerClass");
    objc_msgSend(v3, "platform");
    objc_msgSend(v3, "transient");
    objc_msgSend(v3, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((container_class_supports_randomized_path() & 1) != 0)
    {
      if ((v6 & 0xFFFFFFFFFFFFFFFELL) != 0xC)
      {
LABEL_12:

        goto LABEL_13;
      }
      +[MCMEntitlementBypassList sharedBypassList](MCMEntitlementBypassList, "sharedBypassList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v6 == 13)
        objc_msgSend(v8, "wellknownSystemGroupContainerForId:", v7);
      else
        objc_msgSend(v8, "wellknownSystemContainerForId:", v7);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v10 = v10;

        v4 = v10;
      }
    }
    else
    {
      +[MCMContainerPath containerPathIdentifierForCodeSignIdentifier:containerClass:](MCMContainerPath, "containerPathIdentifierForCodeSignIdentifier:containerClass:", v7, objc_msgSend(v3, "containerClass"));
      v10 = v4;
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_12;
  }
  objc_msgSend(v3, "containerPathIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v4;
}

void __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void *v19;
  uint64_t v20;
  MCMError *v21;
  uint64_t v22;
  void *v23;
  MCMError *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  MCMError *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  MCMError *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id obj;
  uint8_t buf[4];
  NSObject *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
    +[MCMContainerClassDeletedPath deletedURLWithUserIdentity:](MCMContainerClassDeletedPath, "deletedURLWithUserIdentity:");
  else
    +[MCMContainerClassDeletedPath deletedGlobalURL](MCMContainerClassDeletedPath, "deletedGlobalURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v21 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 13);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Could not get deathrow URL", buf, 2u);
    }
    goto LABEL_23;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "createTemporaryDirectoryInDirectoryURL:error:", v2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, objc_msgSend(*(id *)(a1 + 40), "hasDirectoryPath"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(*(id *)(a1 + 48), "userIdentityCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "libraryRepairForUserIdentity:", *(_QWORD *)(a1 + 56));
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = *(_QWORD *)(a1 + 72);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v47 = *(id *)(v16 + 40);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[2] = __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke_15;
    v46[3] = &unk_1E8CB6740;
    v17 = *(_QWORD *)(a1 + 40);
    v46[1] = 3221225472;
    v46[4] = v15;
    v18 = -[NSObject fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:](v14, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v17, &v47, v46);
    objc_storeStrong((id *)(v16 + 40), v47);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v18;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
      goto LABEL_18;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "code");

      if (v20 == 2)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {

    }
    v29 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 41);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

    container_log_handle_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "path");
      v40 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "path");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v50 = v40;
      v51 = 2112;
      v52 = v41;
      v53 = 2112;
      v54 = v42;
      _os_log_error_impl(&dword_1CF807000, v27, OS_LOG_TYPE_ERROR, "Failed to move item at: %@ to: %@; error = %@",
        buf,
        0x20u);

    }
  }
  else
  {
    v24 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 41);
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    objc_msgSend(*(id *)(a1 + 40), "path");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 138412546;
    v50 = v27;
    v51 = 2112;
    v52 = v28;
    _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Failed to create unique directory at: %@; error = %@",
      buf,
      0x16u);
  }

LABEL_18:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "userIdentityCache");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "libraryRepairForUserIdentity:", *(_QWORD *)(a1 + 56));
    v14 = objc_claimAutoreleasedReturnValue();

    v33 = *(_QWORD *)(a1 + 40);
    v34 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v45 = *(id *)(v34 + 40);
    v35 = -[NSObject fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:](v14, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v33, &v45, &__block_literal_global_11279);
    objc_storeStrong((id *)(v34 + 40), v45);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = v35;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    {
      v36 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 41);
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v38 = *(void **)(v37 + 40);
      *(_QWORD *)(v37 + 40) = v36;

      container_log_handle_for_category();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "path");
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v50 = v43;
        v51 = 2112;
        v52 = v44;
        _os_log_error_impl(&dword_1CF807000, v39, OS_LOG_TYPE_ERROR, "Failed to direct-delete [%@]; error = %@",
          buf,
          0x16u);

      }
    }
    goto LABEL_23;
  }
LABEL_24:

}

uint64_t __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke_15(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "moveItemAtURL:toURL:error:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);

  return v7;
}

uint64_t __67__MCMContainerFactory_deleteURL_forUserIdentity_reclaimSoon_error___block_invoke_17(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, a3);

  return v6;
}

uint64_t __71__MCMContainerFactory_Upgrades__upgradeContainer_clientIdentity_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "itemAtURL:exists:isDirectory:error:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, a3);

  return v7;
}

@end
