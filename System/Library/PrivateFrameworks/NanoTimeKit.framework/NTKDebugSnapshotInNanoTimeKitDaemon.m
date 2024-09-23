@implementation NTKDebugSnapshotInNanoTimeKitDaemon

uint64_t __NTKDebugSnapshotInNanoTimeKitDaemon_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("SnapshotInNanoTimeKitDaemon"), CFSTR("com.apple.NanoTimeKit.daemon"), 0);
  NTKDebugSnapshotInNanoTimeKitDaemon___flag = (_DWORD)result != 0;
  return result;
}

@end
