@implementation BMFileManager

id __64__BMFileManager_fileHandleForFileAtPath_flags_protection_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned int *)(a1 + 56);
  v4 = *(unsigned int *)(a1 + 60);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v2, "_fileHandleForFileAtPath:flags:protection:error:", v1, v3, v4, &obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  return v6;
}

- (id)fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6
{
  id v11;
  void *v12;
  uint64_t v13;
  BMFileAttributes *v14;
  int64_t cachingOptions;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  BMCache *v24;
  BMCache *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 210, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v11, "length"))
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__1;
    v40 = __Block_byref_object_dispose__1;
    v41 = 0;
    v12 = (void *)MEMORY[0x1AF4569E0]();
    v13 = BMDataProtectionClassFromOSProtectionClass(a5);
    v14 = -[BMFileAttributes initWithPath:mode:protectionClass:]([BMFileAttributes alloc], "initWithPath:mode:protectionClass:", v11, BMFileAccessModeFromOFlags(a4), v13);
    cachingOptions = self->_cachingOptions;
    -[BMFileManager delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = objc_msgSend(v16, "cachingOptionsForFileHandleWithAttributes:", v14);
    else
      v17 = cachingOptions & 2;
    v23 = self->_cachingOptions;
    if ((v23 & 1) != 0 && (v17 & 1) != 0)
    {
      v24 = self->_fileHandleCache;
    }
    else
    {
      v25 = 0;
      if ((v23 & 2) == 0 || (v17 & 2) == 0)
      {
LABEL_19:
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __64__BMFileManager_fileHandleForFileAtPath_flags_protection_error___block_invoke;
        v31[3] = &unk_1E5E3CCF0;
        v31[4] = self;
        v34 = a4;
        v35 = a5;
        v32 = v11;
        v33 = &v36;
        v26 = MEMORY[0x1AF456B84](v31);
        v27 = (void *)v26;
        if (v25)
          -[BMCache cachedObjectWithKey:missHandler:](v25, "cachedObjectWithKey:missHandler:", v14, v26);
        else
          (*(void (**)(uint64_t))(v26 + 16))(v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v12);
        if (a6)
        {
          v28 = (void *)v37[5];
          if (v28)
            *a6 = objc_retainAutorelease(v28);
        }
        _Block_object_dispose(&v36, 8);

        goto LABEL_26;
      }
      +[BMFileManager globalWeakFileHandleCache](BMFileManager, "globalWeakFileHandleCache");
      v24 = (BMCache *)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;
    goto LABEL_19;
  }
  __biome_log_for_category(2);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[BMFileManager fileExistsAtPath:error:].cold.1();

  if (a6)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v21);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v22 = 0;
LABEL_26:

  return v22;
}

- (BMFileManagerDelegate)delegate
{
  return (BMFileManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (id)globalWeakFileHandleCache
{
  if (globalWeakFileHandleCache_onceToken != -1)
    dispatch_once(&globalWeakFileHandleCache_onceToken, &__block_literal_global_5);
  return (id)globalWeakFileHandleCache_cache;
}

uint64_t __50__BMFileManager_initWithDirectory_cachingOptions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isStale");
}

uint64_t __42__BMFileManager_globalWeakFileHandleCache__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isStale");
}

