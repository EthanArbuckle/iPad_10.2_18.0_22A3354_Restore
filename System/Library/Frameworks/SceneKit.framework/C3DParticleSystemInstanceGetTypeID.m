@implementation C3DParticleSystemInstanceGetTypeID

uint64_t __C3DParticleSystemInstanceGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DParticleSystemInstanceGetTypeID_typeID = result;
  return result;
}

@end
