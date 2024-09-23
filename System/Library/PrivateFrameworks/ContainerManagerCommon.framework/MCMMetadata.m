@implementation MCMMetadata

- (NSString)userManagedAssetsDirName
{
  return self->_userManagedAssetsDirName;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)MCMMetadata;
  v4 = -[MCMMetadataMinimal copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 7, self->_userManagedAssetsDirName);
    objc_storeStrong(v5 + 6, self->_info);
    *((_DWORD *)v5 + 10) = self->_dataProtectionClass;
    objc_storeStrong(v5 + 8, self->_fsNode);
    objc_storeStrong(v5 + 10, self->_creator);
  }
  return v5;
}

- (void)_clearPersistedStatus
{
  MCMFSNode *fsNode;
  void *v4;
  NSURL *v5;
  NSURL *fileURL;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)MCMMetadata;
  -[MCMMetadataMinimal _clearPersistedStatus](&v7, sel__clearPersistedStatus);
  fsNode = self->_fsNode;
  self->_fsNode = 0;

  -[MCMMetadataMinimal containerPath](self, "containerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadataURL");
  v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
  fileURL = self->_fileURL;
  self->_fileURL = v5;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creator, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_fsNode, 0);
  objc_storeStrong((id *)&self->_userManagedAssetsDirName, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

- (MCMMetadata)initWithContainerIdentity:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 userIdentityCache:(id)a6
{
  return -[MCMMetadata initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNode:creator:userIdentityCache:](self, "initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNode:creator:userIdentityCache:", a3, MEMORY[0x1E0C9AA70], a4, 0, a5, 0xFFFFFFFFLL, 0, 0, a6, *MEMORY[0x1E0C80C00]);
}

- (MCMMetadata)initWithContainerIdentity:(id)a3 info:(id)a4 containerPath:(id)a5 userManagedAssetsDirName:(id)a6 schemaVersion:(id)a7 dataProtectionClass:(int)a8 creator:(id)a9 userIdentityCache:(id)a10
{
  return -[MCMMetadata initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNode:creator:userIdentityCache:](self, "initWithContainerIdentity:info:containerPath:userManagedAssetsDirName:schemaVersion:dataProtectionClass:fsNode:creator:userIdentityCache:", a3, a4, a5, a6, a7, *(_QWORD *)&a8, 0, a9, a10, *MEMORY[0x1E0C80C00]);
}

- (MCMMetadata)initWithContainerIdentity:(id)a3 info:(id)a4 containerPath:(id)a5 userManagedAssetsDirName:(id)a6 schemaVersion:(id)a7 dataProtectionClass:(int)a8 fsNode:(id)a9 creator:(id)a10 userIdentityCache:(id)a11
{
  id v17;
  id v18;
  MCMMetadata *v19;
  MCMMetadata *v20;
  uint64_t v21;
  NSURL *fileURL;
  id v25;
  id v26;
  id v27;
  objc_super v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v27 = a4;
  v17 = a5;
  v26 = a6;
  v25 = a9;
  v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)MCMMetadata;
  v19 = -[MCMMetadataMinimal initWithContainerIdentity:containerPath:schemaVersion:userIdentityCache:](&v28, sel_initWithContainerIdentity_containerPath_schemaVersion_userIdentityCache_, a3, v17, a7, a11);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_info, a4);
    objc_storeStrong((id *)&v20->_userManagedAssetsDirName, a6);
    v20->_dataProtectionClass = a8;
    objc_storeStrong((id *)&v20->_fsNode, a9);
    objc_storeStrong((id *)&v20->_creator, a10);
    objc_msgSend(v17, "metadataURL");
    v21 = objc_claimAutoreleasedReturnValue();
    fileURL = v20->_fileURL;
    v20->_fileURL = (NSURL *)v21;

  }
  return v20;
}

