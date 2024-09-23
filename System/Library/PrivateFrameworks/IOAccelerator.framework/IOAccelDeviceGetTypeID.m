@implementation IOAccelDeviceGetTypeID

uint64_t __IOAccelDeviceGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kIOAccelDeviceID = result;
  return result;
}

@end
