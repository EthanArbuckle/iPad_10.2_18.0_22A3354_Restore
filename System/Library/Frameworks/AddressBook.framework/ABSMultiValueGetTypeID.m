@implementation ABSMultiValueGetTypeID

uint64_t __ABSMultiValueGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kABCMultiValueTypeID = result;
  return result;
}

@end
