@implementation SystemWideServerPortName

uint64_t ___SystemWideServerPortName_block_invoke()
{
  uint64_t result;
  const char *v1;

  result = AXDeviceIsAudioAccessory();
  v1 = "com.apple.iphone.axserver-systemwide";
  if ((_DWORD)result)
    v1 = "com.apple.homepod.axserver-systemwide";
  _SystemWideServerPortName___portName = (uint64_t)v1;
  return result;
}

@end
