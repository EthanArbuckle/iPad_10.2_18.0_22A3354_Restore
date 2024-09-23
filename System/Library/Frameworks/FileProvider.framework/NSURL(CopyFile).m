@implementation NSURL(CopyFile)

- (uint64_t)fp_getSize:()CopyFile error:
{
  int v4;
  BOOL v5;
  id v7;

  v7 = 0;
  v4 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v7, *MEMORY[0x1E0C99998], 0);
  if (a3)
  {
    if (v4)
      v5 = v7 == 0;
    else
      v5 = 1;
    if (!v5)
      *a3 = objc_msgSend(v7, "unsignedLongLongValue");
  }
  return 1;
}

- (uint64_t)fp_volumeUsesAppleDouble:()CopyFile
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v10;
  id v11;

  objc_msgSend(a3, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v4 = *MEMORY[0x1E0C99CF8];
  v10 = 0;
  objc_msgSend(v3, "getResourceValue:forKey:error:", &v11, v4, &v10);
  v5 = v11;
  v6 = v10;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NSURL(CopyFile) fp_volumeUsesAppleDouble:].cold.1((uint64_t)v3, v6, v7);

    v8 = 0;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("exfat")) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("msdos"));
  }

  return v8;
}

- (id)fp_copyToURL:()CopyFile queue:precomputedItemSize:replacePlaceholder:shouldCopyAppleDouble:completion:
{
  id v15;
  void (**v16)(id, _QWORD, void *);
  uint64_t v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  id v29;
  id v30;
  int v31;
  void *v32;
  id v33;
  int v34;
  _copyfile_state *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v42;
  unsigned int v43;
  mode_t st_mode;
  void *v45;
  int v46;
  NSObject *queue;
  _QWORD block[4];
  id v49;
  void *v50;
  id v51;
  id v52;
  void (**v53)(id, _QWORD, void *);
  uint64_t *v54;
  stat v55;
  uint64_t v56;
  _copyfile_state *v57;
  char v58;
  char v59;
  stat v60;
  stat v61;
  stat v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  int v66;
  stat v67;

  v15 = a3;
  queue = a4;
  v16 = a8;
  if (a5)
    v17 = a5;
  else
    v17 = -1;
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v67, 0, sizeof(v67));
  objc_msgSend(a1, "path");
  v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = lstat((const char *)objc_msgSend(v19, "fileSystemRepresentation"), &v67);

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v21);

LABEL_28:
    v40 = v18;
    goto LABEL_29;
  }
  v43 = a7;
  st_mode = v67.st_mode;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v46 = a6;
  if (a6)
    v22 = 268697614;
  else
    v22 = 268828686;
  v66 = v22;
  memset(&v62, 0, sizeof(v62));
  memset(&v61, 0, sizeof(v61));
  v45 = v15;
  objc_msgSend(v15, "path", a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByDeletingLastPathComponent");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if (stat((const char *)objc_msgSend(v24, "fileSystemRepresentation"), &v62))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringByDeletingLastPathComponent");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = stat((const char *)objc_msgSend(v27, "fileSystemRepresentation"), &v61);

    if (!v28 && v67.st_dev == v62.st_dev && v67.st_dev == v61.st_dev)
      *((_DWORD *)v64 + 6) |= 0x1000000u;
  }
  if ((st_mode & 0xF000) != 0x4000)
  {
    memset(&v60, 0, sizeof(v60));
    if ((v46 & 1) != 0)
      goto LABEL_27;
    goto LABEL_22;
  }
  *((_DWORD *)v64 + 6) |= 0x8000u;
  if (!v46)
  {
    memset(&v60, 0, sizeof(v60));
LABEL_22:
    objc_msgSend(v45, "path");
    v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = stat((const char *)objc_msgSend(v30, "fileSystemRepresentation"), &v60);

    if (v31)
    {
LABEL_27:
      v35 = copyfile_state_alloc();
      copyfile_state_set(v35, 6u, copyfile_status_cb);
      v36 = (void *)objc_opt_new();
      objc_msgSend(v36, "setCopyError:", 0);
      objc_msgSend(v36, "setProgress:", v18);
      v37 = (void *)objc_opt_new();
      objc_msgSend(v36, "setLastBytesCopiedByFile:", v37);

      objc_msgSend(v36, "setShouldCopyAppleDouble:", v43);
      copyfile_state_set(v35, 7u, v36);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __110__NSURL_CopyFile__fp_copyToURL_queue_precomputedItemSize_replacePlaceholder_shouldCopyAppleDouble_completion___block_invoke;
      block[3] = &unk_1E444D7F8;
      v49 = v36;
      v50 = a1;
      v15 = v45;
      v38 = v45;
      v58 = v43;
      v55 = v67;
      v51 = v38;
      v54 = &v63;
      v56 = v42;
      v59 = v46;
      v52 = v18;
      v53 = v16;
      v57 = v35;
      v39 = v36;
      dispatch_async(queue, block);

      _Block_object_dispose(&v63, 8);
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 17, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v32);
    goto LABEL_24;
  }
  objc_msgSend(v45, "path");
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  if ((rmdir((const char *)objc_msgSend(v29, "fileSystemRepresentation")) & 0x80000000) == 0)
  {

LABEL_26:
    memset(&v60, 0, sizeof(v60));
    goto LABEL_27;
  }
  v34 = *__error();

  if (v34 == 2)
    goto LABEL_26;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2](v16, 0, v32);
