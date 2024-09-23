@implementation C3DSkinnerGetTypeID

double __C3DSkinnerGetTypeID_block_invoke()
{
  uint64_t v0;
  double result;

  v0 = _CFRuntimeRegisterClass();
  unk_1F03C16A0 = kC3DC3DSkinnerContextClassSerializable;
  unk_1F03C16B0 = *(_OWORD *)&off_1EA59CFE0;
  result = *(double *)&kC3DC3DSkinnerContextClassSceneLink;
  unk_1F03C1670 = kC3DC3DSkinnerContextClassSceneLink;
  C3DSkinnerGetTypeID_typeID = v0;
  qword_1F03C1658 = (uint64_t)_C3DSkinnerCopyInstanceVariables;
  unk_1F03C1680 = *(_OWORD *)&off_1EA59CFB8;
  qword_1F03C1690 = 0;
  unk_1F03C1698 = _C3DSkinnerSearchByID;
  return result;
}

@end
