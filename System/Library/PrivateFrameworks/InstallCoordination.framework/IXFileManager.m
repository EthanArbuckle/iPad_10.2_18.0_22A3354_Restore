@implementation IXFileManager

+ (id)defaultManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__IXFileManager_defaultManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, block);
  return (id)defaultManager_defaultInstance;
}

void __31__IXFileManager_defaultManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultManager_defaultInstance;
  defaultManager_defaultInstance = (uint64_t)v0;

}

- (BOOL)removeItemAtURL:(id)a3 error:(id *)a4
{
  return -[IXFileManager removeItemAtURL:keepParent:error:](self, "removeItemAtURL:keepParent:error:", a3, 0, a4);
}

- (BOOL)removeItemAtURL:(id)a3 keepParent:(BOOL)a4 error:(id *)a5
{
  return IXRemoveItemAtURL(a3, a4, a5);
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 class:(int)a6 error:(id *)a7
{
  return IXCreateDirectoryAtURL(a3, a4, a5, *(uint64_t *)&a6, a7);
}

- (BOOL)createDirectoryAtURL:(id)a3 withIntermediateDirectories:(BOOL)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  return -[IXFileManager createDirectoryAtURL:withIntermediateDirectories:mode:class:error:](self, "createDirectoryAtURL:withIntermediateDirectories:mode:class:error:", a3, a4, a5, 0xFFFFFFFFLL, a6);
}

- (BOOL)_copyItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  return IXCopyItemAtURL(a3, a4, a5, a6);
}

- (BOOL)_moveItemAtURL:(id)a3 toURL:(id)a4 failIfSrcMissing:(BOOL)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  BOOL v14;
  void *v15;
  id v16;
  const std::__fs::filesystem::path *v17;
  id v18;
  const std::__fs::filesystem::path *v19;
  std::error_code *v20;
  int v21;
  _BOOL4 v22;
  id v23;
  BOOL v24;
  id v25;
  NSObject *v26;
  void *v27;
  unint64_t v28;
  int *v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  int *v33;
  uint64_t v34;
  id v36;
  id v37;
  stat v38;

  v10 = a3;
  v11 = a4;
  if (!a5)
  {
    memset(&v38, 0, sizeof(v38));
    v12 = objc_retainAutorelease(v10);
    if (lstat((const char *)objc_msgSend(v12, "fileSystemRepresentation"), &v38))
    {
      v13 = *__error();
      v14 = v13 == 2;
      if (v13 == 2)
      {
        v15 = 0;
        if (!a6)
          goto LABEL_22;
      }
      else
      {
        v31 = (void *)*MEMORY[0x1E0CB2FE0];
        v32 = *__error();
        v33 = __error();
        strerror(*v33);
        _CreateError((uint64_t)"-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]", 83, v31, v32, 0, 0, CFSTR("stat of %@ failed: %s"), v34, (uint64_t)v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!a6)
          goto LABEL_22;
      }
LABEL_20:
      if (!v14)
      {
        v25 = objc_retainAutorelease(v15);
        v14 = 0;
        *a6 = v25;
        goto LABEL_23;
      }
LABEL_22:
      v25 = v15;
      goto LABEL_23;
    }
  }
  v16 = objc_retainAutorelease(v10);
  v17 = (const std::__fs::filesystem::path *)objc_msgSend(v16, "fileSystemRepresentation");
  v18 = objc_retainAutorelease(v11);
  v19 = (const std::__fs::filesystem::path *)objc_msgSend(v18, "fileSystemRepresentation");
  rename(v17, v19, v20);
  if (v21)
  {
    if (*__error() == 18)
    {
      v37 = 0;
      v22 = -[IXFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:](self, "_copyItemAtURL:toURL:failIfSrcMissing:error:", v16, v18, 1, &v37);
      v23 = v37;
      v15 = v23;
      if (v22)
      {
        v36 = v23;
        v24 = -[IXFileManager removeItemAtURL:error:](self, "removeItemAtURL:error:", v16, &v36);
        v25 = v36;

        if (!v24)
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:].cold.1(v16, (uint64_t)v25, v26);

        }
        goto LABEL_15;
      }
    }
    else
    {
      v27 = (void *)*MEMORY[0x1E0CB2FE0];
      v28 = *__error();
      v29 = __error();
      strerror(*v29);
      _CreateError((uint64_t)"-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]", 98, v27, v28, 0, 0, CFSTR("rename of %@ to %@ failed: %s"), v30, (uint64_t)v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = 0;
    if (!a6)
      goto LABEL_22;
    goto LABEL_20;
  }
  v25 = 0;
LABEL_15:
  v14 = 1;
LABEL_23:

  return v14;
}

- (BOOL)copyItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[IXFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:](self, "_copyItemAtURL:toURL:failIfSrcMissing:error:", a3, a4, 0, a5);
}

- (BOOL)moveItemIfExistsAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:](self, "_moveItemAtURL:toURL:failIfSrcMissing:error:", a3, a4, 0, a5);
}

- (BOOL)copyItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[IXFileManager _copyItemAtURL:toURL:failIfSrcMissing:error:](self, "_copyItemAtURL:toURL:failIfSrcMissing:error:", a3, a4, 1, a5);
}

- (BOOL)moveItemAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  return -[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:](self, "_moveItemAtURL:toURL:failIfSrcMissing:error:", a3, a4, 1, a5);
}

- (id)createTemporaryDirectoryInDirectoryURL:(id)a3 error:(id *)a4
{
  return IXCreateTemporaryDirectoryInDirectoryURL(a3, a4);
}

- (id)createTemporaryExtractionDirectoryWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  id v12;
  id v13;
  id v14;

  +[IXGlobalConfiguration sharedInstance](IXGlobalConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "extractedInstallableStagingDirectory:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  if (v6)
  {
    v13 = v7;
    v8 = -[IXFileManager createDirectoryAtURL:withIntermediateDirectories:mode:error:](self, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v6, 0, 493, &v13);
    v9 = v13;

    if (v8)
    {
      v12 = v9;
      -[IXFileManager createTemporaryDirectoryInDirectoryURL:error:](self, "createTemporaryDirectoryInDirectoryURL:error:", v6, &v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;

      if (!a3)
        goto LABEL_10;
    }
    else
    {
      v10 = 0;
      v7 = v9;
      if (!a3)
        goto LABEL_10;
    }
  }
  else
  {
    v10 = 0;
    if (!a3)
      goto LABEL_10;
  }
  if (!v10)
    *a3 = objc_retainAutorelease(v7);
LABEL_10:

  return v10;
}

- (id)createTemporaryIconsDirectoryWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  id v12;
  id v13;
  id v14;

  +[IXGlobalConfiguration sharedInstance](IXGlobalConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v5, "iconStagingDirectoryWithError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;

  if (v6)
  {
    v13 = v7;
    v8 = -[IXFileManager createDirectoryAtURL:withIntermediateDirectories:mode:error:](self, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v6, 0, 493, &v13);
    v9 = v13;

    if (v8)
    {
      v12 = v9;
      -[IXFileManager createTemporaryDirectoryInDirectoryURL:error:](self, "createTemporaryDirectoryInDirectoryURL:error:", v6, &v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;

      if (!a3)
        goto LABEL_10;
    }
    else
    {
      v10 = 0;
      v7 = v9;
      if (!a3)
        goto LABEL_10;
    }
  }
  else
  {
    v10 = 0;
    if (!a3)
      goto LABEL_10;
  }
  if (!v10)
    *a3 = objc_retainAutorelease(v7);
LABEL_10:

  return v10;
}

- (BOOL)_traverseDirectory:(id)a3 ignoringFTSErrors:(BOOL)a4 error:(id *)a5 withBlock:(id)a6
{
  id v9;
  uint64_t (**v10)(_QWORD);
  id v11;
  char *v12;
  FTS *v13;
  FTS *v14;
  FTSENT *v15;
  FTSENT *v16;
  void *v17;
  unsigned int fts_info;
  BOOL v19;
  int v20;
  char v22;
  BOOL v23;
  void *v24;
  unint64_t v25;
  int *v26;
  uint64_t v27;
  void *v28;
  int fts_errno;
  unint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  unint64_t v34;
  int *v35;
  uint64_t v36;
  char *v38[3];

  v38[2] = *(char **)MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (uint64_t (**)(_QWORD))a6;
  v11 = objc_retainAutorelease(v9);
  v12 = (char *)objc_msgSend(v11, "fileSystemRepresentation");
  v38[0] = v12;
  v38[1] = 0;
  v13 = fts_open(v38, 84, 0);
  if (!v13)
  {
    v24 = (void *)*MEMORY[0x1E0CB2FE0];
    v25 = *__error();
    v26 = __error();
    strerror(*v26);
    _CreateError((uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]", 206, v24, v25, 0, 0, CFSTR("fts_open failed for %s with error %s"), v27, (uint64_t)v12);
    goto LABEL_21;
  }
  v14 = v13;
  v15 = fts_read(v13);
  if (!v15)
  {
    if (fts_close(v14))
      goto LABEL_20;
    v23 = 0;
    v17 = 0;
    goto LABEL_23;
  }
  v16 = v15;
  v17 = 0;
  while (1)
  {
    fts_info = v16->fts_info;
    v19 = fts_info > 0xA;
    v20 = (1 << fts_info) & 0x490;
    if (!v19 && v20 != 0)
      break;
    v22 = v10[2](v10);
    v32 = v17;

    if ((v22 & 1) == 0)
      goto LABEL_17;
    v17 = v32;
LABEL_12:
    v16 = fts_read(v14);
    if (!v16)
    {
      v23 = 1;
      goto LABEL_18;
    }
  }
  if (a4)
    goto LABEL_12;
  v28 = (void *)*MEMORY[0x1E0CB2FE0];
  fts_errno = v16->fts_errno;
  v30 = fts_errno;
  strerror(fts_errno);
  _CreateError((uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]", 218, v28, v30, 0, 0, CFSTR("Error for path %s: %s"), v31, (uint64_t)v12);
  v32 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
  v23 = 0;
  v17 = v32;
LABEL_18:
  if (fts_close(v14))
  {
    if (!v17)
    {
LABEL_20:
      v33 = (void *)*MEMORY[0x1E0CB2FE0];
      v34 = *__error();
      v35 = __error();
      strerror(*v35);
      _CreateError((uint64_t)"-[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:]", 235, v33, v34, 0, 0, CFSTR("fts_close failed for %s with error %s"), v36, (uint64_t)v12);
LABEL_21:
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = 0;
  }
LABEL_23:
  if (a5 && !v23)
    *a5 = objc_retainAutorelease(v17);

  return v23;
}

- (BOOL)_removeACLAtPath:(const char *)a3 isDir:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  acl_t v8;
  acl_t v9;
  DIR *v10;
  DIR *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  unint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  unint64_t v24;
  int *v25;
  char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  BOOL v31;
  int v32;
  int v33;
  int v34;
  NSObject *v35;
  _BOOL4 v36;
  void *v37;
  unint64_t v38;
  int *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  _BOOL4 v44;
  void *v45;
  unint64_t v46;
  int *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  unint64_t v55;
  int *v56;
  uint64_t v57;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  unint64_t v61;
  int *v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v6 = a4;
  v8 = acl_init(0);
  if (v8)
  {
    v9 = v8;
    if (v6)
    {
      v10 = opendir(a3);
      if (v10)
      {
        v11 = v10;
        if (dirfd(v10) < 0)
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v58 = objc_claimAutoreleasedReturnValue();
          v59 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
          v60 = (void *)*MEMORY[0x1E0CB2FE0];
          if (v59)
            -[IXFileManager _removeACLAtPath:isDir:error:].cold.3();

          v61 = *__error();
          v62 = __error();
          strerror(*v62);
          _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 270, v60, v61, 0, 0, CFSTR("dirfd of %s failed: %s"), v63, (uint64_t)a3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 270;
        }
        else
        {
          if (!MEMORY[0x1A85A5528]())
          {
            v30 = 0;
            v31 = 1;
            goto LABEL_32;
          }
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
          v14 = (void *)*MEMORY[0x1E0CB2FE0];
          if (v13)
            -[IXFileManager _removeACLAtPath:isDir:error:].cold.4();

          v15 = *__error();
          v16 = __error();
          strerror(*v16);
          _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 275, v14, v15, 0, 0, CFSTR("Failed to set ACL on dir %s: %s"), v17, (uint64_t)a3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 275;
        }
        _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", v20, CFSTR("IXErrorDomain"), 1uLL, v19, 0, CFSTR("Failed to remove ACL"), v18, v65);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = 0;
LABEL_32:
        closedir(v11);
        goto LABEL_33;
      }
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
      v45 = (void *)*MEMORY[0x1E0CB2FE0];
      if (v44)
        -[IXFileManager _removeACLAtPath:isDir:error:].cold.2();

      v46 = *__error();
      v47 = __error();
      strerror(*v47);
      _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 264, v45, v46, 0, 0, CFSTR("opendir of %s failed: %s"), v48, (uint64_t)a3);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 264;
    }
    else
    {
      v32 = open(a3, 2097154);
      if ((v32 & 0x80000000) == 0)
      {
        v33 = v32;
        v34 = MEMORY[0x1A85A5528]();
        v31 = v34 == 0;
        if (v34)
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
          v37 = (void *)*MEMORY[0x1E0CB2FE0];
          if (v36)
            -[IXFileManager _removeACLAtPath:isDir:error:].cold.6();

          v38 = *__error();
          v39 = __error();
          strerror(*v39);
          _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 286, v37, v38, 0, 0, CFSTR("Failed to set ACL on %s: %s"), v40, (uint64_t)a3);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 286, CFSTR("IXErrorDomain"), 1uLL, v41, 0, CFSTR("Failed to remove ACL"), v42, v67);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v30 = 0;
        }
        close(v33);
LABEL_33:
        acl_free(v9);
        if (!a5)
          goto LABEL_36;
        goto LABEL_34;
      }
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v52 = objc_claimAutoreleasedReturnValue();
      v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
      v54 = (void *)*MEMORY[0x1E0CB2FE0];
      if (v53)
        -[IXFileManager _removeACLAtPath:isDir:error:].cold.5();

      v55 = *__error();
      v56 = __error();
      strerror(*v56);
      _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 281, v54, v55, 0, 0, CFSTR("open of %s failed: %s"), v57, (uint64_t)a3);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 281;
    }
    _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", v51, CFSTR("IXErrorDomain"), 1uLL, v50, 0, CFSTR("Failed to remove ACL"), v49, v68);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    goto LABEL_33;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
  v23 = (void *)*MEMORY[0x1E0CB2FE0];
  if (v22)
    -[IXFileManager _removeACLAtPath:isDir:error:].cold.1((void *)*MEMORY[0x1E0CB2FE0]);

  v24 = *__error();
  v25 = __error();
  v26 = strerror(*v25);
  _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 257, v23, v24, 0, 0, CFSTR("acl_init() failed: %s"), v27, (uint64_t)v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 257, CFSTR("IXErrorDomain"), 1uLL, v28, 0, CFSTR("Failed to remove ACL"), v29, v66);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  if (a5)
  {
LABEL_34:
    if (!v31)
      *a5 = objc_retainAutorelease(v30);
  }
