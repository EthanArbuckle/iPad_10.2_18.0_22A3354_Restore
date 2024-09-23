@implementation NTKDebugGenerateComplicationSnapshotsOverXPCWithDaemon

uint64_t __NTKDebugGenerateComplicationSnapshotsOverXPCWithDaemon_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = NTKInternalBuild(a1, a2);
  if ((_DWORD)result)
  {
    result = CFPreferencesGetAppBooleanValue(CFSTR("GenerateComplicationSnapshotsOverXPCWithDaemon"), CFSTR("com.apple.NanoTimeKit"), 0);
    NTKDebugGenerateComplicationSnapshotsOverXPCWithDaemon___flag = (_DWORD)result != 0;
  }
  return result;
}

@end
