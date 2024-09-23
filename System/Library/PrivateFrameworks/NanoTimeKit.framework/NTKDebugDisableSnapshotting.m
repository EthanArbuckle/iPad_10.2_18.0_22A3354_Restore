@implementation NTKDebugDisableSnapshotting

void __NTKDebugDisableSnapshotting_block_invoke()
{
  int AppBooleanValue;
  id v1;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("DisableSnapshotting"), CFSTR("com.apple.NanoTimeKit.face"), 0);
  NTKDebugDisableSnapshotting___flag = AppBooleanValue != 0;
  if (AppBooleanValue)
  {
    NTKDebugDisableSnapshotting___flag = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    NTKDebugDisableSnapshotting___flag = objc_msgSend(v1, "isRunningTest");

  }
}

@end
