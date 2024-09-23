@implementation MCMContainerCacheEntry

+ (id)identifierForURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_fileHandleForURL:writeable:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifierForFileHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_fileHandleForURL:(id)a3 writeable:(BOOL)a4
{
  id v4;
  MCMFileHandle *v5;
  void *v6;
  MCMFileHandle *v7;
  uint64_t v9;

  v4 = a3;
  v5 = [MCMFileHandle alloc];
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = 1;
  v7 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:](v5, "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:", v6, 0, 9, 0, 0, 0, v9);

  return v7;
}

- (BOOL)verify
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  const char *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  BOOL v48;
  NSObject *v50;
  char v51;
  void *v52;
  char v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  char v61;
  _QWORD v62[4];
  id v63;
  uint64_t *v64;
  uint64_t *v65;
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;
  uint8_t buf[4];
  MCMContainerCacheEntry *v78;
  __int16 v79;
  NSObject *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry identifier](self, "identifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerClassPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentity");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry userIdentityCache](self, "userIdentityCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryRepairForUserIdentity:", v57);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__13086;
  v71 = __Block_byref_object_dispose__13087;
  v72 = 0;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __32__MCMContainerCacheEntry_verify__block_invoke;
  v62[3] = &unk_1E8CB6908;
  v9 = (id)v7;
  v63 = v9;
  v64 = &v73;
  v65 = &v67;
  LOBYTE(v7) = objc_msgSend(v6, "fixAndRetryIfPermissionsErrorWithURL:containerPath:containerIdentifier:error:duringBlock:", v8, v3, v58, &v66, v62);
  v56 = v66;

  if ((v7 & 1) == 0)
  {
    container_log_handle_for_category();
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
LABEL_29:
      v26 = 0;
      v32 = 0;
      v22 = 0;
      goto LABEL_30;
    }
    *(_DWORD *)buf = 138412546;
    v78 = self;
    v79 = 2112;
    v80 = v56;
    v44 = "Cache entry failed verification, failed to check; cacheEntry = %@, error = %@";
