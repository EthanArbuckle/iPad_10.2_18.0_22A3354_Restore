@implementation NSURL(_QLUtilities)

- (id)ql_realpathURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;

  if (_CFURLIsItemPromiseAtURL())
  {
    objc_msgSend(a1, "_qlFastRealpathURL");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)_CFURLPromiseCopyPhysicalURL();
    v4 = v3;
    if (!v3 || v3 == a1)
    {
      objc_msgSend(a1, "_qlFastRealpathURL");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "_qlFastRealpathURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)_CFURLCopyLogicalURLOfPromiseAtURL();
        v7 = v6;
        if (!v6)
        {
          _log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            -[NSURL(_QLUtilities) ql_realpathURL].cold.2();

          v7 = v5;
        }
        v9 = v7;

      }
      else
      {
        _log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[NSURL(_QLUtilities) ql_realpathURL].cold.1();

        v9 = a1;
      }

    }
    return v9;
  }
}

- (id)_qlFastRealpathURL
{
  id v1;
  id v2;
  NSObject *v3;
  __int128 v5;
  uint64_t v6;
  _OWORD v7[65];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = xmmword_1AE428928;
  v6 = 0;
  memset(v7, 0, 512);
  v1 = objc_retainAutorelease(a1);
  if (getattrlist((const char *)objc_msgSend(v1, "fileSystemRepresentation", 0x800000800000005, 0, 0), &v5, v7, 0x410uLL, 0x20u) < 0)
  {
    _log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[NSURL(_QLUtilities) _qlFastRealpathURL].cold.1((uint64_t)v1, v3);

    v2 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", (char *)v7 + SDWORD2(v7[0]) + 8, DWORD1(v7[0]) == 2, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (uint64_t)_QLIsDataLess
{
  int v2;
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  stat v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "startAccessingSecurityScopedResource", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0);
  v3 = objc_retainAutorelease(a1);
  v4 = lstat((const char *)objc_msgSend(v3, "fileSystemRepresentation"), &v9);
  if (v2)
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");
  if (v4)
  {
    _log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = *__error();
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 1024;
      v13 = v7;
      v6 = 1;
      _os_log_impl(&dword_1AE3F5000, v5, OS_LOG_TYPE_INFO, "stat for %@ failed with errno %{darwin.errno}d; returning YES for _QLIsDataLess",
        buf,
        0x12u);
    }
  }
  else
  {
    v6 = (v9.st_flags >> 30) & 1;
    _log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[NSURL(_QLUtilities) _QLIsDataLess].cold.1();
  }

  return v6;
}

- (uint64_t)_QLNeedsCoordination
{
  uint64_t v1;
  id v2;
  void *v3;
  id v5;

  v5 = 0;
  v1 = objc_msgSend(a1, "getPromisedItemResourceValue:forKey:error:", &v5, *MEMORY[0x1E0C99A38], 0);
  v2 = v5;
  v3 = v2;
  if ((_DWORD)v1)
    v1 = objc_msgSend(v2, "BOOLValue");

  return v1;
}

- (BOOL)_QLIsThumbnailableWithError:()_QLUtilities
{
  int v5;
  id v6;
  int v7;
  _BOOL8 v8;
  NSObject *v9;
  int v10;
  int v11;
  _BOOL8 v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  stat v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  int v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  memset(&v20, 0, sizeof(v20));
  v5 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
  v6 = objc_retainAutorelease(a1);
  v7 = lstat((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v20);
  v8 = v7 != 0;
  if (v5)
    objc_msgSend(v6, "stopAccessingSecurityScopedResource");
  if (v7)
  {
    _log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *__error();
      *(_DWORD *)buf = 138412546;
      v22 = v6;
      v23 = 1024;
      v24 = v10;
      _os_log_impl(&dword_1AE3F5000, v9, OS_LOG_TYPE_INFO, "stat for %@ failed with errno %{darwin.errno}d; returning YES for _QLIsThumbnailable",
        buf,
        0x12u);
    }
LABEL_21:

    return v8;
  }
  v11 = v20.st_mode & 0xF000;
  v13 = v11 == 0x8000 || v11 == 0x4000;
  _log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[NSURL(_QLUtilities) _QLIsThumbnailableWithError:].cold.2();

  if (a3)
    v15 = v13;
  else
    v15 = 1;
  if ((v15 & 1) == 0)
  {
    _log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[NSURL(_QLUtilities) _QLIsThumbnailableWithError:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot thumbnail %@ which is not a regular file"), v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2938];
    v26[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), 4, v18);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  return v13;
}

- (uint64_t)_QLNeedsDownload
{
  int v2;
  id v3;
  int v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  stat v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "startAccessingSecurityScopedResource");
  memset(&v9, 0, sizeof(v9));
  v3 = objc_retainAutorelease(a1);
  v4 = lstat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
         &v9);
  if (v2)
    objc_msgSend(v3, "stopAccessingSecurityScopedResource");
  if (v4)
  {
    _log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = 1;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = *__error();
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 1024;
      v13 = v7;
      v6 = 1;
      _os_log_impl(&dword_1AE3F5000, v5, OS_LOG_TYPE_INFO, "stat for %@ failed with errno %{darwin.errno}d; returning YES for _QLNeedsDownload",
        buf,
        0x12u);
    }
  }
  else
  {
    v6 = (v9.st_flags >> 30) & 1;
    _log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[NSURL(_QLUtilities) _QLNeedsDownload].cold.1();
  }

  return v6;
}

