@implementation ColorSyncTRCGetTypeID

uint64_t __ColorSyncTRCGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  ColorSyncTRCGetTypeID_kColorSyncTRCRuntimeID = result;
  return result;
}

@end