LABEL_36:

  return v31;
}

- (BOOL)setPermissions:(unsigned __int16)a3 onAllChildrenOfPath:(id)a4 error:(id *)a5
{
  BOOL v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  unsigned __int16 v11;
  id v12;

  v12 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__IXFileManager_setPermissions_onAllChildrenOfPath_error___block_invoke;
  v10[3] = &__block_descriptor_34_e79_B24__0___ftsent____ftsent____ftsent____ftsent_q_v__iiSSQiSsSSS__stat__1c__8__16l;
  v11 = a3;
  v6 = -[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:](self, "_traverseDirectory:ignoringFTSErrors:error:withBlock:", a4, 0, &v12, v10);
  v7 = v12;
  v8 = v7;
  if (a5 && !v6)
    *a5 = objc_retainAutorelease(v7);

  return v6;
}

uint64_t __58__IXFileManager_setPermissions_onAllChildrenOfPath_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unsigned int v4;
  uint64_t result;
  BOOL v6;
  int v7;
  const char *v10;
  int v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  id v15;

  v4 = *(unsigned __int16 *)(a2 + 88);
  result = 1;
  v6 = v4 > 0xC;
  v7 = (1 << v4) & 0x110A;
  if (!v6 && v7 != 0)
  {
    v10 = *(const char **)(a2 + 48);
    if (lchmod(v10, *(_WORD *)(a1 + 32)))
    {
      v11 = *__error();
      v12 = (void *)*MEMORY[0x1E0CB2FE0];
      v13 = *__error();
      strerror(v11);
      _CreateError((uint64_t)"-[IXFileManager setPermissions:onAllChildrenOfPath:error:]_block_invoke", 325, v12, v13, 0, 0, CFSTR("Failed to lchmod %s to mode 0%o : %s"), v14, (uint64_t)v10);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v15;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)copyACLFrom:(id)a3 toAllChildrenOfPath:(id)a4 error:(id *)a5
{
  return -[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:](self, "copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:", a3, a4, 0, a5);
}

- (BOOL)copyACLFrom:(id)a3 toAllChildrenOfPath:(id)a4 ignoringCopyErrors:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  const char *v13;
  acl_t link_np;
  acl_t v15;
  BOOL v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD v21[5];
  BOOL v22;
  id v23;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = objc_retainAutorelease(v10);
  v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
  link_np = acl_get_link_np(v13, ACL_TYPE_EXTENDED);
  if (link_np)
  {
    v15 = link_np;
    v23 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74__IXFileManager_copyACLFrom_toAllChildrenOfPath_ignoringCopyErrors_error___block_invoke;
    v21[3] = &__block_descriptor_41_e79_B24__0___ftsent____ftsent____ftsent____ftsent_q_v__iiSSQiSsSSS__stat__1c__8__16l;
    v21[4] = link_np;
    v22 = v7;
    v16 = -[IXFileManager _traverseDirectory:ignoringFTSErrors:error:withBlock:](self, "_traverseDirectory:ignoringFTSErrors:error:withBlock:", v11, v7, &v23, v21);
    v17 = v23;
    acl_free(v15);
    if (!a6)
      goto LABEL_11;
    goto LABEL_9;
  }
  v19 = *__error();
  if ((_DWORD)v19 == 2 && -[IXFileManager itemExistsAtURL:](self, "itemExistsAtURL:", v12))
    _CreateError((uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]", 361, (void *)*MEMORY[0x1E0CB2FE0], 0x5DuLL, 0, 0, CFSTR("acl_get_link_np found no ACLs on %s"), v18, (uint64_t)v13);
  else
    _CreateError((uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]", 366, (void *)*MEMORY[0x1E0CB2FE0], v19, 0, 0, CFSTR("acl_get_link_np failed for %s"), v18, (uint64_t)v13);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  if (a6)
  {
LABEL_9:
    if (!v16)
      *a6 = objc_retainAutorelease(v17);
  }
LABEL_11:

  return v16;
}

uint64_t __74__IXFileManager_copyACLFrom_toAllChildrenOfPath_ignoringCopyErrors_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  unsigned int v4;
  uint64_t result;
  BOOL v6;
  int v7;
  BOOL v8;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = *(unsigned __int16 *)(a2 + 88);
  result = 1;
  v6 = v4 >= 8;
  v8 = v4 == 8;
  v7 = (1 << v4) & 0x10A;
  v8 = !v8 && v6 || v7 == 0;
  if (!v8)
  {
    v10 = *(const char **)(a2 + 48);
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __74__IXFileManager_copyACLFrom_toAllChildrenOfPath_ignoringCopyErrors_error___block_invoke_cold_1((uint64_t)v10, v11);

    if (!acl_set_link_np(v10, ACL_TYPE_EXTENDED, *(acl_t *)(a1 + 32)))
      return 1;
    v13 = *__error();
    if (*(_BYTE *)(a1 + 40))
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = "-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke";
        v18 = 2080;
        v19 = strerror(v13);
        v20 = 2080;
        v21 = v10;
        _os_log_impl(&dword_1A4BF6000, v14, OS_LOG_TYPE_DEFAULT, "%s: Ignoring error %s from acl_set_link_np for %s", buf, 0x20u);
      }

      return 1;
    }
    _CreateError((uint64_t)"-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke", 384, (void *)*MEMORY[0x1E0CB2FE0], v13, 0, 0, CFSTR("acl_set_link_np for %s failed"), v12, (uint64_t)v10);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a3 = v15;
  }
  return result;
}

