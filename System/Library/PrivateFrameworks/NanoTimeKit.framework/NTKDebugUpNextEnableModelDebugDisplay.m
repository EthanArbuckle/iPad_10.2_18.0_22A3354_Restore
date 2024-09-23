@implementation NTKDebugUpNextEnableModelDebugDisplay

uint64_t __NTKDebugUpNextEnableModelDebugDisplay_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("UpNextEnableModelDebugDisplay"), CFSTR("com.apple.NanoTimeKit.face"), 0);
  NTKDebugUpNextEnableModelDebugDisplay_enableModelDebug = (_DWORD)result != 0;
  return result;
}

@end
