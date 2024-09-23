@implementation NTKDebugForceSlowDownOfSnapshotQueue

uint64_t __NTKDebugForceSlowDownOfSnapshotQueue_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = NTKInternalBuild(a1, a2);
  if ((_DWORD)result)
  {
    result = CFPreferencesGetAppBooleanValue(CFSTR("ForceSlowDownOfSnapshotQueue"), CFSTR("com.apple.NanoTimeKit"), 0);
    NTKDebugForceSlowDownOfSnapshotQueue___flag = (_DWORD)result != 0;
  }
  return result;
}

@end
