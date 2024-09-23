@implementation CGColorConversionInfoGetTypeID

uint64_t __CGColorConversionInfoGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kCGColorConverterRuntimeID = result;
  return result;
}

@end
