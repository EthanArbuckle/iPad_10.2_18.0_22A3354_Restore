@implementation C3DLibraryGetTypeID

double __C3DLibraryGetTypeID_block_invoke()
{
  double result;

  C3DLibraryGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DLibraryContextClassSerializable;
  unk_1F03BF518 = kC3DC3DLibraryContextClassSerializable;
  unk_1F03BF528 = *(_OWORD *)&off_1EA59CC38;
  return result;
}

@end
