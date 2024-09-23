@implementation MCMMetadataMinimal

- (MCMMetadataMinimal)initWithContainerIdentity:(id)a3 containerPath:(id)a4 schemaVersion:(id)a5 userIdentityCache:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MCMMetadataMinimal *v15;
  MCMMetadataMinimal *v16;
  void *v17;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MCMMetadataMinimal;
  v15 = -[MCMMetadataMinimal init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_containerPath, a4);
    objc_storeStrong((id *)&v16->_containerIdentity, a3);
    if (v13)
      v17 = v13;
    else
      v17 = &unk_1E8CD6990;
    objc_storeStrong((id *)&v16->_schemaVersion, v17);
    objc_storeStrong((id *)&v16->_userIdentityCache, a6);
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_containerIdentity, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_containerPath, 0);
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

  if (a3 && !v8)
  {
    v9 = [MCMError alloc];
    *a3 = -[MCMError initWithErrorType:](v9, "initWithErrorType:", v11[0]);
  }
  return v8;
}

- (MCMContainerPath)containerPath
{
  return self->_containerPath;
}

- (BOOL)existed
{
  return -[MCMConcreteContainerIdentityForLibsystem existed](self->_containerIdentity, "existed");
}

- (MCMConcreteContainerIdentityForLibsystem)containerIdentity
{
  return self->_containerIdentity;
}

- (NSString)identifier
{
  return -[MCMContainerIdentityMinimal identifier](self->_containerIdentity, "identifier");
}

- (unint64_t)containerClass
{
  return -[MCMContainerIdentityMinimal containerClass](self->_containerIdentity, "containerClass");
}

- (MCMUserIdentity)userIdentity
{
  return -[MCMContainerIdentityMinimal userIdentity](self->_containerIdentity, "userIdentity");
}

- (NSUUID)uuid
{
  return -[MCMConcreteContainerIdentity uuid](self->_containerIdentity, "uuid");
}

- (id)metadataByChangingContainerIdentity:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[MCMMetadataMinimal copy](self, "copy");
  v6 = (void *)v5[3];
  v5[3] = v4;

  objc_msgSend(v5, "_clearPersistedStatus");
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_containerPath);
    objc_storeStrong(v5 + 2, self->_schemaVersion);
    objc_storeStrong(v5 + 3, self->_containerIdentity);
    objc_storeStrong(v5 + 4, self->_userIdentityCache);
  }
  return v5;
}

- (id)initByReadingAndValidatingMetadataAtContainerPath:(id)a3 userIdentity:(id)a4 containerClass:(unint64_t)a5 userIdentityCache:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v14, "metadataURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MCMMetadataMinimal initByReadingAndValidatingMetadataAtFileURL:containerPath:userIdentity:containerClass:userIdentityCache:error:](self, "initByReadingAndValidatingMetadataAtFileURL:containerPath:userIdentity:containerClass:userIdentityCache:error:", v15, v14, v13, a5, v12, a7);

  return v16;
}

