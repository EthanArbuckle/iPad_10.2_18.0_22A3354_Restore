@implementation NTKDebugNoSnapshotsInSwitcher

uint64_t __NTKDebugNoSnapshotsInSwitcher_block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("NoSnapshotsInSwitcher"), CFSTR("com.apple.NanoTimeKit.face"), &keyExistsAndHasValidFormat);
  NTKDebugNoSnapshotsInSwitcher___flag = (_DWORD)result != 0;
  return result;
}

@end
