@implementation ColorSyncTransformGetTypeID

uint64_t __ColorSyncTransformGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  ColorSyncTransformGetTypeID_kColorSyncTransformRuntimeID = result;
  return result;
}

@end
