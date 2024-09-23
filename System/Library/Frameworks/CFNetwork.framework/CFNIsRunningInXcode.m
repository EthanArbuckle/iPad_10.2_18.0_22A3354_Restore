@implementation CFNIsRunningInXcode

const char *____CFNIsRunningInXcode_block_invoke()
{
  const char *result;

  result = getenv("NSUnbufferedIO");
  if (result)
  {
    result = (const char *)strcmp(result, "YES");
    if (!(_DWORD)result)
      __CFNIsRunningInXcode::runningInXcode = 1;
  }
  return result;
}

@end
