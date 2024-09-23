@implementation C3DParticleModifierGetTypeID

void __C3DParticleModifierGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DParticleModifierGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DEntityGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterClassEnd();
}

@end
