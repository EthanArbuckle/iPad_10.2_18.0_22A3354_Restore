@implementation MCMDeleteManifest

- (MCMDeleteManifest)initWithConcreteContainerIdentity:(id)a3 userIdentityCache:(id)a4
{
  id v7;
  id v8;
  MCMDeleteManifest *v9;
  MCMDeleteManifest *v10;
  NSURL *readURL;
  NSURL *writeURL;
  uint64_t v13;
  NSURL *v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MCMDeleteManifest;
  v9 = -[MCMDeleteManifest init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_concreteContainerIdentity, a3);
    objc_storeStrong((id *)&v10->_userIdentityCache, a4);
    readURL = v10->_readURL;
    v10->_readURL = 0;

    writeURL = v10->_writeURL;
    v10->_writeURL = 0;

    -[MCMDeleteManifest _urlForDeleteManifestWithContainerIdentity:](v10, "_urlForDeleteManifestWithContainerIdentity:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v10->_writeURL;
    v10->_writeURL = (NSURL *)v13;

  }
  return v10;
}

- (id)initFromURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  MCMError *v14;
  MCMDeleteManifest *v15;
  NSObject *v16;
  MCMDeleteManifest *v17;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "MCM_dictionaryWithContentsOfURL:options:error:", v9, 0, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;
  if (v11)
  {
    v20 = 0;
    +[MCMDeleteManifest _materializeContainerIdentityFromManifestPlist:userIdentityCache:error:](MCMDeleteManifest, "_materializeContainerIdentityFromManifestPlist:userIdentityCache:error:", v11, v10, &v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (MCMError *)v20;
    if (v13)
    {
      v15 = -[MCMDeleteManifest initWithConcreteContainerIdentity:userIdentityCache:](self, "initWithConcreteContainerIdentity:userIdentityCache:", v13, v10);
      objc_storeStrong((id *)&v15->_readURL, a3);
      goto LABEL_10;
    }
  }
  else
  {
    container_log_handle_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v12;
      v24 = 2112;
      v25 = v19;
      _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "Failed to parse delete manifest; error = %@, path = [%@]",
        buf,
        0x16u);

    }
    v14 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v12, v9, 123);
  }

  if (a5)
  {
    v14 = objc_retainAutorelease(v14);
    v15 = 0;
    v13 = 0;
    *a5 = v14;
  }
  else
  {
    v15 = 0;
    v13 = 0;
  }
LABEL_10:
  v17 = v15;

  return v17;
}

- (id)deleteManifestAfterWritingUsingLibraryRepairForUser:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  MCMError *v18;
  NSObject *v19;
  MCMError *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCMDeleteManifest concreteContainerIdentity](self, "concreteContainerIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "plist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = CFSTR("version");
  v33[1] = CFSTR("identity");
  v34[0] = &unk_1E8CD6258;
  v34[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMDeleteManifest writeURL](self, "writeURL");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "dataWritingOptionsForFileAtURL:", v11);

  -[MCMDeleteManifest writeURL](self, "writeURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __79__MCMDeleteManifest_deleteManifestAfterWritingUsingLibraryRepairForUser_error___block_invoke;
  v23[3] = &unk_1E8CB5B10;
  v14 = v9;
  v24 = v14;
  v25 = v12;
  LOBYTE(v11) = objc_msgSend(v6, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v13, &v26, v23);

  v15 = v26;
  if ((v11 & 1) != 0)
  {
    v16 = (void *)-[MCMDeleteManifest copy](self, "copy");
    -[MCMDeleteManifest writeURL](self, "writeURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setReadURL:", v17);
    v18 = 0;
  }
  else
  {
    container_log_handle_for_category();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[MCMDeleteManifest writeURL](self, "writeURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v15;
      v29 = 2112;
      v30 = v22;
      v31 = 2112;
      v32 = v14;
      _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Failed to write delete manifest; error = %@, url = [%@], manifest = %@",
        buf,
        0x20u);

    }
    v20 = [MCMError alloc];
    -[MCMDeleteManifest writeURL](self, "writeURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[MCMError initWithNSError:url:defaultErrorType:](v20, "initWithNSError:url:defaultErrorType:", v15, v17, 125);
    v16 = 0;
  }

  if (a4 && !v16)
    *a4 = objc_retainAutorelease(v18);

  return v16;
}

