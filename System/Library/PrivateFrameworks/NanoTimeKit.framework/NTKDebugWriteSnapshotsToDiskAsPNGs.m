@implementation NTKDebugWriteSnapshotsToDiskAsPNGs

uint64_t __NTKDebugWriteSnapshotsToDiskAsPNGs_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("WriteSnapshotsToDiskAsPNGs"), CFSTR("com.apple.NanoTimeKit.face"), 0);
  NTKDebugWriteSnapshotsToDiskAsPNGs___flag = (_DWORD)result != 0;
  return result;
}

@end
