@implementation ColorSyncProfileGetTypeID

uint64_t __ColorSyncProfileGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  ColorSyncProfileGetTypeID_kColorSyncProfileRuntimeID = result;
  return result;
}

@end
