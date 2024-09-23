@implementation NTKDebugUpNextEnableDailyRoutineDataSource

uint64_t __NTKDebugUpNextEnableDailyRoutineDataSource_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("UpNextEnableDailyRoutineDataSource"), CFSTR("com.apple.NanoTimeKit.face"), 0);
  NTKDebugUpNextEnableDailyRoutineDataSource_disableCache = (_DWORD)result != 0;
  return result;
}

@end
