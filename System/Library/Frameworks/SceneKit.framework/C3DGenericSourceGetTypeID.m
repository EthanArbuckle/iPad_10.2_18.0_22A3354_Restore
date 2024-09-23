@implementation C3DGenericSourceGetTypeID

double __C3DGenericSourceGetTypeID_block_invoke()
{
  double result;

  C3DGenericSourceGetTypeID_typeID = _CFRuntimeRegisterClass();
  unk_1F03C0398 = kC3DC3DGenericSourceContextClassSerializable;
  unk_1F03C03A8 = *(_OWORD *)&off_1EA59CB28;
  qword_1F03C0390 = (uint64_t)_C3DGenericSourceSearchByID;
  result = *(double *)&kC3DC3DGenericSourceContextClassAnimatable;
  xmmword_1F03C0340 = kC3DC3DGenericSourceContextClassAnimatable;
  return result;
}

@end
