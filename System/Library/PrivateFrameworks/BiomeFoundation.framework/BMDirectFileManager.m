@implementation BMDirectFileManager

BMFileHandle *__57___BMDirectFileManager__openTemporaryDirectoryWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  BMFileHandle *v3;
  NSObject *v4;

  v2 = bm_openat_dprotected(4294967293, *(void **)(a1 + 32), *(_DWORD *)(a1 + 48), *(unsigned int *)(a1 + 52));
  if ((v2 & 0x80000000) != 0
    && (*__error() != 13
     || (rmdir((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation")),
         v2 = bm_openat_dprotected(4294967293, *(void **)(a1 + 32), *(_DWORD *)(a1 + 48), *(unsigned int *)(a1 + 52)),
         (v2 & 0x80000000) != 0)))
  {
    __biome_log_for_category(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57___BMDirectFileManager__openTemporaryDirectoryWithError___block_invoke_cold_1();

    v3 = 0;
  }
  else
  {
    v3 = -[BMFileHandle initWithFileDescriptor:attributes:]([BMFileHandle alloc], "initWithFileDescriptor:attributes:", v2, *(_QWORD *)(a1 + 40));
  }
  return v3;
}

void __57___BMDirectFileManager__openTemporaryDirectoryWithError___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_1(&dword_1AEB31000, v0, v1, "Failed to open Biome temporary directory with error: %{darwin.errno}d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
