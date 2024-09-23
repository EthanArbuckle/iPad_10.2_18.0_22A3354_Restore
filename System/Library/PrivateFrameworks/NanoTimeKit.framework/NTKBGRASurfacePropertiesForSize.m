@implementation NTKBGRASurfacePropertiesForSize

uint64_t __NTKBGRASurfacePropertiesForSize_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  NTKBGRASurfacePropertiesForSize_deviceSupportsExtendedColor = result;
  return result;
}

@end
