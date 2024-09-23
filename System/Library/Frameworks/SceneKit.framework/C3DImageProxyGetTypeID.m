@implementation C3DImageProxyGetTypeID

uint64_t __C3DImageProxyGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DImageProxyGetTypeID_typeID = result;
  return result;
}

@end
