@implementation NSFileManager(TempFilesAdditions)

- (id)brc_createTemporarySubdirectoryOfItem:()TempFilesAdditions withTemplate:error:
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v17;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  char v26[1024];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v26[0] = 0;
  v9 = objc_retainAutorelease(v7);
  v10 = open((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 33028);
  if ((v10 & 0x80000000) == 0 && (__pthread_fchdir() & 0x80000000) == 0)
  {
    if ((objc_msgSend(v8, "getFileSystemRepresentation:maxLength:", v26, 1024) & 1) != 0)
    {
      if (mkdtemp(v26))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          goto LABEL_14;
      }
    }
    else
    {
      *__error() = 63;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    brc_bread_crumbs((uint64_t)"-[NSFileManager(TempFilesAdditions) brc_createTemporarySubdirectoryOfItem:withTemplate:error:]", 49);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      v17 = "(passed to caller)";
      v18 = 136315906;
      v19 = "-[NSFileManager(TempFilesAdditions) brc_createTemporarySubdirectoryOfItem:withTemplate:error:]";
      v20 = 2080;
      if (!a5)
        v17 = "(ignored by caller)";
      v21 = v17;
      v22 = 2112;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      _os_log_error_impl(&dword_19CBF0000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v18, 0x2Au);
    }

  }
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  v12 = 0;
LABEL_14:
  if (v10 >= 1)
    close(v10);

  return v12;
}

- (uint64_t)brc_createTemporaryFdInDirectory:()TempFilesAdditions withTemplate:error:
{
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v10;
  unsigned int v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = -1;
  if ((_mkstempWrapper(a1, a3, a4, &v11, 0) & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      brc_bread_crumbs((uint64_t)"-[NSFileManager(TempFilesAdditions) brc_createTemporaryFdInDirectory:withTemplate:error:]", 96);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      {
        v10 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v13 = "-[NSFileManager(TempFilesAdditions) brc_createTemporaryFdInDirectory:withTemplate:error:]";
        v14 = 2080;
        if (!a5)
          v10 = "(ignored by caller)";
        v15 = v10;
        v16 = 2112;
        v17 = v6;
        v18 = 2112;
        v19 = v7;
        _os_log_error_impl(&dword_19CBF0000, v8, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v6);

  }
  return v11;
}

- (id)brc_createTemporaryFileInDirectory:()TempFilesAdditions withTemplate:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v16 = 0;
  LODWORD(a1) = _mkstempWrapper(a1, v8, a4, 0, &v16);
  v9 = v16;
  if ((a1 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      brc_bread_crumbs((uint64_t)"-[NSFileManager(TempFilesAdditions) brc_createTemporaryFileInDirectory:withTemplate:error:]", 107);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
      {
        v15 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v18 = "-[NSFileManager(TempFilesAdditions) brc_createTemporaryFileInDirectory:withTemplate:error:]";
        v19 = 2080;
        if (!a5)
          v15 = "(ignored by caller)";
        v20 = v15;
        v21 = 2112;
        v22 = v11;
        v23 = 2112;
        v24 = v12;
        _os_log_error_impl(&dword_19CBF0000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v11);

    v10 = 0;
  }
  else
  {
    objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
