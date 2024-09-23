@implementation MFAttachmentBundle

+ (BOOL)isFileBundleURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v7;

  v3 = a3;
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v7);

  LOBYTE(v4) = v7;
  return (char)v4;
}

+ (id)_stripBundlePath:(id)a3 entryPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = objc_msgSend(v6, "hasSuffix:", CFSTR("/"));
  objc_msgSend(v5, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringFromIndex:", v7 + (v8 ^ 1u));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)dataForFileBundleURL:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  MFFileArchiveEntry *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  __int128 v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  _BYTE v43[128];
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v30 = a3;
  +[MFAttachmentSecurityScope securityScopedURL:](MFAttachmentSecurityScope, "securityScopedURL:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "isBundle"))
  {
    if (objc_msgSend(a1, "isFileBundleURL:", v30))
    {
      +[MFFileArchiveDirectory archiveDirectory](MFFileArchiveDirectory, "archiveDirectory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *MEMORY[0x1E0C999D0];
      v44[0] = *MEMORY[0x1E0C999D0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v30, v6, 0, &__block_literal_global_94_0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (v9)
      {
        v11 = *(_QWORD *)v38;
        *(_QWORD *)&v10 = 138412290;
        v28 = v10;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v38 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v12);
            v36 = 0;
            objc_msgSend(v13, "getResourceValue:forKey:error:", &v36, v5, 0, v28);
            v14 = v36;
            if ((objc_msgSend(v14, "BOOLValue") & 1) == 0)
            {
              objc_msgSend(v31, "data");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (v15)
              {
                objc_msgSend(a1, "_stripBundlePath:entryPath:", v30, v13);
                v16 = objc_claimAutoreleasedReturnValue();
                v17 = -[MFFileArchiveEntry initWithContents:path:]([MFFileArchiveEntry alloc], "initWithContents:path:", v15, v16);
                objc_msgSend(v29, "setArchiveEntry:", v17);

              }
              else
              {
                MFLogGeneral();
                v16 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v28;
                  v42 = v13;
                  _os_log_error_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_ERROR, "#Attachments Failed to read bundle URL [%@]", buf, 0xCu);
                }
              }

            }
            ++v12;
          }
          while (v9 != v12);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
        }
        while (v9);
      }

      objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFFileArchive archive](MFFileArchive, "archive");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __43__MFAttachmentBundle_dataForFileBundleURL___block_invoke_97;
      v33[3] = &unk_1E4E8BC78;
      v20 = v18;
      v34 = v20;
      v21 = v29;
      v35 = v21;
      objc_msgSend(v19, "compressContents:completion:", v21, v33);

      objc_msgSend(v20, "future");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v22, "resultWithTimeout:error:", &v32, 300.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v32;

      if (!v23)
      {
        MFLogGeneral();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v24, "ef_publicDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[MFAttachmentBundle dataForFileBundleURL:].cold.1((uint64_t)v30, v26, (uint64_t)buf);
        }

      }
      goto LABEL_24;
    }
    if (objc_msgSend(v31, "isReadable"))
    {
      objc_msgSend(v31, "data");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        goto LABEL_25;
      MFLogGeneral();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[MFAttachmentBundle dataForFileBundleURL:].cold.2();
    }
    else
    {
      MFLogGeneral();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        +[MFAttachmentBundle dataForFileBundleURL:].cold.3();
    }
  }
  else
  {
    MFLogGeneral();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[MFAttachmentBundle dataForFileBundleURL:].cold.4();
  }
  v23 = 0;
LABEL_24:

LABEL_25:
  return v23;
}

uint64_t __43__MFAttachmentBundle_dataForFileBundleURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  MFLogGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __43__MFAttachmentBundle_dataForFileBundleURL___block_invoke_cold_1((uint64_t)v4, v7, (uint64_t)v9);
  }

  return 1;
}

uint64_t __43__MFAttachmentBundle_dataForFileBundleURL___block_invoke_97(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishWithResult:", v5);

  }
  return 1;
}

+ (void)dataForFileBundleURL:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_7_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v6, v4, "#Attachments Failed to archive bundle attachment URL: %@ due to error: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

+ (void)dataForFileBundleURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#Attachments Failed to read attachment URL: %@", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)dataForFileBundleURL:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#Attachments Failed to access attachment URL: %@", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)dataForFileBundleURL:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#Attachments URL is not a bundle: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __43__MFAttachmentBundle_dataForFileBundleURL___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_7_0(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v6, v4, "#Attachments Failed to enumerate URL [%@] due to error [%{public}@]", v5);

  OUTLINED_FUNCTION_1();
}

@end