- (id)initByReadingAndValidatingMetadataAtFileURL:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 userIdentityCache:(id)a7 error:(id *)a8
{
  id v15;
  id *v16;
  id v17;
  void *v18;
  objc_super v20;
  id v21[2];

  v21[1] = *(id *)MEMORY[0x1E0C80C00];
  v15 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MCMMetadata;
  v21[0] = 0;
  v16 = -[MCMMetadataMinimal initByReadingAndValidatingMetadataAtFileURL:containerPath:userIdentity:containerClass:userIdentityCache:error:](&v20, sel_initByReadingAndValidatingMetadataAtFileURL_containerPath_userIdentity_containerClass_userIdentityCache_error_, v15, a4, a5, a6, a7, v21);
  v17 = v21[0];
  v18 = v17;
  if (v16)
  {
    objc_storeStrong(v16 + 9, a3);
  }
  else if (a8)
  {
    *a8 = objc_retainAutorelease(v17);
  }

  return v16;
}

- (BOOL)_initFromMetadataInDictionary:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 fsNode:(id)a7 fileURL:(id)a8 userIdentityCache:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSString *v21;
  NSString *userManagedAssetsDirName;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  NSString *creator;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  NSDictionary *v31;
  NSDictionary *info;
  NSDictionary *v33;
  NSDictionary *v34;
  NSDictionary *v35;
  MCMError *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSString *v40;
  const char *v41;
  void *v42;
  id v43;
  id v44;
  MCMError *v45;
  void *v46;
  NSString *v47;
  void *v48;
  int v49;
  BOOL v50;
  MCMError *v51;
  void *v52;
  NSDictionary *v53;
  objc_super v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v55.receiver = self;
  v55.super_class = (Class)MCMMetadata;
  v56 = 0;
  LODWORD(a5) = -[MCMMetadataMinimal _initFromMetadataInDictionary:containerPath:userIdentity:containerClass:fsNode:fileURL:userIdentityCache:error:](&v55, sel__initFromMetadataInDictionary_containerPath_userIdentity_containerClass_fsNode_fileURL_userIdentityCache_error_, v16, v17, a5, a6, v18, v19, a9, &v56);
  v20 = v56;
  if (!(_DWORD)a5)
    goto LABEL_33;
  objc_storeStrong((id *)&self->_fsNode, a7);
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("MCMMetadataUserManagedAssetsDirName"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  userManagedAssetsDirName = self->_userManagedAssetsDirName;
  self->_userManagedAssetsDirName = v21;

  v23 = self->_userManagedAssetsDirName;
  if (v23)
  {
    objc_opt_class();
    v24 = v23;
    v25 = (objc_opt_isKindOfClass() & 1) != 0 ? v24 : 0;

    if (!v25)
    {
      v36 = [MCMError alloc];
      objc_msgSend(v19, "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v36, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v37, 0);

      container_log_handle_for_category();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      v40 = self->_userManagedAssetsDirName;
      *(_DWORD *)buf = 138412290;
      v58 = v40;
      v41 = "Invalid metadata User Managed Dir Name String: %@";
LABEL_31:
      _os_log_error_impl(&dword_1CF807000, v39, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
      goto LABEL_32;
    }
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("MCMMetadataCreator"));
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  creator = self->_creator;
  self->_creator = v26;

  v28 = self->_creator;
  if (v28)
  {
    objc_opt_class();
    v29 = v28;
    v30 = (objc_opt_isKindOfClass() & 1) != 0 ? v29 : 0;

    if (!v30)
    {
      v45 = [MCMError alloc];
      objc_msgSend(v19, "path");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v45, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v46, 0);

      container_log_handle_for_category();
      v39 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      v47 = self->_creator;
      *(_DWORD *)buf = 138412290;
      v58 = v47;
      v41 = "Invalid metadata Creator String: %@";
      goto LABEL_31;
    }
  }
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("MCMMetadataInfo"));
  v31 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  info = self->_info;
  self->_info = v31;

  v33 = self->_info;
  if (v33)
  {
    objc_opt_class();
    v34 = v33;
    v35 = (objc_opt_isKindOfClass() & 1) != 0 ? v34 : 0;

    if (!v35)
    {
      v51 = [MCMError alloc];
      objc_msgSend(v19, "path");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v51, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v52, 0);

      container_log_handle_for_category();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v53 = self->_info;
        *(_DWORD *)buf = 138412290;
        v58 = v53;
        v41 = "Invalid metadata Info: %@";
        goto LABEL_31;
      }
LABEL_32:

      v20 = (id)v38;
LABEL_33:
      if (a10)
      {
        v20 = objc_retainAutorelease(v20);
        v50 = 0;
        *a10 = v20;
      }
      else
      {
        v50 = 0;
      }
      goto LABEL_36;
    }
  }
  self->_dataProtectionClass = -1;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("MCMMetadataActiveDPClass"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v43 = v42;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v44 = v43;
  else
    v44 = 0;

  if (v44)
  {
    self->_dataProtectionClass = objc_msgSend(v44, "intValue");

  }
  else
  {
    objc_msgSend(v17, "containerClassPath");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "supportsDataProtection");

    if (v49)
      self->_dataProtectionClass = 0;
  }
  v50 = 1;
