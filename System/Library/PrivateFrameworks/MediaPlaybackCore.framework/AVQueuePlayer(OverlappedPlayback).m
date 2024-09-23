@implementation AVQueuePlayer(OverlappedPlayback)

- (uint64_t)mpc_setSupportsAdvanceTimeForOverlappedPlayback:()OverlappedPlayback
{
  uint64_t result;

  result = ICCurrentApplicationIsSystemApp();
  if ((result & 1) == 0)
  {
    result = _os_feature_enabled_impl();
    if ((_DWORD)result)
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        return objc_msgSend(a1, "setSupportsAdvanceTimeForOverlappedPlayback:", a3);
    }
  }
  return result;
}

@end
