@implementation NTKDebugUpNextEnableLocationDataSource

uint64_t __NTKDebugUpNextEnableLocationDataSource_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("UpNextEnableLocationDataSource"), CFSTR("com.apple.NanoTimeKit.face"), 0);
  NTKDebugUpNextEnableLocationDataSource_enableLocationDebug = (_DWORD)result != 0;
  return result;
}

@end
