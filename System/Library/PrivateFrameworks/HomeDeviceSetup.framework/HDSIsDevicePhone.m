@implementation HDSIsDevicePhone

uint64_t __HDSIsDevicePhone_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  HDSIsDevicePhone_isPhone = (_DWORD)result == 1;
  return result;
}

@end