- (id)urlsForItemsInDirectoryAtURL:(id)a3 ignoringSymlinks:(BOOL)a4 error:(id *)a5
{
  return IXUrlsForItemsInDirectoryAtURL(a3, a4, a5);
}

- (BOOL)createSymbolicLinkAtURL:(id)a3 withDestinationURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  int v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  v8 = objc_retainAutorelease(a4);
  v9 = (const char *)objc_msgSend(v8, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v7);
  v11 = symlink(v9, (const char *)objc_msgSend(v10, "fileSystemRepresentation"));
  if (v11)
  {
    v12 = (void *)*MEMORY[0x1E0CB2FE0];
    v13 = *__error();
    v14 = objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
    objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation");
    v15 = __error();
    strerror(*v15);
    _CreateError((uint64_t)"-[IXFileManager createSymbolicLinkAtURL:withDestinationURL:error:]", 418, v12, v13, 0, 0, CFSTR("Could not create symlink containing %s at %s: %s"), v16, v14);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      v17 = objc_retainAutorelease(v17);
      *a5 = v17;
    }
  }
  else
  {
    v17 = 0;
  }

  return v11 == 0;
}

- (id)destinationOfSymbolicLinkAtURL:(id)a3 error:(id *)a4
{
  id v5;
  ssize_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  char v17[1025];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(a3);
  v6 = readlink((const char *)objc_msgSend(v5, "fileSystemRepresentation"), v17, 0x400uLL);
  if (v6 < 0)
  {
    v11 = (void *)*MEMORY[0x1E0CB2FE0];
    v12 = *__error();
    v13 = objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
    v14 = __error();
    strerror(*v14);
    _CreateError((uint64_t)"-[IXFileManager destinationOfSymbolicLinkAtURL:error:]", 438, v11, v12, 0, 0, CFSTR("Could not readlink %s : %s"), v15, v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v17[v6] = 0;
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:length:", v17, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (!v9)
    *a4 = objc_retainAutorelease(v10);
LABEL_7:

  return v9;
}

- (BOOL)itemExistsAtURL:(id)a3 isDirectory:(BOOL *)a4 error:(id *)a5
{
  return IXItemExistsAtURL(a3, a4, a5);
}

- (BOOL)itemExistsAtURL:(id)a3 error:(id *)a4
{
  return -[IXFileManager itemExistsAtURL:isDirectory:error:](self, "itemExistsAtURL:isDirectory:error:", a3, 0, a4);
}

- (BOOL)itemExistsAtURL:(id)a3
{
  return -[IXFileManager itemExistsAtURL:error:](self, "itemExistsAtURL:error:", a3, 0);
}

- (BOOL)itemDoesNotExistAtURL:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;
  int *v6;
  char *v7;
  stat v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&v9, 0, sizeof(v9));
  v3 = objc_retainAutorelease(a3);
  if (!lstat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                          0,
                          0),
          &v9))
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  if (*__error() != 2)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = __error();
      v7 = strerror(*v6);
      *(_DWORD *)buf = 136315650;
      v11 = "-[IXFileManager itemDoesNotExistAtURL:]";
      v12 = 2112;
      v13 = v3;
      v14 = 2080;
      v15 = v7;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to determine if %@ exists: %s", buf, 0x20u);
    }

    goto LABEL_7;
  }
  v4 = 1;
LABEL_8:

  return v4;
}

- (id)debugDescriptionOfItemAtURL:(id)a3
{
  int v3;
  void *v4;
  int *v5;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  stat v11;

  memset(&v11, 0, sizeof(v11));
  v3 = lstat((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), &v11);
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    v5 = __error();
    v7 = strerror(*v5);
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<lstat error: %s>"), v7, v8, v9, v10, *(_QWORD *)&v11.st_dev, v11.st_ino);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<uid:%u gid:%u mode:0%ho flags:0x%x>"), v11.st_uid, v11.st_gid, v11.st_mode, v11.st_flags, *(_QWORD *)&v11.st_dev, v11.st_ino);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)dataProtectionClassOfItemAtURL:(id)a3 class:(int *)a4 error:(id *)a5
{
  id v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;

  v7 = objc_retainAutorelease(a3);
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 256);
  v9 = v8;
  if (v8 < 0)
  {
    v13 = (void *)*MEMORY[0x1E0CB2FE0];
    v14 = *__error();
    v15 = objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    v16 = __error();
    strerror(*v16);
    _CreateError((uint64_t)"-[IXFileManager dataProtectionClassOfItemAtURL:class:error:]", 498, v13, v14, 0, 0, CFSTR("Failed to open %s : %s"), v17, v15);
  }
  else
  {
    v10 = fcntl(v8, 63);
    if ((v10 & 0x80000000) == 0)
    {
      v11 = 0;
      *a4 = v10;
      v12 = 1;
LABEL_9:
      close(v9);
      v24 = v12;
      goto LABEL_10;
    }
    v18 = (void *)*MEMORY[0x1E0CB2FE0];
    v19 = *__error();
    v20 = objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    v21 = __error();
    strerror(*v21);
    _CreateError((uint64_t)"-[IXFileManager dataProtectionClassOfItemAtURL:class:error:]", 504, v18, v19, 0, 0, CFSTR("Failed to getclass of file %s: %s"), v22, v20);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  if (a5)
    *a5 = objc_retainAutorelease(v23);
  v12 = 0;
  v24 = 0;
  if ((v9 & 0x80000000) == 0)
    goto LABEL_9;
LABEL_10:

  return v24;
}

