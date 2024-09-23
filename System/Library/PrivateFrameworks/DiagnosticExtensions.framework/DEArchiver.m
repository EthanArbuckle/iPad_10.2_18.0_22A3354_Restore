@implementation DEArchiver

+ (unint64_t)directorySizeOf:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  id v18;
  unint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  +[DEUtils enumeratorForAllItems:](DEUtils, "enumeratorForAllItems:");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v19 = 0;
    v6 = *(_QWORD *)v25;
    v7 = *MEMORY[0x1E0C999D0];
    v8 = *MEMORY[0x1E0C99998];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1A85AB568]();
        v22 = 0;
        v23 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v23, v7, &v22);
        v12 = v23;
        v13 = v22;
        if (v13)
          v14 = 1;
        else
          v14 = v12 == 0;
        if (v14)
        {
          v15 = v13;
        }
        else if ((objc_msgSend(v12, "BOOLValue") & 1) != 0)
        {
          v15 = 0;
        }
        else
        {
          v20 = 0;
          v21 = 0;
          objc_msgSend(v10, "getResourceValue:forKey:error:", &v21, v8, &v20);
          v16 = v21;
          v15 = v20;
          if (!v15)
            v19 += objc_msgSend(v16, "unsignedLongLongValue");
        }

        objc_autoreleasePoolPop(v11);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)archiveDirectoryAt:(id)a3
{
  return (id)objc_msgSend(a1, "archiveDirectoryAt:deleteOriginal:", a3, 1);
}

+ (id)archiveDirectoryAt:(id)a3 deleteOriginal:(BOOL)a4
{
  return (id)objc_msgSend(a1, "archiveDirectoryAt:deleteOriginal:progressHandler:", a3, a4, 0);
}

+ (id)archiveDirectoryAt:(id)a3 deleteOriginal:(BOOL)a4 progressHandler:(id)a5
{
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v27;
  DEArchive *v28;
  id v29;
  id v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint8_t v35;
  _BYTE v36[7];
  _QWORD v37[4];
  id v38;
  _BYTE *v39;
  uint64_t v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  _BYTE buf[24];
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v27 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v29 = a5;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[DEArchiver archiveDirectoryAt:deleteOriginal:progressHandler:].cold.3(v30);

  v28 = -[DEArchive initWithURL:]([DEArchive alloc], "initWithURL:", v30);
  if (v28)
  {
    +[DEUtils enumeratorForAllItems:](DEUtils, "enumeratorForAllItems:", v30);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v7)
    {
      v31 = 0;
      v8 = 0;
      v9 = 0;
      v33 = *MEMORY[0x1E0C999D0];
      v34 = *(_QWORD *)v44;
      while (1)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v44 != v34)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1A85AB568]();

          v41 = 0;
          v42 = 0;
          objc_msgSend(v11, "getResourceValue:forKey:error:", &v42, v33, &v41);
          v8 = v42;
          v9 = v41;
          if (v9 || !v8)
          {
            +[DELogging fwHandle](DELogging, "fwHandle");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v9;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v11;
              _os_log_impl(&dword_1A4EEE000, v18, OS_LOG_TYPE_INFO, "Error [%{public}@] getting NSURLIsDirectoryKey for url [%{public}@]", buf, 0x16u);
            }

          }
          else if ((objc_msgSend(v8, "BOOLValue") & 1) == 0)
          {
            +[DEUtils pathComponentsInURL:removingBaseURLComponents:keepingFirstComponent:](DEUtils, "pathComponentsInURL:removingBaseURLComponents:keepingFirstComponent:", v11, v30, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v13);
              v14 = objc_claimAutoreleasedReturnValue();
              v15 = (void *)v14;
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v52 = 0;
              if (v29)
              {
                v37[0] = MEMORY[0x1E0C809B0];
                v37[1] = 3221225472;
                v37[2] = __64__DEArchiver_archiveDirectoryAt_deleteOriginal_progressHandler___block_invoke;
                v37[3] = &unk_1E4E35230;
                v39 = buf;
                v38 = v29;
                v40 = v31;
                v16 = (void *)MEMORY[0x1A85AB6F4](v37);

                if (v15)
                  goto LABEL_15;
LABEL_22:
                +[DELogging fwHandle](DELogging, "fwHandle");
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v30, "lastPathComponent");
                  v20 = objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v47 = 138412546;
                  v48 = v11;
                  v49 = 2112;
                  v50 = v20;
                  v21 = (void *)v20;
                  _os_log_error_impl(&dword_1A4EEE000, v17, OS_LOG_TYPE_ERROR, "could not build path from %@ with root component %@", v47, 0x16u);

                }
