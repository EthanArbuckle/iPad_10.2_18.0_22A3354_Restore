@implementation MSTempURL

void __21___MSTempURL_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v4 = objc_msgSend(v2, "removeItemAtPath:error:", v3, &v7);
  v5 = v7;

  if ((v4 & 1) == 0)
  {
    ms_defaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1DB1A9000, v6, OS_LOG_TYPE_DEFAULT, "Cleanup: Failed to remove temp file with error: %@", buf, 0xCu);
    }

  }
}

@end
