@implementation DEUtils

+ (unint64_t)getFileSystemItemSize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  id v15;
  id v16;
  char v17;

  v4 = a3;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v17);

  if ((v7 & 1) != 0)
  {
    if (v17)
    {
      v8 = objc_msgSend(a1, "getDirectorySize:", v4);
    }
    else
    {
      v16 = 0;
      v10 = *MEMORY[0x1E0C99998];
      v15 = 0;
      objc_msgSend(v4, "getResourceValue:forKey:error:", &v16, v10, &v15);
      v11 = v16;
      v12 = v15;
      if (v12 || !v11)
      {
        Log_3();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          +[DEUtils getFileSystemItemSize:].cold.1();

        v8 = 0;
      }
      else
      {
        v8 = objc_msgSend(v11, "unsignedIntegerValue");
      }

    }
  }
  else
  {
    Log_3();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[DEUtils getFileSystemItemSize:].cold.2(v4, v9);

    v8 = 0;
  }

  return v8;
}

+ (unint64_t)getDirectorySize:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  BOOL v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  id v22;
  BOOL v23;
  id v24;
  NSObject *v25;
  id v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  unsigned __int8 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  _QWORD v52[4];

  v52[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v46 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v46);
  v7 = v46;

  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    Log_3();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[DEUtils getDirectorySize:].cold.1(v3, v15);
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C999D0];
    v12 = *MEMORY[0x1E0C99998];
    v52[0] = *MEMORY[0x1E0C999D0];
    v52[1] = v12;
    v36 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v3;
    objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v13, 0, &__block_literal_global_44);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v15 = v14;
    v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v16)
    {
      v17 = v16;
      v37 = 0;
      v18 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v43 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          v40 = 0;
          v41 = 0;
          objc_msgSend(v20, "getResourceValue:forKey:error:", &v41, v11, &v40);
          v21 = v41;
          v22 = v40;
          if (v22)
            v23 = 1;
          else
            v23 = v21 == 0;
          if (v23)
          {
            v24 = v22;
            Log_3();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v20, "path");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v48 = v29;
              v49 = 2114;
              v50 = v24;
              _os_log_error_impl(&dword_1A4EEE000, v25, OS_LOG_TYPE_ERROR, "Could not get isDir for file [%{public}@] with error [%{public}@]", buf, 0x16u);

            }
            v26 = 0;
          }
          else
          {
            v27 = objc_msgSend(v21, "BOOLValue");
            if ((v27 & 1) != 0)
            {
              v26 = 0;
              v24 = 0;
            }
            else
            {
              v38 = 0;
              v39 = 0;
              objc_msgSend(v20, "getResourceValue:forKey:error:", &v39, v36, &v38);
              v26 = v39;
              v24 = v38;
              if (v24 || !v26)
              {
                Log_3();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v20, "path");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v48 = v30;
                  v49 = 2114;
                  v50 = v24;
                  _os_log_error_impl(&dword_1A4EEE000, v28, OS_LOG_TYPE_ERROR, "Could not get file size for file [%{public}@] with error [%{public}@]", buf, 0x16u);

                }
              }
              else
              {
                v24 = 0;
                v37 += objc_msgSend(v26, "unsignedIntegerValue");
              }
            }
          }

        }
        v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v17);
    }
    else
    {
      v37 = 0;
    }

    Log_3();
    v31 = objc_claimAutoreleasedReturnValue();
    v3 = v35;
    v9 = v37;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v35, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v37, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v32;
      v49 = 2114;
      v50 = v33;
      _os_log_impl(&dword_1A4EEE000, v31, OS_LOG_TYPE_INFO, "[%{public}@] size: [%{public}@]", buf, 0x16u);

    }
  }

  return v9;
}

uint64_t __28__DEUtils_getDirectorySize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  Log_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __28__DEUtils_getDirectorySize___block_invoke_cold_1();

  return 1;
}

+ (void)excludeFromBackup:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C999D8];
  v9 = 0;
  v6 = objc_msgSend(v3, "setResourceValue:forKey:error:", v4, v5, &v9);
  v7 = v9;

  if ((v6 & 1) == 0)
  {
    Log_3();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[DEUtils excludeFromBackup:].cold.1(v3);

  }
}

+ (id)tarGzForDirectoryUrl:(id)a3
{
  return (id)objc_msgSend(a1, "tarGzForDirectoryUrl:validatesUrl:", a3, 1);
}

