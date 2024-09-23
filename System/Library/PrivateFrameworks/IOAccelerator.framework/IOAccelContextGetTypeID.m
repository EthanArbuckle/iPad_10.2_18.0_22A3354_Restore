@implementation IOAccelContextGetTypeID

uint64_t __IOAccelContextGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kIOAccelContextID = result;
  return result;
}

@end