LABEL_22:
    _os_log_error_impl(&dword_1CF807000, v41, OS_LOG_TYPE_ERROR, v44, buf, 0x16u);
    goto LABEL_29;
  }
  if (!*((_BYTE *)v74 + 24))
  {
    container_log_handle_for_category();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "metadataURL");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "path");
      v46 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v78 = self;
      v79 = 2112;
      v80 = v46;
      _os_log_error_impl(&dword_1CF807000, v41, OS_LOG_TYPE_ERROR, "Cache entry failed verification, metadata URL doesn't exist; cacheEntry = %@, metadataURL = [%@]",
        buf,
        0x16u);

    }
    goto LABEL_29;
  }
  -[MCMContainerCacheEntry fsNode](self, "fsNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_7;
  -[MCMContainerCacheEntry fsNode](self, "fsNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v68[5]);

  if ((v12 & 1) == 0)
  {
    container_log_handle_for_category();
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v47 = v68[5];
    *(_DWORD *)buf = 138412546;
    v78 = self;
    v79 = 2112;
    v80 = v47;
    v44 = "Cache entry failed verification, fs node changed; cacheEntry = %@, current fsNode = %@";
    goto LABEL_22;
  }
  -[MCMContainerCacheEntry fsNode](self, "fsNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "ctime");
  if (v14 != objc_msgSend((id)v68[5], "ctime"))
  {

    goto LABEL_28;
  }
  -[MCMContainerCacheEntry fsNode](self, "fsNode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "ctime");
  v17 = v16;
  objc_msgSend((id)v68[5], "ctime");
  LOBYTE(v17) = v17 == v18;

  if ((v17 & 1) == 0)
  {
LABEL_28:
    container_log_handle_for_category();
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v50 = v68[5];
    *(_DWORD *)buf = 138412546;
    v78 = self;
    v79 = 2112;
    v80 = v50;
    v44 = "Cache entry failed verification, ctime changed; cacheEntry = %@, current fsNode = %@";
    goto LABEL_22;
  }
LABEL_7:
  v19 = (void *)objc_opt_class();
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "containerRootURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifierForURL:", v21);
  v22 = objc_claimAutoreleasedReturnValue();

  if (v22
    && (objc_msgSend(v58, "MCM_isEqualToString:caseSensitive:", v22, objc_msgSend(v4, "isCaseSensitive")) & 1) == 0)
  {
    container_log_handle_for_category();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v78 = self;
      v79 = 2112;
      v80 = v22;
      _os_log_error_impl(&dword_1CF807000, v41, OS_LOG_TYPE_ERROR, "Cache entry failed verification, identifier doesn't match; cacheEntry = %@, current identifier = %@",
        buf,
        0x16u);
    }
    v26 = 0;
  }
  else
  {
    v23 = (void *)objc_opt_class();
    -[MCMContainerCacheEntry containerPath](self, "containerPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "containerRootURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "UUIDForURL:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    if (!v26
      || (-[MCMContainerCacheEntry uuid](self, "uuid"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = objc_msgSend(v27, "isEqual:", v26),
          v27,
          (v28 & 1) != 0))
    {
      v29 = (void *)objc_opt_class();
      -[MCMContainerCacheEntry containerPath](self, "containerPath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "containerRootURL");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "schemaVersionForURL:", v31);
      v32 = objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqual:", v32);

        if ((v34 & 1) == 0)
        {
          container_log_handle_for_category();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v78 = self;
            v79 = 2112;
            v80 = v32;
            _os_log_error_impl(&dword_1CF807000, v41, OS_LOG_TYPE_ERROR, "Cache entry failed verification, schemaVersion doesn't match; cacheEntry = %@, current schemaVersion = %@",
              buf,
              0x16u);
          }
          goto LABEL_30;
        }
      }
      -[MCMContainerCacheEntry containerPath](self, "containerPath");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "containerRootURL");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerCacheEntry containerPath](self, "containerPath");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "containerDataURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v52, "isEqual:", v36);

      if ((v51 & 1) == 0)
      {
        v61 = 0;
        -[MCMContainerCacheEntry containerPath](self, "containerPath");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "containerDataURL");
        v38 = objc_claimAutoreleasedReturnValue();
        v59 = 0;
        v60 = 0;
        v53 = objc_msgSend(v9, "itemAtURL:followSymlinks:exists:isDirectory:fsNode:error:", v38, 0, &v61, 0, &v60, &v59);
        v55 = v60;
        v39 = v59;
        v40 = (void *)v38;
        v41 = v39;

        if ((v53 & 1) == 0)
        {
          container_log_handle_for_category();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v78 = self;
            v79 = 2112;
            v80 = v41;
            v43 = "Cache entry failed verification, could not stat Data subdirectory; cacheEntry = %@, error = [%@]";
            goto LABEL_46;
          }
LABEL_41:

          goto LABEL_30;
        }
        if (v61
          && (!-[NSObject isDirectory](v55, "isDirectory")
           || -[NSObject isSymlink](v55, "isSymlink")))
        {
          container_log_handle_for_category();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v78 = self;
            v79 = 2112;
            v80 = v55;
            v43 = "Cache entry failed verification, Data subdirectory doesn't target expectation; cacheEntry = %@, node = %@";
LABEL_46:
            _os_log_error_impl(&dword_1CF807000, v42, OS_LOG_TYPE_ERROR, v43, buf, 0x16u);
            goto LABEL_41;
          }
          goto LABEL_41;
        }

      }
      -[MCMContainerCacheEntry setFsNode:](self, "setFsNode:", v68[5]);
      v48 = 1;
      goto LABEL_31;
    }
    container_log_handle_for_category();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v78 = self;
      v79 = 2112;
      v80 = v26;
      _os_log_error_impl(&dword_1CF807000, v41, OS_LOG_TYPE_ERROR, "Cache entry failed verification, UUID doesn't match; cacheEntry = %@, current uuid = %@",
        buf,
        0x16u);
    }
  }
  v32 = 0;
LABEL_30:

  -[MCMContainerCacheEntry setCorrupt:](self, "setCorrupt:", 1);
  v48 = 0;
LABEL_31:

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v73, 8);

  return v48;
}

- (MCMFSNode)fsNode
{
  return self->_fsNode;
}