+ (id)tarGzForDirectoryUrl:(id)a3 validatesUrl:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a4;
  v6 = a3;
  Log_3();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[DEUtils tarGzForDirectoryUrl:validatesUrl:].cold.1();

  if (v4)
    v8 = objc_msgSend(a1, "isValidDirectory:", v6);
  else
    v8 = 1;
  v9 = 0;
  if (v6 && v8)
  {
    objc_msgSend(v6, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("tar.gz"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)dirForTarGz:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "path"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".tar.gz"), CFSTR("/"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isValidDirectory:(id)a3
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    Log_3();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[DEUtils isValidDirectory:].cold.1(v6, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_12;
  }
  if ((objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    Log_3();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[DEUtils isValidDirectory:].cold.3();
LABEL_12:
    v15 = 0;
    goto LABEL_13;
  }
  v24 = 0;
  v5 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v24, *MEMORY[0x1E0C999D0], 0);
  v6 = v24;
  if ((v5 & 1) == 0)
  {
    Log_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[DEUtils isValidDirectory:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  v15 = -[NSObject BOOLValue](v6, "BOOLValue");
LABEL_13:

  return v15;
}

+ (BOOL)copyAllFilesFromDir:(id)a3 toDir:(id)a4 keepSourceDir:(BOOL)a5
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char v27;
  NSObject *v28;
  char v29;
  const __CFString *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  id obj;
  char v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _BOOL4 v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[4];
  uint64_t v54;
  uint8_t v55[128];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  const __CFString *v61;
  uint64_t v62;

  v42 = a5;
  v62 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v43 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v7;
  +[DEUtils enumeratorForAllItems:](DEUtils, "enumeratorForAllItems:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  Log_3();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v31 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v57 = v44;
    v58 = 2112;
    if (v42)
      v31 = CFSTR("YES");
    v59 = v43;
    v60 = 2112;
    v61 = v31;
    _os_log_debug_impl(&dword_1A4EEE000, v9, OS_LOG_TYPE_DEBUG, "copying files from [%@] to [%@], keeping source dir? [%@]", buf, 0x20u);
  }

  if (v8)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v8;
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v45)
    {
      v32 = v8;
      v36 = 0;
      v10 = 0;
      v40 = *(_QWORD *)v50;
      v41 = 0;
      v39 = *MEMORY[0x1E0C999D0];
      v38 = a1;
      while (1)
      {
        v11 = 0;
        v12 = v10;
        do
        {
          if (*(_QWORD *)v50 != v40)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v11);
          v14 = (void *)MEMORY[0x1A85AB568]();
          objc_msgSend(a1, "pathComponentsInURL:removingBaseURLComponents:keepingFirstComponent:", v13, v44, v42);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "pathComponents");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v16);
          objc_msgSend(v17, "addObjectsFromArray:", v15);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "URLByDeletingLastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v18, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
            v19 = (id)objc_msgSend(a1, "createDirectoryWithClassCDataProtection:", v18);
          v48 = 0;
          objc_msgSend(v13, "getResourceValue:forKey:error:", &v48, v39, 0);
          v20 = v48;
          if (!objc_msgSend(v20, "BOOLValue"))
          {
            v46 = v14;
            v47 = 0;
            objc_msgSend(v34, "copyItemAtURL:toURL:error:", v13, v10, &v47);
            v22 = v47;
            if (v22)
            {
              Log_3();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v13, "path");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "path");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject localizedDescription](v22, "localizedDescription");
                v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v57 = v37;
                v58 = 2114;
                v59 = v24;
                v60 = 2114;
                v61 = v33;
                _os_log_error_impl(&dword_1A4EEE000, v23, OS_LOG_TYPE_ERROR, "Failed to copy file [%{public}@] to [%{public}@] error [%{public}@]", buf, 0x20u);

              }
              v36 = 1;
LABEL_19:
              a1 = v38;
            }

            v14 = v46;
            goto LABEL_21;
          }
          objc_msgSend(a1, "createDirectoryWithClassCDataProtection:", v10);
          v21 = objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v46 = v14;
            Log_3();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              +[DEUtils copyAllFilesFromDir:toDir:keepSourceDir:].cold.2(v53, v10, &v54, v22);
            v36 = 1;
            v41 = (void *)v21;
            goto LABEL_19;
          }
          v41 = 0;
          a1 = v38;
