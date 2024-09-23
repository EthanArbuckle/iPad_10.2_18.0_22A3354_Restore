@implementation IIOLockDownModeEnabled

Class __IIOLockDownModeEnabled_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("LockdownModeManager"));
  if (result)
  {
    result = (Class)-[objc_class shared](result, sel_shared);
    _ZZZ22IIOLockDownModeEnabledEUb_E20gLockdownModeManager = (uint64_t)result;
    if (result)
    {
      result = (Class)-[objc_class enabled](result, sel_enabled);
      IIOLockDownModeEnabled::lockDownModeEnabled = (char)result;
    }
  }
  return result;
}

@end
