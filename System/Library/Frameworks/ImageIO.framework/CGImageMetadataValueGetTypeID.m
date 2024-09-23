@implementation CGImageMetadataValueGetTypeID

uint64_t __CGImageMetadataValueGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CGImageMetadataValueGetTypeID::id = result;
  return result;
}

@end
