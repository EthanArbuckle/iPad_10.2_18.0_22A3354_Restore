@implementation ISInvalidateCacheEntriesForBundleIdentifier

void ___ISInvalidateCacheEntriesForBundleIdentifier_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  _ISDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    ___ISInvalidateCacheEntriesForBundleIdentifier_block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void ___ISInvalidateCacheEntriesForBundleIdentifier_block_invoke_1(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v4 = a3;
  _ISDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1AA928000, v6, OS_LOG_TYPE_INFO, "Cache clear started.", v13, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    ___ISInvalidateCacheEntriesForBundleIdentifier_block_invoke_cold_1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

}

void ___ISInvalidateCacheEntriesForBundleIdentifier_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1AA928000, a2, a3, "Error clearing icon cache: %@", a5, a6, a7, a8, 2u);
}

@end
