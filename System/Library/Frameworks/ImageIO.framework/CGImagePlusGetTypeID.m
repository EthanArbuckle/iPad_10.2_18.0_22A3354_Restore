@implementation CGImagePlusGetTypeID

uint64_t __CGImagePlusGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CGImagePlusGetTypeID::id = result;
  return result;
}

@end
