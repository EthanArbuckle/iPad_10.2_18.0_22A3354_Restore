@implementation CGImageMetadataGetTypeID

uint64_t __CGImageMetadataGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CGImageMetadataGetTypeID::id = result;
  return result;
}

@end
