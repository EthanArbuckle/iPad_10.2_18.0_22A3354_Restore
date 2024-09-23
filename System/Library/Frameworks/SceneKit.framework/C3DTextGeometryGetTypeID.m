@implementation C3DTextGeometryGetTypeID

double __C3DTextGeometryGetTypeID_block_invoke()
{
  void *v0;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DTextGeometryGetTypeID_typeID = (uint64_t)v0;
  if (C3DShapeGeometryGetTypeID_onceToken != -1)
    dispatch_once(&C3DShapeGeometryGetTypeID_onceToken, &__block_literal_global_145);
  C3DModelPathResolverRegisterClassBegin(v0, (const void *)C3DShapeGeometryGetTypeID_typeID);
  C3DModelPathResolverRegisterClassEnd();
  unk_1F03C1870 = kC3DC3DTextGeometryContextClassSerializable;
  unk_1F03C1880 = *(_OWORD *)&off_1EA59D068;
  unk_1F03C1830 = kC3DC3DTextGeometryContextClassBoundingVolumes;
  xmmword_1F03C1818 = kC3DC3DTextGeometryContextClassAnimatable;
  result = *(double *)&kC3DC3DTextGeometryContextClassSceneLink;
  unk_1F03C1840 = kC3DC3DTextGeometryContextClassSceneLink;
  unk_1F03C1850 = unk_1EA59D040;
  qword_1F03C1860 = 0;
  qword_1F03C1890 = (uint64_t)_C3DTextGeometryCreateCopy;
  return result;
}

@end
