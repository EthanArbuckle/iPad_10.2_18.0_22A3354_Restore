@implementation NSURL

uint64_t __43__NSURL_FCAdditions__fc_fileSystemFreeSize__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "failed to lookup file system free size with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __69__NSURL_FCAdditions__fc_volumeAvailableCapacityForOpportunisticUsage__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCDefaultLog;
  if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "failed to lookup volume available capacity for opportunistic usage with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

@end
