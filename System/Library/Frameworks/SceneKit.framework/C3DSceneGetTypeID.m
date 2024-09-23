@implementation C3DSceneGetTypeID

double __C3DSceneGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DSceneGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DEntityGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterProperty(CFSTR("fogColor"), 0x160u, 13, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("fogDensityExponent"), 0x150u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("fogEndDistance"), 0x14Cu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("fogStartDistance"), 0x148u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("wantsScreenSpaceReflection"), 0x170u, 3, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("screenSpaceReflectionSampleCount"), 0x172u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("screenSpaceReflectionMaximumDistance"), 0x174u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("screenSpaceReflectionStride"), 0x178u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  unk_1F03C1300 = kC3DC3DSceneContextClassSerializable;
  unk_1F03C1310 = *(_OWORD *)&off_1EA59CEC8;
  result = *(double *)&kC3DC3DSceneContextClassSceneLink;
  unk_1F03C12D0 = kC3DC3DSceneContextClassSceneLink;
  unk_1F03C12E0 = unk_1EA59CEA0;
  qword_1F03C12F0 = 0;
  unk_1F03C12F8 = _C3DSceneSearchByID;
  qword_1F03C12B8 = (uint64_t)_C3DSceneCopyInstanceVariables;
  return result;
}

@end
