@implementation C3DBezierCurveGeometryGetTypeID

double __C3DBezierCurveGeometryGetTypeID_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = _CFRuntimeRegisterClass();
  xmmword_1F03BF690 = kC3DC3DBezierCurveGeometryContextClassAnimatable;
  unk_1F03BF6A8 = kC3DC3DBezierCurveGeometryContextClassBoundingVolumes;
  result = *(double *)&kC3DC3DBezierCurveGeometryContextClassSceneLink;
  unk_1F03BF6B8 = kC3DC3DBezierCurveGeometryContextClassSceneLink;
  C3DBezierCurveGeometryGetTypeID_typeID = v0;
  unk_1F03BF6C8 = unk_1EA5950A0;
  qword_1F03BF6D8 = 0;
  qword_1F03BF708 = (uint64_t)_C3DBezierCurveGeometryCreateCopy;
  return result;
}

@end
