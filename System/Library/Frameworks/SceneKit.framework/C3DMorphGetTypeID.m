@implementation C3DMorphGetTypeID

double __C3DMorphGetTypeID_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = _CFRuntimeRegisterClass();
  unk_1F03C0E78 = kC3DC3DMorphContextClassSerializable;
  unk_1F03C0E88 = *(_OWORD *)&off_1EA59CD58;
  result = *(double *)&kC3DC3DMorphContextClassSceneLink;
  unk_1F03C0E48 = kC3DC3DMorphContextClassSceneLink;
  C3DMorphGetTypeID_typeID = v0;
  qword_1F03C0E30 = (uint64_t)_C3DMorphCopyInstanceVariables;
  unk_1F03C0E58 = *(_OWORD *)algn_1EA59CD30;
  qword_1F03C0E68 = 0;
  unk_1F03C0E70 = _C3DMorphSearchByID;
  qword_1F03C0EA0 = (uint64_t)_C3DMorphGenericSourceDidChange;
  return result;
}

@end
