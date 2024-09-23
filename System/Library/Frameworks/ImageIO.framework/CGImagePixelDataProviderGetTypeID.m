@implementation CGImagePixelDataProviderGetTypeID

uint64_t __CGImagePixelDataProviderGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CGImagePixelDataProviderGetTypeID::id = result;
  return result;
}

@end
