@implementation MSVDeviceIsiPhone

uint64_t __MSVDeviceIsiPhone_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  MSVDeviceIsiPhone___deviceIsPhone = (_DWORD)result == 1;
  return result;
}

@end
