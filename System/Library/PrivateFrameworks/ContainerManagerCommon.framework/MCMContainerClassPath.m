@implementation MCMContainerClassPath

- (NSURL)classURL
{
  return self->_classURL;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (BOOL)isCaseSensitive
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  char *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_classURLCreated)
  {
    container_log_handle_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446210;
      v12 = "-[MCMContainerClassPath isCaseSensitive]";
      _os_log_fault_impl(&dword_1CF807000, v3, OS_LOG_TYPE_FAULT, "%{public}s called before createIfNecessaryWithError:, result may not be valid", buf, 0xCu);
    }

  }
  if (!self->_caseSensitiveDetermined)
  {
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerClassPath classURL](self, "classURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v6 = objc_msgSend(v4, "checkFileSystemAtURL:isCaseSensitive:canAtomicSwap:error:", v5, &self->_caseSensitive, 0, &v10);
    v7 = (char *)v10;

    if (v6)
    {
      self->_caseSensitiveDetermined = 1;
    }
    else
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Could not determine case sensitivity: %@", buf, 0xCu);
      }

    }
  }
  return self->_caseSensitive;
}

id __36__MCMContainerClassPath_description__block_invoke(uint64_t a1, int a2)
{
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BYTE *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  void *v19;
  void *v21;
  void *v22;

  v21 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "personaUniqueString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v9;
  if (a2)
  {
    objc_msgSend(v9, "redactedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "categoryComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "classComponent");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = *(_BYTE **)(a1 + 32);
  v16 = " created";
  v17 = "";
  if (!v15[12])
    v16 = "";
  if (v15[9])
  {
    if (v15[8])
      v17 = " case-sensitive";
    else
      v17 = " case-insensitive";
  }
  if (v15[11])
  {
    if (v15[10])
      v18 = " dp-enabled";
    else
      v18 = " dp-disabled";
  }
  else
  {
    v18 = "";
  }
  objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@: %p; persona [%@]; [%@]/[%@]/[%@]%s%s%s>"),
    v22,
    v5,
    v7,
    v11,
    v12,
    v13,
    v16,
    v17,
    v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  return v19;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  -[MCMContainerClassPath baseURL](self, "baseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MCMContainerClassPath categoryComponent](self, "categoryComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[MCMContainerClassPath classComponent](self, "classComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[MCMContainerClassPath userIdentity](self, "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");

  return v6 ^ v4 ^ v8 ^ v11;
}

- (NSString)classComponent
{
  return self->_classComponent;
}

- (NSString)categoryComponent
{
  return self->_categoryComponent;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (BOOL)isEqual:(id)a3
{
  MCMContainerClassPath *v4;
  MCMContainerClassPath *v5;
  BOOL v6;

  v4 = (MCMContainerClassPath *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MCMContainerClassPath isEqualToContainerClassPath:](self, "isEqualToContainerClassPath:", v5);

  return v6;
}

- (NSString)description
{
  MCMLazyDescription *v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v3 = [MCMLazyDescription alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__MCMContainerClassPath_description__block_invoke;
  v5[3] = &unk_1E8CB6800;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (BOOL)isEqualToContainerClassPath:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_baseURL, v4[4])
    && -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_categoryComponent, v4[10])
    && -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_classComponent, v4[11])
    && -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_categoryURL, v4[5])
    && -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_classURL, v4[6])
    && -[MCMContainerClassPath _obj1:isEqualToObj2:](self, "_obj1:isEqualToObj2:", self->_userIdentity, v4[8]);

  return v5;
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

+ (id)posixOwnerForContainerClass:(unint64_t)a3 user:(id)a4
{
  id v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  id v11;
  uint64_t v12;

  v5 = a4;
  if (a3 <= 0xE && ((1 << a3) & 0x412A) != 0)
  {
    v6 = containermanager_copy_global_configuration();
    v7 = objc_msgSend(v6, "isUnsupportedBundleContainerWithContainerClass:", a3);

    if ((v7 & 1) == 0)
    {
      v11 = containermanager_copy_global_configuration();
      objc_msgSend(v11, "bundleContainerOwner");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = (id)v12;

      goto LABEL_10;
    }
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0xC)
  {
    v8 = containermanager_copy_global_configuration();
    v9 = objc_msgSend(v8, "isUnsupportedSystemContainerWithContainerClass:", a3);

    if ((v9 & 1) == 0)
    {
      v11 = containermanager_copy_global_configuration();
      objc_msgSend(v11, "systemContainerOwner");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
  }
  v10 = v5;
LABEL_10:

  return v10;
}

- (BOOL)createIfNecessaryWithError:(id *)a3
{
  void *v6;
  uint64_t v7;
  void *v8;

  if (self->_classURLCreated)
    return 1;
  -[MCMContainerClassPath classURL](self, "classURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCMContainerClassPath posixMode](self, "posixMode");
  -[MCMContainerClassPath posixOwner](self, "posixOwner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_classURLCreated = -[MCMContainerClassPath _createURLIfNecessary:mode:owner:dataProtectionClass:error:](self, "_createURLIfNecessary:mode:owner:dataProtectionClass:error:", v6, v7, v8, 0xFFFFFFFFLL, a3);

  return self->_classURLCreated;
}

- (BOOL)supportsDataProtection
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  char *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!self->_classURLCreated)
  {
    container_log_handle_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446210;
      v12 = "-[MCMContainerClassPath supportsDataProtection]";
      _os_log_fault_impl(&dword_1CF807000, v3, OS_LOG_TYPE_FAULT, "%{public}s called before createIfNecessaryWithError:, result may not be valid", buf, 0xCu);
    }

  }
  if (!self->_supportsDataProtectionDetermined)
  {
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerClassPath classURL](self, "classURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v6 = objc_msgSend(v4, "checkFileSystemAtURL:supportsPerFileKeys:error:", v5, &self->_supportsDataProtection, &v10);
    v7 = (char *)v10;

    if (v6)
    {
      self->_supportsDataProtectionDetermined = 1;
    }
    else
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_error_impl(&dword_1CF807000, v8, OS_LOG_TYPE_ERROR, "Could not determine dp support: %@", buf, 0xCu);
      }

    }
  }
  return self->_supportsDataProtection;
}

