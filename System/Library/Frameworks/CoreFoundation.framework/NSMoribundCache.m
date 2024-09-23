@implementation NSMoribundCache

void __NSMoribundCache_invalidAccess_block_invoke()
{
  NSObject *v0;

  v0 = _CFFoundationRuntimeIssuesLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __NSMoribundCache_invalidAccess_block_invoke_cold_1(v0);
}

void __NSMoribundCache_invalidAccess_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182A8C000, log, OS_LOG_TYPE_FAULT, "Attempting to interact with NSCache instance that is being deallocated. Break on \"NSMoribundCache_invalidAccess\" to debug.", v1, 2u);
}

@end
