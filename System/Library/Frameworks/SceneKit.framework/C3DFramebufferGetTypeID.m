@implementation C3DFramebufferGetTypeID

uint64_t __C3DFramebufferGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFramebufferGetTypeID_typeID = result;
  return result;
}

@end
