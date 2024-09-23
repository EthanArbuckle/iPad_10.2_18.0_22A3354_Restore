@implementation C3DModelValueStorageItemGetTypeID

uint64_t __C3DModelValueStorageItemGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DModelValueStorageItemGetTypeID_typeID = result;
  return result;
}

@end