- (id)initByReadingAndValidatingMetadataAtFileURL:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 userIdentityCache:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  MCMMetadataMinimal *v15;
  MCMError *v16;
  MCMError *v17;
  MCMError *v18;
  MCMError *v19;
  void *v20;
  _BOOL4 v21;
  MCMError *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v32;
  MCMError *v33;
  _BOOL4 v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  void *v38;
  int v39;
  MCMError *v40;
  void *v41;
  NSObject *v42;
  MCMMetadataMinimal *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  MCMError *v55;
  int v56;
  void *v57;
  void *v59;
  id v60;
  void *v61;
  MCMError *v62;
  _QWORD v63[6];
  id v64;
  objc_super v65;
  _QWORD v66[5];
  id v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint8_t buf[4];
  void *v75;
  __int16 v76;
  MCMError *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v60 = a4;
  v13 = a5;
  v14 = a7;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__2879;
  v72 = __Block_byref_object_dispose__2880;
  v73 = 0;
  objc_msgSend(v12, "URLByDeletingLastPathComponent");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__2879;
  v66[4] = __Block_byref_object_dispose__2880;
  v67 = 0;
  v65.receiver = self;
  v65.super_class = (Class)MCMMetadataMinimal;
  v15 = -[MCMMetadataMinimal init](&v65, sel_init);
  if (!v15)
  {
    v19 = 0;
    v17 = 0;
    goto LABEL_36;
  }
  objc_msgSend(v14, "libraryRepairForUserIdentity:", v13);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0;
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __132__MCMMetadataMinimal_initByReadingAndValidatingMetadataAtFileURL_containerPath_userIdentity_containerClass_userIdentityCache_error___block_invoke;
  v63[3] = &unk_1E8CB62A8;
  v63[4] = &v68;
  v63[5] = v66;
  objc_msgSend(v57, "fixAndRetryIfPermissionsErrorWithURL:containerRootURL:error:duringBlock:", v12, v61, &v64, v63);
  v16 = (MCMError *)v64;
  v17 = v16;
  if (v69[5])
  {
    v18 = 0;
    goto LABEL_26;
  }
  if (v16)
  {
    -[MCMError domain](v16, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isEqual:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
    {
      v21 = -[MCMError code](v17, "code") == 2048;

      if (v21)
      {
        v22 = [MCMError alloc];
        objc_msgSend(v12, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v22, "initWithErrorType:category:path:POSIXerrno:", 108, 5, v23, 0);

        container_log_handle_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "path");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v75 = v25;
          _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "Metadata file at [%{public}@] is corrupt.", buf, 0xCu);

        }
        goto LABEL_23;
      }
    }
    else
    {

    }
  }
  -[MCMError domain](v17, "domain");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x1E0CB2FE0];
  v28 = objc_msgSend(v26, "isEqual:", *MEMORY[0x1E0CB2FE0]);

  if (v28)
  {
    -[MCMError domain](v17, "domain");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "isEqualToString:", v27))
    {
      v30 = -[MCMError code](v17, "code") == 2;

      if (v30)
      {
LABEL_22:
        v33 = [MCMError alloc];
        objc_msgSend(v12, "path");
        v24 = objc_claimAutoreleasedReturnValue();
        v19 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v33, "initWithErrorType:category:path:POSIXerrno:", 127, 1, v24, -[MCMError code](v17, "code"));
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {

    }
    container_log_handle_for_category();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "path");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v75 = v48;
      v76 = 2112;
      v77 = v17;
      _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, "Could not read metadata file at [%{public}@]; error = %@",
        buf,
        0x16u);

    }
    goto LABEL_22;
  }
  container_log_handle_for_category();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v12, "path");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v75 = v47;
    v76 = 2112;
    v77 = v17;
    _os_log_error_impl(&dword_1CF807000, v31, OS_LOG_TYPE_ERROR, "Could not read metadata file at [%{public}@]; error = %@",
      buf,
      0x16u);

  }
  v19 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 12);
