@implementation NTPBBloomFilterInfo

uint64_t __56__NTPBBloomFilterInfo_FCAdditions__fc_maybeContainsURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCWebURLResolutionLog;
  if (os_log_type_enabled((os_log_t)FCWebURLResolutionLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138477827;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "no domain for %{private}@", (uint8_t *)&v5, 0xCu);
  }
  return 0;
}

@end
