@implementation MLSetSQLiteAutoTraceEnabled

void __MLSetSQLiteAutoTraceEnabled_block_invoke(uint64_t a1)
{
  if (_MLShouldAutoTraceML_onceToken != -1)
    dispatch_once(&_MLShouldAutoTraceML_onceToken, &__block_literal_global_1032);
  if (_MLShouldAutoTraceML_shouldAutoTraceML)
  {
    if (*(_BYTE *)(a1 + 32))
      setenv("SQLITE_AUTO_TRACE", "1", 1);
    else
      unsetenv("SQLITE_AUTO_TRACE");
  }
}

@end
