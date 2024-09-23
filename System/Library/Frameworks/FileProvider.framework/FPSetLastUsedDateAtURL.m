@implementation FPSetLastUsedDateAtURL

uint64_t __FPSetLastUsedDateAtURL_block_invoke(uint64_t a1, int a2)
{
  void *v4;
  BOOL v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v10;

  v4 = *(void **)(a1 + 32);
  v10 = 0;
  v5 = FPFileMetadataSetLastUsedDate(a2, v4, &v10);
  v6 = v10;
  if (v5)
  {
    v7 = 0;
  }
  else
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __FPSetLastUsedDateAtURL_block_invoke_cold_1(a1, (uint64_t)v6, v8);

    v7 = 0xFFFFFFFFLL;
  }

  return v7;
}

void __FPSetLastUsedDateAtURL_block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_ERROR, "[ERROR] Failed to set last used date on %@: %@", (uint8_t *)&v6, 0x16u);

}

@end