- (BOOL)setDataProtectionClassOfItemAtURL:(id)a3 toClass:(int)a4 ifPredicate:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v9;
  unsigned int (**v10)(id, _QWORD);
  id v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  int *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  char v27;
  uint64_t v28;
  int *v29;
  void *v30;
  BOOL v31;
  uint64_t v33;

  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = (unsigned int (**)(id, _QWORD))a5;
  v11 = objc_retainAutorelease(v9);
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 256);
  v13 = v12;
  if (v12 < 0)
  {
    v19 = (void *)*MEMORY[0x1E0CB2FE0];
    v20 = *__error();
    v21 = objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
    v22 = __error();
    v33 = v21;
    strerror(*v22);
    v24 = CFSTR("Failed to open %s : %s");
    v25 = 530;
  }
  else
  {
    if (!v10)
    {
LABEL_5:
      if (fcntl(v13, 64, v8))
      {
        v15 = (void *)*MEMORY[0x1E0CB2FE0];
        v16 = *__error();
        objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
        v17 = __error();
        strerror(*v17);
        _CreateError((uint64_t)"-[IXFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]", 547, v15, v16, 0, 0, CFSTR("Failed to setclass(%d) on file %s: %s"), v18, v8);
        goto LABEL_11;
      }
LABEL_8:
      v26 = 0;
      v27 = 1;
LABEL_14:
      close(v13);
      v31 = v27;
      goto LABEL_15;
    }
    v14 = fcntl(v12, 63);
    if ((v14 & 0x80000000) == 0)
    {
      if (!v10[2](v10, v14))
        goto LABEL_8;
      goto LABEL_5;
    }
    v19 = (void *)*MEMORY[0x1E0CB2FE0];
    v20 = *__error();
    v28 = objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation");
    v29 = __error();
    v33 = v28;
    strerror(*v29);
    v24 = CFSTR("Failed to getclass of file %s: %s");
    v25 = 538;
  }
  _CreateError((uint64_t)"-[IXFileManager setDataProtectionClassOfItemAtURL:toClass:ifPredicate:error:]", v25, v19, v20, 0, 0, v24, v23, v33);
LABEL_11:
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v30;
  if (a6)
    *a6 = objc_retainAutorelease(v30);
  v27 = 0;
  v31 = 0;
  if ((v13 & 0x80000000) == 0)
    goto LABEL_14;
LABEL_15:

  return v31;
}

- (BOOL)setPermissionsOfItemAtURL:(id)a3 toMode:(unsigned __int16)a4 error:(id *)a5
{
  const char *v7;
  int v8;
  void *v9;
  unint64_t v10;
  int *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v7 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v8 = lchmod(v7, a4);
  if (v8)
  {
    v9 = (void *)*MEMORY[0x1E0CB2FE0];
    v10 = *__error();
    v11 = __error();
    strerror(*v11);
    _CreateError((uint64_t)"-[IXFileManager setPermissionsOfItemAtURL:toMode:error:]", 567, v9, v10, 0, 0, CFSTR("Failed to lchmod %s to mode 0%o : %s"), v12, (uint64_t)v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a5)
      *a5 = objc_retainAutorelease(v13);

  }
  return v8 == 0;
}

- (id)_realPathWhatExistsInPath:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5 - 1;
  if (v5 == 1)
  {
    v9 = 0;
  }
  else
  {
    do
    {
      objc_msgSend(v4, "subarrayWithRange:", 0, v6 + 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      if (-[IXFileManager itemExistsAtURL:](self, "itemExistsAtURL:", v8))
      {
        -[IXFileManager _realPathForURL:allowNonExistentPathComponents:](self, "_realPathForURL:allowNonExistentPathComponents:", v8, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v4, "subarrayWithRange:", v6 + 1, objc_msgSend(v4, "count") - (v6 + 1));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "path");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v17 = "-[IXFileManager _realPathWhatExistsInPath:]";
            v18 = 2112;
            v19 = v15;
            v20 = 2112;
            v21 = v12;
            _os_log_debug_impl(&dword_1A4BF6000, v13, OS_LOG_TYPE_DEBUG, "%s: Realpathed %@ ; appending non-existing components %@",
              buf,
              0x20u);

          }
          objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v12, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v9 = 0;
        }

      }
      if (v9)
        break;
      --v6;
    }
    while (v6);
  }

  return v9;
}

- (id)_realPathForURL:(id)a3 allowNonExistentPathComponents:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  uint64_t v8;
  NSObject *v10;
  uint64_t v11;
  int *v12;
  char *v13;
  void *v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  char *v23;
  char v24[1024];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  bzero(v24, 0x400uLL);
  objc_msgSend(a3, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (realpath_DARWIN_EXTSN((const char *)objc_msgSend(v7, "fileSystemRepresentation"), v24))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v24, 0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v14 = (void *)v8;
    goto LABEL_12;
  }
  if (*__error() == 2 && v4)
  {
    -[IXFileManager _realPathWhatExistsInPath:](self, "_realPathWhatExistsInPath:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    v12 = __error();
    v13 = strerror(*v12);
    v16 = 136315906;
    v17 = "-[IXFileManager _realPathForURL:allowNonExistentPathComponents:]";
    v18 = 2080;
    v19 = v11;
    v20 = 2080;
    v21 = v13;
    v22 = 2080;
    v23 = v24;
    _os_log_impl(&dword_1A4BF6000, v10, OS_LOG_TYPE_DEFAULT, "%s: Failed to realpath %s : %s at %s", (uint8_t *)&v16, 0x2Au);
  }

  v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)_validateSymlink:(id)a3 withStartingDepth:(unsigned int)a4 andEndingDepth:(unsigned int *)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  signed int v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  unsigned int *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v18 = a5;
    objc_msgSend(v7, "pathComponents");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      v13 = a4;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("..")))
          {
            --v13;
          }
          else if ((objc_msgSend(v15, "isEqualToString:", &stru_1E4DC66E0) & 1) == 0
                 && (objc_msgSend(v15, "isEqualToString:", CFSTR(".")) & 1) == 0)
          {
            v13 += objc_msgSend(v15, "isEqualToString:", CFSTR("/")) ^ 1;
          }
          if (v13 < (int)a4)
          {

            goto LABEL_18;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v13 = a4;
    }

    if (v18)
      *v18 = v13;
    v16 = 1;
  }
  else
  {
    v9 = 0;
LABEL_18:
    v16 = 0;
  }

  return v16;
}

- (id)realPathForURL:(id)a3 ifChildOfURL:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  char *v33;
  ssize_t v34;
  void *v35;
  char *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v42;
  BOOL v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  void *v51;
  int *v52;
  char *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;
  NSObject *v65;
  char *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  char *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  char *v81;
  unint64_t v82;
  os_log_t log;
  NSObject *loga;
  char logb;
  os_log_t logc;
  void *v87;
  void *v88;
  unsigned int v89;
  uint8_t buf[4];
  const char *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  char *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  uint64_t v103;
  char v104[1024];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  bzero(v104, 0x400uLL);
  if (!v6 || !v7)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    *(_DWORD *)buf = 136315650;
    v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    v92 = 2112;
    v93 = v7;
    v94 = 2112;
    v95 = v6;
    v30 = "%s: The base path %@ and/or suspicious path %@ were nil";
    v31 = v25;
    v32 = 32;
    goto LABEL_14;
  }
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("/private/"));

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v7, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v13;
  }
  objc_msgSend(v6, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("/private/"));

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "substringFromIndex:", objc_msgSend(CFSTR("/private"), "length"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPath:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v6 = (char *)v19;
  }
  objc_msgSend(v6, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "hasPrefix:", v21);

  if ((v22 & 1) == 0)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
      v92 = 2112;
      v93 = v26;
      v94 = 2112;
      v95 = v33;
      _os_log_impl(&dword_1A4BF6000, v25, OS_LOG_TYPE_DEFAULT, "%s: supiscious path %@ does not contain base path %@ as a prefix", buf, 0x20u);