- (id)deleteManifestAfterRemovingUsingLibraryRepairForUser:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  MCMError *v11;
  void *v12;
  uint64_t v13;
  MCMDeleteManifest *v14;
  MCMError *v15;
  void *v16;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MCMDeleteManifest readURL](self, "readURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v18[0] = 0;
    v8 = objc_msgSend(v6, "fixAndRetryIfPermissionsErrorWithURL:error:duringBlock:", v7, v18, &__block_literal_global_6754);
    v9 = v18[0];
    v10 = v9;
    v11 = 0;
    if ((v8 & 1) != 0)
      goto LABEL_10;
    objc_msgSend(v9, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v13 = objc_msgSend(v10, "code");

      if (v13 == 2)
      {
        v11 = 0;
        goto LABEL_10;
      }
    }
    else
    {

    }
    v15 = [MCMError alloc];
    objc_msgSend(v7, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MCMError initWithErrorType:category:path:POSIXerrno:](v15, "initWithErrorType:category:path:POSIXerrno:", 122, 1, v16, objc_msgSend(v10, "code"));

LABEL_10:
    v14 = (MCMDeleteManifest *)-[MCMDeleteManifest copy](self, "copy");
    -[MCMDeleteManifest setReadURL:](v14, "setReadURL:", 0);
    if (!a4)
      goto LABEL_13;
    goto LABEL_11;
  }
  v14 = self;
  v10 = 0;
  v11 = 0;
  if (!a4)
    goto LABEL_13;
LABEL_11:
  if (!v14)
    *a4 = objc_retainAutorelease(v11);
LABEL_13:

  return v14;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MCMDeleteManifest readURL](self, "readURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMDeleteManifest writeURL](self, "writeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMDeleteManifest concreteContainerIdentity](self, "concreteContainerIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(from:[%@], to:[%@], %@)"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)fullDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMDeleteManifest readURL](self, "readURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMDeleteManifest writeURL](self, "writeURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMDeleteManifest concreteContainerIdentity](self, "concreteContainerIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; readURL = [%@], writeURL = [%@], concreteContainerIdentity = %@>"),
    v5,
    self,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[MCMDeleteManifest concreteContainerIdentity](self, "concreteContainerIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[MCMDeleteManifest readURL](self, "readURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[MCMDeleteManifest writeURL](self, "writeURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  return v6 ^ v4 ^ v8;
}

- (BOOL)isEqualToDeleteManifest:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MCMDeleteManifest readURL](self, "readURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "readURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        v7 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    -[MCMDeleteManifest readURL](self, "readURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

      if (v6)
      {

      }
LABEL_12:
      -[MCMDeleteManifest concreteContainerIdentity](self, "concreteContainerIdentity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "concreteContainerIdentity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToContainerIdentity:", v10))
      {
        -[MCMDeleteManifest readURL](self, "readURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "readURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          -[MCMDeleteManifest writeURL](self, "writeURL");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "writeURL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v13, "isEqual:", v14);

        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 0;
      }

      goto LABEL_19;
    }
    objc_msgSend(v5, "readURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {

    }
    if (!v9)
      goto LABEL_12;
  }
  v7 = 0;
LABEL_20:

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  MCMDeleteManifest *v4;
  BOOL v5;

  v4 = (MCMDeleteManifest *)a3;
  v5 = self == v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[MCMDeleteManifest isEqualToDeleteManifest:](self, "isEqualToDeleteManifest:", v4);
  }

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
    objc_storeStrong((id *)(v4 + 32), self->_userIdentityCache);
    objc_storeStrong(v5 + 2, self->_readURL);
    objc_storeStrong(v5 + 1, self->_writeURL);
    objc_storeStrong(v5 + 3, self->_concreteContainerIdentity);
  }
  return v5;
}