- (BOOL)replaceFileAtPath:(id)a3 withData:(id)a4 protection:(int)a5 error:(id *)a6
{
  BOOL result;

  OUTLINED_FUNCTION_11();
  objc_opt_class();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_8_0();
  return result;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileHandleCache, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

- (NSString)directory
{
  return self->_directory;
}

- (BOOL)createDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 343, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v7, "length"))
  {
    -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](self, "fileHandleForFileAtPath:flags:protection:error:", v7, 537920000, 0xFFFFFFFFLL, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(a4) = v8 != 0;

  }
  else
  {
    __biome_log_for_category(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (id)contentsOfDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int *v20;
  char *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v7, "length"))
  {
    -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](self, "fileHandleForFileAtPath:flags:protection:error:", v7, 554696704, 0xFFFFFFFFLL, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      goto LABEL_15;
    v10 = dup(objc_msgSend(v8, "fd"));
    if ((v10 & 0x80000000) == 0)
    {
      v11 = v10;
      v12 = (void *)objc_opt_new();
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__1;
      v33 = __Block_byref_object_dispose__1;
      v34 = 0;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke;
      v25[3] = &unk_1E5E3CCC8;
      v28 = v11;
      v27 = &v29;
      v13 = v12;
      v26 = v13;
      objc_msgSend(v9, "performWithInProcessLock:", v25);
      if (a4 && (v14 = (void *)v30[5]) != 0)
      {
        v15 = 0;
        *a4 = objc_retainAutorelease(v14);
      }
      else
      {
        v15 = v13;
      }

      _Block_object_dispose(&v29, 8);
      goto LABEL_19;
    }
    if (!a4)
    {
LABEL_15:
      v15 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2938];
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = __error();
    v21 = strerror(*v20);
    objc_msgSend(v19, "stringWithFormat:", CFSTR("dup(): %s: %d"), v21, *__error());
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v36 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v22);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v15 = 0;
LABEL_19:

    goto LABEL_20;
  }
  __biome_log_for_category(2);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[BMFileManager fileExistsAtPath:error:].cold.1();

  if (a4)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v13);
    v15 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v15 = 0;
LABEL_21:

  return v15;
}

uint64_t __42__BMFileManager_globalWeakFileHandleCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[BMCache weakCache](BMCache, "weakCache");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)globalWeakFileHandleCache_cache;
  globalWeakFileHandleCache_cache = v0;

  return objc_msgSend((id)globalWeakFileHandleCache_cache, "setIsExpiredBlock:", &__block_literal_global_4);
}

+ (BMFileManager)fileManagerWithMediatedAccessToDirectory:(id)a3 useCase:(id)a4 domain:(unint64_t)a5 user:(unsigned int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  _BMXPCFileManager *v11;

  v6 = *(_QWORD *)&a6;
  v9 = a4;
  v10 = a3;
  v11 = -[_BMXPCFileManager initWithDirectory:cachingOptions:useCase:domain:user:]([_BMXPCFileManager alloc], "initWithDirectory:cachingOptions:useCase:domain:user:", v10, 3, v9, a5, v6);

  return (BMFileManager *)v11;
}

+ (BMFileManager)fileManagerWithDirectAccessToDirectory:(id)a3 cachingOptions:(int64_t)a4
{
  id v5;
  _BMDirectFileManager *v6;

  v5 = a3;
  v6 = -[_BMDirectFileManager initWithDirectory:cachingOptions:]([_BMDirectFileManager alloc], "initWithDirectory:cachingOptions:", v5, a4);

  return (BMFileManager *)v6;
}

