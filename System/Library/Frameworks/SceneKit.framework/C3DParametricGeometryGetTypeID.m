@implementation C3DParametricGeometryGetTypeID

double __C3DParametricGeometryGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DParametricGeometryGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DGeometryGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterProperty(CFSTR("chamferRadius"), 0xE4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("chamferSegmentCount"), 0x114u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("height"), 0xDCu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("heightSegmentCount"), 0x10Cu, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("length"), 0xE0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("lengthSegmentCount"), 0x110u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("width"), 0xD8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("widthSegmentCount"), 0x108u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  v2 = (const void *)C3DGeometryGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, v2);
  C3DModelPathResolverRegisterProperty(CFSTR("capRadius"), 0xE8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("capSegmentCount"), 0x120u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("radialSegmentCount"), 0x11Cu, 2, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  v3 = (const void *)C3DGeometryGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, v3);
  C3DModelPathResolverRegisterProperty(CFSTR("bottomRadius"), 0xF0u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("topRadius"), 0xECu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  v4 = (const void *)C3DGeometryGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, v4);
  C3DModelPathResolverRegisterProperty(CFSTR("radialSpan"), 0x104u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("radius"), 0xE8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  v5 = (const void *)C3DGeometryGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, v5);
  C3DModelPathResolverRegisterProperty(CFSTR("cornerRadius"), 0xE4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("cornerSegmentCount"), 0x114u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  v6 = (const void *)C3DGeometryGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, v6);
  C3DModelPathResolverRegisterClassEnd();
  v7 = (const void *)C3DGeometryGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, v7);
  C3DModelPathResolverRegisterProperty(CFSTR("segmentCount"), 0x118u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  v8 = (const void *)C3DGeometryGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, v8);
  C3DModelPathResolverRegisterProperty(CFSTR("pipeRadius"), 0x100u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("pipeSegmentCount"), 0x128u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("ringRadius"), 0xFCu, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("ringSegmentCount"), 0x124u, 2, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  v9 = (const void *)C3DGeometryGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, v9);
  C3DModelPathResolverRegisterProperty(CFSTR("innerRadius"), 0xF4u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("outerRadius"), 0xF8u, 1, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  unk_1F03C1130 = kC3DC3DParametricGeometryContextClassSerializable;
  unk_1F03C1140 = *(_OWORD *)&off_1EA59CE70;
  unk_1F03C10F0 = kC3DC3DParametricGeometryContextClassBoundingVolumes;
  xmmword_1F03C10D8 = kC3DC3DParametricGeometryContextClassAnimatable;
  result = *(double *)&kC3DC3DParametricGeometryContextClassSceneLink;
  unk_1F03C1100 = kC3DC3DParametricGeometryContextClassSceneLink;
  unk_1F03C1110 = unk_1EA59CE48;
  qword_1F03C1120 = 0;
  qword_1F03C1150 = (uint64_t)_C3DParametricGeometryCreateCopy;
  return result;
}

@end
