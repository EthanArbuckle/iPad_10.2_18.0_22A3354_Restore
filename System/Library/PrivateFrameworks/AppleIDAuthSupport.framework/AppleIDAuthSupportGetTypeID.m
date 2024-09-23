@implementation AppleIDAuthSupportGetTypeID

uint64_t __AppleIDAuthSupportGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  haid = result;
  return result;
}

@end
