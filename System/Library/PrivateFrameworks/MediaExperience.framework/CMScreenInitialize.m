@implementation CMScreenInitialize

CFTypeRef __CMScreenInitialize_block_invoke()
{
  return cmscreenSetCurrentState(CFSTR("ScreenState_Deactivated"));
}

@end