- (id)containerIdentity
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v20[0] = 1;
  v3 = containermanager_copy_global_configuration();
  objc_msgSend(v3, "staticConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configForContainerClass:", objc_msgSend(v5, "containerClass"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMContainerCacheEntry uuid](self, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerPathIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry cache](self, "cache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "transient");
  -[MCMContainerCacheEntry userIdentityCache](self, "userIdentityCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v16) = v12;
  LOBYTE(v16) = v10 != 0;
  +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:](MCMConcreteContainerIdentityForLibsystem, "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v17, v6, v7, v18, 0, v9, v16, v13, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (MCMContainerPath)containerPath
{
  return self->_containerPath;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (MCMContainerCacheUpdatable)cache
{
  return (MCMContainerCacheUpdatable *)objc_loadWeakRetained((id *)&self->_cache);
}

- (id)metadataMinimal
{
  void *v3;
  MCMMetadataMinimal *v4;
  void *v5;
  void *v6;
  void *v7;
  MCMMetadataMinimal *v8;

  -[MCMContainerCacheEntry containerIdentity](self, "containerIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [MCMMetadataMinimal alloc];
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry userIdentityCache](self, "userIdentityCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MCMMetadataMinimal initWithContainerIdentity:containerPath:schemaVersion:userIdentityCache:](v4, "initWithContainerIdentity:containerPath:schemaVersion:userIdentityCache:", v3, v5, v6, v7);

  return v8;
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

uint64_t __32__MCMContainerCacheEntry_verify__block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id obj[2];

  obj[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v4 = *(_QWORD *)(a1[5] + 8) + 24;
  v5 = *(_QWORD *)(a1[6] + 8);
  obj[0] = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "itemAtURL:followSymlinks:exists:isDirectory:fsNode:error:", a2, 1, v4, 0, obj, a3);
  objc_storeStrong((id *)(v5 + 40), obj[0]);
  return v6;
}

- (void)setFsNode:(id)a3
{
  objc_storeStrong((id *)&self->_fsNode, a3);
}

+ (id)schemaVersionForURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_fileHandleForURL:writeable:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "schemaVersionForFileHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)schemaVersionForFileHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v3 = (void *)objc_msgSend(a3, "copyValueAsNumberFromXattr:error:", CFSTR("com.apple.containermanager.schema-version"), &v9);
  v4 = v9;
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Failed to get xattr schemaVersion; error = %@",
        buf,
        0xCu);
    }

  }
  return v3;
}

+ (id)UUIDForURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "_fileHandleForURL:writeable:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "UUIDForFileHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)UUIDForFileHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v3 = (void *)objc_msgSend(a3, "copyValueAsUUIDFromXattr:error:", CFSTR("com.apple.containermanager.uuid"), &v9);
  v4 = v9;
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Failed to get xattr uuid; error = %@", buf, 0xCu);
    }

  }
  return v3;
}

+ (id)identifierForFileHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v3 = (void *)objc_msgSend(a3, "copyValueAsStringFromXattr:maxLength:error:", CFSTR("com.apple.containermanager.identifier"), 1024, &v9);
  v4 = v9;
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Failed to get xattr identifier; error = %@",
        buf,
        0xCu);
    }

  }
  return v3;
}

- (BOOL)corrupt
{
  return self->_corrupt;
}

- (id)metadataWithError:(id *)a3
{
  os_unfair_lock_s *p_metadataLock;
  id v6;
  void *v7;
  void *v8;
  MCMMetadata *v9;
  MCMMetadata *metadata;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MCMMetadata *v17;
  MCMMetadata *v18;
  MCMMetadata *v19;
  void *v20;
  void *v21;
  id v23[2];

  v23[1] = *(id *)MEMORY[0x1E0C80C00];
  p_metadataLock = &self->_metadataLock;
  os_unfair_lock_lock(&self->_metadataLock);
  if (self->_metadata)
  {
    v6 = 0;
  }
  else
  {
    -[MCMContainerCacheEntry identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerCacheEntry containerPath](self, "containerPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = 0;
    -[MCMContainerCacheEntry _readMetadataForIdentifier:containerPath:error:](self, "_readMetadataForIdentifier:containerPath:error:", v7, v8, v23);
    v9 = (MCMMetadata *)objc_claimAutoreleasedReturnValue();
    v6 = v23[0];
    metadata = self->_metadata;
    self->_metadata = v9;

    if (!self->_metadata && objc_msgSend(v6, "type") == 108)
    {
      -[MCMContainerCacheEntry containerPath](self, "containerPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerCacheEntry containerIdentity](self, "containerIdentity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerCacheEntry containerIdentity](self, "containerIdentity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerCacheEntry userIdentityCache](self, "userIdentityCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerCacheEntry _metadataFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:](self, "_metadataFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:", v11, v13, v15, 0, v16);
      v17 = (MCMMetadata *)objc_claimAutoreleasedReturnValue();
      v18 = self->_metadata;
      self->_metadata = v17;

    }
  }
  v19 = self->_metadata;
  os_unfair_lock_unlock(p_metadataLock);
  if (a3 && !v19)
    *a3 = objc_retainAutorelease(v6);
  -[MCMContainerCacheEntry containerIdentity](self, "containerIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMetadataMinimal metadataByChangingContainerIdentity:](v19, "metadataByChangingContainerIdentity:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (MCMMetadata)metadata
{
  os_unfair_lock_s *p_metadataLock;
  MCMMetadata *v4;

  p_metadataLock = &self->_metadataLock;
  os_unfair_lock_lock(&self->_metadataLock);
  v4 = self->_metadata;
  os_unfair_lock_unlock(p_metadataLock);
  return v4;
}

- (MCMContainerCacheEntry)initWithMetadata:(id)a3 userIdentityCache:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MCMContainerCacheEntry *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EFBC2D68))
    v8 = v6;
  else
    v8 = 0;
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schemaVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MCMContainerCacheEntry initWithIdentifier:containerPath:schemaVersion:uuid:metadata:userIdentityCache:](self, "initWithIdentifier:containerPath:schemaVersion:uuid:metadata:userIdentityCache:", v9, v10, v11, v12, v8, v7);

  return v13;
}

