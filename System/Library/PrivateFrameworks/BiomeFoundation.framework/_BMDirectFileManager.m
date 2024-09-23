@implementation _BMDirectFileManager

- (id)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  BMFileHandle *v28;
  void *v29;
  void *v30;
  const __CFString **v31;
  uint64_t *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  uint64_t v39;
  BMFileAttributes *v40;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  unsigned int v49;
  void *v50;
  int v51;
  id v52;
  uint64_t v53;
  const __CFString *v54;
  _QWORD v55[2];
  _QWORD v56[2];
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  const __CFString *v64;
  uint64_t v65;
  _QWORD v66[3];

  v7 = *(_QWORD *)&a5;
  v66[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (-[_BMDirectFileManager setUpWithError:](self, "setUpWithError:", a6))
  {
    if (objc_msgSend(v10, "length"))
    {
      bm_subpath(self->_directory, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (void *)v12;
      else
        v14 = v10;
      v15 = v14;

      if ((bm_validate_pathat(-[BMFileHandle fd](self->_directoryHandle, "fd"), v15) & 1) != 0)
      {
        if (v11)
        {
          if ((v7 + 1) < 9)
          {
            v16 = objc_msgSend(v15, "containsString:", CFSTR("/"));
            v17 = -[BMFileHandle fd](self->_directoryHandle, "fd");
            if (v16)
            {
              objc_msgSend(v15, "stringByDeletingLastPathComponent");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v17) = bm_openat_dprotected(v17, v18, 537920000, 0xFFFFFFFFLL);

              if ((v17 & 0x80000000) != 0)
              {
                __biome_log_for_category(2);
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  -[_BMDirectFileManager replaceFileAtPath:withData:protection:error:].cold.3();

                v43 = (void *)MEMORY[0x1E0CB35C8];
                v57 = *MEMORY[0x1E0CB2D50];
                v58 = CFSTR("Failed to open destination directory");
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v44);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                v25 = 0;
                v39 = 0xFFFFFFFFLL;
                if (!a6)
                  goto LABEL_43;
LABEL_41:
                if (v21)
                  *a6 = objc_retainAutorelease(v21);
LABEL_43:
                if ((v39 & 0x80000000) != 0)
                {
                  v28 = 0;
                }
                else
                {
                  v40 = -[BMFileAttributes initWithPath:mode:protectionClass:]([BMFileAttributes alloc], "initWithPath:mode:protectionClass:", v10, 2, BMDataProtectionClassFromOSProtectionClass(v7));
                  v28 = -[BMFileHandle initWithFileDescriptor:attributes:]([BMFileHandle alloc], "initWithFileDescriptor:attributes:", v39, v40);

                }
                goto LABEL_47;
              }
            }
            v51 = v17;
            v52 = 0;
            -[_BMDirectFileManager _openTemporaryDirectoryWithError:](self, "_openTemporaryDirectoryWithError:", &v52);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v52;
            v21 = v20;
            v47 = v19;
            if (v19)
            {
              v48 = objc_msgSend(v11, "fd");
              v22 = objc_msgSend(v19, "fd");
              objc_msgSend(v15, "lastPathComponent");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = bm_replace_file(v48, v22, v51, v23, v7);

              v49 = v24;
              if ((v24 & 0x80000000) == 0)
              {
                if ((_DWORD)v7 != -1)
                {
                  v25 = v47;
LABEL_36:
                  v38 = v51;
LABEL_37:
                  if ((v38 & 0x80000000) == 0 && v38 != -[BMFileHandle fd](self->_directoryHandle, "fd"))
                    close(v38);
                  v39 = v49;
                  if (!a6)
                    goto LABEL_43;
                  goto LABEL_41;
                }
                v45 = fcntl(v24, 63);
                v25 = v47;
                v38 = v51;
                if ((v45 & 0x80000000) == 0)
                {
                  LODWORD(v7) = v45;
                  goto LABEL_37;
                }
                if (*__error() == 45)
                {
                  LODWORD(v7) = -1;
                  goto LABEL_37;
                }
                __error();
                __biome_log_for_category(2);
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                  -[_BMDirectFileManager _fileHandleForFileAtPath:flags:protection:error:].cold.2();
                LODWORD(v7) = -1;
LABEL_35:

                goto LABEL_36;
              }
              __biome_log_for_category(2);
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                -[_BMDirectFileManager replaceFileAtPath:withFileHandle:protection:error:].cold.4();

              v46 = (void *)MEMORY[0x1E0CB35C8];
              v53 = *MEMORY[0x1E0CB2D50];
              v54 = CFSTR("Replace failed");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
              v35 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v35);
              v36 = objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v50 = (void *)MEMORY[0x1E0CB35C8];
              v34 = *MEMORY[0x1E0CB3388];
              v55[0] = *MEMORY[0x1E0CB2D50];
              v55[1] = v34;
              v56[0] = CFSTR("Failed to open temporary directory");
              v56[1] = v20;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
              v35 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v35);
              v36 = objc_claimAutoreleasedReturnValue();

              v49 = -1;
            }
            v21 = (void *)v36;
            v25 = v47;
            goto LABEL_35;
          }
          if (a6)
          {
            v29 = (void *)MEMORY[0x1E0CB35C8];
            v59 = *MEMORY[0x1E0CB2D50];
            v60 = CFSTR("Invalid protection class");
            v30 = (void *)MEMORY[0x1E0C99D80];
            v31 = &v60;
            v32 = &v59;
            goto LABEL_28;
          }
          goto LABEL_29;
        }
        __biome_log_for_category(2);
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[_BMDirectFileManager replaceFileAtPath:withFileHandle:protection:error:].cold.2();

        if (a6)
        {
          v29 = (void *)MEMORY[0x1E0CB35C8];
          v61 = *MEMORY[0x1E0CB2D50];
          v62 = CFSTR("Invalid file handle");
          v30 = (void *)MEMORY[0x1E0C99D80];
          v31 = &v62;
          v32 = &v61;
          goto LABEL_28;
        }
      }
      else if (a6)
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v63 = *MEMORY[0x1E0CB2D50];
        v64 = CFSTR("Invalid path");
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = &v64;
        v32 = &v63;
