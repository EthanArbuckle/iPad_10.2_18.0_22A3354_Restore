@implementation BWDeviceIsiPad

uint64_t __BWDeviceIsiPad_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)MGCopyAnswer(), "intValue");
  BWDeviceIsiPad_isiPad = (_DWORD)result == 3;
  return result;
}

@end
