@implementation AppleIDAuthSupportGSGetID

uint64_t __AppleIDAuthSupportGSGetID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  GSid = result;
  return result;
}

@end
