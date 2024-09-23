@implementation EFFileCompression

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__EFFileCompression_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, block);
  return (OS_os_log *)(id)log_log_2;
}

void __24__EFFileCompression_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;

}

+ (BOOL)compressFile:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  timespec v9;
  int v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v17;
  stat v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  v8 = v7;
  v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v9.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v18.st_blksize = v9;
  *(timespec *)v18.st_qspare = v9;
  v18.st_birthtimespec = v9;
  *(timespec *)&v18.st_size = v9;
  v18.st_mtimespec = v9;
  v18.st_ctimespec = v9;
  *(timespec *)&v18.st_uid = v9;
  v18.st_atimespec = v9;
  *(timespec *)&v18.st_dev = v9;
  if (!v7)
    goto LABEL_9;
  if (stat(v7, &v18))
  {
    v10 = *__error();
    if (!v10)
      goto LABEL_14;
LABEL_10:
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB3308];
    v20[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v10, v14);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    +[EFFileCompression log](EFFileCompression, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[EFFileCompression compressFile:error:].cold.1();
    }

    v11 = 0;
    if (a4)
      goto LABEL_15;
    goto LABEL_16;
  }
  if ((v18.st_mode & 0xF000) != 0x8000)
  {
LABEL_9:
    v10 = 22;
    goto LABEL_10;
  }
  if ((v18.st_flags & 0x20) == 0)
  {
    v17 = 0;
    v11 = objc_msgSend(a1, "_compressFile:error:", v8, &v17);
    v12 = v17;
    if (!a4)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_14:
  v12 = 0;
  v11 = 1;
  if (a4)
LABEL_15:
    *a4 = objc_retainAutorelease(v12);
LABEL_16:

  return v11;
}

+ (BOOL)compressDirectory:(id)a3 shouldCancel:(id)a4 error:(id *)a5
{
  id v7;
  unsigned int (**v8)(_QWORD);
  FTS *v9;
  void *v10;
  int v11;
  FTSENT *v12;
  void *v13;
  stat *fts_statp;
  char *fts_accpath;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  BOOL v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  uint8_t buf[4];
  id v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  char *v50[4];

  v50[2] = *(char **)MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (unsigned int (**)(_QWORD))a4;
  v40 = objc_retainAutorelease(v7);
  if (objc_msgSend(v40, "fileSystemRepresentation"))
  {
    v39 = objc_retainAutorelease(v40);
    v34 = strdup((const char *)objc_msgSend(v39, "fileSystemRepresentation"));
    v50[0] = v34;
    v50[1] = 0;
    v9 = fts_open(v50, 80, 0);
    v10 = 0;
    v11 = 0;
    v35 = *MEMORY[0x1E0CB2FE0];
    v36 = *MEMORY[0x1E0CB3308];
    v37 = 1;
    while (1)
    {
      v12 = fts_read(v9);
      if (!v12)
      {
LABEL_20:
        if (fts_close(v9) == -1)
        {
          v28 = (void *)MEMORY[0x1E0CB35C8];
          v29 = *__error();
          v46 = v36;
          v47 = v39;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "errorWithDomain:code:userInfo:", v35, v29, v30);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          +[EFFileCompression log](EFFileCompression, "log");
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v23, "ef_publicDescription");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            +[EFFileCompression compressDirectory:shouldCancel:error:].cold.2(v32, (uint64_t)buf, (uint64_t)v39, v31);
          }

        }
        else
        {
          v23 = v10;
        }
        free(v34);
        v27 = v37 & 1;
        goto LABEL_29;
      }
      v13 = (void *)MEMORY[0x1B5E15A60]();
      fts_statp = v12->fts_statp;
      if ((fts_statp->st_mode & 0xF000) == 0x8000 && (fts_statp->st_flags & 0x20) == 0)
      {
        fts_accpath = v12->fts_accpath;
        v41 = v10;
        v16 = objc_msgSend(a1, "_compressFile:error:", fts_accpath, &v41);
        v17 = v41;

        if ((v16 & 1) == 0)
        {
          v37 = 0;
          v22 = 0;
          v10 = v17;
          goto LABEL_19;
        }
        v10 = v17;
      }
      if (!v8)
        goto LABEL_17;
      if (v11 < 9)
      {
        v22 = 1;
      }
      else
      {
        if (!v8[2](v8))
        {
          v11 = 0;
LABEL_17:
          v22 = 1;
          goto LABEL_19;
        }
        +[EFFileCompression log](EFFileCompression, "log");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v45 = v39;
          _os_log_impl(&dword_1B106E000, v18, OS_LOG_TYPE_DEFAULT, "Canceling compression of directory %@", buf, 0xCu);
        }

        v19 = (void *)MEMORY[0x1E0CB35C8];
        v48 = v36;
        v49 = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", v35, 4, v20);
        v21 = objc_claimAutoreleasedReturnValue();

        v22 = 0;
        v10 = (void *)v21;
      }
      ++v11;
LABEL_19:
      objc_autoreleasePoolPop(v13);
      if ((v22 & 1) == 0)
        goto LABEL_20;
    }
  }
  v24 = (void *)MEMORY[0x1E0CB35C8];
  v42 = *MEMORY[0x1E0CB3308];
  v43 = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[EFFileCompression log](EFFileCompression, "log");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v23, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    +[EFFileCompression compressDirectory:shouldCancel:error:].cold.1();
  }

  v27 = 1;
LABEL_29:
  if (a5)
    *a5 = objc_retainAutorelease(v23);

  return v27;
}

