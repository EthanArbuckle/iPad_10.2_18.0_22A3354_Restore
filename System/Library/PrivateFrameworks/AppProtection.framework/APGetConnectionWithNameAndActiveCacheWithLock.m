@implementation APGetConnectionWithNameAndActiveCacheWithLock

void __APGetConnectionWithNameAndActiveCacheWithLock_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  APDefaultFrameworkLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __APGetConnectionWithNameAndActiveCacheWithLock_block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

void __APGetConnectionWithNameAndActiveCacheWithLock_block_invoke_97(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  void *v10;

  APDefaultFrameworkLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __APGetConnectionWithNameAndActiveCacheWithLock_block_invoke_97_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 40));
  v9 = *(void ***)(a1 + 48);
  v10 = *v9;
  *v9 = 0;

  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 40));
}

void __APGetConnectionWithNameAndActiveCacheWithLock_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23624C000, a2, a3, "connection to %@ interrupted", a5, a6, a7, a8, 2u);
}

void __APGetConnectionWithNameAndActiveCacheWithLock_block_invoke_97_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23624C000, a2, a3, "connection to %@ invalidated", a5, a6, a7, a8, 2u);
}

@end
