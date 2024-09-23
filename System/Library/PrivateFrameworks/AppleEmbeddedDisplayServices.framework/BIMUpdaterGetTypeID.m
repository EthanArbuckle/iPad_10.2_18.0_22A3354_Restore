@implementation BIMUpdaterGetTypeID

uint64_t __BIMUpdaterGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  BIMUpdaterGetTypeID_typeID = result;
  return result;
}

@end