LABEL_24:
  if (v69[5])
  {
    v18 = v19;
LABEL_26:
    v62 = v18;
    v34 = -[MCMMetadataMinimal _initFromMetadataInDictionary:containerPath:userIdentity:containerClass:fsNode:fileURL:userIdentityCache:error:](v15, "_initFromMetadataInDictionary:containerPath:userIdentity:containerClass:fsNode:fileURL:userIdentityCache:error:", v14, &v62);
    v19 = v62;

    if (v34)
    {
      container_log_handle_for_category();
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG);

      if (v36)
      {
        container_log_handle_for_category();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          -[MCMMetadataMinimal uuid](v15, "uuid");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMMetadataMinimal containerPath](v15, "containerPath");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "containerPathIdentifier");
          v55 = (MCMError *)objc_claimAutoreleasedReturnValue();
          -[MCMMetadataMinimal identifier](v15, "identifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = -[MCMMetadataMinimal containerClass](v15, "containerClass");
          v56 = -[MCMMetadataMinimal conformsToProtocol:](v15, "conformsToProtocol:", &unk_1EFBC2D68);
          if (v56)
          {
            -[MCMMetadataMinimal fsNode](v15, "fsNode");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "inode");
          }
          else
          {
            v52 = 0;
          }
          objc_msgSend(v12, "path");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMMetadataMinimal shortDescription](v15, "shortDescription");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544898;
          v75 = v46;
          v76 = 2114;
          v77 = v55;
          v78 = 2112;
          v79 = v54;
          v80 = 2050;
          v81 = v53;
          v82 = 2048;
          v83 = v52;
          v84 = 2112;
          v85 = v49;
          v86 = 2112;
          v87 = v50;
          _os_log_debug_impl(&dword_1CF807000, v37, OS_LOG_TYPE_DEBUG, "[u %{public}@:p %{public}@:c %@(%{public}llu):i%llu] Read metadata from [%@]: %@", buf, 0x48u);

          if (v56)
        }

      }
      goto LABEL_44;
    }
    goto LABEL_35;
  }
  if (!v19)
  {
    -[MCMError domain](v17, "domain");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

    if (v39)
    {
      v40 = [MCMError alloc];
      objc_msgSend(v12, "path");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v40, "initWithErrorType:category:path:POSIXerrno:", 127, 1, v41, -[MCMError code](v17, "code"));

    }
    else
    {
      v19 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 108);
    }
  }
LABEL_35:

LABEL_36:
  if (-[MCMError category](v19, "category") != 1 || -[MCMError POSIXerrno](v19, "POSIXerrno") != 2)
  {
    container_log_handle_for_category();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "path");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v75 = v45;
      v76 = 2112;
      v77 = v19;
      _os_log_error_impl(&dword_1CF807000, v42, OS_LOG_TYPE_ERROR, "Failed to read container metadata [%@]: %@", buf, 0x16u);

    }
  }

  if (a8)
  {
    v19 = objc_retainAutorelease(v19);
    v15 = 0;
    *a8 = v19;
  }
  else
  {
    v15 = 0;
  }
LABEL_44:
  v43 = v15;
  _Block_object_dispose(v66, 8);

  _Block_object_dispose(&v68, 8);
  return v43;
}

- (BOOL)transient
{
  return -[MCMContainerIdentity transient](self->_containerIdentity, "transient");
}

- (unsigned)platform
{
  return -[MCMContainerIdentityMinimal platform](self->_containerIdentity, "platform");
}

- (id)metadataBySettingTransient:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v5 = (_QWORD *)-[MCMMetadataMinimal copy](self, "copy");
  -[MCMMetadataMinimal containerIdentity](self, "containerIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityByChangingTransient:", v3);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v5[3];
  v5[3] = v7;

  objc_msgSend(v5, "_clearPersistedStatus");
  return v5;
}

- (id)metadataByChangingContainerPath:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = (_QWORD *)-[MCMMetadataMinimal copy](self, "copy");
  v6 = (void *)v5[1];
  v5[1] = v4;
  v7 = v4;

  v8 = (void *)v5[3];
  objc_msgSend(v7, "containerPathIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identityByChangingContainerPathIdentifier:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v5[3];
  v5[3] = v10;

  objc_msgSend(v5, "_clearPersistedStatus");
  return v5;
}

- (id)metadataByChangingUUID:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = (_QWORD *)-[MCMMetadataMinimal copy](self, "copy");
  -[MCMMetadataMinimal containerIdentity](self, "containerIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityByChangingUUID:", v4);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v5[3];
  v5[3] = v7;

  objc_msgSend(v5, "_clearPersistedStatus");
  return v5;
}

- (id)metadataByChangingSchemaVersion:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[MCMMetadataMinimal copy](self, "copy");
  v6 = (void *)v5[2];
  v5[2] = v4;

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
  v5[2] = __38__MCMMetadataMinimal_debugDescription__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (NSString)shortDescription
{
  return -[MCMMetadataMinimal description](self, "description");
}