- (BOOL)exists
{
  MCMContainerClassPath *v2;
  void *v3;
  void *v4;
  BOOL exists;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_classURLCreated)
  {
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMContainerClassPath classURL](v2, "classURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_exists = objc_msgSend(v3, "itemExistsAtURL:", v4);

  }
  exists = v2->_exists;
  objc_sync_exit(v2);

  return exists;
}

- (void)setExists:(BOOL)a3
{
  char v4;
  MCMContainerClassPath *v5;
  MCMContainerClassPath *obj;

  obj = self;
  objc_sync_enter(obj);
  if (a3)
  {
    v4 = 1;
    v5 = obj;
  }
  else
  {
    v4 = 0;
    v5 = obj;
    obj->_caseSensitiveDetermined = 0;
    obj->_supportsDataProtectionDetermined = 0;
  }
  v5->_exists = v4;
  v5->_classURLCreated = v4;
  objc_sync_exit(v5);

}

- (MCMContainerClassPath)initWithBaseURL:(id)a3 categoryComponent:(id)a4 classComponent:(id)a5 containerClass:(unint64_t)a6 POSIXOwner:(id)a7 POSIXMode:(unsigned __int16)a8 userIdentity:(id)a9
{
  id v16;
  MCMContainerClassPath *v17;
  MCMContainerClassPath *v18;
  MCMUserIdentity **p_userIdentity;
  id v20;
  int v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  id v25;
  int v26;
  void *homeDirectoryURL;
  id *p_categoryURL;
  NSString *categoryComponent;
  uint64_t v31;
  id v32;
  id *p_classURL;
  NSString *classComponent;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;
  uint8_t buf[4];
  unint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v40 = a4;
  v39 = a5;
  v38 = a7;
  v16 = a9;
  v42.receiver = self;
  v42.super_class = (Class)MCMContainerClassPath;
  v17 = -[MCMContainerClassPath init](&v42, sel_init);
  v18 = v17;
  if (v17)
  {
    p_userIdentity = &v17->_userIdentity;
    *(_WORD *)&v17->_classURLCreated = 0;
    *(_DWORD *)&v17->_caseSensitive = 0;
    objc_storeStrong((id *)&v17->_userIdentity, a9);
    objc_storeStrong((id *)&v18->_baseURL, a3);
    objc_storeStrong((id *)&v18->_categoryComponent, a4);
    objc_storeStrong((id *)&v18->_classComponent, a5);
    v18->_containerClass = a6;
    objc_storeStrong((id *)&v18->_posixOwner, a7);
    v18->_posixMode = a8;
    if (v18->_baseURL)
    {
      if (*p_userIdentity)
      {
        v20 = containermanager_copy_global_configuration();
        v21 = objc_msgSend(v20, "isUnsupportedBundleContainerWithContainerClass:", a6, v38, v39, v40, v41);

        if (v21)
        {
          container_log_handle_for_category();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349056;
            v44 = a6;
            v23 = "Attempted to create a class path with an unsupported bundle class: %{public}llu";
LABEL_23:
            _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
          }
        }
        else
        {
          v25 = containermanager_copy_global_configuration();
          v26 = objc_msgSend(v25, "isUnsupportedSystemContainerWithContainerClass:", a6);

          if (!v26)
          {
            p_categoryURL = (id *)&v18->_categoryURL;
            objc_storeStrong((id *)&v18->_categoryURL, v18->_baseURL);
            categoryComponent = v18->_categoryComponent;
            if (categoryComponent)
            {
              objc_msgSend(*p_categoryURL, "URLByAppendingPathComponent:isDirectory:", categoryComponent, 1);
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = *p_categoryURL;
              *p_categoryURL = (id)v31;

            }
            p_classURL = (id *)&v18->_classURL;
            objc_storeStrong((id *)&v18->_classURL, v18->_categoryURL);
            classComponent = v18->_classComponent;
            if (classComponent)
            {
              objc_msgSend(*p_classURL, "URLByAppendingPathComponent:isDirectory:", classComponent, 1);
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = *p_classURL;
              *p_classURL = (id)v35;

            }
            objc_msgSend(v16, "homeDirectoryURL");
            v37 = objc_claimAutoreleasedReturnValue();
            homeDirectoryURL = v18->_homeDirectoryURL;
            v18->_homeDirectoryURL = (NSURL *)v37;
            goto LABEL_15;
          }
          container_log_handle_for_category();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349056;
            v44 = a6;
            v23 = "Attempted to create a class path with an unsupported system class: %{public}llu";
            goto LABEL_23;
          }
        }
LABEL_14:

        homeDirectoryURL = v18;
        v18 = 0;
LABEL_15:

        goto LABEL_16;
      }
      container_log_handle_for_category();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v24 = "Attempted to create a class path with no userIdentity.";
    }
    else
    {
      container_log_handle_for_category();
      v22 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v24 = "Attempted to create a class path with no baseURL.";
    }
    _os_log_fault_impl(&dword_1CF807000, v22, OS_LOG_TYPE_FAULT, v24, buf, 2u);
    goto LABEL_14;
  }