- (BMFileManager)initWithDirectory:(id)a3 cachingOptions:(int64_t)a4
{
  id v6;
  BMFileManager *v7;
  uint64_t v8;
  NSString *directory;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  BMCache *fileHandleCache;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BMFileManager;
  v7 = -[BMFileManager init](&v15, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    directory = v7->_directory;
    v7->_directory = (NSString *)v8;

    v7->_cachingOptions = a4;
    if ((a4 & 1) != 0)
    {
      if ((a4 & 2) != 0)
      {
        +[BMFileManager globalWeakFileHandleCache](BMFileManager, "globalWeakFileHandleCache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[BMCache strongCacheWithFallbackCache:](BMCache, "strongCacheWithFallbackCache:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        fileHandleCache = v7->_fileHandleCache;
        v7->_fileHandleCache = (BMCache *)v12;

      }
      else
      {
        +[BMCache strongCache](BMCache, "strongCache");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v7->_fileHandleCache;
        v7->_fileHandleCache = (BMCache *)v10;
      }

      -[BMCache setIsExpiredBlock:](v7->_fileHandleCache, "setIsExpiredBlock:", &__block_literal_global_10);
    }
  }

  return v7;
}

- (id)dataWithContentsOfFileAtPath:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 453, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v7, "length"))
  {
    -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](self, "fileHandleForFileAtPath:flags:protection:error:", v7, 0x20000000, 0xFFFFFFFFLL, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "readDataWithError:", a4);
      a4 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      a4 = 0;
    }

  }
  else
  {
    __biome_log_for_category(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

- (BOOL)fileExistsAtPath:(id)a3 error:(id *)a4
{
  id v7;
  int v8;
  int *v9;
  void *v10;
  void *v11;
  int *v12;
  char *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v7, "length"))
  {
    v8 = access((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0);
    v9 = __error();
    if (a4 && v8 && *v9 != 2)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2938];
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = __error();
      v13 = strerror(*v12);
      objc_msgSend(v11, "stringWithFormat:", CFSTR("access(): %s: %d"), v13, *__error());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    LOBYTE(a4) = v8 == 0;
  }
  else
  {
    __biome_log_for_category(2);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();

    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

- (BMFileManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 71, CFSTR("Use designated initializer"));

  return 0;
}

void __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke(uint64_t a1)
{
  DIR *v2;
  DIR *v3;
  uint64_t v4;
  BOOL i;
  BOOL v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  dirent *v25;
  uint64_t v26;
  void *v27;
  dirent v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v2 = fdopendir(*(_DWORD *)(a1 + 48));
  if (v2)
  {
    v3 = v2;
    memset(&v28, 0, 512);
    v25 = 0;
    v4 = readdir_r(v2, &v28, &v25);
    for (i = (_DWORD)v4 == 0; !(_DWORD)v4 && v25; i = (_DWORD)v4 == 0)
    {
      if (v28.d_ino)
        v6 = v28.d_namlen == 0;
      else
        v6 = 1;
      if (!v6
        && (v28.d_namlen != 1 || v28.d_name[0] != 46)
        && (v28.d_namlen != 2 || v28.d_name[0] != 46 || v28.d_name[1] != 46))
      {
        v7 = objc_alloc(MEMORY[0x1E0CB3940]);
        v8 = (void *)objc_msgSend(v7, "initWithBytes:length:encoding:", v28.d_name, v28.d_namlen, _NSDefaultFileSystemEncoding());
        if (objc_msgSend(v8, "length"))
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

      }
      v4 = readdir_r(v3, &v28, &v25);
    }
    if (!i)
    {
      __biome_log_for_category(2);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke_cold_2(v4, v9, v10);

      v11 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("readdir_r(): %s: %d"), strerror(v4), v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
    rewinddir(v3);
    if (closedir(v3) == -1)
    {
      __biome_log_for_category(2);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke_cold_1(v17);

    }
  }
  else
  {
    v18 = *__error();
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fdopendir(): %s: %d"), strerror(v18), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    close(*(_DWORD *)(a1 + 48));
  }
}

- (BOOL)removeFileAtPath:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  int64_t cachingOptions;
  BMCache *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  BMCache *v18;
  void *v20;
  _QWORD v21[4];
  void (**v22)(_QWORD);
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  uint64_t *v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v7, "length"))
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__1;
    v29[4] = __Block_byref_object_dispose__1;
    v30 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __40__BMFileManager_removeFileAtPath_error___block_invoke;
    v25[3] = &unk_1E5E3CD18;
    v27 = &v31;
    v25[4] = self;
    v9 = v7;
    v26 = v9;
    v28 = v29;
    v10 = (void (**)(_QWORD))MEMORY[0x1AF456B84](v25);
    cachingOptions = self->_cachingOptions;
    if ((cachingOptions & 1) != 0)
    {
      v12 = self->_fileHandleCache;
    }
    else
    {
      if ((cachingOptions & 2) == 0)
        goto LABEL_15;
      +[BMFileManager globalWeakFileHandleCache](BMFileManager, "globalWeakFileHandleCache");
      v12 = (BMCache *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v12;
    if (v12)
    {
      v23[0] = v8;
      v23[1] = 3221225472;
      v23[2] = __40__BMFileManager_removeFileAtPath_error___block_invoke_2;
      v23[3] = &unk_1E5E3CD40;
      v24 = v9;
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __40__BMFileManager_removeFileAtPath_error___block_invoke_3;
      v21[3] = &unk_1E5E3CD68;
      v22 = v10;
      -[BMCache pruneCacheWithBlock:completion:](v18, "pruneCacheWithBlock:completion:", v23, v21);

LABEL_16:
      v17 = *((_BYTE *)v32 + 24) != 0;

      _Block_object_dispose(v29, 8);
      _Block_object_dispose(&v31, 8);
      goto LABEL_17;
    }
LABEL_15:
    v10[2](v10);
    v18 = 0;
    goto LABEL_16;
  }
  __biome_log_for_category(2);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[BMFileManager fileExistsAtPath:error:].cold.1();

  if (a4)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v17 = 0;
LABEL_17:

  return v17;
}