- (NSString)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__MCMMetadataMinimal_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (BOOL)_initFromMetadataInDictionary:(id)a3 containerPath:(id)a4 userIdentity:(id)a5 containerClass:(unint64_t)a6 fsNode:(id)a7 fileURL:(id)a8 userIdentityCache:(id)a9 error:(id *)a10
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  NSObject *v21;
  MCMError *v22;
  void *v23;
  MCMError *v24;
  NSObject *v25;
  MCMError *v26;
  void *v27;
  objc_class *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  MCMError *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  MCMError *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  MCMError *v52;
  void *v53;
  const char *v54;
  void *v55;
  uint64_t v56;
  NSObject *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  MCMError *v63;
  void *v64;
  NSObject *v65;
  MCMError *v66;
  void *v67;
  void *v68;
  MCMError *v69;
  void *v70;
  BOOL v71;
  void *v72;
  void *v73;
  uint64_t v75;
  objc_class *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  NSObject *v84;
  id v85;
  unsigned int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  MCMConcreteContainerIdentityForLibsystem *v91;
  MCMConcreteContainerIdentityForLibsystem *containerIdentity;
  void *v93;
  id v94;
  NSNumber *v95;
  MCMError *v96;
  void *v97;
  NSNumber *schemaVersion;
  id v99;
  void *v100;
  void *v101;
  NSObject *v102;
  MCMError *v103;
  void *v104;
  NSObject *v105;
  MCMError *v106;
  void *v107;
  int v108;
  void *v109;
  uint64_t v110;
  id v111;
  int v112;
  id v113;
  void *v114;
  int v115;
  id v116;
  id v117;
  void *v118;
  void *v119;
  void *v121;
  id v122;
  id v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint8_t buf[4];
  unint64_t v128;
  __int16 v129;
  _BYTE v130[18];
  __int16 v131;
  uint64_t v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v122 = a5;
  v16 = a8;
  v123 = a9;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataVersion"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_userIdentityCache, a9);
  objc_storeStrong((id *)&self->_containerPath, a4);
  v124 = v17;
  v121 = v16;
  if (v18)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v20 = (void *)MEMORY[0x1E0CB37E8];
    if ((isKindOfClass & 1) != 0)
    {
      v21 = v18;
      objc_msgSend(v20, "numberWithInteger:", -[NSObject integerValue](v21, "integerValue"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "integerValue") > 5)
      {
        v22 = [MCMError alloc];
        objc_msgSend(v16, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v22, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v23, 0);

        container_log_handle_for_category();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v76 = (objc_class *)objc_opt_class();
          NSStringFromClass(v76);
          v77 = v15;
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v128 = (unint64_t)v78;
          v129 = 2112;
          *(_QWORD *)v130 = v18;
          _os_log_error_impl(&dword_1CF807000, v25, OS_LOG_TYPE_ERROR, "Invalid metadata version: (%@) %@", buf, 0x16u);

          v15 = v77;
        }
        goto LABEL_6;
      }

      v17 = v124;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = [MCMError alloc];
        objc_msgSend(v16, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v26, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v27, 0);

        container_log_handle_for_category();
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_26;
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v25 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v128 = (unint64_t)v25;
        v129 = 2112;
        *(_QWORD *)v130 = v18;
        v29 = "Invalid metadata version: (%@) %@";
        v30 = v21;
        v31 = 22;
        goto LABEL_63;
      }
    }
  }
  else
  {
    v18 = &unk_1E8CD6000;
  }
  objc_opt_class();
  v32 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v33 = v32;
  else
    v33 = 0;

  if (!v33)
  {
    v37 = v15;
    v38 = [MCMError alloc];
    objc_msgSend(v16, "path");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v38, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v39, 0);

    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v128 = (unint64_t)v32;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Invalid metadata Identifier: %@", buf, 0xCu);
    }
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v15 = v37;
    goto LABEL_52;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataUUID"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v35 = v34;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v36 = v35;
  else
    v36 = 0;

  if (!v36)
  {
    v47 = [MCMError alloc];
    objc_msgSend(v16, "path");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v47, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v48, 0);

    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataUUID"));
    v25 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v128 = (unint64_t)v25;
    v29 = "Invalid metadata UUID String: %@";
    v30 = v21;
    v31 = 12;
