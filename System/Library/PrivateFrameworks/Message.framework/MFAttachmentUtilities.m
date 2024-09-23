@implementation MFAttachmentUtilities

+ (id)temporaryDirectory
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/MobileMailAttachments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_temporaryDirectoryUniqueURL
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  const char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  int *v20;
  id v22;
  uint8_t buf[16];
  _BYTE v24[15];
  char __dst[1025];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "temporaryDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v22);
  v9 = v22;

  if ((v8 & 1) == 0)
  {
    MFLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      +[MFAttachmentUtilities _temporaryDirectoryUniqueURL].cold.4();
    }

  }
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("XXXXXXXXXXXXXXXX"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");
  if (strlen(v13) >= 0x401)
  {
    MFLogGeneral();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      +[MFAttachmentUtilities _temporaryDirectoryUniqueURL].cold.3(objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation"), (uint64_t)v24);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFAttachmentUtilities.m"), 94, CFSTR("Path is too long."));

  }
  strncpy(__dst, v13, 0x401uLL);
  if (mkdtemp(__dst))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", __dst, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    MFLogGeneral();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v16, "path");
      objc_claimAutoreleasedReturnValue();
      +[MFAttachmentUtilities _temporaryDirectoryUniqueURL].cold.2();
    }

    v18 = v16;
    v12 = v18;
  }
  else
  {
    MFLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = __error();
      +[MFAttachmentUtilities _temporaryDirectoryUniqueURL].cold.1(v20, buf, v19);
    }

    v18 = 0;
  }

  return v18;
}

+ (id)temporaryFileURLWithExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_temporaryDirectoryUniqueURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XXXXX.%@"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v10 = strdup((const char *)objc_msgSend(objc_retainAutorelease(v9), "fileSystemRepresentation"));
    if (mkstemps(v10, objc_msgSend(v4, "length") + 1) == -1)
    {
      objc_msgSend(v6, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v5, "removeItemAtPath:error:", v11, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "createFileAtPath:contents:attributes:", v11, 0, 0);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v11, 0);
    }

    if (v10)
      free(v10);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)writeData:(id)a3 toTemporaryFileURLWithFileName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  id v17;
  NSObject *v18;
  id v20;
  id v21[7];

  v21[6] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "_temporaryDirectoryUniqueURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v7, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v21[0] = 0;
    v11 = objc_msgSend(v6, "writeToURL:options:error:", v10, 2, v21);
    v12 = v21[0];
    if (v11)
    {
      v13 = v10;
    }
    else
    {
      MFLogGeneral();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "length");
        objc_msgSend(v12, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        +[MFAttachmentUtilities writeData:toTemporaryFileURLWithFileName:].cold.3();
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeItemAtURL:error:", v10, 0);
      v20 = v12;
      v16 = objc_msgSend(v6, "writeToURL:options:error:", v10, 2, &v20);
      v17 = v20;

      if (v16)
      {
        v13 = v10;
      }
      else
      {
        MFLogGeneral();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v17, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          +[MFAttachmentUtilities writeData:toTemporaryFileURLWithFileName:].cold.2();
        }

        v13 = 0;
      }

      v12 = v17;
    }

  }
  else
  {
    MFLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MFAttachmentUtilities writeData:toTemporaryFileURLWithFileName:].cold.1(v10);
    v13 = 0;
  }

  return v13;
}

+ (id)mimeTypeForFileName:(id)a3
{
  objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringForMimeTypeFromFileName:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)shouldCreatePlaceholderAttachmentForAttachmentWithSize:(int64_t)a3
{
  _BOOL4 v4;

  v4 = +[MFAttachmentCapabilities placeholdersAvailable](MFAttachmentCapabilities, "placeholdersAvailable");
  if (v4)
    LOBYTE(v4) = +[MFAttachmentCapabilities currentPlaceholderThreshold](MFAttachmentCapabilities, "currentPlaceholderThreshold") < a3;
  return v4;
}

+ (id)makeAttachmentPlaceholder:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v21;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D46AD0];
  objc_msgSend(v12, "completionHandlerAdapter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "placeholderAttachmentForFileName:fileSize:mimeType:contentID:completionBlock:", v9, a4, v10, v11, v14);

  objc_msgSend(v12, "future");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "then:", &__block_literal_global_26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  objc_msgSend(v16, "result:", &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v21;
  if (!v17)
  {
    MFLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[MFAttachmentUtilities makeAttachmentPlaceholder:fileSize:mimeType:contentID:].cold.1();

  }
  return v17;
}

id __79__MFAttachmentUtilities_makeAttachmentPlaceholder_fileSize_mimeType_contentID___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = a2;
  v3 = (void *)MEMORY[0x1E0D1EEC0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__MFAttachmentUtilities_makeAttachmentPlaceholder_fileSize_mimeType_contentID___block_invoke_2;
  v7[3] = &unk_1E4E8BC10;
  v8 = v2;
  v4 = v2;
  objc_msgSend(v3, "lazyFutureWithBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __79__MFAttachmentUtilities_makeAttachmentPlaceholder_fileSize_mimeType_contentID___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](MFAttachmentPlaceholder, "placeholderFromSerializedRepresentation:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (a2 && !v3)
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = CFSTR("Invalid placeholder");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, v6);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)securityScopeForFileURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  _QWORD v15[4];
  id v16;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D46AD0];
  objc_msgSend(v4, "completionHandlerAdapter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "securityScopeForPlaceholderURL:completionBlock:", v3, v6);

  objc_msgSend(v4, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__MFAttachmentUtilities_securityScopeForFileURL___block_invoke;
  v15[3] = &unk_1E4E8AB98;
  v8 = v3;
  v16 = v8;
  objc_msgSend(v7, "map:", v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(v9, "result:", &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v14;
  if (!v10)
  {
    MFLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[MFAttachmentUtilities securityScopeForFileURL:].cold.1();

  }
  return v10;
}

id __49__MFAttachmentUtilities_securityScopeForFileURL___block_invoke(uint64_t a1, uint64_t a2)
{
  +[MFAttachmentSecurityScope securityScopedURL:withToken:](MFAttachmentSecurityScope, "securityScopedURL:withToken:", *(_QWORD *)(a1 + 32), a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)_temporaryDirectoryUniqueURL
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "#Attachments Unable to create base dir for temp files: %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

+ (void)writeData:(os_log_t)log toTemporaryFileURLWithFileName:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "#Attachments Failed to create temporary directory.", v1, 2u);
  OUTLINED_FUNCTION_9();
}

+ (void)writeData:toTemporaryFileURLWithFileName:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "#Attachments Failed 2nd attempt to create temporary file: %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

+ (void)writeData:toTemporaryFileURLWithFileName:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2();
  *(_DWORD *)v1 = 134218242;
  *(_QWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2114;
  *(_QWORD *)(v1 + 14) = v3;
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v5, v2, "#Attachments Failed to create temporary file (%{bytes}llu): %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

+ (void)makeAttachmentPlaceholder:fileSize:mimeType:contentID:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v0, (uint64_t)v0, "#Attachments Error acquiring attachment placeholder for file: %@, Error: %@", v1);
  OUTLINED_FUNCTION_5();
}

+ (void)securityScopeForFileURL:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1A4F90000, v0, (uint64_t)v0, "#Attachments Error acquiring attachment security scope for fileURL: %@, Error: %@", v1);
  OUTLINED_FUNCTION_5();
}

@end