LABEL_36:

  return v50;
}

- (BOOL)writeMetadataToDiskWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMetadata fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "dataWritingOptionsForFileAtURL:", v6);

  -[MCMMetadata fileURL](self, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[MCMMetadata writeMetadataToFileURL:options:error:](self, "writeMetadataToFileURL:options:error:", v8, v7, a3);

  return (char)a3;
}

- (BOOL)writeMetadataToFileURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  MCMMetadata *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v26;
  MCMMetadata *v27;
  BOOL v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  MCMFSNode *v33;
  NSObject *p_super;
  void *v35;
  int v36;
  MCMError *v37;
  void *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  BOOL v42;
  NSObject *v43;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = self;
  objc_sync_enter(v9);
  LOBYTE(self) = -[MCMMetadata _persisted](v9, "_persisted");
  objc_sync_exit(v9);

  if ((self & 1) != 0)
  {
    v10 = 0;
LABEL_24:
    v40 = 0;
    v42 = 1;
    goto LABEL_25;
  }
  v11 = (void *)MEMORY[0x1D17D7010]();
  v12 = (void *)objc_opt_new();
  -[MCMMetadata info](v9, "info");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MCMMetadata info](v9, "info");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v14, CFSTR("MCMMetadataInfo"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MCMMetadataMinimal containerClass](v9, "containerClass"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v15, CFSTR("MCMMetadataContentClass"));

  if (+[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", -[MCMMetadataMinimal containerClass](v9, "containerClass")))
  {
    -[MCMMetadataMinimal userIdentity](v9, "userIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "plist");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v17, CFSTR("MCMMetadataUserIdentity"));

  }
  -[MCMMetadataMinimal identifier](v9, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v18, CFSTR("MCMMetadataIdentifier"));

  -[MCMMetadataMinimal uuid](v9, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v20, CFSTR("MCMMetadataUUID"));

  objc_msgSend(v12, "setValue:forKey:", &unk_1E8CD5FE8, CFSTR("MCMMetadataVersion"));
  -[MCMMetadataMinimal schemaVersion](v9, "schemaVersion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v21, CFSTR("MCMMetadataSchemaVersion"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MCMMetadata dataProtectionClass](v9, "dataProtectionClass"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forKey:", v22, CFSTR("MCMMetadataActiveDPClass"));

  -[MCMMetadata userManagedAssetsDirName](v9, "userManagedAssetsDirName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[MCMMetadata userManagedAssetsDirName](v9, "userManagedAssetsDirName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v24, CFSTR("MCMMetadataUserManagedAssetsDirName"));

  }
  -[MCMMetadata creator](v9, "creator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[MCMMetadata creator](v9, "creator");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v26, CFSTR("MCMMetadataCreator"));

  }
  v27 = v9;
  objc_sync_enter(v27);
  v65 = 0;
  v28 = -[MCMMetadata _writeFileURL:dictionary:options:error:](v27, "_writeFileURL:dictionary:options:error:", v8, v12, a4, &v65);
  v29 = v65;
  v10 = v29;
  if (v28)
  {
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    objc_msgSend(v30, "fsNodeOfURL:followSymlinks:error:", v8, 0, &v64);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v64;

    if (v31)
    {
      v33 = v31;
      p_super = &v27->_fsNode->super;
      v27->_fsNode = v33;
    }
    else
    {
      container_log_handle_for_category();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        -[MCMMetadataMinimal uuid](v27, "uuid");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMMetadataMinimal containerPath](v27, "containerPath");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "containerPathIdentifier");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMMetadataMinimal identifier](v27, "identifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = -[MCMMetadataMinimal containerClass](v27, "containerClass");
        v55 = -[MCMMetadata conformsToProtocol:](v27, "conformsToProtocol:", &unk_1EFBC2D68);
        if (v55)
        {
          -[MCMMetadata fsNode](v27, "fsNode");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v51, "inode");
        }
        else
        {
          v49 = 0;
        }
        objc_msgSend(v8, "path");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v67 = v61;
        v68 = 2114;
        v69 = v59;
        v70 = 2112;
        v71 = v57;
        v72 = 2050;
        v73 = v53;
        v74 = 2048;
        v75 = v49;
        v76 = 2112;
        v77 = v50;
        v78 = 2114;
        v79 = v32;
        _os_log_error_impl(&dword_1CF807000, p_super, OS_LOG_TYPE_ERROR, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Could not fetch fsNode for [%@]: %{public}@", buf, 0x48u);

        if (v55)
      }
    }

    objc_sync_exit(v27);
    container_log_handle_for_category();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
    {
      -[MCMMetadataMinimal uuid](v27, "uuid");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMMetadataMinimal containerPath](v27, "containerPath");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "containerPathIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMMetadataMinimal identifier](v27, "identifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[MCMMetadataMinimal containerClass](v27, "containerClass");
      v58 = -[MCMMetadata conformsToProtocol:](v27, "conformsToProtocol:", &unk_1EFBC2D68);
      if (v58)
      {
        -[MCMMetadata fsNode](v27, "fsNode");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v51, "inode");
      }
      else
      {
        v46 = 0;
      }
      objc_msgSend(v8, "path");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMMetadata shortDescription](v27, "shortDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v67 = v60;
      v68 = 2114;
      v69 = v56;
      v70 = 2112;
      v71 = v54;
      v72 = 2050;
      v73 = v52;
      v74 = 2048;
      v75 = v46;
      v76 = 2112;
      v77 = v47;
      v78 = 2112;
      v79 = v48;
      _os_log_debug_impl(&dword_1CF807000, v43, OS_LOG_TYPE_DEBUG, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Wrote metadata to [%@]: %@", buf, 0x48u);

      if (v58)
    }

    objc_autoreleasePoolPop(v11);
    goto LABEL_24;
  }
  objc_msgSend(v29, "domain");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

  v37 = [MCMError alloc];
  objc_msgSend(v8, "path");
  if (v36)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v37, "initWithErrorType:category:path:POSIXerrno:", 127, 1, v38, objc_msgSend(v10, "code"));
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v37, "initWithErrorType:category:path:POSIXerrno:", 34, 5, v38, 0);
  }
  v40 = (id)v39;

  container_log_handle_for_category();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "path");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v67 = v45;
    v68 = 2112;
    v69 = v10;
    _os_log_error_impl(&dword_1CF807000, v41, OS_LOG_TYPE_ERROR, "Failed to write metadata dictionary to URL %@: %@", buf, 0x16u);

  }
  objc_sync_exit(v27);

  objc_autoreleasePoolPop(v11);
  if (a5)
  {
    v40 = objc_retainAutorelease(v40);
    v42 = 0;
    *a5 = v40;
  }
  else
  {
    v42 = 0;
  }
