@implementation ZL23getCompileStatsJSONPathv

char *___ZL23getCompileStatsJSONPathv_block_invoke()
{
  char *result;

  result = getenv("MTL_WRITE_COMPILE_STATS_TO_JSON_FILE");
  if (result)
  {
    _collectCompilePerformanceStats = 1;
    result = (char *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", result);
    getCompileStatsJSONPath(void)::compileStatsPath = (uint64_t)result;
  }
  return result;
}

@end