- (MCMContainerCacheEntry)initWithIdentifier:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 uuid:(id)a6 metadata:(id)a7 userIdentityCache:(id)a8
{
  id v15;
  id v16;
  id v17;
  MCMContainerCacheEntry *v18;
  MCMContainerCacheEntry *v19;
  uint64_t v20;
  MCMFSNode *fsNode;
  uint64_t v22;
  MCMFileManagerResolvesPaths *fmForNode;
  id v25;
  id v26;
  id v27;
  objc_super v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v26 = a4;
  v25 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)MCMContainerCacheEntry;
  v18 = -[MCMContainerCacheEntry init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_metadataLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v18->_userIdentityCache, a8);
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v19->_containerPath, a4);
    objc_storeStrong((id *)&v19->_schemaVersion, a5);
    objc_storeStrong((id *)&v19->_uuid, a6);
    objc_storeStrong((id *)&v19->_metadata, a7);
    objc_msgSend(v16, "fsNode", v25, v26, v27);
    v20 = objc_claimAutoreleasedReturnValue();
    fsNode = v19->_fsNode;
    v19->_fsNode = (MCMFSNode *)v20;

    objc_storeWeak((id *)&v19->_cache, 0);
    *(_WORD *)&v19->_corrupt = 0;
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v22 = objc_claimAutoreleasedReturnValue();
    fmForNode = v19->_fmForNode;
    v19->_fmForNode = (MCMFileManagerResolvesPaths *)v22;

  }
  return v19;
}

- (id)initFromContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7
{
  id v12;
  void *v13;
  MCMContainerCacheEntry *v14;

  v12 = a7;
  -[MCMContainerCacheEntry _metadataFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:](self, "_metadataFromContainerPath:identifier:uuid:schemaVersion:userIdentityCache:", a3, a4, a5, a6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = -[MCMContainerCacheEntry initWithMetadata:userIdentityCache:](self, "initWithMetadata:userIdentityCache:", v13, v12);
  }
  else
  {

    v14 = 0;
  }

  return v14;
}

- (id)fsNodeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerRootURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMContainerCacheEntry fmForNode](self, "fmForNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = 0;
  objc_msgSend(v7, "fsNodeOfURL:followSymlinks:error:", v6, 0, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11[0];

  if (a3 && !v8)
    *a3 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v9, v6, 127);

  return v8;
}

- (timespec)birthtimeWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  __darwin_time_t v15;
  uint64_t v16;
  id v17[2];
  timespec result;

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerRootURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = +[MCMContainerCacheEntry birthtimeForURL:](MCMContainerCacheEntry, "birthtimeForURL:", v6);
  if (v7 | v8)
  {
    v11 = v7;
    v13 = v8;
    v10 = 0;
    if (!a3)
      goto LABEL_14;
    goto LABEL_8;
  }
  v17[0] = 0;
  -[MCMContainerCacheEntry fsNodeWithError:](self, "fsNodeWithError:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17[0];
  if (v9)
  {
    v11 = objc_msgSend(v9, "birthtime");
    v13 = v12;
  }
  else
  {
    v13 = 0;
    v11 = 0;
  }

  if (a3)
  {
LABEL_8:
    if (v11)
      v14 = 0;
    else
      v14 = v13 == 0;
    if (v14)
      *a3 = objc_retainAutorelease(v10);
  }
LABEL_14:

  v15 = v11;
  v16 = v13;
  result.tv_nsec = v16;
  result.tv_sec = v15;
  return result;
}