LABEL_28:
        objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", v31, v32, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v21);
        v28 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_47:

        goto LABEL_48;
      }
LABEL_29:
      v28 = 0;
      goto LABEL_48;
    }
    __biome_log_for_category(2);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a6)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v65 = *MEMORY[0x1E0CB2D50];
      v66[0] = CFSTR("Missing path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, &v65, 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v15);
      v28 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

      goto LABEL_49;
    }
  }
  v28 = 0;
LABEL_49:

  return v28;
}

- (id)_fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  BMFileHandle *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int *v25;
  void *v26;
  void *v27;
  BMFileAttributes *v28;
  void *v29;
  const __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  BMFileHandle *v36;
  void *v37;
  void *v39;
  uint64_t v40;
  const __CFString *v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _QWORD v47[2];

  v7 = *(_QWORD *)&a5;
  v47[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (-[_BMDirectFileManager setUpWithError:](self, "setUpWithError:", a6))
  {
    if (v10)
    {
      v11 = v10;
      bm_subpath(self->_directory, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11;
      if (!v12)
      {
        -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
      }
      v14 = bm_openat_dprotected(-[BMFileHandle fd](self->_directoryHandle, "fd"), v12, a4, v7);
      if ((v14 & 0x80000000) != 0)
      {
        if (!a6)
        {
          v20 = 0;
          goto LABEL_30;
        }
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v21 = *MEMORY[0x1E0CB2FE0];
        v22 = *__error();
        v23 = *MEMORY[0x1E0CB2D50];
        v44 = *MEMORY[0x1E0CB2D50];
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = __error();
        objc_msgSend(v24, "stringWithUTF8String:", strerror(*v25));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", v21, v22, v27);
        v28 = (BMFileAttributes *)objc_claimAutoreleasedReturnValue();

        v29 = (void *)MEMORY[0x1E0CB35C8];
        v30 = CFSTR("Create failed");
        if ((a4 & 0x200) == 0)
          v30 = CFSTR("Open failed");
        v31 = *MEMORY[0x1E0CB3388];
        v42[0] = v23;
        v42[1] = v31;
        v43[0] = v30;
        v43[1] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
      }
      else
      {
        v15 = v14;
        if ((_DWORD)v7 == -1)
        {
          LODWORD(v7) = fcntl(v14, 63);
          if ((v7 & 0x80000000) != 0)
          {
            if (*__error() != 45)
            {
              __error();
              __biome_log_for_category(2);
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                -[_BMDirectFileManager _fileHandleForFileAtPath:flags:protection:error:].cold.2();

            }
            LODWORD(v7) = -1;
          }
        }
        else if ((_DWORD)v7 == 4)
        {
          objc_msgSend(v11, "lastPathComponent");
          v7 = objc_claimAutoreleasedReturnValue();
          +[BMStoreDirectory lock](BMStoreDirectory, "lock");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend((id)v7, "isEqualToString:", v16);

          LODWORD(v7) = 4;
          if (v17)
            fcntl(v15, 64, 4);
        }
        v35 = BMDataProtectionClassFromOSProtectionClass(v7);
        v28 = -[BMFileAttributes initWithPath:mode:protectionClass:]([BMFileAttributes alloc], "initWithPath:mode:protectionClass:", v13, BMFileAccessModeFromOFlags(a4), v35);
        v36 = -[BMFileHandle initWithFileDescriptor:attributes:]([BMFileHandle alloc], "initWithFileDescriptor:attributes:", v15, v28);
        v20 = v36;
        if (!a6 || v36)
          goto LABEL_29;
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v40 = *MEMORY[0x1E0CB2D50];
        v41 = CFSTR("Unspecified failure");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *a6 = v33;

LABEL_29:
LABEL_30:

      goto LABEL_31;
    }
    __biome_log_for_category(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a6)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2D50];
      v47[0] = CFSTR("Invalid path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v46, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v13);
      v20 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

      goto LABEL_32;
    }
  }
  v20 = 0;
LABEL_32:

  return v20;
}

- (BOOL)setUpWithError:(id *)a3
{
  os_unfair_lock_s *p_setUpLock;
  uint64_t v6;
  BMFileAttributes *v7;
  BMFileHandle *v8;
  BMFileHandle *directoryHandle;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  p_setUpLock = &self->_setUpLock;
  os_unfair_lock_lock(&self->_setUpLock);
  if (self->_directoryHandle)
    goto LABEL_4;
  v6 = bm_openat_dprotected(4294967293, self->_directory, 1049344, 3);
  if ((v6 & 0x80000000) == 0)
  {
    v7 = -[BMFileAttributes initWithPath:mode:protectionClass:]([BMFileAttributes alloc], "initWithPath:mode:protectionClass:", self->_directory, 1, BMDataProtectionClassFromOSProtectionClass(3));
    v8 = -[BMFileHandle initWithFileDescriptor:attributes:]([BMFileHandle alloc], "initWithFileDescriptor:attributes:", v6, v7);
    directoryHandle = self->_directoryHandle;
    self->_directoryHandle = v8;

LABEL_4:
    LOBYTE(a3) = 1;
    goto LABEL_5;
  }
  if (a3)
  {
    v11 = *__error();
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", strerror(v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v11, v14);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a3) = 0;
  }
LABEL_5:
  os_unfair_lock_unlock(p_setUpLock);
  return (char)a3;
}

- (id)temporaryFileHandleWithProtection:(int)a3 error:(id *)a4
{
  return -[_BMDirectFileManager _temporaryFileHandleWithProtection:unlink:error:](self, "_temporaryFileHandleWithProtection:unlink:error:", *(_QWORD *)&a3, 1, a4);
}

- (id)_openTemporaryDirectoryWithError:(id *)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  BMFileAttributes *v8;
  uint64_t v9;
  BMFileAttributes *v10;
  BMCache *fileHandleCache;
  BMFileAttributes *v12;
  id v13;
  void *v14;
  NSString *directory;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  BMFileHandle *(*v21)(uint64_t);
  void *v22;
  id v23;
  BMFileAttributes *v24;
  uint64_t v25;
  uint64_t v26;

  v26 = 0;
  -[BMFileManager directory](self, "directory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[BMPaths getServiceDomain:subpath:forPath:](BMPaths, "getServiceDomain:subpath:forPath:", &v26, 0, v5);

  if (!v6)
    goto LABEL_3;
  +[BMPaths biomeTemporaryDirectoryForDomain:](BMPaths, "biomeTemporaryDirectoryForDomain:", v26);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [BMFileAttributes alloc];
  v9 = BMFileAccessModeFromOFlags(512);
  v10 = -[BMFileAttributes initWithPath:mode:protectionClass:](v8, "initWithPath:mode:protectionClass:", v7, v9, BMDataProtectionClassFromOSProtectionClass(4));
  fileHandleCache = self->super._fileHandleCache;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __57___BMDirectFileManager__openTemporaryDirectoryWithError___block_invoke;
  v22 = &unk_1E5E3CF78;
  v25 = 0x420100200;
  v23 = v7;
  v24 = v10;
  v12 = v10;
  v13 = v7;
  -[BMCache cachedObjectWithKey:missHandler:](fileHandleCache, "cachedObjectWithKey:missHandler:", v12, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
LABEL_3:
    directory = self->_directory;
    +[BMStoreDirectory tmp](BMStoreDirectory, "tmp", v19, v20, v21, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](directory, "stringByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](self, "fileHandleForFileAtPath:flags:protection:error:", v17, 537920000, 4, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directoryHandle, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

- (_BMDirectFileManager)initWithDirectory:(id)a3 cachingOptions:(int64_t)a4
{
  id v6;
  _BMDirectFileManager *v7;
  _BMDirectFileManager *v8;
  uint64_t v9;
  NSString *directory;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_BMDirectFileManager;
  v7 = -[BMFileManager initWithDirectory:cachingOptions:](&v12, sel_initWithDirectory_cachingOptions_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_setUpLock._os_unfair_lock_opaque = 0;
    v9 = objc_msgSend(v6, "copy");
    directory = v8->_directory;
    v8->_directory = (NSString *)v9;

  }
  return v8;
}

- (BOOL)_removeFileAtPath:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[_BMDirectFileManager setUpWithError:](self, "setUpWithError:", a4))
  {
    if (v6)
    {
      bm_subpath(self->_directory, v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = (void *)v7;
      else
        v9 = v6;
      v10 = v9;

      if ((bm_validate_pathat(-[BMFileHandle fd](self->_directoryHandle, "fd"), v10) & 1) != 0)
      {
        if (unlinkat(-[BMFileHandle fd](self->_directoryHandle, "fd"), (const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"), 0) != -1|| *__error() == 2)
        {
          v11 = 1;
LABEL_19:

          goto LABEL_20;
        }
        __biome_log_for_category(2);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[_BMDirectFileManager _removeFileAtPath:error:].cold.2();

        if (a4)
        {
          v20 = (void *)MEMORY[0x1E0CB35C8];
          v21 = *MEMORY[0x1E0CB2D50];
          v22 = CFSTR("Unlink failed");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v20;
          v17 = 1;
          goto LABEL_17;
        }
      }
      else if (a4)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v23 = *MEMORY[0x1E0CB2D50];
        v24 = CFSTR("Invalid parameter");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v14;
        v17 = 2;
LABEL_17:
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v17, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v11 = 0;
      goto LABEL_19;
    }
    __biome_log_for_category(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v26[0] = CFSTR("Invalid path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v10);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
  }
  v11 = 0;
LABEL_20:

  return v11;
}

- (BOOL)_removeDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[_BMDirectFileManager setUpWithError:](self, "setUpWithError:", a4))
  {
    if (v6)
    {
      bm_subpath(self->_directory, v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = (void *)v7;
      else
        v9 = v6;
      v10 = v9;

      if ((bm_validate_pathat(-[BMFileHandle fd](self->_directoryHandle, "fd"), v10) & 1) == 0)
      {
        if (!a4)
        {
LABEL_20:
          v12 = 0;
          goto LABEL_21;
        }
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v24 = *MEMORY[0x1E0CB2D50];
        v25 = CFSTR("Invalid parameter");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v20;
        v17 = 2;
LABEL_19:
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), v17, v15);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      v11 = -[BMFileHandle fd](self->_directoryHandle, "fd");
      v12 = 1;
      if (removefileat(v11, (const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"), 0, 1u) < 0)
      {
        __biome_log_for_category(2);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[_BMDirectFileManager _removeDirectoryAtPath:error:].cold.2();

        if (!a4)
          goto LABEL_20;
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2D50];
        v23 = CFSTR("Remove directory failed");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v14;
        v17 = 1;
        goto LABEL_19;
      }
LABEL_21:

      goto LABEL_22;
    }
    __biome_log_for_category(2);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("Invalid path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v10);
      v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
  }
  v12 = 0;
LABEL_22:

  return v12;
}

- (id)_temporaryFileHandleWithProtection:(int)a3 unlink:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  __CFString *v14;
  void *v16;
  uint64_t v17;
  BMFileHandle *v18;
  void *v19;
  uint64_t v20;
  BMFileAttributes *v21;
  void *v22;
  void *v23;
  BMFileHandle *v24;
  BMFileHandle *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  const __CFString *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v6 = a4;
  v35[2] = *MEMORY[0x1E0C80C00];
  if (!-[_BMDirectFileManager setUpWithError:](self, "setUpWithError:", a5))
    return 0;
  v29 = 0;
  -[_BMDirectFileManager _openTemporaryDirectoryWithError:](self, "_openTemporaryDirectoryWithError:", &v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v29;
  v11 = v10;
  if (v9)
  {
    v28 = 0;
    v12 = bm_new_temporary_file(objc_msgSend(v9, "fd"), a3, v6, &v28);
    v13 = v28;
    if ((v12 & 0x80000000) != 0)
    {
      if (!a5)
      {
        v18 = 0;
        goto LABEL_18;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB3388];
      v32[0] = *MEMORY[0x1E0CB2D50];
      v32[1] = v20;
      v33[0] = CFSTR("Failed to create temporary file");
      v33[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v21 = (BMFileAttributes *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v21);
      v18 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6)
      {
        v14 = CFSTR("<tmp>");
      }
      else
      {
        objc_msgSend(v9, "attributes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringByAppendingPathComponent:", v13);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v21 = -[BMFileAttributes initWithPath:mode:protectionClass:]([BMFileAttributes alloc], "initWithPath:mode:protectionClass:", v14, 2, BMDataProtectionClassFromOSProtectionClass(a3));
      v24 = -[BMFileHandle initWithFileDescriptor:attributes:]([BMFileHandle alloc], "initWithFileDescriptor:attributes:", v12, v21);
      v18 = v24;
      if (v24)
      {
        v25 = v24;
      }
      else if (a5)
      {
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v30 = *MEMORY[0x1E0CB2D50];
        v31 = CFSTR("Unspecified failure");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 0, v27);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    if (!a5)
    {
      v18 = 0;
      goto LABEL_19;
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB3388];
    v34[0] = *MEMORY[0x1E0CB2D50];
    v34[1] = v17;
    v35[0] = CFSTR("Failed to open temporary directory");
    v35[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v13);
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_18:

LABEL_19:
  return v18;
}

- (BOOL)replaceFileAtPath:(id)a3 withData:(id)a4 protection:(int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  BOOL v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  int v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  void *v44;
  id v45;
  int v46;
  NSObject *v47;
  int v49;
  id v50;
  int v51;
  id v52;
  id v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint64_t v56;
  const __CFString *v57;
  _QWORD v58[2];
  _QWORD v59[2];
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  _QWORD v63[3];

  v7 = *(_QWORD *)&a5;
  v63[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (-[_BMDirectFileManager setUpWithError:](self, "setUpWithError:", a6))
  {
    if (objc_msgSend(v10, "length"))
    {
      bm_subpath(self->_directory, v10);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v12)
        v14 = (void *)v12;
      else
        v14 = v10;
      v15 = v14;

      if ((bm_validate_pathat(-[BMFileHandle fd](self->_directoryHandle, "fd"), v15) & 1) != 0)
      {
        -[_BMDirectFileManager _temporaryFileHandleWithProtection:unlink:error:](self, "_temporaryFileHandleWithProtection:unlink:error:", v7, 0, a6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v53 = 0;
          v18 = objc_msgSend(v16, "overwriteWithData:error:", v11, &v53);
          v19 = v53;
          if ((v18 & 1) == 0)
          {
            __biome_log_for_category(2);
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              -[_BMDirectFileManager replaceFileAtPath:withData:protection:error:].cold.5((uint64_t)v19, v33);

            v34 = (void *)MEMORY[0x1E0CB35C8];
            v35 = *MEMORY[0x1E0CB3388];
            v58[0] = *MEMORY[0x1E0CB2D50];
            v58[1] = v35;
            v59[0] = CFSTR("Failed write data");
            v59[1] = v19;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
            v27 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v27);
            v50 = (id)objc_claimAutoreleasedReturnValue();

            v28 = 0;
            v51 = -1;
            goto LABEL_32;
          }
          v20 = objc_msgSend(v15, "containsString:", CFSTR("/"));
          v21 = -[BMFileHandle fd](self->_directoryHandle, "fd");
          v22 = v21;
          if (v20)
          {
            objc_msgSend(v15, "stringByDeletingLastPathComponent");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = bm_openat_dprotected(v22, v23, 537920000, 0xFFFFFFFFLL);

            v51 = v24;
            if (v24 < 0)
            {
              __biome_log_for_category(2);
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                -[_BMDirectFileManager replaceFileAtPath:withData:protection:error:].cold.3();

              v26 = (void *)MEMORY[0x1E0CB35C8];
              v56 = *MEMORY[0x1E0CB2D50];
              v57 = CFSTR("Failed to open destination directory");
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
              v27 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v27);
              v50 = (id)objc_claimAutoreleasedReturnValue();

              v28 = 0;
              goto LABEL_32;
            }
          }
          else
          {
            v51 = v21;
          }
          v52 = v19;
          -[_BMDirectFileManager _openTemporaryDirectoryWithError:](self, "_openTemporaryDirectoryWithError:", &v52);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v52;

          if (v28)
          {
            v50 = v36;
            v49 = objc_msgSend(v28, "fd");
            objc_msgSend(v17, "attributes");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "filename");
            v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v39 = renameat(v49, (const char *)objc_msgSend(v38, "fileSystemRepresentation"), v51, (const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"));

            if (!v39)
            {
              v31 = 1;
LABEL_37:
              if ((v51 & 0x80000000) == 0 && v51 != -[BMFileHandle fd](self->_directoryHandle, "fd"))
                close(v51);
              if (a6 && v50)
                *a6 = objc_retainAutorelease(v50);

              goto LABEL_44;
            }
            __biome_log_for_category(2);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              -[_BMDirectFileManager replaceFileAtPath:withData:protection:error:].cold.4();
          }
          else
          {
            v40 = (void *)MEMORY[0x1E0CB35C8];
            v41 = *MEMORY[0x1E0CB3388];
            v54[0] = *MEMORY[0x1E0CB2D50];
            v54[1] = v41;
            v55[0] = CFSTR("Failed to open temporary directory");
            v55[1] = v36;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
            v27 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v27);
            v42 = objc_claimAutoreleasedReturnValue();

            v28 = 0;
            v50 = (id)v42;
          }
LABEL_32:

          v43 = objc_msgSend(v28, "fd");
          objc_msgSend(v17, "attributes");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "filename");
          v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v46 = unlinkat(v43, (const char *)objc_msgSend(v45, "fileSystemRepresentation"), 0);

          if (v46)
          {
            __biome_log_for_category(2);
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              -[_BMDirectFileManager _removeFileAtPath:error:].cold.2();

          }
          v31 = 0;
          goto LABEL_37;
        }
        v31 = 0;
LABEL_44:

        goto LABEL_45;
      }
      if (a6)
      {
        v32 = (void *)MEMORY[0x1E0CB35C8];
        v60 = *MEMORY[0x1E0CB2D50];
        v61 = CFSTR("Invalid path");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v17);
        v31 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_44;
      }
      v31 = 0;
LABEL_45:

      goto LABEL_46;
    }
    __biome_log_for_category(2);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a6)
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v62 = *MEMORY[0x1E0CB2D50];
      v63[0] = CFSTR("Missing path");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v15);
      v31 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_45;
    }
  }
  v31 = 0;
LABEL_46:

  return v31;
}

- (void)_fileHandleForFileAtPath:flags:protection:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_8_1(&dword_1AEB31000, v0, v1, "fcntl(%d, F_GETPROTECTIONCLASS) failed: %{darwin.errno}d");
  OUTLINED_FUNCTION_1();
}

- (void)_removeFileAtPath:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1AEB31000, v0, v1, "unlinkat() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)_removeDirectoryAtPath:error:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1AEB31000, v0, v1, "removefileat() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)replaceFileAtPath:withData:protection:error:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1AEB31000, v0, v1, "bm_openat_dprotected() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)replaceFileAtPath:withData:protection:error:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1AEB31000, v0, v1, "renameat() failed: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)replaceFileAtPath:(uint64_t)a1 withData:(NSObject *)a2 protection:error:.cold.5(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AEB31000, a2, OS_LOG_TYPE_ERROR, "overwriteWithData:error: failed with error %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)replaceFileAtPath:withFileHandle:protection:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Missing file handle parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)replaceFileAtPath:withFileHandle:protection:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "bm_replace_file() failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
