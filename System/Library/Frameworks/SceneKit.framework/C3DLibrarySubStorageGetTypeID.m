@implementation C3DLibrarySubStorageGetTypeID

uint64_t __C3DLibrarySubStorageGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DLibrarySubStorageGetTypeID_typeID = result;
  return result;
}

@end
