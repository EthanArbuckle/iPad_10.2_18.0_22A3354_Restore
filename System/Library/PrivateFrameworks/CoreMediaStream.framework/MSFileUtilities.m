@implementation MSFileUtilities

+ (BOOL)hardlinkOrCopyFileFromPath:(id)a3 toPath:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  id v12;
  int v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int *v20;
  void *v21;
  void *v22;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
  v12 = objc_retainAutorelease(v9);
  v13 = link(v11, (const char *)objc_msgSend(v12, "fileSystemRepresentation"));
  if (v13 != 18)
  {
    if (!v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v24 = 138543874;
        v25 = a1;
        v26 = 2112;
        v27 = v10;
        v28 = 2112;
        v29 = v12;
        _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Hardlinked path %@ to %@.", (uint8_t *)&v24, 0x20u);
      }
      v14 = 1;
      goto LABEL_13;
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2FE0];
    v18 = v13;
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = __error();
    objc_msgSend(v19, "stringWithUTF8String:", strerror(*v20));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "MSErrorWithDomain:code:description:", v17, v18, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v24 = 138544130;
      v25 = a1;
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v12;
      v30 = 2114;
      v31 = v22;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Could not hardlink path %@ to %@. Error: %{public}@", (uint8_t *)&v24, 0x2Au);
      if (!a5)
        goto LABEL_12;
    }
    else if (!a5)
    {
LABEL_12:

      v14 = 0;
      goto LABEL_13;
    }
    *a5 = objc_retainAutorelease(v22);
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v24 = 138543874;
    v25 = a1;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v12;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@: Copying path %@ to %@.", (uint8_t *)&v24, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v15, "copyItemAtPath:toPath:error:", v10, v12, a5);

LABEL_13:
  return v14;
}

@end