- (void)setMetadata:(id)a3
{
  MCMMetadata *v4;
  MCMMetadata *metadata;

  v4 = (MCMMetadata *)a3;
  os_unfair_lock_lock(&self->_metadataLock);
  metadata = self->_metadata;
  self->_metadata = v4;

  os_unfair_lock_unlock(&self->_metadataLock);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  const char *v10;
  _BOOL4 v11;
  const char *v12;
  void *v13;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  -[MCMContainerCacheEntry identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry uuid](self, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry fsNode](self, "fsNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    v9 = "with";
  else
    v9 = "without";
  if (-[MCMContainerCacheEntry corrupt](self, "corrupt"))
    v10 = "|CORRUPT";
  else
    v10 = "";
  v11 = -[MCMContainerCacheEntry ignore](self, "ignore");
  v12 = "|IGNORED";
  if (!v11)
    v12 = "";
  objc_msgSend(v15, "stringWithFormat:", CFSTR("(%@|%@|%@|%@|%@|%s metadata%s%s)"), v3, v4, v5, v6, v7, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (id)fullDescription
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  _BOOL4 v12;
  const char *v13;
  void *v14;
  void *v16;
  void *v17;

  v17 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry fsNode](self, "fsNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry metadata](self, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MCMContainerCacheEntry corrupt](self, "corrupt"))
    v11 = ", CORRUPT";
  else
    v11 = "";
  v12 = -[MCMContainerCacheEntry ignore](self, "ignore");
  v13 = ", IGNORED";
  if (!v12)
    v13 = "";
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@: %p; identifier = %@, containerPath = %@, schemaVersion = %@, uuid = %@, fsNode = %@, metadata = %@%s%s>"),
    v16,
    self,
    v4,
    v5,
    v6,
    v7,
    v8,
    v10,
    v11,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[MCMContainerCacheEntry identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerRootURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7 ^ v4;
}

- (BOOL)isEqualToContainerCacheEntry:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[MCMContainerCacheEntry metadata](self, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 == 0) != (v7 != 0) && (!v6 || objc_msgSend(v6, "isEqual:", v7)))
    {
      -[MCMContainerCacheEntry fsNode](self, "fsNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(v5, "fsNode");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v12 = 0;
LABEL_30:

          goto LABEL_31;
        }
      }
      -[MCMContainerCacheEntry fsNode](self, "fsNode");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v5, "fsNode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        if (!v11)
          goto LABEL_22;
      }
      else if (v8)
      {

      }
      -[MCMContainerCacheEntry fsNode](self, "fsNode");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_18;
      v16 = (void *)v15;
      -[MCMContainerCacheEntry fsNode](self, "fsNode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fsNode");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (v19)
      {
LABEL_18:
        -[MCMContainerCacheEntry identifier](self, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v20))
        {
          -[MCMContainerCacheEntry containerPath](self, "containerPath");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "containerPath");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "isEqual:", v22)
            && (v23 = -[MCMContainerCacheEntry corrupt](self, "corrupt"),
                v23 == objc_msgSend(v5, "corrupt")))
          {
            -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
            v24 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "schemaVersion");
            v25 = objc_claimAutoreleasedReturnValue();
            v31 = (void *)v24;
            v26 = (void *)v24;
            v27 = (void *)v25;
            if (objc_msgSend(v26, "isEqualToNumber:", v25))
            {
              -[MCMContainerCacheEntry uuid](self, "uuid");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "uuid");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v30, "isEqual:", v29);

            }
            else
            {
              v12 = 0;
            }

          }
          else
          {
            v12 = 0;
          }

        }
        else
        {
          v12 = 0;
        }

        goto LABEL_30;
      }
    }
LABEL_22:
    v12 = 0;
LABEL_31:

    goto LABEL_32;
  }
  v12 = 0;
LABEL_32:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  MCMContainerCacheEntry *v4;
  BOOL v5;

  v4 = (MCMContainerCacheEntry *)a3;
  v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[MCMContainerCacheEntry isEqualToContainerCacheEntry:](self, "isEqualToContainerCacheEntry:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 8) = 0;
    objc_storeStrong((id *)(v4 + 80), self->_userIdentityCache);
    objc_storeStrong((id *)(v5 + 16), self->_identifier);
    objc_storeStrong((id *)(v5 + 24), self->_containerPath);
    objc_storeStrong((id *)(v5 + 40), self->_schemaVersion);
    objc_storeStrong((id *)(v5 + 48), self->_uuid);
    os_unfair_lock_lock(&self->_metadataLock);
    objc_storeStrong((id *)(v5 + 32), self->_metadata);
    os_unfair_lock_unlock(&self->_metadataLock);
    *(_BYTE *)(v5 + 12) = self->_corrupt;
    *(_BYTE *)(v5 + 13) = self->_ignore;
    objc_storeWeak((id *)(v5 + 64), 0);
    objc_storeStrong((id *)(v5 + 88), self->_fmForNode);
  }
  return (id)v5;
}

- (id)_readMetadataForIdentifier:(id)a3 containerPath:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  MCMMetadata *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(v7, "containerClassPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containerClass");
  objc_msgSend(v8, "userIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [MCMMetadata alloc];
  -[MCMContainerCacheEntry userIdentityCache](self, "userIdentityCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v13 = -[MCMMetadataMinimal initByReadingAndValidatingMetadataAtContainerPath:userIdentity:containerClass:userIdentityCache:error:](v11, "initByReadingAndValidatingMetadataAtContainerPath:userIdentity:containerClass:userIdentityCache:error:", v7, v10, v9, v12, &v17);
  v14 = v17;

  if (!v13)
  {
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = v14;
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Could not read metadata at [%@]: %@", buf, 0x16u);
    }

    if (a5)
      *a5 = objc_retainAutorelease(v14);
  }

  return v13;
}

