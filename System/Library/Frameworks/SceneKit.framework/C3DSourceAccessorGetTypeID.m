@implementation C3DSourceAccessorGetTypeID

double __C3DSourceAccessorGetTypeID_block_invoke()
{
  double result;

  C3DSourceAccessorGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DSourceAccessorContextClassSerializable;
  unk_1F03C1788 = kC3DC3DSourceAccessorContextClassSerializable;
  unk_1F03C1798 = *(_OWORD *)&off_1EA59D000;
  qword_1F03C1740 = (uint64_t)_C3DSourceAccessorCopyInstanceVariables;
  return result;
}

@end