LABEL_25:

  return v42;
}

- (BOOL)verifyWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  MCMError *v14;
  NSObject *v15;
  void *v16;
  MCMError *v17;
  void *v18;
  int v19;
  MCMError *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  MCMError *v25;
  uint64_t v26;
  NSObject *v27;
  MCMError *v28;
  void *v29;
  BOOL v30;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[7];
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  -[MCMMetadataMinimal userIdentityCache](self, "userIdentityCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMetadataMinimal userIdentity](self, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryRepairForUserIdentity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__2879;
  v56 = __Block_byref_object_dispose__2880;
  v57 = 0;
  -[MCMMetadata fileURL](self, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMetadataMinimal containerPath](self, "containerPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMetadataMinimal identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __31__MCMMetadata_verifyWithError___block_invoke;
  v50[3] = &unk_1E8CB5308;
  v50[4] = &v62;
  v50[5] = &v58;
  v50[6] = &v52;
  v11 = objc_msgSend(v7, "fixAndRetryIfPermissionsErrorWithURL:containerPath:containerIdentifier:error:duringBlock:", v8, v9, v10, &v51, v50);
  v12 = v51;

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v12, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

    if (v19)
    {
      v20 = [MCMError alloc];
      -[MCMMetadata fileURL](self, "fileURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v20, "initWithErrorType:category:path:POSIXerrno:", 127, 1, v22, objc_msgSend(v12, "code"));

    }
    else
    {
      objc_msgSend(v12, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("MCMErrorDomain"));

      v25 = [MCMError alloc];
      if (v24)
        v26 = objc_msgSend(v12, "code");
      else
        v26 = 12;
      v17 = -[MCMError initWithErrorType:](v25, "initWithErrorType:", v26);
    }
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[MCMMetadata shortDescription](self, "shortDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v67 = v43;
      v68 = 2112;
      v69 = v12;
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Could not check existance of metadata for [%@]; error = %@",
        buf,
        0x16u);

    }
    goto LABEL_18;
  }
  if (!*((_BYTE *)v63 + 24))
  {
    container_log_handle_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      -[MCMMetadata fileURL](self, "fileURL");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "path");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v67 = v47;
      _os_log_error_impl(&dword_1CF807000, v27, OS_LOG_TYPE_ERROR, "Metadata failed verification, URL doesn't exist; URL = [%@]",
        buf,
        0xCu);

    }
    v28 = [MCMError alloc];
    -[MCMMetadata fileURL](self, "fileURL");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject path](v15, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v28, "initWithErrorType:category:path:POSIXerrno:", 127, 1, v29, 2);

    goto LABEL_18;
  }
  if (*((_BYTE *)v59 + 24))
  {
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[MCMMetadata fileURL](self, "fileURL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "path");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v67 = v45;
      _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Metadata failed verification, URL is a directory; URL = [%@]",
        buf,
        0xCu);

    }
    v14 = [MCMError alloc];
    -[MCMMetadata fileURL](self, "fileURL");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject path](v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v14, "initWithErrorType:category:path:POSIXerrno:", 127, 1, v16, 21);

    goto LABEL_18;
  }
  -[MCMMetadata fsNode](self, "fsNode");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