+ (BOOL)_compressFile:(const char *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  id v22;
  const std::__fs::filesystem::path *v23;
  std::error_code *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[5];

  v45[4] = *MEMORY[0x1E0C80C00];
  v39 = 0;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", a3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v8, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v7, 1, &v38);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v38;

  if (v9)
  {
    objc_msgSend(v7, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutorelease(v12);
    if (copyfile(a3, (const char *)objc_msgSend(v13, "fileSystemRepresentation"), 0, 0x10E000Fu))
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *__error();
      v44 = *MEMORY[0x1E0CB3308];
      v45[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v15, v16);
      v17 = (id)objc_claimAutoreleasedReturnValue();

      +[EFFileCompression log](EFFileCompression, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[EFFileCompression _compressFile:error:].cold.4();
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeItemAtURL:error:", v9, 0);

      if (a4)
      {
LABEL_21:
        v17 = objc_retainAutorelease(v17);
        v21 = 0;
        *a4 = v17;
LABEL_23:

        v10 = v17;
        goto LABEL_24;
      }
    }
    else
    {
      v22 = objc_retainAutorelease(v13);
      if ((objc_msgSend(a1, "_doCompressFile:errorCode:", objc_msgSend(v22, "fileSystemRepresentation"), &v39) & 1) != 0)
      {
        v23 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v22), "fileSystemRepresentation");
        rename(v23, (const std::__fs::filesystem::path *)a3, v24);
        if (!v25)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "removeItemAtURL:error:", v9, 0);

          v21 = 1;
          v17 = v10;
          goto LABEL_23;
        }
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v27 = *__error();
        v40 = *MEMORY[0x1E0CB3308];
        v41 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v27, v28);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        +[EFFileCompression log](EFFileCompression, "log");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          +[EFFileCompression _compressFile:error:].cold.2();
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeItemAtURL:error:", v9, 0);

        if (a4)
          goto LABEL_21;
      }
      else
      {
        v31 = (void *)MEMORY[0x1E0CB35C8];
        v32 = v39;
        v42 = *MEMORY[0x1E0CB3308];
        v43 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v32, v33);
        v17 = (id)objc_claimAutoreleasedReturnValue();

        +[EFFileCompression log](EFFileCompression, "log");
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          +[EFFileCompression _compressFile:error:].cold.3();
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "removeItemAtURL:error:", v9, 0);

        if (a4)
          goto LABEL_21;
      }
    }
    v21 = 0;
    goto LABEL_23;
  }
  +[EFFileCompression log](EFFileCompression, "log");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v10, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    +[EFFileCompression _compressFile:error:].cold.1();
  }

  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    v21 = 0;
    *a4 = v10;
  }
  else
  {
    v21 = 0;
  }
LABEL_24:

  return v21;
}

+ (BOOL)_doCompressFile:(const char *)a3 errorCode:(int64_t *)a4
{
  void *v6;
  BOOL v7;

  objc_msgSend(a1, "_compressionLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");
  objc_msgSend(a1, "_compressionQueueContext");
  if ((CompressFile() & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    *a4 = *__error();
  }
  objc_msgSend(v6, "unlock");

  return v7;
}

+ (CompressionQueueContext_s)_compressionQueueContext
{
  if (_compressionQueueContext_onceToken != -1)
    dispatch_once(&_compressionQueueContext_onceToken, &__block_literal_global_6);
  return (CompressionQueueContext_s *)_compressionQueueContext_context;
}

uint64_t __45__EFFileCompression__compressionQueueContext__block_invoke()
{
  uint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0CFCE98];
  v2[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  result = CreateCompressionQueue();
  _compressionQueueContext_context = result;
  return result;
}

+ (id)_compressionLock
{
  if (_compressionLock_onceToken != -1)
    dispatch_once(&_compressionLock_onceToken, &__block_literal_global_6_0);
  return (id)_compressionLock_fileCompressionLock;
}

void __37__EFFileCompression__compressionLock__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v1 = (void *)_compressionLock_fileCompressionLock;
  _compressionLock_fileCompressionLock = (uint64_t)v0;

}

+ (void)compressFile:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B106E000, "Error %{public}@ No Invalid URL for compression: %@", v4, v5);

  OUTLINED_FUNCTION_3();
}

+ (void)compressDirectory:shouldCancel:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B106E000, "Error %{public}@ No filesystem representation for URL %@", v4, v5);

  OUTLINED_FUNCTION_3();
}

+ (void)compressDirectory:(uint64_t)a3 shouldCancel:(NSObject *)a4 error:.cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138543618;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a3;
  OUTLINED_FUNCTION_1(&dword_1B106E000, "Error %{public}@ attempting to close fts for URL %@", (uint8_t *)a2, a4);

  OUTLINED_FUNCTION_3();
}

+ (void)_compressFile:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B106E000, "Error %{public}@ Attempting to get the item replacement directory for file %@", v4, v5);

  OUTLINED_FUNCTION_3();
}

+ (void)_compressFile:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B106E000, "Error %{public}@ Attempting to move file %@ back to its original location", v4, v5);

  OUTLINED_FUNCTION_3();
}

+ (void)_compressFile:error:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B106E000, "Error %{public}@ Attempting to compress file %@", v4, v5);

  OUTLINED_FUNCTION_3();
}

+ (void)_compressFile:error:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B106E000, "Error %{public}@ Attempting to copy file %@ to a temporary location", v4, v5);

  OUTLINED_FUNCTION_3();
}

@end
