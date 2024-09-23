@implementation MBRemoveTemporaryDirectory

void __MBRemoveTemporaryDirectory_block_invoke()
{
  void *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (sTemporaryPathDir)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    MBGetDefaultLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v0;
      _os_log_impl(&dword_1D5213000, v1, OS_LOG_TYPE_DEFAULT, "Removing temporary directory at %{public}@", buf, 0xCu);
      _MBLog(CFSTR("DEFAULT"), (uint64_t)"Removing temporary directory at %{public}@", v2, v3, v4, v5, v6, v7, (uint64_t)v0);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "removeItemAtPath:error:", v0, 0);

    if (v9)
    {
      free((void *)sTemporaryPathDir);
      sTemporaryPathDir = 0;
    }

  }
}

@end
