@implementation CKIsScreenLocked

void *__CKIsScreenLocked_block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("MKBGetDeviceLockState", CFSTR("MobileKeyBag"));
  CKIsScreenLocked__MKBGetDeviceLockState = result;
  return result;
}

@end