LABEL_21:

          objc_autoreleasePoolPop(v14);
          ++v11;
          v12 = v10;
        }
        while (v45 != v11);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        v45 = v25;
        if (!v25)
        {

          v8 = v32;
          v26 = v41;
          v27 = v36;
          goto LABEL_30;
        }
      }
    }
    v27 = 0;
    v26 = 0;
LABEL_30:

    v29 = v27 ^ 1;
  }
  else
  {
    Log_3();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      +[DEUtils copyAllFilesFromDir:toDir:keepSourceDir:].cold.1();

    v26 = 0;
    v29 = 0;
  }

  return v29 & 1;
}

+ (id)copyItem:(id)a3 toDestinationDir:(id)a4 zipped:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  _BYTE v24[24];
  uint64_t v25;

  v5 = a5;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    v12 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, 0);
    Log_3();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v24 = 138412290;
        *(_QWORD *)&v24[4] = v8;
        _os_log_impl(&dword_1A4EEE000, v14, OS_LOG_TYPE_DEFAULT, "Created folder [%@]", v24, 0xCu);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      +[DEUtils copyItem:toDestinationDir:zipped:].cold.3();
    }

  }
  v24[0] = 0;
  objc_msgSend(v7, "path", *(_QWORD *)v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v15, v24);
  v17 = v24[0];

  if (v16 && v17)
  {
    if (!+[DEUtils copyAllFilesFromDir:toDir:keepSourceDir:](DEUtils, "copyAllFilesFromDir:toDir:keepSourceDir:", v7, v10, 0))goto LABEL_11;
LABEL_16:
    Log_3();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      +[DEUtils copyItem:toDestinationDir:zipped:].cold.1();

    goto LABEL_19;
  }
  v20 = +[DEUtils copyAndReturn:toDir:](DEUtils, "copyAndReturn:toDir:", v7, v8);

  if (v20)
    goto LABEL_16;
LABEL_11:
  Log_3();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    +[DEUtils copyItem:toDestinationDir:zipped:].cold.2(v7, v8);

  if (!v24[0])
  {
    v19 = 0;
    goto LABEL_25;
  }
LABEL_19:
  if (v5)
  {
    if (v24[0])
      +[DEArchiver archiveDirectoryAt:](DEArchiver, "archiveDirectoryAt:", v10);
    else
      +[DEArchiver archiveFile:](DEArchiver, "archiveFile:", v10);
    v22 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v22;
  }
  v10 = v10;
  v19 = v10;
LABEL_25:

  return v19;
}

+ (id)moveItem:(id)a3 toDestinationDir:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  Log_3();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v17 = "+[DEUtils moveItem:toDestinationDir:]";
    v18 = 2114;
    v19 = v5;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_1A4EEE000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s [%{public}@] [%{public}@]", buf, 0x20u);
  }

  objc_msgSend(v5, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v10, "moveItemAtURL:toURL:error:", v5, v9, &v15);
  v11 = v15;

  if (v11)
  {
    Log_3();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "+[DEUtils moveItem:toDestinationDir:]";
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1A4EEE000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s error [%{public}@]", buf, 0x16u);
    }

    v13 = 0;
  }
  else
  {
    v13 = v9;
  }

  return v13;
}

+ (BOOL)copyFile:(id)a3 toDir:(id)a4
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_msgSend(a1, "copyAndReturn:toDir:", a3, a4);
  v5 = v4 != 0;

  return v5;
}

+ (id)copyAndReturn:(id)a3 toDir:(id)a4 withNewFileName:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v7, "getResourceValue:forKey:error:", &v22, *MEMORY[0x1E0C999D0], 0);
  v11 = v22;
  if (objc_msgSend(v11, "BOOLValue"))
  {
    Log_3();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[DEUtils copyAndReturn:toDir:withNewFileName:].cold.1(v7, v12);
    v13 = 0;
  }
  else
  {
    objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v10, "copyItemAtURL:toURL:error:", v7, v12, &v21);
    v13 = v21;
    if (!v13)
    {
      v12 = v12;
      v15 = v12;
      goto LABEL_10;
    }
    Log_3();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject path](v12, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v18 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v20;
      v25 = 2114;
      v26 = v17;
      v27 = 2114;
      v28 = v18;
      v19 = (void *)v18;
      _os_log_error_impl(&dword_1A4EEE000, v14, OS_LOG_TYPE_ERROR, "Failed to copy file [%{public}@] to [%{public}@] error [%{public}@]", buf, 0x20u);

    }
  }
  v15 = 0;