LABEL_63:
    _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
LABEL_6:

LABEL_26:
    v40 = 0;
    v41 = 0;
    v42 = 0;
LABEL_52:

    if (a10)
    {
      v24 = objc_retainAutorelease(v24);
      v71 = 0;
      *a10 = v24;
    }
    else
    {
      v71 = 0;
    }
    v72 = v123;
    v73 = v124;
    goto LABEL_56;
  }
  v43 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataUUID"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v43, "initWithUUIDString:", v44);

  objc_opt_class();
  v42 = v45;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v46 = v42;
  else
    v46 = 0;

  if (!v46)
  {
    v52 = [MCMError alloc];
    objc_msgSend(v16, "path");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v52, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v53, 0);

    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_51:
      v40 = 0;
      v41 = 0;
      goto LABEL_52;
    }
    *(_DWORD *)buf = 138412290;
    v128 = (unint64_t)v42;
    v54 = "Invalid metadata UUID: %@";
LABEL_95:
    _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, v54, buf, 0xCu);
    goto LABEL_51;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataContentClass"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v50 = v49;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v51 = v50;
  else
    v51 = 0;

  if (!v51)
  {
    v66 = [MCMError alloc];
    objc_msgSend(v16, "path");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v66, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v67, 0);

    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataContentClass"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v128 = (unint64_t)v68;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Invalid metadata Class: %@", buf, 0xCu);

    }
    goto LABEL_51;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataContentClass"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "unsignedLongLongValue");

  if ((unint64_t)(v56 - 1) >= 0xE)
  {
    v69 = [MCMError alloc];
    objc_msgSend(v16, "path");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v69, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v70, 0);

    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_DWORD *)buf = 134217984;
    v128 = a6;
    v54 = "Invalid metadata Content Class: %ld";
    goto LABEL_95;
  }
  if (container_class_normalized() != a6)
  {
    container_log_handle_for_category();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v128 = (unint64_t)v32;
      v129 = 2050;
      *(_QWORD *)v130 = v56;
      *(_WORD *)&v130[8] = 2050;
      *(_QWORD *)&v130[10] = a6;
      _os_log_error_impl(&dword_1CF807000, v57, OS_LOG_TYPE_ERROR, "Container [%@] declares its class to be [%{public}llu] while scanning for class [%{public}llu]", buf, 0x20u);
    }

  }
  v58 = containermanager_copy_global_configuration();
  objc_msgSend(v58, "staticConfig");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "configForContainerClass:", a6);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = v15;
  if (objc_msgSend(v40, "personaAndUserSpecific"))
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataPersona"));
    v21 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "posixUser");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMContainerClassPath posixOwnerForContainerClass:user:](MCMContainerClassPath, "posixOwnerForContainerClass:user:", a6, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v118 = v61;
    if (a6 <= 0xB && ((1 << a6) & 0xED4) != 0)
    {
      if (v21)
      {
        v62 = objc_msgSend(v61, "UID");
        if (v62 != -[NSObject unsignedIntValue](v21, "unsignedIntValue"))
        {
          v63 = [MCMError alloc];
          objc_msgSend(v121, "path");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v63, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v64, 0);

          container_log_handle_for_category();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            v108 = objc_msgSend(v61, "UID");
            *(_DWORD *)buf = 138412802;
            v128 = (unint64_t)v21;
            v129 = 1024;
            *(_DWORD *)v130 = v108;
            *(_WORD *)&v130[4] = 2112;
            *(_QWORD *)&v130[6] = v32;
            _os_log_error_impl(&dword_1CF807000, v65, OS_LOG_TYPE_ERROR, "Incorrect UserId: %@, expecting: %u for %@", buf, 0x1Cu);
          }

          v41 = 0;
          goto LABEL_104;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v61, "UID"));
        v21 = objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataUserIdentity"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v79)
    {
      v86 = -[NSObject unsignedIntValue](v21, "unsignedIntValue");
      if (v86 == 499)
        v87 = 0;
      else
        v87 = v86;
      +[MCMPOSIXUser posixUserWithUID:](MCMPOSIXUser, "posixUserWithUID:", v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "userIdentityForPersonalPersonaWithPOSIXUser:", v88);
      v41 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_77;
    }
    v126 = 1;
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataUserIdentity"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMUserIdentity userIdentityWithPlist:cache:error:](MCMUserIdentity, "userIdentityWithPlist:cache:error:", v80, v123, &v126);
    v41 = (id)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
