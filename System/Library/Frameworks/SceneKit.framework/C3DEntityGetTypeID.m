@implementation C3DEntityGetTypeID

double __C3DEntityGetTypeID_block_invoke()
{
  double result;

  C3DEntityGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DEntityContextClassSceneLink;
  unk_1F03C1BE0 = kC3DC3DEntityContextClassSceneLink;
  unk_1F03C1BF0 = *(_OWORD *)off_1EA59CA88;
  qword_1F03C1C00 = 0;
  return result;
}

@end