LABEL_16:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 32), self->_baseURL);
    objc_storeStrong((id *)(v5 + 80), self->_categoryComponent);
    objc_storeStrong((id *)(v5 + 88), self->_classComponent);
    objc_storeStrong((id *)(v5 + 40), self->_categoryURL);
    objc_storeStrong((id *)(v5 + 48), self->_classURL);
    *(_QWORD *)(v5 + 72) = self->_containerClass;
    *(_BYTE *)(v5 + 8) = self->_caseSensitive;
    *(_BYTE *)(v5 + 10) = self->_supportsDataProtection;
    *(_BYTE *)(v5 + 24) = self->_exists;
    objc_storeStrong((id *)(v5 + 56), self->_posixOwner);
    *(_WORD *)(v5 + 26) = self->_posixMode;
    objc_storeStrong((id *)(v5 + 64), self->_userIdentity);
  }
  return (id)v5;
}

- (BOOL)_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  int v20;
  unsigned __int16 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a3;
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "libraryRepairForUserIdentity:", self->_userIdentity);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__MCMContainerClassPath__createURLIfNecessary_mode_owner_dataProtectionClass_error___block_invoke;
  v18[3] = &unk_1E8CB6618;
  v21 = a4;
  v18[4] = self;
  v19 = v12;
  v20 = a6;
  v16 = v12;
  LOBYTE(a7) = objc_msgSend(v15, "fixAndRetryIfPermissionsErrorWithURL:containerPath:containerIdentifier:error:duringBlock:", v13, 0, 0, a7, v18);

  return (char)a7;
}

- (NSURL)categoryURL
{
  return self->_categoryURL;
}

- (MCMPOSIXUser)posixOwner
{
  return self->_posixOwner;
}

- (unsigned)posixMode
{
  return self->_posixMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classComponent, 0);
  objc_storeStrong((id *)&self->_categoryComponent, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_posixOwner, 0);
  objc_storeStrong((id *)&self->_classURL, 0);
  objc_storeStrong((id *)&self->_categoryURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_homeDirectoryURL, 0);
}

uint64_t __84__MCMContainerClassPath__createURLIfNecessary_mode_owner_dataProtectionClass_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  v6 = objc_msgSend((id)objc_opt_class(), "_inLibraryRepairBlock_createURLIfNecessary:mode:owner:dataProtectionClass:exists:error:", v5, *(unsigned __int16 *)(a1 + 52), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), 0, a3);

  return v6;
}

