@implementation C3DGeometryGetTypeID

double __C3DGeometryGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DGeometryGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DEntityGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterClassEnd();
  unk_1F03C0480 = kC3DC3DGeometryContextClassSerializable;
  unk_1F03C0490 = *(_OWORD *)&off_1EA59CB80;
  unk_1F03C0440 = kC3DC3DGeometryContextClassBoundingVolumes;
  result = *(double *)&kC3DC3DGeometryContextClassSceneLink;
  unk_1F03C0450 = kC3DC3DGeometryContextClassSceneLink;
  qword_1F03C0438 = (uint64_t)_C3DGeometryCopyInstanceVariables;
  unk_1F03C0460 = unk_1EA59CB58;
  qword_1F03C0470 = (uint64_t)_C3DGeometryDidTransferFromScene;
  unk_1F03C0478 = _C3DGeometrySearchByID;
  qword_1F03C04A0 = (uint64_t)_C3DGeometryCreateCopy;
  return result;
}

@end
