@implementation C3DTextureGetTypeID

uint64_t __C3DTextureGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DTextureGetTypeID_typeID = result;
  return result;
}

@end
