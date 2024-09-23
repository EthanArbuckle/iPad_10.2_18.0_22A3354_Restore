@implementation ColorSyncNxMGetTypeID

uint64_t __ColorSyncNxMGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  ColorSyncNxMGetTypeID_kColorSyncNxMLUTRuntimeID = result;
  return result;
}

@end
