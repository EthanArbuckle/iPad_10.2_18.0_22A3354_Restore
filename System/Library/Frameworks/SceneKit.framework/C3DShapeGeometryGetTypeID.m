@implementation C3DShapeGeometryGetTypeID

double __C3DShapeGeometryGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DShapeGeometryGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DGeometryGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterProperty(CFSTR("chamferRadius"), 0xE4u, 7, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("extrusionDepth"), 0xE0u, 7, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  unk_1F03C13E8 = kC3DC3DShapeGeometryContextClassSerializable;
  unk_1F03C13F8 = *(_OWORD *)&off_1EA59CF30;
  unk_1F03C13A8 = kC3DC3DShapeGeometryContextClassBoundingVolumes;
  xmmword_1F03C1390 = kC3DC3DShapeGeometryContextClassAnimatable;
  result = *(double *)&kC3DC3DShapeGeometryContextClassSceneLink;
  unk_1F03C13B8 = kC3DC3DShapeGeometryContextClassSceneLink;
  unk_1F03C13C8 = unk_1EA59CF08;
  qword_1F03C13D8 = 0;
  qword_1F03C1408 = (uint64_t)_C3DShapeGeometryCreateCopy;
  return result;
}

@end
