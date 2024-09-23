@implementation HCDeviceGetType

uint64_t __HCDeviceGetType_block_invoke()
{
  uint64_t result;
  int v1;

  result = MGGetSInt32Answer();
  v1 = result - 1;
  if ((result - 1) <= 6 && ((0x6Fu >> v1) & 1) != 0)
    HCDeviceGetType__HCDeviceType = dword_1B3CAF234[v1];
  return result;
}

@end