LABEL_22:
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  objc_msgSend(v6, "pathComponents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "containsObject:", CFSTR(".."));

  if (!v24)
  {
    v6 = objc_retainAutorelease(v6);
    v34 = readlink((const char *)objc_msgSend(v6, "fileSystemRepresentation"), v104, 0x400uLL);
    if ((v34 & 0x8000000000000000) == 0)
    {
      if (v104[0] == 47)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "path");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
          v92 = 2112;
          v93 = v26;
          v94 = 2080;
          v95 = v104;
          v27 = "%s: Rejecting %@ -> %s, as absolute symlinks are not allowed";
          v28 = v25;
          v29 = 32;
          goto LABEL_21;
        }
        goto LABEL_23;
      }
      v89 = 0;
      objc_msgSend(v7, "path");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[IXFileManager _validateSymlink:withStartingDepth:andEndingDepth:](self, "_validateSymlink:withStartingDepth:andEndingDepth:", v42, 0, &v89);

      if (!v43)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        objc_msgSend(v7, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
        v92 = 2112;
        v93 = v26;
        v27 = "%s: Failed to retrieve depth of %@";
        goto LABEL_11;
      }
      objc_msgSend(v6, "path");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "substringFromIndex:", objc_msgSend(v45, "length"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "stringByDeletingLastPathComponent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:length:", v104, v34);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringByAppendingPathComponent:", v47);
      v36 = (char *)objc_claimAutoreleasedReturnValue();

      if (!-[IXFileManager _validateSymlink:withStartingDepth:andEndingDepth:](self, "_validateSymlink:withStartingDepth:andEndingDepth:", v36, v89, 0))
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "path");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "path");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
          v92 = 2112;
          v93 = v51;
          v94 = 2112;
          v95 = v36;
          v96 = 2112;
          v97 = v56;
          _os_log_impl(&dword_1A4BF6000, v50, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ -> %@, as it is points outside or to the base %@", buf, 0x2Au);

          goto LABEL_48;
        }
LABEL_49:

        goto LABEL_24;
      }
LABEL_33:
      -[IXFileManager _realPathForURL:allowNonExistentPathComponents:](self, "_realPathForURL:allowNonExistentPathComponents:", v7, 0);
      v48 = objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        v37 = (void *)v48;
        -[IXFileManager _realPathForURL:allowNonExistentPathComponents:](self, "_realPathForURL:allowNonExistentPathComponents:", v6, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v49)
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "path");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
            v92 = 2112;
            v93 = v55;
            _os_log_impl(&dword_1A4BF6000, v54, OS_LOG_TYPE_DEFAULT, "%s: Failed to retrieve realpath for suspicious path %@", buf, 0x16u);

          }
          goto LABEL_25;
        }
        v38 = v49;
        if ((v34 & 0x8000000000000000) == 0)
        {
LABEL_36:
          v38 = v38;
          v39 = v38;
          goto LABEL_27;
        }
        objc_msgSend(v49, "pathComponents");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "pathComponents");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v87, "count");
        v88 = v57;
        v59 = objc_msgSend(v57, "count");
        if (v59 < 2 || v58 <= 1)
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "path");
            loga = v65;
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "path");
            v71 = (char *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "path");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "path");
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316162;
            v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
            v92 = 2112;
            v93 = v70;
            v94 = 2112;
            v95 = v71;
            v96 = 2112;
            v97 = v72;
            v98 = 2112;
            v99 = (uint64_t)v73;
            _os_log_impl(&dword_1A4BF6000, loga, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ with base %@ because real component counts don't make sense (reals %@ ; %@)",
              buf,
              0x34u);

            v65 = loga;
          }
        }
        else
        {
          v60 = v59;
          v61 = 1;
          objc_msgSend(v87, "objectAtIndexedSubscript:", 1);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v62, "isEqualToString:", CFSTR("private")))
            v61 = 2;

          objc_msgSend(v88, "objectAtIndexedSubscript:", 1);
          v82 = v58;
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v63, "isEqualToString:", CFSTR("private")))
            v64 = 2;
          else
            v64 = 1;

          if (v82 - v61 <= v60 - v64)
          {
            if (v82 <= v61)
            {
LABEL_65:

              goto LABEL_36;
            }
            while (1)
            {
              objc_msgSend(v87, "objectAtIndexedSubscript:", v61);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "objectAtIndexedSubscript:", v64);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              logb = objc_msgSend(v74, "isEqualToString:", v75);

              if ((logb & 1) == 0)
                break;
              ++v61;
              ++v64;
              if (v82 == v61)
                goto LABEL_65;
            }
            IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v6, "path");
              logc = (os_log_t)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "path");
              v81 = (char *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "path");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "path");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "objectAtIndexedSubscript:", v61);
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "objectAtIndexedSubscript:", v64);
              v77 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316674;
              v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
              v92 = 2112;
              v93 = logc;
              v94 = 2112;
              v95 = v81;
              v96 = 2112;
              v97 = v80;
              v98 = 2112;
              v99 = (uint64_t)v79;
              v100 = 2112;
              v101 = v76;
              v102 = 2112;
              v103 = v77;
              v78 = (void *)v77;
              _os_log_impl(&dword_1A4BF6000, v65, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ with base %@ (reals %@ ; %@) because components diverge at %@ != %@",
                buf,
                0x48u);

            }
          }
          else
          {
            IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v6, "path");
              log = (os_log_t)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "path");
              v66 = (char *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "path");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "path");
              v68 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316162;
              v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
              v92 = 2112;
              v93 = log;
              v94 = 2112;
              v95 = v66;
              v96 = 2112;
              v97 = v67;
              v98 = 2112;
              v99 = v68;
              v69 = (void *)v68;
              _os_log_impl(&dword_1A4BF6000, v65, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@ with base %@ because base component count is greater than child component count (reals %@ ; %@)",
                buf,
                0x34u);

            }
          }
        }

        goto LABEL_26;
      }
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "path");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
        v92 = 2112;
        v93 = v51;
        _os_log_impl(&dword_1A4BF6000, v50, OS_LOG_TYPE_DEFAULT, "%s: Failed to retrieve realpath for base path %@ ", buf, 0x16u);
