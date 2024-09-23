@implementation CGImageMetadataPropertyGetTypeID

uint64_t __CGImageMetadataPropertyGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  CGImageMetadataPropertyGetTypeID::id = result;
  return result;
}

@end