LABEL_67:
      if ((objc_msgSend(v41, "isEqual:", v122) & 1) == 0)
      {
        v81 = containermanager_copy_global_configuration();
        if (objc_msgSend(v81, "runmode") == 2)
        {
          v116 = containermanager_copy_global_configuration();
          objc_msgSend(v116, "currentUser");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = containermanager_copy_global_configuration();
          objc_msgSend(v111, "defaultUser");
          v114 = v81;
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = objc_msgSend(v82, "isEqual:", v83);

          if (v112)
          {
            container_log_handle_for_category();
            v84 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v128 = (unint64_t)v32;
              v129 = 2048;
              *(_QWORD *)v130 = a6;
              _os_log_impl(&dword_1CF807000, v84, OS_LOG_TYPE_DEFAULT, "User identity reconstructed from metadata for [%@(%llu)] doesn't match expected, assuming the current user identity.", buf, 0x16u);
            }

            v85 = v122;
            v41 = v85;
            goto LABEL_77;
          }
        }
        else
        {

        }
        v106 = [MCMError alloc];
        objc_msgSend(v121, "path");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v106, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v107, 0);

        container_log_handle_for_category();
        v105 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v128 = (unint64_t)v41;
          v129 = 2112;
          *(_QWORD *)v130 = v122;
          *(_WORD *)&v130[8] = 2112;
          *(_QWORD *)&v130[10] = v32;
          v131 = 2048;
          v132 = v126;
          _os_log_error_impl(&dword_1CF807000, v105, OS_LOG_TYPE_ERROR, "Incorrect User Identity: %@, expecting: %@ for %@: %llu", buf, 0x2Au);
        }
LABEL_103:

LABEL_104:
LABEL_105:
        v15 = v119;
        goto LABEL_52;
      }
LABEL_77:

      goto LABEL_80;
    }
    v99 = containermanager_copy_global_configuration();
    if (objc_msgSend(v99, "runmode") == 2)
    {
      v117 = containermanager_copy_global_configuration();
      objc_msgSend(v117, "currentUser");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v113 = containermanager_copy_global_configuration();
      objc_msgSend(v113, "defaultUser");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = objc_msgSend(v100, "isEqual:", v101);

      if (v115)
      {
        container_log_handle_for_category();
        v102 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v128 = (unint64_t)v32;
          v129 = 2048;
          *(_QWORD *)v130 = a6;
          _os_log_impl(&dword_1CF807000, v102, OS_LOG_TYPE_DEFAULT, "Could not reconstruct user identity from metadata for [%@(%llu)], assuming the current user identity.", buf, 0x16u);
        }

        v41 = v122;
        goto LABEL_67;
      }
    }
    else
    {

    }
    v103 = [MCMError alloc];
    objc_msgSend(v121, "path");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v103, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v104, 0);

    container_log_handle_for_category();
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataUserIdentity"));
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v128 = (unint64_t)v109;
      v129 = 2112;
      *(_QWORD *)v130 = v32;
      *(_WORD *)&v130[8] = 2048;
      *(_QWORD *)&v130[10] = v126;
      _os_log_error_impl(&dword_1CF807000, v105, OS_LOG_TYPE_ERROR, "Invalid metadata User Identity: %@ for %@: %llu", buf, 0x20u);

    }
    v41 = 0;
    goto LABEL_103;
  }
  if (objc_msgSend(v40, "usesGlobalBundleUserIdentity"))
  {
    objc_msgSend(v123, "globalBundleUserIdentity");
    v75 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v40, "usesGlobalSystemUserIdentity"))
      objc_msgSend(v123, "globalSystemUserIdentity");
    else
      objc_msgSend(v123, "defaultUserIdentity");
    v75 = objc_claimAutoreleasedReturnValue();
  }
  v41 = (id)v75;