- (id)_QLFileSize
{
  uint64_t v1;
  char v2;
  id v3;
  id v4;
  NSObject *v5;
  id v7;
  id v8;

  v8 = 0;
  v1 = *MEMORY[0x1E0C99998];
  v7 = 0;
  v2 = objc_msgSend(a1, "getPromisedItemResourceValue:forKey:error:", &v8, v1, &v7);
  v3 = v8;
  v4 = v7;
  if ((v2 & 1) == 0)
  {
    _log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[NSURL(_QLUtilities) _QLFileSize].cold.1();

  }
  return v3;
}

- (id)_QLUrlFileSize
{
  void *v1;
  uint64_t v2;
  char v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  NSObject *v24;
  void *v25;
  void *v27;
  uint64_t v28;
  id obj;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  _QWORD v43[4];

  v1 = a1;
  v43[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "_QLNeedsDownload") & 1) != 0)
    goto LABEL_25;
  v37 = 0;
  v2 = *MEMORY[0x1E0C999D0];
  v36 = 0;
  v28 = v2;
  v3 = objc_msgSend(v1, "getResourceValue:forKey:error:", &v37);
  v4 = v37;
  v5 = 0;
  if ((v3 & 1) == 0)
  {
    _log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[NSURL(_QLUtilities) _QLUrlFileSize].cold.1();

    goto LABEL_24;
  }
  if (!objc_msgSend(v4, "BOOLValue"))
  {
LABEL_24:

LABEL_25:
    objc_msgSend(v1, "_QLFileSize");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    return v25;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C99998];
  v43[0] = v28;
  v43[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v1;
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v1, v8, 0, &__block_literal_global_12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v33;
    do
    {
      v14 = 0;
      v15 = v5;
      v16 = v4;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
        v30 = 0;
        v31 = 0;
        v18 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v31, v28, &v30);
        v4 = v31;

        v5 = v30;
        if ((v18 & 1) == 0)
        {
          _log();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v39 = v17;
            v40 = 2112;
            v41 = v5;
            _os_log_error_impl(&dword_1AE3F5000, v19, OS_LOG_TYPE_ERROR, "Failed to determine if the url(%@) is a directory error: %@", buf, 0x16u);
          }

        }
        objc_msgSend(v17, "_QLFileSize");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "unsignedLongLongValue");
        v22 = objc_msgSend(v4, "BOOLValue");
        if (v20)
          v23 = v22 == 0;
        else
          v23 = 1;
        if (!v23)
          objc_msgSend(obj, "skipDescendants");
        v12 += v21;

        ++v14;
        v15 = v5;
        v16 = v4;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = v27;
  if (!v25)
    goto LABEL_25;
  return v25;
}

- (id)_QLIssueFileExtensionWithSandboxType:()_QLUtilities
{
  uint64_t v1;
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  v1 = sandbox_extension_issue_file();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v1, 4);
    free(v2);
  }
  else
  {
    _log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[NSURL(_QLUtilities) _QLIssueFileExtensionWithSandboxType:].cold.1();

    v3 = 0;
  }
  return v3;
}

+ (id)_QLTemporaryURLWithExtension:()_QLUtilities openingFileHandle:inDirectoryAtURL:
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  char *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;

  v7 = a3;
  v8 = a5;
  if (v8)
  {
    if (v7)
    {
LABEL_3:
      objc_msgSend(CFSTR("QuickLookThumbnailing.XXXXX"), "stringByAppendingPathExtension:", v7);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileURLWithPath:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_3;
  }
  v9 = CFSTR("QuickLookThumbnailing.XXXXX");
LABEL_6:
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v9, 0);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = strdup((const char *)objc_msgSend(v12, "fileSystemRepresentation"));
  if (v7)
    v14 = objc_msgSend(v7, "length") + 1;
  else
    v14 = 0;
  v15 = mkstemps(v13, v14);
  if (v15 < 0)
  {
    _log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[NSURL(_QLUtilities) _QLTemporaryURLWithExtension:openingFileHandle:inDirectoryAtURL:].cold.1((uint64_t)v13, v16);

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v13, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  free(v13);
  if (a4)
    *a4 = v15;
  else
    close(v15);

  return v17;
}

