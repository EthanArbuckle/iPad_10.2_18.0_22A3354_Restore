@implementation C3DTextureProxyGetTypeID

uint64_t __C3DTextureProxyGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DTextureProxyGetTypeID_typeID = result;
  return result;
}

@end
