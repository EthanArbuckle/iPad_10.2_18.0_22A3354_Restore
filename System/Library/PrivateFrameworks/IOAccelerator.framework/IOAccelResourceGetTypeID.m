@implementation IOAccelResourceGetTypeID

uint64_t __IOAccelResourceGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kIOAccelResourceID = result;
  return result;
}

@end