+ (id)_QLCreateTemporaryReplacementURLForOriginalFileAtURL:()_QLUtilities withExtension:temporaryDirectoryURL:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  char *v14;
  int v15;
  void *v16;
  NSObject *v17;
  id v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v9, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v7, 1, &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;

  if (!v10)
  {
    _log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[NSURL(_QLUtilities) _QLCreateTemporaryReplacementURLForOriginalFileAtURL:withExtension:temporaryDirectoryURL:].cold.1();
    goto LABEL_13;
  }
  if (v8)
  {
    objc_msgSend(CFSTR("thumbnailXXXXXX"), "stringByAppendingPathExtension:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("thumbnailXXXXXX");
  }
  objc_msgSend(v10, "URLByAppendingPathComponent:", v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = strdup((const char *)objc_msgSend(v13, "fileSystemRepresentation"));

  v15 = mkstemps(v14, objc_msgSend(v8, "length") + 1);
  if (v15 < 0)
  {
    _log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[NSURL(_QLUtilities) _QLCreateTemporaryReplacementURLForOriginalFileAtURL:withExtension:temporaryDirectoryURL:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB3620], "_QLTRemoveTemporaryDirectoryAtURL:", v10);
    free(v14);
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  close(v15);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v14, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  free(v14);
  if (a5)
    *a5 = objc_retainAutorelease(v10);
LABEL_14:

  return v16;
}

- (void)_QLIsDataLess
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_0(&dword_1AE3F5000, v0, v1, "stat for %@ succeeded; dataless = %d");
  OUTLINED_FUNCTION_2();
}

- (void)_QLIsThumbnailableWithError:()_QLUtilities .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Cannot thumbnail %@ which is not a regular file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_QLIsThumbnailableWithError:()_QLUtilities .cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_0(&dword_1AE3F5000, v0, v1, "stat for %@ succeeded; thumbnailable = %d");
  OUTLINED_FUNCTION_2();
}

- (void)_QLNeedsDownload
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_4_0(&dword_1AE3F5000, v0, v1, "stat for %@ succeeded; downloaded = %d");
  OUTLINED_FUNCTION_2();
}

- (void)_QLFileSize
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Error getting the size of file(%@) with error (%@)");
  OUTLINED_FUNCTION_2();
}

- (void)_QLUrlFileSize
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Failed to determine if the url(%@) is a directory error:%@");
  OUTLINED_FUNCTION_2();
}

- (void)_QLIssueFileExtensionWithSandboxType:()_QLUtilities .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Couldn't issue file extension for url: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_QLTemporaryURLWithExtension:()_QLUtilities openingFileHandle:inDirectoryAtURL:.cold.1(uint64_t a1, NSObject *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = 136315394;
  v6 = a1;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_1AE3F5000, a2, OS_LOG_TYPE_ERROR, "Could not make temporary file at %s: %{darwin.errno}d", (uint8_t *)&v5, 0x12u);
}

+ (void)_QLCreateTemporaryReplacementURLForOriginalFileAtURL:()_QLUtilities withExtension:temporaryDirectoryURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Could not create temporary directory on the same voume as %@. URLForDirectory failed with error: %@");
  OUTLINED_FUNCTION_2();
}

+ (void)_QLCreateTemporaryReplacementURLForOriginalFileAtURL:()_QLUtilities withExtension:temporaryDirectoryURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Could not create temporary file on the same volume as %@: mkstemps failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_qlFastRealpathURL
{
  int v4;
  int *v5;
  char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = __error();
  v6 = strerror(*v5);
  v7 = 138412802;
  v8 = a1;
  v9 = 1024;
  v10 = v4;
  v11 = 2080;
  v12 = v6;
  _os_log_error_impl(&dword_1AE3F5000, a2, OS_LOG_TYPE_ERROR, "getattrlist() failed for %@: %d (%s)", (uint8_t *)&v7, 0x1Cu);
}

- (void)ql_realpathURL
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Can't copy logical URL for %@: %@");
  OUTLINED_FUNCTION_2();
}

@end
