@implementation AXDeviceSupportsSecureDoubleClick

uint64_t __AXDeviceSupportsSecureDoubleClick_block_invoke()
{
  uint64_t result;
  char v1;

  result = MGGetBoolAnswer();
  if ((_DWORD)result)
  {
    result = MGGetBoolAnswer();
    v1 = result ^ 1;
  }
  else
  {
    v1 = 0;
  }
  AXDeviceSupportsSecureDoubleClick_supportsSecureDoubleClick = v1;
  return result;
}

@end
