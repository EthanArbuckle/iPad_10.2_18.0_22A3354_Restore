@implementation C3DConstraintReplicatorGetTypeID

void __C3DConstraintReplicatorGetTypeID_block_invoke()
{
  void *v0;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DConstraintReplicatorGetTypeID_typeID = (uint64_t)v0;
  if (C3DConstraintGetTypeID_onceToken != -1)
    dispatch_once(&C3DConstraintGetTypeID_onceToken, &__block_literal_global_6_0);
  C3DModelPathResolverRegisterClassBegin(v0, (const void *)C3DConstraintGetTypeID_typeID);
  C3DModelPathResolverRegisterProperty(CFSTR("orientationOffset"), 0xC0u, 10, 3, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("positionOffset"), 0xA0u, 9, 6, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("scaleOffset"), 0xB0u, 9, 7, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
}

@end
