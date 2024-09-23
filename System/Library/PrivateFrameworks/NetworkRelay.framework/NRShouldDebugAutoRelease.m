@implementation NRShouldDebugAutoRelease

const char *___NRShouldDebugAutoRelease_block_invoke()
{
  const char *result;

  result = getenv("NR_DEBUG_AUTORELEASE");
  if (result)
  {
    result = (const char *)strcmp(result, "YES");
    if (!(_DWORD)result)
      _NRShouldDebugAutoRelease_debugAutoRelease = 1;
  }
  return result;
}

@end
