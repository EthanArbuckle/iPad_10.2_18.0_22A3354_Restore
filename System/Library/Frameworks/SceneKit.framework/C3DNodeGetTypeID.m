@implementation C3DNodeGetTypeID

double __C3DNodeGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DNodeGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DEntityGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterProperty(CFSTR("hidden"), 0xC8u, 3, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("opacity"), 0xCCu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  unk_1F03C1048 = kC3DC3DNodeContextClassSerializable;
  unk_1F03C1058 = *(_OWORD *)&off_1EA59CE08;
  unk_1F03C1008 = kC3DC3DNodeContextClassBoundingVolumes;
  xmmword_1F03C0FF0 = kC3DC3DNodeContextClassAnimatable;
  result = *(double *)&kC3DC3DNodeContextClassSceneLink;
  unk_1F03C1018 = kC3DC3DNodeContextClassSceneLink;
  qword_1F03C1000 = (uint64_t)_C3DNodeCopyInstanceVariables;
  unk_1F03C1028 = *(_OWORD *)off_1EA59CDE0;
  qword_1F03C1038 = 0;
  unk_1F03C1040 = _C3DNodeSearchByID;
  return result;
}

@end
