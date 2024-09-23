@implementation C3DMeshElementGetTypeID

double __C3DMeshElementGetTypeID_block_invoke()
{
  double result;

  C3DMeshElementGetTypeID_typeID = _CFRuntimeRegisterClass();
  result = *(double *)&kC3DC3DMeshElementContextClassSerializable;
  unk_1F03C0CA8 = kC3DC3DMeshElementContextClassSerializable;
  unk_1F03C0CB8 = *(_OWORD *)&off_1EA59CCF0;
  qword_1F03C0C60 = (uint64_t)_C3DMeshElementCopyInstanceVariables;
  return result;
}

@end
