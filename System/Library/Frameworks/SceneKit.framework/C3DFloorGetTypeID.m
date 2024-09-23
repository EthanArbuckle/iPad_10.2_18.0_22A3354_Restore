@implementation C3DFloorGetTypeID

double __C3DFloorGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DFloorGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DGeometryGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterProperty(CFSTR("reflectionFalloffEnd"), 0xE0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("reflectionFalloffStart"), 0xDCu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("reflectivity"), 0xD8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("width"), 0xECu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("length"), 0xF0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  unk_1F03C02B0 = kC3DC3DFloorContextClassSerializable;
  unk_1F03C02C0 = *(_OWORD *)&off_1EA59CAF8;
  unk_1F03C0270 = kC3DC3DFloorContextClassBoundingVolumes;
  unk_1F03C0280 = kC3DC3DFloorContextClassSceneLink;
  qword_1F03C0268 = (uint64_t)_C3DFloorCopyInstanceVariables;
  unk_1F03C0290 = *(_OWORD *)algn_1EA59CAD0;
  qword_1F03C02A0 = 0;
  unk_1F03C02A8 = _C3DFloorSearchByID;
  result = *(double *)&kC3DC3DFloorContextClassAnimatable;
  xmmword_1F03C0258 = kC3DC3DFloorContextClassAnimatable;
  return result;
}

@end
