@implementation HardwareSupportsHaptics

uint64_t __HardwareSupportsHaptics_block_invoke(PlatformUtilities_iOS *a1)
{
  uint64_t result;

  result = PlatformUtilities_iOS::ProductSupportsClosedLoopHaptics(a1);
  HardwareSupportsHaptics::sHapticsSupported = result;
  return result;
}

@end
