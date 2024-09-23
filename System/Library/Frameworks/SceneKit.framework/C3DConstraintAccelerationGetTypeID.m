@implementation C3DConstraintAccelerationGetTypeID

void __C3DConstraintAccelerationGetTypeID_block_invoke()
{
  void *v0;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DConstraintAccelerationGetTypeID_typeID = (uint64_t)v0;
  if (C3DConstraintGetTypeID_onceToken != -1)
    dispatch_once(&C3DConstraintGetTypeID_onceToken, &__block_literal_global_6_0);
  C3DModelPathResolverRegisterClassBegin(v0, (const void *)C3DConstraintGetTypeID_typeID);
  C3DModelPathResolverRegisterProperty(CFSTR("maximumLinearAcceleration"), 0x8Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("maximumLinearVelocity"), 0x88u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("decelerationDistance"), 0x90u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("damping"), 0x94u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
}

@end
