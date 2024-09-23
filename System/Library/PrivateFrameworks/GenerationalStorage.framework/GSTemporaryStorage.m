@implementation GSTemporaryStorage

- (GSTemporaryStorage)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  _NSMethodExceptionProem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%@: cannot use -init for initialization"), v5);

  return 0;
}

- (GSTemporaryStorage)initWithLibraryURL:(id)a3 forItemAtURL:(id)a4 error:(id *)a5
{
  id v10;
  id v11;
  GSTemporaryStorage *v12;
  void *v13;
  uint64_t v14;
  NSURL *stagingURL;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *workQueue;
  NSURL *v19;
  void *v20;
  int v21;
  void *v23;
  objc_super v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if ((objc_msgSend(v11, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GSTemporaryStorage.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[url isFileURL]"));

  }
  v24.receiver = self;
  v24.super_class = (Class)GSTemporaryStorage;
  v12 = -[GSTemporaryStorage init](&v24, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v12->_libraryURL, a3);
    objc_storeStrong((id *)&v12->_documentURL, a4);
    objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR(".genstore_staging"));
    v14 = objc_claimAutoreleasedReturnValue();
    stagingURL = v12->_stagingURL;
    v12->_stagingURL = (NSURL *)v14;

    v12->_lockFd = -1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.genstore.temp-storage-background-queue", v16);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v17;

    -[NSURL gs_chmod:](v12->_libraryURL, "gs_chmod:", 448);
    v19 = v12->_stagingURL;
    v25 = *MEMORY[0x1E0CB2AA8];
    v26[0] = &unk_1E9775890;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v19, 1, v20, a5);

    if (v21)
    {
      -[NSURL gs_chmod:](v12->_libraryURL, "gs_chmod:", 320);
    }
    else
    {

      v12 = 0;
    }

  }
  return v12;
}

- (void)finalize
{
  objc_super v3;

  -[GSTemporaryStorage _unlock](self, "_unlock");
  v3.receiver = self;
  v3.super_class = (Class)GSTemporaryStorage;
  -[GSTemporaryStorage finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[GSTemporaryStorage _unlock](self, "_unlock");
  v3.receiver = self;
  v3.super_class = (Class)GSTemporaryStorage;
  -[GSTemporaryStorage dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  GSTemporaryStorage *v4;
  char v5;

  v4 = (GSTemporaryStorage *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSURL isEqual:](self->_libraryURL, "isEqual:", v4->_libraryURL);
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSURL hash](self->_libraryURL, "hash");
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<GSTemporaryURL %p { library:%@ url:%@ }>"), self, self->_libraryURL, self->_documentURL);
}

- (BOOL)__lockWithFlags:(int)a3 error:(id *)a4
{
  void *v5;
  int v6;
  NSObject *v7;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;

  if ((self->_lockFd & 0x80000000) == 0)
  {
    *__error() = 22;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_lockFd isn't -1"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *__error();
    gs_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
LABEL_4:

      if (a4)
      {
        _GSErrorForErrno(v6, v5);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0;
    }
LABEL_3:
    _RemoveTreeInternal_cold_1();
    goto LABEL_4;
  }
  v11 = open(-[NSURL fileSystemRepresentation](self->_libraryURL, "fileSystemRepresentation"), 256);
  self->_lockFd = v11;
  if (v11 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to open \"%@\" for locking"), self->_libraryURL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *__error();
    gs_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  if (flock(v11, a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to lock %@"), self->_libraryURL);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *__error();
    gs_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      _RemoveTreeInternal_cold_1();

    if (a4)
    {
      _GSErrorForErrno(v13, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    -[GSTemporaryStorage _unlock](self, "_unlock");
    return 0;
  }
  return 1;
}

- (BOOL)_writeLock:(id *)a3
{
  return -[GSTemporaryStorage __lockWithFlags:error:](self, "__lockWithFlags:error:", 2, a3);
}

- (BOOL)_readLock:(id *)a3
{
  return -[GSTemporaryStorage __lockWithFlags:error:](self, "__lockWithFlags:error:", 1, a3);
}

- (void)_unlock
{
  int lockFd;

  lockFd = self->_lockFd;
  if ((lockFd & 0x80000000) == 0)
  {
    flock(lockFd, 8);
    close(self->_lockFd);
    self->_lockFd = -1;
  }
}

- (void)_protectPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB2AA8];
  v8[0] = &unk_1E97758A8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v6, v4, 0);

}

- (void)_unprotectPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB2AA8];
  v8[0] = &unk_1E9775890;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributes:ofItemAtPath:error:", v6, v4, 0);

}