LABEL_48:

        goto LABEL_49;
      }
      goto LABEL_49;
    }
    if (*__error() == 22 || *__error() == 2)
    {
      objc_msgSend(v6, "path");
      v36 = (char *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      goto LABEL_33;
    }
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v52 = __error();
    v53 = strerror(*v52);
    *(_DWORD *)buf = 136315394;
    v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    v92 = 2080;
    v93 = v53;
    v30 = "%s: Readlink failed: %s";
    v31 = v25;
    v32 = 22;
LABEL_14:
    _os_log_impl(&dword_1A4BF6000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    goto LABEL_23;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v91 = "-[IXFileManager realPathForURL:ifChildOfURL:]";
    v92 = 2112;
    v93 = v26;
    v27 = "%s: The suspicious path %@ contains '..' paths, which are invalid";
LABEL_11:
    v28 = v25;
    v29 = 22;
LABEL_21:
    _os_log_impl(&dword_1A4BF6000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
    goto LABEL_22;
  }
LABEL_23:

  v35 = 0;
  v36 = 0;
LABEL_24:
  v37 = 0;
LABEL_25:
  v38 = 0;
LABEL_26:
  v39 = 0;
LABEL_27:
  v40 = v39;

  return v40;
}

- (unint64_t)_diskUsageForDirectoryURL:(id)a3
{
  char *v3;
  void *v4;
  void *v5;
  int *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  char *v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  int *v18;
  int v19;
  char *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  int *v26;
  char *v27;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  int v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  int *v42;
  char *v43;
  NSObject *v44;
  int *v45;
  char *v46;
  void *v48;
  char *v49;
  int *v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  id v56;
  unint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  char *v64;
  __int16 v65;
  char *v66;
  __int16 v67;
  char *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = (char *)a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v60 = 0;
  v57 = 0xA200000900000005;
  v59 = 0x500000002;
  v6 = (int *)malloc_type_malloc(0x8000uLL, 0xD1AD82F4uLL);
  v49 = v3;
  objc_msgSend(v3, "path");
  v7 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v7;
  if (v7)
  {
    objc_msgSend(v5, "addObject:", v7);
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
      v63 = 2112;
      v64 = v49;
      _os_log_impl(&dword_1A4BF6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Failed to get path to url %@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v5, "count"))
  {
    v55 = 0;
    v53 = v4;
    v50 = v6;
    while (1)
    {
      v9 = (void *)MEMORY[0x1A85A5738]();
      objc_msgSend(v5, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectAtIndex:", 0);
      v56 = objc_retainAutorelease(v10);
      v11 = open((const char *)objc_msgSend(v56, "fileSystemRepresentation"), 1048832);
      if (v11 < 0)
      {
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          v42 = __error();
          v43 = strerror(*v42);
          *(_DWORD *)buf = 136315650;
          v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
          v63 = 2112;
          v64 = (char *)v56;
          v65 = 2080;
          v66 = v43;
          _os_log_impl(&dword_1A4BF6000, v41, OS_LOG_TYPE_DEFAULT, "%s: Failed to open directory %@ : %s", buf, 0x20u);
        }

      }
      else
      {
        v52 = v11;
        v51 = v9;
        v12 = 0;
LABEL_10:
        v6 = v50;
        while (1)
        {
          v13 = getattrlistbulk(v52, &v57, v50, 0x8000uLL, 0);
          if (v13 == -1)
            break;
          v14 = v13;
          if (!v13)
            goto LABEL_64;
          if (v13 >= 1)
          {
            while (1)
            {
              v16 = *v6;
              v15 = v6[1];
              v17 = v6[4];
              if ((v15 & 0x20000000) != 0)
              {
                if (v6[6])
                {
                  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    v26 = __error();
                    v27 = strerror(*v26);
                    *(_DWORD *)buf = 136315906;
                    v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    v63 = 2080;
                    v64 = v27;
                    v65 = 2048;
                    v66 = v12;
                    v67 = 2112;
                    v68 = (char *)v56;
                    v28 = v25;
                    v29 = "%s: Got error %s while processing entry %llu in %@";
                    v30 = 42;
                    goto LABEL_45;
                  }
LABEL_55:

                  goto LABEL_56;
                }
                v18 = v6 + 7;
                if ((v15 & 1) == 0)
                {
LABEL_16:
                  v19 = 0;
                  v20 = 0;
                  if ((v15 & 8) != 0)
                    goto LABEL_17;
                  goto LABEL_24;
                }
              }
              else
              {
                v18 = v6 + 6;
                if ((v15 & 1) == 0)
                  goto LABEL_16;
              }
              v19 = v18[1];
              v20 = (char *)v18 + *v18;
              v18 += 2;
              if ((v15 & 8) != 0)
              {
LABEL_17:
                v22 = *v18++;
                v21 = v22;
                if ((v15 & 0x2000000) != 0)
                  goto LABEL_18;
                goto LABEL_25;
              }
LABEL_24:
              v21 = 0;
              if ((v15 & 0x2000000) != 0)
              {
LABEL_18:
                v24 = *(_QWORD *)v18;
                v18 += 2;
                v23 = v24;
                goto LABEL_26;
              }
LABEL_25:
              v23 = 0;
LABEL_26:
              if (v21 == 2)
              {
                if ((v6[3] & 2) != 0 && !*v18)
                {
                  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315650;
                    v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    v63 = 2112;
                    v64 = (char *)v56;
                    v65 = 2080;
                    v66 = v20;
                    _os_log_debug_impl(&dword_1A4BF6000, v25, OS_LOG_TYPE_DEBUG, "%s: skipping empty directory at %@/%s", buf, 0x20u);
                  }
                  goto LABEL_55;
                }
                if (!v20)
                {
                  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  v25 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    v63 = 2048;
                    v64 = v12;
                    v65 = 2112;
                    v66 = (char *)v56;
                    v28 = v25;
                    v29 = "%s: Failed to get name for directory item %llu in %@; not counting its children";
                    v30 = 32;
LABEL_45:
                    _os_log_impl(&dword_1A4BF6000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
                  }
                  goto LABEL_55;
                }
                v31 = MEMORY[0x1A85A5738]();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFileSystemRepresentation:length:", v20, (v19 - 1));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "stringByAppendingPathComponent:", v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                if (v33)
                {
                  objc_msgSend(v5, "addObject:", v33);
                }
                else
                {
                  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  v40 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    v63 = 2080;
                    v64 = v20;
                    v65 = 2112;
                    v66 = (char *)v56;
                    _os_log_impl(&dword_1A4BF6000, v40, OS_LOG_TYPE_DEFAULT, "%s: Failed to create path to child directory by appending \"%s\" to %@", buf, 0x20u);
                  }

                }
                v39 = (void *)v31;
                goto LABEL_52;
              }
              if ((v17 & 1) != 0)
              {
                v36 = *v18++;
                v34 = v36;
                if ((v17 & 4) != 0)
                {
LABEL_34:
                  v35 = *(_QWORD *)v18;
                  goto LABEL_37;
                }
              }
              else
              {
                v34 = 0;
                if ((v17 & 4) != 0)
                  goto LABEL_34;
              }
              v35 = 0;
LABEL_37:
              if (v34 != 1)
              {
                v54 = MEMORY[0x1A85A5738]();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v23);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v53, "containsObject:", v37) & 1) != 0)
                {
                  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315650;
                    v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
                    v63 = 2112;
                    v64 = (char *)v56;
                    v65 = 2080;
                    v66 = v20;
                    _os_log_debug_impl(&dword_1A4BF6000, v38, OS_LOG_TYPE_DEBUG, "%s: Skipping hardlinked file at %@/%s", buf, 0x20u);
                  }

                }
                else
                {
                  v55 += v35;
                  objc_msgSend(v53, "addObject:", v37);
                }

                v39 = (void *)v54;
LABEL_52:
                objc_autoreleasePoolPop(v39);
                goto LABEL_56;
              }
              v55 += v35;
