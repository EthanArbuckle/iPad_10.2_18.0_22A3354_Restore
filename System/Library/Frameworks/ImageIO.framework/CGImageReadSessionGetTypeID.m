@implementation CGImageReadSessionGetTypeID

uint64_t __CGImageReadSessionGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CGImageReadSessionGetTypeID::id = result;
  return result;
}

@end