LABEL_26:
    objc_storeStrong((id *)&self->_fsNode, (id)v53[5]);
    v17 = 0;
    v30 = 1;
    goto LABEL_21;
  }
  -[MCMMetadata fsNode](self, "fsNode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqual:", v53[5]);

  if ((v34 & 1) != 0)
  {
    -[MCMMetadata fsNode](self, "fsNode");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "ctime");
    if (v36 == objc_msgSend((id)v53[5], "ctime"))
    {
      -[MCMMetadata fsNode](self, "fsNode");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "ctime");
      v39 = v38;
      objc_msgSend((id)v53[5], "ctime");
      LOBYTE(v39) = v39 == v40;

      if ((v39 & 1) != 0)
        goto LABEL_26;
    }
    else
    {

    }
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[MCMMetadata shortDescription](self, "shortDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (void *)v53[5];
      *(_DWORD *)buf = 138412546;
      v67 = v48;
      v68 = 2112;
      v69 = v49;
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Metadata failed verification, ctime changed; cacheEntry = %@, current fsNode = %@",
        buf,
        0x16u);

    }
  }
  else
  {
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[MCMMetadata shortDescription](self, "shortDescription");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)v53[5];
      *(_DWORD *)buf = 138412546;
      v67 = v41;
      v68 = 2112;
      v69 = v42;
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "Metadata failed verification, fs node changed; metadata = %@, current fsNode = %@",
        buf,
        0x16u);

    }
  }
  v17 = 0;
