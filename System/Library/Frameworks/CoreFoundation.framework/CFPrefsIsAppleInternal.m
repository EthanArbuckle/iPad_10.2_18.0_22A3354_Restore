@implementation CFPrefsIsAppleInternal

uint64_t ___CFPrefsIsAppleInternal_block_invoke()
{
  uint64_t result;

  result = access("/AppleInternal", 0);
  if (!(_DWORD)result)
    _CFPrefsIsAppleInternal_internal = 1;
  return result;
}

@end
