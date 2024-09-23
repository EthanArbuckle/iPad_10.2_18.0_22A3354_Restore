@implementation C3DMaterialGetTypeID

double __C3DMaterialGetTypeID_block_invoke()
{
  void *v0;
  const void *TypeID;
  double result;

  v0 = (void *)_CFRuntimeRegisterClass();
  C3DMaterialGetTypeID_typeID = (uint64_t)v0;
  TypeID = (const void *)C3DEntityGetTypeID();
  C3DModelPathResolverRegisterClassBegin(v0, TypeID);
  C3DModelPathResolverRegisterProperty(CFSTR("doubleSided"), 0x64u, 3, 0, 0, 0);
  C3DModelPathResolverRegisterProperty(CFSTR("cullMode"), 0x5Au, 4, 0, 0, 0);
  C3DModelPathResolverRegisterClassEnd();
  result = *(double *)&kC3DC3DMaterialContextClassSerializable;
  unk_1F03C0AD8 = kC3DC3DMaterialContextClassSerializable;
  unk_1F03C0AE8 = *(_OWORD *)&off_1EA59CC88;
  qword_1F03C0A90 = (uint64_t)_C3DMaterialCopyInstanceVariables;
  qword_1F03C0AD0 = (uint64_t)_C3DMaterialSearchByID;
  return result;
}

@end
