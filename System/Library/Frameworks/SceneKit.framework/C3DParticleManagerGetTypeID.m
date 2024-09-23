@implementation C3DParticleManagerGetTypeID

uint64_t __C3DParticleManagerGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DParticleManagerGetTypeID_typeID = result;
  return result;
}

@end