- (id)_urlForDeleteManifestWithContainerIdentity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v4 = a3;
  -[MCMDeleteManifest _stableFileNameForDeleteOperationPlistWithContainerIdentity:](self, "_stableFileNameForDeleteOperationPlistWithContainerIdentity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = containermanager_copy_global_configuration();
  objc_msgSend(v6, "managedPathRegistry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containermanagerDeleteOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = containermanager_copy_global_configuration();
  objc_msgSend(v4, "containerConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isGlobalContainerClass:", objc_msgSend(v10, "containerClass"));

  if ((v11 & 1) == 0)
  {
    -[MCMDeleteManifest userIdentityCache](self, "userIdentityCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "posixUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userIdentityForPersonalPersonaWithPOSIXUser:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MCMDeleteManifest userIdentityCache](self, "userIdentityCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "managedUserPathRegistryForUserIdentity:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "containermanagerUserDeleteOperations");
    v18 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v18;
  }
  objc_msgSend(v8, "url");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", v5, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_stableFileNameForDeleteOperationPlistWithContainerIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  _OWORD v20[4];
  char v21;
  unsigned __int8 md[16];
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "containerConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containerClass");
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "transient");
  objc_msgSend(v3, "userIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%llu-%@-%d-%@-%@"), v6, v7, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  *(_OWORD *)md = 0u;
  v23 = 0u;
  v13 = objc_retainAutorelease(v12);
  CC_SHA256((const void *)objc_msgSend(v13, "UTF8String"), objc_msgSend(v13, "length"), md);
  v14 = 0;
  v21 = 0;
  v15 = (char *)v20 + 1;
  memset(v20, 0, sizeof(v20));
  do
  {
    v16 = md[v14];
    *(v15 - 1) = _stableFileNameForDeleteOperationPlistWithContainerIdentity__hexLookup[v16 >> 4];
    *v15 = _stableFileNameForDeleteOperationPlistWithContainerIdentity__hexLookup[v16 & 0xF];
    v15 += 2;
    ++v14;
  }
  while (v14 != 32);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v20);
  objc_msgSend(v17, "stringByAppendingPathExtension:", CFSTR("plist"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSURL)writeURL
{
  return self->_writeURL;
}

- (NSURL)readURL
{
  return self->_readURL;
}

- (void)setReadURL:(id)a3
{
  objc_storeStrong((id *)&self->_readURL, a3);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
  objc_storeStrong((id *)&self->_concreteContainerIdentity, 0);
  objc_storeStrong((id *)&self->_readURL, 0);
  objc_storeStrong((id *)&self->_writeURL, 0);
}

uint64_t __80__MCMDeleteManifest_deleteManifestAfterRemovingUsingLibraryRepairForUser_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
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

uint64_t __79__MCMDeleteManifest_deleteManifestAfterWritingUsingLibraryRepairForUser_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "MCM_writeToURL:withOptions:error:", a2, *(_QWORD *)(a1 + 40), a3);
}

+ (id)managedPathForGlobalContainers
{
  id v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[8];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = containermanager_copy_global_configuration();
  v3 = objc_msgSend(v2, "handlesGlobalContainers");

  if (!v3)
  {
LABEL_6:
    v6 = 0;
    return v6;
  }
  v4 = containermanager_copy_global_configuration();
  objc_msgSend(v4, "managedPathRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containermanagerDeleteOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_fault_impl(&dword_1CF807000, v7, OS_LOG_TYPE_FAULT, "Failed to get global path for storing pending delete operations.", v9, 2u);
    }

    goto LABEL_6;
  }
  return v6;
}

+ (id)managedPathForUserContainersWithUserIdentityCache:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = containermanager_copy_global_configuration();
  objc_msgSend(v5, "defaultUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "managedPathForUserContainersWithUserIdentityCache:forPOSIXUser:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)managedPathForUserContainersWithUserIdentityCache:(id)a3 forPOSIXUser:(id)a4
{
  id v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = containermanager_copy_global_configuration();
  v8 = objc_msgSend(v7, "handlesUserContainers");

  if (v8)
  {
    objc_msgSend(v5, "userIdentityForPersonalPersonaWithPOSIXUser:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedUserPathRegistryForUserIdentity:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containermanagerUserDeleteOperations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      container_log_handle_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v14 = 138412290;
        v15 = v6;
        _os_log_fault_impl(&dword_1CF807000, v12, OS_LOG_TYPE_FAULT, "Failed to get user path for storing pending delete operations; posixUser = %@.",
          (uint8_t *)&v14,
          0xCu);
      }

    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)deleteManifestsForGlobalContainersWithUserIdentityCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "managedPathForGlobalContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_deleteManifestsForManagedPath:userIdentityCache:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)deleteManifestsForUserContainersWithUserIdentityCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "managedPathForUserContainersWithUserIdentityCache:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_deleteManifestsForManagedPath:userIdentityCache:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)deleteManifestsForUserContainersForPOSIXUser:(id)a3 userIdentityCache:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "managedPathForUserContainersWithUserIdentityCache:forPOSIXUser:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_deleteManifestsForManagedPath:userIdentityCache:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_materializeContainerIdentityFromManifestPlist:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  id v16[2];

  v16[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
    v13 = 0;
    if (!a5)
      goto LABEL_10;
    goto LABEL_8;
  }
  v10 = v8;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("version"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", &unk_1E8CD6258);

  if (v12)
  {
    v16[0] = 0;
    objc_msgSend(a1, "_materializeContainerIdentityFromManifestPlistV1:userIdentityCache:error:", v10, v9, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16[0];
  }
  else
  {
    v14 = 0;
    v13 = 0;
  }

  if (a5)
  {
LABEL_8:
    if (!v13)
      *a5 = objc_retainAutorelease(v14);
  }
LABEL_10:

  return v13;
}

+ (id)_materializeContainerIdentityFromManifestPlistV1:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  NSObject *v18;
  id v19;
  void *v20;
  MCMError *v21;
  MCMError *v22;
  MCMError *v23;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v25 = 1;
  v7 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("identity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMConcreteContainerIdentity concreteContainerIdentityFromPlist:userIdentityCache:error:](MCMConcreteContainerIdentity, "concreteContainerIdentityFromPlist:userIdentityCache:error:", v8, v7, &v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "containerConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containerClass");
    if (v11 > 0xE || ((1 << v11) & 0x4ED4) == 0)
    {

    }
    else
    {
      objc_msgSend(v9, "userIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "posixUser");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = containermanager_copy_global_configuration();
      objc_msgSend(v15, "defaultUser");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "isEqual:", v16);

      if ((v17 & 1) == 0)
      {
        container_log_handle_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = containermanager_copy_global_configuration();
          objc_msgSend(v19, "defaultUser");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v20;
          v28 = 2112;
          v29 = v9;
          _os_log_impl(&dword_1CF807000, v18, OS_LOG_TYPE_DEFAULT, "Ignoring delete manifest because it references a different uid; current user = %@, identity = %@",
            buf,
            0x16u);

        }
        v21 = -[MCMError initWithErrorType:]([MCMError alloc], "initWithErrorType:", 74);
        goto LABEL_14;
      }
    }
    v21 = 0;
    goto LABEL_14;
  }
  v22 = [MCMError alloc];
  v23 = -[MCMError initWithErrorType:](v22, "initWithErrorType:", v25);
  v21 = v23;
  if (a5)
  {
    v21 = objc_retainAutorelease(v23);
    *a5 = v21;
  }
