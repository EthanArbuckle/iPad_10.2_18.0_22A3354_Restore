@implementation C3DMorpherGetTypeID

double __C3DMorpherGetTypeID_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = _CFRuntimeRegisterClass();
  unk_1F03C0F60 = kC3DC3DMorpherContextClassSerializable;
  unk_1F03C0F70 = *(_OWORD *)&off_1EA59CDA0;
  result = *(double *)&kC3DC3DMorpherContextClassSceneLink;
  unk_1F03C0F30 = kC3DC3DMorpherContextClassSceneLink;
  C3DMorpherGetTypeID_typeID = v0;
  unk_1F03C0F40 = unk_1EA59CD78;
  qword_1F03C0F50 = 0;
  unk_1F03C0F58 = _C3DMorpherSearchByID;
  qword_1F03C0F18 = (uint64_t)_C3DMorpherCopyInstanceVariables;
  return result;
}

@end
