@implementation C3DLODGetTypeID

double __C3DLODGetTypeID_block_invoke()
{
  double result;

  C3DLODGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DLODContextClassSceneLink;
  unk_1F03C08D8 = kC3DC3DLODContextClassSceneLink;
  unk_1F03C08E8 = *(_OWORD *)algn_1EA59CC10;
  qword_1F03C08F8 = 0;
  qword_1F03C08C0 = (uint64_t)_C3DLODCopyInstanceVariables;
  return result;
}

@end
