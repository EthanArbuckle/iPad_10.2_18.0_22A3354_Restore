@implementation C3DSkinGetTypeID

double __C3DSkinGetTypeID_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = _CFRuntimeRegisterClass();
  unk_1F03C15B8 = kC3DC3DSkinContextClassSerializable;
  unk_1F03C15C8 = *(_OWORD *)&off_1EA59CF98;
  result = *(double *)&kC3DC3DSkinContextClassSceneLink;
  unk_1F03C1588 = kC3DC3DSkinContextClassSceneLink;
  C3DSkinGetTypeID_typeID = v0;
  qword_1F03C1570 = (uint64_t)_C3DSkinCopyInstanceVariables;
  unk_1F03C1598 = *(_OWORD *)algn_1EA59CF70;
  qword_1F03C15A8 = 0;
  unk_1F03C15B0 = _C3DSkinSearchByID;
  return result;
}

@end