LABEL_14:

  return v9;
}

+ (id)_deleteManifestsFromURL:(id)a3 userIdentityCache:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  MCMError *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v10, "urlsForItemsInDirectoryAtURL:error:", v8, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;

  if (v11)
  {
    objc_msgSend(a1, "_deleteManifestsFromFileURLs:userIdentityCache:", v11, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_msgSend(v12, "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {
    v16 = objc_msgSend(v12, "code");

    if (v16 == 2)
    {
      v13 = 0;
LABEL_3:
      v14 = 0;
      if (!a5)
        goto LABEL_14;
      goto LABEL_12;
    }
  }
  else
  {

  }
  container_log_handle_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v12;
    v23 = 2112;
    v24 = v19;
    _os_log_error_impl(&dword_1CF807000, v17, OS_LOG_TYPE_ERROR, "Failed to get items at delete operations URL; error = %@, path = [%@]",
      buf,
      0x16u);

  }
  v14 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v12, v8, 146);
  v13 = 0;
  if (a5)
  {
LABEL_12:
    if (!v13)
      *a5 = objc_retainAutorelease(v14);
  }
LABEL_14:

  return v13;
}

+ (id)_deleteManifestsFromFileURLs:(id)a3 userIdentityCache:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  MCMDeleteManifest *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v21;
  id obj;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = a4;
  v21 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v25)
  {
    v23 = *(_QWORD *)v33;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v6);
        v8 = [MCMDeleteManifest alloc];
        v26 = 0;
        v9 = -[MCMDeleteManifest initFromURL:userIdentityCache:error:](v8, "initFromURL:userIdentityCache:error:", v7, v24, &v26);
        v10 = v26;
        v11 = v10;
        if (v9)
        {
          objc_msgSend(v9, "concreteContainerIdentity");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = containermanager_copy_global_configuration();
          -[NSObject containerConfig](v12, "containerConfig");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containerClass");
          -[NSObject userIdentity](v12, "userIdentity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "posixUser");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v15) = objc_msgSend(v13, "dispositionForContainerClass:forUser:", v15, v17);

          if ((_DWORD)v15 == 1)
          {
            container_log_handle_for_category();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v28 = v7;
              v29 = 2112;
              v30 = v9;
              _os_log_impl(&dword_1CF807000, v18, OS_LOG_TYPE_DEFAULT, "Recovering from failed delete using [%@]; queuing deletion of %@",
                buf,
                0x16u);
            }

            objc_msgSend(v21, "addObject:", v9);
          }
        }
        else
        {
          if (objc_msgSend(v10, "type") == 74)
            goto LABEL_15;
          container_log_handle_for_category();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v28 = v11;
            v29 = 2112;
            v30 = v7;
            _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "Failed to materialize delete manifest; error = %@, url = [%@]",
              buf,
              0x16u);
          }
        }

LABEL_15:
        ++v6;
      }
      while (v25 != v6);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    }
    while (v25);
  }

  v19 = (void *)objc_msgSend(v21, "copy");
  return v19;
}

+ (id)_deleteManifestsForManagedPath:(id)a3 userIdentityCache:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (!v6
    || (objc_msgSend(v6, "url"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "_deleteManifestsFromURL:userIdentityCache:error:", v8, v7, 0),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

@end
