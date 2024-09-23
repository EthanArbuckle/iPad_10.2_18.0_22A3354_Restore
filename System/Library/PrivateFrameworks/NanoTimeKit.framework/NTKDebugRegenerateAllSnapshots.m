@implementation NTKDebugRegenerateAllSnapshots

uint64_t __NTKDebugRegenerateAllSnapshots_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("RegenerateAllSnapshots"), CFSTR("com.apple.NanoTimeKit.face"), 0);
  NTKDebugRegenerateAllSnapshots___flag = (_DWORD)result != 0;
  return result;
}

@end