- (id)_fabricateMetadataForContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char isKindOfClass;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  MCMMetadata *v26;
  BOOL v27;
  id v28;
  NSObject *p_super;
  void *v30;
  void *v31;
  id v32;
  uint64_t error_description;
  NSObject *v34;
  MCMMetadata *v35;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = objc_msgSend(v12, "containerClass");
  objc_msgSend(v12, "containerRootURL");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "containerPathIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userIdentity");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v19 = containermanager_copy_global_configuration();
  objc_msgSend(v19, "staticConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "configForContainerClass:", v17);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v50 = v46;
    v51 = 2112;
    v52 = (uint64_t)v13;
    v53 = 2112;
    v54 = (uint64_t)v14;
    v55 = 2112;
    v56 = v15;
    _os_log_impl(&dword_1CF807000, v21, OS_LOG_TYPE_DEFAULT, "Attempting to recover from corrupt metadata for [%@]; identifier = %@, uuid = %@, schemaVersion = %@",
      buf,
      0x2Au);
  }

  v42 = v16;
  if (!v13)
  {
    -[MCMContainerCacheEntry _identifierForContainerPath:](self, "_identifierForContainerPath:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v41 = v15;
      container_log_handle_for_category();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v46;
        _os_log_error_impl(&dword_1CF807000, p_super, OS_LOG_TYPE_ERROR, "Unable to recover from corrupt metadata for [%@], no identifier", buf, 0xCu);
      }
      v13 = 0;
      goto LABEL_25;
    }
  }
  if (v14)
  {
    if (v15)
      goto LABEL_7;
  }
  else
  {
    +[MCMContainerCacheEntry UUIDForURL:](MCMContainerCacheEntry, "UUIDForURL:", v46);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      v32 = v30;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v32;

    if (v15)
      goto LABEL_7;
  }
  +[MCMContainerCacheEntry schemaVersionForURL:](MCMContainerCacheEntry, "schemaVersionForURL:", v46);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v37;
  v39 = &unk_1E8CD69C0;
  if (v37)
    v39 = (void *)v37;
  v15 = v39;

LABEL_7:
  v48 = 1;
  BYTE1(v40) = isKindOfClass & 1;
  LOBYTE(v40) = 1;
  +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:](MCMConcreteContainerIdentityForLibsystem, "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v14, v44, v13, v43, 0, v45, v40, v16, &v48);
  v22 = objc_claimAutoreleasedReturnValue();
  v41 = v15;
  if (!v22)
  {
    container_log_handle_for_category();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      error_description = container_get_error_description();
      *(_DWORD *)buf = 138412546;
      v50 = v46;
      v51 = 2080;
      v52 = error_description;
      _os_log_error_impl(&dword_1CF807000, p_super, OS_LOG_TYPE_ERROR, "Unable to generate identity for [%@]: error = %s", buf, 0x16u);
    }
LABEL_25:
    v23 = 0;
    v25 = 0;
    v26 = 0;
    v28 = 0;
    v24 = v12;
    goto LABEL_26;
  }
  v23 = (void *)v22;
  +[MCMContainerPath containerPathForContainerIdentity:containerPathIdentifier:](MCMContainerPath, "containerPathForContainerIdentity:containerPathIdentifier:", v22, v45);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[MCMContainerCacheEntry _findUserManagedAssetsDirectoryAtContainerRootURL:](self, "_findUserManagedAssetsDirectoryAtContainerRootURL:", v46);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[MCMMetadata initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:creator:userIdentityCache:]([MCMMetadata alloc], "initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:creator:userIdentityCache:", v23, 0, v24, v25, v41, 0xFFFFFFFFLL, 0, v42);
    v47 = 0;
    v27 = -[MCMMetadata writeMetadataToDiskWithError:](v26, "writeMetadataToDiskWithError:", &v47);
    v28 = v47;
    if (v27)
    {
      container_log_handle_for_category();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v50 = v45;
        v51 = 2112;
        v52 = (uint64_t)v13;
        v53 = 2048;
        v54 = v17;
        _os_log_impl(&dword_1CF807000, p_super, OS_LOG_TYPE_DEFAULT, "Fabricated metadata for [%@:%@(%llu)]", buf, 0x20u);
      }
    }
    else
    {
      container_log_handle_for_category();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v50 = v45;
        v51 = 2048;
        v52 = v17;
        v53 = 2112;
        v54 = (uint64_t)v28;
        _os_log_impl(&dword_1CF807000, v34, OS_LOG_TYPE_DEFAULT, "Unable to write generated metadata for [%@(%llu)]: error = %@", buf, 0x20u);
      }

      p_super = &v26->super.super;
      v26 = 0;
    }
  }
  else
  {
    container_log_handle_for_category();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v50 = v23;
      v51 = 2112;
      v52 = (uint64_t)v45;
      _os_log_error_impl(&dword_1CF807000, p_super, OS_LOG_TYPE_ERROR, "Could not construct containerPath; identity = %@, containerPathIdentifier = %@",
        buf,
        0x16u);
    }
    v25 = 0;
    v26 = 0;
    v28 = 0;
    v24 = 0;
  }
