@implementation C3DIndexStoreGetTypeID

uint64_t __C3DIndexStoreGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DIndexStoreGetTypeID_typeID = result;
  return result;
}

@end
