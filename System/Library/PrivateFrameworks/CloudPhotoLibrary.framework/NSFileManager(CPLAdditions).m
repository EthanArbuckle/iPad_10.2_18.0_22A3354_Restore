@implementation NSFileManager(CPLAdditions)

- (BOOL)cplCopyItemAtURL:()CPLAdditions toURL:error:
{
  id v8;
  const char *v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v8);
  v11 = copyfile(v9, (const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0, 0x1200008u);
  if (v11)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v23 = *MEMORY[0x1E0CB2AD8];
    v24[0] = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v14 = objc_msgSend(a1, "setAttributes:ofItemAtPath:error:", v12, v13, &v18);
    v15 = v18;

    if ((v14 & 1) == 0 && !_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v10;
        v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
      }

    }
  }

  return v11 == 0;
}

- (uint64_t)cplMoveItemAtURL:()CPLAdditions toURL:error:
{
  id v8;
  id v9;
  id v10;
  const std::__fs::filesystem::path *v11;
  id v12;
  const std::__fs::filesystem::path *v13;
  std::error_code *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_retainAutorelease(v8);
  v11 = (const std::__fs::filesystem::path *)objc_msgSend(v10, "fileSystemRepresentation");
  v12 = objc_retainAutorelease(v9);
  v13 = (const std::__fs::filesystem::path *)objc_msgSend(v12, "fileSystemRepresentation");
  rename(v11, v13, v14);
  if (!v15)
    goto LABEL_5;
  if (*__error() != 18)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
      v21 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_13:
    v21 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(a1, "cplCopyItemAtURL:toURL:error:", v10, v12, a5))
    goto LABEL_13;
  objc_msgSend(a1, "removeItemAtURL:error:", v10, 0);
LABEL_5:
  v28 = *MEMORY[0x1E0CB2AD8];
  v29[0] = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v18 = objc_msgSend(a1, "setAttributes:ofItemAtPath:error:", v16, v17, &v23);
  v19 = v23;

  if ((v18 & 1) == 0 && !_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v12;
      v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
    }

  }
  v21 = 1;
LABEL_14:

  return v21;
}

- (BOOL)cplIsFileExistsError:()CPLAdditions
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v5 = objc_msgSend(v3, "code");

    if (v5 == 516)
    {
      v6 = 1;
      goto LABEL_9;
    }
  }
  else
  {

  }
  objc_msgSend(v3, "cplUnderlyingPOSIXError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v6 = objc_msgSend(v7, "code") == 17;
  else
    v6 = 0;

LABEL_9:
  return v6;
}

- (BOOL)cplIsFileDoesNotExistError:()CPLAdditions
{
  id v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {

    goto LABEL_5;
  }
  if (objc_msgSend(v3, "code") == 4)
  {
    v5 = 1;
LABEL_10:

    goto LABEL_11;
  }
  v7 = objc_msgSend(v3, "code");

  if (v7 != 260)
  {
LABEL_5:
    objc_msgSend(v3, "cplUnderlyingPOSIXError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
    if (v6)
      v5 = objc_msgSend(v6, "code") == 2;
    else
      v5 = 0;
    goto LABEL_10;
  }
  v5 = 1;
LABEL_11:

  return v5;
}

- (uint64_t)cplFileExistsAtURL:()CPLAdditions
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(a1, "fileExistsAtPath:", v4);

  return v5;
}

@end