LABEL_10:

  return v15;
}

+ (id)copyAndReturn:(id)a3 toDir:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v20, *MEMORY[0x1E0C999D0], 0);
  v8 = v20;
  if (objc_msgSend(v8, "BOOLValue"))
  {
    Log_3();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[DEUtils copyAndReturn:toDir:withNewFileName:].cold.1(v5, v9);
    v10 = 0;
    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "lastPathComponent");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v7, "copyItemAtURL:toURL:error:", v5, v12, &v19);
    v10 = v19;
    if (v10)
    {
      Log_3();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedDescription");
        v16 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v22 = v18;
        v23 = 2114;
        v24 = v15;
        v25 = 2114;
        v26 = v16;
        v17 = (void *)v16;
        _os_log_error_impl(&dword_1A4EEE000, v13, OS_LOG_TYPE_ERROR, "Failed to copy file [%{public}@] to [%{public}@] error [%{public}@]", buf, 0x20u);

      }
      v11 = 0;
    }
    else
    {
      v11 = v12;
    }

  }
  return v11;
}

+ (BOOL)copyAllFilesFromDir:(id)a3 toDir:(id)a4
{
  return objc_msgSend(a1, "copyAllFilesFromDir:toDir:keepSourceDir:", a3, a4, 0);
}

+ (id)pathComponentsInURL:(id)a3 removingBaseURLComponents:(id)a4 keepingFirstComponent:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a5;
  v7 = a4;
  objc_msgSend(a3, "URLByResolvingSymlinksInPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByStandardizingPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByResolvingSymlinksInPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByStandardizingPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pathComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = v13 - v5;
  v15 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v9, "pathComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "removeObjectsInRange:", 0, v14);
  return v17;
}

+ (id)componentsByRemovingComponentsBeforeComponent:(id)a3 sourceURL:(id)a4 keepingComponent:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  v5 = a5;
  v7 = a3;
  objc_msgSend(a4, "pathComponents");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  v10 = v8;
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v9 + !v5;
    v10 = v8;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = v8;
      if (v11 < objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "subarrayWithRange:", v11, objc_msgSend(v8, "count") - v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v10;
}

+ (id)urlByRemovingComponentsBefore:(id)a3 source:(id)a4 keepComponent:(BOOL)a5
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "componentsByRemovingComponentsBeforeComponent:sourceURL:keepingComponent:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "escape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)enumeratorForAllItems:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C999D0];
  v10[0] = *MEMORY[0x1E0C99A90];
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, v7, 4, &__block_literal_global_61);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __33__DEUtils_enumeratorForAllItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  Log_3();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1A4EEE000, v6, OS_LOG_TYPE_INFO, "Error [%{public}@] enumerating url [%{public}@]", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

+ (id)findAllItems:(id)a3 includeDirs:(BOOL)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "enumeratorForAllItems:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v22;
    v12 = *MEMORY[0x1E0C999D0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);

        v19 = 0;
        v20 = 0;
        objc_msgSend(v14, "getResourceValue:forKey:error:", &v20, v12, &v19);
        v9 = v20;
        v10 = v19;
        if (v10)
        {
          Log_3();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v26 = v10;
            v27 = 2112;
            v28 = v14;
            _os_log_impl(&dword_1A4EEE000, v15, OS_LOG_TYPE_INFO, "Error [%@] getting NSURLIsDirectoryKey for url [%@]", buf, 0x16u);
          }

        }
        else if (a4 || (objc_msgSend(v9, "BOOLValue") & 1) == 0)
        {
          objc_msgSend(v18, "addObject:", v14);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v8);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v18, 1);

  return v16;
}

+ (id)findAllfiles:(id)a3
{
  return (id)objc_msgSend(a1, "findAllItems:includeDirs:", a3, 0);
}

+ (id)lsDir:(id)a3 sorted:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint64_t v19;
  _QWORD v20[3];

  v4 = a4;
  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = *MEMORY[0x1E0C999D0];
    v20[0] = *MEMORY[0x1E0C998D8];
    v20[1] = v7;
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = v20;
    v10 = 2;
  }
  else
  {
    v19 = *MEMORY[0x1E0C999D0];
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = &v19;
    v10 = 1;
  }
  objc_msgSend(v8, "arrayWithObjects:count:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, v11, 4, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  if (v13 || !v12)
  {
    Log_3();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[DEUtils lsDir:sorted:].cold.1();

    v16 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    if (v4)
    {
      objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_63);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v12;
    }
    v16 = v14;
  }

  return v16;
}

