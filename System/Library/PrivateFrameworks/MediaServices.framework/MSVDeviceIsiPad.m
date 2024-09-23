@implementation MSVDeviceIsiPad

uint64_t __MSVDeviceIsiPad_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  MSVDeviceIsiPad___deviceIsiPad = (_DWORD)result == 3;
  return result;
}

@end