LABEL_24:

              }
              else
              {
                v16 = 0;
                if (!v14)
                  goto LABEL_22;
LABEL_15:
                if (!-[DEArchive addFile:withPathName:progressHandler:](v28, "addFile:withPathName:progressHandler:", v11, v15, v16))
                {
                  +[DELogging fwHandle](DELogging, "fwHandle");
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                    +[DEArchiver archiveDirectoryAt:deleteOriginal:progressHandler:].cold.2(&v35, v36, v17);
                  goto LABEL_24;
                }
              }
              v19 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);

              _Block_object_dispose(buf, 8);
              v31 += v19;
            }
          }
          objc_autoreleasePoolPop(v12);
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
        if (!v7)
          goto LABEL_33;
      }
    }
    v8 = 0;
    v9 = 0;
LABEL_33:

    -[DEArchive closeArchive](v28, "closeArchive");
    -[DEArchive tarGzUrl](v28, "tarGzUrl");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v24;
    if (v27 && v24)
      +[DEUtils removeFile:](DEUtils, "removeFile:", v30);
    v22 = v25;

    v23 = v22;
  }
  else
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      +[DEArchiver archiveDirectoryAt:deleteOriginal:progressHandler:].cold.1();
    v23 = 0;
  }

  return v23;
}

uint64_t __64__DEArchiver_archiveDirectoryAt_deleteOriginal_progressHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + a1[6]);
}

+ (id)archiveFile:(id)a3
{
  return (id)objc_msgSend(a1, "archiveFile:deleteOriginal:", a3, 1);
}

+ (id)archiveFile:(id)a3 deleteOriginal:(BOOL)a4
{
  return (id)objc_msgSend(a1, "archiveFile:deleteOriginal:progressHandler:", a3, a4, 0);
}

+ (id)archiveFile:(id)a3 deleteOriginal:(BOOL)a4 progressHandler:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  NSObject *v9;
  DEArchive *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    +[DEArchiver archiveFile:deleteOriginal:progressHandler:].cold.5(v7);

  v10 = -[DEArchive initWithURL:]([DEArchive alloc], "initWithURL:", v7);
  if (v10)
  {
    v25 = 0;
    v11 = *MEMORY[0x1E0C999D0];
    v24 = 0;
    objc_msgSend(v7, "getResourceValue:forKey:error:", &v25, v11, &v24);
    v12 = v25;
    v13 = v24;
    if (v13)
    {
      +[DELogging fwHandle](DELogging, "fwHandle");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[DEArchiver archiveFile:deleteOriginal:progressHandler:].cold.4();

    }
    else if ((objc_msgSend(v12, "BOOLValue") & 1) == 0)
    {
      objc_msgSend(v7, "lastPathComponent");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        if (!-[DEArchive addFile:withPathName:progressHandler:](v10, "addFile:withPathName:progressHandler:", v7, v16, v8))
        {
          +[DELogging fwHandle](DELogging, "fwHandle");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            +[DEArchiver archiveFile:deleteOriginal:progressHandler:].cold.3(v20, v21, v22);

        }
        -[DEArchive closeArchive](v10, "closeArchive");
        -[DEArchive tarGzUrl](v10, "tarGzUrl");
        v23 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v23;
        if (v6 && v23)
          +[DEUtils removeFile:](DEUtils, "removeFile:", v7);
        goto LABEL_16;
      }
LABEL_15:
      v15 = 0;
LABEL_16:

LABEL_18:
      goto LABEL_19;
    }
    if (!v12)
    {
      v15 = 0;
      goto LABEL_18;
    }
    +[DELogging fwHandle](DELogging, "fwHandle");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[DEArchiver archiveFile:deleteOriginal:progressHandler:].cold.2(v16, v17, v18);
    goto LABEL_15;
  }
  +[DELogging fwHandle](DELogging, "fwHandle");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    +[DEArchiver archiveDirectoryAt:deleteOriginal:progressHandler:].cold.1();
  v15 = 0;
LABEL_19:

  return v15;
}

+ (void)archiveDirectoryAt:deleteOriginal:progressHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_1A4EEE000, v0, v1, "Failed to initialize archive at [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

+ (void)archiveDirectoryAt:(uint8_t *)a1 deleteOriginal:(_BYTE *)a2 progressHandler:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1A4EEE000, a3, (uint64_t)a3, "Failed to add file to archiver", a1);
}

+ (void)archiveDirectoryAt:(void *)a1 deleteOriginal:progressHandler:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A4EEE000, v2, v3, "archiveDirectoryAt [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

+ (void)archiveFile:(NSObject *)a1 deleteOriginal:(uint64_t)a2 progressHandler:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1A4EEE000, a1, a3, "Used archiveFile to archive direcctory", v3);
}

+ (void)archiveFile:(NSObject *)a1 deleteOriginal:(uint64_t)a2 progressHandler:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1A4EEE000, a1, a3, "Failed to add file to archiver", v3);
}

+ (void)archiveFile:deleteOriginal:progressHandler:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_1A4EEE000, v1, OS_LOG_TYPE_ERROR, "Error [%{public}@] getting NSURLIsDirectoryKey for url [%{public}@]", v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

+ (void)archiveFile:(void *)a1 deleteOriginal:progressHandler:.cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A4EEE000, v2, v3, "archiveFile [%{public}@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

@end
