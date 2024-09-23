@implementation C3DConstraintGetTypeID

void __C3DConstraintGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DConstraintGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DEntityGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterProperty(CFSTR("influenceFactor"), 0x48u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
}

@end
