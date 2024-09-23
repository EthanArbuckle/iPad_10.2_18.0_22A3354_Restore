@implementation C3DMeshSourceGetTypeID

double __C3DMeshSourceGetTypeID_block_invoke()
{
  double result;

  C3DMeshSourceGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DMeshSourceContextClassSerializable;
  unk_1F03C0D90 = kC3DC3DMeshSourceContextClassSerializable;
  unk_1F03C0DA0 = *(_OWORD *)&off_1EA59CD10;
  qword_1F03C0D48 = (uint64_t)_C3DMeshSourceCopyInstanceVariables;
  return result;
}

@end