uint64_t __24__DEUtils_lsDir_sorted___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v18 = 0;
  v6 = *MEMORY[0x1E0C998D8];
  v17 = 0;
  objc_msgSend(v4, "getResourceValue:forKey:error:", &v18, v6, &v17);
  v7 = v18;
  v8 = v17;
  if (v8)
  {
    Log_3();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_1A4EEE000, v9, OS_LOG_TYPE_INFO, "failed to get [%@] modifcation date", buf, 0xCu);
    }

  }
  v15 = 0;
  v16 = 0;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v16, v6, &v15);
  v10 = v16;
  v11 = v15;

  if (v11)
  {
    Log_3();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1A4EEE000, v12, OS_LOG_TYPE_INFO, "failed to get [%@] modifcation date", buf, 0xCu);
    }

  }
  v13 = objc_msgSend(v10, "compare:", v7);

  return v13;
}

+ (id)lsDir:(id)a3
{
  return (id)objc_msgSend(a1, "lsDir:sorted:", a3, 0);
}

+ (id)userLibraryDirectoryForApp:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v12[16];

  v3 = a3;
  if (v3)
  {
    if (!getuid())
    {
      Log_3();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1A4EEE000, v4, OS_LOG_TYPE_INFO, "WARNING: running as root, user directory be under root domain", v12, 2u);
      }

    }
    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "count"))
    {
      v7 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fileURLWithPath:isDirectory:", v8, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v3, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)applicationSupportDirectoryForApp:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v12[16];

  v3 = a3;
  if (!getuid())
  {
    Log_3();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A4EEE000, v4, OS_LOG_TYPE_INFO, "WARNING: running as root, user directory be under root domain", v12, 2u);
    }

  }
  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:isDirectory:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v3, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)createUserOwnedDirectoryAtUrl:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  uint8_t buf[8];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!getuid())
  {
    Log_3();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4EEE000, v4, OS_LOG_TYPE_INFO, "WARNING: running as root, user directory will be owned by root", buf, 2u);
    }

  }
  v13[0] = *MEMORY[0x1E0CB2A98];
  NSUserName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = *MEMORY[0x1E0CB2A58];
  NSUserName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, v7, &v11);

  v9 = v11;
  return v9;
}

+ (id)createDirectoryWithClassCDataProtection:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  id v13;
  uint8_t buf[8];
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!getuid())
  {
    Log_3();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4EEE000, v4, OS_LOG_TYPE_INFO, "WARNING: running as root, directory will be owned by root", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v13);
  v6 = v13;

  if (!v6)
  {
    Log_3();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      +[DEUtils createDirectoryWithClassCDataProtection:].cold.2(v3);

    v15 = *MEMORY[0x1E0C99938];
    v16[0] = *MEMORY[0x1E0C99928];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v3, "setResourceValues:error:", v8, &v12);
    v9 = v12;

    if (v9)
    {
      Log_3();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[DEUtils createDirectoryWithClassCDataProtection:].cold.1(v9, v10);

    }
  }

  return v6;
}

