@implementation NSFileManager(ANE)

+ (uint64_t)ane_addWriteModeIfMissing:()ANE originalMode:
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if ((a4 & 0x80) == 0
    && (v8 = objc_retainAutorelease(v6),
        chmod((const char *)objc_msgSend(v8, "fileSystemRepresentation"), a4 | 0x80) == -1))
  {
    +[_ANELog common](_ANELog, "common");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *__error();
      v14 = 138413058;
      v15 = v12;
      v16 = 2112;
      v17 = v8;
      v18 = 1024;
      v19 = a4;
      v20 = 1024;
      v21 = v13;
      _os_log_error_impl(&dword_1D3352000, v11, OS_LOG_TYPE_ERROR, "%@: fail to chmod (%@) with originalMode=0x%x errno=%{darwin:errno}d", (uint8_t *)&v14, 0x22u);

    }
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

+ (uint64_t)ane_addWriteModeForPath:()ANE
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  stat v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v21, 0, sizeof(v21));
  v7 = objc_retainAutorelease(v5);
  if (stat((const char *)objc_msgSend(v7, "fileSystemRepresentation"), &v21) == -1)
  {
    +[_ANELog common](_ANELog, "common");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[NSFileManager(ANE) ane_addWriteModeForPath:].cold.1(a2, (uint64_t)v7, v9);

    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(a1, "ane_addWriteModeIfMissing:originalMode:", v7, v21.st_mode);
  }
  v20 = v6;
  objc_msgSend(v6, "enumeratorAtPath:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "nextObject");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = *MEMORY[0x1E0CB2AA8];
    do
    {
      v14 = (void *)MEMORY[0x1D824DB90]();
      objc_msgSend(v7, "stringByAppendingPathComponent:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileAttributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(a1, "ane_addWriteModeIfMissing:originalMode:", v15, objc_msgSend(v17, "unsignedShortValue")) & v8;
      objc_autoreleasePoolPop(v14);
      objc_msgSend(v10, "nextObject");
      v18 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v18;
    }
    while (v18);
  }

  return v8;
}

+ (void)ane_addWriteModeForPath:()ANE .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *__error();
  v7 = 138412802;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  v11 = 1024;
  v12 = v6;
  _os_log_error_impl(&dword_1D3352000, a3, OS_LOG_TYPE_ERROR, "%@: fail to stat (%@) with errno=%{darwin:errno}d", (uint8_t *)&v7, 0x1Cu);

}

@end
