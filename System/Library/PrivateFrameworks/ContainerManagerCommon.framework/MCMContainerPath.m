@implementation MCMContainerPath

- (unint64_t)containerClass
{
  void *v2;
  unint64_t v3;

  -[MCMContainerPath containerClassPath](self, "containerClassPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containerClass");

  return v3;
}

- (NSURL)containerRootURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MCMContainerPath containerClassPath](self, "containerClassPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerPath containerRootComponent](self, "containerRootComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (MCMContainerClassPath)containerClassPath
{
  return self->_containerClassPath;
}

- (NSString)containerRootComponent
{
  return self->_containerRootComponent;
}

- (NSString)containerPathIdentifier
{
  return self->_containerPathIdentifier;
}

- (MCMUserIdentity)userIdentity
{
  void *v2;
  void *v3;

  -[MCMContainerPath containerClassPath](self, "containerClassPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MCMUserIdentity *)v3;
}

- (BOOL)transient
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (NSURL)metadataURL
{
  void *v2;
  void *v3;

  -[MCMContainerPath containerRootURL](self, "containerRootURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR(".com.apple.mobile_container_manager.metadata.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)containerDataURL
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[MCMContainerPath containerRootURL](self, "containerRootURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerPath containerDataComponent](self, "containerDataComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCMContainerPath containerDataComponent](self, "containerDataComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", v5, 1);
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  return (NSURL *)v3;
}

- (NSString)containerDataComponent
{
  return self->_containerDataComponent;
}

- (BOOL)createIfNecessaryWithDataProtectionClass:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  _BOOL4 v15;
  BOOL v16;
  id v18;
  id v19;
  id v20;
  unsigned __int8 v21;
  uint64_t v22;

  v5 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  -[MCMContainerPath containerClassPath](self, "containerClassPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v8 = objc_msgSend(v7, "createIfNecessaryWithError:", &v20);
  v9 = v20;

  if (v8)
  {
    -[MCMContainerPath containerRootURL](self, "containerRootURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MCMContainerPath rootPOSIXMode](self, "rootPOSIXMode");
    -[MCMContainerPath rootPOSIXOwner](self, "rootPOSIXOwner");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v9;
    v13 = -[MCMContainerPath _createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:](self, "_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:", v10, v11, v12, v5, &v21, &v19);
    v14 = v19;

    if (v13)
    {
      v18 = v14;
      v15 = -[MCMContainerPath createDataURLIfNecessaryWithDataProtectionClass:error:](self, "createDataURLIfNecessaryWithDataProtectionClass:error:", v5, &v18);
      v9 = v18;

      if (v15)
      {
        -[MCMContainerPath setExists:](self, "setExists:", v21);
        v16 = 1;
        goto LABEL_9;
      }
    }
    else
    {
      v9 = v14;
    }
  }
  if (a4)
  {
    v9 = objc_retainAutorelease(v9);
    v16 = 0;
    *a4 = v9;
  }
  else
  {
    v16 = 0;
  }
LABEL_9:

  return v16;
}

- (BOOL)createDataURLIfNecessaryWithDataProtectionClass:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  char v9;
  id v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v16[2];

  v5 = *(_QWORD *)&a3;
  v16[1] = *(id *)MEMORY[0x1E0C80C00];
  -[MCMContainerPath containerRootURL](self, "containerRootURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerPath containerDataURL](self, "containerDataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
    v11 = 1;
  }
  else
  {
    -[MCMContainerPath containerDataURL](self, "containerDataURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MCMContainerPath dataPOSIXMode](self, "dataPOSIXMode");
    -[MCMContainerPath dataPOSIXOwner](self, "dataPOSIXOwner");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = 0;
    v11 = -[MCMContainerPath _createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:](self, "_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:", v12, v13, v14, v5, 0, v16);
    v10 = v16[0];

    if (a4 && !v11)
    {
      v10 = objc_retainAutorelease(v10);
      v11 = 0;
      *a4 = v10;
    }
  }

  return v11;
}

- (id)containerPathForRealPath
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerPath containerRootURL](self, "containerRootURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v3, "realPathForURL:isDirectory:error:", v4, 1, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;

  if (v5)
  {
    v7 = objc_alloc((Class)objc_opt_class());
    -[MCMContainerPath containerClassPath](self, "containerClassPath");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerPath containerDataComponent](self, "containerDataComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v7, "initWithContainerClassPath:containerPathIdentifier:containerRootComponent:containerDataComponent:", v8, v9, v10, v11);

  }
  else
  {
    container_log_handle_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(0, "containerRootURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v6;
      _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Could not get realpath for [%@]; error = %@",
        buf,
        0x16u);

    }
    v12 = 0;
  }

  return v12;
}

- (NSURL)baseURL
{
  void *v2;
  void *v3;

  -[MCMContainerPath containerClassPath](self, "containerClassPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)categoryURL
{
  void *v2;
  void *v3;

  -[MCMContainerPath containerClassPath](self, "containerClassPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)classURL
{
  void *v2;
  void *v3;

  -[MCMContainerPath containerClassPath](self, "containerClassPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "classURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (MCMContainerPath)initWithContainerClassPath:(id)a3 containerPathIdentifier:(id)a4 containerRootComponent:(id)a5 containerDataComponent:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MCMContainerPath *v15;
  MCMContainerPath *v16;
  uint64_t v17;
  id v18;
  int v19;
  uint64_t v20;
  MCMPOSIXUser *rootPOSIXOwner;
  uint64_t v22;
  MCMPOSIXUser *dataPOSIXOwner;
  void *v24;
  void *v25;
  uint64_t v26;
  MCMPOSIXUser *schemaPOSIXOwner;
  objc_super v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)MCMContainerPath;
  v15 = -[MCMContainerPath init](&v29, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_exists = 0;
    v17 = objc_msgSend(v11, "containerClass");
    objc_storeStrong((id *)&v16->_containerClassPath, a3);
    objc_storeStrong((id *)&v16->_containerPathIdentifier, a4);
    objc_storeStrong((id *)&v16->_containerRootComponent, a5);
    objc_storeStrong((id *)&v16->_containerDataComponent, a6);
    if (v16->_containerClassPath && v16->_containerRootComponent)
    {
      v16->_rootPOSIXMode = objc_msgSend(v11, "posixMode");
      v16->_dataPOSIXMode = objc_msgSend(v11, "posixMode");
      v16->_schemaPOSIXMode = 493;
      if ((v17 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
      {
        v18 = containermanager_copy_global_configuration();
        v19 = objc_msgSend(v18, "systemContainerMode");

        if (v19 == 1)
          v16->_schemaPOSIXMode = 0;
      }
      objc_msgSend(v11, "posixOwner");
      v20 = objc_claimAutoreleasedReturnValue();
      rootPOSIXOwner = v16->_rootPOSIXOwner;
      v16->_rootPOSIXOwner = (MCMPOSIXUser *)v20;

      objc_msgSend(v11, "posixOwner");
      v22 = objc_claimAutoreleasedReturnValue();
      dataPOSIXOwner = v16->_dataPOSIXOwner;
      v16->_dataPOSIXOwner = (MCMPOSIXUser *)v22;

      v24 = (void *)objc_opt_class();
      objc_msgSend(v11, "posixOwner");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_posixOwnerForContainerSubdirectories:user:", v17, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      schemaPOSIXOwner = v16->_schemaPOSIXOwner;
      v16->_schemaPOSIXOwner = (MCMPOSIXUser *)v26;

    }
    else
    {
      v25 = v16;
      v16 = 0;
    }

  }
  return v16;
}

- (NSString)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__MCMContainerPath_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = -[MCMContainerClassPath hash](self->_containerClassPath, "hash");
  v4 = -[NSString hash](self->_containerRootComponent, "hash");
  return v4 ^ v3 ^ -[NSString hash](self->_containerDataComponent, "hash");
}

- (BOOL)isEqualToContainerPath:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = -[MCMContainerPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_containerClassPath, v4[3])
    && -[MCMContainerPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_containerRootComponent, v4[7])
    && -[MCMContainerPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_containerDataComponent, v4[8]);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  MCMContainerPath *v4;
  BOOL v5;

  v4 = (MCMContainerPath *)a3;
  v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[MCMContainerPath isEqualToContainerPath:](self, "isEqualToContainerPath:", v4);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)(v5 + 24), self->_containerClassPath);
    v7 = -[NSString copyWithZone:](self->_containerRootComponent, "copyWithZone:", a3);
    v8 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v7;

    v9 = -[NSString copyWithZone:](self->_containerDataComponent, "copyWithZone:", a3);
    v10 = *(void **)(v6 + 64);
    *(_QWORD *)(v6 + 64) = v9;

    v11 = -[NSString copyWithZone:](self->_containerPathIdentifier, "copyWithZone:", a3);
    v12 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v11;

    *(_WORD *)(v6 + 10) = self->_rootPOSIXMode;
    *(_WORD *)(v6 + 12) = self->_dataPOSIXMode;
    *(_WORD *)(v6 + 14) = self->_schemaPOSIXMode;
    objc_storeStrong((id *)(v6 + 32), self->_rootPOSIXOwner);
    objc_storeStrong((id *)(v6 + 40), self->_dataPOSIXOwner);
    objc_storeStrong((id *)(v6 + 48), self->_schemaPOSIXOwner);
  }
  return (id)v6;
}

- (BOOL)isRandomized
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[MCMContainerPath containerPathIdentifier](self, "containerPathIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)_obj1:(id)a3 isEqualToObj2:(id)a4
{
  BOOL result;

  result = 0;
  if (a3 && a4)
    result = objc_msgSend(a3, "isEqual:", a4);
  if (!((unint64_t)a3 | (unint64_t)a4))
    return 1;
  return result;
}

- (BOOL)_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 exists:(BOOL *)a7 error:(id *)a8
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  char v21;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  int v27;
  unsigned __int16 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMContainerPath containerClassPath](self, "containerClassPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "userIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "libraryRepairForUserIdentity:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __86__MCMContainerPath__createURLIfNecessary_mode_owner_dataProtectionClass_exists_error___block_invoke;
  v24[3] = &unk_1E8CB6040;
  v24[4] = self;
  v28 = a4;
  v19 = v14;
  v27 = a6;
  v25 = v19;
  v26 = &v29;
  v20 = objc_msgSend(v18, "fixAndRetryIfPermissionsErrorWithURL:containerPath:containerIdentifier:error:duringBlock:", v13, self, 0, a8, v24);
  v21 = v20 ^ 1;
  if (!a7)
    v21 = 1;
  if ((v21 & 1) == 0)
    *a7 = *((_BYTE *)v30 + 24);

  _Block_object_dispose(&v29, 8);
  return v20;
}

- (MCMPOSIXUser)rootPOSIXOwner
{
  return self->_rootPOSIXOwner;
}

- (unsigned)rootPOSIXMode
{
  return self->_rootPOSIXMode;
}

- (MCMPOSIXUser)dataPOSIXOwner
{
  return self->_dataPOSIXOwner;
}

- (unsigned)dataPOSIXMode
{
  return self->_dataPOSIXMode;
}

- (MCMPOSIXUser)schemaPOSIXOwner
{
  return self->_schemaPOSIXOwner;
}

- (unsigned)schemaPOSIXMode
{
  return self->_schemaPOSIXMode;
}

- (BOOL)exists
{
  return self->_exists;
}

- (void)setExists:(BOOL)a3
{
  self->_exists = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerDataComponent, 0);
  objc_storeStrong((id *)&self->_containerRootComponent, 0);
  objc_storeStrong((id *)&self->_schemaPOSIXOwner, 0);
  objc_storeStrong((id *)&self->_dataPOSIXOwner, 0);
  objc_storeStrong((id *)&self->_rootPOSIXOwner, 0);
  objc_storeStrong((id *)&self->_containerClassPath, 0);
  objc_storeStrong((id *)&self->_containerPathIdentifier, 0);
}

uint64_t __86__MCMContainerPath__createURLIfNecessary_mode_owner_dataProtectionClass_exists_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "containerClassPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend((id)objc_opt_class(), "_inLibraryRepairBlock_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:", v6, *(unsigned __int16 *)(a1 + 60), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, a3);

  return v8;
}

