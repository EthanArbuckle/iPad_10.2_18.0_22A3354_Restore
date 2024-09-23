@implementation C3DModelValueStorageGetTypeID

uint64_t __C3DModelValueStorageGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DModelValueStorageGetTypeID_typeID = result;
  return result;
}

@end
