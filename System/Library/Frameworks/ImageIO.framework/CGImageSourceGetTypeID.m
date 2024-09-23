@implementation CGImageSourceGetTypeID

uint64_t __CGImageSourceGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CGImageSourceGetTypeID::id = result;
  return result;
}

@end
