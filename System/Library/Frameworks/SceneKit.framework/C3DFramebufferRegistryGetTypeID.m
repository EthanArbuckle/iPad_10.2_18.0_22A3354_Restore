@implementation C3DFramebufferRegistryGetTypeID

uint64_t __C3DFramebufferRegistryGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DFramebufferRegistryGetTypeID_typeID = result;
  return result;
}

@end
