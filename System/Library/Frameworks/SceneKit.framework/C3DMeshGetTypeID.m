@implementation C3DMeshGetTypeID

double __C3DMeshGetTypeID_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = _CFRuntimeRegisterClass();
  unk_1F03C0BC0 = kC3DC3DMeshContextClassSerializable;
  unk_1F03C0BD0 = *(_OWORD *)&off_1EA59CCD0;
  result = *(double *)&kC3DC3DMeshContextClassSceneLink;
  unk_1F03C0B90 = kC3DC3DMeshContextClassSceneLink;
  C3DMeshGetTypeID_typeID = v0;
  qword_1F03C0B78 = (uint64_t)_C3DMeshCopyInstanceVariables;
  unk_1F03C0BA0 = unk_1EA59CCA8;
  qword_1F03C0BB0 = 0;
  unk_1F03C0BB8 = _C3DMeshSearchByID;
  return result;
}

@end
