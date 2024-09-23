@implementation MIOModelUtils

+ (id)URLForNewlyCreatedWorkingDirectoryAppropriateForURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v5, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[MIOModelUtils URLForNewlyCreatedWorkingDirectoryAppropriateForURL:error:].cold.1();
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create a working directory URL."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mlassetio"), 2, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

+ (void)URLForNewlyCreatedWorkingDirectoryAppropriateForURL:error:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1D3AC6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create a working directory URL.", v0, 2u);
}

@end