void __40__BMFileManager_removeFileAtPath_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_removeFileAtPath:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

uint64_t __40__BMFileManager_removeFileAtPath_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __40__BMFileManager_removeFileAtPath_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)removeDirectoryAtPath:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD);
  int64_t cachingOptions;
  BMCache *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  BMCache *v17;
  id v18;
  void *v19;
  uint64_t *v20;
  void *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD);
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v7, "length"))
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__1;
    v35 = __Block_byref_object_dispose__1;
    v36 = 0;
    v8 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __45__BMFileManager_removeDirectoryAtPath_error___block_invoke;
    v27[3] = &unk_1E5E3CD18;
    v29 = &v37;
    v27[4] = self;
    v9 = v7;
    v28 = v9;
    v30 = &v31;
    v10 = (void (**)(_QWORD))MEMORY[0x1AF456B84](v27);
    cachingOptions = self->_cachingOptions;
    if ((cachingOptions & 1) != 0)
    {
      v17 = self->_fileHandleCache;
    }
    else
    {
      if ((cachingOptions & 2) == 0)
      {
        v12 = 0;
LABEL_14:
        if (objc_msgSend(v9, "hasSuffix:", CFSTR("/")))
        {
          v18 = v9;
        }
        else
        {
          objc_msgSend(v9, "stringByAppendingString:", CFSTR("/"));
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        v19 = v18;
        if (v12)
        {
          v25[0] = v8;
          v25[1] = 3221225472;
          v25[2] = __45__BMFileManager_removeDirectoryAtPath_error___block_invoke_2;
          v25[3] = &unk_1E5E3CD40;
          v26 = v18;
          v23[0] = v8;
          v23[1] = 3221225472;
          v23[2] = __45__BMFileManager_removeDirectoryAtPath_error___block_invoke_3;
          v23[3] = &unk_1E5E3CD68;
          v24 = v10;
          -[BMCache pruneCacheWithBlock:completion:](v12, "pruneCacheWithBlock:completion:", v25, v23);

        }
        else
        {
          v10[2](v10);
        }
        v20 = v38;
        if (a4 && !*((_BYTE *)v38 + 24))
        {
          *a4 = objc_retainAutorelease((id)v32[5]);
          v20 = v38;
        }
        LOBYTE(a4) = *((_BYTE *)v20 + 24) != 0;

        _Block_object_dispose(&v31, 8);
        _Block_object_dispose(&v37, 8);
        goto LABEL_24;
      }
      +[BMFileManager globalWeakFileHandleCache](BMFileManager, "globalWeakFileHandleCache");
      v17 = (BMCache *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v17;
    goto LABEL_14;
  }
  __biome_log_for_category(2);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    -[BMFileManager fileExistsAtPath:error:].cold.1();

  if (a4)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
LABEL_24:

  return (char)a4;
}

void __45__BMFileManager_removeDirectoryAtPath_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_removeDirectoryAtPath:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

uint64_t __45__BMFileManager_removeDirectoryAtPath_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __45__BMFileManager_removeDirectoryAtPath_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)sizeOfFileAtPath:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  off_t st_size;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v22;
  stat v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 359, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v7, "length"))
  {
    v24 = 0;
    -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](self, "fileHandleForFileAtPath:flags:protection:error:", v7, 0x8000, 0xFFFFFFFFLL, &v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v24;
    v10 = v9;
    if (v8 && !v9)
    {
      memset(&v23, 0, sizeof(v23));
      if (fstat(objc_msgSend(v8, "fd"), &v23) != -1)
      {
        st_size = v23.st_size;
LABEL_19:

        goto LABEL_20;
      }
      if (a4)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0CB2938];
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = __error();
        v18 = strerror(*v17);
        objc_msgSend(v16, "stringWithFormat:", CFSTR("fstat(): %s: %d"), v18, *__error());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v20);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_18:
      st_size = 0;
      goto LABEL_19;
    }
    if (!a4)
      goto LABEL_18;
    v14 = objc_retainAutorelease(v9);
    v10 = v14;