LABEL_56:
              v6 = (int *)((char *)v6 + v16);
              ++v12;
              if (!--v14)
                goto LABEL_10;
            }
          }
        }
        IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = __error();
          v46 = strerror(*v45);
          *(_DWORD *)buf = 136315906;
          v62 = "-[IXFileManager _diskUsageForDirectoryURL:]";
          v63 = 2048;
          v64 = v12;
          v65 = 2112;
          v66 = (char *)v56;
          v67 = 2080;
          v68 = v46;
          _os_log_impl(&dword_1A4BF6000, v44, OS_LOG_TYPE_DEFAULT, "%s: getattrlistbulk on entry %llu in %@ returned error %s", buf, 0x2Au);
        }

LABEL_64:
        close(v52);
        v4 = v53;
        v9 = v51;
      }

      objc_autoreleasePoolPop(v9);
      if (!objc_msgSend(v5, "count"))
        goto LABEL_68;
    }
  }
  v55 = 0;
LABEL_68:
  free(v6);

  return v55;
}

- (unint64_t)diskUsageForURL:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int *v7;
  char *v8;
  unint64_t v9;
  stat v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(&v11, 0, sizeof(v11));
  v4 = objc_retainAutorelease(a3);
  if (lstat((const char *)objc_msgSend(v4, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), &v11))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation");
      v7 = __error();
      v8 = strerror(*v7);
      *(_DWORD *)buf = 136315650;
      v13 = "-[IXFileManager diskUsageForURL:]";
      v14 = 2080;
      v15 = v6;
      v16 = 2080;
      v17 = v8;
      _os_log_impl(&dword_1A4BF6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to stat %s : %s", buf, 0x20u);
    }

    v9 = 0;
  }
  else if ((v11.st_mode & 0xF000) == 0x4000)
  {
    v9 = -[IXFileManager _diskUsageForDirectoryURL:](self, "_diskUsageForDirectoryURL:", v4);
  }
  else
  {
    v9 = v11.st_blocks << 9;
  }

  return v9;
}

- (void)_moveItemAtURL:(NSObject *)a3 toURL:failIfSrcMissing:error:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136315650;
  v7 = "-[IXFileManager _moveItemAtURL:toURL:failIfSrcMissing:error:]";
  v8 = 2112;
  v9 = v5;
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_1A4BF6000, a3, OS_LOG_TYPE_ERROR, "%s: Failed to remove move source after copy at %@ : %@", (uint8_t *)&v6, 0x20u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_removeACLAtPath:(void *)a1 isDir:error:.cold.1(void *a1)
{
  unint64_t v2;
  int *v3;
  char *v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v2 = *OUTLINED_FUNCTION_5();
  v3 = __error();
  v4 = OUTLINED_FUNCTION_6(v3);
  _CreateError((uint64_t)"-[IXFileManager _removeACLAtPath:isDir:error:]", 257, a1, v2, 0, 0, CFSTR("acl_init() failed: %s"), v5, (uint64_t)v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1A4BF6000, v6, v7, "%s: Failed to remove ACL : %@", v8, v9, v10, v11, v12, v13, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_removeACLAtPath:isDir:error:.cold.2()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint8_t v19;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  v1 = OUTLINED_FUNCTION_7_0();
  v18 = OUTLINED_FUNCTION_6(v1);
  OUTLINED_FUNCTION_3_0();
  _CreateError(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1A4BF6000, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);

  OUTLINED_FUNCTION_1_1();
}

- (void)_removeACLAtPath:isDir:error:.cold.3()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint8_t v19;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  v1 = OUTLINED_FUNCTION_7_0();
  v18 = OUTLINED_FUNCTION_6(v1);
  OUTLINED_FUNCTION_3_0();
  _CreateError(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1A4BF6000, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);

  OUTLINED_FUNCTION_1_1();
}

- (void)_removeACLAtPath:isDir:error:.cold.4()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint8_t v19;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  v1 = OUTLINED_FUNCTION_7_0();
  v18 = OUTLINED_FUNCTION_6(v1);
  OUTLINED_FUNCTION_3_0();
  _CreateError(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1A4BF6000, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);

  OUTLINED_FUNCTION_1_1();
}

- (void)_removeACLAtPath:isDir:error:.cold.5()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint8_t v19;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  v1 = OUTLINED_FUNCTION_7_0();
  v18 = OUTLINED_FUNCTION_6(v1);
  OUTLINED_FUNCTION_3_0();
  _CreateError(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1A4BF6000, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);

  OUTLINED_FUNCTION_1_1();
}

- (void)_removeACLAtPath:isDir:error:.cold.6()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint8_t v19;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  v1 = OUTLINED_FUNCTION_7_0();
  v18 = OUTLINED_FUNCTION_6(v1);
  OUTLINED_FUNCTION_3_0();
  _CreateError(v2, v3, v4, v5, v6, v7, v8, v9, v0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1A4BF6000, v11, v12, "%s: Failed to remove ACL : %@", v13, v14, v15, v16, v17, (uint64_t)v18, v19);

  OUTLINED_FUNCTION_1_1();
}

void __74__IXFileManager_copyACLFrom_toAllChildrenOfPath_ignoringCopyErrors_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[IXFileManager copyACLFrom:toAllChildrenOfPath:ignoringCopyErrors:error:]_block_invoke";
  v4 = 2080;
  v5 = a1;
  _os_log_debug_impl(&dword_1A4BF6000, a2, OS_LOG_TYPE_DEBUG, "%s: Writing ACL to %s", (uint8_t *)&v2, 0x16u);
}

@end
