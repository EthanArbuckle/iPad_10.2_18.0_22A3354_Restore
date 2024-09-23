@implementation CADeviceIsPhone

uint64_t __CADeviceIsPhone_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  CADeviceIsPhone::phone = (_DWORD)result == 1;
  return result;
}

@end
