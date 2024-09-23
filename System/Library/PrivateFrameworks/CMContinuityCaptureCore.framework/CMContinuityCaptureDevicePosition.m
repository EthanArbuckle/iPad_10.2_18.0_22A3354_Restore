@implementation CMContinuityCaptureDevicePosition

uint64_t __CMContinuityCaptureDevicePosition_block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = GestaltGetDeviceClass();
  if ((_DWORD)result == 1)
  {
    v1 = 1;
  }
  else
  {
    if ((_DWORD)result != 3)
      return result;
    v1 = 2;
  }
  CMContinuityCaptureDevicePosition_devicePosition = v1;
  return result;
}

@end
