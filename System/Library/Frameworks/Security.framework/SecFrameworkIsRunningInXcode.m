@implementation SecFrameworkIsRunningInXcode

const char *__SecFrameworkIsRunningInXcode_block_invoke()
{
  const char *result;

  result = getenv("NSUnbufferedIO");
  if (result)
  {
    result = (const char *)strcmp(result, "YES");
    if (!(_DWORD)result)
      SecFrameworkIsRunningInXcode_runningInXcode = 1;
  }
  return result;
}

@end
