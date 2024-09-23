@implementation NETRBClientGetTypeID

uint64_t ____NETRBClientGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __netrbClientTypeID = result;
  return result;
}

@end