LABEL_14:
    st_size = 0;
    *a4 = v14;
    goto LABEL_19;
  }
  __biome_log_for_category(2);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[BMFileManager fileExistsAtPath:error:].cold.1();

  if (a4)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  st_size = 0;
LABEL_20:

  return st_size;
}

- (BOOL)acquireLockfile:(id)a3 andRunBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  id v25;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 395, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v7, "length"))
  {
    v25 = 0;
    -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](self, "fileHandleForFileAtPath:flags:protection:error:", v7, 536871424, 4, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v25;
    v11 = v10;
    if (!v9 || v10)
    {
      __biome_log_for_category(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        -[BMFileManager acquireLockfile:andRunBlock:].cold.2((uint64_t)v7, (uint64_t)v11, v13);

      v12 = 0;
    }
    else
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      v24 = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke;
      v16[3] = &unk_1E5E3CD90;
      v17 = v9;
      v18 = v7;
      v20 = &v21;
      v19 = v8;
      objc_msgSend(v17, "performWithInProcessLock:", v16);
      v12 = *((_BYTE *)v22 + 24) != 0;

      _Block_object_dispose(&v21, 8);
    }

  }
  else
  {
    __biome_log_for_category(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMFileManager fileExistsAtPath:error:].cold.1();
    v12 = 0;
  }

  return v12;
}

void __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int *v7;
  NSObject *v8;
  uint64_t v9;
  int *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "fd");
  +[BMProcess current](BMProcess, "current");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "runningBoardAssertionWithExplanation:", CFSTR("BiomeFileLock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (flock(v2, 2))
  {
    __biome_log_for_category(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = __error();
      __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke_cold_2(v6, (uint64_t)v7, (uint64_t)v11);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    if (flock(v2, 8))
    {
      __biome_log_for_category(2);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        v9 = *(_QWORD *)(a1 + 40);
        v10 = __error();
        __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke_cold_1(v9, (uint64_t)v10, (uint64_t)v11);
      }

    }
  }
  objc_msgSend(v4, "invalidate");

}

- (unint64_t)modificationTimeOfFileAtPath:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  __darwin_time_t tv_sec;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v22;
  stat v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 511, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v7, "length"))
  {
    v24 = 0;
    -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](self, "fileHandleForFileAtPath:flags:protection:error:", v7, 0x8000, 0xFFFFFFFFLL, &v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v24;
    v10 = v9;
    if (v8 && !v9)
    {
      memset(&v23, 0, sizeof(v23));
      if (fstat(objc_msgSend(v8, "fd"), &v23) != -1)
      {
        tv_sec = v23.st_mtimespec.tv_sec;
LABEL_19:

        goto LABEL_20;
      }
      if (a4)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v25 = *MEMORY[0x1E0CB2938];
        v16 = (void *)MEMORY[0x1E0CB3940];
        v17 = __error();
        v18 = strerror(*v17);
        objc_msgSend(v16, "stringWithFormat:", CFSTR("fstat(): %s: %d"), v18, *__error());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v20);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_18:
      tv_sec = 0;
      goto LABEL_19;
    }
    if (!a4)
      goto LABEL_18;
    v14 = objc_retainAutorelease(v9);
    v10 = v14;
LABEL_14:
    tv_sec = 0;
    *a4 = v14;
    goto LABEL_19;
  }
  __biome_log_for_category(2);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[BMFileManager fileExistsAtPath:error:].cold.1();

  if (a4)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v8);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  tv_sec = 0;
