@implementation C3DLightGetTypeID

double __C3DLightGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DLightGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DEntityGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterProperty(CFSTR("attenuationEndDistance"), 0x58u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("attenuationFalloffExponent"), 0x5Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("attenuationStartDistance"), 0x54u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("color"), 0x40u, 13, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("intensity"), 0x60u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("orthographicScale"), 0x88u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("shadowBias"), 0xC0u, 6, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("shadowColor"), 0x70u, 13, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("shadowRadius"), 0x8Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("spotFalloffExponent"), 0xF8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("spotInnerAngle"), 0xF4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("spotOuterAngle"), 0xF0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("temperature"), 0x64u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("zFar"), 0xB8u, 6, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("zNear"), 0xB0u, 6, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("shadowCascadeDebugFactor"), 0x98u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  unk_1F03C09F0 = kC3DC3DLightContextClassSerializable;
  unk_1F03C0A00 = *(_OWORD *)&off_1EA59CC68;
  qword_1F03C09A8 = (uint64_t)_C3DLightCopyInstanceVariables;
  result = *(double *)&kC3DC3DLightContextClassAnimatable;
  xmmword_1F03C0998 = kC3DC3DLightContextClassAnimatable;
  qword_1F03C09E8 = (uint64_t)_C3DLightSearchByID;
  return result;
}

@end