LABEL_80:
  -[MCMContainerPath containerClassPath](self->_containerPath, "containerClassPath");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setExists:", 1);

  -[MCMContainerPath setExists:](self->_containerPath, "setExists:", 1);
  v125 = 1;
  LOBYTE(v89) = objc_msgSend(v119, "transient");
  objc_msgSend(v119, "containerPathIdentifier");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v110) = (_BYTE)v89;
  LOBYTE(v110) = 1;
  +[MCMConcreteContainerIdentityForLibsystem containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:](MCMConcreteContainerIdentityForLibsystem, "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:containerPathIdentifier:existed:transient:userIdentityCache:error:", v42, v41, v32, v40, 0, v90, v110, v123, &v125);
  v91 = (MCMConcreteContainerIdentityForLibsystem *)objc_claimAutoreleasedReturnValue();
  containerIdentity = self->_containerIdentity;
  self->_containerIdentity = v91;

  if (!self->_containerIdentity)
  {
    v96 = [MCMError alloc];
    objc_msgSend(v121, "path");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v96, "initWithErrorType:category:path:POSIXerrno:", 29, 5, v97, 0);

    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v128 = v125;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "Could not create container identity: %llu", buf, 0xCu);
    }
    goto LABEL_105;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MCMMetadataSchemaVersion"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v94 = v93;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v95 = (NSNumber *)v94;
  else
    v95 = 0;
  v72 = v123;
  v73 = v124;

  schemaVersion = self->_schemaVersion;
  self->_schemaVersion = v95;

  if (!self->_schemaVersion)
    self->_schemaVersion = (NSNumber *)&unk_1E8CD6000;
  v24 = 0;
  v71 = 1;
  v15 = v119;
LABEL_56:

  return v71;
}

- (BOOL)_persisted
{
  return 0;
}

- (NSNumber)schemaVersion
{
  return self->_schemaVersion;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

id __33__MCMMetadataMinimal_description__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4;
  if (a2)
  {
    objc_msgSend(v4, "redactedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v5;
  v7 = objc_msgSend(*(id *)(a1 + 32), "containerClass");
  if (objc_msgSend(*(id *)(a1 + 32), "transient"))
    v8 = "T";
  else
    v8 = "";
  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v10;
  if (a2)
  {
    objc_msgSend(v10, "redactedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerPathIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@(%llu%s);%@;u%@;p%@>"), v6, v7, v8, v12, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    v11 = v9;
  }
  else
  {
    v6 = v9;
  }

  return v16;
}

id __38__MCMMetadataMinimal_debugDescription__block_invoke(uint64_t a1, int a2)
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;

  v23 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "userIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = (uint64_t)v7;
  if (a2)
  {
    objc_msgSend(v7, "redactedDescription");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(*(id *)(a1 + 32), "containerClass");
  v12 = objc_msgSend(*(id *)(a1 + 32), "transient");
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v13, "redactedDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "containerPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "redactedDescription");
    v22 = v8;
    v17 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@>"),
      v17,
      v6,
      v9,
      v10,
      v11,
      v12,
      v15,
      v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v17;
    v8 = v22;

    v20 = v14;
    v14 = v10;
    v10 = (void *)v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "containerPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@: %p; userIdentity = %@, uuid = %@, containerClass = %llu, transient = %d, identifier = %@, containerPath = %@>"),
      v5,
      v6,
      v9,
      v10,
      v11,
      v12,
      v14,
      v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

BOOL __132__MCMMetadataMinimal_initByReadingAndValidatingMetadataAtFileURL_containerPath_userIdentity_containerClass_userIdentityCache_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj[2];

  obj[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj[0] = *(id *)(v4 + 40);
  objc_msgSend(MEMORY[0x1E0C99D80], "MCM_dictionaryWithContentsOfURL:options:fsNode:error:", a2, 0, obj, a3);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj[0]);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

@end