LABEL_18:

  if (a3)
  {
    v17 = objc_retainAutorelease(v17);
    v30 = 0;
    *a3 = v17;
  }
  else
  {
    v30 = 0;
  }
LABEL_21:

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  return v30;
}

- (id)metadataBySettingInfoValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  MCMMetadata *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  MCMMetadata *v16;
  uint64_t v17;
  NSDictionary *info;

  v6 = a3;
  v7 = a4;
  v8 = self;
  -[MCMMetadata info](v8, "info");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && (objc_msgSend(v11, "isEqual:", v6) & 1) != 0)
        goto LABEL_12;
      v13 = (void *)objc_msgSend(v10, "mutableCopy");

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "setValue:forKey:", v6, v7);
LABEL_11:
    v16 = (MCMMetadata *)-[MCMMetadata copy](v8, "copy");

    v17 = objc_msgSend(v13, "copy");
    info = v16->_info;
    v16->_info = (NSDictionary *)v17;

    -[MCMMetadata _clearPersistedStatus](v16, "_clearPersistedStatus");
    v12 = v13;
    v8 = v16;
LABEL_12:

    goto LABEL_13;
  }
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v13 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v13, "removeObjectForKey:", v7);

      goto LABEL_11;
    }
  }
LABEL_13:

  return v8;
}

- (container_object_s)createLibsystemContainerWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  container_object_s *v8;
  MCMError *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = 1;
  -[MCMMetadataMinimal containerIdentity](self, "containerIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMetadataMinimal containerPath](self, "containerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerPathIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (container_object_s *)objc_msgSend(v5, "createLibsystemContainerWithContainerPathIdentifier:existed:error:", v7, -[MCMMetadataMinimal existed](self, "existed"), v11);

  if (a3 && v11[0] != 1 && !v8)
  {
    v9 = [MCMError alloc];
    *a3 = -[MCMError initWithErrorType:](v9, "initWithErrorType:", v11[0]);
  }
  return v8;
}

- (id)metadataByChangingDataProtectionClass:(int)a3
{
  _DWORD *v4;

  v4 = (_DWORD *)-[MCMMetadata copy](self, "copy");
  v4[10] = a3;
  objc_msgSend(v4, "_clearPersistedStatus");
  return v4;
}

- (id)metadataBySettingUserManagedAssetsDirName:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[MCMMetadata copy](self, "copy");
  v6 = (void *)v5[7];
  v5[7] = v4;

  objc_msgSend(v5, "_clearPersistedStatus");
  return v5;
}

- (id)metadataBySettingCreator:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[MCMMetadata copy](self, "copy");
  v6 = (void *)v5[10];
  v5[10] = v4;

  objc_msgSend(v5, "_clearPersistedStatus");
  return v5;
}

- (NSString)debugDescription
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__MCMMetadata_debugDescription__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (NSString)shortDescription
{
  return -[MCMMetadata description](self, "description");
}