+ (id)copyPath:(id)a3 toDestinationDir:(id)a4 zipped:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11 = v8;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend(v7, "getResourceValue:forKey:error:", &v51, *MEMORY[0x1E0C999D0], 0);
  v13 = v51;
  v14 = v11;
  if (objc_msgSend(v13, "BOOLValue"))
  {
    v14 = v11;
    if (!v5)
    {
      v14 = v10;

    }
  }
  if ((objc_msgSend(v14, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0
    && (objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, 0, 0) & 1) == 0)
  {
    Log_3();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[DEUtils copyPath:toDestinationDir:zipped:].cold.4();

  }
  if (!BOMCopierNew())
  {
    Log_3();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[DEUtils copyPath:toDestinationDir:zipped:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_27;
  }
  if (!v5)
  {
    v50 = v13;
    if (objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", 0))
    {
      v45 = v14;
      v46 = v12;
      v47 = v11;
      v49 = v7;
      v32 = 0;
      v33 = 1;
      do
      {
        v34 = v32;
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "URLByDeletingPathExtension");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "path");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", CFSTR("%@-%@"), v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pathExtension");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringByAppendingPathExtension:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v41, 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = (v33 + 1);
      }
      while ((objc_msgSend(v32, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0);

      v11 = v47;
      v7 = v49;
      v14 = v45;
      v12 = v46;
    }
    else
    {
      v32 = v10;
    }
    objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    v10 = objc_retainAutorelease(v32);
    objc_msgSend(v10, "fileSystemRepresentation");
    v42 = BOMCopierCopy();
    if (!v42)
    {
      v13 = v50;
      goto LABEL_30;
    }
    v43 = v42;
    Log_3();
    v24 = objc_claimAutoreleasedReturnValue();
    v13 = v50;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[DEUtils copyPath:toDestinationDir:zipped:].cold.3(v43);
LABEL_27:

    v23 = 0;
    goto LABEL_31;
  }
  objc_msgSend(v7, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingPathExtension:", CFSTR("zip"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = v17;
  objc_msgSend(v11, "URLByAppendingPathComponent:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v20 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("createPKZip"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("copyResources"));
  if (v13)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("keepParent"));
  objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v18);
  objc_msgSend(v10, "fileSystemRepresentation");
  if (!BOMCopierCopyWithOptions())
  {

LABEL_30:
    BOMCopierFree();
    v10 = v10;
    v23 = v10;
    goto LABEL_31;
  }
  v21 = v14;
  Log_3();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    +[DEUtils copyPath:toDestinationDir:zipped:].cold.2();

  v23 = 0;
  v14 = v21;
LABEL_31:

  return v23;
}

+ (id)copyPaths:(id)a3 toDestinationDir:(id)a4 withZipName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "URLByAppendingPathComponent:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);

      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  v15 = +[DEUtils copyPath:toDestinationDir:zipped:](DEUtils, "copyPath:toDestinationDir:zipped:", v9, v8, 1);
  +[DEUtils removeFile:](DEUtils, "removeFile:", v9);

  return v15;
}

+ (id)uniqueDateString
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmssSS"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)removeFile:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  NSObject *v8;
  NSObject *v9;
  id v10;

  v3 = a3;
  if (objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v10);
    v6 = v10;

    if (!v5 || v6 != 0)
    {
      Log_3();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[DEUtils removeFile:].cold.1((uint64_t)v3, v6);

      if (v6)
      {
        Log_3();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          +[DEUtils removeFile:].cold.1((uint64_t)v3, v6);

      }
    }
  }

}

+ (id)findEntriesInDirectory:(id)a3 createdAfter:(id)a4 matchingPattern:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[5];

  v36[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  objc_msgSend(v9, "array");
  v28 = v7;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByResolvingSymlinksInPath");
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0C998E8];
  v36[0] = *MEMORY[0x1E0C99A90];
  v36[1] = v14;
  v36[2] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v12;
  objc_msgSend(v13, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v32;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v32 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v21);
        v30 = 0;
        objc_msgSend(v22, "getResourceValue:forKey:error:", &v30, v14, 0);
        v23 = v30;
        if (objc_msgSend(v11, "compare:", v23) == -1)
        {
          objc_msgSend(v22, "lastPathComponent");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "numberOfMatchesInString:options:range:", v24, 0, 0, objc_msgSend(v24, "length")) == 1)
            objc_msgSend(v29, "addObject:", v22);

        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v19);
  }

  objc_msgSend(v29, "sortedArrayUsingComparator:", &__block_literal_global_81);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __63__DEUtils_findEntriesInDirectory_createdAfter_matchingPattern___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v7;
  id v8;

  v8 = 0;
  v2 = *MEMORY[0x1E0C998E8];
  v3 = a2;
  objc_msgSend(v3, "getResourceValue:forKey:error:", &v8, v2, 0);
  v7 = 0;
  v4 = v8;
  objc_msgSend(v3, "getResourceValue:forKey:error:", &v7, v2, 0);

  v5 = objc_msgSend(v4, "compare:", v7);
  return v5;
}

+ (id)processErrorResponse:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = objc_msgSend(&unk_1E4E39990, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  v5 = v3;
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        v10 = v7;
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(&unk_1E4E39990);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v21 = v7;
        objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v11, 0, &v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v21;

        objc_msgSend(v12, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          if (objc_msgSend(v13, "count"))
          {
            objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "rangeAtIndex:", 1);

            if (v16 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "rangeAtIndex:", 1);
              objc_msgSend(v3, "substringWithRange:", v18, v19);
              v5 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_13;
            }
          }
        }

      }
      v6 = objc_msgSend(&unk_1E4E39990, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v6)
        continue;
      break;
    }
    v5 = v3;
