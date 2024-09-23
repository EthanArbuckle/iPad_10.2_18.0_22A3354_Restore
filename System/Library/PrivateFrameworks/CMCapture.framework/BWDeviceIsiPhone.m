@implementation BWDeviceIsiPhone

uint64_t __BWDeviceIsiPhone_block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)MGCopyAnswer(), "intValue");
  BWDeviceIsiPhone_isiPhone = (_DWORD)result == 1;
  return result;
}

@end