+ (id)containerPathTypeClasses
{
  if (containerPathTypeClasses_onceToken != -1)
    dispatch_once(&containerPathTypeClasses_onceToken, &__block_literal_global_12223);
  return (id)containerPathTypeClasses_typeClasses;
}

+ (id)containerPathForContainerIdentity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containerClass");

  objc_msgSend(a1, "containerPathForUserIdentity:containerClass:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)containerPathForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_msgSend(a1, "_baseURLForUserIdentity:containerClass:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_categoryComponentForContainerClass:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_classComponentForContainerClass:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posixUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "posixOwnerForContainerClass:user:", a4, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBaseURL:categoryComponent:classComponent:containerClass:POSIXOwner:POSIXMode:userIdentity:", v7, v8, v9, a4, v11, objc_msgSend(a1, "_modeForContainerClass:", a4), v6);
  return v12;
}

+ (BOOL)_inLibraryRepairBlock_createURLIfNecessary:(id)a3 mode:(unsigned __int16)a4 owner:(id)a5 dataProtectionClass:(int)a6 exists:(BOOL *)a7 error:(id *)a8
{
  uint64_t v10;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  char v19;
  BOOL v20;
  NSObject *v21;
  void *v23;
  const char *v24;
  id v25;
  id v26;
  BOOL v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v10 = *(_QWORD *)&a6;
  v12 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v27 = 0;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v16 = objc_msgSend(v15, "itemAtURL:exists:error:", v13, &v27, &v26);
  v17 = v26;

  if ((v16 & 1) == 0)
  {
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    objc_msgSend(v13, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v29 = v23;
    v30 = 2112;
    v31 = v17;
    v24 = "Failed to determine if dir at [%@] exists: %@";
    goto LABEL_15;
  }
  if (!v27)
  {

    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v19 = objc_msgSend(v18, "createDirectoryAtURL:withIntermediateDirectories:mode:owner:dataProtectionClass:error:", v13, 1, v12, v14, v10, &v25);
    v17 = v25;

    if ((v19 & 1) == 0)
    {
      container_log_handle_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      objc_msgSend(v13, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v29 = v23;
      v30 = 2112;
      v31 = v17;
      v24 = "Failed to create dir at [%@]: %@";
LABEL_15:
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);

LABEL_8:
      if (a8)
      {
        v17 = objc_retainAutorelease(v17);
        v20 = 0;
        *a8 = v17;
      }
      else
      {
        v20 = 0;
      }
      goto LABEL_11;
    }
  }
  if (a7)
    *a7 = v27;
  v20 = 1;
LABEL_11:

  return v20;
}

+ (unsigned)_modeForContainerClass:(unint64_t)a3
{
  return 493;
}

+ (id)_categoryComponentForContainerClass:(unint64_t)a3
{
  if (a3 - 1 > 0xD)
    return 0;
  else
    return off_1E8CB6658[a3 - 1];
}

+ (id)_classComponentForContainerClass:(unint64_t)a3
{
  if (a3 - 1 > 0xD)
    return CFSTR("Unknown");
  else
    return off_1E8CB66C8[a3 - 1];
}

+ (id)_baseURLForUserIdentity:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "homeDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    container_log_handle_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315394;
      v9 = "+[MCMContainerClassPath _baseURLForUserIdentity:]";
      v10 = 2112;
      v11 = v3;
      _os_log_fault_impl(&dword_1CF807000, v5, OS_LOG_TYPE_FAULT, "%s: User identity has a nil home directory; userIdentity = %@",
        (uint8_t *)&v8,
        0x16u);
    }

  }
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Containers"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_baseURLForUserIdentity:(id)a3 containerClass:(unint64_t)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = containermanager_copy_global_configuration();
  v8 = objc_msgSend(v7, "isGlobalContainerClass:", a4);

  if (v8)
  {
    v9 = containermanager_copy_global_configuration();
    objc_msgSend(v9, "sharedContainersDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (v6)
  {
    objc_msgSend(a1, "_baseURLForUserIdentity:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    container_log_handle_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v13 = 134217984;
      v14 = a4;
      _os_log_fault_impl(&dword_1CF807000, v11, OS_LOG_TYPE_FAULT, "Container class [%llu] requires a user identity.", (uint8_t *)&v13, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

void __49__MCMContainerClassPath_containerPathTypeClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)containerPathTypeClasses_typeClasses;
  containerPathTypeClasses_typeClasses = v0;

}

@end
