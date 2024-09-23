@implementation AppleIDAuthSupportTokenGetTypeID

uint64_t __AppleIDAuthSupportTokenGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  tokenid = result;
  return result;
}

@end
