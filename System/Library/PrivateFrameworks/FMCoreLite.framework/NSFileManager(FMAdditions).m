@implementation NSFileManager(FMAdditions)

+ (BOOL)fm_setDataProtectionClass:()FMAdditions forFileURL:error:
{
  const char *v7;
  int v8;
  int v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v7 = (const char *)objc_msgSend(objc_retainAutorelease(a4), "fileSystemRepresentation");
  v8 = open(v7, 289);
  if (v8 < 0)
  {
    LogCategory_Unspecified();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[NSFileManager(FMAdditions) fm_setDataProtectionClass:forFileURL:error:].cold.1((uint64_t)v7, v18);

    return 0;
  }
  else
  {
    v9 = v8;
    v10 = fcntl(v8, 64, a3);
    v11 = (_DWORD)v10 == 0;
    if ((_DWORD)v10)
    {
      v12 = v10;
      LogCategory_Unspecified();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[NSFileManager(FMAdditions) fm_setDataProtectionClass:forFileURL:error:].cold.2((uint64_t)v7, v12, v13);

      if (a5)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v15 = (int)v12;
        v20[0] = *MEMORY[0x1E0CB2D68];
        v20[1] = CFSTR("ManipulateFileDescriptorStatus");
        v21[0] = CFSTR("Changing the data protection failed");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.fmcore.nsfilemanager.additions.error"), v15, v17);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    close(v9);
  }
  return v11;
}

+ (void)fm_setDataProtectionClass:()FMAdditions forFileURL:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_1AEA5C000, a2, OS_LOG_TYPE_ERROR, "Could not find the file %s", (uint8_t *)&v2, 0xCu);
}

+ (void)fm_setDataProtectionClass:()FMAdditions forFileURL:error:.cold.2(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1AEA5C000, log, OS_LOG_TYPE_ERROR, "Changing the data protection on %s resulted in %i", (uint8_t *)&v3, 0x12u);
}

@end
