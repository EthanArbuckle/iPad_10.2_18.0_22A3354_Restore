@implementation FigPlayerAirPlayCreateWithOptions

uint64_t __FigPlayerAirPlayCreateWithOptions_block_invoke()
{
  uint64_t result;

  gIsiOSDeviceWithMedusaSupport = MGGetBoolAnswer();
  result = notify_register_check("com.apple.springboard.lockstate", &gFigPlayerAirPlayDeviceLockedStateNotifyToken);
  if (!(_DWORD)result)
    gFigPlayerAirPlayDeviceLockedStateNotifyTokenIsValid = 1;
  return result;
}

void __FigPlayerAirPlayCreateWithOptions_block_invoke_2(uint64_t a1)
{
  playerairplay_checkIfAirPlayVideoSessionNeedsToStop(*(const void **)(a1 + 32));
}

@end