LABEL_26:

  v35 = v26;
  return v35;
}

- (id)_identifierForContainerPath:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "containerClass");
  objc_msgSend(v3, "containerRootURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerCacheEntry identifierForURL:](MCMContainerCacheEntry, "identifierForURL:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
    {
      objc_msgSend(v3, "containerPathIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMEntitlementBypassList sharedBypassList](MCMEntitlementBypassList, "sharedBypassList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v4 == 13)
      {
        v10 = objc_msgSend(v8, "systemGroupContainerIdIsWellknown:", v7);

        if ((v10 & 1) == 0)
        {
LABEL_5:
          v6 = 0;
LABEL_9:

          goto LABEL_10;
        }
      }
      else
      {
        v11 = objc_msgSend(v8, "systemContainerIdIsWellknown:", v7);

        if (!v11)
          goto LABEL_5;
      }
      v6 = v7;
      goto LABEL_9;
    }
    v6 = 0;
  }
LABEL_10:

  return v6;
}

- (id)_findUserManagedAssetsDirectoryAtContainerRootURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  void *v20;
  void *v21;
  id v22;
  __int16 v23;
  id v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v21 = v3;
  objc_msgSend(v4, "urlsForItemsInDirectoryAtURL:error:", v3, &v24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v24;

  if (!v5)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v20;
      v32 = 2112;
      v33 = v6;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Couldn't read container contents when reconstructing metadata; path = [%@], error = %@",
        buf,
        0x16u);

    }
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v12);

        objc_msgSend(v13, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple.UserManagedAssets.")))
        {
          v23 = 0;
          +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          v16 = objc_msgSend(v15, "itemAtURL:exists:isDirectory:error:", v13, &v23, (char *)&v23 + 1, &v22);
          v6 = v22;

          if ((v16 & 1) != 0)
          {
            if (HIBYTE(v23) && (_BYTE)v23)
              goto LABEL_22;
          }
          else
          {
            container_log_handle_for_category();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v21, "path");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v31 = v18;
              v32 = 2112;
              v33 = v6;
              _os_log_error_impl(&dword_1CF807000, v17, OS_LOG_TYPE_ERROR, "Couldn't stat container contents when reconstructing metadata; path = [%@], error = %@",
                buf,
                0x16u);

            }
          }
        }
        else
        {
          v6 = 0;
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    }
    while (v10);
  }
  v14 = 0;
LABEL_22:

  return v14;
}

- (id)_metadataFromContainerPath:(id)a3 identifier:(id)a4 uuid:(id)a5 schemaVersion:(id)a6 userIdentityCache:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  objc_msgSend(a3, "containerPathForRealPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerCacheEntry _fabricateMetadataForContainerPath:identifier:uuid:schemaVersion:userIdentityCache:](self, "_fabricateMetadataForContainerPath:identifier:uuid:schemaVersion:userIdentityCache:", v16, v15, v14, v13, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setContainerPath:(id)a3
{
  objc_storeStrong((id *)&self->_containerPath, a3);
}

- (void)setSchemaVersion:(id)a3
{
  objc_storeStrong((id *)&self->_schemaVersion, a3);
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setCorrupt:(BOOL)a3
{
  self->_corrupt = a3;
}

- (BOOL)ignore
{
  return self->_ignore;
}

- (void)setIgnore:(BOOL)a3
{
  self->_ignore = a3;
}

- (MCMContainerCacheEntry_Internal)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (void)setCache:(id)a3
{
  objc_storeWeak((id *)&self->_cache, a3);
}

- (MCMFileManagerResolvesPaths)fmForNode
{
  return self->_fmForNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmForNode, 0);
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_fsNode, 0);
  objc_destroyWeak((id *)&self->_cache);
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_containerPath, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setXattrs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_opt_class();
  -[MCMContainerCacheEntry containerPath](self, "containerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerRootURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_fileHandleForURL:writeable:", v5, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[MCMContainerCacheEntry setXattrsWithFileHandle:](self, "setXattrsWithFileHandle:", v6);
}

- (void)setXattrsWithFileHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[MCMContainerCacheEntry identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:forFileHandle:", v6, v4);

  v7 = (void *)objc_opt_class();
  -[MCMContainerCacheEntry uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUUID:forFileHandle:", v8, v4);

  v9 = (void *)objc_opt_class();
  -[MCMContainerCacheEntry schemaVersion](self, "schemaVersion");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSchemaVersion:forFileHandle:");

}

+ (timespec)birthtimeForURL:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __darwin_time_t v8;
  uint64_t v9;
  timespec result;

  objc_msgSend(a1, "_fileHandleForURL:writeable:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "birthtimeForFileHandle:", v4);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.tv_nsec = v9;
  result.tv_sec = v8;
  return result;
}

+ (timespec)birthtimeForFileHandle:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __darwin_time_t v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;
  timespec result;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v3 = (void *)objc_msgSend(a3, "copyValueAsStringFromXattr:maxLength:error:", CFSTR("com.apple.containermanager.birthtime"), 1024, &v16);
  v4 = v16;
  v5 = v4;
  if (v3)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7 || objc_msgSend(v7, "count") != 2)
    {
      v11 = 0;
      v10 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = atol((const char *)objc_msgSend(v9, "UTF8String"));

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = atol((const char *)-[NSObject UTF8String](v12, "UTF8String"));
  }
  else
  {
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "Failed to get xattr birthtime; error = %@",
        buf,
        0xCu);
    }
    v8 = 0;
    v11 = 0;
    v10 = 0;
  }