- (id)_URLForNameSpace:(id)a3 createIfNeeded:(BOOL)a4 allowMissing:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  void *v11;
  int v12;
  NSURL *libraryURL;
  NSURL *v14;
  void *v15;
  NSURL *v16;
  void *v17;
  NSObject *v18;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "validateGSName:", a6))
  {
    v14 = 0;
    goto LABEL_20;
  }
  v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.documentVersions"));
  libraryURL = self->_libraryURL;
  if (!v12)
  {
    -[NSURL URLByAppendingPathComponent:](libraryURL, "URLByAppendingPathComponent:", CFSTR(".ns"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", v10);
    v16 = (NSURL *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (access(-[NSURL fileSystemRepresentation](v16, "fileSystemRepresentation"), 0))
    {
      if (!v8)
      {
        if (!v7 || *__error() != 2)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The supplied addition doesn't exist"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          gs_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            GSAdditionCreationInfoValidate_cold_2();

          if (a6)
          {
            _GSErrorForStatus(105, v17, 0);
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        v14 = 0;
        goto LABEL_19;
      }
      -[NSURL gs_chmod:](self->_libraryURL, "gs_chmod:", 448);
      objc_msgSend(v15, "gs_chmod:", 448);
      if ((objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, a6) & 1) == 0)
      {

        v16 = 0;
      }
      objc_msgSend(v15, "gs_chmod:", 320);
      -[NSURL gs_chmod:](self->_libraryURL, "gs_chmod:", 320);
    }
    v16 = v16;
    v14 = v16;
LABEL_19:

    goto LABEL_20;
  }
  v14 = libraryURL;
LABEL_20:

  return v14;
}

- (id)getAdditionDictionary:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "url");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");

  if (-[GSTemporaryStorage _readLock:](self, "_readLock:", a4))
  {
    v9 = GSGetGenerationOptions(v8);
    v10 = GSGetConflictResolved(v8);
    if (!access(v8, 0))
    {
      -[GSTemporaryStorage _unlock](self, "_unlock");
      v19[0] = CFSTR("o");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v15;
      v19[1] = CFSTR("ns");
      objc_msgSend(v6, "nameSpace");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v16;
      v19[2] = CFSTR("u");
      objc_msgSend(v6, "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[2] = v17;
      v19[3] = CFSTR("cr");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20[3] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The supplied addition doesn't exist"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      GSAdditionCreationInfoValidate_cold_2();

    if (a4)
    {
      _GSErrorForStatus(105, v11, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    -[GSTemporaryStorage _unlock](self, "_unlock");
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (BOOL)setAdditionOptions:(id)a3 value:(unint64_t)a4 error:(id *)a5
{
  char v6;
  id v8;
  char *v9;
  void *v10;
  NSObject *v11;
  char v12;

  v6 = a4;
  objc_msgSend(a3, "url");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (char *)objc_msgSend(v8, "fileSystemRepresentation");

  if (!-[GSTemporaryStorage _writeLock:](self, "_writeLock:", a5))
    return 0;
  if (access(v9, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The supplied addition doesn't exist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      GSAdditionCreationInfoValidate_cold_2();

    if (a5)
    {
      _GSErrorForStatus(105, v10, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    v12 = 0;
  }
  else
  {
    v12 = GSSetGenerationOptions(v9, v6, a5);
  }
  -[GSTemporaryStorage _unlock](self, "_unlock");
  return v12;
}

- (BOOL)setAdditionConflictResolved:(id)a3 value:(BOOL)a4 error:(id *)a5
{
  id v8;
  char *v9;
  void *v10;
  NSObject *v11;
  char v12;

  objc_msgSend(a3, "url");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (char *)objc_msgSend(v8, "fileSystemRepresentation");

  if (!-[GSTemporaryStorage _writeLock:](self, "_writeLock:", a5))
    return 0;
  if (access(v9, 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The supplied addition doesn't exist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      GSAdditionCreationInfoValidate_cold_2();

    if (a5)
    {
      _GSErrorForStatus(105, v10, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    v12 = 0;
  }
  else
  {
    v12 = GSSetConflictResolved(v9, a4, a5);
  }
  -[GSTemporaryStorage _unlock](self, "_unlock");
  return v12;
}

- (BOOL)setAdditionDisplayName:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char *v10;
  void *v11;
  NSObject *v12;
  char v13;

  v8 = a4;
  objc_msgSend(a3, "url");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (char *)objc_msgSend(v9, "fileSystemRepresentation");

  if (-[GSTemporaryStorage _writeLock:](self, "_writeLock:", a5))
  {
    if (access(v10, 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The supplied addition doesn't exist"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        GSAdditionCreationInfoValidate_cold_2();

      if (a5)
      {
        _GSErrorForStatus(105, v11, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      v13 = 0;
    }
    else
    {
      v13 = GSSetOriginalDisplayName(v10, v8, a5);
    }
    -[GSTemporaryStorage _unlock](self, "_unlock");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)setAdditionNameSpace:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  std::__fs::filesystem::path *v16;
  id v17;
  int v18;
  id v19;
  _BOOL8 v20;
  id v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v28[4];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[GSTemporaryStorage _writeLock:](self, "_writeLock:", a5))
  {
    objc_msgSend(v8, "nameSpace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GSTemporaryStorage _URLForNameSpace:createIfNeeded:allowMissing:error:](self, "_URLForNameSpace:createIfNeeded:allowMissing:error:", v10, 0, 0, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[GSTemporaryStorage _URLForNameSpace:createIfNeeded:allowMissing:error:](self, "_URLForNameSpace:createIfNeeded:allowMissing:error:", v9, 1, 0, a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v8, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URLByAppendingPathComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "gs_chmod:", 448);
        objc_msgSend(v12, "gs_chmod:", 448);
        objc_msgSend(v8, "url");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v16 = (std::__fs::filesystem::path *)objc_msgSend(v15, "fileSystemRepresentation");
        v17 = objc_retainAutorelease(v14);
        v18 = _PathRename(v16, (std::__fs::filesystem::path *)objc_msgSend(v17, "fileSystemRepresentation"), a5);

        if (v18)
        {
          v19 = objc_retainAutorelease(v17);
          v20 = GSGetGenerationOptions((const char *)objc_msgSend(v19, "fileSystemRepresentation"));
          v21 = objc_retainAutorelease(v19);
          v22 = GSGetConflictResolved((const char *)objc_msgSend(v21, "fileSystemRepresentation"));
          v28[0] = CFSTR("o");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v29[0] = v23;
          v29[1] = v9;
          v28[1] = CFSTR("ns");
          v28[2] = CFSTR("u");
          v29[2] = v21;
          v28[3] = CFSTR("cr");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v29[3] = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 4);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v25 = 0;
        }
        objc_msgSend(v11, "gs_chmod:", 320);
        objc_msgSend(v12, "gs_chmod:", 320);
        goto LABEL_12;
      }
      v25 = 0;
    }
    else
    {
      v25 = 0;
      v12 = 0;
    }
    v17 = 0;
LABEL_12:
    -[GSTemporaryStorage _unlock](self, "_unlock");
    v26 = v25;

    goto LABEL_13;
  }
  v26 = 0;
LABEL_13:

  return v26;
}

- (BOOL)mergeAdditionUserInfo:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char *v10;
  void *v11;
  NSObject *v12;
  char v13;

  v8 = a4;
  objc_msgSend(a3, "url");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (char *)objc_msgSend(v9, "fileSystemRepresentation");

  if (-[GSTemporaryStorage _writeLock:](self, "_writeLock:", a5))
  {
    if (access(v10, 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The supplied addition doesn't exist"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        GSAdditionCreationInfoValidate_cold_2();

      if (a5)
      {
        _GSErrorForStatus(105, v11, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      v13 = 0;
    }
    else
    {
      v13 = GSMergeInfoValueDictionary(v10, v8, a5);
    }
    -[GSTemporaryStorage _unlock](self, "_unlock");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)stagingURLforCreatingAdditionWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_stagingURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gs_createTemporarySubdirectoryOfItem:withTemplate:error:", v6, CFSTR("XXXXXXX"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)URLforReplacingItemWithError:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, self->_documentURL, 1, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cleanupStagingURL:(id)a3
{
  NSURL *stagingURL;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  stagingURL = self->_stagingURL;
  v5 = a3;
  -[NSURL path](stagingURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL pathComponents](self->_stagingURL, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  GSStagingContainer(v6, v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v10)
  {
    _RemoveTree((char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"), 0, 0);
    v9 = v10;
  }

}

- (id)prepareAdditionCreationWithItemAtURL:(id)a3 byMoving:(BOOL)a4 creationInfo:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  std::__fs::filesystem::path *v28;
  char *v29;
  void *v30;
  id v31;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = v10;
  -[NSURL path](self->_stagingURL, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL pathComponents](self->_stagingURL, "pathComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  GSStagingContainer(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_retainAutorelease(v12);
    v18 = 0;
    if (!GSArchiveTree((char *)objc_msgSend(v17, "fileSystemRepresentation"), 0, 0, a6))
      goto LABEL_26;
    goto LABEL_11;
  }
  -[GSTemporaryStorage stagingURLforCreatingAdditionWithError:](self, "stagingURLforCreatingAdditionWithError:", a6);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    objc_msgSend(v11, "objectForKey:", CFSTR("kGSAdditionName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      objc_msgSend(v12, "lastPathComponent");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kGSAdditionKeepFileID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v20, "URLByAppendingPathComponent:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation");
    v17 = objc_retainAutorelease(v27);
    if (!GSStageTree(v28, (std::__fs::filesystem::path *)objc_msgSend(v17, "fileSystemRepresentation"), v8, v26, a6))
    {
      v31 = objc_retainAutorelease(v20);
      _RemoveTree((char *)objc_msgSend(v31, "fileSystemRepresentation"), 0, 0);
      goto LABEL_19;
    }

LABEL_11:
    v17 = objc_retainAutorelease(v17);
    v29 = (char *)objc_msgSend(v17, "fileSystemRepresentation");
    GSAdditionComputePOSIXName(v11, self->_documentURL, v17, a6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30 && GSSetOriginalPOSIXName(v29, v30, a6))
    {
      GSAdditionComputeDN(v11, self->_documentURL, v17, a6);
      v31 = (id)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        if (!GSSetOriginalDisplayName(v29, v31, a6))
        {
          v18 = 0;
          goto LABEL_24;
        }
        GSAdditionValidateUInfo(v11, a6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24 && GSSetInfoDictionary(v29, v24, a6))
        {
          v18 = v17;
LABEL_20:

LABEL_24:
          v30 = v31;
          goto LABEL_25;
        }
LABEL_19:
        v18 = 0;
        goto LABEL_20;
      }
      v30 = 0;
    }
    v18 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v18 = 0;
  v17 = v12;
LABEL_26:

  return v18;
}

- (void)createAdditionStagedAtURL:(id)a3 creationInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *workQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__GSTemporaryStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke;
  v15[3] = &unk_1E9771FA8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(workQueue, v15);

}

void __79__GSTemporaryStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  std::__fs::filesystem::path *v20;
  int v21;
  std::__fs::filesystem::path *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  int v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[4];
  _QWORD v54[4];
  _QWORD v55[2];
  _QWORD v56[4];
  _QWORD v57[6];

  v57[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "pathComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  GSStagingContainer(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 48);
    v52 = 0;
    GSAdditionCreationInfoValidate(v6, v7, &v52);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v52;

    if (v8)
    {
      v10 = *(void **)(a1 + 32);
      v51 = v9;
      v11 = objc_msgSend(v10, "_writeLock:", &v51);
      v12 = v51;

      if ((v11 & 1) != 0)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("kGSAdditionNameSpace"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("kGSAdditionName"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("kGSAdditionOnDuplicate"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("kGSAdditionOptions"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("kGSAdditionConflictResolved"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(a1 + 32);
        v50 = v12;
        objc_msgSend(v17, "_URLForNameSpace:createIfNeeded:allowMissing:error:", v13, 1, 0, &v50);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v50;

        v45 = v16;
        if (!v18)
        {
          v46 = 0;
          v34 = 0;
LABEL_29:
          objc_msgSend(v18, "gs_chmod:", 320);
          objc_msgSend(*(id *)(a1 + 32), "_unlock");
          v9 = v19;
          goto LABEL_30;
        }
        v43 = v15;
        objc_msgSend(v18, "URLByAppendingPathComponent:", v14);
        v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v20 = (std::__fs::filesystem::path *)objc_msgSend(v46, "fileSystemRepresentation");
        v21 = access((const char *)v20, 0);
        v42 = v14;
        if (!v21)
        {
          v35 = objc_msgSend(v43, "intValue");
          if (v35 == 1)
          {
            v56[0] = CFSTR("o");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", GSGetGenerationOptions((const char *)v20));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v57[0] = v30;
            v57[1] = v13;
            v56[1] = CFSTR("ns");
            v56[2] = CFSTR("u");
            v57[2] = v46;
            v56[3] = CFSTR("cr");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", GSGetConflictResolved((const char *)v20));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v57[3] = v39;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
            v34 = -[GSAddition _initWithStorage:andDictionary:]([GSAddition alloc], "_initWithStorage:andDictionary:", *(_QWORD *)(a1 + 32), v31);
LABEL_27:

            goto LABEL_28;
          }
          if (!v35)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Generation already exists"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            gs_default_log();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              __79__GSTemporaryStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke_cold_2();

            _GSErrorForStatus(106, v36, 0);
            v38 = objc_claimAutoreleasedReturnValue();

            v34 = 0;
            v31 = v19;
            v19 = (id)v38;
            goto LABEL_27;
          }
        }
        v41 = v13;
        v22 = (std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation");
        v49 = v19;
        v23 = GSSetGenerationOptions((char *)v22, objc_msgSend(v16, "unsignedLongLongValue"), &v49);
        v9 = v49;

        if (!v23)
        {
          v34 = 0;
          v13 = v41;
          v14 = v42;
          v15 = v43;
LABEL_30:
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
          _RemoveTree((char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), 0, 0);

          goto LABEL_31;
        }
        objc_msgSend(v18, "gs_chmod:", 448);
        if (!v21)
        {
          v24 = (void *)MEMORY[0x1E0C99E98];
          v55[0] = v5;
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "UUIDString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v55[1] = v25;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "fileURLWithPathComponents:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = objc_retainAutorelease(v27);
          v48 = v9;
          LODWORD(v25) = _PathRename(v20, (std::__fs::filesystem::path *)objc_msgSend(v28, "fileSystemRepresentation"), &v48);
          v19 = v48;

          if (!(_DWORD)v25)
          {
            v34 = 0;
            v13 = v41;
            goto LABEL_28;
          }
          v9 = v19;
        }
        v47 = v9;
        v29 = _PathRename(v22, v20, &v47);
        v19 = v47;

        v13 = v41;
        if (!v29)
        {
          v34 = 0;
LABEL_28:
          v14 = v42;
          v15 = v43;
          goto LABEL_29;
        }
        v53[0] = CFSTR("o");
        v53[1] = CFSTR("ns");
        v54[0] = v45;
        v54[1] = v41;
        v54[2] = v46;
        v53[2] = CFSTR("u");
        v53[3] = CFSTR("cr");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v44, "BOOLValue"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v54[3] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      _RemoveTree((char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), 0, 0);

      v9 = v12;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      _RemoveTree((char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), 0, 0);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("not a staged URL: %@"), *(_QWORD *)(a1 + 40));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    gs_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[GSStorageManager isItemAtURLInsidePermanentStorage:error:].cold.1();

    _GSErrorForStatus(104, v32, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
LABEL_31:

}

- (BOOL)replaceDocumentWithContentsOfAddition:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSURL *v14;
  NSURL *v15;
  BOOL v16;

  v10 = a3;
  v11 = a4;
  if (v11)
  {
    GSAdditionSaveBlocking(self, self->_documentURL, 0, v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v16 = 0;
      goto LABEL_11;
    }
    v13 = v12;
    if (a5)
      *a5 = objc_retainAutorelease(v12);

  }
  GSRestoreAdditionInternal(self->_documentURL, v10, a6);
  v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v14 != 0;
  if (v14 && self->_documentURL != v14)
    -[GSTemporaryStorage setDocumentURL:](self, "setDocumentURL:", v14);

LABEL_11:
  return v16;
}

- (BOOL)replaceDocumentWithContentsOfItemAtURL:(id)a3 preservingCurrentVersionWithCreationInfo:(id)a4 createdAddition:(id *)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSURL *v14;
  NSURL *v15;
  BOOL v16;

  v10 = a3;
  v11 = a4;
  if (v11)
  {
    GSAdditionSaveBlocking(self, self->_documentURL, 0, v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_11:
      v16 = 0;
      goto LABEL_12;
    }
    v13 = v12;
    if (a5)
      *a5 = objc_retainAutorelease(v12);

  }
  if (!-[NSURL checkResourceIsReachableAndReturnError:](self->_documentURL, "checkResourceIsReachableAndReturnError:", a6))goto LABEL_11;
  GSReplaceDocumentInternal(self->_documentURL, v10, a6);
  v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = v14 != 0;
  if (v14 && self->_documentURL != v14)
    -[GSTemporaryStorage setDocumentURL:](self, "setDocumentURL:", v14);

LABEL_12:
  return v16;
}

- (id)additionWithName:(id)a3 inNameSpace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[GSTemporaryStorage _URLForNameSpace:createIfNeeded:allowMissing:error:](self, "_URLForNameSpace:createIfNeeded:allowMissing:error:", v9, 0, 0, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "URLByAppendingPathComponent:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v12);
    v13 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
    if (access(v13, 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The supplied addition doesn't exist"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      gs_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        GSAdditionCreationInfoValidate_cold_2();

      if (a5)
      {
        _GSErrorForStatus(105, v14, 0);
        v16 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_11;
    }
    if (-[GSTemporaryStorage _readLock:](self, "_readLock:", a5))
    {
      v20[0] = CFSTR("o");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", GSGetGenerationOptions(v13));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v17;
      v21[1] = v9;
      v20[1] = CFSTR("ns");
      v20[2] = CFSTR("u");
      v21[2] = v11;
      v20[3] = CFSTR("cr");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", GSGetConflictResolved(v13));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[3] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[GSTemporaryStorage _unlock](self, "_unlock");
      v16 = -[GSAddition _initWithStorage:andDictionary:]([GSAddition alloc], "_initWithStorage:andDictionary:", self, v14);
LABEL_11:

      goto LABEL_12;
    }
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (id)additionsWithNames:(id)a3 inNameSpace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  GSTemporaryStorage *v32;
  id *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    v33 = a5;
    v32 = self;
    while (2)
    {
      v15 = 0;
      v34 = v13;
      do
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v15);
        -[GSTemporaryStorage _URLForNameSpace:createIfNeeded:allowMissing:error:](self, "_URLForNameSpace:createIfNeeded:allowMissing:error:", v9, 0, 0, a5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = v17;
          objc_msgSend(v17, "URLByAppendingPathComponent:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = objc_retainAutorelease(v19);
          v21 = (const char *)objc_msgSend(v20, "fileSystemRepresentation");
          if (!access(v21, 0))
          {
            if (!-[GSTemporaryStorage _readLock:](self, "_readLock:", a5))
            {

              v30 = 0;
              goto LABEL_15;
            }
            v39[0] = CFSTR("o");
            v22 = v14;
            v23 = v11;
            v24 = v10;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", GSGetGenerationOptions(v21));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v40[0] = v25;
            v40[1] = v9;
            v39[1] = CFSTR("ns");
            v39[2] = CFSTR("u");
            v40[2] = v20;
            v39[3] = CFSTR("cr");
            v26 = v9;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", GSGetConflictResolved(v21));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v40[3] = v27;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = v24;
            v11 = v23;
            v14 = v22;
            v13 = v34;
            self = v32;
            -[GSTemporaryStorage _unlock](v32, "_unlock");
            v29 = -[GSAddition _initWithStorage:andDictionary:]([GSAddition alloc], "_initWithStorage:andDictionary:", v32, v28);
            objc_msgSend(v10, "addObject:", v29);

            v9 = v26;
            a5 = v33;

          }
        }
        else
        {
          v20 = 0;
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v13)
        continue;
      break;
    }
  }

  v30 = v10;
LABEL_15:

  return v30;
}

- (id)enumeratorForAdditionsInNameSpace:(id)a3 withOptions:(unint64_t)a4 withoutOptions:(unint64_t)a5 ordering:(int)a6
{
  uint64_t v6;
  id v10;
  GSTemporaryAddtionEnumerator *v11;

  v6 = *(_QWORD *)&a6;
  v10 = a3;
  v11 = -[GSTemporaryAddtionEnumerator initWithStorage:nameSpace:withOptions:withoutOptions:ordering:]([GSTemporaryAddtionEnumerator alloc], "initWithStorage:nameSpace:withOptions:withoutOptions:ordering:", self, v10, a4, a5, v6);

  return v11;
}

- (id)_enumerateItemsAtURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)removeAdditions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *workQueue;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    workQueue = self->_workQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__GSTemporaryStorage_removeAdditions_completionHandler___block_invoke_2;
    v11[3] = &unk_1E9771FD0;
    v11[4] = self;
    v13 = v7;
    v12 = v6;
    dispatch_async(workQueue, v11);

    v10 = v13;
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__GSTemporaryStorage_removeAdditions_completionHandler___block_invoke;
    v14[3] = &unk_1E9771DD8;
    v15 = v7;
    -[GSTemporaryStorage removeAllAdditionsForNamespaces:completionHandler:](self, "removeAllAdditionsForNamespaces:completionHandler:", 0, v14);
    v10 = v15;
  }

}

uint64_t __56__GSTemporaryStorage_removeAdditions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__GSTemporaryStorage_removeAdditions_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  id v22;
  void (*v23)(void);
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "URLByAppendingPathComponent:", CFSTR(".ns"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v36 = 0;
  v4 = objc_msgSend(v3, "_writeLock:", &v36);
  v5 = v36;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "gs_chmod:", 448);
    objc_msgSend(v2, "gs_chmod:", 448);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_enumerateItemsAtURL:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "gs_chmod:", 448);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      }
      while (v8);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = *(id *)(a1 + 40);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "url");
          v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          _RemoveTree((char *)objc_msgSend(v16, "fileSystemRepresentation"), 0, 0);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v13);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_enumerateItemsAtURL:", v2, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        for (k = 0; k != v19; ++k)
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          v22 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v24 + 1) + 8 * k));
          rmdir((const char *)objc_msgSend(v22, "fileSystemRepresentation"));
          objc_msgSend(v22, "gs_chmod:", 448);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v37, 16);
      }
      while (v19);
    }

    objc_msgSend(v2, "gs_chmod:", 320);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "gs_chmod:", 320);
    objc_msgSend(*(id *)(a1 + 32), "_unlock");
    v23 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v23 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v23();

}

- (void)removeAllAdditionsForNamespaces:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *workQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__GSTemporaryStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke;
  block[3] = &unk_1E9771FD0;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(workQueue, block);

}

void __72__GSTemporaryStorage_removeAllAdditionsForNamespaces_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "URLByAppendingPathComponent:", CFSTR(".ns"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v34 = 0;
  v4 = objc_msgSend(v3, "_writeLock:", &v34);
  v5 = v34;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "gs_chmod:", 448);
    objc_msgSend(v2, "gs_chmod:", 448);
    v6 = *(void **)(a1 + 40);
    if (!v6
      && (v7 = objc_retainAutorelease(v2),
          _RemoveTree((char *)objc_msgSend(v7, "fileSystemRepresentation"), 0, 0),
          v7,
          v2 = 0,
          (v6 = *(void **)(a1 + 40)) == 0)
      || objc_msgSend(v6, "containsObject:", CFSTR("com.apple.documentVersions")))
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "_enumerateItemsAtURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v9)
      {
        v10 = v9;
        v25 = v5;
        v11 = 0;
        v12 = *(_QWORD *)v31;
        do
        {
          v13 = 0;
          v14 = v11;
          do
          {
            if (*(_QWORD *)v31 != v12)
              objc_enumerationMutation(v8);
            v11 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * v13);

            objc_msgSend(v11, "lastPathComponent");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("."));

            if ((v16 & 1) == 0)
              _RemoveTree((char *)objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation"), 0, 0);
            ++v13;
            v14 = v11;
          }
          while (v10 != v13);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v10);

        v5 = v25;
      }

    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = *(id *)(a1 + 40);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v17);
          v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if ((objc_msgSend(v23, "isEqualToString:", CFSTR("com.apple.documentVersions")) & 1) == 0)
          {
            objc_msgSend(v2, "URLByAppendingPathComponent:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = objc_retainAutorelease(v24);
            _RemoveTree((char *)objc_msgSend(v20, "fileSystemRepresentation"), 0, 0);
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }

    objc_msgSend(v2, "gs_chmod:", 320);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "gs_chmod:", 320);
    objc_msgSend(*(id *)(a1 + 32), "_unlock");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (NSURL)libraryURL
{
  return self->_libraryURL;
}

- (NSURL)documentURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDocumentURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_stagingURL, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
}

void __79__GSTemporaryStorage_createAdditionStagedAtURL_creationInfo_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_0_0(&dword_1D414C000, v0, v1, "[DEBUG] %@; status %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
