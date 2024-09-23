@implementation CRDeviceSupportsAutomaticDNDMotionTrigger

uint64_t __CRDeviceSupportsAutomaticDNDMotionTrigger_block_invoke()
{
  uint64_t result;
  char v1;

  result = MGIsDeviceOfType();
  if ((result & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    result = MGIsDeviceOfType();
    v1 = result ^ 1;
  }
  CRDeviceSupportsAutomaticDNDMotionTrigger_supportsMotionTrigger = v1;
  return result;
}

@end
