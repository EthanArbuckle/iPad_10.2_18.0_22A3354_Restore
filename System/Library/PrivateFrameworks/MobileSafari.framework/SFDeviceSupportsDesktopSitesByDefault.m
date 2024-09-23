@implementation SFDeviceSupportsDesktopSitesByDefault

uint64_t ___SFDeviceSupportsDesktopSitesByDefault_block_invoke()
{
  uint64_t result;
  BOOL v2;

  result = _SFDeviceIsPad();
  if ((_DWORD)result)
  {
    result = MGGetSInt32Answer();
    v2 = (_DWORD)result != 28 && (result & 0xFFFFFFFE) != 6;
    _SFDeviceSupportsDesktopSitesByDefault::supportsDesktopSites = v2;
  }
  return result;
}

@end