LABEL_14:
  v14 = v10;
  v15 = v11;
  result.tv_nsec = v15;
  result.tv_sec = v14;
  return result;
}

+ (void)setIdentifier:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "_fileHandleForURL:writeable:", a4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setIdentifier:forFileHandle:", v6);

}

+ (void)setIdentifier:(id)a3 forFileHandle:(id)a4
{
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v4 = objc_msgSend(a4, "setXattr:valueAsString:error:", CFSTR("com.apple.containermanager.identifier"), a3, &v8);
  v5 = v8;
  v6 = v5;
  if ((v4 & 1) == 0 && v5)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Failed to set xattr identifier; error = %@",
        buf,
        0xCu);
    }

  }
}

+ (void)setSchemaVersion:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "_fileHandleForURL:writeable:", a4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSchemaVersion:forFileHandle:", v6);

}

+ (void)setSchemaVersion:(id)a3 forFileHandle:(id)a4
{
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v4 = objc_msgSend(a4, "setXattr:valueAsNumber:error:", CFSTR("com.apple.containermanager.schema-version"), a3, &v8);
  v5 = v8;
  v6 = v5;
  if ((v4 & 1) == 0 && v5)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Failed to set xattr schemaVersion; error = %@",
        buf,
        0xCu);
    }

  }
}

+ (void)setUUID:(id)a3 forURL:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "_fileHandleForURL:writeable:", a4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setUUID:forFileHandle:", v6);

}

+ (void)setUUID:(id)a3 forFileHandle:(id)a4
{
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v4 = objc_msgSend(a4, "setXattr:valueAsUUID:error:", CFSTR("com.apple.containermanager.uuid"), a3, &v8);
  v5 = v8;
  v6 = v5;
  if ((v4 & 1) == 0 && v5)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Failed to set xattr uuid; error = %@", buf, 0xCu);
    }

  }
}

+ (void)setBirthtime:(timespec)a3 forURL:(id)a4
{
  uint64_t tv_nsec;
  __darwin_time_t tv_sec;
  id v7;

  tv_nsec = a3.tv_nsec;
  tv_sec = a3.tv_sec;
  objc_msgSend(a1, "_fileHandleForURL:writeable:", a4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBirthtime:forFileHandle:", tv_sec, tv_nsec);

}

+ (void)setBirthtime:(timespec)a3 forFileHandle:(id)a4
{
  uint64_t tv_nsec;
  __darwin_time_t tv_sec;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  tv_nsec = a3.tv_nsec;
  tv_sec = a3.tv_sec;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%ld.%09ld"), tv_sec, tv_nsec);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  LOBYTE(v6) = objc_msgSend(v7, "setXattr:valueAsString:error:", CFSTR("com.apple.containermanager.birthtime"), v8, &v12);

  v9 = v12;
  v10 = v9;
  if ((v6 & 1) == 0 && v9)
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, "Failed to set xattr birthtime; error = %@",
        buf,
        0xCu);
    }

  }
}

+ (void)clearAttributesForURL:(id)a3
{
  id v4;

  objc_msgSend(a1, "_fileHandleForURL:writeable:", a3, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clearAttributesForFileHandle:");

}

+ (void)clearAttributesForFileHandle:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  NSObject *v13;
  __int128 v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[7];

  v27[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v27[0] = CFSTR("com.apple.containermanager.identifier");
  v27[1] = CFSTR("com.apple.containermanager.schema-version");
  v27[2] = CFSTR("com.apple.containermanager.uuid");
  v27[3] = CFSTR("com.apple.containermanager.birthtime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v24;
    *(_QWORD *)&v6 = 138412802;
    v14 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9);
        v15 = 0;
        v11 = objc_msgSend(v3, "removeXattr:error:", v10, &v15, v14);
        v12 = v15;
        if ((v11 & 1) == 0)
        {
          container_log_handle_for_category();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            v17 = v10;
            v18 = 2112;
            v19 = v3;
            v20 = 2112;
            v21 = v12;
            _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Could not clear xattr [%@] from [%@]; error = %@",
              buf,
              0x20u);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v7);
  }

}

@end
