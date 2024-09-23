@implementation SCHelperExecCopyBacktrace

char *___SCHelperExecCopyBacktrace_block_invoke()
{
  char *result;

  result = getenv("ENABLE_SCHELPER_BACKTRACES");
  if (result)
    _SCHelperExecCopyBacktrace_loggingEnabled = 1;
  return result;
}

@end
