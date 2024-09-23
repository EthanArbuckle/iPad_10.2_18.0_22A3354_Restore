@implementation CESRUaapData

+ (id)readUaapOovsForLanguage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  AppOovDirectory(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v15;
  if (v6)
  {
    v7 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "+[CESRUaapData readUaapOovsForLanguage:]";
      v18 = 2112;
      v19 = v3;
      v20 = 2112;
      v21 = v6;
      _os_log_error_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_ERROR, "%s Failed to enumerate UaaP pron directory at %@: %@", buf, 0x20u);
    }
    v8 = 0;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40__CESRUaapData_readUaapOovsForLanguage___block_invoke;
    v12[3] = &unk_1E67346F0;
    v13 = v3;
    v14 = v9;
    v10 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (BOOL)writeUaapOovsForLanguage:(id)a3 bundleId:(id)a4 customProns:(id)a5 newOovs:(id)a6 error:(id *)a7
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  char v28;
  id v29;
  BOOL v30;
  NSObject *v31;
  id *v32;
  NSObject *v33;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = (objc_class *)MEMORY[0x1E0C99E08];
  v12 = a6;
  v13 = a5;
  v14 = a3;
  v15 = objc_alloc_init(v11);
  v16 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __76__CESRUaapData_writeUaapOovsForLanguage_bundleId_customProns_newOovs_error___block_invoke;
  v40[3] = &unk_1E6734718;
  v17 = v15;
  v41 = v17;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v40);

  v38[0] = v16;
  v38[1] = 3221225472;
  v38[2] = __76__CESRUaapData_writeUaapOovsForLanguage_bundleId_customProns_newOovs_error___block_invoke_2;
  v38[3] = &unk_1E6734740;
  v18 = v17;
  v39 = v18;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v38);

  AppOovDirectory(v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "stringByAppendingPathComponent:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("Prons"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *MEMORY[0x1E0CB2AD8];
  v49[0] = *MEMORY[0x1E0CB2AE0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v25 = objc_msgSend(v22, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v23, 1, v24, &v37);
  v26 = v37;

  if ((v25 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v26;
    v28 = objc_msgSend(v18, "writeToURL:error:", v27, &v36);
    v29 = v36;

    if ((v28 & 1) != 0)
    {
      v30 = 1;
LABEL_14:
      v26 = v29;
      goto LABEL_15;
    }
    v33 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v43 = "+[CESRUaapData writeUaapOovsForLanguage:bundleId:customProns:newOovs:error:]";
      v44 = 2112;
      v45 = v10;
      v46 = 2112;
      v47 = v29;
      _os_log_error_impl(&dword_1B3E5F000, v33, OS_LOG_TYPE_ERROR, "%s Failed to write app-specific OOVs for %@: %@", buf, 0x20u);
    }
    v32 = a7;
    if (!a7)
    {
      v30 = 0;
      goto LABEL_14;
    }
    v26 = v29;
    goto LABEL_12;
  }
  v31 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v43 = "+[CESRUaapData writeUaapOovsForLanguage:bundleId:customProns:newOovs:error:]";
    v44 = 2112;
    v45 = v10;
    v46 = 2112;
    v47 = v26;
    _os_log_error_impl(&dword_1B3E5F000, v31, OS_LOG_TYPE_ERROR, "%s Failed to create UaaP app directory for %@: %@", buf, 0x20u);
  }
  v32 = a7;
  if (a7)
  {
LABEL_12:
    v26 = objc_retainAutorelease(v26);
    v30 = 0;
    *v32 = v26;
    goto LABEL_15;
  }
  v30 = 0;
LABEL_15:

  return v30;
}

+ (BOOL)removeUaapOovsForLanguage:(id)a3 bundleId:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a4;
  AppOovDirectory(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Prons"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "removeItemAtPath:error:", v8, 0);

  return v10;
}

void __76__CESRUaapData_writeUaapOovsForLanguage_bundleId_customProns_newOovs_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "array");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v5, v4);

}

void __76__CESRUaapData_writeUaapOovsForLanguage_bundleId_customProns_newOovs_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

void __40__CESRUaapData_readUaapOovsForLanguage___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Prons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v7, "dictionaryWithContentsOfURL:error:", v8, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;

    if (v10)
    {
      v11 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v22 = "+[CESRUaapData readUaapOovsForLanguage:]_block_invoke";
        v23 = 2112;
        v24 = v4;
        v25 = 2112;
        v26 = v10;
        _os_log_error_impl(&dword_1B3E5F000, v11, OS_LOG_TYPE_ERROR, "%s Failed to load app-specific OOVs from %@: %@", buf, 0x20u);
      }
    }
    else
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __40__CESRUaapData_readUaapOovsForLanguage___block_invoke_5;
      v18 = &unk_1E67346C8;
      v19 = v12;
      v13 = v12;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v15);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v13, v15, v16, v17, v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);

    }
  }

}

void __40__CESRUaapData_readUaapOovsForLanguage___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a2;
  objc_msgSend(v5, "setWithArray:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v6);

}

@end
