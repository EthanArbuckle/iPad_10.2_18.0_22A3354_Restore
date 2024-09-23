@implementation C3DRendererContextGetTypeID

uint64_t __C3DRendererContextGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DRendererContextGetTypeID_typeID = result;
  return result;
}

@end
