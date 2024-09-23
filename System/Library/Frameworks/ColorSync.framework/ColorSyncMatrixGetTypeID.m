@implementation ColorSyncMatrixGetTypeID

uint64_t __ColorSyncMatrixGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  ColorSyncMatrixGetTypeID_kColorSyncMatrixRuntimeID = result;
  return result;
}

@end
