@implementation FigPlayerCentralCreateWithOptions

uint64_t __FigPlayerCentralCreateWithOptions_block_invoke()
{
  uint64_t result;

  result = notify_register_check("com.apple.springboard.lockstate", &gFigPlayerCentralDeviceLockedStateNotifyToken);
  if (!(_DWORD)result)
    gFigPlayerCentralDeviceLockedStateNotifyTokenIsValid = 1;
  return result;
}

@end
