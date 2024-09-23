@implementation NSURL(BRAdditions_Private)

- (uint64_t)br_isIgnoredByFileProvider
{
  return objc_msgSend(a1, "br_isIgnoredByFileProviderWithError:", 0);
}

+ (BOOL)br_isURL:()BRAdditions_Private syncRootOwnedByICloudDrive:withError:
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _BOOL8 v12;
  id v14;

  v7 = a3;
  v8 = v7;
  if (a4)
  {
    *a4 = 0;
    v14 = 0;
    objc_msgSend(v7, "fp_fpfsProviderDomainID:error:", 0, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    v11 = v10;
    v12 = v10 == 0;
    if (v10)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v10);
    }
    else
    {
      *a4 = objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
    }

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 22);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_br_getAttributeValue:()BRAdditions_Private withSecondaryConnection:withError:
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__8;
  v33 = __Block_byref_object_dispose__8;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  v28 = 0;
  if (BRIsFPFSEnabled(v9, v10))
  {
    objc_msgSend(a1, "_br_itemServiceSyncProxy");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __86__NSURL_BRAdditions_Private___br_getAttributeValue_withSecondaryConnection_withError___block_invoke;
    v22[3] = &unk_1E3DA5030;
    v22[4] = &v29;
    v22[5] = &v23;
    objc_msgSend(v11, "getAttributeValues:reply:", v9, v22);
  }
  else
  {
    if (a4)
      +[BRDaemonConnection secondaryConnection](BRDaemonConnection, "secondaryConnection");
    else
      +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "newLegacySyncProxy");

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __86__NSURL_BRAdditions_Private___br_getAttributeValue_withSecondaryConnection_withError___block_invoke_2;
    v20[3] = &unk_1E3DA5058;
    v11 = v13;
    v21 = v11;
    objc_msgSend(v11, "getAttributeValues:forItemAtURL:reply:", v9, a1, v20);
    objc_msgSend(v11, "result");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v30[5];
    v30[5] = v14;

    objc_msgSend(v11, "error");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v24[5];
    v24[5] = v16;

  }
  if (a5)
    *a5 = objc_retainAutorelease((id)v24[5]);
  objc_msgSend((id)v30[5], "objectForKey:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v18;
}

- (BOOL)br_getBirthDate:()BRAdditions_Private
{
  id v4;
  int v5;
  int v6;
  void *v7;
  NSObject *v8;
  stat v10;

  memset(&v10.st_birthtimespec, 0, 64);
  objc_msgSend(a1, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = lstat((const char *)objc_msgSend(v4, "fileSystemRepresentation"), &v10);

  if (v5)
  {
    v6 = *__error();
    brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions_Private) br_getBirthDate:]", 1208);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
      -[NSURL(BRAdditions_Private) br_getBirthDate:].cold.1();

    *__error() = v6;
  }
  else if (a3)
  {
    *a3 = v10.st_birthtimespec.tv_sec;
  }
  return v5 == 0;
}

- (BOOL)br_isIgnoredByFileProviderWithError:()BRAdditions_Private
{
  ssize_t v4;
  void *v5;
  NSObject *v6;
  int *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = getxattr((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), "com.apple.fileprovider.ignore#P", 0, 0, 0, 1);
  if (v4 < 0)
  {
    v7 = __error();
    if (a3 && *v7 != 93)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[NSURL(BRAdditions_Private) br_isIgnoredByFileProviderWithError:]", 1232);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] URL has com.apple.fileprovider.ignore#P attribute%@", (uint8_t *)&v9, 0xCu);
    }

  }
  return v4 >= 0;
}

- (BOOL)br_isRootOwned
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  v5 = 0;
  v4 = xmmword_19CC7DA78;
  v3 = 0;
  return getattrlist((const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), &v4, &v3, 8uLL, 0x20u)&& HIDWORD(v3) == 0;
}

- (void)br_getBirthDate:()BRAdditions_Private .cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8_2(&dword_19CBF0000, v1, v2, "[ERROR] Failed lstat on file: %@ %{errno}d%@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_3_1();
}

@end