LABEL_13:

  }
  return v5;
}

+ (id)uniqueTemporaryDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  id v11;

  v2 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v4, 1, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v7)
  {
    Log_3();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[DEUtils uniqueTemporaryDirectory].cold.1(v7, v8);

    v9 = v4;
    v6 = v9;
  }

  return v6;
}

+ (void)getFileSystemItemSize:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v0, v1, "NSURLFileSizeKey error [%{public}@]", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)getFileSystemItemSize:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, v4, "given URL [%{public}@] does not exist", v5);

  OUTLINED_FUNCTION_0();
}

+ (void)getDirectorySize:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, v4, "given directory [%{public}@] does not exist or is not directory, cannot get size", v5);

  OUTLINED_FUNCTION_0();
}

void __28__DEUtils_getDirectorySize___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_4(&dword_1A4EEE000, v1, (uint64_t)v1, "Error enumrating url [%{public}@] err [%{public}@]", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)excludeFromBackup:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2_1(&dword_1A4EEE000, v2, v3, "Error excluding [%{public}@] from backup %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

+ (void)tarGzForDirectoryUrl:validatesUrl:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "+[DEUtils tarGzForDirectoryUrl:validatesUrl:]";
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_16(&dword_1A4EEE000, v0, v1, "%s %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_5();
}

+ (void)isValidDirectory:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4EEE000, a1, a3, "dir given is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

+ (void)isValidDirectory:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4EEE000, a1, a3, "failed to get NSURLIsDirectoryKey", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

+ (void)isValidDirectory:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v0, v1, "url given [%@] does not exist", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)copyAllFilesFromDir:toDir:keepSourceDir:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v0, v1, "Failed to create enumerator for [%{public}@]", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)copyAllFilesFromDir:(_QWORD *)a3 toDir:(NSObject *)a4 keepSourceDir:.cold.2(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1A4EEE000, a4, OS_LOG_TYPE_ERROR, "Failed to create directory [%{public}@]", a1, 0xCu);

}

+ (void)copyItem:toDestinationDir:zipped:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_16(&dword_1A4EEE000, v0, (uint64_t)v0, "Copied [%@] to [%@]", v1);
  OUTLINED_FUNCTION_5();
}

+ (void)copyItem:(void *)a1 toDestinationDir:(void *)a2 zipped:.cold.2(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_1A4EEE000, v4, v5, "Failed to copy item [%{public}@] to destination [%{public}@]", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)copyItem:toDestinationDir:zipped:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v0, v1, "Error: Failed to create folder [%@]", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)copyAndReturn:(void *)a1 toDir:(NSObject *)a2 withNewFileName:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, v4, "tried to copy directory [%{public}@], wrong method", v5);

  OUTLINED_FUNCTION_0();
}

+ (void)lsDir:sorted:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_4(&dword_1A4EEE000, v0, (uint64_t)v0, "failed to get contents of feedback directory [%@] error [%@]", v1);
  OUTLINED_FUNCTION_5();
}

+ (void)createDirectoryWithClassCDataProtection:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, v4, "Error setting file protection key: %@", v5);

  OUTLINED_FUNCTION_0();
}

+ (void)createDirectoryWithClassCDataProtection:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A4EEE000, v2, v3, "Setting Class C for [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

+ (void)copyPath:(uint64_t)a3 toDestinationDir:(uint64_t)a4 zipped:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A4EEE000, a1, a3, "Couldn't create BomCopier for copying files to local folder.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

+ (void)copyPath:toDestinationDir:zipped:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v0, v1, "Error copying and zipping: %@", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)copyPath:(uint64_t)a1 toDestinationDir:zipped:.cold.3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_2_1(&dword_1A4EEE000, v2, v3, "Error copying (%@) %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

+ (void)copyPath:toDestinationDir:zipped:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, v0, v1, "Error: Create folder failed %@", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)removeFile:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2_1(&dword_1A4EEE000, v3, v4, "Error removing file: %@, %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_3();
}

+ (void)uniqueTemporaryDirectory
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, v4, "Failed to initialize destination directory for SPX with error [%{public}@]", v5);

  OUTLINED_FUNCTION_0();
}

@end
