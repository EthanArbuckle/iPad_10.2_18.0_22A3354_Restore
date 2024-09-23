@implementation C3DConstraintLookAtGetTypeID

void __C3DConstraintLookAtGetTypeID_block_invoke()
{
  void *v0;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DConstraintLookAtGetTypeID_typeID = (uint64_t)v0;
  if (C3DConstraintGetTypeID_onceToken != -1)
    dispatch_once(&C3DConstraintGetTypeID_onceToken, &__block_literal_global_6_0);
  C3DModelPathResolverRegisterClassBegin(v0, (const void *)C3DConstraintGetTypeID_typeID);
  C3DModelPathResolverRegisterProperty(CFSTR("targetOffset"), 0xB0u, 10, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("worldUp"), 0xA0u, 10, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("localFront"), 0xC0u, 9, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
}

@end
