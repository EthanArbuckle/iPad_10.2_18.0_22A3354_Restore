@implementation ColorSyncCMMGetTypeID

uint64_t __ColorSyncCMMGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  ColorSyncCMMGetTypeID_kColorSyncCMMRuntimeID = result;
  return result;
}

@end