LABEL_24:

  v33 = v18;
  _Block_object_dispose(&v63, 8);
  v15 = v45;
LABEL_29:

  return v18;
}

- (id)fp_copyToURL:()CopyFile queue:precomputedItemSize:replacePlaceholder:completion:
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  if ((objc_msgSend(a1, "fp_volumeUsesAppleDouble:", v12) & 1) != 0)
    v15 = 0;
  else
    v15 = objc_msgSend(a1, "fp_volumeUsesAppleDouble:", a1) ^ 1;
  objc_msgSend(a1, "fp_copyToURL:queue:precomputedItemSize:replacePlaceholder:shouldCopyAppleDouble:completion:", v12, v13, a5, a6, v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)fp_copyToTempFolderWithFilename:()CopyFile queue:precomputedItemSize:completion:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;

  v8 = a4;
  v9 = a6;
  v10 = (void *)MEMORY[0x1E0CB3620];
  v11 = a3;
  objc_msgSend(v10, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_insecureTempDirectory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "stringByAppendingPathComponent:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  LOBYTE(v16) = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v29);
  v20 = v29;
  if ((v16 & 1) != 0)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __88__NSURL_CopyFile__fp_copyToTempFolderWithFilename_queue_precomputedItemSize_completion___block_invoke;
    v25[3] = &unk_1E444D820;
    v28 = v9;
    v26 = v19;
    v27 = v17;
    objc_msgSend(a1, "fp_copyToURL:queue:precomputedItemSize:replacePlaceholder:completion:", v26, v8, a5, 1, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v9 + 2))(v9, 0, 0, v20);
    v21 = 0;
  }

  return v21;
}

+ (void)_fp_createInTempDirectoryWithName:()CopyFile creationBlock:completion:
{
  uint64_t (**v7)(id, void *, id *);
  void (**v8)(id, void *, void *, _QWORD);
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  id v24;
  id v25;

  v7 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB3620];
  v10 = a3;
  objc_msgSend(v9, "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fp_insecureTempDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "stringByAppendingPathComponent:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  LOBYTE(v14) = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v25);
  v19 = v25;
  v20 = v19;
  if ((v14 & 1) != 0)
  {
    v24 = v19;
    v21 = v7[2](v7, v18, &v24);
    v22 = v24;

    if ((v21 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v16, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v18, v23, 0);

    }
    else
    {
      ((void (**)(id, void *, void *, id))v8)[2](v8, 0, 0, v22);
    }
    v20 = v22;
  }
  else
  {
    ((void (**)(id, void *, void *, id))v8)[2](v8, 0, 0, v19);
  }

}

+ (uint64_t)fp_createEmptyTempFileWithName:()CopyFile completion:
{
  return objc_msgSend(a1, "_fp_createInTempDirectoryWithName:creationBlock:completion:", a3, &__block_literal_global_32, a4);
}

+ (uint64_t)fp_createEmptyTempPackageWithName:()CopyFile completion:
{
  return objc_msgSend(a1, "_fp_createInTempDirectoryWithName:creationBlock:completion:", a3, &__block_literal_global_62, a4);
}

- (void)fp_volumeUsesAppleDouble:()CopyFile .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *__error();
  v7 = 138412802;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  v11 = 1024;
  v12 = v6;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] copyfile: statfs(%@) failed: %@ %{errno}d", (uint8_t *)&v7, 0x1Cu);

  OUTLINED_FUNCTION_11_1();
}

@end
