@implementation NTKDebugClearCachesAfterEachSnapshot

uint64_t __NTKDebugClearCachesAfterEachSnapshot_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("ClearCachesAfterEachSnapshot"), CFSTR("com.apple.NanoTimeKit.face"), 0);
  NTKDebugClearCachesAfterEachSnapshot___flag = (_DWORD)result != 0;
  return result;
}

@end
