@implementation CKDataVault

+ (BOOL)createDataVaultDirectoryAtPath:(id)a3 withStorageClass:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  const char *v14;
  int v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;
  int v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  int v28;
  int *v29;
  char *v30;
  NSObject *v31;
  int v32;
  int *v33;
  char *v34;
  NSObject *v35;
  int v36;
  int *v37;
  char *v38;
  int v39;
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, a5);

  if (a5)
  {
    v10 = *a5;
    if (*a5)
    {
      v11 = (void *)CKLogContextFramework;
      if (os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_ERROR))
      {
        v25 = v11;
        objc_msgSend(v10, "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 136315650;
        v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
        v41 = 2112;
        v42 = v7;
        v43 = 2112;
        v44[0] = v26;
        _os_log_error_impl(&dword_1A48B3000, v25, OS_LOG_TYPE_ERROR, "%s could not create directory at path %@: %@", (uint8_t *)&v39, 0x20u);

      }
      goto LABEL_5;
    }
  }
  v13 = objc_retainAutorelease(v7);
  v14 = (const char *)objc_msgSend(v13, "UTF8String");
  objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
  v15 = rootless_check_datavault_flag();
  if (v15 == 1)
  {
    if (!chmod(v14, 0x1C0u))
    {
      v21 = rootless_convert_to_datavault();
      v22 = CKLogContextFramework;
      if (!v21)
      {
        if (!os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_DEBUG))
          goto LABEL_9;
        v39 = 136315138;
        v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
        v23 = "%s successfully converted directory to data vault";
        v24 = v22;
        goto LABEL_26;
      }
      if (os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_ERROR))
      {
        v35 = v22;
        v36 = *__error();
        v37 = __error();
        v38 = strerror(*v37);
        v39 = 136315906;
        v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
        v41 = 2112;
        v42 = v13;
        v43 = 1024;
        LODWORD(v44[0]) = v36;
        WORD2(v44[0]) = 2080;
        *(_QWORD *)((char *)v44 + 6) = v38;
        _os_log_error_impl(&dword_1A48B3000, v35, OS_LOG_TYPE_ERROR, "%s Failed to convert to data vault: %@: [%i] %s", (uint8_t *)&v39, 0x26u);

        if (!a5)
          goto LABEL_5;
      }
      else if (!a5)
      {
        goto LABEL_5;
      }
      v18 = CFSTR("Failed to convert to data vault");
      goto LABEL_17;
    }
    v17 = (void *)CKLogContextFramework;
    if (os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_ERROR))
    {
      v31 = v17;
      v32 = *__error();
      v33 = __error();
      v34 = strerror(*v33);
      v39 = 136315906;
      v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
      v41 = 2112;
      v42 = v13;
      v43 = 1024;
      LODWORD(v44[0]) = v32;
      WORD2(v44[0]) = 2080;
      *(_QWORD *)((char *)v44 + 6) = v34;
      _os_log_error_impl(&dword_1A48B3000, v31, OS_LOG_TYPE_ERROR, "%s Failed to set mode on directory %@: [%i] %s", (uint8_t *)&v39, 0x26u);

      if (!a5)
        goto LABEL_5;
    }
    else if (!a5)
    {
      goto LABEL_5;
    }
    v18 = CFSTR("failed to set mode on directory");
LABEL_17:
    +[CKDataVault errorWithDescription:]((uint64_t)CKDataVault, v18);
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (!v15)
  {
    v16 = CKLogContextFramework;
    if (!os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:
      v12 = 1;
      goto LABEL_18;
    }
    v39 = 136315138;
    v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
    v23 = "%s data vault already exists";
    v24 = v16;
LABEL_26:
    _os_log_debug_impl(&dword_1A48B3000, v24, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&v39, 0xCu);
    goto LABEL_9;
  }
  v19 = (void *)CKLogContextFramework;
  if (os_log_type_enabled((os_log_t)CKLogContextFramework, OS_LOG_TYPE_ERROR))
  {
    v27 = v19;
    v28 = *__error();
    v29 = __error();
    v30 = strerror(*v29);
    v39 = 136315906;
    v40 = "+[CKDataVault createDataVaultDirectoryAtPath:withStorageClass:error:]";
    v41 = 2112;
    v42 = v13;
    v43 = 1024;
    LODWORD(v44[0]) = v28;
    WORD2(v44[0]) = 2080;
    *(_QWORD *)((char *)v44 + 6) = v30;
    _os_log_error_impl(&dword_1A48B3000, v27, OS_LOG_TYPE_ERROR, "%s data vault status check failed at path %@: [%i] %s", (uint8_t *)&v39, 0x26u);

    if (a5)
      goto LABEL_16;
  }
  else if (a5)
  {
LABEL_16:
    v18 = CFSTR("data vault status check failed");
    goto LABEL_17;
  }
LABEL_5:
  v12 = 0;
LABEL_18:

  return v12;
}

+ (id)errorWithDescription:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v12[0] = v2;
  v11[0] = CFSTR("description");
  v11[1] = CFSTR("errno");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *__error());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("strerror");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = __error();
  objc_msgSend(v5, "stringWithCString:encoding:", strerror(*v6), 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("com.apple.internal.ck"), 102, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