LABEL_20:

  return tv_sec;
}

- (BOOL)changePermissionsOfFileAtPath:(id)a3 mode:(unsigned __int16)a4 error:(id *)a5
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int *v19;
  char *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMFileManager.m"), 547, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  if (objc_msgSend(v9, "length"))
  {
    v25 = 0;
    -[BMFileManager fileHandleForFileAtPath:flags:protection:error:](self, "fileHandleForFileAtPath:flags:protection:error:", v9, 0, 0xFFFFFFFFLL, &v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v25;
    v12 = v11;
    if (v10 && !v11)
    {
      if (fchmod(objc_msgSend(v10, "fd"), a4) != -1)
      {
        v13 = 1;
LABEL_19:

        goto LABEL_20;
      }
      if (a5)
      {
        v17 = (void *)MEMORY[0x1E0CB35C8];
        v26 = *MEMORY[0x1E0CB2938];
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = __error();
        v20 = strerror(*v19);
        objc_msgSend(v18, "stringWithFormat:", CFSTR("fchmod(): %s: %d"), v20, *__error());
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 1, v22);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_18:
      v13 = 0;
      goto LABEL_19;
    }
    if (!a5)
      goto LABEL_18;
    v16 = objc_retainAutorelease(v11);
    v12 = v16;
LABEL_14:
    v13 = 0;
    *a5 = v16;
    goto LABEL_19;
  }
  __biome_log_for_category(2);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[BMFileManager fileExistsAtPath:error:].cold.1();

  if (a5)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid path"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("BiomeStorageError"), 2, v10);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v13 = 0;
LABEL_20:

  return v13;
}

- (id)_fileHandleForFileAtPath:(id)a3 flags:(int)a4 protection:(int)a5 error:(id *)a6
{
  id result;

  OUTLINED_FUNCTION_11();
  objc_opt_class();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_8_0();
  return result;
}

- (BOOL)_removeFileAtPath:(id)a3 error:(id *)a4
{
  BOOL result;

  OUTLINED_FUNCTION_11();
  objc_opt_class();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_8_0();
  return result;
}

- (BOOL)_removeDirectoryAtPath:(id)a3 error:(id *)a4
{
  BOOL result;

  OUTLINED_FUNCTION_11();
  objc_opt_class();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_8_0();
  return result;
}

- (id)temporaryFileHandleWithProtection:(int)a3 error:(id *)a4
{
  id result;

  OUTLINED_FUNCTION_11();
  objc_opt_class();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_8_0();
  return result;
}

- (id)replaceFileAtPath:(id)a3 withFileHandle:(id)a4 protection:(int)a5 error:(id *)a6
{
  id result;

  OUTLINED_FUNCTION_11();
  objc_opt_class();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_8_0();
  return result;
}

- (void)fileExistsAtPath:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, v0, v1, "Missing path parameter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke_cold_1(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  OUTLINED_FUNCTION_2_0(&dword_1AEB31000, a1, v3, "closedir(): %{darwin.errno}d", (uint8_t *)v4);
}

void __49__BMFileManager_contentsOfDirectoryAtPath_error___block_invoke_cold_2(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_2_0(&dword_1AEB31000, a2, a3, "contentsOfDirectoryAtPath:error: %{darwin.errno}d", (uint8_t *)v3);
  OUTLINED_FUNCTION_4();
}

- (void)acquireLockfile:(os_log_t)log andRunBlock:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1AEB31000, log, OS_LOG_TYPE_FAULT, "Failed to open lockfile %@: %@", (uint8_t *)&v3, 0x16u);
}

void __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_5_1(a1, 5.778e-34, a2, a3);
  OUTLINED_FUNCTION_6_0(&dword_1AEB31000, "Failed to unlock lockfile %@: %{darwin.errno}d", v3, v4);
}

void __45__BMFileManager_acquireLockfile_andRunBlock___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_5_1(a1, 5.778e-34, a2, a3);
  OUTLINED_FUNCTION_6_0(&dword_1AEB31000, "Failed to acquire lockfile %@: %{darwin.errno}d", v3, v4);
}

@end
