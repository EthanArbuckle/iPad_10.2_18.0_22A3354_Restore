@implementation CFNProcessIsMobileAssetDaemon

uint64_t ____CFNProcessIsMobileAssetDaemon_block_invoke()
{
  uint64_t result;

  result = _CFGetProgname();
  if (result)
  {
    result = *(_QWORD *)result;
    if (result)
    {
      result = strcmp((const char *)result, "mobileassetd");
      __CFNProcessIsMobileAssetDaemon::result = (_DWORD)result == 0;
    }
  }
  return result;
}

@end
