@implementation MSVDeviceIsiPod

uint64_t __MSVDeviceIsiPod_block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  MSVDeviceIsiPod___deviceIsPod = (_DWORD)result == 2;
  return result;
}

@end