id __31__MCMContainerPath_description__block_invoke(uint64_t a1, int a2)
{
  void *v2;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  void *v16;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "containerClassPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a2)
  {
    objc_msgSend(v9, "redactedDescription");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "containerRootComponent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "redactedDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "containerRootComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (uint64_t)v10;
  }
  objc_msgSend(*(id *)(a1 + 32), "containerDataComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 32), "exists");
  v15 = "";
  if (v14)
    v15 = " exists";
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p; [%@]/[%@]/[%@]%s>"), v7, v8, v11, v12, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {

    v12 = (void *)v11;
  }

  return v16;
}

+ (id)containerPathForContainerIdentity:(id)a3 containerPathIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "userIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containerClass");

  objc_msgSend(a1, "containerPathForUserIdentity:containerClass:containerPathIdentifier:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4 containerPathIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a3;
  v10 = containermanager_copy_global_configuration();
  objc_msgSend(v10, "staticConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "configForContainerClass:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = containermanager_copy_global_configuration();
  objc_msgSend(v13, "classPathCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerClassPathForUserIdentity:containerConfig:typeClass:", v9, v12, objc_msgSend(a1, "_containerClassPathClass"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "containerPathForContainerClassPath:containerPathIdentifier:", v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)containerPathForContainerClassPath:(id)a3 containerPathIdentifier:(id)a4
{
  id v5;
  id v6;
  int v7;
  objc_class *v8;
  const __CFString *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "containerClass");
  v7 = container_class_supports_data_subdirectory();
  v8 = (objc_class *)objc_opt_class();
  if ((objc_msgSend(v5, "isMemberOfClass:", +[MCMContainerStagingPath _containerClassPathClass](MCMContainerStagingPath, "_containerClassPathClass")) & 1) != 0|| objc_msgSend(v5, "isMemberOfClass:", +[MCMContainerTransientPath _containerClassPathClass](MCMContainerTransientPath, "_containerClassPathClass")))
  {
    v8 = (objc_class *)objc_opt_class();
  }
  if (v7)
    v9 = CFSTR("Data");
  else
    v9 = 0;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithContainerClassPath:containerPathIdentifier:containerRootComponent:containerDataComponent:", v5, v6, v6, v9);

  return v10;
}

+ (id)containerPathIdentifierForCodeSignIdentifier:(id)a3 containerClass:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fsSanitizedStringFromString:allowSpaces:", v5, a4 == 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)containerPathFromURL:(id)a3 containerClassPath:(id)a4 relativePath:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "classURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pathComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "pathComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v12, "count");
  if (v15 >= objc_msgSend(v14, "count"))
  {
    v20 = 0;
    v22 = 0;
  }
  else
  {
    v16 = objc_msgSend(v12, "count");
    v17 = objc_msgSend(v14, "count");
    v18 = v17 - v16;
    objc_msgSend(v14, "subarrayWithRange:", v16, v17 - v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "containerClass");
    if (container_class_supports_data_subdirectory())
      v21 = CFSTR("Data");
    else
      v21 = 0;
    v22 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContainerClassPath:containerPathIdentifier:containerRootComponent:containerDataComponent:", v8, v20, v20, v21);
    if (a5)
    {
      objc_msgSend(v19, "subarrayWithRange:", 1, v18 - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("/"));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v19;
    }
  }
  v23 = v22;

  return v23;
}

+ (Class)_containerClassPathClass
{
  return (Class)objc_opt_class();
}

+ (id)_posixOwnerForContainerSubdirectories:(unint64_t)a3 user:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v11;
  int v12;
  id v13;

  v5 = a4;
  v6 = v5;
  if (a3 > 0xE || ((1 << a3) & 0x412A) == 0)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
    {
      v11 = containermanager_copy_global_configuration();
      v12 = objc_msgSend(v11, "systemContainerMode");

      if (v12 != 1)
      {
        v7 = containermanager_copy_global_configuration();
        objc_msgSend(v7, "systemContainerOwner");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      +[MCMPOSIXUser nobody](MCMPOSIXUser, "nobody");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v5;
    }
    v9 = v13;
    goto LABEL_5;
  }
  v7 = containermanager_copy_global_configuration();
  objc_msgSend(v7, "bundleContainerOwner");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v9 = (void *)v8;

LABEL_5:
  return v9;
}

@end
