@implementation CGImageMetadataTagGetTypeID

uint64_t __CGImageMetadataTagGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CGImageMetadataTagGetTypeID::id = result;
  return result;
}

@end
