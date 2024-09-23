@implementation AppleIDAuthSupportRandomGetTypeID

uint64_t __AppleIDAuthSupportRandomGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  AppleIDAuthSupportRandomGetTypeID_type = result;
  return result;
}

@end
