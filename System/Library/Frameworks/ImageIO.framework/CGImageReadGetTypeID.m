@implementation CGImageReadGetTypeID

uint64_t __CGImageReadGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CGImageReadGetTypeID::id = result;
  return result;
}

@end