- (NSString)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__MCMMetadata_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (BOOL)_persisted
{
  void *v2;
  BOOL v3;

  -[MCMMetadata fsNode](self, "fsNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)_writeFileURL:(id)a3 dictionary:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  id v19;
  _QWORD v21[4];
  id v22;
  unint64_t v23;
  id v24[2];

  v24[1] = *(id *)MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  -[MCMMetadataMinimal userIdentityCache](self, "userIdentityCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMetadataMinimal userIdentity](self, "userIdentity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "libraryRepairForUserIdentity:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMMetadataMinimal containerPath](self, "containerPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMMetadataMinimal identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __54__MCMMetadata__writeFileURL_dictionary_options_error___block_invoke;
  v21[3] = &unk_1E8CB5B10;
  v17 = v10;
  v22 = v17;
  v23 = a5;
  v18 = objc_msgSend(v14, "fixAndRetryIfPermissionsErrorWithURL:containerPath:containerIdentifier:error:duringBlock:", v11, v15, v16, v24, v21);

  v19 = v24[0];
  if (a6 && (v18 & 1) == 0)
    *a6 = objc_retainAutorelease(v19);

  return v18;
}

- (NSDictionary)info
{
  return self->_info;
}

- (MCMFSNode)fsNode
{
  return self->_fsNode;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)creator
{
  return self->_creator;
}

uint64_t __54__MCMMetadata__writeFileURL_dictionary_options_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "MCM_writeToURL:withOptions:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

id __26__MCMMetadata_description__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v24 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4;
  if (a2)
  {
    objc_msgSend(v4, "redactedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = objc_msgSend(*(id *)(a1 + 32), "containerClass");
  v7 = objc_msgSend(*(id *)(a1 + 32), "transient");
  v8 = "";
  if (v7)
    v8 = "T";
  v22 = v8;
  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "shortDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = (uint64_t)v9;
  if (a2)
  {
    objc_msgSend(v9, "redactedDescription");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "containerPathIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(*(id *)(a1 + 32), "dataProtectionClass");
  objc_msgSend(*(id *)(a1 + 32), "userManagedAssetsDirName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v16, "redactedDescription");
    v18 = v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@(%llu%s);%@;u%@;p%@;dp%d;uma%@>"),
      v6,
      v23,
      v22,
      v11,
      v12,
      v14,
      v15,
      v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v18;
    v17 = v13;
    v14 = v12;
    v13 = (void *)v11;
    v12 = v10;
    v10 = v25;
  }
  else
  {
    objc_msgSend(v24, "stringWithFormat:", CFSTR("<%@(%llu%s);%@;u%@;p%@;dp%d;uma%@>"),
      v6,
      v23,
      v22,
      v11,
      v12,
      v14,
      v15,
      v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v25;
  }

  return v20;
}

id __31__MCMMetadata_debugDescription__block_invoke(uint64_t a1, int a2)
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;

  v28 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *(void **)(a1 + 32);
  objc_msgSend(v27, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = (uint64_t)v6;
  if (a2)
  {
    objc_msgSend(v6, "redactedDescription");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(*(id *)(a1 + 32), "containerClass");
  v10 = objc_msgSend(*(id *)(a1 + 32), "transient");
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v11, "redactedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "containerPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "redactedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v5;
    v16 = objc_msgSend(*(id *)(a1 + 32), "dataProtectionClass");
    objc_msgSend(*(id *)(a1 + 32), "userManagedAssetsDirName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "redactedDescription");
    v25 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v16;
    v5 = v15;
    objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@, dataProtectionClass = %d, userManagedAssetsDirName = %@>"),
      v15,
      v27,
      v8,
      v9,
      v26,
      v10,
      v13,
      v14,
      v23,
      v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v25;
    v20 = v12;
    v12 = v9;
    v9 = (void *)v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "containerPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(*(id *)(a1 + 32), "dataProtectionClass");
    objc_msgSend(*(id *)(a1 + 32), "userManagedAssetsDirName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@, dataProtectionClass = %d, userManagedAssetsDirName = %@>"),
      v5,
      v27,
      v8,
      v9,
      v26,
      v10,
      v12,
      v20,
      v21,
      v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

uint64_t __31__MCMMetadata_verifyWithError___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id obj[2];

  obj[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a2;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[4] + 8) + 24;
  v8 = *(_QWORD *)(a1[5] + 8) + 24;
  v9 = *(_QWORD *)(a1[6] + 8);
  obj[0] = *(id *)(v9 + 40);
  v10 = objc_msgSend(v6, "itemAtURL:followSymlinks:exists:isDirectory:fsNode:error:", v5, 1, v7, v8, obj, a3);

  objc_storeStrong((id *)(v9 + 40), obj[0]);
  return v10;
}

@end
